####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FIX SPAWN RED MUSHROOMS
fill 38 31 -44 40 32 -44 red_mushroom_block[up=false,down=false,south=false]
fill 38 31 -40 40 32 -40 red_mushroom_block[up=false,down=false,north=false]
fill 37 31 -43 37 32 -41 red_mushroom_block[up=false,down=false,east=false]
fill 41 31 -43 41 32 -41 red_mushroom_block[up=false,down=false,west=false]

fill 25 26 -46 23 27 -46 red_mushroom_block[up=false,down=false,south=false]
fill 23 26 -42 25 27 -42 red_mushroom_block[up=false,down=false,north=false]
fill 22 26 -45 22 27 -43 red_mushroom_block[up=false,down=false,east=false]
fill 26 26 -45 26 27 -43 red_mushroom_block[up=false,down=false,west=false]

fill 23 23 -38 25 24 -38 red_mushroom_block[up=false,down=false,south=false]
fill 23 23 -34 25 24 -34 red_mushroom_block[up=false,down=false,north=false]
fill 22 23 -37 22 24 -35 red_mushroom_block[up=false,down=false,east=false]
fill 26 23 -37 26 24 -35 red_mushroom_block[up=false,down=false,west=false]

# FOR TESTING
#execute unless blocks 17 4 -63 47 34 -33 -65 45 -1046 all run say mushroom not changed


# SAVES SPAWN ISLAND
setblock 16 2 -64 redstone_block
execute if block 16 2 -64 redstone_block run setblock 16 2 -64 clay


# SETS TO BRANCH LOCATION
execute unless blocks 17 4 -63 47 34 -33 -65 45 -1046 all run setblock -65 45 -1046 structure_block[mode=load]{name:"mushroom_island",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block -65 45 -1046 structure_block run setblock -65 46 -1046 redstone_block destroy
execute if blocks 17 4 -63 47 34 -33 -65 45 -1046 all run setblock 10 11 -18 red_mushroom_block


# FOR TESTING
#execute if blocks 17 4 -63 47 34 -33 -65 45 -1046 all run say mushroom changed