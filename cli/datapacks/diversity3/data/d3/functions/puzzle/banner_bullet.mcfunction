####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 3 2017 / JULY 23 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true
effect clear @a levitation

difficulty easy

#################################
# FIX -> water for squid on master file
team add FreeTheSquid
team modify FreeTheSquid collisionRule never
#################################

scoreboard objectives add ShulkerExists dummy
scoreboard objectives add BulletExists dummy
scoreboard objectives add BulletWarmup dummy
scoreboard objectives add BulletInRange dummy
scoreboard objectives add BulletMotion dummy
scoreboard objectives add BulletDirection dummy
scoreboard objectives add BannerWin dummy

#scoreboard objectives setdisplay sidebar ShulkerExists
#scoreboard objectives setdisplay sidebar BulletExists
#scoreboard objectives setdisplay sidebar BulletInRange
#scoreboard objectives setdisplay sidebar BulletWarmup
#scoreboard objectives setdisplay sidebar BulletMotion
#scoreboard objectives setdisplay sidebar BulletDirection
#scoreboard objectives setdisplay sidebar BannerWin

scoreboard players add @e[tag=MainPuzzleAEC] BannerWin 0


# SETS LAMPS BACK AT CHANGE POSITION
execute if block 1000 64 4 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run fill 993 66 5 1007 66 15 stone replace clay
execute if block 1001 64 5 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run fill 993 66 5 1007 66 15 stone replace clay
execute if block 999 64 5 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run fill 993 66 5 1007 66 15 stone replace clay


# CHECK IF SHULKER EXISTS
scoreboard players set @e[tag=MainPuzzleAEC] ShulkerExists 0
execute if entity @e[tag=BannerShulker] run scoreboard players set @e[tag=MainPuzzleAEC] ShulkerExists 1
execute if block 1000 64 4 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run teleport @e[tag=BannerShulker] 1000 66 5
execute if block 1001 64 5 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run teleport @e[tag=BannerShulker] 1000 66 5
execute if block 999 64 5 stone_button[powered=true] run execute if entity @e[scores={ShulkerExists=1}] run teleport @e[tag=BannerShulker] 1000 66 5

execute if entity @e[scores={ShulkerExists=0}] run summon shulker 1000 66 5 {NoAI:true,Color:16b,Silent:true,Tags:["BannerShulker"],Invulnerable:true,Rotation:[0f,0f],UUIDLeast:-8743152485644460451L,UUIDMost:-8869172746962386557L}


# BULLET BUTTON WARM UP
scoreboard players add @e[tag=BannerShulker] BulletWarmup 0
scoreboard players add @e[scores={BulletWarmup=1..}] BulletWarmup 1
scoreboard players set @e[tag=BannerShulker,scores={BulletWarmup=19..}] BulletWarmup 0


# CHECK IF BULLET EXISTS
scoreboard players set @e[tag=MainPuzzleAEC] BulletExists 0


# NORTH SIDE
execute if block 1000 64 4 stone_button[powered=true] run kill @e[tag=BannerBulletPlaceHolder]
execute if block 1000 64 4 stone_button[powered=true] run execute if entity @e[tag=BannerBullet] run scoreboard players set @e[tag=MainPuzzleAEC] BulletExists 1
execute if block 1000 64 4 stone_button[powered=true] run execute if entity @e[scores={BulletExists=0}] run summon area_effect_cloud 1000 68 8 {Tags:["BannerBullet"],Duration:20}
execute if block 1000 64 4 stone_button[powered=true] run scoreboard players set @e[tag=BannerShulker,scores={BulletWarmup=0}] BulletWarmup 1
execute if block 1000 64 4 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1..15}] run data merge entity @s {Peek:100b,Rotation:[0f,0f]}
execute if block 1000 64 4 stone_button[powered=true] run execute as @e[scores={BulletWarmup=10}] run summon shulker_bullet 1000 66.35 5.7 {NoGravity:true,Tags:["BannerBullet"],Motion:[0.0d,0.0d,0.2d],Owner:{X:1000,Y:66,Z:5,L:-8743152485644460451L,M:-8869172746962386557L}}
execute if block 1000 64 4 stone_button[powered=true] run execute as @e[scores={BulletWarmup=16..}] run data merge entity @s {Peek:0b,Rotation:[0f,0f]}
execute if block 1000 64 4 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 1001 64 5 air
execute if block 1000 64 4 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 999 64 5 air

