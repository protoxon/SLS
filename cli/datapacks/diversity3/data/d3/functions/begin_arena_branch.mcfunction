####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 26 2018 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove Survivor
team remove MonumentRiders

scoreboard players reset @a Speedrunner

gamerule announceAdvancements false
gamerule doWeatherCycle false
gamerule doDaylightCycle false
gamerule doFireTick false
gamerule doTileDrops false
gamerule doEntityDrops false
gamerule doMobLoot false
gamerule doMobSpawning false
gamerule keepInventory true
gamerule mobGriefing false
gamerule naturalRegeneration false
gamerule randomTickSpeed 0
gamemode adventure @a[tag=!D3Admin]
experience set @a 0 levels
experience set @a 0
effect give @a saturation 1 255 true
effect give @a regeneration 1 255 true
weather clear
time set 6000
difficulty peaceful
clear @a

function d3:remove_branch_tags
tag @a add InArenaBranch

setblock 1 4 2 yellow_wool
setblock 1 4 1 sandstone
setblock 1 2 4 clay

spawnpoint @a 0 47 1879
teleport @a 0 43 1963 90 0