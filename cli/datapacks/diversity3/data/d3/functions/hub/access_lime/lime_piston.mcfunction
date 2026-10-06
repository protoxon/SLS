####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / SEPTEMBER 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


execute if entity @e[type=item,nbt={Item:{id:"minecraft:item_frame"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}}]

execute if block -24 84 986 stone run setblock -24 84 986 redstone_block
execute if block -24 87 986 bone_block unless entity @e[tag=TriviaBoneFrame] run summon item_frame -24 88 986 {Facing:1b,Invulnerable:0b,Silent:1b,Tags:["TriviaBoneFrame"]}