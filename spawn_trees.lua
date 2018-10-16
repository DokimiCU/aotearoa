-------------------------------------------------------------------
--SPAWN TREES
--Terrestrial schematic plants and decorations.


---------------------------------------------------------------
--DENSITIES.

--canopy
local can_fill = 0.0039
local can_dense_fill = can_fill * 2
local can_x_dense_fill = can_fill * 3
local can_sparse_fill = can_fill/2
local can_rare_fill = can_fill/10

--sub-canopy
local scan_fill = 0.01
local scan_dense_fill = scan_fill * 2
local scan_x_dense_fill = scan_fill * 10
local scan_sparse_fill = scan_fill/4
local scan_rare_fill = scan_fill/10


-- clumping
local cl_spr = {x = 64, y = 64, z = 64}
local cl_spr2 = {x = 128, y = 128, z = 128}
local cl_oct = 2


-----------------------------------------------------------------
--ALTITUDES
--make sure matches mapgen file
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

--------------------------------------
--for forest/river edge spawn_by species
local edge_nodes = {"default:river_water_source",	"default:river_water_flowing", "default:gravel", "aotearoa:gravel_with_algae","aotearoa:river_sand","aotearoa:mud",}


---------------------------------------------------------------
--REGISTER SCHEMATIC DECORATIONS
--Need to arrange in size order (biggest/critical first)
--so when it overlaps nodes, it is the smaller one that loses

