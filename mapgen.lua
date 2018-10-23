------------------------------
-- MAPGEN


minetest.clear_registered_biomes()
minetest.clear_registered_decorations()
--minetest.clear_registered_ores()


--Ores
dofile(aotearoa.path .. "/ores.lua")




------------------------------------------------------------
-- BIOMES


----------------------------------
--altitude splits

--basement
local basement_max = -400
local basement_min = -15000

--ocean
local ocean_max = -21
local ocean_min = basement_max - 2

------------
--beaches
local beach_max = 3
local beach_min = ocean_max -2
--dunes
local dune_max = 5
local dune_min = beach_max -2
--coastal forest etc
local coastf_max = 14
local coastf_min = dune_max -2
--lowland forest etc
local lowf_max = 80
local lowf_min = coastf_max -2
--highland forest etc
local highf_max = 120
local highf_min = lowf_max -2
--alpine
local alp_max = 140
local alp_min = highf_max -2
--high alpine
local high_alp_max = 31000
local high_alp_min = alp_max -2


------------
--temp and humidity
-- many here for re-use and access!

--basement rock
--greywacke
local gw_heat = 50
local gw_hum = 40
--schist
local sch_heat = 40
local sch_hum = 50
--gneiss
local gn_heat = 10
local gn_hum = 70
--granite
local gr_heat = 10
local gr_hum = 90


--Oceans
--kermadec_ocean
local kerm_o_heat = 120
local kerm_o_hum = 0
-- north_eastern_ocean.
local n_east_o_heat = 90
local n_east_o_hum = 50
-- west_coast_north_ocean.
local wc_nth_o_heat = 50
local wc_nth_o_hum = 85
-- east_coast_north ocean.
local ec_nth_o_heat = 50
local ec_nth_o_hum = 0
-- north_cook_straight
local n_cook_o_heat = 50
local n_cook_o_hum = 50
-- south_cook_straight
local s_cook_o_heat = 30
local s_cook_o_hum = 50
-- west_coast_south_ocean
local wc_sth_o_heat = 30
local wc_sth_o_hum = 100
-- east_coast_south_ocean
local ec_sth_o_heat = 15
local ec_sth_o_hum = 5
-- fiordland_ocean.
local fiord_o_heat = 0
local fiord_o_hum = 90
-- southern_ocean
local sth_o_heat = 20
local sth_o_hum = 70
-- subantarctic ocean.
local subant_o_heat = 0
local subant_o_hum = 100


--Shorelines...(from beach to dunes)
--Normal sandy
local sandy_temp = 50
local sandy_hum = 50
--shelly beach
local shelly_temp = 80
local shelly_hum = 40
--gravel beaches
local gravel_temp = 30
local gravel_hum = 10
--subantarctic_shore (bare rock)
local subantartic_temp = 0
local subantartic_hum = 100
--volcanic_isle_shore (bare rock and volcanic)
local volcanic_isle_temp = 120
local volcanic_isle_hum = 0
--volcanic_field (bare basaltic volcanism)
local volcanic_field_temp = 120
local volcanic_field_hum = 48
--iron sands
local iron_temp = 50
local iron_hum = 85
--estuary
local estuary_temp = 85
local estuary_hum = 100
--southern estuary
local sth_estuary_temp = 30
local sth_estuary_hum = 100
--salt marsh
local s_marsh_temp = 50
local s_marsh_hum = 95

--Coastal forest etc...
--(i.e warm, subtropical ..also Kauri, mangroves t,)
local pohutukawa_temp = 90
local pohutukawa_hum = 50
--coastal scrub
local c_scrub_temp = 50
local c_scrub_hum = 50
--muttonbird_scrub
local muttonbird_temp = 20
local muttonbird_hum = 70
--tussock (also higher alt tussock)
local tussock_temp = 15
local tussock_hum = 5

--kahikatea_swamp
local kahi_swamp_temp = 30
local kahi_swamp_hum = 100
--raupo_swamp
local raupo_swamp_temp = 50
local raupo_swamp_hum = 145
--gumland
local gumland_temp = 110
local gumland_hum = 85
--fen
local fen_temp = 90
local fen_hum = 110
--peat_bog
local peat_temp = 50
local peat_hum = 120

