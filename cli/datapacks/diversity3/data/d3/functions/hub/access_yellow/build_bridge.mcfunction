####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# ARENA ACCESS -> TRIDENT TARGET
#execute if block -63 80 1048 oak_button[powered=true] run clone -64 1 0 -40 13 24 -56 73 1028
execute if block -63 80 1048 oak_button[powered=true] run setblock -64 80 1048 glowstone destroy
execute if block -63 80 1048 oak_button[powered=true] at @e[tag=TridentAEC] run playsound block.glass.break block @a
execute if block -63 80 1048 oak_button[powered=true] run setblock -63 80 1048 air
execute if block -64 80 1048 glowstone if block -55 73 1050 air run setblock -64 2 0 redstone_block
execute if block -64 80 1048 glowstone if block -55 73 1050 air run setblock -56 74 1028 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-1,posZ:0,integrity:1.0f, showair:0b,name:"arena_bridge",sizeX:25,sizeY:13,sizeZ:25,showboundingbox:1b}
execute if block -56 74 1028 structure_block at @e[tag=TridentAEC] run playsound item.trident.riptide_2 master @a
execute if block -56 74 1028 structure_block run setblock -56 73 1028 redstone_block
execute if block -56 74 1028 structure_block run fill -56 73 1028 -56 74 1028 air


# TOO LAZY TO FIX
execute if block -50 57 1024 chest run setblock -50 57 1024 air
execute if block 101 91 969 air run setblock 101 91 969 birch_leaves
execute if block 31 116 1033 air run setblock 31 116 1033 birch_leaves
