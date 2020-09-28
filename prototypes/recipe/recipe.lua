data:extend({
	{
		type = 'recipe',
		name = 'street-car',
		--enabled = false,
		energy_required = 2,
		enabled = false,
		ingredients = {
			{'engine-unit', 8},
			{'iron-plate', 20},
			{'steel-plate', 5}
		},
		result = 'street-car'
	},
	{
		type = 'recipe',
		name = 'street',
		enabled = false,
		ingredients = {
			{'stone', 6},
		},
		result = 'street',
		result_count = 2
	},
})
