####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 7 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# GIVES FIREWORK
give @s[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]},nbt=!{Inventory:[{id:"minecraft:firework_rocket"}]}] firework_rocket

tag @s remove WhiteRing
tag @s remove YellowRing
#tag @s remove OrangeRing
tag @s remove PurpleRing
tag @s remove GreenRing
tag @s remove BlueRing
tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add OrangeRing

tag @s add OrangeRing3

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -24 6 78 clay run setblock -24 6 78 orange_terracotta


# SWAPS RING
execute if block -1812 155 2279 polished_andesite run function d3:elytra/orange_course/calculate_orange_rings
fill -1816 147 2279 -1808 155 2279 orange_terracotta replace polished_andesite