aotearoa.schem_deco_list = {
  --mudpools
  {aotearoa.path .. "/schematics/mud_pool1.mts", {"default:dirt_with_rainforest_litter","aotearoa:volcanic_sand",},nil,{"geothermal_scrub","white_island",},lowf_max/3,dune_min +1,{offset = 0,scale = 0.005,spread = cl_spr, seed = 128774, octaves = cl_oct, persist = 0.8}},
  {aotearoa.path .. "/schematics/mud_pool2.mts", {"default:dirt_with_rainforest_litter","aotearoa:volcanic_sand",},nil,{"geothermal_scrub","white_island",},lowf_max/3,dune_min +1,{offset = 0,scale = 0.005,spread = cl_spr, seed = 186674, octaves = cl_oct, persist = 0.8}},

  ---Emergents...
  --dense kahikatea
  {aotearoa.path .. "/schematics/kahikatea1.mts", {"aotearoa:forest_peat",},can_x_dense_fill,{"kahikatea_swamp",},lowf_max,coastf_min + 2,},
  {aotearoa.path .. "/schematics/kahikatea2.mts", {"aotearoa:forest_peat",},can_x_dense_fill,{"kahikatea_swamp",},lowf_max,coastf_min + 2,},
  --rare kahikatea
  {aotearoa.path .. "/schematics/kahikatea1.mts", {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"fiordland_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/kahikatea2.mts", {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"fiordland_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare miro
  {aotearoa.path .. "/schematics/miro1.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/miro2.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare rimu
  {aotearoa.path .. "/schematics/rimu1.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","fiordland_forest","beech_forest","hinau_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/rimu2.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","fiordland_forest","beech_forest","hinau_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare totara
  {aotearoa.path .. "/schematics/totara1.mts", {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/totara2.mts", {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},

  -- dense totara
  {aotearoa.path .. "/schematics/totara1.mts", {"aotearoa:dirt_with_dark_litter",},can_x_dense_fill,{"northern_podocarp_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/totara2.mts", {"aotearoa:dirt_with_dark_litter",},can_x_dense_fill,{"northern_podocarp_forest",},lowf_max,lowf_min,},
  --dense rimu
  {aotearoa.path .. "/schematics/rimu1.mts", {"aotearoa:dirt_with_dark_litter",},can_x_dense_fill,{"southern_podocarp_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/rimu2.mts", {"aotearoa:dirt_with_dark_litter",},can_x_dense_fill,{"southern_podocarp_forest",},lowf_max,lowf_min,},

  --kauri
  {aotearoa.path .. "/schematics/kauri1.mts", {"aotearoa:dirt_with_dry_litter",},can_fill,{"kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/kauri2.mts", {"aotearoa:dirt_with_dry_litter",},can_fill,{"kauri_forest",},lowf_max,lowf_min,},

  ----Canopy Trees....
  -- Tawa
  {aotearoa.path .. "/schematics/tawa1.mts", {"aotearoa:dirt_with_dry_litter",},can_fill,{"kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/tawa2.mts", {"aotearoa:dirt_with_dry_litter",},can_fill,{"kauri_forest",},lowf_max,lowf_min,},
  -- dense Tawa
  {aotearoa.path .. "/schematics/tawa1.mts", {"aotearoa:dirt_with_dark_litter",},can_dense_fill,{"tawa_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/tawa2.mts", {"aotearoa:dirt_with_dark_litter",},can_dense_fill,{"tawa_forest",},lowf_max,lowf_min,},
  --dense black_maire
  {aotearoa.path .. "/schematics/black_maire1.mts", {"aotearoa:dirt_with_dry_litter",},can_dense_fill,{"maire_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/black_maire2.mts", {"aotearoa:dirt_with_dry_litter",},can_dense_fill,{"maire_forest",},lowf_max,lowf_min,},
  --dense hinau
  {aotearoa.path .. "/schematics/hinau1.mts", {"aotearoa:dirt_with_dry_litter",},can_dense_fill,{"hinau_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/hinau2.mts", {"aotearoa:dirt_with_dry_litter",},can_dense_fill,{"hinau_forest",},lowf_max,lowf_min,},
  --dense black_beech
  {aotearoa.path .. "/schematics/black_beech1.mts", {"aotearoa:dirt_with_beech_litter",},can_dense_fill,{"beech_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/black_beech2.mts", {"aotearoa:dirt_with_beech_litter",},can_fill,{"beech_forest",},lowf_max,lowf_min,},
  --dense silver_beech
  {aotearoa.path .. "/schematics/silver_beech1.mts", {"aotearoa:dirt_with_beech_litter",},can_dense_fill,{"fiordland_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/silver_beech2.mts", {"aotearoa:dirt_with_beech_litter",},can_dense_fill,{"fiordland_forest",},lowf_max,lowf_min,},
  --dense pahautea
  {aotearoa.path .. "/schematics/pahautea1.mts", {"aotearoa:dirt_with_moss",},can_x_dense_fill,{"pahautea_forest",},highf_max,highf_min,},
  {aotearoa.path .. "/schematics/pahautea2.mts", {"aotearoa:dirt_with_moss",},can_x_dense_fill,{"pahautea_forest",},highf_max,highf_min,},
  --dense mountain_beech
  {aotearoa.path .. "/schematics/mountain_beech1.mts", {"aotearoa:dirt_with_moss",},scan_dense_fill,{"mountain_beech_forest",},highf_max,highf_min,},
  {aotearoa.path .. "/schematics/mountain_beech2.mts", {"aotearoa:dirt_with_moss",},scan_dense_fill,{"mountain_beech_forest",},highf_max,highf_min,},


  -- rare Tawa
  {aotearoa.path .. "/schematics/tawa1.mts", {"aotearoa:dirt_with_dry_litter",},can_rare_fill,{"maire_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/tawa2.mts", {"aotearoa:dirt_with_dry_litter",},can_rare_fill,{"maire_forest",},lowf_max,lowf_min,},
  -- rare black_beech
  {aotearoa.path .. "/schematics/black_beech1.mts", {"aotearoa:dirt_with_dry_litter",},can_rare_fill,{"hinau_forest","maire_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/black_beech2.mts", {"aotearoa:dirt_with_dry_litter",},can_rare_fill,{"hinau_forest","maire_forest",},lowf_max,lowf_min,},
  --rare hinau
  {aotearoa.path .. "/schematics/hinau1.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","beech_forest","maire_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/hinau2.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dry_litter",},can_rare_fill,{"kamahi_forest","beech_forest","maire_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare black_maire
  {aotearoa.path .. "/schematics/black_maire1.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter",},can_rare_fill,{"kamahi_forest","hinau_forest","tawa_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/black_maire2.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter",},can_rare_fill,{"kamahi_forest","hinau_forest","tawa_forest",},lowf_max,lowf_min,},
  --rare silver_beech
  {aotearoa.path .. "/schematics/silver_beech1.mts", {"aotearoa:dirt_with_moss",},can_rare_fill,{"mountain_beech_forest","kamahi_forest",},highf_max,lowf_min,},
  {aotearoa.path .. "/schematics/silver_beech2.mts", {"aotearoa:dirt_with_moss",},can_rare_fill,{"mountain_beech_forest","kamahi_forest",},highf_max,lowf_min,},
  --rare mountain_beech
  {aotearoa.path .. "/schematics/mountain_beech1.mts", {"aotearoa:dirt_with_moss",},can_rare_fill,{"kamahi_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/mountain_beech2.mts", {"aotearoa:dirt_with_moss",},can_rare_fill,{"kamahi_forest",},lowf_max,lowf_min,},


  ---Smaller Trees...
  --kowhai by streams etc
  {aotearoa.path .. "/schematics/kowhai1.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass",},can_dense_fill,{"broadleaf_scrub","geothermal_scrub","beech_forest","hinau_forest","maire_forest","tawa_forest","kauri_forest","coastal_scrub",},lowf_max,coastf_min+3,nil,edge_nodes,2},
  {aotearoa.path .. "/schematics/kowhai2.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass",},can_dense_fill,{"broadleaf_scrub","geothermal_scrub","beech_forest","hinau_forest","maire_forest","tawa_forest","kauri_forest","coastal_scrub",},lowf_max,coastf_min+3,nil,edge_nodes,2},
  --rare karaka.
  {aotearoa.path .. "/schematics/karaka1.mts", {"default:dirt_with_rainforest_litter",},can_rare_fill,{"pohutukawa_forest",},coastf_max,coastf_min+2,},
  {aotearoa.path .. "/schematics/karaka2.mts", {"default:dirt_with_rainforest_litter",},can_rare_fill,{"pohutukawa_forest",},coastf_max,coastf_min+2,},
  --karaka groves.
  {aotearoa.path .. "/schematics/karaka1.mts", {"default:dirt_with_grass",},nil,{"coastal_scrub",},coastf_max,coastf_min+2,{offset = 0,scale = 0.004,spread = cl_spr, seed = 45254, octaves = cl_oct, persist = 0.8}},
  {aotearoa.path .. "/schematics/karaka2.mts", {"default:dirt_with_grass",},nil,{"coastal_scrub",},coastf_max,coastf_min+2,{offset = 0,scale = 0.004,spread = cl_spr, seed = 108761, octaves = cl_oct, persist = 0.8}},
  --rare kamahi.
  {aotearoa.path .. "/schematics/kamahi1.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter","default:dirt_with_rainforest_litter",},can_rare_fill,{"mountain_beech_forest","pahautea_forest","fiordland_forest","beech_forest","hinau_forest","maire_forest","tawa_forest","muttonbird_scrub",},highf_max-2,dune_max+3,},
  {aotearoa.path .. "/schematics/kamahi2.mts", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter","default:dirt_with_rainforest_litter",},can_rare_fill,{"mountain_beech_forest","pahautea_forest","fiordland_forest","beech_forest","hinau_forest","maire_forest","tawa_forest","muttonbird_scrub",},highf_max-2,dune_max+3,},
  --dense kamahi.
  {aotearoa.path .. "/schematics/kamahi1.mts", {"aotearoa:dirt_with_moss",},can_x_dense_fill,{"kamahi_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/kamahi2.mts", {"aotearoa:dirt_with_moss",},can_x_dense_fill,{"kamahi_forest",},lowf_max,lowf_min,},

  --Shrubs and Palms etc...
  --tree common_tree_daisy clumps.
  {aotearoa.path .. "/schematics/common_tree_daisy1.mts", {"default:dirt_with_rainforest_litter",},nil,{"muttonbird_scrub",},coastf_max,coastf_min,{offset = 0,scale = 0.07,spread = cl_spr, seed = 1641230, octaves = cl_oct, persist = 0.7}},
  {aotearoa.path .. "/schematics/common_tree_daisy2.mts", {"default:dirt_with_rainforest_litter",},nil,{"muttonbird_scrub",},coastf_max,coastf_min,{offset = 0,scale = 0.07,spread = cl_spr, seed = 3022605, octaves = cl_oct, persist = 0.7}},
  --nikau palm clump
  {aotearoa.nikau_palm1, {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass","default:dirt_with_rainforest_litter",},nil,{"maire_forest","tawa_forest","kauri_forest","coastal_scrub","pohutukawa_forest",},lowf_max,coastf_min +2,{offset = 0,scale = 0.005,spread = cl_spr, seed = 603507, octaves = cl_oct, persist = 0.7}},
  {aotearoa.nikau_palm2, {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass","default:dirt_with_rainforest_litter",},nil,{"maire_forest","tawa_forest","kauri_forest","coastal_scrub","pohutukawa_forest",},lowf_max,coastf_min +2,{offset = 0,scale = 0.005,spread = cl_spr, seed = 542122, octaves = cl_oct, persist = 0.7}},
  --cabbage tree clump
  {aotearoa.cabbage_tree1, {"aotearoa:forest_peat","default:dirt_with_grass","default:dirt_with_rainforest_litter","default:sand", "aotearoa:iron_sand",},nil,{"broadleaf_scrub","geothermal_scrub","kahikatea_swamp","coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes",},lowf_max,beach_max,{offset = 0,scale = 0.005,spread = cl_spr, seed = 60715, octaves = cl_oct, persist = 0.7}},
  {aotearoa.cabbage_tree2, {"aotearoa:forest_peat","default:dirt_with_grass","default:dirt_with_rainforest_litter","default:sand", "aotearoa:iron_sand",},nil,{"broadleaf_scrub", "geothermal_scrub","kahikatea_swamp","coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes",},lowf_max,beach_max,{offset = 0,scale = 0.005,spread = cl_spr, seed = 238412, octaves = cl_oct, persist = 0.7}},
  --rare nikau palm
  {aotearoa.nikau_palm1, {"aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter","default:dirt_with_dry_grass",},can_rare_fill,{"hinau_forest","southern_podocarp_forest","northern_podocarp_forest","coastal_tussock",},lowf_max,coastf_min +2,},
  {aotearoa.nikau_palm2, {"aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter","default:dirt_with_dry_grass",},can_rare_fill,{"hinau_forest","northern_podocarp_forest","southern_podocarp_forest","coastal_tussock",},lowf_max,coastf_min +2,},
  --rare cabbage tree
  {aotearoa.cabbage_tree1, {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_dry_grass",},can_rare_fill,{"hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","coastal_tussock",},lowf_max,coastf_min,},
  {aotearoa.cabbage_tree2, {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_dry_grass",},can_rare_fill,{"hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","coastal_tussock",},lowf_max,coastf_min,},


  --mamaku clump
  {aotearoa.mamaku1, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"broadleaf_scrub","geothermal_scrub","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 4588017, octaves = cl_oct, persist = 0.7}},
  {aotearoa.mamaku2, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"broadleaf_scrub","geothermal_scrub","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 8945192, octaves = cl_oct, persist = 0.7}},
  --silver_fern clump
  {aotearoa.silver_fern1, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 456687, octaves = cl_oct, persist = 0.7}},
  {aotearoa.silver_fern2, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 8966892, octaves = cl_oct, persist = 0.7}},
  --wheki clump
  {aotearoa.wheki2, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","kamahi_forest","fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 688807, octaves = cl_oct, persist = 0.7}},
  {aotearoa.wheki1, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},nil,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","kamahi_forest","fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,{offset = 0,scale = 0.005,spread = cl_spr, seed = 564592, octaves = cl_oct, persist = 0.7}},
  --dense wheki
  {aotearoa.wheki2, {"default:dirt_with_rainforest_litter",},scan_x_dense_fill,{"broadleaf_scrub",},lowf_max,lowf_min,},
  {aotearoa.wheki1, {"default:dirt_with_rainforest_litter",},scan_dense_fill,{"broadleaf_scrub",},lowf_max,lowf_min,},


  --rare pohutukawa on dunes.
  {aotearoa.path .. "/schematics/pohutukawa1.mts", {"default:sand",},can_rare_fill,{"pohutukawa_dunes",},dune_max,beach_max,},
  {aotearoa.path .. "/schematics/pohutukawa2.mts", {"default:sand",},can_rare_fill,{"pohutukawa_dunes",},dune_max,beach_max,},
  --pohutukawa forest
  {aotearoa.path .. "/schematics/pohutukawa1.mts", {"default:dirt_with_rainforest_litter",},can_sparse_fill,{"pohutukawa_forest",},coastf_max,coastf_min,},
  {aotearoa.path .. "/schematics/pohutukawa2.mts", {"default:dirt_with_rainforest_litter",},can_sparse_fill,{"pohutukawa_forest",},coastf_max,coastf_min,},
  --mahoe
  {aotearoa.path .. "/schematics/mahoe1.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_fill,{"broadleaf_scrub","hinau_forest","maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/mahoe2.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_fill,{"broadleaf_scrub","hinau_forest","maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare mahoe
  {aotearoa.path .. "/schematics/mahoe1.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_rare_fill,{"geothermal_scrub","kamahi_forest","beech_forest","southern_podocarp_forest","northern_podocarp_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/mahoe2.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_rare_fill,{"geothermal_scrub","kamahi_forest","beech_forest","southern_podocarp_forest","northern_podocarp_forest",},lowf_max,lowf_min,},

  --karo clumps.
  {aotearoa.path .. "/schematics/karo1.mts", {"default:dirt_with_grass","default:sand","aotearoa:iron_sand","default:gravel"},nil,{"coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "gravel_dunes"},coastf_max,beach_max,{offset = 0,scale = 0.01,spread = cl_spr, seed = 120140, octaves = cl_oct, persist = 0.7}},
  {aotearoa.path .. "/schematics/karo2.mts", {"default:dirt_with_grass","default:sand","aotearoa:iron_sand","default:gravel"},nil,{"coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "gravel_dunes"},coastf_max,beach_max,{offset = 0,scale = 0.01,spread = cl_spr, seed = 304525, octaves = cl_oct, persist = 0.7}},
  --manuka clumps.
  {aotearoa.path .. "/schematics/manuka1.mts", {"default:dirt_with_dry_grass", "default:dirt_with_grass",},nil,{"coastal_tussock","coastal_scrub",},lowf_max,coastf_min,{offset = 0,scale = 0.03,spread = cl_spr, seed = 1646630, octaves = cl_oct, persist = 0.8}},
  {aotearoa.path .. "/schematics/manuka2.mts", {"default:dirt_with_dry_grass", "default:dirt_with_grass",},nil,{"coastal_tussock","coastal_scrub",},lowf_max,coastf_min,{offset = 0,scale = 0.03,spread = cl_spr, seed = 3121165, octaves = cl_oct, persist = 0.8}},
  --rare manuka clump
  {aotearoa.path .. "/schematics/manuka1.mts", {"default:dirt_with_rainforest_litter","aotearoa:gumland_soil","aotearoa:restiad_peat"},nil,{"geothermal_scrub","gumland","fen",},lowf_max,lowf_min,{offset = 0,scale = 0.01,spread = cl_spr2, seed = 1622230, octaves = cl_oct, persist = 0.95}},
  {aotearoa.path .. "/schematics/manuka2.mts", {"default:dirt_with_rainforest_litter","aotearoa:gumland_soil","aotearoa:restiad_peat"},nil,{"geothermal_scrub","gumland","fen",},lowf_max,lowf_min,{offset = 0,scale = 0.01,spread = cl_spr2, seed = 1125565, octaves = cl_oct, persist = 0.95}},
  --karo subcanopy.
  {aotearoa.path .. "/schematics/karo1.mts", {"default:dirt_with_rainforest_litter",},scan_fill,{"pohutukawa_forest",},coastf_max,coastf_min,},
  {aotearoa.path .. "/schematics/karo2.mts", {"default:dirt_with_rainforest_litter",},scan_fill,{"pohutukawa_forest",},coastf_max,coastf_min,},
  --matagouri clumps.
  {aotearoa.path .. "/schematics/matagouri1.mts", {"default:dirt_with_dry_grass",},nil,{"matagouri_scrub","coastal_tussock",},lowf_max,coastf_min,{offset = 0,scale = 0.01,spread = cl_spr, seed = 761090, octaves = cl_oct, persist = 0.9}},
  {aotearoa.path .. "/schematics/matagouri2.mts", {"default:dirt_with_dry_grass",},nil,{"matagouri_scrub","coastal_tussock",},lowf_max,coastf_min,{offset = 0,scale = 0.01,spread = cl_spr, seed = 413475, octaves = cl_oct, persist = 0.9}},

  --rare rangiora
  {aotearoa.path .. "/schematics/rangiora1.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_rare_fill,{"geothermal_scrub","kamahi_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/rangiora2.mts", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_rare_fill,{"geothermal_scrub","kamahi_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  --rangiora
  {aotearoa.path .. "/schematics/rangiora1.mts", {"default:dirt_with_rainforest_litter",},scan_fill,{"broadleaf_scrub"},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/rangiora2.mts", {"default:dirt_with_rainforest_litter",},scan_fill,{"broadleaf_scrub"},lowf_max,lowf_min,},

  --kawakawa
  {aotearoa.path .. "/schematics/kawakawa1.mts", {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_fill,{"maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/kawakawa2.mts", {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",},scan_fill,{"maire_forest","tawa_forest","kauri_forest",},lowf_max,lowf_min,},
  --rare kawakawa
  {aotearoa.path .. "/schematics/kawakawa1.mts", {"aotearoa:dirt_with_dark_litter","default:dirt_with_rainforest_litter",},scan_rare_fill,{"northern_podocarp_forest","pohutukawa_forest",},lowf_max,coastf_min+2,},
  {aotearoa.path .. "/schematics/kawakawa2.mts", {"aotearoa:dirt_with_dark_litter","default:dirt_with_rainforest_litter",},scan_rare_fill,{"northern_podocarp_forest","pohutukawa_forest",},lowf_max,coastf_min+2,},
  --mangrove
  {aotearoa.path .. "/schematics/mangrove1.mts", {"aotearoa:mud_sinking", "aotearoa:mud"},nil,{"northern_estuary"},3,2,{offset = 0,scale = 0.078,spread = cl_spr, seed = 11712, octaves = cl_oct, persist = 0.35}},
  {aotearoa.path .. "/schematics/mangrove2.mts", {"aotearoa:mud_sinking", "aotearoa:mud"}, nil, {"northern_estuary"},3,2,{offset = 0,scale = 0.078,spread = cl_spr,seed = 15874, octaves = cl_oct,persist = 0.35}},

  --rare common_tree_daisy
  {aotearoa.path .. "/schematics/common_tree_daisy1.mts", {"aotearoa:dirt_with_moss",},scan_rare_fill,{"pahautea_forest",},highf_max,highf_min,},
  {aotearoa.path .. "/schematics/common_tree_daisy2.mts", {"aotearoa:dirt_with_moss",},scan_rare_fill,{"pahautea_forest",},highf_max,highf_min,},

  --Woody bushes....
  --dense leatherwood. muttonbird
  {aotearoa.path .. "/schematics/leatherwood1.mts", {"default:dirt_with_rainforest_litter",},scan_x_dense_fill,{"muttonbird_scrub",},coastf_max,coastf_min,},
  {aotearoa.path .. "/schematics/leatherwood2.mts", {"default:dirt_with_rainforest_litter",},scan_x_dense_fill,{"muttonbird_scrub",},coastf_max,coastf_min,},
  -- leatherwood. montane
  {aotearoa.path .. "/schematics/leatherwood1.mts", {"default:dirt_with_dry_grass","aotearoa:schist","aotearoa:dirt_with_moss",},scan_dense_fill,{"fellfield","mountain_tussock","pahautea_forest",},highf_max+2,highf_min +5,},
  {aotearoa.path .. "/schematics/leatherwood2.mts", {"default:dirt_with_dry_grass","aotearoa:schist","aotearoa:dirt_with_moss",},scan_dense_fill,{"fellfield","mountain_tussock","pahautea_forest",},highf_max+2,highf_min +5,},

  --sparse kokomuka
  {aotearoa.path .. "/schematics/kokomuka1.mts", {"default:dirt_with_dry_grass",},scan_sparse_fill,{"coastal_tussock",},coastf_max,coastf_min,},
  {aotearoa.path .. "/schematics/kokomuka2.mts", {"default:dirt_with_dry_grass",},scan_sparse_fill,{"coastal_tussock",},coastf_max,coastf_min,},


  --raupo
  {aotearoa.raupo1, {"aotearoa:mud_sinking",},0.7,{"raupo_swamp",},lowf_max/2,coastf_min+2,},
  {aotearoa.raupo2, {"aotearoa:mud_sinking",},0.7,{"raupo_swamp",},lowf_max/2,coastf_min+2,},
  --rotten stump
  {aotearoa.stump1, {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","aotearoa:restiad_peat","aotearoa:gumland_soil","aotearoa:forest_peat",},can_sparse_fill,{"fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","fen","gumland","kahikatea_swamp",},lowf_max,coastf_min+2,},
  {aotearoa.stump2, {"aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","aotearoa:restiad_peat","aotearoa:gumland_soil","aotearoa:forest_peat",},can_sparse_fill,{"fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","fen","gumland","kahikatea_swamp",},lowf_max,coastf_min+2,},
  --dense rotten stump
  {aotearoa.stump1, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss",},can_fill,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","mountain_beech_forest","pahautea_forest","kamahi_forest",},highf_max,lowf_min,},
  {aotearoa.stump2, {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss",},can_fill,{"manuka_scrub","broadleaf_scrub","geothermal_scrub","mountain_beech_forest","pahautea_forest","kamahi_forest",},highf_max,lowf_min,},
  --dense manuka
  {aotearoa.path .. "/schematics/manuka1.mts", {"default:dirt_with_rainforest_litter",},scan_x_dense_fill,{"manuka_scrub",},lowf_max,lowf_min,},
  {aotearoa.path .. "/schematics/manuka2.mts", {"default:dirt_with_rainforest_litter",},scan_x_dense_fill,{"manuka_scrub",},lowf_max,lowf_min,},

}

for i in ipairs(aotearoa.schem_deco_list) do
  local deco     = aotearoa.schem_deco_list[i][1]
	local substrate = aotearoa.schem_deco_list[i][2]
	local density = aotearoa.schem_deco_list[i][3]
  local habitat = aotearoa.schem_deco_list[i][4]
  local max_alt = aotearoa.schem_deco_list[i][5]
  local min_alt = aotearoa.schem_deco_list[i][6]
  local noise = aotearoa.schem_deco_list[i][7]
  local next_to = aotearoa.schem_deco_list[i][8]
  local next_to_num = aotearoa.schem_deco_list[i][9]

  --either uniformly spread, clumped, or spawned-by (not using noise.)
  if density ~= nil then
    if next_to then
      minetest.register_decoration({
          deco_type = "schematic",
          place_on = substrate,
          sidelen = 8,
          fill_ratio = density,
          biomes = habitat,
          y_min = min_alt,
          y_max = max_alt,
          schematic = deco,
          force_placement = false,
          flags = "place_center_x, place_center_z",
          rotation = "random",
          spawn_by = next_to,
          num_spawn_by = next_to_num,
      })
    else
      minetest.register_decoration({
      		deco_type = "schematic",
      		place_on = substrate,
      		sidelen = 8,
      		fill_ratio = density,
      		biomes = habitat,
          y_min = min_alt,
      		y_max = max_alt,
      		schematic = deco,
      		force_placement = false,
      		flags = "place_center_x, place_center_z",
      		rotation = "random",
      })
    end
  else
    minetest.register_decoration({
      deco_type = "schematic",
      place_on = substrate,
      sidelen = 8,
      noise_params = noise,
      biomes = habitat,
      y_min = min_alt,
      y_max = max_alt,
      schematic = deco,
      force_placement = false,
      flags = "place_center_x, place_center_z",
      rotation = "random",
    })
  end
end


----------------------------------------------------
