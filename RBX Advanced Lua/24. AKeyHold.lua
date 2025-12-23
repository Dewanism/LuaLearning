UserInputService = game:GetService("UserInputService")

local aKeyPressed = true

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.A then
		aKeyPressed = true
	end
	
	while aKeyPressed == true do
		wait()
		print("A key is being pressed")
	end 
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.A then 
		aKeyPressed = false
	end
end)