--lowland forests etc...
--kauri uses pohutukawa
--northern podocarp
local npodo_temp = 70
local npodo_hum = 50
--southern podocarp
local spodo_temp = 30
local spodo_hum = 50
--fiordland forest
local fiord_temp = 0
local fiord_hum = 90
--kamahi
local kamahi_temp = 35
local kamahi_hum = 100

--Shrublands...
--broadleaf_scrub
local bl_scrub_temp = 50
local bl_scrub_hum = 50
--geothermal_scrub
local geo_scrub_temp = 60
local geo_scrub_hum = -10
--manuka_scrub
local ma_scrub_temp = 50
local ma_scrub_hum = 0
--matagouri_scrub..use tussock

--Highlands...
--pahautea forest
local pahautea_temp = 90
local pahautea_hum = 70
--rangipo_desert
local rangipo_temp = 90
local rangipo_hum = 0
--mt_beech
local mt_beech_temp = 40
local mt_beech_hum = 70
--mountain_tussock
local mt_tussock_temp = 30
local mt_tussock_hum = 30
--scree
local scree_temp = 10
local scree_hum = 0
-- alpine peat bog
local alpine_peat_temp = 50
local alpine_peat_hum = 100


------------------------------------------------------
--MANTLE
-- these occassionally turn up in caves below basement rock level

--cold mantle
minetest.register_biome({
	name = "cold_mantle",
	--node_dust = "",
	node_top = "aotearoa:volcanic_sand",
	depth_top = 10,
	node_filler = "default:gravel",
	depth_filler = 3,
	--node_stone = "default:lava_source",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = -31000,
	y_max = basement_min + 6000,
	heat_point = 50,
	humidity_point = 50,
})


--wet mantle
minetest.register_biome({
	name = "wet_mantle",
	--node_dust = "",
	node_top = "aotearoa:boiling_mud_source",
	depth_top = 10,
	node_filler = "aotearoa:boiling_mud_source",
	depth_filler = 3,
	--node_stone = "default:lava_source",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = -31000,
	y_max = basement_min + 3000,
	heat_point = 60,
	humidity_point = 60,
})

--mantle
minetest.register_biome({
	name = "mantle",
	--node_dust = "default:lava_source",
	node_top = "default:lava_source",
	depth_top = 10,
	node_filler = "default:lava_source",
	depth_filler = 3,
	--node_stone = "default:lava_source",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = -31000,
	y_max = basement_min + 1500,
	heat_point = 70,
	humidity_point = 30,
})

--------------------------------------------------------------
--BASEMENT ROCKS

--greywacke_basement
minetest.register_biome({
	name = "greywacke_basement",
	--node_dust = "",
	node_top = "aotearoa:greywacke",
	depth_top = 5,
	node_filler = "aotearoa:greywacke",
	depth_filler = 5,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = basement_min,
	y_max = basement_max,
	heat_point = gw_heat,
	humidity_point = gw_hum,
})


--schist_basement
minetest.register_biome({
	name = "schist_basement",
	--node_dust = "",
	node_top = "aotearoa:schist",
	depth_top = 5,
	node_filler = "aotearoa:schist",
	depth_filler = 5,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = basement_min,
	y_max = basement_max,
	heat_point = sch_heat,
	humidity_point = sch_hum,
})


--gneiss_basement
minetest.register_biome({
	name = "gneiss_basement",
	--node_dust = "",
	node_top = "aotearoa:gneiss",
	depth_top = 5,
	node_filler = "aotearoa:gneiss",
	depth_filler = 5,
	node_stone = "aotearoa:gneiss",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = basement_min,
	y_max = basement_max,
	heat_point = gn_heat,
	humidity_point = gn_hum,
})



--granite_basement
minetest.register_biome({
	name = "granite_basement",
	--node_dust = "",
	node_top = "aotearoa:granite",
	depth_top = 5,
	node_filler = "aotearoa:granite",
	depth_filler = 5,
	node_stone = "aotearoa:granite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = basement_min,
	y_max = basement_max,
	heat_point = gr_heat,
	humidity_point = gr_hum,
})





------------------------------------------------------------
--MARINE
--this also controls the shallow rocks,

--kermadec_ocean
minetest.register_biome({
	name = "kermadec_ocean",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "aotearoa:andesite",
	depth_filler = 2,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = kerm_o_heat,
	humidity_point = kerm_o_hum,
})

--north_eastern_ocean
minetest.register_biome({
	name = "north_eastern_ocean",
	--node_dust = "",
	node_top = "aotearoa:mud_sinking",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 6,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = n_east_o_heat,
	humidity_point = n_east_o_hum,
})


