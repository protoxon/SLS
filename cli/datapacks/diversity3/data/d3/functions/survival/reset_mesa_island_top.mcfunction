####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#execute unless blocks 17 35 -95 47 65 -65 -65 76 -984 all run say mesa top not changed


# SAVES SPAWN ISLAND
setblock 16 33 -96 redstone_block
execute if block 16 33 -96 redstone_block run setblock 16 33 -96 clay


# SETS TO BRANCH LOCATION
execute unless blocks 17 35 -95 47 65 -65 -65 76 -984 all run setblock -65 76 -984 structure_block[mode=load]{name:"mesa_island_top",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block -65 76 -984 structure_block run setblock -65 77 -984 redstone_block destroy
execute if blocks 17 35 -95 47 65 -65 -65 76 -984 all run setblock 8 13 -18 red_terracotta


# FOR TESTING
#execute if blocks 17 35 -95 47 65 -65 -65 76 -984 all run say mesa top changed