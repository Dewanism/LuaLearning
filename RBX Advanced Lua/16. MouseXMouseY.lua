local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Move:Connect(function()
print(mouse.X, mouse.Y)
end)

