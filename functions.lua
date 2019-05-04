-- Staff of Structure
ff_magic_staffs.staff_of_structure_on_use = function (wear_amount, max_radius)
	local on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local player = minetest.get_player_by_name(player_name)
		local creative_enabled = creative.is_enabled_for(player_name)
		
		-- Safety checks in case values were not defined and creative check
		if creative_enabled then
			wear_amount = 0
		elseif wear_amount == nil then
			wear_amount = 300
		end
		if max_radius == nil then
			max_radius = 8
		end
		
		local staff_of_structure = player:get_wielded_item()
		local staff_of_structure_wear = staff_of_structure:get_wear()
		local inv = player:get_inventory()
		local under = pointed_thing.under
		
		local undernode = {}
		if under ~= nil then
			undernode = minetest.get_node(under)
		end
		
		local above = pointed_thing.above
		local abovenode = {}
		if above ~= nil then
			abovenode = minetest.get_node(above)
		end
		
		-- Disable attached nodes otherwise the staff could place them in impossible positions
		if minetest.get_item_group(undernode.name, "attached_node") ~= 0 then
			return staff_of_structure
		end
		
		local nodes_to_check = {}
		table.insert(nodes_to_check, under)
		local checked_nodes = {}
		local pointed_direction
		
		if inv:contains_item("main", undernode.name) and abovenode.name == "air" then
			-- Place the first node, removes it from the inventory, adds it to the checked nodes table, plays the node place sound, and adds tool wear
			local removed_item
			if creative_enabled then
				removed_item = ItemStack(undernode.name)
			else
				removed_item = inv:remove_item("main", undernode.name .. " 1")
			end
			local removed_item_def = removed_item:get_definition()
			minetest.set_node(above, {name = undernode.name})
			checked_nodes["x" .. under.x .. "y" .. under.y .. "z" .. under.z] = "checked"
			minetest.sound_play(removed_item_def.sounds.place.name, { gain = 1.0, })
			staff_of_structure_wear = staff_of_structure_wear + wear_amount
			
			-- Player pointed at the top of the block
			if under.y < above.y then
				pointed_direction = "top"
			-- Player pointed at the side of the block towards the negative x axis
			elseif under.y == above.y and under.x < above.x then
				pointed_direction = "side_negative_x"
			-- Player pointed at the side of the block towards the positive x axis
			elseif under.y == above.y and under.x > above.x then
				pointed_direction = "side_positive_x"
			-- Player pointed at the side of the block towards the negative z axis
			elseif under.y == above.y and under.z < above.z then
				pointed_direction = "side_negative_z"
			-- Player pointed at the side of the block towards the positive z axis
			elseif under.y == above.y and under.z > above.z then
				pointed_direction = "side_positive_z"
			-- Player pointed at the bottom of the block
			elseif under.y > above.y then
				pointed_direction = "bottom"
			end
			
			-- Loop through the rest of the adjacent blocks depending on the side and direction it was placed
			while next(nodes_to_check) ~= nil do
				-- Check adjacent blocks of the node_to_check
				local node_to_check_pos = table.remove(nodes_to_check)
				for i = 1,4 do
					local x_adjacent = 0
					local y_adjacent = 0
					local z_adjacent = 0
					if i == 1 then
						if pointed_direction == "top" or pointed_direction == "bottom" then
							x_adjacent = 1
						elseif pointed_direction == "side_negative_x" or pointed_direction == "side_positive_x" or pointed_direction == "side_negative_z" or pointed_direction == "side_positive_z" then
							y_adjacent = 1
						end
					elseif i == 2 then
						if pointed_direction == "top" or pointed_direction == "bottom" then
							x_adjacent = -1
						elseif pointed_direction == "side_negative_x" or pointed_direction == "side_positive_x" or pointed_direction == "side_negative_z" or pointed_direction == "side_positive_z" then
							y_adjacent = -1
						end
					elseif i == 3 then
						if pointed_direction == "top" or pointed_direction == "bottom" then
							z_adjacent = 1
						elseif pointed_direction == "side_negative_x" or pointed_direction == "side_positive_x" then
							z_adjacent = 1
						elseif pointed_direction == "side_negative_z" or pointed_direction == "side_positive_z" then
							x_adjacent = 1
						end
					elseif i == 4 then
						if pointed_direction == "top" or pointed_direction == "bottom" then
							z_adjacent = -1
						elseif pointed_direction == "side_negative_x" or pointed_direction == "side_positive_x" then
							z_adjacent = -1
						elseif pointed_direction == "side_negative_z" or pointed_direction == "side_positive_z" then
							x_adjacent = -1
						end
					end
					local surrounding_node_pos = {}
					surrounding_node_pos.x = node_to_check_pos.x + x_adjacent
					surrounding_node_pos.y = node_to_check_pos.y + y_adjacent
					surrounding_node_pos.z = node_to_check_pos.z + z_adjacent
					if pointed_direction == "top" or pointed_direction == "bottom" then
						if math.abs(surrounding_node_pos.x - under.x) > max_radius or math.abs(surrounding_node_pos.z - under.z) > max_radius then
							break
						end
					elseif pointed_direction == "side_negative_x" or pointed_direction == "side_positive_x" then
						if math.abs(surrounding_node_pos.y - under.y) > max_radius or math.abs(surrounding_node_pos.z - under.z) > max_radius then
							break
						end
					elseif pointed_direction == "side_negative_z" or pointed_direction == "side_positive_z" then
						if math.abs(surrounding_node_pos.y - under.y) > max_radius or math.abs(surrounding_node_pos.x - under.x) > max_radius then
							break
						end
					end
					if checked_nodes["x" .. surrounding_node_pos.x .. "y" .. surrounding_node_pos.y .. "z" .. surrounding_node_pos.z] ~= "checked" then
						checked_nodes["x" .. surrounding_node_pos.x .. "y" .. surrounding_node_pos.y .. "z" .. surrounding_node_pos.z] = "checked"
						if minetest.get_node(surrounding_node_pos).name == undernode.name then
							local new_node_to_check_pos = {}
							new_node_to_check_pos.x = surrounding_node_pos.x
							new_node_to_check_pos.y = surrounding_node_pos.y
							new_node_to_check_pos.z = surrounding_node_pos.z
							table.insert(nodes_to_check, new_node_to_check_pos)
							if pointed_direction == "top" then
								surrounding_node_pos.y = surrounding_node_pos.y + 1
							elseif pointed_direction == "bottom" then
								surrounding_node_pos.y = surrounding_node_pos.y - 1
							elseif pointed_direction == "side_negative_x" then
								surrounding_node_pos.x = surrounding_node_pos.x + 1
							elseif pointed_direction == "side_positive_x" then
								surrounding_node_pos.x = surrounding_node_pos.x - 1
							elseif pointed_direction == "side_negative_z" then
								surrounding_node_pos.z = surrounding_node_pos.z + 1
							elseif pointed_direction == "side_positive_z" then
								surrounding_node_pos.z = surrounding_node_pos.z - 1
							end
							-- Checks a block adjacent to the first block placed for air
							if minetest.get_node(surrounding_node_pos).name == "air" then
								-- If it is air, check that the node has a name, the staff has durability left, and place the block
								if undernode.name ~= nil and undernode.name ~= "" and staff_of_structure_wear < 65536 then
									if not creative_enabled then
										inv:remove_item("main", undernode.name .. " 1")
									end
									staff_of_structure_wear = staff_of_structure_wear + wear_amount
									minetest.set_node(surrounding_node_pos, {name = undernode.name})
								else
									nodes_to_check = {}
								end
							end
						end
					end
				end
			end
		end
		staff_of_structure:add_wear(staff_of_structure_wear)
		return staff_of_structure
	end
	return on_use
