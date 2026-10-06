####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 17 2017 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#setblock ~2 ~ ~ oak_button[powered=false,facing=east]

kill @e[tag=DropperStand2]

clear @a[scores={BlackTravel=..3}] player_head

effect give @a resistance 1 255 true

kill @e[tag=DropperCloud]

scoreboard players reset @a[scores={YellowTravel=..3}] YellowTravel
scoreboard players reset @a[scores={OrangeTravel=..3}] OrangeTravel
scoreboard players reset @a[scores={PurpleTravel=..3}] PurpleTravel
scoreboard players reset @a[scores={BrownTravel=..3}] BrownTravel
scoreboard players reset @a[scores={WhiteTravel=..3}] WhiteTravel
scoreboard players reset @a[scores={GreenTravel=..3}] GreenTravel
scoreboard players reset @a[scores={BlackTravel=..3}] BlackTravel
scoreboard players reset @a[scores={LimeTravel=..3}] LimeTravel
scoreboard players reset @a[scores={LightBlueTravel=..3}] LightBlueTravel

scoreboard players set @e[tag=MainDropperAEC] TravelTime 0


setblock 1 4 2 blue_wool
setblock 1 4 1 dropper


spawnpoint @a -1001 235 20
teleport @a -1001 235 30 180 -30