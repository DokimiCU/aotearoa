
---------------------------------------------------------
--CRAFTS

--green_shovel
dofile(aotearoa.path .. "/green_shovel.lua")

-------------------------------------
--SUBSTITUTES
-- replacements for defualt veg that didn't make it here.

------------------------
--Paper

minetest.register_craft({
	output = 'default:paper',
	recipe = {
		{'aotearoa:kauri_grass', 'aotearoa:kauri_grass', 'aotearoa:kauri_grass'},
	}
})

minetest.register_craft({
	output = 'default:paper',
	recipe = {
		{'aotearoa:flax', 'aotearoa:flax', 'aotearoa:flax'},
	}
})


------------------------------
--- Dyes



--Orange Dye.
--Green Dye.
--Purple Dye.


--Tanekaha for tan?
--red ochre, drop from clay. Cook togive red Dye?


----------------
--White Dye
--Taioma. White, from burnt clay with shark oil.
minetest.register_craft({
	type = "cooking",
	output = "dye:white 4",
	recipe = "default:clay",
})

-------------
--Red Dye
--Kauri grass (technically the berries)
minetest.register_craft({
	type = "shapeless",
	output = "dye:red 4",
	recipe = {"aotearoa:kauri_grass"},
})




---------------------------
--Dyes from Tree soot. etc
--traditionally used for tattoos.
-- blues, browns, blacks... multiple colors for same species.
--
------------
--Blue Dye.
--from tree soot.

--from Kauri soot
minetest.register_craft({
	output = "dye:blue 4",
  recipe = {
    {'aotearoa:kauri_tree'},
    {'default:torch'},
  },
  replacements = {{"default:torch", "default:torch"}}
})

--from Rimu soot
minetest.register_craft({
	output = "dye:blue 4",
  recipe = {
    {'aotearoa:rimu_tree'},
    {'default:torch'},
  },
  replacements = {{"default:torch", "default:torch"}}
})

--------------
--Black Dye
--from Kahikatea soot
minetest.register_craft({
	output = "dye:black 4",
  recipe = {
    {'aotearoa:kahikatea_tree'},
    {'default:torch'},
  },
  replacements = {{"default:torch", "default:torch"}}
})

--Karo, but don't know how it is made.

--from mahoe (technically the berries)
minetest.register_craft({
	output = "dye:black 4",
  recipe = {
    {'aotearoa:mahoe_leaves'},
  },
})


------------
--Brown Dye.
--from tree soot.
--from Kahikatea soot
minetest.register_craft({
	output = "dye:brown 4",
  recipe = {
    {'aotearoa:miro_tree'},
    {'default:torch'},
  },
  replacements = {{"default:torch", "default:torch"}}
})


----------------
--Red Dye
-- by boiling kamahi
minetest.register_craft({
	type = "cooking",
	output = "dye:red 4",
	recipe = "aotearoa:kamahi_tree",
})


----------------
--Yellow Dye
-- by boiling Rangiora bark
minetest.register_craft({
	type = "cooking",
	output = "dye:yellow 4",
	recipe = "aotearoa:rangiora_tree",
})

--from kowhai flowers
minetest.register_craft({
	output = "dye:yellow 4",
  recipe = {
    {'aotearoa:kowhai_leaves'},
  },
})



--------------------------------------------
-- Fences
for i in ipairs(aotearoa.treelist) do
local treename			= aotearoa.treelist[i][1]
minetest.register_craft({
	output = "aotearoa:fence_"..treename.."_wood 4",
	recipe = {
		{"aotearoa:"..treename.."_wood", "group:stick", "aotearoa:"..treename.."_wood"},
		{"aotearoa:"..treename.."_wood", "group:stick", "aotearoa:"..treename.."_wood"},
	}
})
end







------------------------------------------------
--FOOD.

-------------
--Bracken Root
minetest.register_craftitem("aotearoa:cooked_bracken_root", {
	description = "Cooked Bracken Root",
	inventory_image = "aotearoa_cooked_bracken_root.png",
  on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_bracken_root",
	recipe = "aotearoa:bracken",
})


---------
---Raupo Root
minetest.register_craftitem("aotearoa:cooked_raupo_root", {
	description = "Cooked Raupo Root",
	inventory_image = "aotearoa_cooked_bracken_root.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_raupo_root",
	recipe = "aotearoa:raupo",
})

