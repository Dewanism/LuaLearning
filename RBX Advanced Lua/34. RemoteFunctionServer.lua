local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePart = ReplicatedStorage:WaitForChild("DeletePart")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")

DeletePartFunction.OnServerInvoke = function(player, del)
	del:Destroy() -- Destroy the part on the server
	print("Part Deleted")
	return true
end
