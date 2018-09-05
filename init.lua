


-- Definitions made by this mod that other mods can use too
aotearoa = {}
aotearoa.path = minetest.get_modpath("aotearoa")


-- Load files
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
