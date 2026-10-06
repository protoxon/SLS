####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 8 2019 / MARCH 11 2019
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
#tag @s remove BlueRing
tag @s remove LimeRing
tag @s remove BlackRing
tag @s remove BrownRing

tag @s add BlueRing

tag @s add BlueRing6

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -31 9 78 clay run setblock -31 9 78 light_blue_terracotta


# SWAPS RING
execute if block -2054 109 1838 polished_andesite run function d3:elytra/blue_course/calculate_blue_rings
fill -2058 101 1838 -2050 109 1838 light_blue_terracotta replace polished_andesite