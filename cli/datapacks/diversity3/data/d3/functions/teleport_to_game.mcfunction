####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 3 2018 / MARCH 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# TESTING PURPOSES
# teleport @p 8 104 8
#scoreboard objectives setdisplay sidebar LateComer



# TAG NEW PLAYER
execute align x align y align z run tag @a[x=-9,y=101,z=-9,dx=34,dy=4,dz=34] add NewPlayer



# SET GAMEMODE
execute unless block 1 4 2 brown_wool run gamemode adventure @a[name=!qmagnet,tag=NewPlayer]
execute if block 1 4 2 brown_wool run gamemode survival @a[name=!qmagnet,tag=NewPlayer]



# MAP INTRO
execute if block 1 4 2 spruce_log run time set 12500
execute if block 1 4 2 spruce_log run gamerule doEntityDrops true
execute if block 1 4 2 spruce_log run spawnpoint @a[tag=NewPlayer] 51 19 -2518
execute if block 1 4 2 spruce_log run teleport @a[tag=NewPlayer] 62 18 -2517 90 0



# QHEAD
execute if block 1 4 2 white_terracotta run spawnpoint @a[tag=NewPlayer] 8 88 998
execute if block 1 4 2 white_terracotta run teleport @a[tag=NewPlayer] 9.0 250 996 0 0



# KWA ISLANDS
execute if block 1 4 2 stone_bricks run spawnpoint @a[tag=NewPlayer] 8 88 998
execute if block 1 4 2 stone_bricks run teleport @a[tag=NewPlayer] 8 87 996 0 0



# ADVENTURE
execute if block 1 4 2 orange_wool run spawnpoint @a[tag=NewPlayer] 1000 106 2024
execute if block 1 4 2 orange_wool run teleport @a[tag=NewPlayer] 1000 106 2024 180 0



# ARENA
execute if block 1 4 2 yellow_wool run spawnpoint @a[tag=NewPlayer] -8 51 1944
execute if block 1 4 2 yellow_wool run teleport @a[tag=NewPlayer] -8 50.6 1944 0 0



# TRIVIA
execute if block 1 4 2 lime_wool run spawnpoint @a[tag=NewPlayer] 1000 64 994
execute if block 1 4 2 lime_wool at @p[tag=WrongAnswer] as @a[tag=NewPlayer] run teleport @s ~ ~ ~
execute if block 1 4 2 lime_wool unless entity @a[tag=WrongAnswer] run teleport @a[tag=NewPlayer] 1000 64 994 0 0



# PARKOUR
execute if block 1 4 2 pink_wool if block 1 4 1 white_concrete run spawnpoint @a[tag=NewPlayer] 1000 66 -1004
execute if block 1 4 2 pink_wool if block 1 4 1 white_concrete run teleport @a[tag=NewPlayer] 1000 66 -1004 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 orange_concrete run spawnpoint @a[tag=NewPlayer] 991 107 -887
execute if block 1 4 2 pink_wool if block 1 4 1 orange_concrete run teleport @a[tag=NewPlayer] 991 107 -887 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 yellow_concrete run spawnpoint @a[tag=NewPlayer] 1132 164 -939
execute if block 1 4 2 pink_wool if block 1 4 1 yellow_concrete run teleport @a[tag=NewPlayer] 1132 164 -939 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 brown_concrete run spawnpoint @a[tag=NewPlayer] 1106 5 -1009
execute if block 1 4 2 pink_wool if block 1 4 1 brown_concrete run teleport @a[tag=NewPlayer] 1106 5 -1009 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 black_concrete run spawnpoint @a[tag=NewPlayer] 1121 127 -1088
execute if block 1 4 2 pink_wool if block 1 4 1 black_concrete run teleport @a[tag=NewPlayer] 1120 117 -1087 90 0
execute if block 1 4 2 pink_wool if block 1 4 1 lime_concrete run spawnpoint @a[tag=NewPlayer] 1000 3 -1144
execute if block 1 4 2 pink_wool if block 1 4 1 lime_concrete run teleport @a[tag=NewPlayer] 1000.0 3.7 -1144 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 light_blue_concrete run spawnpoint @a[tag=NewPlayer] 872 180 -1074
execute if block 1 4 2 pink_wool if block 1 4 1 light_blue_concrete run teleport @a[tag=NewPlayer] 872 180 -1074 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 green_concrete run spawnpoint @a[tag=NewPlayer] 896 33 -1013
execute if block 1 4 2 pink_wool if block 1 4 1 green_concrete run teleport @a[tag=NewPlayer] 885 33 -1026 357 0
execute if block 1 4 2 pink_wool if block 1 4 1 purple_concrete run spawnpoint @a[tag=NewPlayer] 899 83 -940
execute if block 1 4 2 pink_wool if block 1 4 1 purple_concrete run teleport @a[tag=NewPlayer] 899 83 -940 0 0
execute if block 1 4 2 pink_wool if block 1 4 1 pink_glazed_terracotta run spawnpoint @a[tag=NewPlayer] 1000 192 -1004
execute if block 1 4 2 pink_wool if block 1 4 1 pink_glazed_terracotta run teleport @a[tag=NewPlayer] 1000 192 -1004 0 0



