####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 15 2017 / MAY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives add OrangeParkour dummy
scoreboard objectives add YellowParkour dummy
scoreboard objectives add PurpleParkour dummy
scoreboard objectives add BrownParkour dummy
scoreboard objectives add WhiteParkour dummy
scoreboard objectives add GreenParkour dummy
scoreboard objectives add BlackParkour dummy
scoreboard objectives add LimeParkour dummy
scoreboard objectives add LightBlueParkour dummy

scoreboard players add @e[tag=MainParkourAEC] OrangeParkour 0
scoreboard players add @e[tag=MainParkourAEC] YellowParkour 0
scoreboard players add @e[tag=MainParkourAEC] PurpleParkour 0
scoreboard players add @e[tag=MainParkourAEC] BrownParkour 0
scoreboard players add @e[tag=MainParkourAEC] WhiteParkour 0
scoreboard players add @e[tag=MainParkourAEC] GreenParkour 0
scoreboard players add @e[tag=MainParkourAEC] BlackParkour 0
scoreboard players add @e[tag=MainParkourAEC] LimeParkour 0
scoreboard players add @e[tag=MainParkourAEC] LightBlueParkour 0


# SET DISPLAY -> FOR TESTING ################################################
#scoreboard objectives setdisplay sidebar ParkourTimer

execute as @e[tag=ParkourStand] at @s run teleport @s ~ ~ ~ ~-1.5 ~
execute at @e[tag=ParkourTPCloud] run particle portal ~ ~1 ~ 0.4 0.8 0.4 0.1 7 force @a


# TELEPORTS/SPAWNPOINTS #
execute at @e[tag=WhiteParkourCloud] if entity @a[distance=..1] run kill @e[tag=ParkourStand]
execute at @e[tag=WhiteParkourCloud] if entity @a[distance=..1] run teleport @a 46 4 -31 0 -90