--------
--Cook karaka
minetest.register_craftitem("aotearoa:cooked_karaka_kernels", {
	description = "Cooked Karaka Kernels",
	inventory_image = "aotearoa_cooked_karaka_kernels.png",
  on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_karaka_kernels",
	recipe = "aotearoa:karaka_fruit",
})

----------
--Cook Tawa
minetest.register_craftitem("aotearoa:cooked_tawa_kernels", {
	description = "Cooked Tawa Kernels",
	inventory_image = "aotearoa_cooked_karaka_kernels.png",
  on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_tawa_kernels",
	recipe = "aotearoa:tawa_fruit",
})

---------------
--Fern fiddleheads
minetest.register_craftitem("aotearoa:cooked_fiddlehead", {
	description = "Cooked fiddlehead",
	inventory_image = "aotearoa_cooked_fiddlehead.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_fiddlehead",
	recipe = "aotearoa:mamaku_crown",
})

------------
--mamaku pith
minetest.register_craftitem("aotearoa:cooked_mamaku_pith", {
	description = "Cooked Mamaku Pith",
	inventory_image = "aotearoa_cooked_mamaku_pith.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_mamaku_pith",
	recipe = "aotearoa:mamaku_tree",
})

------------
--Cabbage tree root
minetest.register_craftitem("aotearoa:cooked_cabbage_tree_root", {
	description = "Cooked Cabbage Tree Root",
	inventory_image = "aotearoa_cooked_cabbage_tree_root.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_cabbage_tree_root",
	recipe = "aotearoa:cabbage_tree_tree",
})

--------------
--Cabbage tree shoots
minetest.register_craftitem("aotearoa:cooked_cabbage_tree_shoots", {
	description = "Cooked Cabbage Tree Shoots",
	inventory_image = "aotearoa_cooked_cabbage_tree_shoots.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_cabbage_tree_shoots",
	recipe = "aotearoa:cabbage_tree_crown",
})

------------
--Nikau shoots
minetest.register_craftitem("aotearoa:cooked_nikau_shoots", {
	description = "Cooked Nikau Shoots",
	inventory_image = "aotearoa_cooked_cabbage_tree_shoots.png",
  on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:cooked_nikau_shoots",
	recipe = "aotearoa:nikau_palm_skirt",
})


--------------------------------------------------
--SOME TRADTIONAL USES.


--woven bags/mats from pingao, flax, Kauri grass, cabbage_tree, nikau?


---------------------------------
--flax rope.
minetest.register_node("aotearoa:flax_rope", {
	description = "Flax Rope",
	drawtype = "signlike",
	tiles = {"aotearoa_flax_rope.png"},
	inventory_image = "aotearoa_flax_rope.png",
	wield_image = "aotearoa_flax_rope.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {snappy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_craft({
	output = "aotearoa:flax_rope 3",
  recipe = {
    {'aotearoa:flax'},
    {'aotearoa:flax'},
    {'aotearoa:flax'},
  },
})


-------------------------------
--ponga fence from Tree ferns
minetest.register_node('aotearoa:ponga_fence', {
	description = 'Ponga Fence',
	drawtype = "nodebox",
	node_box = {
		type = "connected",
		fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
		-- connect_bottom =
		connect_front = {{-1/4, -1/2, -1/2,  1/4, 1/2, -1/4}},
		connect_left = {{-1/2, -1/2, -1/4, -1/4, 1/2,  1/4}},
		connect_back = {{-1/4, -1/2,  1/4,  1/4, 1/2,  1/2}},
		connect_right = {{ 1/4, -1/2, -1/4,  1/2, 1/2,  1/4}},
	},
	connects_to = { "group:crumbly", "group:wood", "group:tree", "group:stone",'aotearoa:ponga_fence',},
	paramtype = "light",
  tiles = {
    "aotearoa_ponga_fence_top.png",
    "aotearoa_ponga_fence_top.png",
    "aotearoa_ponga_fence.png"
  },
	inventory_image = "aotearoa_ponga_fence.png",
	wield_image = "aotearoa_ponga_fence.png",
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'aotearoa:ponga_fence 3',
	recipe = {
		{'aotearoa:wheki_tree', 'aotearoa:wheki_tree', 'aotearoa:wheki_tree'},
		{'aotearoa:wheki_tree', 'aotearoa:wheki_tree', 'aotearoa:wheki_tree'},
		{'aotearoa:wheki_tree', 'aotearoa:wheki_tree', 'aotearoa:wheki_tree'},
	}
})

