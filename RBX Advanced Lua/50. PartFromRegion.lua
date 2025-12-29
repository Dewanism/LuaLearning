local region = Region3.new(Vector3.new(5,0,5), Vector3.new(15,15,15)) -- It calculates the left and the top 


--[[
local part = Instance.new("Part")
part.Size = region.Size
part.Color = Color3.new(0.92929, 0.636088, 0.302037)
part.Anchored = true
part.CanCollide = false
part.Parent = game.Workspace
part.Transparency = 0
part.Material = Enum.Material.Neon
]]--

while true do 
	task.wait(1)
	local partsRegion = workspace:FindPartsInRegion3(region, nil, 1000)
	for i, part in pairs(partsRegion) do
		if part.Parent:FindFirstChild("Humanoid") then
			print("Player found in the Region!: ".. part.Parent.Name)
			print(part.Parent.Name)
			local char = part.Parent
			char.Humanoid:TakeDamage(char.Humanoid.MaxHealth)
		end
	end
end