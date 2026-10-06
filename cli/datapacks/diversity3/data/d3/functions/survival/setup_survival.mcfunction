####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 6 2017 / MARCH 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


kill @e[tag=MainSurvivalAEC]
summon area_effect_cloud 8 2 -24 {Tags:["MainSurvivalAEC"],Duration:2147483647}

setblock 12 6 -18 clay

kill @e[tag=SurvivalNPC]

teleport @e[tag=SurvivalMob] 8 0 -1000
teleport @e[type=cow] 8 0 -1000
teleport @e[type=parrot] 8 0 -1000
teleport @e[type=pig] 8 0 -1000
teleport @e[type=sheep] 8 0 -1000
teleport @e[type=chicken] 8 0 -1000
teleport @e[type=zombie_pigman] 8 0 -1000

kill @e[tag=SurvivalMob]
kill @e[type=cow]
kill @e[type=parrot]
kill @e[type=pig]
kill @e[type=sheep]
kill @e[type=chicken]
kill @e[type=zombie_pigman]

kill @e[type=item]

# NEW ISLAND LOAD MECHANIC
setblock 14 11 -18 clay
setblock 14 13 -18 clay
setblock 12 11 -18 clay
setblock 12 13 -18 clay
setblock 10 11 -18 clay
setblock 10 13 -18 clay
setblock 8 11 -18 clay
setblock 8 13 -18 clay
setblock 6 11 -18 clay
setblock 6 13 -18 clay
setblock 4 11 -18 clay
setblock 4 13 -18 clay
setblock 4 15 -18 clay
setblock 2 11 -18 clay

setblock 14 6 -18 clay

# SPAWN PLAINS ISLAND TO BRANCH
teleport @a 7 64 -1070 270 0


# ACTIVATE MAIN SURVIVAL CLOCK
setblock 14 2 -18 redstone_block


# ACTIVATE MAIN SPAWN CHUNK PORTAL CLOCK -> (NOT NEEDED)
fill 7 4 -27 7 4 -27 fire replace air
setblock 7 2 -27 redstone_block


# SET UP CONVERSATION BLOCKS FOR NPCS
fill 10 5 -18 10 8 -18 red_mushroom_block
fill 8 5 -18 8 5 -18 red_terracotta
fill 6 5 -18 6 5 -18 snow_block
fill 4 5 -18 4 5 -18 jungle_wood