####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlackWoolTimer

scoreboard objectives add BlackWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] BlackWoolTimer 0
scoreboard players add @e[scores={BlackWoolTimer=0..100}] BlackWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={BlackWoolTimer=1}] run setblock 0 89 1033 air
execute if entity @e[scores={BlackWoolTimer=1}] run setblock 0 90 1033 coarse_dirt
execute if entity @e[scores={BlackWoolTimer=1}] run fill 0 91 1033 0 92 1033 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={BlackWoolTimer=1}] run kill @e[tag=BlackMonumentStand]
execute if entity @e[scores={BlackWoolTimer=1}] run kill @e[tag=BlackMonumentBlock]
execute if entity @e[scores={BlackWoolTimer=1}] run kill @e[tag=BlackMonumentCart]
execute if entity @e[scores={BlackWoolTimer=1}] as @e[tag=BlackMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={BlackWoolTimer=10}] run kill @e[tag=BlackMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={BlackWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={BlackWoolTimer=100}] run summon armor_stand 0 90 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlackUpperStand","BlackMonumentStand","BlackMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:coarse_dirt"},Tags:["BlackMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlackWoolTimer=100}] run summon armor_stand 0 89 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlackMiddleStand","BlackMonumentStand","BlackMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["BlackMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlackWoolTimer=100}] run summon armor_stand 0 88 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlackLowerStand","BlackMonumentStand","BlackMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["BlackMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlackWoolTimer=100}] run summon armor_stand 0 91 1033 {Invisible:1b,Small:true,NoGravity:true,Marker:true,Tags:["BlackLock","BlackMonumentStand"]}

execute if entity @e[scores={BlackWoolTimer=100}] run playsound entity.minecart.riding master @a 0 90 1033 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={BlackWoolTimer=90}] run summon armor_stand 0 89 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlackBarrierAS","BlackBarrier","BlackMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["BlackBarrierShulker","BlackBarrier","BlackMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={BlackWoolTimer=95}] run teleport @e[tag=BlackBarrier] 0 90 1033
execute if entity @e[scores={BlackWoolTimer=102}] run teleport @e[tag=BlackBarrier] 8 3 1036
execute if entity @e[scores={BlackWoolTimer=112}] run kill @e[tag=BlackBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={BlackWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={BlackWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={BlackWoolTimer=102..999}] run tag @a remove BlackSpot
execute align x align y align z at @e[tag=BlackLock] run tag @a[distance=..0.5] add BlackSpot
execute if entity @e[scores={BlackWoolTimer=100..101}] run effect give @a[tag=BlackSpot] levitation 1 255 true
execute align x align y align z at @e[tag=BlackLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={BlackWoolTimer=100..103}] as @e[tag=BlackLock] at @s run teleport @a[tag=BlackSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={BlackWoolTimer=100..101}] as @e[tag=BlackMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] run effect clear @a[tag=BlackSpot] levitation
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] as @e[tag=BlackLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=BlackLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=BlackLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=BlackUpperStand] run setblock ~ ~ ~ coarse_dirt
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=BlackMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 0 90 1033 1 0.6 0
execute if entity @e[tag=BlackUpperStand,x=0,y=92.1,z=1033,dx=0,dy=0,dz=0] run kill @e[tag=BlackMonumentBlock]

execute if entity @e[scores={BlackWoolTimer=103}] as @a[tag=BlackSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 0 92 1033 coarse_dirt run scoreboard players add @e[scores={BlackWoolTimer=..200}] BlackWoolTimer 1
execute if entity @e[scores={BlackWoolTimer=160}] run kill @e[tag=BlackMonumentPiece]
execute if entity @e[scores={BlackWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:black_wool",Count:1b}],Tags:["BlackMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={BlackWoolTimer=160..201}] at @e[tag=BlackMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={BlackWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=BlackMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=BlackMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={BlackWoolTimer=201}] BlackWoolTimer 202
scoreboard players add @e[scores={BlackWoolTimer=202..}] BlackWoolTimer 1

execute if entity @e[scores={BlackWoolTimer=202..}] at @e[tag=BlackMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={BlackWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={BlackWoolTimer=..239}] as @e[tag=BlackMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={BlackWoolTimer=240..249}] as @e[tag=BlackMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={BlackWoolTimer=250..264}] as @e[tag=BlackMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={BlackWoolTimer=264}] run stopsound @a
execute if entity @e[scores={BlackWoolTimer=264}] run summon armor_stand 0 86 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlackMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["BlackMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:15b}],DisabledSlots:2039583}
execute if entity @e[scores={BlackWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={BlackWoolTimer=265}] as @e[tag=BlackMonumentPiece] at @s run teleport @s ^ ^ ^ facing 0 91.6 1033
execute if entity @e[scores={BlackWoolTimer=265..}] as @e[tag=BlackMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 0 91.6 1033


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] as @e[tag=BlackLock] run data merge entity @s {Marker:0b,Motion:[-0.5d,0.4d,0.0d]}
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run setblock 0 92 1033 air
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run summon minecart 0 89 1033 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:black_wool"},DisplayOffset:64,Tags:["BlackMonumentCart","MonumentCart"]}
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run teleport @e[tag=BlackMonumentShulker] 0 91.755 1033
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run particle falling_dust black_wool 0 92.5 1033 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] BlackWoolTimer 1000
execute if entity @e[tag=BlackMonumentPiece,x=0,y=92,z=1033,dx=0,dy=0,dz=0] run kill @e[tag=BlackMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={BlackWoolTimer=265..}] at @e[tag=BlackMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={BlackWoolTimer=265..}] at @e[tag=BlackMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~-1 ~0.7 ~


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={BlackWoolTimer=1000}] at @e[tag=BlackLock] run tag @a[distance=..0.5] add BlackSpot
execute if entity @e[scores={BlackWoolTimer=1000}] run effect give @a[tag=BlackSpot] instant_damage 1 1 true
execute if entity @e[scores={BlackWoolTimer=1000..}] at @e[tag=BlackLock] run teleport @a[tag=BlackSpot] ~ ~ ~
execute if entity @e[scores={BlackWoolTimer=1020..}] run setblock 2 2 14 black_concrete
execute if entity @e[scores={BlackWoolTimer=1020..}] run setblock 2 6 14 black_wool
execute if entity @e[scores={BlackWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={BlackWoolTimer=1020..}] run tag @a remove BlackSpot
execute if entity @e[scores={BlackWoolTimer=1020..}] run kill @e[tag=BlackLock]
execute if entity @e[scores={BlackWoolTimer=1020..}] run advancement grant @a only d3:folder_a/boss
execute if entity @e[scores={BlackWoolTimer=1020..}] run scoreboard objectives remove BlackWoolTimer