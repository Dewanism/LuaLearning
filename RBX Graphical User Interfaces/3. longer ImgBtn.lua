local ScreenGui = script.Parent
local ShopFrame = screenGui.ShopFrame
local OpenShop = ScreenGui.OpenShop


OpenShop.MouseButton1Up:Connect(function(click)
	if OpenShop.Visible == false then
	OpenShop.Visible = true
	else if OpenShop.Visible == true then
	OpenShop.Visible = false
end)