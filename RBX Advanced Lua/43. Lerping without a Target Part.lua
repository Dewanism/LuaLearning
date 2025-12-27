local part = workspace.Part
local goal = CFrame.new(16, 5, 12)

for i = 0, 1, 0.01 do
	task.wait(0.1)
	part.CFrame = part.CFrame:Lerp(goal, i)
end
