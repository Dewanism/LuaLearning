local MarketplaceService = game:GetService("MarketplaceService")

local gamePassID = 1646441030

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, purchasePassID, purchaseSuccess)
	if purchaseSuccess == true and purchasePassID == gamePassID then
		print(player.Name .. " purchased the give sword game pass.")
	end
end)
