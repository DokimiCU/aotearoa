


--------------------------------
--TREE NODES
--all nodes (wood, leaves, stairs...)

--local sapling_time_tree =
--local sapling_time_shrub =
--local sapling_time_palm =


aotearoa.treelist = {
	{"mangrove", "Mangrove (Avicennia marina)", 2,},
	{"pohutukawa", "Pohutukawa (Metrosideros excelsa)", 3, "flower"},
	{"kauri", "Kauri (Agathis australis)", 2},
	{"karaka", "Karaka (Corynocarpus laevigatus)", 3, nil,"karaka_fruit", "Karaka Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, -5},
	{"rimu", "Rimu (Dacrydium cupressinum)", 3},
	{"totara", "Totara (Podocarpus totara)", 2},
	{"miro", "Miro (Prumnopitys ferruginea)", 2,nil, "miro_fruit", "Miro Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, 1},
	{"kahikatea", "Kahikatea (dacrycarpus dacrydioides)", 2},
  {"tawa", "Tawa (Beilschmiedia tawa)", 3,nil, "tawa_fruit", "Tawa Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, 1},
  {"black_beech", "Black Beech (Fuscospora solandri)", 2},
	{"kamahi", "Kamahi (Weinmannia racemosa)", 2, "flower"},
	{"mountain_beech", "Mountain Beech (Fuscospora cliffortioides)",2},
	{"pahautea", "Pahautea (Libocedrus bidwillii)",2},
	{"kowhai", "Kowhai (Sophora microphylla)", 3, "flower",},


}


for i in ipairs(aotearoa.treelist) do
	local treename = aotearoa.treelist[i][1]
	local treedesc = aotearoa.treelist[i][2]
	local decay = aotearoa.treelist[i][3]
	local type = aotearoa.treelist[i][4]
	local fruit = aotearoa.treelist[i][5]
	local fruitdesc = aotearoa.treelist[i][6]
	local selbox = aotearoa.treelist[i][7]
	local vscale = aotearoa.treelist[i][8]
	local foodvalue = aotearoa.treelist[i][9]

	-- player will get a sapling with 1/50 chance
	local droprarity = 50


		minetest.register_node("aotearoa:"..treename.."_tree", {
			description = treedesc.." Tree",
			tiles = {
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree.png"
			},
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
			on_place = minetest.rotate_node,
		})

		minetest.register_node("aotearoa:"..treename.."_wood", {
			description = treedesc.." Wood",
			tiles = {"aotearoa_"..treename.."_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = default.node_sound_wood_defaults(),
		})

		minetest.register_node("aotearoa:"..treename.."_sapling", {
			description = treedesc.." Sapling",
			drawtype = "plantlike",
			tiles = {"aotearoa_"..treename.."_sapling.png"},
			inventory_image = {"aotearoa_"..treename.."_sapling.png"},
			paramtype = "light",
			paramtype2 = "waving",
			walkable = false,
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
			},
			groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
			sounds = default.node_sound_defaults(),
			on_timer = function(pos,elapsed)
				aotearoa.grow_sapling(pos, treename)
			end,
			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end,
			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"aotearoa:"..treename.."_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

		})

		--put flowering in flower group
		local g = nil
		if type == "flower" then
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1, flower = 1}
		else
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1}
		end

		minetest.register_node("aotearoa:"..treename.."_leaves", {
			description = treedesc.." Leaves",
			drawtype = "allfaces_optional",
			tiles ={"aotearoa_"..treename.."_leaves.png" },
			paramtype = "light",
			is_ground_content = false,
			groups = g,
			sounds = default.node_sound_leaves_defaults(),

			drop = {
				max_items = 1,
				items = {
					{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
					{items = {"aotearoa:"..treename.."_leaves"} }
				}
			},
		})

	--stairs etc
	stairs.register_stair_and_slab(
		"aotearoa_"..treename.."_tree",
		"aotearoa:"..treename.."_tree",
		{snappy=1, choppy=2, oddly_breakable_by_hand=1, flammable=2 },
		{"aotearoa_"..treename.."_tree_top.png", "aotearoa_"..treename.."_tree_top.png", "aotearoa_"..treename.."_tree.png"
		},
		treedesc.." Tree Stair",
		treedesc.." Tree Slab",
		default.node_sound_wood_defaults()
	)

	stairs.register_stair_and_slab(
		"aotearoa_"..treename.."_wood",
		"aotearoa:"..treename.."_wood",
		{snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3},
		{"aotearoa_"..treename.."_wood.png" },
		treedesc.." Wood Stair",
		treedesc.." Wood Slab",
		default.node_sound_wood_defaults()
	)

	-- fence
	default.register_fence("aotearoa:fence_"..treename.."_wood", {
		description = treedesc.." Fence",
		texture = "aotearoa_"..treename.."_wood.png",
		material = "aotearoa:"..treename.."_wood",
		groups = {snappy=1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})


	minetest.register_craft({
	output = "aotearoa:"..treename.."_wood 4",
	recipe = {
		{"aotearoa:"..treename.."_tree"},
	}
	})

	local fruitname = nil
	if fruit then
		fruitname = "aotearoa:"..fruit
		minetest.register_node(fruitname, {
			description = fruitdesc,
			drawtype = "plantlike",
			tiles = { "aotearoa_"..fruit..".png" },
			inventory_image = "aotearoa_"..fruit..".png",
			wield_image = "aotearoa_"..fruit..".png",
			visual_scale = vscale,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			selection_box = {
				type = "fixed",
				fixed = selbox
				},
			groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay = 3, leafdecay_drop = 1},
			on_use = minetest.item_eat(foodvalue),
			sounds = default.node_sound_defaults(),
		})

		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves", fruitname},
		radius = decay,
		})

	else
		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves" },
		radius = decay,
		})
	end

