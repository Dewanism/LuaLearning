local AveCaesar = script.AveCaesar

task.wait(2)

local player = game.Players.LocalPlayer
local char = player.Character
local hum = char.Humanoid

local AveCaesarTrack = hum:LoadAnimation(AveCaesar)

while true do
	task.wait(1)
	AveCaesarTrack:Play()
end
