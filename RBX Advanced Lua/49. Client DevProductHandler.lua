local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local productID = 3493730904
local player = game.Players.LocalPlayer

task.wait(3)

MarketplaceService:PromptProductPurchase(player, productID)
