####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar CyanWoolTimer

scoreboard objectives add CyanWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] CyanWoolTimer 0
scoreboard players add @e[scores={CyanWoolTimer=0..100}] CyanWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={CyanWoolTimer=1}] run setblock 10 89 1039 air
execute if entity @e[scores={CyanWoolTimer=1}] run setblock 10 90 1039 mossy_stone_bricks
execute if entity @e[scores={CyanWoolTimer=1}] run fill 10 91 1039 12 92 1039 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={CyanWoolTimer=1}] run kill @e[tag=CyanMonumentStand]
execute if entity @e[scores={CyanWoolTimer=1}] run kill @e[tag=CyanMonumentBlock]
execute if entity @e[scores={CyanWoolTimer=1}] run kill @e[tag=CyanMonumentCart]
execute if entity @e[scores={CyanWoolTimer=1}] as @e[tag=CyanMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={CyanWoolTimer=10}] run kill @e[tag=CyanMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={CyanWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={CyanWoolTimer=100}] run summon armor_stand 10 90 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["CyanUpperStand","CyanMonumentStand","CyanMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:mossy_stone_bricks"},Tags:["CyanMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={CyanWoolTimer=100}] run summon armor_stand 10 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["CyanMiddleStand","CyanMonumentStand","CyanMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["CyanMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={CyanWoolTimer=100}] run summon armor_stand 10 88 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["CyanLowerStand","CyanMonumentStand","CyanMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["CyanMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={CyanWoolTimer=100}] run summon armor_stand 10 91 1039 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["CyanLock","CyanMonumentStand"]}

execute if entity @e[scores={CyanWoolTimer=100}] run playsound entity.minecart.riding master @a 10 90 1039 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={CyanWoolTimer=90}] run summon armor_stand 10 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["CyanBarrierAS","CyanBarrier","CyanMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["CyanBarrierShulker","CyanBarrier","CyanMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={CyanWoolTimer=95}] run teleport @e[tag=CyanBarrier] 10 90 1039
execute if entity @e[scores={CyanWoolTimer=102}] run teleport @e[tag=CyanBarrier] 8 3 1036
execute if entity @e[scores={CyanWoolTimer=112}] run kill @e[tag=CyanBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={CyanWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={CyanWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={CyanWoolTimer=102..999}] run tag @a remove CyanSpot
execute align x align y align z at @e[tag=CyanLock] run tag @a[distance=..0.5] add CyanSpot
execute if entity @e[scores={CyanWoolTimer=100..101}] run effect give @a[tag=CyanSpot] levitation 1 255 true
execute align x align y align z at @e[tag=CyanLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={CyanWoolTimer=100..103}] as @e[tag=CyanLock] at @s run teleport @a[tag=CyanSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={CyanWoolTimer=100..101}] as @e[tag=CyanMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] run effect clear @a[tag=CyanSpot] levitation
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] as @e[tag=CyanLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=CyanLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=CyanLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=CyanUpperStand] run setblock ~ ~ ~ mossy_stone_bricks
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=CyanMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 10 90 1039 1 0.6 0
execute if entity @e[tag=CyanUpperStand,x=10,y=92.1,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=CyanMonumentBlock]

execute if entity @e[scores={CyanWoolTimer=103}] as @a[tag=CyanSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 10 92 1039 mossy_stone_bricks run scoreboard players add @e[scores={CyanWoolTimer=..200}] CyanWoolTimer 1
execute if entity @e[scores={CyanWoolTimer=160}] run kill @e[tag=CyanMonumentPiece]
execute if entity @e[scores={CyanWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:cyan_wool",Count:1b}],Tags:["CyanMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={CyanWoolTimer=160..201}] at @e[tag=CyanMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={CyanWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=CyanMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=CyanMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={CyanWoolTimer=201}] CyanWoolTimer 202
scoreboard players add @e[scores={CyanWoolTimer=202..}] CyanWoolTimer 1

execute if entity @e[scores={CyanWoolTimer=202..}] at @e[tag=CyanMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={CyanWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={CyanWoolTimer=..239}] as @e[tag=CyanMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={CyanWoolTimer=240..249}] as @e[tag=CyanMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={CyanWoolTimer=250..264}] as @e[tag=CyanMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={CyanWoolTimer=264}] run stopsound @a
execute if entity @e[scores={CyanWoolTimer=264}] run summon armor_stand 10 86 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["CyanMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["CyanMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:9b}],DisabledSlots:2039583}
execute if entity @e[scores={CyanWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={CyanWoolTimer=265}] as @e[tag=CyanMonumentPiece] at @s run teleport @s ^ ^ ^ facing 10 91.6 1039
execute if entity @e[scores={CyanWoolTimer=265..}] as @e[tag=CyanMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 10 91.6 1039


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] as @e[tag=CyanLock] run data merge entity @s {Marker:0b,Motion:[0.1d,0.4d,0.6d]}
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.8 0.5
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run setblock 10 92 1039 air
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run summon minecart 10 89 1039 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:cyan_wool"},DisplayOffset:64,Tags:["CyanMonumentCart","MonumentCart"]}
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run teleport @e[tag=CyanMonumentShulker] 10 91.755 1039
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run particle falling_dust cyan_wool 10 92.5 1039 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] CyanWoolTimer 1000
execute if entity @e[tag=CyanMonumentPiece,x=10,y=92,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=CyanMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={CyanWoolTimer=265..}] at @e[tag=CyanMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={CyanWoolTimer=265..}] at @e[tag=CyanMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~0.1 ~0.7 ~0.8


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={CyanWoolTimer=1000}] at @e[tag=CyanLock] run tag @a[distance=..0.5] add CyanSpot
execute if entity @e[scores={CyanWoolTimer=1000}] run effect give @a[tag=CyanSpot] instant_damage 1 1 true
execute if entity @e[scores={CyanWoolTimer=1000..}] at @e[tag=CyanLock] run teleport @a[tag=CyanSpot] ~ ~ ~
execute if entity @e[scores={CyanWoolTimer=1020..}] run setblock 7 2 14 cyan_concrete
execute if entity @e[scores={CyanWoolTimer=1020..}] run setblock 7 6 14 cyan_wool
execute if entity @e[scores={CyanWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={CyanWoolTimer=1020..}] run tag @a remove CyanSpot
execute if entity @e[scores={CyanWoolTimer=1020..}] run kill @e[tag=CyanLock]
execute if entity @e[scores={CyanWoolTimer=1020..}] run advancement grant @a only d3:folder_a/escape
execute if entity @e[scores={CyanWoolTimer=1020..}] run scoreboard objectives remove CyanWoolTimer