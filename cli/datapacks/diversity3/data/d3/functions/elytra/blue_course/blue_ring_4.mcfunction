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

tag @s add BlueRing4

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -31 7 78 clay run setblock -31 7 78 light_blue_terracotta


# SWAPS RING
execute if block -1999 144 1853 polished_andesite run function d3:elytra/blue_course/calculate_blue_rings
fill -1999 136 1849 -1999 144 1857 light_blue_terracotta replace polished_andesite