# EAST SIDE
execute if block 1001 64 5 stone_button[powered=true] run kill @e[tag=BannerBulletPlaceHolder]
execute if block 1001 64 5 stone_button[powered=true] run execute if entity @e[tag=BannerBullet] run scoreboard players set @e[tag=MainPuzzleAEC] BulletExists 1
execute if block 1001 64 5 stone_button[powered=true] run execute if entity @e[scores={BulletExists=0}] run summon area_effect_cloud 1000 68 8 {Tags:["BannerBullet"],Duration:20}
execute if block 1001 64 5 stone_button[powered=true] run scoreboard players set @e[tag=BannerShulker,scores={BulletWarmup=0}] BulletWarmup 1
execute if block 1001 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1..15}] run data merge entity @s {Peek:100b,Rotation:[90f,0f]}
execute if block 1001 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=10}] run summon shulker_bullet 1000.3 66.35 5.5 {NoGravity:true,Tags:["BannerBullet"],Motion:[-0.2d,0.0d,0.0d],Owner:{X:1000,Y:66,Z:5,L:-8743152485644460451L,M:-8869172746962386557L}}
execute if block 1001 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=16..}] run data merge entity @s {Peek:0b,Rotation:[90f,0f]}
execute if block 1001 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 1000 64 4 air
execute if block 1001 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 999 64 5 air

# WEST SIDE
execute if block 999 64 5 stone_button[powered=true] run kill @e[tag=BannerBulletPlaceHolder]
execute if block 999 64 5 stone_button[powered=true] run execute if entity @e[tag=BannerBullet] run scoreboard players set @e[tag=MainPuzzleAEC] BulletExists 1
execute if block 999 64 5 stone_button[powered=true] run execute if entity @e[scores={BulletExists=0}] run summon area_effect_cloud 1000 68 8 {Tags:["BannerBullet"],Duration:20}
execute if block 999 64 5 stone_button[powered=true] run scoreboard players set @e[tag=BannerShulker,scores={BulletWarmup=0}] BulletWarmup 1
execute if block 999 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1..15}] run data merge entity @s {Peek:100b,Rotation:[270f,0f]}
execute if block 999 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=10}] run summon shulker_bullet 1000.7 66.35 5.5 {NoGravity:true,Tags:["BannerBullet"],Motion:[0.2d,0.0d,0.0d],Owner:{X:1000,Y:66,Z:5,L:-8743152485644460451L,M:-8869172746962386557L}}
execute if block 999 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=16..}] run data merge entity @s {Peek:0b,Rotation:[270f,0f]}
execute if block 999 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 1000 64 4 air
execute if block 999 64 5 stone_button[powered=true] run execute as @e[scores={BulletWarmup=1}] run setblock 1001 64 5 air


# REMOVES BUTTONS
execute at @e[scores={BulletWarmup=1}] run fill 998 64 5 998 64 11 air
execute at @e[scores={BulletWarmup=1}] run fill 1002 64 5 1002 64 11 air
execute at @e[scores={BulletWarmup=1}] run setblock 1000 64 10 air


# LAUNCH BUTTONS
execute as @e[scores={BulletWarmup=17}] run setblock 1000 64 4 air
execute as @e[scores={BulletWarmup=17}] run setblock 1001 64 5 air
execute as @e[scores={BulletWarmup=17}] run setblock 999 64 5 air

