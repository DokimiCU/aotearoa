-------------------------------------------------------------------
--SPAWN PLANTS.
--Terrestrial non-schematic plants and decorations.


---------------------------------------------------------------
--DENSITIES.

--ground cover... scattered
local gc_fill = 0.01
local gc_fill_dense = gc_fill*10
local gc_fill_x_dense = gc_fill_dense*9
local gc_fill_rare = gc_fill/5

--ground cover... clumping
local gc_scale = 0.095
local gc_sc_dense = gc_scale*10
local gc_sc_rare = gc_scale/5
local gc_off = 0
local gc_spr = {x = 6, y = 6, z = 6}
local gc_spr2 = {x = 16, y = 16, z = 16}
local gc_oct = 2
local gc_pers = 0.7

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


---------------------------------------------------------------
--REGISTER
--{offset = gc_off,	scale = gc_sc_dense, spread = gc_spr,	seed = 88774, octaves = gc_oct, persist = gc_pers}

aotearoa.gc_deco_list = {
  --scoria boulders for volcanic_field
  {"aotearoa:scoria", {"aotearoa:scoria"}, nil, {"volcanic_field"},lowf_max/2,beach_min, {offset = gc_off,	scale = gc_scale, spread = gc_spr,	seed = 2009, octaves = gc_oct, persist = gc_pers}},
  --andesite boulders for subantarctic
  {"aotearoa:andesite", {"aotearoa:andesite", "default:dirt_with_grass"}, nil, {"subantarctic_shore","subantarctic_coast",},coastf_max,beach_min, {offset = gc_off,	scale = gc_scale, spread = gc_spr,	seed = 1109, octaves = gc_oct, persist = gc_pers}},
  --schist boulders for fellfield
  {"aotearoa:schist", {"aotearoa:schist",}, nil, {"fellfield",},alp_max,alp_min, {offset = gc_off,	scale = gc_scale, spread = gc_spr,	seed = 81209, octaves = gc_oct, persist = gc_pers}},
  --gravel for rocky places
  {"default:gravel", {"aotearoa:schist","aotearoa:andesite"}, nil, {"fellfield","subantarctic_shore"},alp_max,beach_min, {offset = gc_off,	scale = gc_scale, spread = gc_spr,	seed = 1100, octaves = gc_oct, persist = gc_pers}},

  --crown fern
  {"aotearoa:crown_fern", {"aotearoa:dirt_with_moss","default:dirt_with_rainforest_litter",}, gc_fill, {"mountain_beech_forest","kamahi_forest","muttonbird_scrub",},highf_max,coastf_min,},
  --dense crown fern
  {"aotearoa:crown_fern", {"aotearoa:dirt_with_beech_litter",}, gc_fill_dense, {"fiordland_forest","beech_forest",},lowf_max,lowf_min,},
  --rare kiokio
  {"aotearoa:kiokio", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dry_litter",}, gc_fill_rare, {"fernland","kauri_forest",},lowf_max,lowf_min,},
  -- kiokio
  {"aotearoa:kiokio", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_dry_litter","aotearoa:dirt_with_dark_litter",}, gc_fill, {"kamahi_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest",},lowf_max,lowf_min,},
  --coastal
  {"aotearoa:pohuehue", {"default:sand","aotearoa:iron_sand"}, nil, {"pohutukawa_dunes","sand_dunes", "iron_sand_dunes",},dune_max,beach_max, {offset = gc_off,	scale = gc_sc_dense, spread = gc_spr,	seed = 337121, octaves = gc_oct, persist = gc_pers}},
  {"aotearoa:wiwi", {"default:dirt_with_rainforest_litter","default:dirt_with_grass","default:sand","aotearoa:iron_sand", "default:gravel"}, gc_fill, {"muttonbird_scrub","coastal_scrub","pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "gravel_dunes"},lowf_max,beach_max,},
  {"aotearoa:flax", {"default:dirt_with_grass","default:dirt_with_rainforest_litter","default:sand","aotearoa:iron_sand", "default:gravel"}, gc_fill, {"fernland","coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "gravel_dunes"},lowf_max,beach_max,},
  {"aotearoa:pingao", {"default:sand", "aotearoa:iron_sand"}, gc_fill_dense, {"pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "sandy_beach","iron_sand_beach"},dune_max,beach_max -1,},
  {"aotearoa:spinifex", {"default:sand", "aotearoa:iron_sand"}, gc_fill_x_dense, {"pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "sandy_beach","iron_sand_beach"},dune_max,beach_max-1,},
  {"aotearoa:sea_rush", {"aotearoa:mud"}, gc_fill_x_dense, {"salt_marsh"},dune_max,dune_min,},
  --sparse bracken
  {"aotearoa:bracken", {"default:dirt_with_rainforest_litter"}, gc_fill_rare, {"pohutukawa_forest"},coastf_max,coastf_min +2,},
  --clumped bracken
  {"aotearoa:bracken", {"default:dirt_with_grass",}, nil, {"coastal_scrub",},lowf_max,coastf_min +2,{offset = gc_off,	scale = gc_scale, spread = gc_spr,	seed = 557864, octaves = gc_oct, persist = gc_pers}},
  --dense bracken
  {"aotearoa:bracken", {"default:dirt_with_rainforest_litter"}, gc_fill_x_dense, {"fernland",},lowf_max,lowf_min,},

  --"babies" palms etc.
  {"aotearoa:cabbage_tree_crown", {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass","default:dirt_with_rainforest_litter","default:sand","aotearoa:iron_sand", "default:gravel"}, gc_fill_rare, {"fernland","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","coastal_scrub","pohutukawa_forest","pohutukawa_dunes","sand_dunes", "iron_sand_dunes", "gravel_dunes"},lowf_max,beach_max,},
  {"aotearoa:nikau_palm_crown", {"aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","default:dirt_with_grass","default:dirt_with_rainforest_litter",}, gc_fill_rare, {"hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","coastal_scrub","pohutukawa_forest",},lowf_max,coastf_min +2},
  {"aotearoa:wheki_crown", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",}, gc_fill_rare, {"fernland","kamahi_forest","fiordland_forest","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {"aotearoa:mamaku_crown", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",}, gc_fill_rare, {"fernland","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  {"aotearoa:silver_fern_crown", {"default:dirt_with_rainforest_litter","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter",}, gc_fill_rare, {"fernland","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest",},lowf_max,lowf_min,},
  --alpine
  -- bristle_tussock
  {"aotearoa:bristle_tussock", {"aotearoa:schist","default:dirt_with_dry_grass","aotearoa:volcanic_sand",}, gc_fill, {"fellfield","mountain_tussock","rangipo_desert",},alp_max-2,highf_min,},

  --dense flax
  {"aotearoa:flax", {"aotearoa:restiad_peat","aotearoa:forest_peat","default:dirt_with_dry_grass",}, gc_fill_dense, {"fen","kahikatea_swamp","coastal_tussock",},lowf_max,coastf_min,},
  --dense kauri_grass
  {"aotearoa:kauri_grass", {"aotearoa:dirt_with_dry_litter",}, gc_fill_dense, {"kauri_forest",},lowf_max,lowf_min,},

  --dense red tussock
  {"aotearoa:red_tussock", {"default:dirt_with_dry_grass",}, gc_fill_x_dense, {"mountain_tussock","matagouri_scrub","coastal_tussock",},alp_max + 5,coastf_min,},
  --rotten stump
  {"aotearoa:rotten_wood", {"aotearoa:dirt_with_moss","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","aotearoa:restiad_peat","aotearoa:gumland_soil","aotearoa:forest_peat","default:dirt_with_rainforest_litter",},gc_fill_rare,{"mountain_beech_forest","pahautea_forest","fernland","kamahi_forest","fiordland_forest","beech_forest","hinau_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","fen","gumland","kahikatea_swamp",},highf_max,coastf_min+2,},
  --stunted manuka
  {"aotearoa:manuka_leaves", {"aotearoa:gumland_soil",},nil,{"gumland",},lowf_max,lowf_min, {offset = gc_off,	scale = gc_sc_dense, spread = gc_spr2,	seed = 8787761, octaves = gc_oct, persist = 0.1}},
  --dense moss
  {"aotearoa:moss", {"aotearoa:dirt_with_beech_litter","aotearoa:restiad_peat","aotearoa:forest_peat","default:dirt_with_rainforest_litter","aotearoa:andesite", "aotearoa:dirt_with_moss"}, gc_fill_x_dense, {"alpine_peat_bog","mountain_beech_forest","pahautea_forest","kamahi_forest","fiordland_forest","peat_bog","kahikatea_swamp","muttonbird_scrub","subantarctic_shore","subantarctic_coast",},highf_max,beach_max,},
  --rare moss clumps
  {"aotearoa:moss", {"aotearoa:schist","default:dirt_with_dry_grass","aotearoa:dirt_with_beech_litter","aotearoa:dirt_with_dark_litter","aotearoa:dirt_with_dry_litter","aotearoa:restiad_peat","aotearoa:gumland_soil",},nil, {"fellfield","mountain_tussock","beech_forest","hinau_forest","southern_podocarp_forest","maire_forest","tawa_forest","northern_podocarp_forest","kauri_forest","gumland","fen",},alp_max,lowf_min,{offset = gc_off, scale =gc_scale, spread = gc_spr2,	seed = 8755361, octaves = gc_oct, persist = 0.7}},


}

for i in ipairs(aotearoa.gc_deco_list) do
  local deco     = aotearoa.gc_deco_list[i][1]
	local substrate = aotearoa.gc_deco_list[i][2]
	local density = aotearoa.gc_deco_list[i][3]
  local habitat = aotearoa.gc_deco_list[i][4]
  local max_alt = aotearoa.gc_deco_list[i][5]
  local min_alt = aotearoa.gc_deco_list[i][6]
  local noise = aotearoa.gc_deco_list[i][7]

  if density ~= nil then
    minetest.register_decoration({
    		deco_type = "simple",
    		place_on = substrate,
    		sidelen = 16,
    		fill_ratio = density,
    		biomes = habitat,
    		y_min = min_alt,
    		y_max = max_alt,
    		decoration = deco
    })
  else
    minetest.register_decoration({
    		deco_type = "simple",
    		place_on = substrate,
    		sidelen = 16,
    		noise_params = noise,
        biomes = habitat,
    		y_min = min_alt,
    		y_max = max_alt,
    		decoration = deco
    })
  end
end
