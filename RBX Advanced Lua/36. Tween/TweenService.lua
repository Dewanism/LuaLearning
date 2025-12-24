local TweenService = game:GetService("TweenService")
local part = script.Parent

local Info = TweenInfo.new(
	60, -- Length Seconds
	Enum.EasingStyle.Bounce, --Easing Style
	Enum.EasingDirection.Out, --Easing Direction | https://create.roblox.com/docs/reference/engine/enums/EasingStyle
	0, --Times repeated
	false, --Reversed
	0 --Delay
)

local Goals = {
	Size = Vector3.new(2048, 2048, 2048),
}

local makePartBiggerTween = TweenService:Create(part, Info, Goals)

task.wait(5)
makePartBiggerTween:Play()
