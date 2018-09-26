------------------------------
--Densities
--treeferns (and babies)
local tfern_fill = 0.0003
local bfern_fill = 0.0001
--ground fern fill (forest)
local gfern_fill = 0.01

--------------------------
--NON-LIVING... because they had to go somewhere.



--Boulders for  fellfield
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"aotearoa:schist",
							},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.1,
		spread = {x = 32, y = 32, z = 32},
		seed = 3128,
		octaves = 2,
		persist = 0.9
	},
	biomes = {
						"fellfield",
						},
	y_min = -10,
	y_max = 31000,
	decoration = "aotearoa:schist",
})


--Boulders for  subantarctic_shore
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"aotearoa:andesite",
							},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.1,
		spread = {x = 32, y = 32, z = 32},
		seed = 1109,
		octaves = 2,
		persist = 0.9
	},
	biomes = {
						"subantarctic_shore",
						},
	y_min = -10,
	y_max = 31000,
	decoration = "aotearoa:andesite",
})



--Gravel piles for rocky coasts and fellfield
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"aotearoa:schist",
							"aotearoa:andesite",
							"default:gravel",
							},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.1,
		spread = {x = 32, y = 32, z = 32},
		seed = 1100,
		octaves = 2,
		persist = 0.7
	},
	biomes = {
						"subantarctic_shore",
						"volcanic_isle_shore",
						"fellfield",
						},
	y_min = -10,
	y_max = 31000,
	decoration = "default:gravel",
})




-------------------------------
--COASTAL PLANTS

----------------------------
--Pingao
--sand binder
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:sand",
				"aotearoa:iron_sand"
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.3,
			spread = {x = 20, y = 20, z = 20},
			seed = 88774,
			octaves = 1,
			persist = 0.55
		},
		biomes = {
							"sandy_beach",
							"iron_sand_beach",
							"sand_dunes",
							"iron_sand_dunes",
						},
		y_min = 2,
		y_max = 7,
		decoration = "aotearoa:pingao"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})

--Spinifex
--sand binder
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:sand",
				"aotearoa:iron_sand"
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.3,
			spread = {x = 20, y = 20, z = 20},
			seed = 88774,
			octaves = 1,
			persist = 0.55
		},
		biomes = {
							"sandy_beach",
							"iron_sand_beach",
							"sand_dunes",
							"iron_sand_dunes",
						},
		y_min = 2,
		y_max = 7,
		decoration = "aotearoa:spinifex"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})


--Wiwi
--sand and swamp
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:dirt_with_grass",
				"aotearoa:forest_peat",
				"aotearoa:silt",
				"default:dirt_with_dry_grass",
				"default:dirt_with_rainforest_litter",
				"default:sand",
				"default:gravel",
				"aotearoa:iron_sand",
				"aotearoa:mud_sinking",
				"aotearoa:mud",
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.1,
			spread = {x = 250, y = 250, z = 250},
			seed = 86663,
			octaves = 2,
			persist = 0.9
		},
		biomes = {
							"northern_estuary",
							"pohutukawa_dunes",
							"sand_dunes",
							"iron_sand_dunes",
							"gravel_dunes",
							"coastal_scrub",
							"muttonbird_scrub",
							"kahikatea_swamp",
							"raupo_swamp",
						},
		y_min = 2,
		y_max = 700,
		decoration = "aotearoa:wiwi"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})


--Flax
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:dirt_with_grass",
				"aotearoa:forest_peat",
				"aotearoa:silt",
				"default:dirt_with_dry_grass",
				"default:dirt_with_rainforest_litter",
				"default:sand",
				"default:gravel",
				"aotearoa:iron_sand",
				"aotearoa:mud_sinking",
				"aotearoa:mud",
				},
		sidelen = 16,
		fill_ratio = 0.005,
		biomes = {
							"gravel_beach",
							"northern_estuary",
							"pohutukawa_dunes",
							"sand_dunes",
							"iron_sand_dunes",
							"gravel_dunes",
							"pohutukawa_forest",
							"coastal_scrub",
							"muttonbird_scrub",
							"coastal_tussock",
							"kahikatea_swamp",
							"gumland",
							"fernland",
							"raupo_swamp",
						},
		y_min = 3,
		y_max = 100,
		decoration = "aotearoa:flax"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})

