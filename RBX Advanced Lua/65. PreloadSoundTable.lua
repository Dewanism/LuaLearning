local Sound = game.Workspace.Music

local ContentProvider = game:GetService("ContentProvider")

Sound:Play()

for i, v in pairs(game.ReplicatedStorage.Sounds:GetChildren()) do
	ContentProvider:PreloadAsync(Sound)
end

local audioList = {}

for name, audioID in pairs(audioList) do
	local audioInstance = Instance.new("Sound")
	audioInstance.SoundId = "rbxassetid://" .. audioID
	audioInstance.Name = name
	audioInstance.Parent = game.Workspace
	table.insert(audioList, audioInstance)
	ContentProvider:PreloadAsync(audioList)
end

Sound:Play()
