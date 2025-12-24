local bluePart = script.Parent

bluePart.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local head = hit.Parent.Head
		bluePart.CFrame = head.CFrame * CFrame.new(0, 10, 0)
		local weld = Instance.new("Weld")
		weld.Part0 = head
		weld.Part1 = bluePart
		weld.C0 = head.CFrame
		weld.C1 = bluePart.CFrame
		weld.Parent = script.Parent
	end
end)
