####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 7 2017 / APRIL 27 2019
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
gamerule doEntityDrops true
gamerule doMobLoot false
gamerule doMobSpawning false
gamerule keepInventory true
gamerule mobGriefing false
gamerule naturalRegeneration true
gamerule randomTickSpeed 0
gamemode adventure @a[tag=!D3Admin]
experience set @a 0 levels
experience set @a 0
effect give @a saturation 1 255 true
effect give @a regeneration 1 255 true
effect give @a resistance 1 255 true
weather clear
time set 6000
difficulty peaceful
clear @a

function d3:remove_branch_tags
tag @a add InTriviaBranch

setblock 1 4 2 lime_wool
setblock 1 4 1 quartz_block
setblock 1 2 4 clay

spawnpoint @a 1000 64 994
teleport @a 1000 31 1000 0 -90