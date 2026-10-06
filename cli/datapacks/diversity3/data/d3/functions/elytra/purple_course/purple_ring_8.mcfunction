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

tag @s add PurpleRing8

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -25 11 78 clay run setblock -25 11 78 purple_terracotta


# SWAPS RING
execute if block -2073 105 2210 polished_andesite run function d3:elytra/purple_course/calculate_purple_rings
fill -2073 97 2206 -2073 105 2214 purple_terracotta replace polished_andesite