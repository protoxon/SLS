####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 5 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainElytraAEC]
summon area_effect_cloud -24 2 72 {Tags:["MainElytraAEC"],Duration:2147483647}

fill -31 2 78 -23 2 78 clay
fill -31 4 78 -23 11 78 clay
fill -31 13 78 -23 13 78 clay
fill -31 15 78 -23 15 78 clay

setblock -1800 222 2002 barrier

tag @a add WhiteRing


setblock -20 1 78 clay
setblock -20 3 78 clay


setblock -18 2 78 redstone_block

teleport @a -1800 223 2000 0 0