--------------------------------------------------
--ADDITIONAL BLOCKS

------------------------------------------------
--REDEFINE
--override default textures
--yellowish clay
--drop the block, allow plants to grow
minetest.override_item("default:clay", {
	description = "Clay",
	tiles = {"aotearoa_clay.png"},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:clay',--'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
})

--slabs for clay
stairs.register_stair_and_slab(
	"default_clay",
	"default:clay",
	{crumbly = 3},
	{"aotearoa_clay.png" },
	"Clay Stair",
	"Clay Slab",
	default.node_sound_dirt_defaults()
)


--gold drop from gravel?



--------------------------------------------------
--DIRT BLOCKS
--differently textured versions of dirt.

aotearoa.dirtlist = {
	{"dirt_with_dark_litter", "Dirt with Dark Litter", "aotearoa_dirt_with_dark_litter_bottom.png","aotearoa_dirt_with_dark_litter_bottom.png"},
	{"dirt_with_moss", "Dirt with Moss", "default_dirt.png", "default_rainforest_litter.png"},
	{"dirt_with_beech_litter", "Dirt with Beech Litter", "aotearoa_dirt_with_dark_litter_bottom.png", "aotearoa_dirt_with_dark_litter_bottom.png"},
	{"dirt_with_dry_litter", "Dirt with Dry Litter", "default_dirt.png", "default_dirt.png"},
}


for i in ipairs(aotearoa.dirtlist) do
	local dirtname = aotearoa.dirtlist[i][1]
	local dirtdesc = aotearoa.dirtlist[i][2]
	local bottext = aotearoa.dirtlist[i][3]
	local sidetext = aotearoa.dirtlist[i][4]

		minetest.register_node("aotearoa:"..dirtname, {
			description = dirtdesc,
			tiles = {
				"aotearoa_"..dirtname..".png",
				bottext,
				{name =sidetext.."^aotearoa_"..dirtname.."_side.png",
				tileable_vertical = false}
			},
			groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
			drop = "default:dirt",
			sounds = default.node_sound_dirt_defaults({
				footstep = {name = "default_grass_footstep", gain = 0.4},
			}),
		})

end


--------------------------------------------------
--SAND BLOCKS
--differently textured versions of sand

aotearoa.sandlist = {
	{"iron_sand", "Iron-sand"},
	{"volcanic_sand", "Volcanic Sand"},
}


for i in ipairs(aotearoa.sandlist) do
	local sandname = aotearoa.sandlist[i][1]
	local sanddesc = aotearoa.sandlist[i][2]

		minetest.register_node("aotearoa:"..sandname, {
			description = sanddesc,
			tiles = {	"aotearoa_"..sandname..".png"},
			groups = {crumbly = 3, falling_node = 1, sand = 1},
			sounds = default.node_sound_sand_defaults(),
		})

end

--cook volcanic_sand to obsidian
minetest.register_craft({
	type = "cooking",
	output = "default:obsidian",
	recipe = "aotearoa:volcanic_sand",
})

--------------------------------------------------
--PEAT BLOCKS

minetest.register_node("aotearoa:peat", {
	description = "Peat",
	tiles = {
		"aotearoa_peat.png",
	},
	groups = {crumbly = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:iron_lump"}, rarity = 200 },
			{items = {"aotearoa:peat"} }
		}
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_water_footstep", gain = 0.02},
	}),
})




aotearoa.peatlist = {
	{"restiad_peat", "Restiad Peat"},
	{"forest_peat", "Forest Peat"}
}


for i in ipairs(aotearoa.peatlist) do
	local dirtname = aotearoa.peatlist[i][1]
	local dirtdesc = aotearoa.peatlist[i][2]

		minetest.register_node("aotearoa:"..dirtname, {
			description = dirtdesc,
			tiles = {
				"aotearoa_"..dirtname..".png",
				"aotearoa_peat.png",
				{name ="aotearoa_peat.png^aotearoa_"..dirtname.."_side.png",
				tileable_vertical = false}
			},
			groups = {crumbly = 3},
			drop = {
				max_items = 1,
				items = {
					{items = {"default:iron_lump"}, rarity = 1000 },
					{items = {"aotearoa:peat"} }
				}
			},
			sounds = default.node_sound_dirt_defaults({
				footstep = {name = "default_water_footstep", gain = 0.2},
			}),
		})

end


----------------------------------------------------
--SILT

--Silt
minetest.register_node("aotearoa:silt", {
	description = "Silt",
	tiles = {
		"aotearoa_silt.png",
	},
	groups = {crumbly = 3, soil = 1,},
	sounds = default.node_sound_dirt_defaults({
	}),
})

