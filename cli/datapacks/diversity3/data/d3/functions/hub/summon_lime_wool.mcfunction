####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LimeWoolTimer

scoreboard objectives add LimeWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] LimeWoolTimer 0
scoreboard players add @e[scores={LimeWoolTimer=0..100}] LimeWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={LimeWoolTimer=1}] run setblock 14 89 1037 air
execute if entity @e[scores={LimeWoolTimer=1}] run setblock 14 90 1037 mossy_stone_bricks
execute if entity @e[scores={LimeWoolTimer=1}] run fill 14 91 1037 14 92 1037 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={LimeWoolTimer=1}] run kill @e[tag=LimeMonumentStand]
execute if entity @e[scores={LimeWoolTimer=1}] run kill @e[tag=LimeMonumentBlock]
execute if entity @e[scores={LimeWoolTimer=1}] run kill @e[tag=LimeMonumentCart]
execute if entity @e[scores={LimeWoolTimer=1}] as @e[tag=LimeMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={LimeWoolTimer=10}] run kill @e[tag=LimeMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={LimeWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={LimeWoolTimer=100}] run summon armor_stand 14 90 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["LimeUpperStand","LimeMonumentStand","LimeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:mossy_stone_bricks"},Tags:["LimeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={LimeWoolTimer=100}] run summon armor_stand 14 89 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["LimeMiddleStand","LimeMonumentStand","LimeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["LimeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={LimeWoolTimer=100}] run summon armor_stand 14 88 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["LimeLowerStand","LimeMonumentStand","LimeMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["LimeMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={LimeWoolTimer=100}] run summon armor_stand 14 91 1037 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["LimeLock","LimeMonumentStand"]}

execute if entity @e[scores={LimeWoolTimer=100}] run playsound entity.minecart.riding master @a 14 90 1037 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={LimeWoolTimer=90}] run summon armor_stand 14 89 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["LimeBarrierAS","LimeBarrier","LimeMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["LimeBarrierShulker","LimeBarrier","LimeMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={LimeWoolTimer=95}] run teleport @e[tag=LimeBarrier] 14 90 1037
execute if entity @e[scores={LimeWoolTimer=102}] run teleport @e[tag=LimeBarrier] 8 3 1036
execute if entity @e[scores={LimeWoolTimer=112}] run kill @e[tag=LimeBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={LimeWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={LimeWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={LimeWoolTimer=102..999}] run tag @a remove LimeSpot
execute align x align y align z at @e[tag=LimeLock] run tag @a[distance=..0.5] add LimeSpot
execute if entity @e[scores={LimeWoolTimer=100..101}] run effect give @a[tag=LimeSpot] levitation 1 255 true
execute align x align y align z at @e[tag=LimeLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={LimeWoolTimer=100..103}] as @e[tag=LimeLock] at @s run teleport @a[tag=LimeSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={LimeWoolTimer=100..101}] as @e[tag=LimeMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] run effect clear @a[tag=LimeSpot] levitation
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] as @e[tag=LimeLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=LimeLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=LimeLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=LimeUpperStand] run setblock ~ ~ ~ mossy_stone_bricks
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] at @e[tag=LimeMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 14 90 1037 1 0.6 0
execute if entity @e[tag=LimeUpperStand,x=14,y=92.1,z=1037,dx=0,dy=0,dz=0] run kill @e[tag=LimeMonumentBlock]

execute if entity @e[scores={LimeWoolTimer=103}] as @a[tag=LimeSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 14 92 1037 mossy_stone_bricks run scoreboard players add @e[scores={LimeWoolTimer=..200}] LimeWoolTimer 1
execute if entity @e[scores={LimeWoolTimer=160}] run kill @e[tag=LimeMonumentPiece]
execute if entity @e[scores={LimeWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:lime_wool",Count:1b}],Tags:["LimeMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={LimeWoolTimer=160..201}] at @e[tag=LimeMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={LimeWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=LimeMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=LimeMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={LimeWoolTimer=201}] LimeWoolTimer 202
scoreboard players add @e[scores={LimeWoolTimer=202..}] LimeWoolTimer 1

execute if entity @e[scores={LimeWoolTimer=202..}] at @e[tag=LimeMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={LimeWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={LimeWoolTimer=..239}] as @e[tag=LimeMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={LimeWoolTimer=240..249}] as @e[tag=LimeMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={LimeWoolTimer=250..264}] as @e[tag=LimeMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={LimeWoolTimer=264}] run stopsound @a
execute if entity @e[scores={LimeWoolTimer=264}] run summon armor_stand 14 86 1037 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["LimeMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["LimeMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:5b}],DisabledSlots:2039583}
execute if entity @e[scores={LimeWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={LimeWoolTimer=265}] as @e[tag=LimeMonumentPiece] at @s run teleport @s ^ ^ ^ facing 14 91.6 1037
execute if entity @e[scores={LimeWoolTimer=265..}] as @e[tag=LimeMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 14 91.6 1037


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] as @e[tag=LimeLock] run data merge entity @s {Marker:0b,Motion:[0.4d,0.4d,0.4d]}
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.9 0.5
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run setblock 14 92 1037 air
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run summon minecart 14 89 1037 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:lime_wool"},DisplayOffset:64,Tags:["LimeMonumentCart","MonumentCart"]}
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run teleport @e[tag=LimeMonumentShulker] 14 91.755 1037
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run particle falling_dust lime_wool 14 92.5 1037 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] LimeWoolTimer 1000
execute if entity @e[tag=LimeMonumentPiece,x=14,y=92,z=1037,dx=0,dy=0,dz=0] run kill @e[tag=LimeMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={LimeWoolTimer=265..}] at @e[tag=LimeMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={LimeWoolTimer=265..}] at @e[tag=LimeMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~0.5 ~0.7 ~0.5


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={LimeWoolTimer=1000}] at @e[tag=LimeLock] run tag @a[distance=..0.5] add LimeSpot
execute if entity @e[scores={LimeWoolTimer=1000}] run effect give @a[tag=LimeSpot] instant_damage 1 1 true
execute if entity @e[scores={LimeWoolTimer=1000..}] at @e[tag=LimeLock] run teleport @a[tag=LimeSpot] ~ ~ ~
execute if entity @e[scores={LimeWoolTimer=1020..}] run setblock 9 2 14 lime_concrete
execute if entity @e[scores={LimeWoolTimer=1020..}] run setblock 9 6 14 lime_wool
execute if entity @e[scores={LimeWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={LimeWoolTimer=1020..}] run tag @a remove LimeSpot
execute if entity @e[scores={LimeWoolTimer=1020..}] run kill @e[tag=LimeLock]
execute if entity @e[scores={LimeWoolTimer=1020..}] run advancement grant @a only d3:folder_a/trivia
execute if entity @e[scores={LimeWoolTimer=1020..}] run scoreboard objectives remove LimeWoolTimer