local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Idle:Connect(function()
print("Mouse is idle")
end)

