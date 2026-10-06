####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlueWoolTimer

scoreboard objectives add BlueWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] BlueWoolTimer 0
scoreboard players add @e[scores={BlueWoolTimer=0..100}] BlueWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={BlueWoolTimer=1}] run setblock 4 89 1038 air
execute if entity @e[scores={BlueWoolTimer=1}] run setblock 4 90 1038 stone_bricks
execute if entity @e[scores={BlueWoolTimer=1}] run fill 4 91 1038 4 92 1038 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={BlueWoolTimer=1}] run kill @e[tag=BlueMonumentStand]
execute if entity @e[scores={BlueWoolTimer=1}] run kill @e[tag=BlueMonumentBlock]
execute if entity @e[scores={BlueWoolTimer=1}] run kill @e[tag=BlueMonumentCart]
execute if entity @e[scores={BlueWoolTimer=1}] as @e[tag=BlueMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={BlueWoolTimer=10}] run kill @e[tag=BlueMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={BlueWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={BlueWoolTimer=100}] run summon armor_stand 4 90 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlueUpperStand","BlueMonumentStand","BlueMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:stone_bricks"},Tags:["BlueMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlueWoolTimer=100}] run summon armor_stand 4 89 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlueMiddleStand","BlueMonumentStand","BlueMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["BlueMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlueWoolTimer=100}] run summon armor_stand 4 88 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlueLowerStand","BlueMonumentStand","BlueMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["BlueMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={BlueWoolTimer=100}] run summon armor_stand 4 91 1038 {Invisible:true,Small:true,NoGravity:true,Marker:true,Tags:["BlueLock","BlueMonumentStand"]}

execute if entity @e[scores={BlueWoolTimer=100}] run playsound entity.minecart.riding master @a 4 90 1038 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={BlueWoolTimer=90}] run summon armor_stand 4 89 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlueBarrierAS","BlueBarrier","BlueMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["BlueBarrierShulker","BlueBarrier","BlueMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={BlueWoolTimer=95}] run teleport @e[tag=BlueBarrier] 4 90 1038
execute if entity @e[scores={BlueWoolTimer=102}] run teleport @e[tag=BlueBarrier] 8 3 1036
execute if entity @e[scores={BlueWoolTimer=112}] run kill @e[tag=BlueBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={BlueWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={BlueWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={BlueWoolTimer=102..999}] run tag @a remove BlueSpot
execute align x align y align z at @e[tag=BlueLock] run tag @a[distance=..0.5] add BlueSpot
execute if entity @e[scores={BlueWoolTimer=100..101}] run effect give @a[tag=BlueSpot] levitation 1 255 true
execute align x align y align z at @e[tag=BlueLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={BlueWoolTimer=100..103}] as @e[tag=BlueLock] at @s run teleport @a[tag=BlueSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={BlueWoolTimer=100..101}] as @e[tag=BlueMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] run effect clear @a[tag=BlueSpot] levitation
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] as @e[tag=BlueLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=BlueLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=BlueLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=BlueUpperStand] run setblock ~ ~ ~ stone_bricks
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=BlueMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 4 90 1038 1 0.6 0
execute if entity @e[tag=BlueUpperStand,x=4,y=92.1,z=1038,dx=0,dy=0,dz=0] run kill @e[tag=BlueMonumentBlock]

execute if entity @e[scores={BlueWoolTimer=103}] as @a[tag=BlueSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 4 92 1038 stone_bricks run scoreboard players add @e[scores={BlueWoolTimer=..200}] BlueWoolTimer 1
execute if entity @e[scores={BlueWoolTimer=160}] run kill @e[tag=BlueMonumentPiece]
execute if entity @e[scores={BlueWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:blue_wool",Count:1b}],Tags:["BlueMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={BlueWoolTimer=160..201}] at @e[tag=BlueMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={BlueWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=BlueMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=BlueMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={BlueWoolTimer=201}] BlueWoolTimer 202
scoreboard players add @e[scores={BlueWoolTimer=202..}] BlueWoolTimer 1

execute if entity @e[scores={BlueWoolTimer=202..}] at @e[tag=BlueMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={BlueWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={BlueWoolTimer=..239}] as @e[tag=BlueMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={BlueWoolTimer=240..249}] as @e[tag=BlueMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={BlueWoolTimer=250..264}] as @e[tag=BlueMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={BlueWoolTimer=264}] run stopsound @a
execute if entity @e[scores={BlueWoolTimer=264}] run summon armor_stand 4 86 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["BlueMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["BlueMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:11b}],DisabledSlots:2039583}
execute if entity @e[scores={BlueWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={BlueWoolTimer=265}] as @e[tag=BlueMonumentPiece] at @s run teleport @s ^ ^ ^ facing 4 91.6 1038
execute if entity @e[scores={BlueWoolTimer=265..}] as @e[tag=BlueMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 4 91.6 1038


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] as @e[tag=BlueLock] run data merge entity @s {Marker:0b,Motion:[-0.4d,0.4d,0.6d]}
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.7 0.5
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run setblock 4 92 1038 air
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run summon minecart 4 89 1038 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:blue_wool"},DisplayOffset:64,Tags:["BlueMonumentCart","MonumentCart"]}
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run teleport @e[tag=BlueMonumentShulker] 4 91.755 1038
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run particle falling_dust blue_wool 4 92.5 1038 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] BlueWoolTimer 1000
execute if entity @e[tag=BlueMonumentPiece,x=4,y=92,z=1038,dx=0,dy=0,dz=0] run kill @e[tag=BlueMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={BlueWoolTimer=265..}] at @e[tag=BlueMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={BlueWoolTimer=265..}] at @e[tag=BlueMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~-0.2 ~0.7 ~0.7


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={BlueWoolTimer=1000}] at @e[tag=BlueLock] run tag @a[distance=..0.5] add BlueSpot
execute if entity @e[scores={BlueWoolTimer=1000}] run effect give @a[tag=BlueSpot] instant_damage 1 1 true
execute if entity @e[scores={BlueWoolTimer=1000..}] at @e[tag=BlueLock] run teleport @a[tag=BlueSpot] ~ ~ ~
execute if entity @e[scores={BlueWoolTimer=1020..}] run setblock 5 2 14 blue_concrete
execute if entity @e[scores={BlueWoolTimer=1020..}] run setblock 5 6 14 blue_wool
execute if entity @e[scores={BlueWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={BlueWoolTimer=1020..}] run tag @a remove BlueSpot
execute if entity @e[scores={BlueWoolTimer=1020..}] run kill @e[tag=BlueLock]
execute if entity @e[scores={BlueWoolTimer=1020..}] run advancement grant @a only d3:folder_a/dropper
execute if entity @e[scores={BlueWoolTimer=1020..}] run scoreboard objectives remove BlueWoolTimer