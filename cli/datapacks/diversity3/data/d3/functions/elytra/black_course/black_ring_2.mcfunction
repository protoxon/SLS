####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 9 2019 / MARCH 11 2019
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
tag @s remove LimeRing
#tag @s remove BlackRing
tag @s remove BrownRing

tag @s add BlackRing

tag @s add BlackRing2

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -29 5 78 clay run setblock -29 5 78 black_terracotta


# SWAPS RING
execute if block -1545 181 1909 polished_andesite run function d3:elytra/black_course/calculate_black_rings
fill -1545 173 1905 -1545 181 1913 black_terracotta replace polished_andesite