--Pohuehue
--Back dune scrub, forms dense smothering tangles
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:dirt_with_dry_grass",
				"default:sand",
				"default:gravel",
				"aotearoa:iron_sand",
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.75,
			spread = {x = 50, y = 50, z = 50},
			seed = 337121,
			octaves = 2,
			persist = 0.95
		},
		biomes = {
							"pohutukawa_dunes",
							"sand_dunes",
							"iron_sand_dunes",
							"gravel_dunes",
						},
		y_min = 4,
		y_max = 30,
		decoration = "aotearoa:pohuehue"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})


	-------------------------------
	--COASTAL FOREST/SCRUB PLANTS
	-----------------------

--Bracken
--open land
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:dirt_with_grass",
				"default:dirt_with_rainforest_litter",
				"default:dirt_with_dry_grass",
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.1,
			spread = {x = 50, y = 50, z = 50},
			seed = 347823,
			octaves = 1,
			persist = 0.85
		},
		biomes = {
							"pohutukawa_forest",
							"coastal_scrub",
							"muttonbird_scrub",
							"fernland",
							"gumland",
						},
		y_min = 5,
		y_max = 500,
		decoration = "aotearoa:bracken"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})


--Leatherwood
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
				"default:dirt_with_rainforest_litter",
				"default:dirt_with_dry_grass",
				},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.9,
			spread = {x = 50, y = 50, z = 50},
			seed = 364578,
			octaves = 2,
			persist = 0.95
		},
		biomes = {
							"muttonbird_scrub",
							"mountain_tussock",
						},
		y_min = 5,
		y_max = 500,
		decoration = "aotearoa:leatherwood"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})

--Kokomuka
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"default:dirt_with_dry_grass",
						},
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {
		"coastal_tussock",
	},
	y_min = 5,
	y_max = 30,
	decoration = "aotearoa:kokomuka",
})

--Red Tussock
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"default:dirt_with_dry_grass",
						},
	sidelen = 16,
	fill_ratio = 0.9,
	biomes = {
		"coastal_tussock",
		"matagouri_scrub",
		"mountain_tussock",
	},
	y_min = 5,
	y_max = 1000,
	decoration = "aotearoa:red_tussock",
})


----------------------------------------------
--LOWLAND FOREST

--kauri_grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"aotearoa:dirt_with_dark_litter",
		"aotearoa:dirt_with_dry_litter",
						},
	sidelen = 16,
	fill_ratio = 0.08,
	biomes = {
		"kauri_forest",
	},
	y_min = 7,
	y_max = 100,
	decoration = "aotearoa:kauri_grass",
})

--Baby mamaku
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"aotearoa:dirt_with_dark_litter",
		"default:dirt_with_rainforest_litter",
		"default:dirt",
		"aotearoa:forest_peat",
		"aotearoa:dirt_with_moss",
		"aotearoa:dirt_with_dry_litter",
						},
	sidelen = 16,
	fill_ratio = bfern_fill,
	biomes = {
		"pohutukawa_forest",
		"kahikatea_swamp",
		"kauri_forest",
		"northern_podocarp_forest",
		"tawa_forest",
		"maire_forest",
		"southern_podocarp_forest",
		"hinau_forest",
		"fernland",
		"kamahi_forest",
	},
	y_min = 7,
	y_max = 100,
	decoration = "aotearoa:mamaku_crown",
})

