-- Adds the gems as rare drops from desert sand
minetest.override_item("default:desert_sand", {
	drop = {
		max_items = 1,
		items = {
			{items = {'ff_magic_staffs:red_gem'}, rarity = 1500},
			{items = {'ff_magic_staffs:blue_gem'}, rarity = 1500},
			{items = {'ff_magic_staffs:green_gem'}, rarity = 1500},
			{items = {'ff_magic_staffs:yellow_gem'}, rarity = 1500},
			{items = {'default:desert_sand'}}
		}
	},
})