--west_coast_north_ocean
minetest.register_biome({
	name = "west_coast_north_ocean",
	--node_dust = "",
	node_top = "aotearoa:iron_sand",
	depth_top = 1,
	node_filler = "aotearoa:iron_sand",
	depth_filler = 3,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = wc_nth_o_heat,
	humidity_point = wc_nth_o_hum,
})


--east_coast_north ocean
minetest.register_biome({
	name = "east_coast_north ocean",
	--node_dust = "",
	node_top = "aotearoa:mud_sinking",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = ec_nth_o_heat,
	humidity_point = ec_nth_o_hum,
})


--north_cook_straight
minetest.register_biome({
	name = "north_cook_straight",
	--node_dust = "",
	node_top = "aotearoa:mud",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 3,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = n_cook_o_heat,
	humidity_point = n_cook_o_hum,
})


--south_cook_straight
minetest.register_biome({
	name = "south_cook_straight",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = s_cook_o_heat,
	humidity_point = s_cook_o_hum,
})



--west_coast_south_ocean
minetest.register_biome({
	name = "west_coast_south_ocean",
	--node_dust = "",
	node_top = "aotearoa:mud",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 3,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = wc_sth_o_heat,
	humidity_point = wc_sth_o_hum,
})


--east_coast_south_ocean
minetest.register_biome({
	name = "east_coast_south_ocean",
	--node_dust = "",
	node_top = "aotearoa:mud_sinking",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 6,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = ec_sth_o_heat,
	humidity_point = ec_sth_o_hum,
})


--fiordland_ocean
minetest.register_biome({
	name = "fiordland_ocean",
	--node_dust = "",
	node_top = "aotearoa:mud",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 2,
	node_stone = "aotearoa:gneiss",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = fiord_o_heat,
	humidity_point = fiord_o_hum,
})



--southern_ocean
minetest.register_biome({
	name = "southern_ocean",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = sth_o_heat,
	humidity_point = sth_o_hum,
})



--subantarctic_ocean
minetest.register_biome({
	name = "subantarctic_ocean",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_stone = "aotearoa:granite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "default:river_water_source",
	y_min = ocean_min,
	y_max = ocean_max,
	heat_point = subant_o_heat,
	humidity_point = subant_o_hum,
})



----------------------------------------------------
--SEASHORE

--Sandy Beach.
minetest.register_biome({
	name = "sandy_beach",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
	depth_riverbed = 2,
	y_min = beach_min,
	y_max = beach_max,
	heat_point = sandy_temp,
	humidity_point = sandy_hum,
})

--Shelly Beach.
minetest.register_biome({
	name = "shelly_beach",
	--node_dust = "",
	node_top = "aotearoa:seashells",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
	depth_riverbed = 1,
	y_min = beach_min/5,
	y_max = beach_max,
	heat_point = shelly_temp,
	humidity_point = shelly_hum,
})

--Gravel Beach
minetest.register_biome({
	name = "gravel_beach",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
  y_min = beach_min,
	y_max = beach_max,
	heat_point = gravel_temp,
	humidity_point = gravel_hum,
})

--subantarctic_shore
minetest.register_biome({
	name = "subantarctic_shore",
	--node_dust = "default:snow",
	--node_top = "",
	--depth_top = 1,
	node_filler = "aotearoa:andesite",
	depth_filler = 4,
	node_stone = "aotearoa:granite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
  y_min = beach_min/2,
	y_max = beach_max,
	heat_point = subantartic_temp,
	humidity_point = subantartic_hum,
})

--volcanic_isle_shore
minetest.register_biome({
	name = "volcanic_isle_shore",
	--node_dust = "default:gravel",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
  y_min = beach_min,
	y_max = beach_max,
	heat_point = volcanic_isle_temp,
	humidity_point = volcanic_isle_hum,
})


--volcanic_field
minetest.register_biome({
	name = "volcanic_field",
	--node_dust = "default:gravel",
	node_top = "aotearoa:scoria",
	depth_top = 1,
	node_filler = "aotearoa:scoria",
	depth_filler = 8,
	node_stone = "aotearoa:basalt",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "aotearoa:basalt",
  node_riverbed = "aotearoa:basalt",
  depth_riverbed = 5,
  y_min = beach_min,
	y_max = lowf_max/2,
	heat_point = volcanic_field_temp,
	humidity_point = volcanic_field_hum,
})



