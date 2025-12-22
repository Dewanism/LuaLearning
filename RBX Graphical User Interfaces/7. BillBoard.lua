local character = script.Parent
local head = character:WaitForChild("Head")

local billboard = Instance.new("BillboardGui")
billboard.Size = UDim2.new(4,0,1,0)
billboard.StudsOffset = Vector3.new(0,2.5,0)
billboard.AlwaysOnTop =true
billboard.MaxDistance =50
billboard.Parent = head

