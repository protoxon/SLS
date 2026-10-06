####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#execute unless blocks -47 35 -95 -17 65 -65 51 76 -984 all run say jungle top not changed


# SAVES SPAWN ISLAND
setblock -48 33 -96 redstone_block
execute if block -48 33 -96 redstone_block run setblock -48 33 -96 clay


# SETS TO BRANCH LOCATION
execute unless blocks -47 35 -95 -17 65 -65 51 76 -984 all run setblock 51 76 -984 structure_block[mode=load]{name:"jungle_island_top",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block 51 76 -984 structure_block run setblock 51 77 -984 redstone_block destroy
execute if blocks -47 35 -95 -17 65 -65 51 76 -984 all run setblock 4 13 -18 jungle_wood


# FOR TESTING
#execute if blocks -47 35 -95 -17 65 -65 51 76 -984 all run say jungle top changed