--Iron sand
minetest.register_biome({
	name = "iron_sand_beach",
	--node_dust = "",
	node_top = "aotearoa:iron_sand",
	depth_top = 3,
	node_filler = "aotearoa:iron_sand",
	depth_filler = 3,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 1,
  y_min = beach_min,
	y_max = beach_max,
  heat_point = iron_temp,
	humidity_point = iron_hum,
})


--Northern Estuary
minetest.register_biome({
	name = "northern_estuary",
	--node_dust = "",
	node_top = "aotearoa:mud_sinking",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 10,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:mud",
  depth_riverbed = 5,
  y_min = beach_min,
	y_max = beach_max,
	heat_point = estuary_temp,
	humidity_point = estuary_hum,
})

--Southern Estuary
minetest.register_biome({
	name = "southern_estuary",
	--node_dust = "",
	node_top = "aotearoa:mud",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 5,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:mud",
  depth_riverbed = 1,
  y_min = beach_min,
	y_max = beach_max,
	heat_point = s_estuary_temp,
	humidity_point = s_estuary_hum,
})



---------------
--DUNELANDS


--Pohutukawa Dunes
minetest.register_biome({
	name = "pohutukawa_dunes",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 2,
	y_min = dune_min,
	y_max = dune_max,
	heat_point = pohutukawa_temp,
	humidity_point = pohutukawa_hum,
})


--Sand dunes
minetest.register_biome({
	name = "sand_dunes",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = dune_max,
  heat_point = sandy_temp,
	humidity_point = sandy_hum,
})


--Iron Sand dunes
minetest.register_biome({
	name = "iron_sand_dunes",
	--node_dust = "",
	node_top = "aotearoa:iron_sand",
	depth_top = 3,
	node_filler = "aotearoa:iron_sand",
	depth_filler = 3,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = dune_max,
	heat_point = iron_temp,
	humidity_point = iron_hum,
})


--Salt Marsh
minetest.register_biome({
	name = "salt_marsh",
	--node_dust = "",
	node_top = "aotearoa:mud",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:mud",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = dune_max,
	heat_point = s_marsh_temp,
	humidity_point = s_marsh_hum,
})

--Gravel dunes
minetest.register_biome({
	name = "gravel_dunes",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = dune_max,
  heat_point = gravel_temp,
	humidity_point = gravel_hum,
})


--subantarctic_coast
minetest.register_biome({
	name = "subantarctic_coast",
	node_dust = "default:snow",
	node_top = "aotearoa:dirt_with_moss",
	depth_top = 1,
	node_filler = "aotearoa:andesite",
	depth_filler = 4,
	node_stone = "aotearoa:granite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = coastf_max,
  heat_point = subantartic_temp,
	humidity_point = subantartic_hum,
})


--white_island (volcanic dunes)
minetest.register_biome({
	name = "white_island",
	--node_dust = "",
	node_top = "aotearoa:volcanic_sand",
	depth_top = 1,
	node_filler = "aotearoa:volcanic_sand",
	depth_filler = 5,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
  y_min = dune_min,
	y_max = lowf_max/2,
  heat_point = volcanic_isle_temp,
	humidity_point = volcanic_isle_hum,
})

------------------------------------------
-- COASTAL FORESTS

--Pohutukawa Forest
minetest.register_biome({
	name = "pohutukawa_forest",
	--node_dust = "",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 1,
	y_min = coastf_min,
	y_max = coastf_max,
	heat_point = pohutukawa_temp,
	humidity_point = pohutukawa_hum,
})


-- Coastal Scrub
minetest.register_biome({
	name = "coastal_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = coastf_min,
	y_max = lowf_max/4,
	heat_point = c_scrub_temp,
	humidity_point = c_scrub_hum,
})




--Muttonbird Scrub
minetest.register_biome({
	name = "muttonbird_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = coastf_min,
	y_max = coastf_max,
	heat_point = muttonbird_temp,
	humidity_point = muttonbird_hum,
})

--Coastal Tussock land
minetest.register_biome({
	name = "coastal_tussock",
	--node_dust = "",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "aotearoa:silt",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = coastf_min,
	y_max = coastf_max,
	heat_point = tussock_temp,
	humidity_point = tussock_hum,
})


------------------------------
--WETLANDS


