####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#execute unless blocks -15 38 -63 15 68 -33 -7 45 -1081 all run say plains not changed


# SAVES SPAWN ISLAND
setblock -16 36 -64 redstone_block
execute if block -16 36 -64 redstone_block run setblock -16 36 -64 clay


# SETS TO BRANCH LOCATION
execute unless blocks -15 38 -63 15 68 -33 -7 45 -1081 all run setblock -7 45 -1081 structure_block[mode=load]{name:"plains_island",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block -7 45 -1081 structure_block run setblock -7 46 -1081 redstone_block destroy
execute if blocks -15 38 -63 15 68 -33 -7 45 -1081 all run setblock 14 11 -18 grass_block


# FOR TESTING
#execute if blocks -15 38 -63 15 68 -33 -7 45 -1081 all run say plains changed