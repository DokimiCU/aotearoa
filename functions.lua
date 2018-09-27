

-----------------------
-- dig upwards
--

function aotearoa.dig_up(pos, nodes, digger)
	if digger == nil then
    return
  end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
  for p, v in pairs(nodes) do
    local nn = minetest.get_node(np)
    if nn.name == v then
      minetest.node_dig(np, nn, digger)
    end
  end
end