end


--------------------------------
--SHRUB NODES
--small trees. Thin trunks. Craft into sticks rather than wood


aotearoa.shrublist = {
	{"karo", "Karo (Pittosporum crassifolium)", 2},
	{"kawakawa", "Kawakawa (Piper excelsum)", 2,nil, "kawakawa_fruit", "Kawakawa Fruit",{-0.2, -0.5, -0.2, 0.2, 0, 0.2},	0.8, 1},
	{"manuka", "Manuka (Leptospermum scoparium)", 2, "flower",},
	{"common_tree_daisy", "Common Tree Daisy (Olearia arborescens)", 2, "flower",},
	{"matagouri", "Matagouri (Discaria toumatou)", 2},
	{"mahoe", "Mahoe (Melicytus ramiflorus)", 2},
	{"rangiora", "Rangiora (Brachyglottis repanda)", 2, "flower"},



	--lemonwood
--karamu (coprosma)
--kanuka?


}


for i in ipairs(aotearoa.shrublist) do
	local treename = aotearoa.shrublist[i][1]
	local treedesc = aotearoa.shrublist[i][2]
	local decay = aotearoa.shrublist[i][3]
	local type = aotearoa.shrublist[i][4]
	local fruit = aotearoa.shrublist[i][5]
	local fruitdesc = aotearoa.shrublist[i][6]
	local selbox = aotearoa.shrublist[i][7]
	local vscale = aotearoa.shrublist[i][8]
	local foodvalue = aotearoa.shrublist[i][9]

	-- player will get a sapling with 1/40 chance
	-- player will get leaves only if he/she gets no saplings,
	-- this is because max_items is 1

	local droprarity = 30

	--(gives an odd lighting effect at night when near edges...but it's like glowworms!)
	local trunkbox = {-1/5, -1/2, -1/5, 1/5, 1/2, 1/5}


			minetest.register_node("aotearoa:"..treename.."_tree", {
			description = treedesc.." Tree",
			drawtype = "nodebox",
			tiles = {
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree.png"
			},
			node_box = {
				type = "fixed",
				fixed = trunkbox,
			},
			selection_box = {
				type = "fixed",
				fixed = trunkbox,
			},
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
		})

		minetest.register_node("aotearoa:"..treename.."_sapling", {
			description = treedesc.." Sapling",
			drawtype = "plantlike",
			tiles = {"aotearoa_"..treename.."_sapling.png"},
			inventory_image = {"aotearoa_"..treename.."_sapling.png"},
			paramtype = "light",
			paramtype2 = "waving",
			walkable = false,
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
			},
			groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
			sounds = default.node_sound_defaults(),
			on_timer = function(pos,elapsed)
				aotearoa.grow_shrub_sapling(pos, treename)
			end,
			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end,
			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"aotearoa:"..treename.."_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

		})

		--put flowering in flower group
		local g = nil
		if type == "flower" then
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1, flower = 1}
		else
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1}
		end

		minetest.register_node("aotearoa:"..treename.."_leaves", {
			description = treedesc.." Leaves",
			drawtype = "allfaces_optional",
			tiles ={"aotearoa_"..treename.."_leaves.png" },
			paramtype = "light",
			is_ground_content = false,
			walkable = false,
			groups = g,
			sounds = default.node_sound_leaves_defaults(),
			drop = {
				max_items = 1,
				items = {
					{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
					{items = {"aotearoa:"..treename.."_leaves"} }
				}
			},
		})


	minetest.register_craft({
	output = "default:stick 2",
	recipe = {
		{"aotearoa:"..treename.."_tree"},
	}
	})

	local fruitname = nil
	if fruit then
		fruitname = "aotearoa:"..fruit
		minetest.register_node(fruitname, {
			description = fruitdesc,
			drawtype = "plantlike",
			tiles = { "aotearoa_"..fruit..".png" },
			inventory_image = "aotearoa_"..fruit..".png",
			wield_image = "aotearoa_"..fruit..".png",
			visual_scale = vscale,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			selection_box = {
				type = "fixed",
				fixed = selbox
				},
			groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay = 3, leafdecay_drop = 1},
			on_use = minetest.item_eat(foodvalue),
			sounds = default.node_sound_defaults(),
		})

		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves", fruitname},
		radius = decay,
		})

	else
		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves" },
		radius = decay,
		})
	end

