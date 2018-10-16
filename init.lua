


-- Definitions made by this mod that other mods can use too
aotearoa = {}
aotearoa.path = minetest.get_modpath("aotearoa")


-- Load files
dofile(aotearoa.path .. "/functions.lua")
dofile(aotearoa.path .. "/blocks.lua")
dofile(aotearoa.path .. "/node_defs.lua")
dofile(aotearoa.path .. "/schematics.lua")
dofile(aotearoa.path .. "/mapgen.lua")
dofile(aotearoa.path .. "/trees.lua")
dofile(aotearoa.path .. "/crafting.lua")

--use sounds if possible
if minetest.get_modpath("ambience") then
  dofile(aotearoa.path .. "/ambience.lua")
end



minetest.log("MOD: Aotearoa loaded")


----------------------

----------------------
--intro world creation (the geneaology of creation)
--seeds to make up for removing default sources
minetest.register_on_newplayer(function(player)
  local you = player:get_player_name()

  local inventory = player:get_inventory()
  inventory:add_item("main", "farming:seed_wheat 2")
  inventory:add_item("main", "farming:seed_cotton 2")
  inventory:add_item("main", "default:axe_stone")  
  minetest.sound_play("te_kore_whakapapa", {to_player = you, gain = 2})
end)

----------------------------------------
--custom groups:
--[[
soft_stone = 1
Soft rocks that can be dug with a shovel (like sandstone and other loosely consolidated sedimentary rocks),
 and are unusable for tools. Yet they are still good enough for furnaces etc
 (considering mud would be good enough for a furnace.)


]]