# ESCAPE
execute if block 1 4 2 cyan_wool run spawnpoint @a[tag=NewPlayer] -1000 2 806
execute if block 1 4 2 cyan_wool run teleport @a[tag=NewPlayer] -1000 2 806 270 0

# NEEDS ALL CFG LEVELS



# ELYTRA
execute if block 1 4 2 purple_wool run spawnpoint @a[tag=NewPlayer] -1800 223 2000
execute if block 1 4 2 purple_wool run teleport @a[tag=NewPlayer] -1800 223 2000 0 0



# DROPPER
execute if block 1 4 2 blue_wool if block 1 4 1 dropper run spawnpoint @a[tag=NewPlayer] -1000 235 20
execute if block 1 4 2 blue_wool if block 1 4 1 dropper run teleport @a[tag=NewPlayer] -994 235 20 30 -20
execute if block 1 4 2 blue_wool if block 1 4 1 yellow_concrete run scoreboard players set @a[tag=NewPlayer] YellowTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 yellow_concrete run spawnpoint @a[tag=NewPlayer] -1109 235 -84
execute if block 1 4 2 blue_wool if block 1 4 1 yellow_concrete run teleport @a[tag=NewPlayer] -1109 235 -84 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 orange_concrete run scoreboard players set @a[tag=NewPlayer] OrangeTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 orange_concrete run spawnpoint @a[tag=NewPlayer] -1001 235 -143
execute if block 1 4 2 blue_wool if block 1 4 1 orange_concrete run teleport @a[tag=NewPlayer] -1001 235 -143 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 purple_concrete run scoreboard players set @a[tag=NewPlayer] PurpleTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 purple_concrete run spawnpoint @a[tag=NewPlayer] -893 235 -97
execute if block 1 4 2 blue_wool if block 1 4 1 purple_concrete run teleport @a[tag=NewPlayer] -893 235 -97 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 brown_concrete run scoreboard players set @a[tag=NewPlayer] BrownTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 brown_concrete run spawnpoint @a[tag=NewPlayer] -1109 235 17
execute if block 1 4 2 blue_wool if block 1 4 1 brown_concrete run teleport @a[tag=NewPlayer] -1109 235 17 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 white_concrete run scoreboard players set @a[tag=NewPlayer] WhiteTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 white_concrete run spawnpoint @a[tag=NewPlayer] -1001 213 20
execute if block 1 4 2 blue_wool if block 1 4 1 white_concrete run teleport @a[tag=NewPlayer] -1001 213 20 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 green_concrete run scoreboard players set @a[tag=NewPlayer] GreenTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 green_concrete run spawnpoint @a[tag=NewPlayer] -893 235 17
execute if block 1 4 2 blue_wool if block 1 4 1 green_concrete run teleport @a[tag=NewPlayer] -893 235 17 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 black_concrete run scoreboard players set @a[tag=NewPlayer] BlackTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 black_concrete run spawnpoint @a[tag=NewPlayer] -1109 235 87
execute if block 1 4 2 blue_wool if block 1 4 1 black_concrete run teleport @a[tag=NewPlayer] -1109 235 87 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 lime_concrete run scoreboard players set @a[tag=NewPlayer] LimeTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 lime_concrete run spawnpoint @a[tag=NewPlayer] -1001 235 131
execute if block 1 4 2 blue_wool if block 1 4 1 lime_concrete run teleport @a[tag=NewPlayer] -1001 235 131 0 0
execute if block 1 4 2 blue_wool if block 1 4 1 light_blue_concrete run scoreboard players set @a[tag=NewPlayer] LightBlueTravel 3
execute if block 1 4 2 blue_wool if block 1 4 1 light_blue_concrete run spawnpoint @a[tag=NewPlayer] -893 235 131
execute if block 1 4 2 blue_wool if block 1 4 1 light_blue_concrete run teleport @a[tag=NewPlayer] -893 235 131 0 0



