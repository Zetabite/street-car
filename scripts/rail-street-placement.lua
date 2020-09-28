local rails_streets = {
	['curved-street'] = 'street',
	['curved-rail'] = 'rail',
	['straight-street'] = 'street',
	['straight-rail'] = 'rail',
}

local placements = {
	{
		rail_direction=defines.rail_direction.front, rail_connection_direction=defines.rail_connection_direction.left
	},
	{
		rail_direction=defines.rail_direction.back, rail_connection_direction=defines.rail_connection_direction.left
	},
	{
		rail_direction=defines.rail_direction.front, rail_connection_direction=defines.rail_connection_direction.straight
	},
	{
		rail_direction=defines.rail_direction.back, rail_connection_direction=defines.rail_connection_direction.straight
	},
	{
		rail_direction=defines.rail_direction.front, rail_connection_direction=defines.rail_connection_direction.right
	},
	{
		rail_direction=defines.rail_direction.back, rail_connection_direction=defines.rail_connection_direction.right
	},
}

function built_entity(event)
	local entity = event.created_entity
	local item = rails_streets[entity.name]
	if item then
		if not allowed_placement(entity) then
			local player = game.get_player(event.player_index)
			local inventory = player.get_main_inventory()
			local count = get_amount(entity.type)
			inventory.insert({name = item, count = count})
			inventory.sort_and_merge()
			entity.destroy()
		end
	end
end

function allowed_placement(entity)
	local target = 'rail'
	if string.match(entity.name, 'rail') then
		target = 'street'
	end
	for _, placement in pairs(placements) do
		local connection = entity.get_connected_rail(placement)
		if (connection) then
			if string.match(connection.name, target) then
				return false
			end
		end
	end
	return true
end

function get_amount(type)
	if type == 'curved-rail' then return 4 else return 1 end
end

-- lib
local lib = {}

lib.events = {
	[defines.events.on_built_entity] = built_entity,
	[defines.events.on_robot_built_entity] = built_entity,
}

return lib