--slab for silt
stairs.register_stair_and_slab(
	"aotearoa_silt",
	"aotearoa:silt",
	{crumbly = 3},
	{"aotearoa_silt.png" },
	"Silt Stair",
	"Silt Slab",
	default.node_sound_dirt_defaults()
)


--Mud (for swamps and estuaries)
--this is so you sink in
minetest.register_node("aotearoa:mud_sinking", {
	description = "Sinking Mud",
	tiles = {
		"aotearoa_mud.png",
	},
	walkable = false,
	--diggable = false,
	--pointable = false,
	buildable_to = true,
	drowning = 1,
	post_effect_color = {a = 250, r = 20, g = 20, b = 20},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1},
	drop = "aotearoa:silt",
		sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_water_footstep", gain = 0.2},
	}),
})

--solid mud
minetest.register_node("aotearoa:mud", {
	description = "Mud",
	tiles = {
		"aotearoa_mud.png",
	},
	--walkable = false,
	--diggable = false,
	--pointable = false,
	--buildable_to = true,
	groups = {crumbly = 3, puts_out_fire = 1},
	drop = "aotearoa:silt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_water_footstep", gain = 0.2},
	}),
})

-----------------------------------------------
--Boiling Mud

minetest.register_node("aotearoa:boiling_mud_source", {
	description = "Boiling Mud Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "aotearoa_boiling_mud_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		{
			name = "aotearoa_boiling_mud_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "aotearoa:silt",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "aotearoa:boiling_mud_flowing",
	liquid_alternative_source = "aotearoa:boiling_mud_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 1,
	post_effect_color = {a = 200, r = 73, g = 64, b = 55},
	groups = {liquid = 2},
})

minetest.register_node("aotearoa:boiling_mud_flowing", {
	description = "Boiling Mud Lava",
	drawtype = "flowingliquid",
	tiles = {"aotearoa_boiling_mud.png"},
	special_tiles = {
		{
			name = "aotearoa_boiling_mud_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "aotearoa_boiling_mud_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "aotearoa:boiling_mud_flowing",
	liquid_alternative_source = "aotearoa:boiling_mud_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	liquid_range = 2,
	damage_per_second = 1,
	post_effect_color = {a = 200, r = 73, g = 64, b = 55},
	groups = {liquid = 2,	not_in_creative_inventory = 1},
})



-----------------------------------------------------
--SEASHELLS
minetest.register_node("aotearoa:seashells", {
	description = "Seashells",
	tiles = {
		"aotearoa_seashells.png",
	},
	groups = {crumbly = 3, falling_node = 1},
	sounds = default.node_sound_gravel_defaults({
	}),
})


---------------------------------------------------------
--STONE
--note: hardness. default stone = 3, obsidian = 1
-- note: the metamorphic relations here (cooking) are an extreme simplification in places.

aotearoa.stonelist = {
	{"pounamu", "Pounamu", 1, 1,},
	{"siltstone", "Siltstone", 3, 2, "sediment", "aotearoa:silt",},
	{"claystone", "Claystone", 3, 2, "sediment", "default:clay",},
	{"conglomerate", "Conglomerate", 3, 2, "sediment", "default:gravel",},
	{"schist", "Schist", 2, 2, "cooked", "", {"aotearoa:greywacke", "aotearoa:andesite", "aotearoa:scoria", "aotearoa:basalt"}},
	{"coquina_limestone", "Coquina Limestone", 3, 2, "sediment", "aotearoa:seashells",},
	{"limestone", "Limestone", 2, 2, "cooked", "", {"aotearoa:coquina_limestone","default:coral"}},
	{"concrete","Concrete",3,2,},
	{"andesite", "Andesite", 3, 2,},
	{"granite", "Granite", 1, 1,},
	{"greywacke", "Greywacke", 3, 2, "cooked", "", {"aotearoa:siltstone","aotearoa:claystone", "default:sandstone", "default:silver_sandstone", "default:desert_sandstone"}},
	{"gneiss", "Gneiss", 1, 1, "cooked", "", {"aotearoa:schist","aotearoa:granite"}},
	{"scoria", "Scoria", 3, 2,},
	{"basalt", "Basalt", 2, 2,},
}






for i in ipairs(aotearoa.stonelist) do
	local stonename = aotearoa.stonelist[i][1]
	local stonedesc = aotearoa.stonelist[i][2]
	local hardness = aotearoa.stonelist[i][3]
	local hardness2 = aotearoa.stonelist[i][4]
	local type = aotearoa.stonelist[i][5]
	local sediment = aotearoa.stonelist[i][6]
	local precursor = aotearoa.stonelist[i][7]

	--make soft sedimentary rocks from/into sediment
	--and allow them to be dug
	local g = nil
	if type == "sediment" then
		g = {cracky = hardness, crumbly = 1},
		minetest.register_craft({
			output = "aotearoa:"..stonename,
			recipe = {
				{sediment, sediment,""},
				{sediment, sediment,""},
				{"", "",""},
			}
		})
		minetest.register_craft({
			output = sediment.." 4",
			recipe = {
				{"aotearoa:"..stonename},
			}
		})

	else
		g = {cracky = hardness, stone = 1}
	end

	--can get raw stone by cooking something else
	if type == "cooked" then
		--go through list of precusors
		for p, v in pairs(precursor) do
			minetest.register_craft({
				type = "cooking",
				output = "aotearoa:"..stonename,
				recipe = v,
				cooktime = 120,
			})
		end
	end

	--register raw
	minetest.register_node("aotearoa:"..stonename, {
		description = stonedesc,
		tiles = {"aotearoa_"..stonename..".png"},
		groups = g,
		drop = "aotearoa:"..stonename,
		sounds = default.node_sound_stone_defaults(),
	})

	--blocks and bricks
	minetest.register_node("aotearoa:"..stonename.."brick", {
		description = stonedesc.." Brick",
		tiles = {"aotearoa_"..stonename.."brick.png"},
		groups = {cracky = hardness2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("aotearoa:"..stonename.."_block", {
		description = stonedesc.. " Block",
		tiles = {"aotearoa_"..stonename.."_block.png"},
		groups = {cracky = hardness2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	--stairs and slabs
	--raw
	stairs.register_stair_and_slab(
		"aotearoa_"..stonename,
		"aotearoa:"..stonename,
		{cracky = hardness,},
		{"aotearoa_"..stonename..".png" },
		stonedesc.." Stair",
		stonedesc.." Slab",
		default.node_sound_stone_defaults()
	)

	--brick
	stairs.register_stair_and_slab(
		"aotearoa_"..stonename.."brick",
		"aotearoa:"..stonename.."brick",
		{cracky = hardness2,},
		{"aotearoa_"..stonename.."brick.png" },
		stonedesc.." Brick Stair",
		stonedesc.." Brick Slab",
		default.node_sound_stone_defaults()
	)

	--block
	stairs.register_stair_and_slab(
		"aotearoa_"..stonename.."_block",
		"aotearoa:"..stonename.."_block",
		{cracky = hardness2,},
		{"aotearoa_"..stonename.."_block.png" },
		stonedesc.." Block Stair",
		stonedesc.." Block Slab",
		default.node_sound_stone_defaults()
	)

	--craft
	minetest.register_craft({
		output = "aotearoa:"..stonename.."brick 4",
		recipe = {
			{"aotearoa:"..stonename, "aotearoa:"..stonename,""},
			{"aotearoa:"..stonename, "aotearoa:"..stonename,""},
			{"", "",""},
		}
	})

	minetest.register_craft({
		output = "aotearoa:"..stonename.."_block 9",
		recipe = {
			{"aotearoa:"..stonename, "aotearoa:"..stonename, "aotearoa:"..stonename},
			{"aotearoa:"..stonename, "aotearoa:"..stonename, "aotearoa:"..stonename},
			{"aotearoa:"..stonename, "aotearoa:"..stonename, "aotearoa:"..stonename},
		}
	})

end

------------------------------------------
--MINERALS

---------------------
--Quartz with gold

minetest.register_node("aotearoa:quartz_with_gold", {
	description = "Quartz with Gold",
	tiles = {"aotearoa_quartz_with_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
	})

-------------------
--Limonite (iron ore)

minetest.register_node("aotearoa:limonite", {
	description = "Limonite",
	tiles = {"aotearoa_limonite.png"},
	groups = {cracky = 3},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

-------------------
--chalcopyrite (copper ore)

minetest.register_node("aotearoa:chalcopyrite", {
	description = "Chalcopyrite",
	tiles = {"aotearoa_chalcopyrite.png"},
	groups = {cracky = 3},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

-------------------
--cassiterite (tin ore)

minetest.register_node("aotearoa:cassiterite", {
	description = "Cassiterite",
	tiles = {"aotearoa_cassiterite.png"},
	groups = {cracky = 3},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})


---------------------------------------------
--ROTTEN WOOD

minetest.register_node("aotearoa:rotten_wood", {
	description = "Rotten Wood",
	tiles = {
		"aotearoa_rotten_wood_top.png",
		"aotearoa_rotten_wood_top.png",
		"aotearoa_rotten_wood.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})
