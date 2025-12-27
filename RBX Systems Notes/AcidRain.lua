while true do
	task.wait()
	local Rain = Instance.new("Part", game.Workspace)
	Rain.Position = Vector3.new(0, 15, 0)
	Rain.Size = Vector3.new(0.5,2,0.5)
	Rain.Anchored = false
	Rain.CanColide = true 
	
	rain.Touched:Connect(function(acid)
	if acid.Parent:FirstFindChild("Humanoid") then
	acid.Parent.Humanoid.Health = acid.Parent.Humanoid.Health - 1
end