--kahikatea_swamp
minetest.register_biome({
	name = "kahikatea_swamp",
	--node_dust = "",
	node_top = "aotearoa:forest_peat",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 6,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:river_sand",
  depth_riverbed = 1,
	y_min = coastf_min + 2,
	y_max = lowf_max/3,
	heat_point = kahi_swamp_temp,
	humidity_point = kahi_swamp_hum,
})


--raupo_swamp
minetest.register_biome({
	name = "raupo_swamp",
	--node_dust = "",
	node_top = "aotearoa:mud_sinking",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:mud",
  depth_riverbed = 1,
	y_min = coastf_min + 2,
	y_max = lowf_max/2,
	heat_point = raupo_swamp_temp,
	humidity_point = raupo_swamp_hum,
})



--gumland
minetest.register_biome({
	name = "gumland",
	--node_dust = "",
	node_top = "aotearoa:gumland_soil",
	depth_top = 1,
	node_filler = "aotearoa:gumland_hardpan",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:silt",
  depth_riverbed = 3,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = gumland_temp,
	humidity_point = gumland_hum,
})

--Fen
minetest.register_biome({
	name = "fen",
	--node_dust = "",
	node_top = "aotearoa:restiad_peat",
	depth_top = 1,
	node_filler = "aotearoa:mud",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:mud",
  depth_riverbed = 1,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = fen_temp,
	humidity_point = fen_hum,
})

--Peat bog
minetest.register_biome({
	name = "peat_bog",
	--node_dust = "",
	node_top = "aotearoa:restiad_peat",
	depth_top = 1,
	node_filler = "aotearoa:peat",
	depth_filler = 15,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:peat",
  depth_riverbed = 4,
	y_min = lowf_min,
	y_max = lowf_max/2,
	heat_point = peat_temp,
	humidity_point = peat_hum,
})


------------------------------------------
-- LOWLAND FORESTS

--kauri_forest
minetest.register_biome({
	name = "kauri_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dry_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = pohutukawa_temp,
	humidity_point = pohutukawa_hum,
})


--------------------------
--northern_podocarp
minetest.register_biome({
	name = "northern_podocarp_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dark_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max/2,
	heat_point = npodo_temp,
	humidity_point = npodo_hum,
})


--tawa_forest
minetest.register_biome({
	name = "tawa_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dark_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = npodo_temp,
	humidity_point = npodo_hum + 15,
})

--maire_forest
minetest.register_biome({
	name = "maire_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dry_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = npodo_temp,
	humidity_point = npodo_hum - 15,
})


-----------------
--southern_podocarp (lowland, mid-cold,)
minetest.register_biome({
	name = "southern_podocarp_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dark_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:grey_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max/2,
	heat_point = spodo_temp,
	humidity_point = spodo_hum,
})

--hinau (lowland, mid-cold,)
minetest.register_biome({
	name = "hinau_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_dry_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = spodo_temp,
	humidity_point = spodo_hum + 15,
})

--beech forest (lowland, mid-cold,)
minetest.register_biome({
	name = "beech_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_beech_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = spodo_temp,
	humidity_point = spodo_hum - 15,
})


-------------------
--Fiordland Forest
minetest.register_biome({
	name = "fiordland_forest",
	node_dust = "default:snow",
	node_top = "aotearoa:dirt_with_beech_litter",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_stone = "aotearoa:gneiss",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = fiord_temp,
	humidity_point = fiord_hum,
})




--kamahi forest.
minetest.register_biome({
	name = "kamahi_forest",
	--node_dust = "",
	node_top = "aotearoa:dirt_with_moss",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 3,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_max/2,
	y_max = lowf_max,
	heat_point = kamahi_temp,
	humidity_point = kamahi_hum,
})







------------------------------------
--SHRUBLANDS
--lowland

--broadleaf_scrub
minetest.register_biome({
	name = "broadleaf_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = (lowf_max/4) -4,
	y_max = lowf_max/2,
	heat_point = bl_scrub_temp,
	humidity_point = bl_scrub_hum,
})

--geothermal_scrub
minetest.register_biome({
	name = "geothermal_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max/3,
	heat_point = geo_scrub_temp,
	humidity_point = geo_scrub_hum,
})

--manuka_scrub
minetest.register_biome({
	name = "manuka_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 4,
	node_stone = "aotearoa:pale_sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 2,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = ma_scrub_temp,
	humidity_point = ma_scrub_hum,
})


