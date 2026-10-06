####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar YellowWoolTimer

scoreboard objectives add YellowWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] YellowWoolTimer 0
scoreboard players add @e[scores={YellowWoolTimer=0..100}] YellowWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={YellowWoolTimer=1}] run setblock 15 89 1035 air
execute if entity @e[scores={YellowWoolTimer=1}] run setblock 15 90 1035 grass_block
execute if entity @e[scores={YellowWoolTimer=1}] run fill 15 91 1035 15 92 1035 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={YellowWoolTimer=1}] run kill @e[tag=YellowMonumentStand]
execute if entity @e[scores={YellowWoolTimer=1}] run kill @e[tag=YellowMonumentBlock]
execute if entity @e[scores={YellowWoolTimer=1}] run kill @e[tag=YellowMonumentCart]
execute if entity @e[scores={YellowWoolTimer=1}] as @e[tag=YellowMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={YellowWoolTimer=10}] run kill @e[tag=YellowMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={YellowWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={YellowWoolTimer=100}] run summon armor_stand 15 90 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["YellowUpperStand","YellowMonumentStand","YellowMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:grass_block"},Tags:["YellowMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={YellowWoolTimer=100}] run summon armor_stand 15 89 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["YellowMiddleStand","YellowMonumentStand","YellowMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["YellowMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={YellowWoolTimer=100}] run summon armor_stand 15 88 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["YellowLowerStand","YellowMonumentStand","YellowMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["YellowMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={YellowWoolTimer=100}] run summon armor_stand 15 91 1035 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["YellowLock","YellowMonumentStand"]}

execute if entity @e[scores={YellowWoolTimer=100}] run playsound entity.minecart.riding master @a 15 90 1035 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={YellowWoolTimer=90}] run summon armor_stand 15 89 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["YellowBarrierAS","YellowBarrier","YellowMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["YellowBarrierShulker","YellowBarrier","YellowMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={YellowWoolTimer=95}] run teleport @e[tag=YellowBarrier] 15 90 1035
execute if entity @e[scores={YellowWoolTimer=102}] run teleport @e[tag=YellowBarrier] 8 3 1036
execute if entity @e[scores={YellowWoolTimer=112}] run kill @e[tag=YellowBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={YellowWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={YellowWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={YellowWoolTimer=102..999}] run tag @a remove YellowSpot
execute align x align y align z at @e[tag=YellowLock] run tag @a[distance=..0.5] add YellowSpot
execute if entity @e[scores={YellowWoolTimer=100..101}] run effect give @a[tag=YellowSpot] levitation 1 255 true
execute align x align y align z at @e[tag=YellowLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={YellowWoolTimer=100..103}] as @e[tag=YellowLock] at @s run teleport @a[tag=YellowSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={YellowWoolTimer=100..101}] as @e[tag=YellowMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] run effect clear @a[tag=YellowSpot] levitation
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] as @e[tag=YellowLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=YellowLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=YellowLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=YellowUpperStand] run setblock ~ ~ ~ grass_block
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] at @e[tag=YellowMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 15 90 1035 1 0.6 0
execute if entity @e[tag=YellowUpperStand,x=15,y=92.1,z=1035,dx=0,dy=0,dz=0] run kill @e[tag=YellowMonumentBlock]

execute if entity @e[scores={YellowWoolTimer=103}] as @a[tag=YellowSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 15 92 1035 grass_block run scoreboard players add @e[scores={YellowWoolTimer=..200}] YellowWoolTimer 1
execute if entity @e[scores={YellowWoolTimer=160}] run kill @e[tag=YellowMonumentPiece]
execute if entity @e[scores={YellowWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:yellow_wool",Count:1b}],Tags:["YellowMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={YellowWoolTimer=160..201}] at @e[tag=YellowMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={YellowWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=YellowMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=YellowMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={YellowWoolTimer=201}] YellowWoolTimer 202
scoreboard players add @e[scores={YellowWoolTimer=202..}] YellowWoolTimer 1

execute if entity @e[scores={YellowWoolTimer=202..}] at @e[tag=YellowMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={YellowWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={YellowWoolTimer=..239}] as @e[tag=YellowMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={YellowWoolTimer=240..249}] as @e[tag=YellowMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={YellowWoolTimer=250..264}] as @e[tag=YellowMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={YellowWoolTimer=264}] run stopsound @a
execute if entity @e[scores={YellowWoolTimer=264}] run summon armor_stand 15 86 1035 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["YellowMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["YellowMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:4b}],DisabledSlots:2039583}
execute if entity @e[scores={YellowWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={YellowWoolTimer=265}] as @e[tag=YellowMonumentPiece] at @s run teleport @s ^ ^ ^ facing 15 91.6 1035
execute if entity @e[scores={YellowWoolTimer=265..}] as @e[tag=YellowMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 15 91.6 1035


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] as @e[tag=YellowLock] run data merge entity @s {Marker:0b,Motion:[0.5d,0.4d,0.2d]}
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run setblock 15 92 1035 air
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run summon minecart 15 89 1035 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:yellow_wool"},DisplayOffset:64,Tags:["YellowMonumentCart","MonumentCart"]}
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run teleport @e[tag=YellowMonumentShulker] 15 91.755 1035
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run particle falling_dust yellow_wool 15 92.5 1035 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] YellowWoolTimer 1000
execute if entity @e[tag=YellowMonumentPiece,x=15,y=92,z=1035,dx=0,dy=0,dz=0] run kill @e[tag=YellowMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={YellowWoolTimer=265..}] at @e[tag=YellowMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={YellowWoolTimer=265..}] at @e[tag=YellowMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~1 ~0.7 ~0.2


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={YellowWoolTimer=1000}] at @e[tag=YellowLock] run tag @a[distance=..0.5] add YellowSpot
execute if entity @e[scores={YellowWoolTimer=1000}] run effect give @a[tag=YellowSpot] instant_damage 1 1 true
execute if entity @e[scores={YellowWoolTimer=1000..}] at @e[tag=YellowLock] run teleport @a[tag=YellowSpot] ~ ~ ~
execute if entity @e[scores={YellowWoolTimer=1020..}] run setblock 10 2 14 yellow_concrete
execute if entity @e[scores={YellowWoolTimer=1020..}] run setblock 10 6 14 yellow_wool
execute if entity @e[scores={YellowWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={YellowWoolTimer=1020..}] run tag @a remove YellowSpot
execute if entity @e[scores={YellowWoolTimer=1020..}] run kill @e[tag=YellowLock]
execute if entity @e[scores={YellowWoolTimer=1020..}] run advancement grant @a only d3:folder_a/arena
execute if entity @e[scores={YellowWoolTimer=1020..}] run scoreboard objectives remove YellowWoolTimer