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
tag @s remove BlackRing
#tag @s remove BrownRing

tag @s add BrownRing

tag @s add BrownRing7

scoreboard players set @s[scores={RingSFX=0}] RingSFX 1

# SWAPS SPAWN BLOCK
execute if block -26 10 78 clay run setblock -26 10 78 brown_terracotta


# SWAPS RING
execute if block -850 67 2023 polished_andesite run function d3:elytra/brown_course/calculate_brown_rings
fill -850 59 2019 -850 67 2027 brown_terracotta replace polished_andesite