--Baby silver_fern
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:dirt_with_grass",
		"aotearoa:dirt_with_dark_litter",
		"default:dirt_with_rainforest_litter",
		"aotearoa:dirt_with_beech_litter",
		"aotearoa:dirt_with_dry_litter",
						},
	sidelen = 16,
	fill_ratio = bfern_fill,
	biomes = {
		"coastal_scrub",
		"pohutukawa_forest",
		"kauri_forest",
		"northern_podocarp_forest",
		"tawa_forest",
		"maire_forest",
		"southern_podocarp_forest",
		"hinau_forest",
		"beech_forest",
		"fernland",
		"fiordland_forest",
	},
	y_min = 5,
	y_max = 100,
	decoration = "aotearoa:silver_fern_crown",
})


-- Baby wheki
minetest.register_decoration({
	deco_type = "simple",
	sidelen = 16,
	place_on = {
		"aotearoa:dirt_with_dark_litter",
		"default:dirt_with_rainforest_litter",
		"default:dirt_with_grass",
		"aotearoa:forest_peat",
		"default:dirt_with_dry_grass",
		"aotearoa:dirt_with_moss",
		"aotearoa:dirt_with_dry_litter",
	},
	y_min = 5,
	y_max = 100,
	fill_ratio = bfern_fill,
	biomes = {
		"coastal_scrub",
		"pohutukawa_forest",
		"muttonbird_scrub",
		"kahikatea_swamp",
		"kauri_forest",
		"northern_podocarp_forest",
		"tawa_forest",
		"maire_forest",
		"southern_podocarp_forest",
		"hinau_forest",
		"fernland",
		"gumland",
		"kamahi_forest",
	},
	decoration = "aotearoa:wheki_crown",
})


--kiokio
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:dirt_with_rainforest_litter",
		"aotearoa:forest_peat",
		"aotearoa:dirt_with_dark_litter",
		"aotearoa:dirt_with_moss",
		"aotearoa:dirt_with_dry_litter",
		"aotearoa:dirt_with_beech_litter",
						},
	sidelen = 16,
	fill_ratio = 0.03,
	biomes = {
		"muttonbird_scrub",
		"kahikatea_swamp",
		"kauri_forest",
		"northern_podocarp_forest",
		"tawa_forest",
		"maire_forest",
		"southern_podocarp_forest",
		"hinau_forest",
		"beech_forest",
		"fernland",
		"pahautea_forest",
		"kamahi_forest",
	},
	y_min = 7,
	y_max = 100,
	decoration = "aotearoa:kiokio",
})

--Crown Fern
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"aotearoa:dirt_with_beech_litter",
						},
	sidelen = 16,
	fill_ratio = 0.09,
	biomes = {
		"fiordland_forest",
		"beech_forest",
	},
	y_min = 7,
	y_max = 100,
	decoration = "aotearoa:crown_fern",
})

-----------------------------------------
--ALPINE


--Moss
-- in wet cold places
minetest.register_decoration({
		deco_type = "simple",
		place_on = {
			  "aotearoa:dirt_with_dark_litter",
				"aotearoa:dirt_with_beech_litter",
				"aotearoa:dirt_with_moss",
				"aotearoa:andesite",
				"aotearoa:granite",
				"aotearoa:schist",
				"aotearoa:gneiss",
				"default:gravel",
				"default:dirt_with_rainforest_litter",
				},
		sidelen = 16,
		fill_ratio = 0.9,
		biomes = {
							"fiordland_forest",
							"mountain_beech_forest",
							"subantarctic_shore",
							"subantarctic_coast",
							"muttonbird_scrub",
							"kamahi_forest",
							"pahautea_forest",
							"fellfield",
						},
		y_min = 2,
		y_max = 200,
		decoration = "aotearoa:moss"
		--spawn_by = "default:water_source",
		--num_spawn_by = 1,
	})



--bristle_tussock
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"default:dirt_with_dry_grass",
							"aotearoa:volcanic_sand",
							"aotearoa:schist",
							"default:stone",
							"default:gravel",
						},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {
		"mountain_tussock",
		"rangipo_desert",
		"fellfield"
	},
	y_min = 5,
	y_max = 31000,
	decoration = "aotearoa:bristle_tussock",
})



