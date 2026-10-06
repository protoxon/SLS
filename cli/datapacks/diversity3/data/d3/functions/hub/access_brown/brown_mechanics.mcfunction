####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019 / AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SurvivalAccess

# SURVIVAL ACCESS -> SKELETON GRINDER
difficulty easy

execute as @e[type=skeleton,x=74,y=75,z=990,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.0d,2.0d,0.0d]}
execute at @e[tag=GrinderSkeleton,nbt={HurtTime:10s}] run summon item ~ ~0.2 ~ {Item:{id:"minecraft:bone",Count:1b}}
execute as @e[tag=GrinderSkeleton,nbt={HurtTime:10s}] run kill @s

execute if block 79 79 995 acacia_sapling run function d3:hub/access_brown/sapling_present

execute if entity @e[tag=RootGrowth] run function d3:hub/access_brown/grow_root

scoreboard players add @e[scores={SurvivalAccess=4..}] SurvivalAccess 1
execute if entity @e[scores={SurvivalAccess=50..}] run scoreboard objectives remove SurvivalAccess

