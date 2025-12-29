local RegionPart = game.Workspace.RegionPart
local pos1 = RegionPart.Position - (RegionPart.Size/2) --Calculates Bottom Left Point
local pos2 = RegionPart.Position + (RegionPart.Size/2) -- Calculates Top Right Part
local region = Region3.new(pos1, pos2)

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