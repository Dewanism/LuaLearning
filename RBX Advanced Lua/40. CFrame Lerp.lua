local part = workspace.Part
local target = workspace.Part2

part.CFrame = part.CFrame:Lerp(target.CFrame, 0.5)
