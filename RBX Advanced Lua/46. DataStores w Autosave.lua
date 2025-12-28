local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local myDataStore = DataStoreService:GetDataStore("myDataStore")

local SAVE_INTERVAL = 300 -- 5 minutes

local function keyFor(player: Player)
	return "PlayerUserId_" .. player.UserId
end

local function loadData(player: Player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Cash = Instance.new("IntValue")
	Cash.Name = "Cash"
	Cash.Value = 0
	Cash.Parent = leaderstats

	local Wins = Instance.new("IntValue")
	Wins.Name = "Wins"
	Wins.Value = 0
	Wins.Parent = leaderstats

	local key = keyFor(player)

	local success, data = pcall(function()
		return myDataStore:GetAsync(key)
	end)

	if success and type(data) == "table" then
		-- Use defaults if fields are missing
		Cash.Value = tonumber(data.Cash) or 0
		Wins.Value = tonumber(data.Wins) or 0
	else
		-- First time player OR datastore error
		if not success then
			warn("Load failed for", player.Name)
		end
	end
end

local function saveData(player: Player)
	-- Player might be leaving mid-save; guard everything.
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		return
	end

	local cashObj = leaderstats:FindFirstChild("Cash")
	local winsObj = leaderstats:FindFirstChild("Wins")
	if not cashObj or not winsObj then
		return
	end

	local key = keyFor(player)
	local newData = {
		Cash = cashObj.Value,
		Wins = winsObj.Value,
	}

	-- UpdateAsync is safer than SetAsync for avoiding accidental overwrites
	local success, err = pcall(function()
		myDataStore:UpdateAsync(key, function(old)
			old = (type(old) == "table") and old or {}
			old.Cash = newData.Cash
			old.Wins = newData.Wins
			return old
		end)
	end)

	if not success then
		warn("Save failed for " .. player.Name .. ": " .. tostring(err))
	end
end

Players.PlayerAdded:Connect(loadData)
Players.PlayerRemoving:Connect(saveData)

-- Autosave loop (ONE loop total)
task.spawn(function()
	while true do
		task.wait(SAVE_INTERVAL)
		for _, player in ipairs(Players:GetPlayers()) do
			saveData(player)
		end
	end
end)
