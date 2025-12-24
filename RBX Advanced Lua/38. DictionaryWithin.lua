local dictionary = {
	Sandwich = {
		Ingredients = { "Bread", "Lettuce", "Tomato", "Cheese", "Meat" },
		Calories = 500,
		IsVegetarian = false,
	},
}

print(dictionary.Sandwich.Calories)
for index, ingredient in ipairs(dictionary.Sandwich.Ingredients) do
	print(index, ingredient)
end