execute at @e[tag=OrangeParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 orange_concrete
execute at @e[tag=OrangeParkourCloud] if entity @a[distance=..1] run spawnpoint @a 991 107 -887
execute at @e[tag=OrangeParkourCloud] if entity @a[distance=..1] run teleport @a 991 108 -887 0 0

execute at @e[tag=YellowParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 yellow_concrete
execute at @e[tag=YellowParkourCloud] if entity @a[distance=..1] run spawnpoint @a 1132 164 -939
execute at @e[tag=YellowParkourCloud] if entity @a[distance=..1] run teleport @a 1132 165 -939 0 0

execute at @e[tag=BrownParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 brown_concrete
execute at @e[tag=BrownParkourCloud] if entity @a[distance=..1] run spawnpoint @a 1106 5 -1009
execute at @e[tag=BrownParkourCloud] if entity @a[distance=..1] run teleport @a 1106 6 -1009 0 0

execute at @e[tag=BlackParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 black_concrete
execute at @e[tag=BlackParkourCloud] if entity @a[distance=..1] run spawnpoint @a 1121 127 -1088
execute at @e[tag=BlackParkourCloud] if entity @a[distance=..1] run teleport @a 1101 4 -1101 0 -90

execute at @e[tag=LimeParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 lime_concrete
execute at @e[tag=LimeParkourCloud] if entity @a[distance=..1] run spawnpoint @a 1000 3 -1144
execute at @e[tag=LimeParkourCloud] if entity @a[distance=..1] run teleport @a 1000.0 5 -1144 0 0

execute at @e[tag=LightBlueParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 light_blue_concrete
execute at @e[tag=LightBlueParkourCloud] if entity @a[distance=..1] run spawnpoint @a 872 180 -1074
execute at @e[tag=LightBlueParkourCloud] if entity @a[distance=..1] run teleport @a 872 180 -1074 0 0

execute at @e[tag=GreenParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 green_concrete
execute at @e[tag=GreenParkourCloud] if entity @a[distance=..1] run spawnpoint @a 896 33 -1013
execute at @e[tag=GreenParkourCloud] if entity @a[distance=..1] run teleport @a 885 34 -1026 357 0

execute at @e[tag=PurpleParkourCloud] if entity @a[distance=..1] run setblock 1 4 1 purple_concrete
execute at @e[tag=PurpleParkourCloud] if entity @a[distance=..1] run spawnpoint @a 899 83 -940
execute at @e[tag=PurpleParkourCloud] if entity @a[distance=..1] run teleport @a 899 79 -942 0 -90


# CLICK TO SELECT WORDS
execute if entity @e[tag=MainParkourAEC,scores={WhiteParkour=0}] if entity @e[tag=ParkourStand,nbt={ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks"}]}] run scoreboard objectives add ParkourTimer dummy
execute if entity @e[tag=MainParkourAEC,scores={WhiteParkour=0}] if entity @e[tag=ParkourStand,nbt={ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks"}]}] run scoreboard players add @e[tag=MainParkourAEC] ParkourTimer 0
scoreboard players add @e[scores={ParkourTimer=..400}] ParkourTimer 1
execute if entity @e[scores={ParkourTimer=10..}] unless entity @e[tag=WhiteParkourCloud] run summon area_effect_cloud 1000 66 -991 {Tags:["WhiteParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}
execute if entity @e[scores={ParkourTimer=400}] unless entity @e[tag=ClickSelect] run summon area_effect_cloud 1000 67.7 -1000 {CustomName:"{\"text\":\"Click to Select Course\",\"color\":\"red\"}",CustomNameVisible:true,Tags:["ClickSelect"],Duration:2147483647}
execute if entity @e[tag=MainParkourAEC,scores={WhiteParkour=0}] if entity @e[tag=ParkourStand,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks"}]}] if entity @e[tag=ClickSelect] run kill @e[tag=ClickSelect]
execute if entity @e[tag=MainParkourAEC,scores={WhiteParkour=0}] if entity @e[tag=ParkourStand,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks"}]}] run scoreboard objectives remove ParkourTimer

execute if block 1000 70 -991 stone_button[powered=false] run setblock 1000 70 -991 stone_button[powered=true,face=floor,facing=south]
execute if block 1000 64 -991 stone_button[powered=false] run setblock 1000 64 -991 stone_button[powered=true,face=ceiling,facing=south]

execute unless entity @e[scores={ParkourTimer=10..}] run kill @e[tag=WhiteParkourCloud]


#######################


### WHITE/STONE ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:purple_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:white_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run function d3:parkour/remove_platforms
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clone 38 13 -21 40 19 -18 999 64 -993
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run summon area_effect_cloud 1000 66 -991 {Tags:["WhiteParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={WhiteParkour=0}] run clear @a purple_carpet
tag @e[scores={WhiteParkour=0}] remove SelectParkour


### ORANGE ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:white_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:orange_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:orange_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clone 38 20 -20 40 21 -18 1003 64 -992
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clone 38 20 -20 40 21 -18 1006 63 -987
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clone 38 20 -20 40 21 -18 1009 62 -982
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clone 38 20 -20 40 21 -18 1004 61 -978
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clone 38 20 -20 40 25 -18 1001 62 -973
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run summon area_effect_cloud 1002 64 -972 {Tags:["OrangeParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1002 65 -991 end_rod[facing=west]
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1001 65 -991 orange_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1001 66 -991 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1001 67 -991 orange_concrete
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1001 67 -992 oak_wall_sign[facing=north]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Hop on the\"}",Text3:"{\"text\":\"Wrong Track\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run setblock 1001 64 -991 barrier

execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={OrangeParkour=0}] run clear @a purple_carpet
tag @e[scores={OrangeParkour=0}] remove SelectParkour


### YELLOW ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:orange_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:yellow_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:yellow_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clone 43 20 -20 45 21 -18 1008 64 -997
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clone 43 20 -20 45 21 -18 1013 65 -994
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clone 43 20 -20 45 21 -18 1018 64 -989
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clone 43 20 -20 45 21 -18 1023 63 -984
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clone 43 20 -20 45 25 -18 1029 62 -983
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run summon area_effect_cloud 1030 64 -982 {Tags:["YellowParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1009 65 -998 end_rod[facing=north]
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1009 65 -999 yellow_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1009 66 -999 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1009 67 -999 yellow_concrete
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1008 67 -999 oak_wall_sign[facing=west]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Deep in\"}",Text3:"{\"text\":\"the Vault\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run setblock 1009 64 -999 barrier

execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={YellowParkour=0}] run clear @a purple_carpet
tag @e[scores={YellowParkour=0}] remove SelectParkour


### BROWN ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:yellow_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:brown_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:brown_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clone 43 13 -20 45 14 -18 1008 63 -1005
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clone 43 13 -20 45 14 -18 1013 62 -1008
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clone 43 13 -20 45 14 -18 1018 61 -1006
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clone 43 13 -20 45 14 -18 1020 62 -1001
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clone 43 13 -20 45 18 -18 1026 62 -1002
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run summon area_effect_cloud 1027 64 -1001 {Tags:["BrownParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1009 64 -1002 end_rod[facing=south]
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1009 64 -1001 brown_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1009 65 -1001 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1009 66 -1001 brown_concrete
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1008 66 -1001 oak_wall_sign[facing=west]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Spring in\"}",Text3:"{\"text\":\"Your Step\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run setblock 1009 63 -1001 barrier

execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={BrownParkour=0}] run clear @a purple_carpet
tag @e[scores={BrownParkour=0}] remove SelectParkour


### BLACK ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:brown_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:black_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:black_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clone 43 6 -20 45 7 -18 1008 67 -1023
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clone 43 6 -20 45 7 -18 1011 66 -1018
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clone 43 6 -20 45 7 -18 1006 65 -1015
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clone 43 6 -20 45 7 -18 1003 64 -1010
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clone 43 6 -20 45 11 -18 1006 68 -1028
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run summon area_effect_cloud 1007 70 -1027 {Tags:["BlackParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1002 65 -1009 end_rod[facing=west]
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1001 65 -1009 black_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1001 66 -1009 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1001 67 -1009 black_concrete
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1001 67 -1008 oak_wall_sign[facing=south]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Cannonball\"}",Text3:"{\"text\":\"Run\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run setblock 1001 64 -1009 barrier

execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={BlackParkour=0}] run clear @a purple_carpet
tag @e[scores={BlackParkour=0}] remove SelectParkour


### LIME ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:black_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:lime_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:lime_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clone 38 6 -20 40 7 -18 993 63 -1025
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clone 38 6 -20 40 7 -18 989 64 -1020
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clone 38 6 -20 40 7 -18 992 65 -1015
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clone 38 6 -20 40 7 -18 995 64 -1010
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clone 38 6 -20 40 11 -18 991 64 -1030
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run summon area_effect_cloud 992 66 -1029 {Tags:["LimeParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 998 65 -1009 end_rod[facing=east]
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 999 65 -1009 lime_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 999 66 -1009 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 999 67 -1009 lime_concrete
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 999 67 -1008 oak_wall_sign[facing=south]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Liberty\"}",Text3:"{\"text\":\"or Death\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run setblock 999 64 -1009 barrier

execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={LimeParkour=0}] run clear @a purple_carpet
tag @e[scores={LimeParkour=0}] remove SelectParkour


### LIGHT BLUE ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:lime_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:light_blue_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:light_blue_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clone 33 6 -20 35 7 -18 990 64 -1005
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clone 33 6 -20 35 7 -18 985 63 -1008
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clone 33 6 -20 35 7 -18 980 63 -1005
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clone 33 6 -20 35 7 -18 976 64 -1010
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clone 33 6 -20 35 11 -18 971 63 -1012
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run summon area_effect_cloud 972 65 -1011 {Tags:["LightBlueParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 991 65 -1002 end_rod[facing=south]
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 991 65 -1001 light_blue_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 991 66 -1001 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 991 67 -1001 light_blue_concrete
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 992 67 -1001 oak_wall_sign[facing=east]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Room With\"}",Text3:"{\"text\":\"a View\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run setblock 991 64 -1001 barrier

execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={LightBlueParkour=0}] run clear @a purple_carpet
tag @e[scores={LightBlueParkour=0}] remove SelectParkour


### GREEN ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:light_blue_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:green_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:green_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clone 33 13 -20 35 14 -18 976 61 -991
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clone 33 13 -20 35 14 -18 981 62 -989
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clone 33 13 -20 35 14 -18 985 63 -994
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clone 33 13 -20 35 14 -18 990 64 -997
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clone 33 13 -20 35 18 -18 971 60 -993
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run summon area_effect_cloud 972 62 -992 {Tags:["GreenParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 991 65 -998 end_rod[facing=north]
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 991 65 -999 green_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 991 66 -999 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 991 67 -999 green_concrete
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 992 67 -999 oak_wall_sign[facing=east]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Once Upon\"}",Text3:"{\"text\":\"a Time\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run setblock 991 64 -999 barrier

execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={GreenParkour=0}] run clear @a purple_carpet
tag @e[scores={GreenParkour=0}] remove SelectParkour


### PURPLE ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=4,dz=10,nbt={Inventory:[{id:"minecraft:green_carpet"}]}] run tag @e[tag=MainParkourAEC] add SelectParkour
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] at @e[tag=ParkourStand] run playsound entity.item_frame.rotate_item master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run data merge entity @e[tag=ParkourStand,limit=1] {HandItems:[{id:"minecraft:purple_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:purple_concrete",Count:1b}]}
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run function d3:parkour/remove_platforms

execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clone 33 20 -20 35 21 -18 995 64 -992
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clone 33 20 -20 35 21 -18 992 63 -987
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clone 33 20 -20 35 21 -18 993 64 -982
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clone 33 20 -20 35 21 -18 990 64 -977
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clone 33 20 -20 35 25 -18 985 65 -976
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run summon area_effect_cloud 986 67 -975 {Tags:["PurpleParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}

execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 998 65 -991 end_rod[facing=east]
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 999 65 -991 purple_shulker_box[facing=down]
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 999 66 -991 end_rod[facing=down]
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 999 67 -991 purple_concrete
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 999 67 -992 oak_wall_sign[facing=north]{Text1:"{\"text\":\"===============\"}",Text2:"{\"text\":\"Fill in\"}",Text3:"{\"text\":\"the Blanks\"}",Text4:"{\"text\":\"===============\"}"}
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run setblock 999 64 -991 barrier

execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a white_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a orange_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a yellow_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a brown_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a black_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a lime_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a light_blue_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a green_carpet
execute if entity @e[tag=SelectParkour,scores={PurpleParkour=0}] run clear @a purple_carpet
tag @e[scores={PurpleParkour=0}] remove SelectParkour