####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 7 2018 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BombTimer
#scoreboard objectives setdisplay sidebar BombSeconds


# FIRST CUT
execute if block -983 103 1028 air run playsound entity.enderman.death master @a -983 103 1028
execute if block -983 103 1028 air run execute at @a[x=-993,y=102,z=1028,dx=13,dy=4,dz=8] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"making a poor decision\",\"color\":\"white\"}"}
execute if block -983 103 1028 air run setblock -983 103 1028 white_wool

execute if block -985 103 1028 air run playsound entity.enderman.death master @a -985 103 1028
execute if block -985 103 1028 air run execute at @a[x=-993,y=102,z=1028,dx=13,dy=4,dz=8] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"failing to notice the floor\",\"color\":\"white\"}"}
execute if block -985 103 1028 air run setblock -985 103 1028 white_wool

execute if block -987 103 1028 air run playsound entity.enderman.death master @a -987 103 1028
execute if block -987 103 1028 air run execute at @a[x=-993,y=102,z=1028,dx=13,dy=4,dz=8] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"not paying attention\",\"color\":\"white\"}"}
execute if block -987 103 1028 air run setblock -987 103 1028 white_wool

execute if block -989 103 1028 air run playsound entity.firework_rocket.launch master @a -991 103 1028
execute if block -989 103 1028 air run fill -991 102 1028 -991 103 1028 air destroy
execute if block -989 103 1028 air run setblock -989 103 1028 barrier



# SECOND CUT
execute if block -988 112 1008 air run playsound entity.enderman.death master @a -988 112 1008
execute if block -988 112 1008 air run execute at @a[x=-993,y=98,z=1006,dx=4,dy=15,dz=5] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"choosing the wrong wire\",\"color\":\"white\"}"}
execute if block -988 112 1008 air run setblock -988 112 1008 white_wool

execute if block -988 112 1010 air run playsound entity.enderman.death master @a -988 112 1010
execute if block -988 112 1010 air run execute at @a[x=-993,y=98,z=1006,dx=4,dy=15,dz=5] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"not following the wires\",\"color\":\"white\"}"}
execute if block -988 112 1010 air run setblock -988 112 1010 white_wool

execute if block -994 112 1010 air run playsound entity.enderman.death master @a -988 112 1010
execute if block -994 112 1010 air run execute at @a[x=-993,y=98,z=1006,dx=4,dy=15,dz=5] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"being confused\",\"color\":\"white\"}"}
execute if block -994 112 1010 air run setblock -994 112 1010 white_wool

execute if block -994 112 1008 air run playsound entity.firework_rocket.launch master @a -991 111 1006
execute if block -994 112 1008 air run fill -991 111 1006 -991 112 1006 air destroy
execute if block -994 112 1008 air run setblock -994 112 1008 barrier


# THIRD CUT - TIME BOMB SETUP / CLOCK MECHANIC
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run scoreboard objectives add BombTimer dummy
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run scoreboard objectives add BombSeconds dummy
scoreboard players set @e[scores={EscapeLevel=18,EscapeTimer=1}] BombTimer 0
scoreboard players set @e[scores={EscapeLevel=18,EscapeTimer=1}] BombSeconds 62

scoreboard players add @e[tag=MainEscapeAEC] BombTimer 1
execute if entity @e[scores={BombSeconds=..60,BombTimer=1}] run playsound block.note_block.hat master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 0.8 1
execute if entity @e[scores={BombSeconds=..60,BombTimer=11}] run playsound block.note_block.hat master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 0.5 0.6 0.5
scoreboard players remove @e[scores={BombTimer=20..}] BombSeconds 1

