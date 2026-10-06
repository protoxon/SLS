####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#execute unless blocks -15 4 -63 15 34 -33 -7 45 -1015 all run say swamp not changed


# SAVES SPAWN ISLAND
setblock -16 2 -64 redstone_block
execute if block -16 2 -64 redstone_block run setblock -16 2 -64 clay


# SETS TO BRANCH LOCATION
execute unless blocks -15 4 -63 15 34 -33 -7 45 -1015 all run setblock -7 45 -1015 structure_block[mode=load]{name:"swamp_island",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block -7 45 -1015 structure_block run setblock -7 46 -1015 redstone_block destroy
execute if blocks -15 4 -63 15 34 -33 -7 45 -1015 all run setblock 12 11 -18 spruce_planks


# FOR TESTING
#execute if blocks -15 4 -63 15 34 -33 -7 45 -1015 all run say swamp changed