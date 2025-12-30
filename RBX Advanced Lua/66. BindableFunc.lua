local GetList = game.ReplicatedStorage:WaitForChild("GetList")

local banList = {
	"HugoVonWrangel",
	"PeterWrangel",
	"RobertWrangel",
}

GetList.OnInvoke = function(player)
	for i, v in pairs(banList) do
		print(player.Name)
		if v == player.Name then
			print("Player is in the ban list!")
			return true
		else
			print("Player is not in the ban list!")
		end
	end
end
