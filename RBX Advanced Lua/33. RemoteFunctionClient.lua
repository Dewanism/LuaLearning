local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")
local del = workspace:WaitForChild("Del") -- wait until it exists on the client

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.Delete then
		print("Delete Key Pressed")
		DeletePartFunction:InvokeServer(del) -- RemoteFunction Fired here
	end
end)
