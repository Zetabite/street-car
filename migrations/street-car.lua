for _, force in pairs(game.forces) do
	local technologies = force.technologies
	local recipes = force.recipes

	if technologies['automobilism'].researched then
		recipes['street-car'].enabled = true
		recipes['street'].enabled = true
	end
end
