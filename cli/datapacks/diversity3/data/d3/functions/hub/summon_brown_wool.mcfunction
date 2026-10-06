####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BrownWoolTimer

scoreboard objectives add BrownWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] BrownWoolTimer 0
scoreboard players add @e[scores={BrownWoolTimer=0..100}] BrownWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={BrownWoolTimer=1}] run setblock 2 89 1037 air
execute if entity @e[scores={BrownWoolTimer=1}] run setblock 2 90 1037 mossy_stone_bricks
execute if entity @e[scores={BrownWoolTimer=1}] run fill 2 91 1037 2 92 1037 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={BrownWoolTimer=1}] run kill @e[tag=BrownMonumentStand]
execute if entity @e[scores={BrownWoolTimer=1}] run kill @e[tag=BrownMonumentBlock]
execute if entity @e[scores={BrownWoolTimer=1}] run kill @e[tag=BrownMonumentCart]
execute if entity @e[scores={BrownWoolTimer=1}] as @e[tag=BrownMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={BrownWoolTimer=10}] run kill @e[tag=BrownMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={BrownWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={BrownWoolTimer=100}] run summon armor_stand 2 90 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BrownUpperStand","BrownMonumentStand","BrownMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:mossy_stone_bricks"},Tags:["BrownMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BrownWoolTimer=100}] run summon armor_stand 2 89 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BrownMiddleStand","BrownMonumentStand","BrownMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["BrownMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BrownWoolTimer=100}] run summon armor_stand 2 88 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BrownLowerStand","BrownMonumentStand","BrownMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["BrownMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BrownWoolTimer=100}] run summon armor_stand 2 91 1037 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["BrownLock","BrownMonumentStand"]}

execute if entity @e[scores={BrownWoolTimer=100}] run playsound entity.minecart.riding master @a 2 90 1037 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={BrownWoolTimer=90}] run summon armor_stand 2 89 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BrownBarrierAS","BrownBarrier","BrownMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["BrownBarrierShulker","BrownBarrier","BrownMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={BrownWoolTimer=95}] run teleport @e[tag=BrownBarrier] 2 90 1037
execute if entity @e[scores={BrownWoolTimer=102}] run teleport @e[tag=BrownBarrier] 8 3 1036
execute if entity @e[scores={BrownWoolTimer=112}] run kill @e[tag=BrownBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={BrownWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={BrownWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={BrownWoolTimer=102..999}] run tag @a remove BrownSpot
execute align x align y align z at @e[tag=BrownLock] run tag @a[distance=..0.5] add BrownSpot
execute if entity @e[scores={BrownWoolTimer=100..101}] run effect give @a[tag=BrownSpot] levitation 1 255 true
execute align x align y align z at @e[tag=BrownLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={BrownWoolTimer=100..103}] as @e[tag=BrownLock] at @s run teleport @a[tag=BrownSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={BrownWoolTimer=100..101}] as @e[tag=BrownMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] run effect clear @a[tag=BrownSpot] levitation
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] as @e[tag=BrownLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=BrownLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=BrownLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=BrownUpperStand] run setblock ~ ~ ~ mossy_stone_bricks
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=BrownMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 2 90 1037 1 0.6 0
execute if entity @e[tag=BrownUpperStand,x=2,y=92.1,z=1037,dx=0,dy=0,dz=0] run kill @e[tag=BrownMonumentBlock]

execute if entity @e[scores={BrownWoolTimer=103}] as @a[tag=BrownSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 2 92 1037 mossy_stone_bricks run scoreboard players add @e[scores={BrownWoolTimer=..200}] BrownWoolTimer 1
execute if entity @e[scores={BrownWoolTimer=160}] run kill @e[tag=BrownMonumentPiece]
execute if entity @e[scores={BrownWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:brown_wool",Count:1b}],Tags:["BrownMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={BrownWoolTimer=160..201}] at @e[tag=BrownMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={BrownWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=BrownMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=BrownMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={BrownWoolTimer=201}] BrownWoolTimer 202
scoreboard players add @e[scores={BrownWoolTimer=202..}] BrownWoolTimer 1

execute if entity @e[scores={BrownWoolTimer=202..}] at @e[tag=BrownMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={BrownWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={BrownWoolTimer=..239}] as @e[tag=BrownMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={BrownWoolTimer=240..249}] as @e[tag=BrownMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={BrownWoolTimer=250..264}] as @e[tag=BrownMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={BrownWoolTimer=264}] run stopsound @a
execute if entity @e[scores={BrownWoolTimer=264}] run summon armor_stand 2 86 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BrownMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["BrownMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:12b}],DisabledSlots:2039583}
execute if entity @e[scores={BrownWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={BrownWoolTimer=265}] as @e[tag=BrownMonumentPiece] at @s run teleport @s ^ ^ ^ facing 2 91.6 1037
execute if entity @e[scores={BrownWoolTimer=265..}] as @e[tag=BrownMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 2 91.6 1037


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] as @e[tag=BrownLock] run data merge entity @s {Marker:0b,Motion:[-0.4d,0.4d,0.4d]}
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.6 0.5
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run setblock 2 92 1037 air
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run summon minecart 2 89 1037 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:brown_wool"},DisplayOffset:64,Tags:["BrownMonumentCart","MonumentCart"]}
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run teleport @e[tag=BrownMonumentShulker] 2 91.755 1037
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run particle falling_dust brown_wool 2 92.5 1037 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] BrownWoolTimer 1000
execute if entity @e[tag=BrownMonumentPiece,x=2,y=92,z=1037,dx=0,dy=0,dz=0] run kill @e[tag=BrownMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={BrownWoolTimer=265..}] at @e[tag=BrownMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={BrownWoolTimer=265..}] at @e[tag=BrownMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~-0.5 ~0.7 ~0.5


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={BrownWoolTimer=1000}] at @e[tag=BrownLock] run tag @a[distance=..0.5] add BrownSpot
execute if entity @e[scores={BrownWoolTimer=1000}] run effect give @a[tag=BrownSpot] instant_damage 1 1 true
execute if entity @e[scores={BrownWoolTimer=1000..}] at @e[tag=BrownLock] run teleport @a[tag=BrownSpot] ~ ~ ~
execute if entity @e[scores={BrownWoolTimer=1020..}] run setblock 4 2 14 brown_concrete
execute if entity @e[scores={BrownWoolTimer=1020..}] run setblock 4 6 14 brown_wool
execute if entity @e[scores={BrownWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={BrownWoolTimer=1020..}] run tag @a remove BrownSpot
execute if entity @e[scores={BrownWoolTimer=1020..}] run kill @e[tag=BrownLock]
execute if entity @e[scores={BrownWoolTimer=1020..}] run advancement grant @a only d3:folder_a/survival
execute if entity @e[scores={BrownWoolTimer=1020..}] run scoreboard objectives remove BrownWoolTimer