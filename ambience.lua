-------------------------------------
--For use with Tenplus1's Ambience api
--Mostly plays NZ birds songs

-----------------------------
--clear unsuitable sets

--have used desert stone differently... don't want coyotes.
ambience.del_set("desert")

--get rid of Euro/American fauna (e.g. wolves, crows)
ambience.del_set("night")
ambience.del_set("day")

--disable (and reorder) high up winds so it doesn't override alpine birds
ambience.del_set("high_up")





------------------
--boiling mud, geothermal

ambience.add_set("mud_pool", {
	frequency = 1000,
  nodes = {
    "aotearoa:boiling_mud_source",
    "aotearoa:boiling_mud_flowing",
  },
	sounds = {
		{name = "boiling_mud", length = 6}
	},
	sound_check = function(def)

		local n = (def.totals["aotearoa:boiling_mud_source"] or 0) +
			(def.totals["aotearoa:boiling_mud_flowing"] or 0)

    if n >= 1 then
			return "mud_pool"
		end
	end,
})

---------------------
-- tussock day
ambience.add_set("aotearoa_tussock_day", {
	frequency = 25,
  nodes = {
      "aotearoa:matagouri_leaves",
      "aotearoa:red_tussock"},
	sounds = {
    {name = "kea", length = 53},
    {name = "takahe", length = 28},
	},
	sound_check = function(def)

    local n = (
        (def.totals["aotearoa:matagouri_leaves"] or 0)
        + (def.totals["aotearoa:red_tussock"] or 0)
     )

		if (def.tod > 0.2 and def.tod < 0.8)
    and n > 6
    and def.pos.y > 40
    and def.pos.y < 500
    then
			return "aotearoa_tussock_day"
		end
	end,
})

------------------------
-- muttonbird day
ambience.add_set("aotearoa_muttonbird_day", {
	frequency = 30,
  nodes = {
      "aotearoa:common_tree_daisy_leaves",
			"aotearoa:common_tree_daisy_tree",
    },
	sounds = {
    {name = "shearwater", length = 25},
    {name = "yellow_eyed_penguin", length = 68},
	},
	sound_check = function(def)

    local n = (
        (def.totals["aotearoa:common_tree_daisy_leaves"] or 0)
				+ (def.totals["aotearoa:common_tree_daisy_tree"] or 0)
        + (def.totals["aotearoa:leatherwood"] or 0)
     )

		if (def.tod > 0.2 and def.tod < 0.8)
    and n > 10
    and def.pos.y > -1
    and def.pos.y < 20
    then
			return "aotearoa_muttonbird_day"
		end
	end,
})




-----------------------------
--NIGHT TIME

--Night in the forest
ambience.add_set("aotearoa_forest_night", {
	frequency = 40,
  nodes = {
    "default:dirt_with_grass",
    "default:dirt_with_rainforest_litter",
    "aotearoa:forest_peat",
		"aotearoa:gumland_soil",
    "aotearoa:restiad_peat",
    "aotearoa:dirt_with_dark_litter",
    "aotearoa:dirt_with_dry_litter",
    "aotearoa:dirt_with_moss",
    "aotearoa:dirt_with_beech_litter",
  },
	sounds = {
		{name = "morepork", length = 14, gain = 0.5},
		{name = "morepork", length = 14},
		{name = "male_kiwi", length = 19, gain = 0.5},
		{name = "female_kiwi", length = 18, gain = 0.5},
    {name = "kakapo", length = 135},

	},
	sound_check = function(def)
    local n = (
        (def.totals["default:dirt_with_grass"] or 0)
        + (def.totals["default:dirt_with_rainforest_litter"] or 0)
        + (def.totals["aotearoa:forest_peat"] or 0)
        + (def.totals["aotearoa:restiad_peat"] or 0)
        + (def.totals["aotearoa:dirt_with_dark_litter"] or 0)
        + (def.totals["aotearoa:dirt_with_moss"] or 0)
     )

		if (def.tod < 0.2 or def.tod > 0.8)
    and n > 10
    then
			return "aotearoa_forest_night"
		end
	end,
})

-----------------------------
--DAY TIME

