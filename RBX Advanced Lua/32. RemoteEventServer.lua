local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePart = ReplicatedStorage:WaitForChild("DeletePart")

DeletePart.OnServerEvent:Connect(function(player, del)
	del:Destroy()
end)