-----------------------------------------------
--DEFAULT

--grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {
								"default:dirt_with_rainforest_litter",
								"aotearoa:dirt_with_dark_litter",
								"default:dirt_with_grass",
								"aotearoa:dirt_with_moss",
								"aotearoa:dirt_with_beech_litter",
								"aotearoa:dirt_with_dry_litter",
								},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {
		 					"pohutukawa_forest",
							"coastal_scrub",
							"muttonbird_scrub",
							"kauri_forest",
							"northern_podocarp_forest",
							"tawa_forest",
							"maire_forest",
							"southern_podocarp_forest",
							"hinau_forest",
							"beech_forest",
							"fernland",
							"pahautea_forest",
							"subantarctic_coast",
							"kamahi_forest",
							"fiordland_forest",
							},
		y_min = 4,
		y_max = 31000,
		decoration = "default:grass_" .. length,
	})
end

--dry grass
local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {
								"default:gravel",
								"default:dirt_with_dry_grass",
								"default:dirt_with_rainforest_litter",
								"default:sand",
								"aotearoa:iron_sand",
								"default:dirt_with_grass",
							},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {
							"gravel_beach",
		 					"pohutukawa_dunes",
							"sand_dunes",
							"iron_sand_dunes",
							"gravel_dunes",
							"coastal_tussock",
							"gumland",
							"fernland",
							"matagouri_scrub",
							"mountain_tussock",
							"subantarctic_coast",
						},
		y_min = 4,
		y_max = 31000,
		decoration = "default:dry_grass_" .. length,
	})
end



-- Grasses

	register_grass_decoration(-0.03,  0.005,  5)
	register_grass_decoration(-0.015, 0.004, 4)
	register_grass_decoration(0,      0.003,  3)
	register_grass_decoration(0.015,  0.002, 2)
	register_grass_decoration(0.03,   0.001,  1)

	-- Dry grasses

	register_dry_grass_decoration(0.01, 0.003,  5)
	register_dry_grass_decoration(0.03, 0.002,  4)
	register_dry_grass_decoration(0.05, 0.001,  3)
	register_dry_grass_decoration(0.07, -0.001, 2)
	register_dry_grass_decoration(0.09, -0.003, 1)

	-- Junglegrass

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"default:dirt_with_rainforest_litter",
							"aotearoa:dirt_with_dark_litter",
							"default:dirt",
							"aotearoa:forest_peat",
							"aotearoa:dirt_with_moss",
							"aotearoa:dirt_with_beech_litter",
						},
	sidelen = 16,
	fill_ratio = 0.001,
	biomes = {
		"kauri_forest",
		"northern_podocarp_forest",
		"tawa_forest",
		"southern_podocarp_forest",
		"hinau_forest",
		"beech_forest",
		"pohutukawa_forest",
		"kahikatea_swamp",
		"fernland",
		"kamahi_forest",
		"fiordland_forest",
	},
	y_min = 16,
	y_max = 31000,
	decoration = "default:junglegrass",
})


	-- Dry shrub

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
							"default:gravel",
							"aotearoa:iron_sand",
							"default:sand",
							"default:dirt_with_dry_grass",
							"default:stone",
							"default:dirt_with_grass",
						},
	sidelen = 16,
	fill_ratio = 0.0005,
	biomes = {
						"gravel_beach",
	 					"pohutukawa_dunes",
						"iron_sand_beach",
						"sandy_beach",
						"sand_dunes",
						"iron_sand_dunes",
						"gravel_dunes",
						"gumland",
						"matagouri_scrub",
						"rocky_coast",
						"mountain_tussock",
						"subantarctic_coast",
					},
	y_min = 2,
	y_max = 31000,
	decoration = "default:dry_shrub",
})
