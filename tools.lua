-- Stone Staff of Structure
minetest.register_tool("ff_magic_staffs:stone_staff_of_structure", {
	description = "Stone Staff of Structure",
	inventory_image = "ff_magic_staffs_stone_staff_of_structure.png",
	on_use = ff_magic_staffs.staff_of_structure_on_use(300, 8),
	sound = {breaks = "default_tool_breaks"},
})

-- Steel Staff of Structure
minetest.register_tool("ff_magic_staffs:steel_staff_of_structure", {
	description = "Steel Staff of Structure",
	inventory_image = "ff_magic_staffs_steel_staff_of_structure.png",
	on_use = ff_magic_staffs.staff_of_structure_on_use(50, 9),
	sound = {breaks = "default_tool_breaks"},
})

-- Mese Staff of Structure
minetest.register_tool("ff_magic_staffs:mese_staff_of_structure", {
	description = "Mese Staff of Structure",
	inventory_image = "ff_magic_staffs_mese_staff_of_structure.png",
	on_use = ff_magic_staffs.staff_of_structure_on_use(30, 10),
	sound = {breaks = "default_tool_breaks"},
})

-- Kovar Staff of Structure
if minetest.get_modpath("floating_factories") then
	minetest.register_tool("ff_magic_staffs:kovar_staff_of_structure", {
		description = "Kovar Staff of Structure",
		inventory_image = "ff_magic_staffs_kovar_staff_of_structure.png",
		on_use = ff_magic_staffs.staff_of_structure_on_use(20, 10),
		sound = {breaks = "default_tool_breaks"},
	})
end

-- Staff of Earth
minetest.register_tool("ff_magic_staffs:staff_of_earth", {
	description = "Staff of Earth",
	inventory_image = "ff_magic_staffs_staff_of_earth.png",
	on_use = ff_magic_staffs.staff_of_earth_on_use(1600),
	sound = {breaks = "default_tool_breaks"},
})

-- Staff of Ice
minetest.register_tool("ff_magic_staffs:staff_of_ice", {
	description = "Staff of Ice",
	inventory_image = "ff_magic_staffs_staff_of_ice.png",
	on_use = ff_magic_staffs.staff_of_ice_on_use(1600),
	sound = {breaks = "default_tool_breaks"},
})

-- Staff of Magma
minetest.register_tool("ff_magic_staffs:staff_of_magma", {
	description = "Staff of Magma",
	inventory_image = "ff_magic_staffs_staff_of_magma.png",
	on_use = ff_magic_staffs.staff_of_magma_on_use(1800),
	sound = {breaks = "default_tool_breaks"},
})

-- Staff of Lightning
if minetest.get_modpath("lightning") then
	minetest.register_tool("ff_magic_staffs:staff_of_lightning", {
		description = "Staff of Lightning",
		inventory_image = "ff_magic_staffs_staff_of_lightning.png",
		on_use = ff_magic_staffs.staff_of_lightning_on_use(1800),
		sound = {breaks = "default_tool_breaks"},
	})
end