end

-- Staff of Earth
ff_magic_staffs.staff_of_earth_on_use = function (wear_amount)
	local on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local player = minetest.get_player_by_name(player_name)
		local staff_of_earth = player:get_wielded_item()
		local under = pointed_thing.under
		local undernode = {}
		local above_under_pos = {}
		if under ~= nil then
			undernode = minetest.get_node(under)
			above_under_pos.x = under.x
			above_under_pos.y = under.y + 1
			above_under_pos.z = under.z
		end
		if undernode == nil then
			return staff_of_earth
		end
		local above_under_node = minetest.get_node(above_under_pos)
		if undernode.name == "default:dirt" and not minetest.is_protected(under, player_name) then
			minetest.set_node(under, {name = "default:dirt_with_grass"})
			staff_of_earth:set_wear(wear_amount)
		elseif undernode.name == "default:dirt_with_grass" and above_under_node.name == "air" and not minetest.is_protected(above_under_pos, player_name) then
			local grass_number = math.random(2, 5)
			under.y = under.y + 1
			minetest.set_node(under, {name = "default:grass_" .. grass_number})
			staff_of_earth:set_wear(wear_amount)
		elseif minetest.get_item_group(undernode.name, "flora") ~= 0 then
			staff_of_earth:set_wear(wear_amount)
			local xposrandom = math.random() * math.random(-0.9, 0.9)
			local zposrandom = math.random() * math.random(-0.9, 0.9)
			under.x = under.x + xposrandom
			under.z = under.z + zposrandom
			minetest.add_item(under, undernode.name .. " 1")
		end
		
		return staff_of_earth
	end
	return on_use
end

-- Staff of Ice
ff_magic_staffs.staff_of_ice_on_use = function (wear_amount)
	local on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local player = minetest.get_player_by_name(player_name)
		local staff_of_ice = player:get_wielded_item()
		local above = pointed_thing.above
		local abovenode = {}
		if above ~= nil then
			abovenode = minetest.get_node(above)
		end
		
		if abovenode.name == "default:water_source" and not minetest.is_protected(above, player_name) then
			minetest.set_node(above, {name = "default:ice"})
			staff_of_ice:set_wear(wear_amount)
		end
		
		return staff_of_ice
	end
	return on_use
end

-- Staff of Magma
ff_magic_staffs.staff_of_magma_on_use = function (wear_amount)
	local on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local player = minetest.get_player_by_name(player_name)
		local staff_of_magma = player:get_wielded_item()
		local under = pointed_thing.under
		local undernode = {}
		if under ~= nil then
			undernode = minetest.get_node(under)
		end
		
		if undernode.name == "default:cobble" and not minetest.is_protected(under, player_name) then
			minetest.set_node(under, {name = "default:lava_source"})
			staff_of_magma:set_wear(wear_amount)
		end
		
		return staff_of_magma
	end
	return on_use
end

-- Staff of Lightning
ff_magic_staffs.staff_of_lightning_on_use = function (wear_amount)
	local on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local player = minetest.get_player_by_name(player_name)
		local staff_of_lightning = player:get_wielded_item()
		local under = pointed_thing.under
		
		if under ~= nil and minetest.get_modpath("lightning") then
			lightning.strike(under)
			staff_of_lightning:set_wear(wear_amount)
		end
		
		return staff_of_lightning
	end
	return on_use
end