--Matagouri scrub
minetest.register_biome({
	name = "matagouri_scrub",
	--node_dust = "",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = lowf_min,
	y_max = lowf_max,
	heat_point = tussock_temp,
	humidity_point = tussock_hum,
})



--------------------------------
--HIGHLAND


--pahautea_forest
minetest.register_biome({
	name = "pahautea_forest",
	node_dust = "default:snow",
	node_top = "aotearoa:dirt_with_moss",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = highf_min,
	y_max = highf_max,
	heat_point = pahautea_temp,
	humidity_point = pahautea_hum,
})


--rangipo_desert
minetest.register_biome({
	name = "rangipo_desert",
	--node_dust = "default:snow",
	node_top = "aotearoa:volcanic_sand",
	depth_top = 6,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:volcanic_sand",
  depth_riverbed = 3,
	y_min = highf_min + 12,
	y_max = highf_max,
	heat_point = rangipo_temp,
	humidity_point = rangipo_hum,
})


--mountain beech (alpine)
minetest.register_biome({
	name = "mountain_beech_forest",
	node_dust = "default:snow",
	node_top = "aotearoa:dirt_with_moss",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = highf_min,
	y_max = highf_max,
	heat_point = mt_beech_temp,
	humidity_point = mt_beech_hum,
})



--Mountain tussock
minetest.register_biome({
	name = "mountain_tussock",
	node_dust = "default:snow",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:clay",
	depth_filler = 2,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = highf_min,
	y_max = highf_max + 1,
	heat_point = mt_tussock_temp,
	humidity_point = mt_tussock_hum,
})


--peat bog
minetest.register_biome({
	name = "alpine_peat_bog",
	--node_dust = "",
	node_top = "aotearoa:restiad_peat",
	depth_top = 1,
	node_filler = "aotearoa:_peat",
	depth_filler = 6,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:peat",
  depth_riverbed = 3,
	y_min = highf_min,
	y_max = highf_max,
	heat_point = alpine_peat_temp,
	humidity_point = alpine_peat_hum,
})

--scree
minetest.register_biome({
	name = "scree",
	--node_dust = "",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "aotearoa:silt",
	depth_filler = 1,
	node_stone = "aotearoa:greywacke",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = highf_min,
	y_max = alp_max,
	heat_point = scree_temp,
	humidity_point = scree_hum,
})


----------------
--ALPINE
--on the way from forest to icy death



--fellfield
minetest.register_biome({
	name = "fellfield",
	node_dust = "default:snow",
	--node_top = "",
	--depth_top = 1,
	node_filler = "aotearoa:schist",
	depth_filler = 4,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = alp_min,
	y_max = alp_max,
	heat_point = 50,
	humidity_point = 50,
})





----------------
--HIGH ALPINE.
-- permanent snow and ice

--snow (..and ice...)
minetest.register_biome({
	name = "alpine_snow",
	node_dust = "default:snow",
	node_top = "default:snowblock",
	depth_top = 5,
	node_filler = "default:ice",
	depth_filler = 1,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:gravel_with_algae",
  depth_riverbed = 1,
	y_min = high_alp_min,
	y_max = high_alp_max,
	heat_point = 50,
	humidity_point = 50,
})

--glacier
minetest.register_biome({
	name = "glacier",
	node_dust = "default:snow",
	node_top = "default:ice",
	depth_top = 10,
	node_filler = "default:ice",
	depth_filler = 1,
	node_stone = "aotearoa:schist",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "default:ice",
  depth_riverbed = 1,
	y_min = alp_min + 4,
	y_max = high_alp_max,
	heat_point = 0,
	humidity_point = 100,
})


--volcano
minetest.register_biome({
	name = "volcano",
	node_dust = "default:snow",
	node_top = "aotearoa:volcanic_sand",
	depth_top = 2,
	node_filler = "default:gravel",
	depth_filler = 5,
	node_stone = "aotearoa:andesite",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
  node_river_water = "default:river_water_source",
  node_riverbed = "aotearoa:volcanic_sand",
  depth_riverbed = 3,
	y_min = alp_min,
	y_max = high_alp_max,
	heat_point = 100,
	humidity_point = 0,
})



--------------------------------


--Trees
dofile(aotearoa.path .. "/spawn_trees.lua")
--Plants
dofile(aotearoa.path .. "/spawn_plants.lua")
--aquatic
dofile(aotearoa.path .. "/spawn_aquatic.lua")