--Bird Trees.
-- trees that attract fuit/nectar bird.
ambience.add_set("aotearoa_birdtrees_day", {
	frequency = 80,
  nodes = {
    "aotearoa:pohutukawa_leaves",
    "aotearoa:karaka_fruit",
    "aotearoa:rimu_leaves",
    "aotearoa:totara_leaves",
    "aotearoa:miro_fruit",
    "aotearoa:kahikatea_leaves",
    "aotearoa:tawa_fruit",
    "aotearoa:kowhai_leaves",
    "aotearoa:kawakawa_fruit",
    "aotearoa:mahoe_leaves",
    "aotearoa:flax",
    "aotearoa:cabbage_tree_crown",
    "aotearoa:nikau_palm_crown",
    "aotearoa:black_maire_leaves",
    "aotearoa:hinau_fruit",
  },
	sounds = {
		{name = "bellbirds", length = 181, gain = 1.1},
    {name = "tuis", length = 165, gain = 1},
    {name = "kokako", length = 59, gain = 1.1},
    {name = "parakeet", length = 14, gain = 1},
    {name = "si_kaka", length = 30, gain = 0.8},
    {name = "stichbird", length = 204, gain = 1},
    {name = "tuis2", length = 141, gain = 1},
    {name = "tuis3", length = 19, gain = 1},
    {name = "tuis4", length = 9, gain = 1},
	},
	sound_check = function(def)

    local n = (
        (def.totals["aotearoa:pohutukawa_leaves"] or 0)
        + (def.totals["aotearoa:karaka_fruit"] or 0)
        + (def.totals["aotearoa:rimu_leaves"] or 0)
        + (def.totals["aotearoa:totara_leaves"] or 0)
        + (def.totals["aotearoa:miro_fruit"] or 0)
        + (def.totals["aotearoa:kahikatea_leaves"] or 0)
        + (def.totals["aotearoa:tawa_fruit"] or 0)
        + (def.totals["aotearoa:kowhai_leaves"] or 0)
        + (def.totals["aotearoa:kawakawa_fruit"] or 0)
        + (def.totals["aotearoa:mahoe_leaves"] or 0)
        + (def.totals["aotearoa:flax"] or 0)
        + (def.totals["aotearoa:cabbage_tree_crown"] or 0)
        + (def.totals["aotearoa:nikau_palm_crown"] or 0)
     )

		if (def.tod > 0.2 and def.tod < 0.8)
    and n > 10
    then
			return "aotearoa_birdtrees_day"
		end
	end,
})

-- Insect birds
-- ground level birds. near soil,
ambience.add_set("aotearoa_insect_birds_day", {
	frequency = 70,
  nodes = {
    "default:dirt_with_grass",
    "default:dirt_with_dry_grass",
    "default:dirt_with_rainforest_litter",
    "aotearoa:forest_peat",
    "aotearoa:restiad_peat",
		"aotearoa:gumland_soil",
    "aotearoa:dirt_with_dark_litter",
    "aotearoa:dirt_with_dry_litter",
    "aotearoa:dirt_with_moss",
    "aotearoa:dirt_with_beech_litter",
  },
	sounds = {
    {name = "silvereye", length = 165},
    {name = "fantail1", length = 11},
    {name = "grey_warbler", length = 6},
    {name = "ni_robin", length = 12},
    {name = "si_robin", length = 75},
    {name = "cicada_kereru", length = 46, gain = 1.2},
    {name = "whitehead", length = 36, gain = 1},
	},
	sound_check = function(def)

    local n = (
        (def.totals["default:dirt_with_grass"] or 0)
        + (def.totals["default:dirt_with_dry_grass"] or 0)
        + (def.totals["default:dirt_with_rainforest_litter"] or 0)
        + (def.totals["aotearoa:forest_peat"] or 0)
        + (def.totals["aotearoa:restiad_peat"] or 0)
        + (def.totals["aotearoa:dirt_with_dark_litter"] or 0)
        + (def.totals["aotearoa:dirt_with_moss"] or 0)
     )

		if (def.tod > 0.2 and def.tod < 0.8)
    and n > 10
    then
			return "aotearoa_insect_birds_day"
		end
	end,
})




---------------------------
--Wind
ambience.add_set("aotearoa_high_up", {
	frequency = 40,
	nodes = {"default:snowblock"},
	sounds = {
		{name = "desertwind", length = 8},
		{name = "wind", length = 9},
	},
	sound_check = function(def)

		local c = (def.totals["default:snowblock"] or 0)

		if def.pos.y > 60
		or c > 150 then
			return "aotearoa_high_up"
		end
	end,
})
