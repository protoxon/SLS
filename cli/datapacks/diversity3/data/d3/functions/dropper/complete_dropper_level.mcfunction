####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 17 2017 / SEPTEMBER 22 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect give @a resistance 1 255 true

scoreboard players reset @e TravelTime
scoreboard players reset @a DropSpeech


# YELLOW
setblock -1109 24 -102 clay
execute if entity @e[scores={YellowTravel=3}] run setblock -1109 24 -102 dropper[facing=up]{CustomName:"{\"text\":\"Core\",\"color\":\"yellow\"}"}


# ORANGE
setblock -1001 30 -141 coal_block
setblock -1001 30 -141 furnace[facing=north]{CustomName:"{\"text\":\"Nether Endertainment System\",\"color\":\"orange\"}"}
clear @a stone_pressure_plate


# PURPLE
clear @a blaze_rod


# BROWN
execute as @e[tag=TicketStub] run data merge entity @s {HandItems:[{},{}]}


# GREEN
setblock -922 4 41 clay
setblock -922 4 41 chest[facing=west]{CustomName:"{\"text\":\"Trunk\"}",Items:[{Slot:3b,id:"minecraft:iron_ingot",Count:1b},{Slot:4b,id:"minecraft:iron_ingot",Count:1b},{Slot:5b,id:"minecraft:iron_ingot",Count:1b},{Slot:12b,id:"minecraft:iron_ingot",Count:1b},{Slot:13b,id:"minecraft:iron_ingot",Count:1b},{Slot:14b,id:"minecraft:iron_ingot",Count:1b},{Slot:21b,id:"minecraft:iron_ingot",Count:1b},{Slot:22b,id:"minecraft:iron_ingot",Count:1b},{Slot:23b,id:"minecraft:iron_ingot",Count:1b}]}
clear @a iron_ingot


# BLACK
setblock -1075 1 96 air


# LIME
clear @a iron_axe
setblock -1001 3 120 lime_glazed_terracotta[facing=south]


# LIGHT BLUE
kill @e[type=tnt]
setblock -885 14 137 barrier

fill -885 14 136 -884 15 138 air replace lever[powered=true]


tag @a remove PunchingBagRange
execute at @e[tag=HighFiveStand] run tag @a[distance=0..15] add PunchingBagRange
#execute at @a[scores={PurpleTravel=3}] run playsound entity.generic.hurt master @a[tag=PunchingBagRange] ~ ~ ~ 1 1.3 1

scoreboard players set @a[scores={YellowTravel=3}] YellowTravel 4
scoreboard players set @a[scores={OrangeTravel=3}] OrangeTravel 4
scoreboard players set @a[scores={PurpleTravel=3}] PurpleTravel 4
scoreboard players set @a[scores={BrownTravel=3}] BrownTravel 4
scoreboard players set @a[scores={WhiteTravel=3}] WhiteTravel 4
scoreboard players set @a[scores={GreenTravel=3}] GreenTravel 4
scoreboard players set @a[scores={BlackTravel=3}] BlackTravel 4
scoreboard players set @a[scores={LimeTravel=3}] LimeTravel 4
scoreboard players set @a[scores={LightBlueTravel=3}] LightBlueTravel 4


setblock 1 4 2 blue_wool
setblock 1 4 1 dropper


spawnpoint @a -1001 235 20
teleport @a -1001 235 30 180 -30

scoreboard objectives remove GolemExists
scoreboard objectives remove BatExists
scoreboard objectives remove DropperCart