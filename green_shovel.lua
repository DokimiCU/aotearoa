--[[

	  green_shovel.lua

      This file is from "aotearoa_addons".
	  Made by parasite (Parasitoid at github), 2018

	  The purpose of this code is to add Green Shovel which allows you
	  to take the dirt in its original forms just like Crystal Shovel
	  does it in ethereal.

	  This code was taken from ethereal sources, then changed a little bit.

    And... then it was taken a again and changed just a little wee bit more.

	  Ethereal
	  https://notabug.org/TenPlus1/ethereal/src/master/crystal.lua
	  Copyright (c) 2016 TenPlus1
	  under the MIT Licence (see below)

--]]




  local old_handle_node_drops = minetest.handle_node_drops

  function minetest.handle_node_drops(pos, drops, digger)

		if digger:get_wielded_item():get_name() ~= "aotearoa:shovel_green" then
		return old_handle_node_drops(pos, drops, digger)

		end

		local nn = minetest.get_node(pos).name

		if minetest.get_item_group(nn, "crumbly") == 0 then
		return old_handle_node_drops(pos, drops, digger)

		end

	return old_handle_node_drops(pos, {ItemStack(nn)}, digger)
  end


  minetest.register_tool("aotearoa:shovel_green", {
  	description = "Green Shovel",
  	inventory_image = "aotearoa_shovel_green.png",
  	wield_image = "aotearoa_shovel_green.png^[transformR90",
  	tool_capabilities = {
  		full_punch_interval = 1.0,
  		max_drop_level=1,
  		groupcaps={
  			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
  		},
  		damage_groups = {fleshy=4},
  	},
  	sound = {breaks = "default_tool_breaks"},
  })

  -- a pounamu shovel blessed with rituals... makes as much sense as anything.
  -- must be things hard to get...or at least far apart
  --sand to polish the stone (volcanic so have to find it). kawakawa for the blessing. Rope (dyed, for attachment). Food as an offering.
  --maire is good wood for tools.. and another thing to hunt for.
 minetest.register_craft({
	output = "aotearoa:shovel_green",
	recipe = {
		{"aotearoa:kawakawa_leaves", "aotearoa:volcanic_sand", "aotearoa:kawakawa_leaves"},
		{"dye:red", "aotearoa:pounamu", "aotearoa:flax_rope"},
		{"aotearoa:cooked_mamaku_pith", "aotearoa:black_maire_wood", "aotearoa:cooked_nikau_shoots"},
	}
  })




--[[
    The MIT License (MIT)
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
--]]
