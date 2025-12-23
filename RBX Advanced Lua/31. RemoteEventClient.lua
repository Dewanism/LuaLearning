local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local DeletePart = ReplicatedStorage:WaitForChild("DeletePart")
local del = workspace:WaitForChild("Del") -- wait until it exists on the client

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.Delete then
		print("Delete Key Pressed")
		DeletePart:FireServer(del)
	end
end)
