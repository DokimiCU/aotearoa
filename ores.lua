----------------------------------------------
--ORES...


---------------------------
--Intrusive stone types.


-- Obsidian
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:obsidian",
	wherein         = {
		"default:stone",
	 	"aotearoa:andesite",
		"aotearoa:granite",
		"aotearoa:basalt",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 10,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -316,
		octaves = 1,
		persist = 0.0
	},
})

-- Desert stone into deep stone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:desert_stone",
	wherein         = {
		"default:stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = -150,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -31666,
		octaves = 1,
		persist = 0.0
	},
})


-- gneiss into deep stone, schist
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:gneiss",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 56752,
		octaves = 1,
		persist = 0.0
	},
})



-- schist into deep stone, greywacke
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:schist",
	wherein         = {
		"default:stone",
		"aotearoa:greywacke",
		"aotearoa:gneiss",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -89851,
		octaves = 1,
		persist = 0.0
	},
})

-- granite into deep stone, and metamorphic rocks
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:granite",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
		"aotearoa:greywacke",
		"aotearoa:gneiss",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -30027,
		octaves = 1,
		persist = 0.0
	},
})


-- greywacke into deep stone and schist
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:greywacke",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -145366,
		octaves = 1,
		persist = 0.0
	},
})

-- andesite into deep stone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:andesite",
	wherein         = {
		"default:stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -11117,
		octaves = 1,
		persist = 0.0
	},
})

-- basalt into deep stone, and greywacke
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:basalt",
	wherein         = {
		"default:stone",
		"aotearoa:greywacke",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -800317,
		octaves = 1,
		persist = 0.0
	},
})

-- limestone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:limestone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -2018,
		octaves = 1,
		persist = 0.0
	},
})

-- claystone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:claystone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 1996,
		octaves = 1,
		persist = 0.0
	},
})

-- siltstone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:siltstone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 1886,
		octaves = 1,
		persist = 0.0
	},
})

-- coquina into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:coquina_limestone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -1999,
		octaves = 1,
		persist = 0.0
	},
})


-- conglomerate into sandstone and andesite
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:conglomerate",
	wherein         = {
		"aotearoa:andesite",
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 21106,
		octaves = 1,
		persist = 0.0
	},
})

-- Volcanic sand
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:volcanic_sand",
	wherein         = {
		"aotearoa:andesite",
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 4,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.02,
		spread = {x = 5, y = 5, z = 5},
		seed = 868,
		octaves = 1,
		persist = 0.0
	},
})


-- Small bits of iron-sand in Volcanic sand
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:iron_sand",
	wherein         = {
		"aotearoa:volcanic_sand",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 2,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.01,
		spread = {x = 5, y = 5, z = 5},
		seed = 86811112,
		octaves = 1,
		persist = 0.2
	},
})

-- Small bits of scoria in Volcanic
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:scoria",
	wherein         = {
		"aotearoa:basalt",
		"aotearoa:andesite",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 3,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.01,
		spread = {x = 5, y = 5, z = 5},
		seed = 7701112,
		octaves = 1,
		persist = 0.2
	},
})

-----------------------------------------
--SPECIAL FEATURES & MINERALS
local mineral_scale = 0.03
local mineral_spread = {x = 40, y = 40, z = 40}
local mineral_oct = 3
local mineral_persist = 0.8

------------------------
--Iron Ore ...Limonite
-- NZ has very little apart from Iron sands. A bit of limonite in NW Nelson (Southern podo)
--not sure where it really ought to go... shall put it in sedimentary rocks..
--sandstone, conglomerate, clay/siltstone...
-- has to be spread around otherwise too rare

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:limonite",
	wherein         = {
		"default:sandstone",
		"default:silver_sandstone",
		"default:desert_sandstone",
		"aotearoa:conglomerate",
		"aotearoa:siltstone",
		"aotearoa:claystone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale,
		spread = mineral_spread,
		seed = 1184053,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})


----------------------
--Copper

--comes in many forms:
--chalcopyrite: most important. ..
--In andesite, granite(?),..various intusions into schist, greywacke,
--(other ores..  Malachite and a whole bunch of others...)

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:chalcopyrite",
	wherein         = {
		  "aotearoa:gneiss",
			"aotearoa:schist",
			"aotearoa:greywacke",
			"aotearoa:andesite",
			"aotearoa:granite",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale/2,
		spread = mineral_spread,
		seed = 1222243,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})


-------------------------
--Tin

--Cassiterite
-- with granite
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:cassiterite",
	wherein         = {
			"aotearoa:granite",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale,
		spread = mineral_spread,
		seed = 120013,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})

-------------------
-- West Coast Coal
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:coalblock",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale,
		spread = mineral_spread,
		seed = 7886,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})


--------------------
--Pounamu
--(technically jade, bowenite, and serpentine)

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:pounamu",
	wherein         = {
		"aotearoa:schist",
		"default:stone",
		"default:desert_stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 4,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale,
		spread = mineral_spread,
		seed = -7181,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})



--------------------------
--Coromandel/Otago Gold

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:quartz_with_gold",
	wherein         = {
		"aotearoa:andesite",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 3,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = mineral_scale,
		spread = mineral_spread,
		seed = -7444,
		octaves = mineral_oct,
		persist = mineral_persist
	},
	--biomes = {},
})


----------------------------------------------
--WEIRD STUFF...

--sinking mud holes in surface peat
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:mud_sinking",
	wherein         = {
		"aotearoa:restiad_peat",
		"aotearoa:forest_peat",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 3,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.6,
		spread = {x = 10, y = 10, z = 10},
		seed = 74331,
		octaves = 1,
		persist = 0.3
	},
	--biomes = {},
})


--air pockets.
--for rocks with lots of caves
minetest.register_ore({
	ore_type        = "blob",
	ore             = "air",
	wherein         = {
		"aotearoa:coquina_limestone",
		"aotearoa:limestone",
		"aotearoa:scoria",
		"aotearoa:basalt",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.6,
		spread = {x = 10, y = 10, z = 10},
		seed = -999931,
		octaves = 2,
		persist = 0.9
	},
	--biomes = {},
})
