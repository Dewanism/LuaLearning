local MarketplaceService = game:GetService("MarketplaceService")

local gamePassID = 1646441030

local function promptPurchase()
	local player = game.Players.LocalPlayer
	local hasPass = false

	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassID)
	end)

	if hasPass == true then
		print("Player already has the gamepass")
	else
		MarketplaceService:PromptGamePassPurchase(player, gamePassID)
	end
end

promptPurchase()