end


----------------------------------------------------------------------
--PLANT NODES
--ground cover plants

aotearoa.plantlist = {
	{"pingao", "Pingao (Ficinia spiralis)",nil,1, "dry_grass"},
	{"spinifex", "Spinifex (Spinifex sericeus)",nil,1, "dry_grass"},
	{"wiwi", "Wiwi (Ficinia nodosa)",nil,1, "grass", "firelike"},
	{"flax", "Flax (Phormium tenax)",nil,1.5, "flower",},
	{"bracken", "Bracken (Pteridium esculentum)",nil,1, "dry_grass","firelike"},
	{"red_tussock", "Red tussock (Chionochloa rubra)",nil,1, "dry_grass","firelike"},
	{"kiokio", "kiokio (Parablechnum novae-zelandiae)", nil,1,nil,"firelike"},
	{"bristle_tussock", "Bristle tussock (Rytidosperma setifolium)",nil,1, "dry_grass",},
	{"kauri_grass", "Kauri grass (Astelia trinervia)",nil,1,nil,"firelike"},
	{"raupo", "Raupo (Typha orientalis)",nil,1.5, "dry_grass","firelike"},

}


for i in ipairs(aotearoa.plantlist) do
	local plantname = aotearoa.plantlist[i][1]
	local plantdesc = aotearoa.plantlist[i][2]
	local selbox = aotearoa.plantlist[i][3]
	local vscale = aotearoa.plantlist[i][4]
	local type = aotearoa.plantlist[i][5]
	local draw = aotearoa.plantlist[i][6]

	if selbox == nil then
		selbox = {-0.4, -0.5, -0.4, 0.4, -0.2, 0.4}
	end

	local g = nil
	if type == "grass" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, grass = 1}
	elseif type == "dry_grass" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, dry_grass = 1}
	elseif type == "flower" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, flower = 1}
	else
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1}
	end




	minetest.register_node("aotearoa:"..plantname, {
		description = plantdesc,
		drawtype = draw or "plantlike",
		waving = 1,
		visual_scale = vscale,
		tiles = {"aotearoa_"..plantname..".png"},
		inventory_image = "aotearoa_"..plantname..".png",
		wield_image = "aotearoa_"..plantname..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = g,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = selbox,
		},
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "aotearoa:"..plantname,
		burntime = 1,
	})


