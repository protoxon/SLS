####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OrangeWoolTimer

scoreboard objectives add OrangeWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] OrangeWoolTimer 0
scoreboard players add @e[scores={OrangeWoolTimer=0..100}] OrangeWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={OrangeWoolTimer=1}] run setblock 16 89 1033 air
execute if entity @e[scores={OrangeWoolTimer=1}] run setblock 16 90 1033 grass_block
execute if entity @e[scores={OrangeWoolTimer=1}] run fill 16 91 1033 16 92 1033 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={OrangeWoolTimer=1}] run kill @e[tag=OrangeMonumentStand]
execute if entity @e[scores={OrangeWoolTimer=1}] run kill @e[tag=OrangeMonumentBlock]
execute if entity @e[scores={OrangeWoolTimer=1}] run kill @e[tag=OrangeMonumentCart]
execute if entity @e[scores={OrangeWoolTimer=1}] as @e[tag=OrangeMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={OrangeWoolTimer=10}] run kill @e[tag=OrangeMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={OrangeWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={OrangeWoolTimer=100}] run summon armor_stand 16 90 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["OrangeUpperStand","OrangeMonumentStand","OrangeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:grass_block"},Tags:["OrangeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={OrangeWoolTimer=100}] run summon armor_stand 16 89 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["OrangeMiddleStand","OrangeMonumentStand","OrangeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["OrangeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={OrangeWoolTimer=100}] run summon armor_stand 16 88 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["OrangeLowerStand","OrangeMonumentStand","OrangeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["OrangeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={OrangeWoolTimer=100}] run summon armor_stand 16 91 1033 {Invisible:1b,Small:true,NoGravity:true,Marker:true,Tags:["OrangeLock","OrangeMonumentStand"]}

execute if entity @e[scores={OrangeWoolTimer=100}] run playsound entity.minecart.riding master @a 16 90 1033 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={OrangeWoolTimer=90}] run summon armor_stand 16 89 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["OrangeBarrierAS","OrangeBarrier","OrangeMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["OrangeBarrierShulker","OrangeBarrier","OrangeMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={OrangeWoolTimer=95}] run teleport @e[tag=OrangeBarrier] 16 90 1033
execute if entity @e[scores={OrangeWoolTimer=102}] run teleport @e[tag=OrangeBarrier] 8 3 1036
execute if entity @e[scores={OrangeWoolTimer=112}] run kill @e[tag=OrangeBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={OrangeWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={OrangeWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={OrangeWoolTimer=102..999}] run tag @a remove OrangeSpot
execute align x align y align z at @e[tag=OrangeLock] run tag @a[distance=..0.5] add OrangeSpot
execute if entity @e[scores={OrangeWoolTimer=100..101}] run effect give @a[tag=OrangeSpot] levitation 1 255 true
execute align x align y align z at @e[tag=OrangeLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={OrangeWoolTimer=100..103}] as @e[tag=OrangeLock] at @s run teleport @a[tag=OrangeSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={OrangeWoolTimer=100..101}] as @e[tag=OrangeMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] run effect clear @a[tag=OrangeSpot] levitation
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] as @e[tag=OrangeLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=OrangeLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=OrangeLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=OrangeUpperStand] run setblock ~ ~ ~ grass_block
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] at @e[tag=OrangeMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 16 90 1033 1 0.6 0
execute if entity @e[tag=OrangeUpperStand,x=16,y=92.1,z=1033,dx=0,dy=0,dz=0] run kill @e[tag=OrangeMonumentBlock]

execute if entity @e[scores={OrangeWoolTimer=103}] as @a[tag=OrangeSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 16 92 1033 grass_block run scoreboard players add @e[scores={OrangeWoolTimer=..200}] OrangeWoolTimer 1
execute if entity @e[scores={OrangeWoolTimer=160}] run kill @e[tag=OrangeMonumentPiece]
execute if entity @e[scores={OrangeWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:orange_wool",Count:1b}],Tags:["OrangeMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={OrangeWoolTimer=160..201}] at @e[tag=OrangeMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={OrangeWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=OrangeMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=OrangeMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={OrangeWoolTimer=201}] OrangeWoolTimer 202
scoreboard players add @e[scores={OrangeWoolTimer=202..}] OrangeWoolTimer 1

execute if entity @e[scores={OrangeWoolTimer=202..}] at @e[tag=OrangeMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={OrangeWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={OrangeWoolTimer=..239}] as @e[tag=OrangeMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={OrangeWoolTimer=240..249}] as @e[tag=OrangeMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={OrangeWoolTimer=250..264}] as @e[tag=OrangeMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={OrangeWoolTimer=264}] run stopsound @a
execute if entity @e[scores={OrangeWoolTimer=264}] run summon armor_stand 16 86 1033 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["OrangeMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["OrangeMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:1b}],DisabledSlots:2039583}
execute if entity @e[scores={OrangeWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={OrangeWoolTimer=265}] as @e[tag=OrangeMonumentPiece] at @s run teleport @s ^ ^ ^ facing 16 91.6 1033
execute if entity @e[scores={OrangeWoolTimer=265..}] as @e[tag=OrangeMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 16 91.6 1033


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] as @e[tag=OrangeLock] run data merge entity @s {Marker:0b,Motion:[0.5d,0.4d,0.0d]}
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.7 0.5
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run setblock 16 92 1033 air
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run summon minecart 16 89 1033 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:orange_wool"},DisplayOffset:64,Tags:["OrangeMonumentCart","MonumentCart"]}
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run teleport @e[tag=OrangeMonumentShulker] 16 91.755 1033
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run particle falling_dust orange_wool 16 92.5 1033 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] OrangeWoolTimer 1000
execute if entity @e[tag=OrangeMonumentPiece,x=16,y=92,z=1033,dx=0,dy=0,dz=0] run kill @e[tag=OrangeMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={OrangeWoolTimer=265..}] at @e[tag=OrangeMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={OrangeWoolTimer=265..}] at @e[tag=OrangeMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~1 ~0.7 ~


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={OrangeWoolTimer=1000}] at @e[tag=OrangeLock] run tag @a[distance=..0.5] add OrangeSpot
execute if entity @e[scores={OrangeWoolTimer=1000}] run effect give @a[tag=OrangeSpot] instant_damage 1 1 true
execute if entity @e[scores={OrangeWoolTimer=1000..}] at @e[tag=OrangeLock] run teleport @a[tag=OrangeSpot] ~ ~ ~
execute if entity @e[scores={OrangeWoolTimer=1020..}] run setblock 11 2 14 orange_concrete
execute if entity @e[scores={OrangeWoolTimer=1020..}] run setblock 11 6 14 orange_wool
execute if entity @e[scores={OrangeWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={OrangeWoolTimer=1020..}] run tag @a remove OrangeSpot
execute if entity @e[scores={OrangeWoolTimer=1020..}] run kill @e[tag=OrangeLock]
execute if entity @e[scores={OrangeWoolTimer=1020..}] run advancement grant @a only d3:folder_a/adventure
execute if entity @e[scores={OrangeWoolTimer=1020..}] run scoreboard objectives remove OrangeWoolTimer