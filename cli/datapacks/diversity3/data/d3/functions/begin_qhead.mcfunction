####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2018 / NOVEMBER 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove Survivor

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
weather clear
time set 6000
difficulty peaceful
clear @a

setblock 2 34 2 redstone_block

fill 1 6 14 12 6 14 gravel
setblock 1 4 2 white_terracotta
setblock 1 2 7 redstone_block

scoreboard objectives remove qHeadTimer

tag @a remove Mirror1
tag @a remove Mirror2
tag @a remove Mirror3
tag @a remove Mirror4



spawnpoint @a 8 248 998
teleport @a 9.0 250 996 0 0