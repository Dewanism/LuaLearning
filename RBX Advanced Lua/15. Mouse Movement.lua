local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Move:Connect(function()
print("Mouse moved")
end)

