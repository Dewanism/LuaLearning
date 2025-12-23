UserInputService = game:GetService("UserInputService")

local aKeyPressed = true

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		print("Player pressed a key! key: ", input.KeyCode)
	end
end)
