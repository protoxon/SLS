####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 25 2018 / APRIL 27 1019
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
gamerule doFireTick true
gamerule doTileDrops true
gamerule doEntityDrops true
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
tag @a add InBossBranch

setblock 1 4 2 black_wool
setblock 1 4 1 stone
setblock 1 2 4 clay

spawnpoint @a -999 65 -998
teleport @a -1015 17 -970 0 -90