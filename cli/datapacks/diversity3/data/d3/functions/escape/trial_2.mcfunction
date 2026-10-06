####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 4 2018 / APRIL 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PlateTimer
#scoreboard objectives setdisplay sidebar ArrowLife

effect clear @a jump_boost
effect give @a[x=-1004,y=67,z=996,dx=8,dy=10,dz=8] jump_boost 1 128 true
effect give @a[x=-1022,y=78,z=996,dx=26,dy=16,dz=40] jump_boost 1 128 true

teleport @a[x=-1004,y=75,z=1016,dx=8,dy=-2,dz=16] -1000 78 1014 0 0

# 1.13 CONVERSION
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 78 1034 acacia_button
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 79 1035 acacia_pressure_plate

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 81 1000 acacia_trapdoor[facing=south,half=top,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 82 999 acacia_trapdoor[facing=north,half=bottom,open=true]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1001 82 1000 acacia_trapdoor[facing=west,half=bottom,open=true]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 82 1001 acacia_trapdoor[facing=south,half=bottom,open=true]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -999 82 1000 acacia_trapdoor[facing=east,half=bottom,open=true]

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1001 68 999 -999 68 1001 acacia_pressure_plate replace oak_pressure_plate
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1004 73 999 -996 76 999 acacia_trapdoor[facing=north,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1004 73 1001 -996 76 1001 acacia_trapdoor[facing=south,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -999 73 996 -999 77 1004 acacia_trapdoor[facing=east,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1001 73 996 -1001 77 1004 acacia_trapdoor[facing=west,half=bottom,open=false] replace oak_trapdoor

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1009 81 999 -1007 81 1001 acacia_pressure_plate replace oak_pressure_plate
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1009 86 1004 acacia_trapdoor[facing=east,half=top,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1011 86 1004 acacia_trapdoor[facing=west,half=top,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1007 90 996 acacia_trapdoor[facing=east,half=bottom,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1009 90 996 acacia_trapdoor[facing=west,half=bottom,open=false]

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1016 81 999 -1014 81 1001 acacia_pressure_plate replace oak_pressure_plate
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1011 90 1004 acacia_trapdoor[facing=east,half=top,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1013 90 1004 acacia_trapdoor[facing=west,half=top,open=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1012 85 1000 -1012 85 1000 acacia_trapdoor[facing=west,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1015 85 997 -1015 85 997 acacia_trapdoor[facing=south,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1018 85 1000 -1018 85 1000 acacia_trapdoor[facing=east,half=bottom,open=false] replace oak_trapdoor
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -1015 85 1003 -1015 85 1003 acacia_trapdoor[facing=north,half=bottom,open=false] replace oak_trapdoor

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1022 90 1002 iron_bars[north=true,south=true]

# SETUP
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1000 78 1035 light_blue_concrete
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run scoreboard objectives add PlateTimer dummy
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1004 78 1005 lever[facing=south,face=floor,powered=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1004 85 1005 lever[facing=east,face=wall,powered=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1022 90 1004 lever[facing=west,face=floor,powered=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run fill -22 5 46 -22 7 46 prismarine_bricks
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1029 89 1001 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1029 89 999 lever[face=wall,facing=north,powered=false]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run setblock -1029 88 1000 redstone_wire

# DETECT ORANGE/BLUE PRESSURE PLATE
execute if block -1000 79 1035 acacia_pressure_plate[powered=true] run scoreboard objectives add PlateTimer dummy
execute if block -1000 78 1034 acacia_button[powered=true] run scoreboard objectives add PlateTimer dummy
execute if block -1000 78 1035 orange_concrete run scoreboard players remove @e[tag=MainEscapeAEC] PlateTimer 1
execute if block -1000 78 1035 light_blue_concrete run scoreboard players add @e[tag=MainEscapeAEC] PlateTimer 1

execute if entity @e[scores={EscapeTimer=2..,PlateTimer=1}] run playsound entity.shulker_bullet.hit master @a -1000 81 1024 1 1 1
execute if entity @e[scores={EscapeTimer=2..,PlateTimer=-1}] run playsound entity.shulker_bullet.hit master @a -1000 81 1024 1 1 1

#execute if entity @e[scores={PlateTimer=1}] run kill @e[type=arrow,x=-1001,y=77,z=1034,dx=2,dy=2,dz=2]
#execute if entity @e[scores={PlateTimer=-1}] run kill @e[type=arrow,x=-1001,y=77,z=1034,dx=2,dy=2,dz=2]


execute if entity @e[type=arrow] run scoreboard objectives add ArrowLife dummy
scoreboard players add @e[type=arrow,nbt={inGround:1b}] ArrowLife 1
execute if entity @e[scores={ArrowLife=10..}] run kill @e[scores={ArrowLife=20..}]
execute unless entity @e[type=arrow] run scoreboard objectives remove ArrowLife


# SWITCH TO ORANGE
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1016 -996 77 1020 air
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1023 -1002 77 1026 air
execute if entity @e[scores={PlateTimer=1}] run fill -998 77 1022 -996 77 1025 air
execute if entity @e[scores={PlateTimer=1}] run fill -999 77 1029 -996 77 1029 air
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1031 -1001 77 1031 air
execute if entity @e[scores={PlateTimer=1}] run fill -1003 83 1029 -997 83 1031 air
execute if entity @e[scores={PlateTimer=1}] run fill -1003 83 1004 -999 83 1007 air
execute if entity @e[scores={PlateTimer=1}] run fill -1004 84 996 -1004 85 1004 air

execute if entity @e[scores={PlateTimer=1}] run fill -1002 80 1037 -997 85 1037 orange_concrete replace light_blue_concrete
execute if entity @e[scores={PlateTimer=1}] run fill -1001 77 1023 -999 77 1025 orange_stained_glass
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1028 -996 77 1028 orange_stained_glass
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1030 -996 77 1030 orange_stained_glass
execute if entity @e[scores={PlateTimer=1}] run fill -1004 77 1032 -996 77 1032 orange_stained_glass
execute if entity @e[scores={PlateTimer=1}] run fill -1003 83 1017 -997 83 1019 orange_stained_glass

execute if entity @e[scores={PlateTimer=1}] run setblock -1000 78 1035 orange_concrete
scoreboard players set @e[scores={PlateTimer=1}] PlateTimer -10


# SWITCH TO LIGHT_BLUE
execute if entity @e[scores={PlateTimer=-1}] run fill -1001 77 1023 -999 77 1025 air
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1028 -996 77 1028 air
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1030 -996 77 1030 air
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1032 -996 77 1032 air
execute if entity @e[scores={PlateTimer=-1}] run fill -1003 83 1017 -997 83 1019 air

execute if entity @e[scores={PlateTimer=-1}] run fill -1002 80 1037 -997 85 1037 light_blue_concrete replace orange_concrete
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1016 -996 77 1020 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1023 -1002 77 1026 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -998 77 1022 -996 77 1025 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -999 77 1029 -996 77 1029 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 77 1031 -1001 77 1031 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -1003 83 1029 -997 83 1031 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -1003 83 1004 -999 83 1007 light_blue_stained_glass
execute if entity @e[scores={PlateTimer=-1}] run fill -1004 84 996 -1004 85 1004 light_blue_stained_glass

execute if entity @e[scores={PlateTimer=-1}] run setblock -1000 78 1035 light_blue_concrete
scoreboard players set @e[scores={PlateTimer=-1}] PlateTimer 10

execute if block -1000 79 1035 acacia_pressure_plate[powered=false] run execute if block -1000 78 1034 acacia_button[powered=false] run scoreboard objectives remove PlateTimer


# ROTATION PLATFORM 1
execute if block -22 5 46 acacia_planks run kill @e[type=arrow,x=-1003,y=67,z=997,dx=7,dy=9,dz=7]
execute if block -22 5 46 acacia_planks run setblock -1003 69 997 structure_block[mode=save]{name:"escape_platform_1",author:"qmagnet",rotation:"NONE",mode:"SAVE",posX:0,posY:1,posZ:0,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:false}
execute if block -22 5 46 acacia_planks run setblock -1003 68 997 redstone_block
execute if block -22 5 46 acacia_planks run fill -1003 68 997 -1003 69 997 air
execute if block -22 5 46 acacia_planks run setblock -1003 70 997 structure_block[mode=load]{name:"escape_platform_1",author:"qmagnet",rotation:"COUNTERCLOCKWISE_90",mode:"LOAD",posX:0,posY:0,posZ:6,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:false}
execute if block -22 5 46 acacia_planks run setblock -1003 71 997 redstone_block
execute if block -22 5 46 acacia_planks run execute as @e[type=arrow] run data merge entity @s {Color:-1}
execute if block -22 5 46 acacia_planks run playsound entity.player.attack.sweep master @a -1000 73 1000
execute if block -22 5 46 acacia_planks run setblock -22 5 46 prismarine_bricks


# ROTATION PLATFORM 2
execute if block -22 6 46 acacia_planks run kill @e[type=arrow,x=-1011,y=80,z=997,dx=7,dy=10,dz=7]
execute if block -22 6 46 acacia_planks run setblock -1011 83 997 structure_block[mode=save]{name:"escape_platform_2",author:"qmagnet",rotation:"NONE",mode:"SAVE",posX:0,posY:1,posZ:0,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:true}
execute if block -22 6 46 acacia_planks run setblock -1011 82 997 redstone_block
execute if block -22 6 46 acacia_planks run fill -1011 82 997 -1011 83 997 air
execute if block -22 6 46 acacia_planks run setblock -1011 84 997 structure_block[mode=load]{name:"escape_platform_2",author:"qmagnet",rotation:"CLOCKWISE_90",mode:"LOAD",posX:6,posY:0,posZ:0,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:true}
execute if block -22 6 46 acacia_planks run setblock -1011 85 997 redstone_block
execute if block -22 6 46 acacia_planks run execute as @e[type=arrow] run data merge entity @s {Color:-1}
execute if block -22 6 46 acacia_planks run playsound entity.player.attack.sweep master @a -1008 86 1000
execute if block -22 6 46 acacia_planks run setblock -22 6 46 prismarine_bricks


# ROTATION PLATFORM 3
execute if block -22 7 46 acacia_planks run kill @e[type=arrow,x=-1018,y=80,z=997,dx=7,dy=10,dz=7]
execute if block -22 7 46 acacia_planks run setblock -1018 83 997 structure_block[mode=save]{name:"escape_platform_3",author:"qmagnet",rotation:"NONE",mode:"SAVE",posX:0,posY:1,posZ:0,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:false}
execute if block -22 7 46 acacia_planks run setblock -1018 82 997 redstone_block
execute if block -22 7 46 acacia_planks run fill -1018 82 997 -1018 83 997 air
execute if block -22 7 46 acacia_planks run setblock -1018 84 997 structure_block[mode=load]{name:"escape_platform_3",author:"qmagnet",rotation:"COUNTERCLOCKWISE_90",mode:"LOAD",posX:0,posY:0,posZ:6,sizeX:7,sizeY:7,sizeZ:7,showboundingbox:0b,ignoreEntities:false}
execute if block -22 7 46 acacia_planks run setblock -1018 85 997 redstone_block
execute if block -22 7 46 acacia_planks run execute as @e[type=arrow] run data merge entity @s {Color:-1}
execute if block -22 7 46 acacia_planks run playsound entity.player.attack.sweep master @a -1015 86 1000
execute if block -22 7 46 acacia_planks run setblock -22 7 46 prismarine_bricks


# LADDER CHECKPOINT 1
execute if block -1004 78 1005 lever[powered=false] run fill -1004 67 1004 -1004 77 1004 air replace ladder
execute if block -1004 78 1005 lever[powered=true] run execute if block -1004 67 1004 air run playsound entity.experience_orb.pickup master @a -1004 77 1005
execute if block -1004 78 1005 lever[powered=true] run execute if block -1004 67 1004 air run playsound item.chorus_fruit.teleport master @a -1004 77 1005 1 0.7 0
execute if block -1004 78 1005 lever[powered=true] run execute if block -1004 67 1004 air run particle cloud -1004 72 1004 0.3 3 0.3 0 100
execute if block -1004 78 1005 lever[powered=true] run fill -1004 67 1004 -1004 77 1004 ladder[facing=north] replace air


# LADDER CHECKPOINT 2
execute if block -1004 85 1005 lever[powered=false] run fill -1004 78 1006 -1004 85 1006 air replace ladder
execute if block -1004 85 1005 lever[powered=true] run execute if block -1004 78 1006 air run playsound entity.experience_orb.pickup master @a -1005 85 1005
execute if block -1004 85 1005 lever[powered=true] run execute if block -1004 78 1006 air run playsound item.chorus_fruit.teleport master @a -1005 85 1005 1 0.7 0
execute if block -1004 85 1005 lever[powered=true] run execute if block -1004 78 1006 air run particle cloud -1004 81 1006 0.3 2 0.3 0 100
execute if block -1004 85 1005 lever[powered=true] run fill -1004 78 1006 -1004 85 1006 ladder[facing=east] replace air


# LADDER CHECKPOINT 3
execute if block -1022 90 1004 lever[powered=false] run fill -1021 84 1004 -1021 89 1004 air replace ladder
execute if block -1022 90 1004 lever[powered=false] run fill -1019 80 1003 -1019 83 1003 air replace ladder
execute if block -1022 90 1004 lever[powered=true] run execute if block -1019 80 1003 air run playsound entity.experience_orb.pickup master @a -1022 89 1004
execute if block -1022 90 1004 lever[powered=true] run execute if block -1019 80 1003 air run playsound item.chorus_fruit.teleport master @a -1022 89 1004 1 0.7 0
execute if block -1022 90 1004 lever[powered=true] run execute if block -1019 80 1003 air run particle cloud -1021 86 1004 0.3 1.5 0.3 0 100
execute if block -1022 90 1004 lever[powered=true] run execute if block -1019 80 1003 air run particle cloud -1019 81 1003 0.3 1 0.3 0 100
execute if block -1022 90 1004 lever[powered=true] run fill -1021 84 1004 -1021 89 1004 ladder[facing=east] replace air
execute if block -1022 90 1004 lever[powered=true] run fill -1019 80 1003 -1019 83 1003 ladder[facing=east] replace air