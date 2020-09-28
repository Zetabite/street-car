function built_entity(event)
	local entity = event.created_entity
	if entity.type == 'locomotive' then
		if not allowed_placement(entity) then
			local item = entity.name
			local player = game.get_player(event.player_index)
			local inventory = player.get_main_inventory()
			inventory.insert({name = item, count = 1})
			inventory.sort_and_merge()
			entity.destroy()
		end
	end
end

function allowed_placement(entity)
	local position = entity.position
	local surface = entity.surface
	local name = entity.name
	local street_count = surface.count_entities_filtered({name = {'curved-street', 'straight-street'}, position = position, radius = 1, limit = 1})
	if name == 'street-car' and street_count == 1 then
		return true
	elseif name ~= 'street-car' and street_count == 0 then
		return true
	else
		return false
	end
end

-- lib
local lib = {}

lib.events = {
	[defines.events.on_built_entity] = built_entity,
	--[defines.events.on_robot_built_entity] = built_entity,
}

return lib
