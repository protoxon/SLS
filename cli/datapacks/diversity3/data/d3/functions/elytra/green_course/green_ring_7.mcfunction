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
tag @s remove OrangeRing
tag @s remove PurpleRing
#tag @s remove GreenRing
tag @s remove BlueRing
tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add GreenRing

tag @s add GreenRing7

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -28 10 78 clay run setblock -28 10 78 green_terracotta


# SWAPS RING
execute if block -2089 73 2025 polished_andesite run function d3:elytra/green_course/calculate_green_rings
fill -2093 65 2025 -2085 73 2025 green_terracotta replace polished_andesite