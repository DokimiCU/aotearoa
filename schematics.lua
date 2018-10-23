--------------------------------------------------
--Schematics
--for tree ferns, palms and similar


----------------------------------------
--TREE FERNS

------------------------------
--mamaku
local f1 = { name = "aotearoa:mamaku_tree" }
local f2 = { name = "aotearoa:mamaku_crown" }
aotearoa.mamaku1 = {
  size = {y = 10, x = 1, z = 1},
data = {
    f1, f1, f1,f1, f1, f1,f1, f1, f1, f2,
    },
  yslice_prob = {},
}

aotearoa.mamaku2 = {
  size = {y = 15, x = 1, z = 1},
data = {
    f1,f1,f1,f1,f1,f1,f1,f1,f1,f1,f1,f1,f1,f1,f2,
    },
  yslice_prob = {},
}


------------------------------
--silver_fern
local f3 = { name = "aotearoa:silver_fern_tree" }
local f4 = { name = "aotearoa:silver_fern_crown" }
aotearoa.silver_fern1 = {
  size = {y = 5, x = 1, z = 1},
data = {
    f3, f3, f3,f3, f4,
    },
  yslice_prob = {},
}

aotearoa.silver_fern2 = {
  size = {y = 8, x = 1, z = 1},
data = {
    f3,f3,f3,f3,f3,f3,f3,f4,
    },
  yslice_prob = {},
}


------------------------------
--wheki
local f5 = { name = "aotearoa:wheki_tree" }
local f6 = { name = "aotearoa:wheki_skirt" }
local f7 = { name = "aotearoa:wheki_crown" }
aotearoa.wheki1 = {
  size = {y = 5, x = 1, z = 1},
data = {
    f5, f5, f6,f6, f7,
    },
  yslice_prob = {},
}

aotearoa.wheki2 = {
  size = {y = 8, x = 1, z = 1},
data = {
    f5,f5,f5,f5,f6,f6,f6,f7,
    },
  yslice_prob = {},
}


----------------------------------------------
--PALMS etc

------------------------------
--Cabbage Tree
local p1 = { name = "aotearoa:cabbage_tree_tree" }
local p2 = { name = "aotearoa:cabbage_tree_crown" }
aotearoa.cabbage_tree1 = {
  size = {y = 6, x = 1, z = 1},
data = {
    p1, p1,p1, p1,p1, p2,
    },
  yslice_prob = {},
}

aotearoa.cabbage_tree2 = {
  size = {y = 9, x = 1, z = 1},
data = {
    p1, p1, p1,p1,p1,p1,p1,p1, p2,
    },
  yslice_prob = {},
}


--Nikau Palm
local p3 = { name = "aotearoa:nikau_palm_tree" }
local p4 = { name = "aotearoa:nikau_palm_skirt" }
local p5 = { name = "aotearoa:nikau_palm_crown" }
aotearoa.nikau_palm1 = {
  size = {y = 15, x = 1, z = 1},
data = {
    p3,p3,p3,p3,p3,p3,p3,p3,p3,p3,p3,p3,p3,p4,p5,
    },
  yslice_prob = {},
}

aotearoa.nikau_palm2 = {
  size = {y = 10, x = 1, z = 1},
data = {
    p3,p3,p3,p3,p3,p3,p3,p3,p4,p5,
    },
  yslice_prob = {},
}

--------------------------------------
--Rotten stump
local s1 = { name = "aotearoa:rotten_wood" }
aotearoa.stump1 = {
  size = {y = 3, x = 1, z = 1},
  data = {
    s1, s1, s1,
    },
  yslice_prob = {},
}

aotearoa.stump2 = {
  size = {y = 2, x = 1, z = 1},
data = {
      s1, s1,
    },
  yslice_prob = {},
}

-------------------------------
--Raupo
local r1 = { name = "aotearoa:raupo" }
local r2 = { name = "aotearoa:raupo_flower" }
aotearoa.raupo1 = {
  size = {y = 4, x = 1, z = 1},
  data = {
    r1, r1, r1, r2
    },
  yslice_prob = {},
}

aotearoa.raupo2 = {
  size = {y = 3, x = 1, z = 1},
data = {
      r1, r1, r2
    },
  yslice_prob = {},
}
