####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 10 2019 / MARCH 22 2019
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
#tag @s remove PurpleRing
tag @s remove GreenRing
tag @s remove BlueRing
tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add PurpleRing

tag @s add PurpleRing6

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -25 9 78 clay run setblock -25 9 78 purple_terracotta


# SWAPS RING
execute if block -2245 100 2210 polished_andesite run function d3:elytra/purple_course/calculate_purple_rings
fill -2249 92 2210 -2241 100 2210 purple_terracotta replace polished_andesite