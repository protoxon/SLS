####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SurvivalButton
#scoreboard objectives setdisplay sidebar SurvivalAccess

# SURVIVAL ACCESS -> SKELETON GRINDER
difficulty easy

fill 79 72 992 103 82 1002 structure_void replace acacia_wood
fill 79 72 992 103 82 1002 air replace oak_stairs
execute if block 79 79 995 acacia_sapling[stage=1] run scoreboard objectives add SurvivalAccess dummy
execute if block 79 79 995 acacia_sapling[stage=1] run scoreboard players add @e[tag=MainHubAEC] SurvivalAccess 1
execute if block 79 79 995 acacia_sapling[stage=1] run fill 79 79 995 79 79 995 acacia_sapling[stage=0]

execute if entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal"}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] run function d3:hub/access_brown/replace_bone_meal
execute if entity @e[tag=RootGrowth] run function d3:hub/access_brown/grow_root

execute if entity @e[scores={SurvivalAccess=4}] run summon armor_stand 79 79 995 {Invulnerable:true,NoGravity:true,Invisible:true,Marker:true,Tags:["RootGrowth"]}
execute if entity @e[scores={SurvivalAccess=4}] run playsound block.chorus_flower.grow master @a 79 79 995 2 0.6 1