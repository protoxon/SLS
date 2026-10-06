####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# BOSS ACCESS
fill 45 89 1040 45 89 1040 black_concrete replace orange_concrete

execute if block 43 84 1040 air run setblock -80 2 0 redstone_block
execute if block 43 84 1040 air run setblock -80 2 0 clay
execute if block 43 84 1040 air run setblock 43 89 1040 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-5,posZ:0,integrity:1.0f, showair:0b,name:"boss_bridge_1",sizeX:5,sizeY:6,sizeZ:16,showboundingbox:1b}
execute if block 43 84 1040 air run setblock 43 88 1040 redstone_block

execute if block 43 84 1056 air run setblock -80 2 16 redstone_block
execute if block 43 84 1056 air run setblock -80 2 16 clay
execute if block 43 84 1056 air run setblock 43 89 1056 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-5,posZ:0,integrity:1.0f, showair:0b,name:"boss_bridge_2",sizeX:5,sizeY:6,sizeZ:17,showboundingbox:1b}
execute if block 43 84 1056 air run setblock 43 88 1056 redstone_block