local part = game.Workspace.Part
local part2 = game.Workspace.Part2
local part3 = game.Workspace.Part3
local part4 = game.Workspace.Part4

local Marker = game.Workspace.Marker

for i = 0, 1, 0.01 do
	task.wait(0.1)
	part.CFrame = part.CFrame:Lerp(Marker.CFrame, i)
	part2.CFrame = part2.CFrame:Lerp(Marker.CFrame, i)
	part3.CFrame = part3.CFrame:Lerp(Marker.CFrame, i)
	part4.CFrame = part4.CFrame:Lerp(Marker.CFrame, i)
end
