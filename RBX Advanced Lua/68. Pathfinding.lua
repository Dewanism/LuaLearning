local PathfindingService = game:GetService("PathfindingService")

local human = script.Parent:WaitForChild("Humanoid")
local torso = script.Parent:WaitForChild("Torso")

local path = PathfindingService:CreatePath()
path:ComputeAsync(torso.Position, game.Workspace.EndPoint.Position)

local waypoints = path:GetWaypoints()

for i, waypoint in pairs(waypoints) do
	local part = Instance.new("Part")
	part.Shape = "Ball"
	part.Material = "Neon"
	part.Size = Vector3.new(0.3, 0.3, 0.3)
	part.Position = waypoint.Position + Vector3.new(0, 2, 0)
	part.Color = Color3.new(0, 1, 0)
	part.Anchored = true
	part.CanCollide = false
	part.Parent = game.Workspace

	if waypoint.Action == Enum.PathWaypointAction.Jump then
		human:ChangeState(Enum.HumanoidStateType.Jumping)
	end
	human:MoveTo(waypoint.Position)
	human.MoveToFinished:Wait(2)
end

human:MoveTo(game.Workspace.EndPoint.Position)
