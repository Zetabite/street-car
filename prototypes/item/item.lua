data:extend({
	{
		name = 'street-car',
		type = 'item',
		icons =  {
			{
				icon = '__street-car__/graphics/icons/street-hint.png',
				icon_size = 128, icon_mipmaps = 4,
			},
			{
				icon = '__base__/graphics/icons/car.png',
				icon_size = 64, icon_mipmaps = 4,
			},
		},
		stack_size = 1,
		subgroup = 'street-transport',
		place_result = 'street-car',
	},
	{
		type = 'rail-planner',
		name = 'street',
		icon = '__street-car__/graphics/icons/street.png',
		icon_size = 64, icon_mipmaps = 4,
		localised_name = {'item-name.street'},
		subgroup = 'street-transport',
		order = 'a[street-system]-a[street]',
		place_result = 'straight-street',
		stack_size = 100,
		straight_rail = 'straight-street',
		curved_rail = 'curved-street'
	},
})
