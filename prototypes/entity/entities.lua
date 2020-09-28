local hit_effects = require ('__base__.prototypes.entity.demo-hit-effects')
local sounds = require('__base__.prototypes.entity.demo-sounds')
local rail_pictures = require ('prototypes.entity.street-pictures')

-- deepcopy just in case, so that not a value is accidently changed
local car = table.deepcopy(data.raw['car']['car'])

local straight_street = table.deepcopy(data.raw['straight-rail']['straight-rail'])
straight_street.name = 'straight-street'
straight_street.minable = {mining_time = 0.2, result = 'street'}
straight_street.pictures = rail_pictures

local curved_street = table.deepcopy(data.raw['curved-rail']['curved-rail'])
curved_street.name = 'curved-street'
curved_street.minable = {mining_time = 0.2, result = 'street', count = 4}
curved_street.placeable_by = {item = 'street', count = 4}
curved_street.pictures = rail_pictures

data:extend({
	{
		type = 'locomotive',
		name = 'street-car',
		icon = car.icon,
		icon_size = car.icon_size,
		icon_mipmaps = car.icon_mipmaps,
		flags = car.flags,
		minable = {mining_time = 0.5, result = 'street-car'},
		mined_sound = car.mined_sound,
		max_health = car.max_health,
		corpse = car.corpse,
		dying_explosion = car.dying_explosion,
		alert_icon_shift = car.alert_icon_shift,
		energy_per_hit_point = car.energy_per_hit_point,
		resistances = car.resistances,
		collision_box = car.collision_box,
    	selection_box = car.selection_box,
		damaged_trigger_effect = hit_effects.entity(),
		burner = car.burner,
		braking_power = car.braking_power,
		friction = car.friction,
		front_light = car.light,
		weight = car.weight,
		max_speed = 1,
		max_power = car.consumption,
		reversing_power_modifier = 0.6,
		vertical_selection_shift = -0.5,
		air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
		connection_distance = 2,
		joint_distance = 1.5,
		color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
		pictures = {
			layers = {
				{
					priority = 'low',
					width = 100,
					height = 86,
					--shift = {0, -0.1875},
					direction_count = 64,
					filenames = {
						'__street-car__/graphics/entity/street-car/street-car-1.png',
						'__street-car__/graphics/entity/street-car/street-car-2.png'
					},
					line_length = 1,
					lines_per_file = 32,
					hr_version = {
						priority = 'low',
						width = 201,
            			height = 172,
						direction_count = 64,
						filenames = {
							'__street-car__/graphics/entity/street-car/hr-street-car-1.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-2.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-3.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-4.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-5.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-6.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-7.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-8.png'
						},
						line_length = 1,
						lines_per_file = 8,
						--shift = util.by_pixel(0+2, -11.5+8.5),
						scale = 0.5
					}
				},
				{
					priority = 'low',
					flags = { 'mask' },
					width = 99,
					height = 73,
					direction_count = 64,
					filenames = {
						'__street-car__/graphics/entity/street-car/street-car-mask-1.png',
						'__street-car__/graphics/entity/street-car/street-car-mask-2.png'
					},
					line_length = 1,
					lines_per_file = 32,
					--shift = {0, -0.171875},
					apply_runtime_tint = true,
					hr_version = {
						priority = 'low',
						flags = { 'mask' },
						width = 199,
            			height = 147,
						direction_count = 64,
						filenames = {
							'__street-car__/graphics/entity/street-car/hr-street-car-mask-1.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-mask-2.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-mask-3.png',
							'__street-car__/graphics/entity/street-car/hr-street-car-mask-4.png'
						},
						line_length = 1,
						lines_per_file = 16,
						--shift = util.by_pixel(0+2, -11+8.5),
						apply_runtime_tint = true,
						scale = 0.5
					}
				},
				{
					priority = 'low',
					flags = { 'shadow' },
					width = 114,
          			height = 76,
					direction_count = 64,
					draw_as_shadow = true,
					filenames = {
						'__street-car__/graphics/entity/street-car/street-car-shadow-1.png',
						'__street-car__/graphics/entity/street-car/street-car-shadow-2.png',
						'__street-car__/graphics/entity/street-car/street-car-shadow-3.png',
						'__street-car__/graphics/entity/street-car/street-car-shadow-4.png'
					},
					line_length = 1,
					lines_per_file = 16,
					shift = {0.28125, 0.25},
				}
			}
		},
		minimap_representation = {
			filename = '__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png',
			flags = {'icon'},
			size = {20, 40},
			scale = 0.5
		},
		selected_minimap_representation = {
			filename = '__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png',
			flags = {'icon'},
			size = {20, 40},
			scale = 0.5
		},
		stop_trigger_speed = car.stop_trigger_speed,
		stop_trigger = car.stop_trigger,
		drive_over_tie_trigger = drive_over_tie(),
		vehicle_impact_sound = sounds.generic_impact,
		working_sound = car.working_sound,
		open_sound = car.open_sound,
		close_sound = car.close_sound,
		sound_minimum_speed = 0.5,
		sound_scaling_ratio = 0.35,
		water_reflection = car.water_reflection
	},
	straight_street,
	curved_street
})
