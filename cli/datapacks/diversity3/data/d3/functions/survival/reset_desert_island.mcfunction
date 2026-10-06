####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#execute unless blocks -47 4 -63 -17 34 -33 51 45 -1046 all run say desert not changed


# SAVES SPAWN ISLAND
setblock -48 2 -64 redstone_block
execute if block -48 2 -64 redstone_block run setblock -48 2 -64 clay


# SETS TO BRANCH LOCATION
execute unless blocks -47 4 -63 -17 34 -33 51 45 -1046 all run setblock 51 45 -1046 structure_block[mode=load]{name:"desert_island",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:31,sizeY:31,sizeZ:31}
execute if block 51 45 -1046 structure_block run setblock 51 46 -1046 redstone_block destroy
execute if blocks -47 4 -63 -17 34 -33 51 45 -1046 all run setblock 2 11 -18 sandstone


# FOR TESTING
#execute if blocks -47 4 -63 -17 34 -33 51 45 -1046 all run say desert changed