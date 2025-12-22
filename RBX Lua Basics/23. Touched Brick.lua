local p = script.Parent

p.Touched:Connect(function(touched)
	print(touched)
end)