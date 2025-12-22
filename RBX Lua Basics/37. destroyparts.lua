local hp = {game.Workspace.House.P1, game.Workspace.House.P2, game.Workspace.House.P3}

for i, v, in pairs(hp) do 
	hp.v:destroy()
end