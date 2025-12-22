script.Parent.ClickDetector.MouseClick::Connect(function(player)
	player.leaderstats.Points.Value = player.leaderstats.PlayerPoints.Value + 1
end)