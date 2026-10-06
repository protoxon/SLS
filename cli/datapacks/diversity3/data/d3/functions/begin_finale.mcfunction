####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 24 2019 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove Survivor
team remove MonumentRiders

scoreboard players reset @a Speedrunner

execute unless entity @e[tag=MainFinaleAEC] run summon area_effect_cloud 8 2 104 {Tags:["MainFinaleAEC"],Duration:2147483647}

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
gamerule naturalRegeneration true
gamerule randomTickSpeed 0
gamemode adventure @a[tag=!D3Admin]
experience set @a 0 levels
experience set @a 0
effect give @a[x=1,y=4,z=97,dx=0,dy=3,dz=0] saturation 1 255 true
effect give @a[x=1,y=4,z=97,dx=0,dy=3,dz=0] regeneration 1 255 true
weather clear
time set 6000
difficulty easy
clear @a[x=1,y=4,z=97,dx=0,dy=3,dz=0]


execute align x align y align z run tag @a[distance=..10] remove InKwaIslands
execute align x align y align z run tag @a[distance=..10] remove InKwaIslands
execute align x align y align z run tag @a[distance=..10] remove InAdventureBranch
execute align x align y align z run tag @a[distance=..10] remove InArenaBranch
execute align x align y align z run tag @a[distance=..10] remove InTriviaBranch
execute align x align y align z run tag @a[distance=..10] remove InParkourBranch
execute align x align y align z run tag @a[distance=..10] remove InEscapeBranch
execute align x align y align z run tag @a[distance=..10] remove InElytraBranch
execute align x align y align z run tag @a[distance=..10] remove InDropperBranch
execute align x align y align z run tag @a[distance=..10] remove InSurvivalBranch
execute align x align y align z run tag @a[distance=..10] remove InPuzzleBranch
execute align x align y align z run tag @a[distance=..10] remove InBossBranch
execute align x align y align z run tag @a[distance=..10] remove inGolfBranch

execute align x align y align z run tag @a[distance=..10] add InFinale
execute align x align y align z run spawnpoint @a[distance=..10] 0 34 4998
execute align x align y align z run teleport @a[distance=..10] -5 34 4997 321 0


setblock 1 4 2 light_blue_wool
setblock 1 4 1 light_blue_concrete
setblock 1 2 4 clay

setblock 14 2 110 redstone_block

