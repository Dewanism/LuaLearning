local rainspawned = 0

while true do
	if rainspawned >= 50 then
		break	
	end
	task.wait()
	local Rain = Instance.new("Part", game.Workspace)
	Rain.Size = Vector3.new(0.5,2,0.5)
	Rain.Position = Vector3.new(0,15,0)
	Rain.Transparency = 0.5
	Rain.Anchored = false
	rainspawned = rainspawned + 1
end

print("The loop is finished")