execute at @e[scores={BulletWarmup=1}] run playsound entity.shulker.ambient master @a ~ ~ ~ 1 1 1
execute at @e[scores={BulletWarmup=10}] run playsound entity.shulker.shoot master @a ~ ~ ~ 1 1 1

execute as @e[scores={BulletWarmup=11}] run kill @e[type=area_effect_cloud,tag=BannerBullet]


# BANNER ROTATIONS

# CREEPER
execute if block 1002 64 5 stone_button[powered=true] run setblock 1003 67 5 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "creeperbanner", showboundingbox: 0b}
execute if block 1002 64 5 stone_button[powered=true] run setblock 1003 68 5 redstone_block
execute if block 1002 64 5 stone_button[powered=true] run fill 1003 67 5 1003 68 5 air
execute if block 1002 64 5 stone_button[powered=true] run setblock 1003 67 5 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "creeperbanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 1002 64 5 stone_button[powered=true] run setblock 1003 68 5 redstone_block
execute if block 1002 64 5 stone_button[powered=true] run fill 1003 67 5 1003 68 5 air
execute if block 1002 64 5 stone_button[powered=true] run setblock 1002 64 5 stone_button[powered=false,facing=west]

# SQUID
execute if block 1002 64 8 stone_button[powered=true] run setblock 1003 67 8 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "squidbanner", showboundingbox: 0b}
execute if block 1002 64 8 stone_button[powered=true] run setblock 1003 68 8 redstone_block
execute if block 1002 64 8 stone_button[powered=true] run fill 1003 67 8 1003 68 8 air
execute if block 1002 64 8 stone_button[powered=true] run setblock 1003 67 8 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "squidbanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 1002 64 8 stone_button[powered=true] run setblock 1003 68 8 redstone_block
execute if block 1002 64 8 stone_button[powered=true] run fill 1003 67 8 1003 68 8 air
execute if block 1002 64 8 stone_button[powered=true] run setblock 1002 64 8 stone_button[powered=false,facing=west]

# CHICKEN
execute if block 1002 64 11 stone_button[powered=true] run setblock 1003 67 11 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "chickenbanner", showboundingbox: 0b}
execute if block 1002 64 11 stone_button[powered=true] run setblock 1003 68 11 redstone_block
execute if block 1002 64 11 stone_button[powered=true] run fill 1003 67 8 1003 68 11 air
execute if block 1002 64 11 stone_button[powered=true] run setblock 1003 67 11 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "chickenbanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 1002 64 11 stone_button[powered=true] run setblock 1003 68 11 redstone_block
execute if block 1002 64 11 stone_button[powered=true] run fill 1003 67 11 1003 68 11 air
execute if block 1002 64 11 stone_button[powered=true] run setblock 1002 64 11 stone_button[powered=false,facing=west]

# VILLAGER
execute if block 1000 64 10 stone_button[powered=true] run setblock 1000 67 11 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "villagerbanner", showboundingbox: 0b}
execute if block 1000 64 10 stone_button[powered=true] run setblock 1000 68 11 redstone_block
execute if block 1000 64 10 stone_button[powered=true] run fill 1000 67 8 1000 68 11 air
execute if block 1000 64 10 stone_button[powered=true] run setblock 1000 67 11 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "villagerbanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 1000 64 10 stone_button[powered=true] run setblock 1000 68 11 redstone_block
execute if block 1000 64 10 stone_button[powered=true] run fill 1000 67 11 1000 68 11 air
execute if block 1000 64 10 stone_button[powered=true] run setblock 1000 64 10 stone_button[powered=false,facing=north]

