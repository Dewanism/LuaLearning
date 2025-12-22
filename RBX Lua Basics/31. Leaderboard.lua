game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local Points = Instance.new("IntValue")
	Points.Name = "Points"
	
	local XP = Instance.new("IntValue")
	XP.Name = "Points"
	
end)