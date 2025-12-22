local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Move:Connect(function()
    if mouse.Targetthen
        print(mouse.Target.Name)
    else
     print("Nothing (sky)")
    end
end)

