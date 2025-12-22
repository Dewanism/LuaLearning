local TextButton = script.Parent

TextButton.MouseButton1Up:Connect(function(x, y)
print(x ..", " .. y)
end)

