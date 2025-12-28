local DataStoreService = game:GetService("DataStoreService")
local myDataStore = DataStoreService:GetDataStore("myDataStore")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Cash = Instance.new("IntValue")
	Cash.Name = "Cash"
	Cash.Parent = leaderstats

	local Wins = Instance.new("IntValue")
	Wins.Name = "Wins"
	Wins.Parent = leaderstats

	local playerUserId = "PlayerUserId" .. player.UserId

	-- Load Call

	local data
	local success, errormessage = pcall(function()
		data = myDataStore:GetAsync(playerUserId)
	end)

	if success then
		Cash.Value = data.Cash
		Wins.Value = data.Wins
		-- Set our Data Equal to the Current Cash
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local playerUserId = "PlayerUserId" .. player.UserId

	local data = {
		Cash = player.leaderstats.Cash.Value,
		Wins = player.leaderstats.Wins.Value,
	}

	local success, errormessage = pcall(function()
		myDataStore:SetAsync(playerUserId, data)
	end)

	if success then
		print("Data sucessfully saved!")
	else
		print("There was an error!")
		warn(errormessage)
	end
end)

while true do
	