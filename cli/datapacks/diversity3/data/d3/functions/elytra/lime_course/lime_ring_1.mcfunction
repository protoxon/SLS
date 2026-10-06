####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 8 2019 / MARCH 10 2019
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
tag @s remove GreenRing
tag @s remove BlueRing
#tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add LimeRing

tag @s add LimeRing1

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -30 4 78 clay run setblock -30 4 78 lime_terracotta


# SWAPS RING
execute if block -1766 187 1827 polished_andesite run function d3:elytra/lime_course/calculate_lime_rings
fill -1770 179 1827 -1762 187 1827 lime_terracotta replace polished_andesite