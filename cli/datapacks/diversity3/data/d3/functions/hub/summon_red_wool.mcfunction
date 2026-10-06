####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar RedWoolTimer

scoreboard objectives add RedWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] RedWoolTimer 0
scoreboard players add @e[scores={RedWoolTimer=0..100}] RedWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={RedWoolTimer=1}] run setblock 1 89 1035 air
execute if entity @e[scores={RedWoolTimer=1}] run setblock 1 90 1035 stone_bricks
execute if entity @e[scores={RedWoolTimer=1}] run fill 1 91 1035 1 92 1035 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={RedWoolTimer=1}] run kill @e[tag=RedMonumentStand]
execute if entity @e[scores={RedWoolTimer=1}] run kill @e[tag=RedMonumentBlock]
execute if entity @e[scores={RedWoolTimer=1}] run kill @e[tag=RedMonumentCart]
execute if entity @e[scores={RedWoolTimer=1}] as @e[tag=RedMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={RedWoolTimer=10}] run kill @e[tag=RedMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={RedWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={RedWoolTimer=100}] run summon armor_stand 1 90 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["RedUpperStand","RedMonumentStand","RedMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:stone_bricks"},Tags:["RedMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={RedWoolTimer=100}] run summon armor_stand 1 89 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["RedMiddleStand","RedMonumentStand","RedMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["RedMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={RedWoolTimer=100}] run summon armor_stand 1 88 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["RedLowerStand","RedMonumentStand","RedMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["RedMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={RedWoolTimer=100}] run summon armor_stand 1 91 1035 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["RedLock","RedMonumentStand"]}

execute if entity @e[scores={RedWoolTimer=100}] run playsound entity.minecart.riding master @a 1 90 1035 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={RedWoolTimer=90}] run summon armor_stand 1 89 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["RedBarrierAS","RedBarrier","RedMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["RedBarrierShulker","RedBarrier","RedMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={RedWoolTimer=95}] run teleport @e[tag=RedBarrier] 1 90 1035
execute if entity @e[scores={RedWoolTimer=102}] run teleport @e[tag=RedBarrier] 8 3 1036
execute if entity @e[scores={RedWoolTimer=112}] run kill @e[tag=RedBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={RedWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={RedWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={RedWoolTimer=102..999}] run tag @a remove RedSpot
execute align x align y align z at @e[tag=RedLock] run tag @a[distance=..0.5] add RedSpot
execute if entity @e[scores={RedWoolTimer=100..101}] run effect give @a[tag=RedSpot] levitation 1 255 true
execute align x align y align z at @e[tag=RedLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={RedWoolTimer=100..103}] as @e[tag=RedLock] at @s run teleport @a[tag=RedSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={RedWoolTimer=100..101}] as @e[tag=RedMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] run effect clear @a[tag=RedSpot] levitation
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] as @e[tag=RedLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=RedLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=RedLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=RedUpperStand] run setblock ~ ~ ~ stone_bricks
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=RedMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 1 90 1035 1 0.6 0
execute if entity @e[tag=RedUpperStand,x=1,y=92.1,z=1035,dx=0,dy=0,dz=0] run kill @e[tag=RedMonumentBlock]

execute if entity @e[scores={RedWoolTimer=103}] as @a[tag=RedSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 1 92 1035 stone_bricks run scoreboard players add @e[scores={RedWoolTimer=..200}] RedWoolTimer 1
execute if entity @e[scores={RedWoolTimer=160}] run kill @e[tag=RedMonumentPiece]
execute if entity @e[scores={RedWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:red_wool",Count:1b}],Tags:["RedMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={RedWoolTimer=160..201}] at @e[tag=RedMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={RedWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=RedMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=RedMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={RedWoolTimer=201}] RedWoolTimer 202
scoreboard players add @e[scores={RedWoolTimer=202..}] RedWoolTimer 1

execute if entity @e[scores={RedWoolTimer=202..}] at @e[tag=RedMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={RedWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={RedWoolTimer=..239}] as @e[tag=RedMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={RedWoolTimer=240..249}] as @e[tag=RedMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={RedWoolTimer=250..264}] as @e[tag=RedMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={RedWoolTimer=264}] run stopsound @a
execute if entity @e[scores={RedWoolTimer=264}] run summon armor_stand 15 86 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["RedMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["RedMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:14b}],DisabledSlots:2039583}
execute if entity @e[scores={RedWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={RedWoolTimer=265}] as @e[tag=RedMonumentPiece] at @s run teleport @s ^ ^ ^ facing 1 91.6 1035
execute if entity @e[scores={RedWoolTimer=265..}] as @e[tag=RedMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 1 91.6 1035


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] as @e[tag=RedLock] run data merge entity @s {Marker:0b,Motion:[-0.5d,0.4d,0.2d]}
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.6 0.5
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run setblock 1 92 1035 air
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run summon minecart 1 89 1035 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:red_wool"},DisplayOffset:64,Tags:["RedMonumentCart","MonumentCart"]}
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run teleport @e[tag=RedMonumentShulker] 1 91.755 1035
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run particle falling_dust red_wool 1 92.5 1035 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] RedWoolTimer 1000
execute if entity @e[tag=RedMonumentPiece,x=1,y=92,z=1035,dx=0,dy=0,dz=0] run kill @e[tag=RedMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={RedWoolTimer=265..}] at @e[tag=RedMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={RedWoolTimer=265..}] at @e[tag=RedMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~-1 ~0.7 ~0.2


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={RedWoolTimer=1000}] at @e[tag=RedLock] run tag @a[distance=..0.5] add RedSpot
execute if entity @e[scores={RedWoolTimer=1000}] run effect give @a[tag=RedSpot] instant_damage 1 1 true
execute if entity @e[scores={RedWoolTimer=1000..}] at @e[tag=RedLock] run teleport @a[tag=RedSpot] ~ ~ ~
execute if entity @e[scores={RedWoolTimer=1020..}] run setblock 3 2 14 red_concrete
execute if entity @e[scores={RedWoolTimer=1020..}] run setblock 3 6 14 red_wool
execute if entity @e[scores={RedWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={RedWoolTimer=1020..}] run tag @a remove RedSpot
execute if entity @e[scores={RedWoolTimer=1020..}] run kill @e[tag=RedLock]
execute if entity @e[scores={RedWoolTimer=1020..}] run advancement grant @a only d3:folder_a/puzzle
execute if entity @e[scores={RedWoolTimer=1020..}] run scoreboard objectives remove RedWoolTimer