####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 16 2017 / MAY 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainParkourAEC]
summon area_effect_cloud 40 2 -24 {Tags:["MainParkourAEC"],Duration:2147483647}

function d3:parkour/remove_platforms

kill @e[tag=ParkourStand]
summon armor_stand 1000 66.2 -1000 {Invisible:true,ShowArms:true,Small:false,NoGravity:true,HandItems:[{id:"minecraft:white_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks",Count:1b}],Pose:{RightArm:[0f,270f,0f]},Tags:["ParkourStand"],Invulnerable:true,DisabledSlots:1973790}

clone 38 13 -21 40 19 -18 999 64 -993
kill @e[tag=ParkourCloud]
summon area_effect_cloud 1000 66 -991 {Tags:["WhiteParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}


setblock 46 1 -18 redstone_block

teleport @a 1000 66 -1004 0 0