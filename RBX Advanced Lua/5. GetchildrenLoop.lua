local parts = game.Workspace.Parts:GetChildren()

for i, v in pairs(parts)do
	v:Destroy()
	task.wait(1)
end

