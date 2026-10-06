####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 21 2017 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives remove Survivor
team remove MonumentRiders

scoreboard players reset @a Speedrunner

gamerule announceAdvancements false
gamerule doWeatherCycle false
gamerule doDaylightCycle true
gamerule doFireTick true
gamerule doTileDrops true
gamerule doEntityDrops true
gamerule doMobLoot true
gamerule doMobSpawning true
gamerule keepInventory false
gamerule mobGriefing true
gamerule naturalRegeneration true
gamerule randomTickSpeed 1000
gamemode survival @a[tag=!D3Admin]
experience set @a 0 levels
experience set @a 0
effect give @a saturation 1 255 true
effect give @a regeneration 1 255 true
weather clear
time set 0
difficulty normal
clear @a

function d3:remove_branch_tags
tag @a add InSurvivalBranch

setblock 1 4 2 brown_wool
setblock 1 4 1 stone
setblock 1 2 4 clay

setblock 14 2 -24 redstone_block

spawnpoint @a 7 64 -1070
teleport @a 8 48 -1000 0 -90