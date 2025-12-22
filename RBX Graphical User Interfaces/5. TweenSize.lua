local ScreenGui = script.Parent
local Inventory = ScreenGui.Inventory
local OpenInventory = ScreenGui.OpenInventory

OpenInventory.MouseButton1Up:Connect(function()
	-- Open Inventory
	Inventory:TweenSize(
		UDim2.new(0.337, 0, 0.254, 0), -- End Size
		"Out", -- Easing Direction
		"Quad", --Easing Style
		1, -- Time in seconds
		false, --Override any other tweens
		nil -- Callback function
	)
end)
