####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# FEBRUARY 10 2019 / MARCH 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

setblock 14 2 110 clay

difficulty peaceful

time set 0

effect give @a blindness 4 255 true
effect give @a night_vision 3 255 true

setblock 1 4 2 end_stone
setblock 1 4 1 podzol

spawnpoint @a 62 18 -4002
teleport @a 62 18 -4002 90 0

stopsound @a

scoreboard objectives remove CreditRoll
scoreboard objectives remove CR_TP

tag @a remove CR
tag @a remove CR1
tag @a remove CR2
tag @a remove CR3
tag @a remove CR4
tag @a remove CR5
tag @a remove CR6

scoreboard objectives remove OutroTimer
scoreboard objectives add OutroTimer dummy
scoreboard players reset @e OutroTimer

tag @e remove MetAB
tag @e remove MetAdam
tag @e remove MetNoodlor
tag @e remove MetQ
tag @e remove MetQwerty