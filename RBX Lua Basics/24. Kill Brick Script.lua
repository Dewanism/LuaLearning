local p = script.Parent

p.Touched:Connect(function(uwu)
	if uwu.Parent:FirstFindChild("Humanoid") then
	uwu.Parent.Humanoid.Health = 0
	end
)