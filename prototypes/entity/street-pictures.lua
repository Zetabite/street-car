function blank(width, height, shift)
	return {
		filename = '__street-car__/graphics/blank.png',
		priority = 'low',
		width = width,
		height = height,
		shift = shift,
		variation_count = 1,
	}
end

local make = {
	metals = true,
	backplates = true
}

function railpictures()
	return railpicturesinternal({
		{'metals', 'metals', mipmap = true},
		{'backplates', 'backplates', mipmap = true},
		{'ties', 'ties'},
		{'stone_path', 'stone-path'},
		{'segment_visualisation_middle', 'segment-visualisation-middle'},
		{'segment_visualisation_ending_front', 'segment-visualisation-ending-1'},
		{'segment_visualisation_ending_back', 'segment-visualisation-ending-2'},
		{'segment_visualisation_continuing_front', 'segment-visualisation-continuing-1'},
		{'segment_visualisation_continuing_back', 'segment-visualisation-continuing-2'}
	})
end

function railpicturesinternal(elems)
	local railBlockKeys = {
		segment_visualisation_middle = true,
		segment_visualisation_ending_front = true,
		segment_visualisation_ending_back = true,
		segment_visualisation_continuing_front = true,
		segment_visualisation_continuing_back = true
	}

	local keys = {
		{'straight_rail', 'horizontal', 64, 128, 0, 0},
		{'straight_rail', 'vertical', 128, 64, 0, 0},
		{'straight_rail', 'diagonal-left-top', 96, 96, 0.5, 0.5},
		{'straight_rail', 'diagonal-right-top', 96, 96, -0.5, 0.5},
		{'straight_rail', 'diagonal-right-bottom', 96, 96, -0.5, -0.5},
		{'straight_rail', 'diagonal-left-bottom', 96, 96, 0.5, -0.5},
		{'curved_rail', 'vertical-left-top', 192, 288, 0.5, 0.5},
		{'curved_rail', 'vertical-right-top', 192, 288, -0.5, 0.5},
		{'curved_rail', 'vertical-right-bottom', 192, 288, -0.5, -0.5},
		{'curved_rail', 'vertical-left-bottom', 192, 288, 0.5, -0.5},
		{'curved_rail' ,'horizontal-left-top', 288, 192, 0.5, 0.5},
		{'curved_rail' ,'horizontal-right-top', 288, 192, -0.5, 0.5},
		{'curved_rail' ,'horizontal-right-bottom', 288, 192, -0.5, -0.5},
		{'curved_rail' ,'horizontal-left-bottom', 288, 192, 0.5, -0.5}
	}

	local res = {}
	for _ , key in ipairs(keys) do
		part = {}
		dashkey = key[1]:gsub('_', '-')
		for _ , elem in ipairs(elems) do
			if(make[elem[1]]) then
				part[elem[1]] = {
					sheet = {
						filename = string.format('__street-car__/graphics/entity/%s/%s-%s-%s.png', dashkey, dashkey, key[2], elem[2]),
						priority = 'extra-high',
						flags = {'icon'},
						width = key[3],
						height = key[4],
						shift = {key[5], key[6]},
						variation_count = (key[7] and elem.variations) or 1,
						hr_version = {
							filename = string.format('__street-car__/graphics/entity/%s/hr-%s-%s-%s.png', dashkey, dashkey, key[2], elem[2]),
							priority = 'extra-high',
							flags = {'icon'},
							width = key[3] * 2,
							height = key[4] * 2,
							shift = {key[5], key[6]},
							variation_count = (key[7] and elem.variations) or 1,
							scale = 0.5,
						}
					}
				}
			else
				part[elem[1]] = {sheet = blank(2,2,{0,0})}
				if(railBlockKeys[elem[1]]) then
					part[elem[1]] = blank(key[3],key[4],{key[5],key[6]})
				end
			end
		end

		dashkey2 = key[2]:gsub('-', '_')
		res[key[1] .. '_' .. dashkey2] = part
	end
	res['rail_endings'] = {sheets = {blank(2,2,{0,0})}}
	return res
end
return railpictures()