# SLIME
execute if block 998 64 11 stone_button[powered=true] run setblock 997 67 11 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "slimebanner", showboundingbox: 0b}
execute if block 998 64 11 stone_button[powered=true] run setblock 997 68 11 redstone_block
execute if block 998 64 11 stone_button[powered=true] run fill 997 67 8 997 68 11 air
execute if block 998 64 11 stone_button[powered=true] run setblock 997 67 11 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "slimebanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 998 64 11 stone_button[powered=true] run setblock 997 68 11 redstone_block
execute if block 998 64 11 stone_button[powered=true] run fill 997 67 11 997 68 11 air
execute if block 998 64 11 stone_button[powered=true] run setblock 998 64 11 stone_button[powered=false,facing=east]

# ENDERMAN
execute if block 998 64 8 stone_button[powered=true] run setblock 997 67 8 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "endermanbanner", showboundingbox: 0b}
execute if block 998 64 8 stone_button[powered=true] run setblock 997 68 8 redstone_block
execute if block 998 64 8 stone_button[powered=true] run fill 997 67 8 997 68 8 air
execute if block 998 64 8 stone_button[powered=true] run setblock 997 67 8 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "endermanbanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 998 64 8 stone_button[powered=true] run setblock 997 68 8 redstone_block
execute if block 998 64 8 stone_button[powered=true] run fill 997 67 8 997 68 8 air
execute if block 998 64 8 stone_button[powered=true] run setblock 998 64 8 stone_button[powered=false,facing=east]

# GOLEM
execute if block 998 64 5 stone_button[powered=true] run setblock 997 67 5 structure_block{mode: "SAVE", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "golembanner", showboundingbox: 0b}
execute if block 998 64 5 stone_button[powered=true] run setblock 997 68 5 redstone_block
execute if block 998 64 5 stone_button[powered=true] run fill 997 67 5 997 68 5 air
execute if block 998 64 5 stone_button[powered=true] run setblock 997 67 5 structure_block{mode: "LOAD", mirror: "NONE", ignoreEntities: 1b, powered: 0b, author: "qmagnet", posX: 0, posY: -2, posZ: 0, sizeX: 1, sizeY: 1, sizeZ: 1, name: "golembanner", showboundingbox: 0b, rotation: "CLOCKWISE_90"}
execute if block 998 64 5 stone_button[powered=true] run setblock 997 68 5 redstone_block
execute if block 998 64 5 stone_button[powered=true] run fill 997 67 5 997 68 5 air
execute if block 998 64 5 stone_button[powered=true] run setblock 998 64 5 stone_button[powered=false,facing=east]


# DOUBLE CHECK IF BULLET EXISTS / SETS BUTTONS IF BULLET DIES
execute if entity @e[tag=BannerBullet] run scoreboard players set @e[tag=MainPuzzleAEC] BulletExists 1
#execute if entity @e[scores={BannerWin=0}] run function d3:puzzle/banner_bullet/set_buttons

# SHULKER
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1000 64 4 stone_button[facing=north]
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 999 64 5 stone_button[facing=west]
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1001 64 5 stone_button[facing=east]

# CREEPER
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1002 64 5 stone_button[facing=west]

# SQUID
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1002 64 8 stone_button[facing=west]

# CHICKEN
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1002 64 11 stone_button[facing=west]

# VILLAGER
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 1000 64 10 stone_button[facing=north]

# SLIME
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 998 64 11 stone_button[facing=east]

# ENDERMAN
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 998 64 8 stone_button[facing=east]

# GOLEM
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run setblock 998 64 5 stone_button[facing=east]

execute if entity @e[scores={BannerWin=0,BulletExists=0}] run summon area_effect_cloud 1000 68 8 {Tags:["BannerBullet","BannerBulletPlaceHolder"],Duration:2147483647}
execute if entity @e[scores={BannerWin=0,BulletExists=0}] run scoreboard players set @e[tag=BannerShulker] BulletWarmup 0


# MOVING THE BULLET
scoreboard players add @e[tag=BannerBullet,type=shulker_bullet] BulletMotion 1

execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~ ~-1 ~ air run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletInRange 0
execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~ ~-1 ~ white_banner run scoreboard players add @e[tag=BannerBullet,type=shulker_bullet] BulletInRange 1

