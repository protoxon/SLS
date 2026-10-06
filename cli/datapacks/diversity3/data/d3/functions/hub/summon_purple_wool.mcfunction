####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PurpleWoolTimer

scoreboard objectives add PurpleWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] PurpleWoolTimer 0
scoreboard players add @e[scores={PurpleWoolTimer=0..100}] PurpleWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={PurpleWoolTimer=1}] run setblock 6 89 1039 air
execute if entity @e[scores={PurpleWoolTimer=1}] run setblock 6 90 1039 cracked_stone_bricks
execute if entity @e[scores={PurpleWoolTimer=1}] run fill 6 91 1039 6 92 1039 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={PurpleWoolTimer=1}] run kill @e[tag=PurpleMonumentStand]
execute if entity @e[scores={PurpleWoolTimer=1}] run kill @e[tag=PurpleMonumentBlock]
execute if entity @e[scores={PurpleWoolTimer=1}] run kill @e[tag=PurpleMonumentCart]
execute if entity @e[scores={PurpleWoolTimer=1}] as @e[tag=PurpleMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={PurpleWoolTimer=10}] run kill @e[tag=PurpleMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={PurpleWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={PurpleWoolTimer=100}] run summon armor_stand 6 90 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PurpleUpperStand","PurpleMonumentStand","PurpleMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:cracked_stone_bricks"},Tags:["PurpleMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PurpleWoolTimer=100}] run summon armor_stand 6 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PurpleMiddleStand","PurpleMonumentStand","PurpleMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["PurpleMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PurpleWoolTimer=100}] run summon armor_stand 6 88 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PurpleLowerStand","PurpleMonumentStand","PurpleMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["PurpleMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PurpleWoolTimer=100}] run summon armor_stand 6 91 1039 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["PurpleLock","PurpleMonumentStand"]}

execute if entity @e[scores={PurpleWoolTimer=100}] run playsound entity.minecart.riding master @a 6 90 1039 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={PurpleWoolTimer=90}] run summon armor_stand 6 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PurpleBarrierAS","PurpleBarrier","PurpleMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["PurpleBarrierShulker","PurpleBarrier","PurpleMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={PurpleWoolTimer=95}] run teleport @e[tag=PurpleBarrier] 6 90 1039
execute if entity @e[scores={PurpleWoolTimer=102}] run teleport @e[tag=PurpleBarrier] 8 3 1036
execute if entity @e[scores={PurpleWoolTimer=112}] run kill @e[tag=PurpleBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={PurpleWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={PurpleWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={PurpleWoolTimer=102..999}] run tag @a remove PurpleSpot
execute align x align y align z at @e[tag=PurpleLock] run tag @a[distance=..0.5] add PurpleSpot
execute if entity @e[scores={PurpleWoolTimer=100..101}] run effect give @a[tag=PurpleSpot] levitation 1 255 true
execute align x align y align z at @e[tag=PurpleLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={PurpleWoolTimer=100..103}] as @e[tag=PurpleLock] at @s run teleport @a[tag=PurpleSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={PurpleWoolTimer=100..101}] as @e[tag=PurpleMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] run effect clear @a[tag=PurpleSpot] levitation
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] as @e[tag=PurpleLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=PurpleLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=PurpleLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=PurpleUpperStand] run setblock ~ ~ ~ cracked_stone_bricks
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=PurpleMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 6 90 1039 1 0.6 0
execute if entity @e[tag=PurpleUpperStand,x=6,y=92.1,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=PurpleMonumentBlock]

execute if entity @e[scores={PurpleWoolTimer=103}] as @a[tag=PurpleSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 6 92 1039 cracked_stone_bricks run scoreboard players add @e[scores={PurpleWoolTimer=..200}] PurpleWoolTimer 1
execute if entity @e[scores={PurpleWoolTimer=160}] run kill @e[tag=PurpleMonumentPiece]
execute if entity @e[scores={PurpleWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:purple_wool",Count:1b}],Tags:["PurpleMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={PurpleWoolTimer=160..201}] at @e[tag=PurpleMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={PurpleWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=PurpleMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=PurpleMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={PurpleWoolTimer=201}] PurpleWoolTimer 202
scoreboard players add @e[scores={PurpleWoolTimer=202..}] PurpleWoolTimer 1

execute if entity @e[scores={PurpleWoolTimer=202..}] at @e[tag=PurpleMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={PurpleWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={PurpleWoolTimer=..239}] as @e[tag=PurpleMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={PurpleWoolTimer=240..249}] as @e[tag=PurpleMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={PurpleWoolTimer=250..264}] as @e[tag=PurpleMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={PurpleWoolTimer=264}] run stopsound @a
execute if entity @e[scores={PurpleWoolTimer=264}] run summon armor_stand 10 86 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PurpleMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["PurpleMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:10b}],DisabledSlots:2039583}
execute if entity @e[scores={PurpleWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={PurpleWoolTimer=265}] as @e[tag=PurpleMonumentPiece] at @s run teleport @s ^ ^ ^ facing 6 91.6 1039
execute if entity @e[scores={PurpleWoolTimer=265..}] as @e[tag=PurpleMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 6 91.6 1039


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] as @e[tag=PurpleLock] run data merge entity @s {Marker:0b,Motion:[0.0d,0.4d,0.5d]}
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.8 0.5
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run setblock 6 92 1039 air
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run summon minecart 6 89 1039 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:purple_wool"},DisplayOffset:64,Tags:["PurpleMonumentCart","MonumentCart"]}
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run teleport @e[tag=PurpleMonumentShulker] 6 91.755 1039
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run particle falling_dust purple_wool 6 92.5 1039 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] PurpleWoolTimer 1000
execute if entity @e[tag=PurpleMonumentPiece,x=6,y=92,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=PurpleMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={PurpleWoolTimer=265..}] at @e[tag=PurpleMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={PurpleWoolTimer=265..}] at @e[tag=PurpleMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~-0.1 ~0.7 ~0.8


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={PurpleWoolTimer=1000}] at @e[tag=PurpleLock] run tag @a[distance=..0.5] add PurpleSpot
execute if entity @e[scores={PurpleWoolTimer=1000}] run effect give @a[tag=PurpleSpot] instant_damage 1 1 true
execute if entity @e[scores={PurpleWoolTimer=1000..}] at @e[tag=PurpleLock] run teleport @a[tag=PurpleSpot] ~ ~ ~
execute if entity @e[scores={PurpleWoolTimer=1020..}] run setblock 6 2 14 purple_concrete
execute if entity @e[scores={PurpleWoolTimer=1020..}] run setblock 6 6 14 purple_wool
execute if entity @e[scores={PurpleWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={PurpleWoolTimer=1020..}] run tag @a remove PurpleSpot
execute if entity @e[scores={PurpleWoolTimer=1020..}] run kill @e[tag=PurpleLock]
execute if entity @e[scores={PurpleWoolTimer=1020..}] run advancement grant @a only d3:folder_a/elytra
execute if entity @e[scores={PurpleWoolTimer=1020..}] run scoreboard objectives remove PurpleWoolTimer