minetest.register_craft({
	output = 'aotearoa:ponga_fence 3',
	recipe = {
		{'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree'},
		{'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree'},
		{'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree', 'aotearoa:silver_fern_tree'},
	}
})

minetest.register_craft({
	output = 'aotearoa:ponga_fence 3',
	recipe = {
		{'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree'},
		{'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree'},
		{'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree', 'aotearoa:mamaku_tree'},
	}
})


minetest.register_craft({
	type = "fuel",
	recipe = "aotearoa:ponga_fence",
	burntime = 3,
})


-------------------------------------------
--SOILS.

--Peat as a Fuel source
minetest.register_craft({
	type = "fuel",
	recipe = "aotearoa:peat",
	burntime = 30,
})

--make dirt
minetest.register_craft({
	output = 'default:dirt 4',
	recipe = {
		{'group:sand', 'default:clay'},
		{'aotearoa:silt', 'aotearoa:peat'},
	}
})

minetest.register_craft({
	output = 'default:dirt 4',
	recipe = {
		{'group:sand', 'default:clay'},
		{'aotearoa:silt', 'aotearoa:rotten_wood'},
	}
})


----------------------------------------
--IRON SAND

--iron sand is famously difficult to smelt.
minetest.register_craft({
	type = 'cooking',
	output = 'default:iron_lump',
	recipe = 'aotearoa:iron_sand',
	cooktime = 30,
})


-----------------------------------
--LIMESTONE
--we have the materials so...
--Roman style concrete.

--lime source->crushed lime ->cook -> quicklime (-> hydrated lime) -> + volcanic sand + gravel -> concrete
-- need crushing stage to avoid conflicts with other crafts.
-- could drop slaking stage as makes it too complicted.
--needs some benefit to justify such a complicated process.
--its actual benefit cant be captured (e.g flexibility of form).
-- so...double number of blocks you get.
-- 3 staring blocks: lime source + vol. sand + gravel. = 6 concrete.

--lime sources to crushed lime
--to avoid recipe conflicts needs a little odd recipe... two steel crushers
minetest.register_craftitem("aotearoa:crushed_lime", {
	description = "Crushed Lime",
	inventory_image = "aotearoa_crushed_lime.png",
})

--4 shells = 1 limestone... doesn't fit the pattern...
--just force them to make coquina.

--from coquina
minetest.register_craft({
	output = "aotearoa:crushed_lime",
	recipe = {
		{'default:steel_ingot'},
    {'aotearoa:coquina_limestone'},
    {'default:steel_ingot'},
  },
  replacements = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"}
	}
})

--from limestone
minetest.register_craft({
	output = "aotearoa:crushed_lime",
  recipe = {
		{'default:steel_ingot'},
    {'aotearoa:limestone'},
    {'default:steel_ingot'},
  },
  replacements = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"}
	}
})

--cook to quicklime
minetest.register_craftitem("aotearoa:quicklime", {
	description = "Quicklime",
	inventory_image = "aotearoa_quicklime.png",
})

minetest.register_craft({
	type = "cooking",
	output = "aotearoa:quicklime",
	recipe = "aotearoa:crushed_lime",
})

--make concrete
minetest.register_craft({
	output = "aotearoa:concrete 6",
	recipe = {
		{"aotearoa:quicklime", "group:sand", "default:gravel"},
	}
})

------------------------------------------------
--ARTIFIICAL DIAMONDS...
-- because NZ has no diamonds
--slow.

minetest.register_craft({
	type = 'cooking',
	output = 'default:diamond',
	recipe = 'default:coalblock',
	cooktime = 360,
})


----------------------------------------------
--ARTIFICIAL MESE...
-- because... its ...mese
-- something hocus pocus!?
-- pounamu is the most mystical rock... so it can be transformed.

minetest.register_craft({
	output = 'default:mese',
	recipe = {
		{'aotearoa:granite', 'default:gold_ingot', 'aotearoa:gneiss'},
		{'default:copper_ingot', 'aotearoa:pounamu', 'default:steel_ingot'},
		{'aotearoa:andesite', 'default:tin_ingot', 'aotearoa:limestone'},
	}
})