execute at @e[tag=BannerBullet,scores={BulletMotion=20..}] run execute if block ~ ~-1 ~ white_banner run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletMotion 0


# IF BULLET HITS SHULKER
execute at @e[tag=BannerShulker] run execute at @e[scores={BulletMotion=10..},distance=..1] run playsound entity.shulker_bullet.hit master @a 1000 66 5 1 1 1
execute at @e[tag=BannerShulker] run execute at @e[scores={BulletMotion=10..},distance=..1] run particle explosion ~ ~ ~ 0.3 0.3 0.3 0 2 force
execute at @e[tag=BannerShulker] run execute at @e[scores={BulletMotion=10..},distance=..1] run kill @e[tag=BannerBullet]


# TAGS FOR DIRECTION -> 1N, 2E, 3S, 4W
tag @e remove NorthBullet
tag @e remove EastBullet
tag @e remove WestBullet
tag @e remove SouthBullet

execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~ ~-5 ~ air run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletDirection 0

execute at @e[tag=BannerBullet,type=shulker_bullet,scores={BulletMotion=10..}] run execute if block ~ ~-5 ~ red_shulker_box run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletDirection 1
execute at @e[tag=BannerBullet,type=shulker_bullet,scores={BulletMotion=10..}] run execute if block ~ ~-5 ~ lime_shulker_box run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletDirection 2
execute at @e[tag=BannerBullet,type=shulker_bullet,scores={BulletMotion=10..}] run execute if block ~ ~-5 ~ light_gray_shulker_box run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletDirection 3
execute at @e[tag=BannerBullet,type=shulker_bullet,scores={BulletMotion=10..}] run execute if block ~ ~-5 ~ white_shulker_box run scoreboard players set @e[tag=BannerBullet,type=shulker_bullet] BulletDirection 4

tag @e[scores={BulletDirection=1}] add NorthBullet
tag @e[scores={BulletDirection=2}] add EastBullet
tag @e[scores={BulletDirection=3}] add SouthBullet
tag @e[scores={BulletDirection=4}] add WestBullet


# CHANGE DIRECTION
execute at @e[tag=NorthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=2] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[-0.2d,0.0d,0.0d]}
execute at @e[tag=NorthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=6] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=NorthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=10] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=NorthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=14] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.2d,0.0d,0.0d]}

execute at @e[tag=EastBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=2] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,0.0d,0.2d]}
execute at @e[tag=EastBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=6] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,0.0d,-0.2d]}
execute at @e[tag=EastBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=10] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=EastBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=14] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}

execute at @e[tag=SouthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=2] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=SouthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=6] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[-0.2d,0.0d,0.0d]}
execute at @e[tag=SouthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=10] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.2d,0.0d,0.0d]}
execute at @e[tag=SouthBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=14] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}

execute at @e[tag=WestBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=2] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=WestBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=6] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,-1.0d,0.0d]}
execute at @e[tag=WestBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=10] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,0.0d,-0.2d]}
execute at @e[tag=WestBullet,scores={BulletInRange=2..}] run execute if block ~ ~-1 ~ white_banner[rotation=14] run data merge entity @e[tag=BannerBullet,limit=1] {Motion:[0.0d,0.0d,0.2d]}


# SOUNDS
execute at @e[scores={BulletInRange=3}] run playsound block.note_block.basedrum master @a ~ ~ ~ 0.5 0.5 0.5


# TURNS LAMPS ON OR OFF
scoreboard objectives add BannerLamp dummy
execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~ ~ ~1 redstone_lamp run scoreboard players add @e[tag=BannerBullet] BannerLamp 1
execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~1 ~ ~ redstone_lamp run scoreboard players add @e[tag=BannerBullet] BannerLamp 1
execute at @e[tag=BannerBullet,type=shulker_bullet] run execute if block ~-1 ~ ~ redstone_lamp run scoreboard players add @e[tag=BannerBullet] BannerLamp 1

