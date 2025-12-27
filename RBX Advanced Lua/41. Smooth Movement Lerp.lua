local part = workspace.Part
local target = workspace.Part2

for i = 0, 1, 0.01 do
	task.wait(0.1)
	part.CFrame = part.CFrame:Lerp(target.CFrame, i)
end
