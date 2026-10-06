####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# FEBRUARY 15 2019 / APRIL 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove FinaleDeaths
scoreboard objectives remove FinishD3
scoreboard objectives remove OutroTimer
scoreboard objectives remove CreditRoll
scoreboard objectives remove CR_TP
scoreboard objectives remove CreditPlayers

tag @a remove CR
tag @a remove CR1
tag @a remove CR2
tag @a remove CR3
tag @a remove CR4
tag @a remove CR5
tag @a remove CR6

setblock 15 1 0 redstone_block

fill 1 6 14 12 6 14 gravel
setblock 1 4 2 spruce_log
setblock 1 4 1 spruce_planks
time set 12500

spawnpoint @a 51 19 -2518
teleport @a 62 18 -2517 90 0

gamerule sendCommandFeedback true