execute at @e[scores={BannerLamp=4}] run execute if block ~ ~ ~1 redstone_lamp[lit=true] run playsound block.ender_chest.open master @a ~ ~ ~ 1 0.8 1
execute at @e[scores={BannerLamp=4}] run execute if block ~ ~ ~1 redstone_lamp[lit=true] run fill ~ ~ ~2 ~ ~ ~2 clay replace redstone_block
execute at @e[scores={BannerLamp=4}] run execute if block ~1 ~ ~ redstone_lamp[lit=true] run playsound block.ender_chest.open master @a ~ ~ ~ 1 0.8 1
execute at @e[scores={BannerLamp=4}] run execute if block ~1 ~ ~ redstone_lamp[lit=true] run fill ~2 ~ ~ ~2 ~ ~ clay replace redstone_block
execute at @e[scores={BannerLamp=4}] run execute if block ~-1 ~ ~ redstone_lamp[lit=true] run playsound block.ender_chest.open master @a ~ ~ ~ 1 0.8 1
execute at @e[scores={BannerLamp=4}] run execute if block ~-1 ~ ~ redstone_lamp[lit=true] run fill ~-2 ~ ~ ~-2 ~ ~ clay replace redstone_block

execute at @e[scores={BannerLamp=4}] run execute if block ~ ~ ~1 redstone_lamp[lit=false] run playsound block.note_block.pling master @a ~ ~ ~ 0.7 0.8 0.7
execute at @e[scores={BannerLamp=4}] run execute if block ~ ~ ~1 redstone_lamp[lit=false] run fill ~ ~ ~2 ~ ~ ~2 redstone_block replace stone
execute at @e[scores={BannerLamp=4}] run execute if block ~1 ~ ~ redstone_lamp[lit=false] run playsound block.note_block.pling master @a ~ ~ ~ 0.7 0.8 0.7
execute at @e[scores={BannerLamp=4}] run execute if block ~1 ~ ~ redstone_lamp[lit=false] run fill ~2 ~ ~ ~2 ~ ~ redstone_block replace stone
execute at @e[scores={BannerLamp=4}] run execute if block ~-1 ~ ~ redstone_lamp[lit=false] run playsound block.note_block.pling master @a ~ ~ ~ 0.7 0.8 0.7
execute at @e[scores={BannerLamp=4}] run execute if block ~-1 ~ ~ redstone_lamp[lit=false] run fill ~-2 ~ ~ ~-2 ~ ~ redstone_block replace stone


# FOR THE WIN
execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run fill 998 64 5 999 64 11 air replace stone_button
execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run fill 1001 64 5 1002 64 11 air replace stone_button
execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run fill 1000 64 4 1000 64 4 air replace stone_button
execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run fill 1000 64 10 1000 64 10 air replace stone_button

#execute if block 994 66 5 redstone_lamp[lit=false] run scoreboard players set @e[tag=MainPuzzleAEC] BannerWin 0

#execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run scoreboard objectives add BannerWin dummy

execute if block 994 66 5 redstone_lamp[lit=true] run execute if block 994 66 8 redstone_lamp[lit=true] run execute if block 994 66 11 redstone_lamp[lit=true] run execute if block 997 66 14 redstone_lamp[lit=true] run execute if block 1000 66 14 redstone_lamp[lit=true] run execute if block 1003 66 14 redstone_lamp[lit=true] run execute if block 1006 66 11 redstone_lamp[lit=true] run execute if block 1006 66 8 redstone_lamp[lit=true] run execute if block 1006 66 5 redstone_lamp[lit=true] run scoreboard players add @e[tag=MainPuzzleAEC] BannerWin 1

execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BannerLamp
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BulletDirection
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BulletInRange
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BulletMotion
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BulletWarmup
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove ShulkerExists
execute as @e[tag=MainPuzzleAEC,scores={BannerWin=1..}] run scoreboard objectives remove BulletExists

