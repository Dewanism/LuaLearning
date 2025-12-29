local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sword = ReplicatedStorage:WaitForChild("ClassicSword")
local players = game:GetService("Players")

local swordProductID = 3493730904
local productID2 = 9199301390

local function processReceipt(receiptInfo)

	local player = players:GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then 
		--The player probably left the game
		--If they come back, the callback will be called again.
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	if player then 
		-- What do you want the Dev Product to give the player?
		local char = game.Workspace:FindFirstChild(player.Name)
		local swordClone = sword:Clone()
		swordClone.Name = "Sword"
		swordClone.Parent = char
		print(player.Name.. "Just bought " .. receiptInfo.ProductID)
	end
	
	return Enum.ProductPurchaseDecision.PurchaseGranted


end

-- Set Callback
MarketplaceService.ProcessReceipt = processReceipt