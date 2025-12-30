local GetList = game.ReplicatedStorage:WaitForChild("GetList")

game.Players.PlayerAdded:Connect(function(player)
	local isPlayerBanned = GetList:Invoke(player)
	if isPlayerBanned == true then
		player:Kick("You're on the banlist loser!")
	end
end)