execute as @e[scores={BannerWin=1}] run execute at @e[tag=BannerStatue] run teleport @e[tag=BannerStatue] ~ 0 ~
execute as @e[scores={BannerWin=4}] run kill @e[tag=BannerStatue]

execute as @e[scores={BannerWin=39}] run playsound entity.illusioner.prepare_blindness master @a 1000 64 8 1 1 1
execute as @e[scores={BannerWin=39}] run playsound entity.dragon_fireball.explode master @a 1000 64 8 0.6 0.5 0.6
execute as @e[scores={BannerWin=39}] run playsound entity.evoker.prepare_summon master @a 1000 64 8 1 0.7 1
execute as @e[scores={BannerWin=39}] run playsound entity.illusioner.prepare_blindness master @a 1000 64 8 1 0.7 1

execute as @e[scores={BannerWin=40}] run fill 997 65 5 1003 65 11 air replace white_banner
execute as @e[scores={BannerWin=40}] run setblock 1003 65 8 end_rod[facing=down]
execute as @e[scores={BannerWin=40}] run setblock 1003 65 11 end_rod[facing=down]
execute as @e[scores={BannerWin=40}] run setblock 997 65 11 end_rod[facing=down]
execute as @e[scores={BannerWin=40..}] run setblock 1003 66 8 water[level=7]

execute as @e[scores={BannerWin=39}] run particle cloud 1003 66 5 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon creeper 1003 65 5 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[45f,0f]}
execute as @e[scores={BannerWin=39}] run particle cloud 1003 66 8 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon squid 1003 66 8 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[90f,0f],NoGravity:true,Team:FreeTheSquid}
execute as @e[scores={BannerWin=39}] run particle cloud 1003 66.8 11 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon chicken 1003 66 11 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[135f,0f]}
execute as @e[scores={BannerWin=39}] run particle cloud 1000 66 11 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon villager 1000 65 11 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[180f,0f],Offers:{}}
execute as @e[scores={BannerWin=39}] run particle cloud 997 66.6 11 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon slime 997 66 11 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[225f,0f],Size:1,Team:Statues}
execute as @e[scores={BannerWin=39}] run particle cloud 997 66.8 8 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon enderman 997 65 8 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[270f,0f]}
execute as @e[scores={BannerWin=39}] run particle cloud 997 66 5 0.5 0.5 0.5 0 70
execute as @e[scores={BannerWin=40}] run summon iron_golem 997 65 5 {NoAI:true,Silent:true,Invulnerable:true,Tags:["BannerStatue"],Rotation:[315f,0f]}
execute as @e[scores={BannerWin=40..}] run data merge entity @e[tag=BannerShulker,limit=1] {Peek:30b,Rotation:[0f,0f]}

execute as @e[scores={BannerWin=40}] run setblock 39 5 14 redstone_block

execute as @e[scores={BannerWin=40}] run setblock 1000 64 5 iron_block
execute as @e[scores={BannerWin=50}] run setblock 1000 64 6 stone_button[facing=south]


# SWITCH TO END KEY
execute as @e[scores={BannerWin=50}] run setblock 1000 60 5 clay
execute as @e[scores={BannerWin=50}] run setblock 1000 60 5 command_block[facing=south]{auto:0b,TrackOutput:false}

scoreboard players set @e[scores={BannerWin=150..}] BannerWin 0


# DOOR OPENS
execute as @e[scores={BannerWin=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute as @e[scores={BannerWin=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute as @e[scores={BannerWin=70}] run fill 998 64 1 1002 65 1 clay replace redstone_block
execute as @e[scores={BannerWin=70}] run setblock 39 2 14 clay
execute as @e[scores={BannerWin=70}] run scoreboard objectives remove BannerWin


#[tag=MainPuzzleAEC]