end


------------------------------------------
--BUSHES
--single leaf block plants

aotearoa.bushlist = {
	{"pohuehue", "Pohuehue (Muehlenbeckia complexa)",},
	{"leatherwood", "Leatherwood (Olearia colensoi)",},
	{"kokomuka", "Kokomuka (Veronica elliptica)", "flower"},

}

for i in ipairs(aotearoa.bushlist) do
	local plantname = aotearoa.bushlist[i][1]
	local plantdesc = aotearoa.bushlist[i][2]
	local type = aotearoa.bushlist[i][3]

	--put flowering in flower group
	local g = nil
	if type == "flower" then
		g = {snappy = 3, flammable = 2, leaves = 1, flora = 1, flower = 1,}
	else
		g = {snappy = 3, flammable = 2, leaves = 1, flora = 1,}
	end

	minetest.register_node("aotearoa:"..plantname, {
		description = plantdesc,
		drawtype = "allfaces_optional",
		tiles = {"aotearoa_"..plantname..".png"},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, flammable = 2, leaves = 1},
		sounds = default.node_sound_leaves_defaults(),
	})

end


-------------------------------------------
--TREE FERNS & Palm style
-- Plant on a pole!

aotearoa.tfernlist = {
	{"mamaku", "Mamaku (Cyathea medullaris)", 3.5, "fern",},
	{"silver_fern", "Silver Fern (Cyathea dealbata)", 3, "fern"},
	{"wheki", "Wheki (Dicksonia squarrosa)", 2.5, "fern",nil,"skirt"},
	{"cabbage_tree", "Cabbage tree (Cordyline australis)", 1.8,},
	{"nikau_palm", "Nikau Palm (Rhopalostylis sapida)", 3.5,"",nil,"skirt"},


}