execute if entity @e[scores={BombSeconds=62,BombTimer=1}] run playsound entity.tnt.primed master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if entity @e[scores={BombSeconds=61,BombTimer=7..10}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1


# MASTER CLONE COMMANDS
#0 > clone -31 2 40 -31 4 42
#1 > clone -31 2 36 -31 4 38
#2 > clone -31 6 40 -31 8 42
#3 > clone -31 6 36 -31 8 38
#4 > clone -31 10 40 -31 12 42
#5 > clone -31 10 36 -31 12 38
#6 > clone -31 14 40 -31 16 42
#7 > clone -31 14 36 -31 16 38
#8 > clone -31 18 40 -31 20 42
#9 > clone -31 18 36 -31 20 38
# first digit > -1008 113 970
# second digit > -1008 113 966


# TIME BOMB DIGITS
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 970
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966

execute if entity @e[scores={BombSeconds=60,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 970
execute if entity @e[scores={BombSeconds=60,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966

execute if entity @e[scores={BombSeconds=59,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 970

execute if entity @e[scores={BombSeconds=59,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=58,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=57,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=56,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=55,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=54,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=53,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=52,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=51,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=50,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966
execute if entity @e[scores={BombSeconds=50,BombTimer=1}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1

execute if entity @e[scores={BombSeconds=49,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 970

execute if entity @e[scores={BombSeconds=49,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=48,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=47,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=46,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=45,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=44,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=43,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=42,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=41,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=40,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966
execute if entity @e[scores={BombSeconds=40,BombTimer=1}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1

execute if entity @e[scores={BombSeconds=39,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 970

execute if entity @e[scores={BombSeconds=39,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=38,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=37,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=36,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=35,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=34,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=33,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=32,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=31,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=30,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966
execute if entity @e[scores={BombSeconds=30,BombTimer=1}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1

execute if entity @e[scores={BombSeconds=29,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 970

execute if entity @e[scores={BombSeconds=29,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=28,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=27,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=26,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=25,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=24,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=23,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=22,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=21,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=20,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966
execute if entity @e[scores={BombSeconds=20,BombTimer=1}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1

execute if entity @e[scores={BombSeconds=19,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 970

execute if entity @e[scores={BombSeconds=19,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=18,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=17,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=16,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=15,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=14,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=13,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=12,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=11,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=10,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 966
execute if entity @e[scores={BombSeconds=10,BombTimer=1}] run playsound entity.ghast.hurt master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1

execute if entity @e[scores={BombSeconds=9,BombTimer=1}] run clone -31 2 40 -31 4 42 -1008 113 970

execute if entity @e[scores={BombSeconds=9,BombTimer=1}] run clone -31 18 36 -31 20 38 -1008 113 966
execute if entity @e[scores={BombSeconds=8,BombTimer=1}] run clone -31 18 40 -31 20 42 -1008 113 966
execute if entity @e[scores={BombSeconds=7,BombTimer=1}] run clone -31 14 36 -31 16 38 -1008 113 966
execute if entity @e[scores={BombSeconds=6,BombTimer=1}] run clone -31 14 40 -31 16 42 -1008 113 966
execute if entity @e[scores={BombSeconds=5,BombTimer=1}] run clone -31 10 36 -31 12 38 -1008 113 966
execute if entity @e[scores={BombSeconds=4,BombTimer=1}] run clone -31 10 40 -31 12 42 -1008 113 966
execute if entity @e[scores={BombSeconds=3,BombTimer=1}] run clone -31 6 36 -31 8 38 -1008 113 966
execute if entity @e[scores={BombSeconds=2,BombTimer=1}] run clone -31 6 40 -31 8 42 -1008 113 966
execute if entity @e[scores={BombSeconds=1,BombTimer=1}] run clone -31 2 36 -31 4 38 -1008 113 966
execute if entity @e[scores={BombSeconds=0,BombTimer=0..}] run clone -31 2 40 -31 4 42 -1008 113 966


# TIME RUNS OUT
execute if entity @e[scores={BombSeconds=0,BombTimer=20..}] run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if entity @e[scores={BombSeconds=0,BombTimer=20..}] run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"running out of time\",\"color\":\"white\"}"}
scoreboard players set @e[scores={BombSeconds=0,BombTimer=20..}] EscapeLevel 17
execute if entity @e[scores={BombSeconds=0,BombTimer=20..}] run kill @a[gamemode=creative]
execute if entity @e[scores={BombSeconds=0,BombTimer=20..}] run scoreboard objectives remove BombTimer

scoreboard players set @e[scores={BombTimer=20..}] BombTimer 0



# THIRD CUT - TIME BOMB
execute if block -1008 119 974 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 974 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"discovering white isn't right\",\"color\":\"white\"}"}
execute if block -1008 119 974 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 119 974 air run kill @a[gamemode=creative]
execute if block -1008 119 974 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 974 air run scoreboard objectives remove BombTimer
execute if block -1008 119 974 air run setblock -1008 119 974 white_wool

execute if block -1008 119 972 air run playsound entity.firework_rocket.launch master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 972 air run fill -1010 111 959 -1010 113 961 air destroy
execute if block -1008 119 972 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeTimer 0
execute if block -1008 119 972 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 19
execute if block -1008 119 972 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 972 air run execute if entity @e[scores={BombSeconds=1}] run advancement grant @a only d3:folder_b/time_bomb
execute if block -1008 119 972 air run scoreboard objectives remove BombSeconds
execute if block -1008 119 972 air run scoreboard objectives remove BombTimer
execute if block -1008 119 972 air run setblock -1008 119 972 barrier

execute if block -1008 119 970 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 970 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"cutting magenta\",\"color\":\"light_purple\"}"}
execute if block -1008 119 970 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 119 970 air run kill @a[gamemode=creative]
execute if block -1008 119 970 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 970 air run scoreboard objectives remove BombTimer
execute if block -1008 119 970 air run setblock -1008 119 970 magenta_wool

execute if block -1008 119 968 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 968 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"a light blue mistake\",\"color\":\"blue\"}"}
execute if block -1008 119 968 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 119 968 air run kill @a[gamemode=creative]
execute if block -1008 119 968 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 968 air run scoreboard objectives remove BombTimer
execute if block -1008 119 968 air run setblock -1008 119 968 light_blue_wool

execute if block -1008 119 966 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 966 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"saying hello to yellow\",\"color\":\"yellow\"}"}
execute if block -1008 119 966 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 119 966 air run kill @a[gamemode=creative]
execute if block -1008 119 966 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 966 air run scoreboard objectives remove BombTimer
execute if block -1008 119 966 air run setblock -1008 119 966 yellow_wool

execute if block -1008 119 964 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 119 964 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"finding out how this time bomb is actually a lime bomb\",\"color\":\"green\"}"}
execute if block -1008 119 964 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 119 964 air run kill @a[gamemode=creative]
execute if block -1008 119 964 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 119 964 air run scoreboard objectives remove BombTimer
execute if block -1008 119 964 air run setblock -1008 119 964 lime_wool

execute if block -1008 109 974 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 974 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"Pinky and the Brain\",\"color\":\"red\"}"}
execute if block -1008 109 974 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 974 air run kill @a[gamemode=creative]
execute if block -1008 109 974 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 974 air run scoreboard objectives remove BombTimer
execute if block -1008 109 974 air run setblock -1008 109 974 pink_wool

execute if block -1008 109 972 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 972 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"thinking it would match the monument block\",\"color\":\"dark_aqua\"}"}
execute if block -1008 109 972 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 972 air run kill @a[gamemode=creative]
execute if block -1008 109 972 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 972 air run scoreboard objectives remove BombTimer
execute if block -1008 109 972 air run setblock -1008 109 972 cyan_wool

execute if block -1008 109 970 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 970 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"mashing the grapes\",\"color\":\"dark_purple\"}"}
execute if block -1008 109 970 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 970 air run kill @a[gamemode=creative]
execute if block -1008 109 970 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 970 air run scoreboard objectives remove BombTimer
execute if block -1008 109 970 air run setblock -1008 109 970 purple_wool

execute if block -1008 109 968 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 968 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"feeling blue\",\"color\":\"dark_blue\"}"}
execute if block -1008 109 968 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 968 air run kill @a[gamemode=creative]
execute if block -1008 109 968 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 968 air run scoreboard objectives remove BombTimer
execute if block -1008 109 968 air run setblock -1008 109 968 blue_wool

execute if block -1008 109 966 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 966 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"going green\",\"color\":\"dark_green\"}"}
execute if block -1008 109 966 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 966 air run kill @a[gamemode=creative]
execute if block -1008 109 966 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 966 air run scoreboard objectives remove BombTimer
execute if block -1008 109 966 air run setblock -1008 109 966 green_wool

execute if block -1008 109 964 air run playsound entity.enderman.death master @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] ~ ~ ~ 1 1 1
execute if block -1008 109 964 air run execute at @a[x=-1010,y=107,z=954,dx=21,dy=14,dz=23] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"red dead redemption\",\"color\":\"dark_red\"}"}
execute if block -1008 109 964 air run scoreboard players set @e[scores={EscapeLevel=18}] EscapeLevel 17
execute if block -1008 109 964 air run kill @a[gamemode=creative]
execute if block -1008 109 964 air run kill @e[tag=EscapeCFG_Bomb]
execute if block -1008 109 964 air run scoreboard objectives remove BombTimer
execute if block -1008 109 964 air run setblock -1008 109 964 red_wool



# TIMEBOMB PORTAL FAILSAFE
execute align x align y align z run kill @a[x=-999,y=113,z=957,dx=1,dy=5,dz=0]
execute align x align y align z run kill @a[x=-994,y=116,z=957,dx=1,dy=2,dz=0]
execute align x align y align z run kill @a[x=-1004,y=116,z=957,dx=1,dy=2,dz=0]
