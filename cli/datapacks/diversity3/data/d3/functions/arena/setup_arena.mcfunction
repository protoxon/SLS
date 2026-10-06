####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 26 2018 / MARCH 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainArenaAEC]
summon area_effect_cloud 8 2 72 {Tags:["MainArenaAEC"],Duration:2147483647}

kill @e[tag=ArenaMob]
kill @e[tag=ArenaWolf]
kill @e[tag=ArenaVillager]
kill @e[type=item]
kill @e[tag=ArenaStand]

summon armor_stand 9.706 50.165 1957.52 {Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{id:"minecraft:wooden_sword",Count:1b}],Pose:{RightArm:[80f,90f,0f]},Rotation:[180f,0f],DisabledSlots:1973790,Tags:["ArenaStand","WoodArenaStand"]}
summon armor_stand 8.706 50.165 1957.52 {Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{id:"minecraft:wooden_sword",Count:1b}],Pose:{RightArm:[80f,90f,0f]},Rotation:[180f,0f],DisabledSlots:1973790,Tags:["ArenaStand","WoodArenaStand"]}
summon armor_stand 7.706 50.165 1957.52 {Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{id:"minecraft:wooden_sword",Count:1b}],Pose:{RightArm:[80f,90f,0f]},Rotation:[180f,0f],DisabledSlots:1973790,Tags:["ArenaStand","WoodArenaStand"]}


data merge block 5 50 1958 {Items:[]}
data merge block 4 50 1958 {Items:[]}
data merge block -4 50 1958 {Items:[]}
data merge block -5 50 1958 {Items:[]}

fill 6 1 78 8 1 78 clay
fill 6 3 78 8 3 78 clay
fill 6 5 78 8 5 78 clay
fill 1 1 78 4 1 78 stone_bricks

setblock 1 1 76 clay

setblock 11 1 78 clay
setblock 11 3 78 clay
setblock 11 5 78 clay

setblock 1 3 78 clay
setblock 1 5 78 clay

setblock 8 7 78 clay


fill 0 47 1952 0 48 1952 clay


setblock 14 2 78 redstone_block

teleport @a -10 48 1887 225 0