for i in ipairs(aotearoa.tfernlist) do
	local treename = aotearoa.tfernlist[i][1]
	local treedesc = aotearoa.tfernlist[i][2]
	local crownscale = aotearoa.tfernlist[i][3]
	local treetype = aotearoa.tfernlist[i][4]
	local crownbox = aotearoa.tfernlist[i][5]
	local skirt = aotearoa.tfernlist[i][6]


	-- player will get a sapling with 1/10 chance
	local droprarity = 3

	--(gives an odd lighting effect at night when near edges...but it's like glowworms!)
	local trunkbox = {-1/5, -1/2, -1/5, 1/5, 1/2, 1/5}
	--set a default selection box, for those that don't need special treatment
	if crownbox == nil then
		crownbox = {-7/16, -1/2, -7/16, 7/16, 0, 7/16}
	end

	--special treatment for treeferns
	--give ferns spores, no sticks, same tree top image
	local treetop_image = nil
	local sapimage = nil
	local sapdesc = nil
	local sapdraw = nil
	local sapbox = nil
	if treetype == "fern" then
		treetop_image = "aotearoa_tree_fern_top.png"
		sapimage = "aotearoa_tree_fern_spores.png"
		sapdesc = treedesc.." Spores"
		sapdraw = "nodebox"
		sapbox = {-0.5, -0.5, -0.5,  0.5, -0.48, 0.5}
	else
		treetop_image = "aotearoa_"..treename.."_tree_top.png"
		sapimage = "aotearoa_"..treename.."_sapling.png"
		sapdesc = treedesc.." Sapling"
		sapdraw = "plantlike"
		sapbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		--and while we are here...(ferns a useless stick!)
		minetest.register_craft({
			output = "default:stick 2",
			recipe = {
				{"aotearoa:"..treename.."_tree"},
			}
		})
	end


	-- trunk
	minetest.register_node("aotearoa:"..treename.."_tree", {
		description = treedesc,
		drawtype = "nodebox",
		tiles = {
			treetop_image,
			treetop_image,
			"aotearoa_"..treename.."_tree.png"
		},
		node_box = {
			type = "fixed",
			fixed = trunkbox,
		},
		selection_box = {
			type = "fixed",
			fixed = trunkbox,
		},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, attached_node=1,},
		sounds = default.node_sound_wood_defaults(),
	})


	minetest.register_node("aotearoa:"..treename.."_sapling", {
		description = sapdesc,
		drawtype = sapdraw,
		tiles = {sapimage},
		inventory_image = {sapimage},
		node_box = {
			type = "fixed",
			fixed = {sapbox,},
		},
		selection_box = {
			type = "fixed",
	        	fixed = {sapbox,},
    },
		paramtype = "light",
		paramtype2 = "waving",
		walkable = false,
		is_ground_content = true,
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
		sounds = default.node_sound_defaults(),
		on_timer = function(pos,elapsed)
			aotearoa.grow_tree_fern_sapling(pos, treename)
		end,
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
		"aotearoa:"..treename.."_sapling",
		-- minp, maxp to be checked, relative to sapling pos
		-- minp_relative.y = 1 because sapling pos has been checked
		{x = -2, y = 1, z = -2},
		{x = 2, y = 6, z = 2},
		-- maximum interval of interior volume check
		4)
	return itemstack
end,
	})


	-- tree fern crown
	minetest.register_node("aotearoa:"..treename.."_crown", {
		description = treedesc.. "Crown",
		drawtype = "plantlike",
		visual_scale = crownscale,
		paramtype = "light",
		tiles = {"aotearoa_"..treename.."_crown.png"},
		inventory_image = "aotearoa_"..treename.."_crown.png",
		walkable = false,
		groups = {snappy = 3, flammable = 2, leaves = 1, attached_node=1,},
		drop = {
			max_items = 1,
			items = {
				{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
				{items = {"aotearoa:"..treename.."_crown"} }
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = crownbox,
		},
	})

	--anything with a special top trunk (e.g. leaf skirts)
	if skirt == "skirt" then
		local drop_skirt = nil
		--get the trunk if fern
		if treetype == "fern" then
			drop_skirt = "aotearoa:"..treename.."_tree"
		else
			drop_skirt = "aotearoa:"..treename.."_skirt"
		end

		minetest.register_node("aotearoa:"..treename.."_skirt", {
			description = treedesc.. "Top",
			drawtype = "nodebox",
			tiles = {
				"aotearoa_"..treename.."_skirt_top.png",
				"aotearoa_"..treename.."_skirt_top.png",
				"aotearoa_"..treename.."_skirt.png"
			},
			node_box = {
				type = "fixed",
				fixed = {-1/3, -1/2, -1/3, 1/3, 1/2, 1/3},
			},
			selection_box = {
				type = "fixed",
				fixed = {-1/3, -1/2, -1/3, 1/3, 1/2, 1/3},
			},
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, attached_node=1},
			drop = drop_skirt,
			sounds = default.node_sound_wood_defaults(),
			--collapse tree when cut
			after_destruct = function(pos,oldnode)
				local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
				if node.name == "aotearoa:"..treename.."_tree" then
						minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
						--minetest.add_item(pos,"aotearoa:"..treename.."_tree")
				end
			end,
		})

	end

end


------------------------------------
--ODD BALLS
--Things that are just...mmmm.
