UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.A then
		print("Player pressed down the A Key")
	end
end)