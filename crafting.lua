-- Stone Staff of Structure
minetest.register_craft({
	output = 'ff_magic_staffs:stone_staff_of_structure',
	recipe = {
		{'', 'default:cobble', 'default:cobble'},
		{'', 'group:stick', 'default:cobble'},
		{'group:stick', '', ''},
	}
})

-- Steel Staff of Structure
minetest.register_craft({
	output = 'ff_magic_staffs:steel_staff_of_structure',
	recipe = {
		{'', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'group:stick', 'default:steel_ingot'},
		{'group:stick', '', ''},
	}
})

-- Mese Staff of Structure
minetest.register_craft({
	output = 'ff_magic_staffs:mese_staff_of_structure',
	recipe = {
		{'', 'default:mese_crystal_fragment', 'default:mese_crystal_fragment'},
		{'', 'group:stick', 'default:mese_crystal_fragment'},
		{'group:stick', '', ''},
	}
})

-- Changes the recipes depending if the floating_factories exists or falls back to recipes for default only
if minetest.get_modpath("floating_factories") then
	-- Kovar Staff of Structure
	minetest.register_craft({
		output = 'ff_magic_staffs:kovar_staff_of_structure',
		recipe = {
			{'', 'floating_factories:kovar_ingot', 'floating_factories:kovar_ingot'},
			{'', 'floating_factories:invar_rod', 'floating_factories:kovar_ingot'},
			{'floating_factories:invar_rod', '', ''},
		}
	})

	-- Staff of Earth
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_earth',
		recipe = {
			{'', '', 'ff_magic_staffs:green_gem'},
			{'', 'floating_factories:invar_rod', ''},
			{'floating_factories:invar_rod', '', ''},
		}
	})

	-- Staff of Ice
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_ice',
		recipe = {
			{'', '', 'ff_magic_staffs:blue_gem'},
			{'', 'floating_factories:invar_rod', ''},
			{'floating_factories:invar_rod', '', ''},
		}
	})

	-- Staff of Magma
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_magma',
		recipe = {
			{'', '', 'ff_magic_staffs:red_gem'},
			{'', 'floating_factories:invar_rod', ''},
			{'floating_factories:invar_rod', '', ''},
		}
	})
	-- Staff of Lightning
	if minetest.get_modpath("lightning") then
		minetest.register_craft({
			output = 'ff_magic_staffs:staff_of_lightning',
			recipe = {
				{'', '', 'ff_magic_staffs:yellow_gem'},
				{'', 'floating_factories:invar_rod', ''},
				{'floating_factories:invar_rod', '', ''},
			}
		})
	end
else
	-- Staff of Earth
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_earth',
		recipe = {
			{'', '', 'ff_magic_staffs:green_gem'},
			{'', 'group:stick', ''},
			{'group:stick', '', ''},
		}
	})

	-- Staff of Ice
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_ice',
		recipe = {
			{'', '', 'ff_magic_staffs:blue_gem'},
			{'', 'group:stick', ''},
			{'group:stick', '', ''},
		}
	})

	-- Staff of Magma
	minetest.register_craft({
		output = 'ff_magic_staffs:staff_of_magma',
		recipe = {
			{'', '', 'ff_magic_staffs:red_gem'},
			{'', 'group:stick', ''},
			{'group:stick', '', ''},
		}
	})

	-- Staff of Lightning
	if minetest.get_modpath("lightning") then
		minetest.register_craft({
			output = 'ff_magic_staffs:staff_of_lightning',
			recipe = {
				{'', '', 'ff_magic_staffs:yellow_gem'},
				{'', 'group:stick', ''},
				{'group:stick', '', ''},
			}
		})
	end
end
