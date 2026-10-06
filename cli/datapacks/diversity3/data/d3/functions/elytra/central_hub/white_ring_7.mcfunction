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

#tag @s remove WhiteRing
tag @s remove YellowRing
tag @s remove OrangeRing
tag @s remove PurpleRing
tag @s remove GreenRing
tag @s remove BlueRing
tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add WhiteRing

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -27 10 78 clay run setblock -27 10 78 white_terracotta


# SWAPS RING
execute if block -1803 184 1987 polished_andesite run function d3:elytra/central_hub/calculate_white_rings
fill -1803 176 1983 -1803 184 1991 white_terracotta replace polished_andesite