# SURVIVAL
execute if block 1 4 2 brown_wool run spawnpoint @a[tag=NewPlayer] 7 64 -1070
execute if block 1 4 2 brown_wool run teleport @a[tag=NewPlayer] 7 64 -1070 270 0



# PUZZLE
execute if block 1 4 2 red_wool run spawnpoint @a[tag=NewPlayer] 1000 64 19
execute if block 1 4 2 red_wool run teleport @a[tag=NewPlayer] 1000 64 19 0 0



# BOSS
execute if block 1 4 2 black_wool run spawnpoint @a[tag=NewPlayer] -999 64 -998
execute if block 1 4 2 black_wool run teleport @a[tag=NewPlayer] -999 64 -998 0 0



# BONUS
execute if block 1 4 2 green_wool run spawnpoint @a[tag=NewPlayer] 0 90 3200
execute if block 1 4 2 green_wool run teleport @a[tag=NewPlayer] 0 90 3200 0 0


# FINALE
execute if block 1 4 2 light_blue_wool run spawnpoint @a[tag=NewPlayer] 0 34 4998
execute if block 1 4 2 light_blue_wool run teleport @a[tag=NewPlayer] -5 34 4997 321 0


# OUTRO
execute if block 1 4 2 end_stone run spawnpoint @a[tag=NewPlayer] 62 18 -4002
execute if block 1 4 2 end_stone run teleport @a[tag=NewPlayer] 62 18 -4002 90 0




# IF CAN'T FIND BRANCH
execute align x align y align z run execute if entity @a[x=-9,y=101,z=-9,dx=34,dy=4,dz=34] run scoreboard objectives add LateComer dummy
execute align x align y align z run execute unless entity @a[x=-9,y=101,z=-9,dx=34,dy=4,dz=34] run scoreboard objectives remove LateComer
execute align x align y align z run execute unless entity @a[x=-9,y=101,z=-9,dx=34,dy=4,dz=34] run setblock 14 8 14 clay
scoreboard players add @a LateComer 0
execute align x align y align z run scoreboard players add @a[x=-9,y=101,z=-9,dx=34,dy=4,dz=34] LateComer 1

execute if entity @a[scores={LateComer=15}] run tellraw @a {"text":"","extra":[{"text":"Something went wrong... Sending latecomers to closest active player.","color":"white"}]}
execute if entity @a[scores={LateComer=30..}] run execute as @p[scores={LateComer=0}] at @s run teleport @a[scores={LateComer=1..}] ~ ~ ~

execute if entity @a[scores={LateComer=300}] run tellraw @a {"text":"","extra":[{"text":"Command failed. Please contact qmagnet with this screenshot for help.","color":"white"}]}

tag @a remove NewPlayer