####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PinkWoolTimer

scoreboard objectives add PinkWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] PinkWoolTimer 0
scoreboard players add @e[scores={PinkWoolTimer=0..100}] PinkWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={PinkWoolTimer=1}] run setblock 12 89 1038 air
execute if entity @e[scores={PinkWoolTimer=1}] run setblock 12 90 1038 stone_bricks
execute if entity @e[scores={PinkWoolTimer=1}] run fill 12 91 1038 12 92 1038 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={PinkWoolTimer=1}] run kill @e[tag=PinkMonumentStand]
execute if entity @e[scores={PinkWoolTimer=1}] run kill @e[tag=PinkMonumentBlock]
execute if entity @e[scores={PinkWoolTimer=1}] run kill @e[tag=PinkMonumentCart]
execute if entity @e[scores={PinkWoolTimer=1}] as @e[tag=PinkMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={PinkWoolTimer=10}] run kill @e[tag=PinkMonumentShulker]


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={PinkWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={PinkWoolTimer=100}] run summon armor_stand 12 90 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PinkUpperStand","PinkMonumentStand","PinkMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:stone_bricks"},Tags:["PinkMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PinkWoolTimer=100}] run summon armor_stand 12 89 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PinkMiddleStand","PinkMonumentStand","PinkMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["PinkMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PinkWoolTimer=100}] run summon armor_stand 12 88 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PinkLowerStand","PinkMonumentStand","PinkMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["PinkMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={PinkWoolTimer=100}] run summon armor_stand 12 91 1038 {Invisible:1b,Small:true,NoGravity:true,Marker:0b,Tags:["PinkLock","PinkMonumentStand"]}

execute if entity @e[scores={PinkWoolTimer=100}] run playsound entity.minecart.riding master @a 12 90 1038 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={PinkWoolTimer=90}] run summon armor_stand 12 89 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PinkBarrierAS","PinkBarrier","PinkMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["PinkBarrierShulker","PinkBarrier","PinkMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={PinkWoolTimer=95}] run teleport @e[tag=PinkBarrier] 12 90 1038
execute if entity @e[scores={PinkWoolTimer=102}] run teleport @e[tag=PinkBarrier] 8 3 1036
execute if entity @e[scores={PinkWoolTimer=112}] run kill @e[tag=PinkBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={PinkWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={PinkWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={PinkWoolTimer=102..999}] run tag @a remove PinkSpot
execute align x align y align z at @e[tag=PinkLock] run tag @a[distance=..0.5] add PinkSpot
execute if entity @e[scores={PinkWoolTimer=100..101}] run effect give @a[tag=PinkSpot] levitation 1 255 true
execute align x align y align z at @e[tag=PinkLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={PinkWoolTimer=100..103}] as @e[tag=PinkLock] at @s run teleport @a[tag=PinkSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={PinkWoolTimer=100..101}] as @e[tag=PinkMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] run effect clear @a[tag=PinkSpot] levitation
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] as @e[tag=PinkLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=PinkLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=PinkLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=PinkUpperStand] run setblock ~ ~ ~ stone_bricks
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] at @e[tag=PinkMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 12 90 1038 1 0.6 0
execute if entity @e[tag=PinkUpperStand,x=12,y=92.1,z=1038,dx=0,dy=0,dz=0] run kill @e[tag=PinkMonumentBlock]

execute if entity @e[scores={PinkWoolTimer=103}] as @a[tag=PinkSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 12 92 1038 stone_bricks run scoreboard players add @e[scores={PinkWoolTimer=..200}] PinkWoolTimer 1
execute if entity @e[scores={PinkWoolTimer=160}] run kill @e[tag=PinkMonumentPiece]
execute if entity @e[scores={PinkWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:pink_wool",Count:1b}],Tags:["PinkMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={PinkWoolTimer=160..201}] at @e[tag=PinkMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={PinkWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=PinkMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=PinkMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={PinkWoolTimer=201}] PinkWoolTimer 202
scoreboard players add @e[scores={PinkWoolTimer=202..}] PinkWoolTimer 1

execute if entity @e[scores={PinkWoolTimer=202..}] at @e[tag=PinkMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={PinkWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={PinkWoolTimer=..239}] as @e[tag=PinkMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={PinkWoolTimer=240..249}] as @e[tag=PinkMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={PinkWoolTimer=250..264}] as @e[tag=PinkMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={PinkWoolTimer=264}] run stopsound @a
execute if entity @e[scores={PinkWoolTimer=264}] run summon armor_stand 12 86 1038 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["PinkMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["PinkMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:6b}],DisabledSlots:2039583}
execute if entity @e[scores={PinkWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={PinkWoolTimer=265}] as @e[tag=PinkMonumentPiece] at @s run teleport @s ^ ^ ^ facing 12 91.6 1038
execute if entity @e[scores={PinkWoolTimer=265..}] as @e[tag=PinkMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 12 91.6 1038


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] as @e[tag=PinkLock] run data merge entity @s {Marker:0b,Motion:[0.4d,0.4d,0.6d]}
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.9 0.5
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run setblock 12 92 1038 air
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run summon minecart 12 89 1038 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:pink_wool"},DisplayOffset:64,Tags:["PinkMonumentCart","MonumentCart"]}
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run teleport @e[tag=PinkMonumentShulker] 12 91.755 1038
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run particle falling_dust pink_wool 12 92.5 1038 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] PinkWoolTimer 1000
execute if entity @e[tag=PinkMonumentPiece,x=12,y=92,z=1038,dx=0,dy=0,dz=0] run kill @e[tag=PinkMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={PinkWoolTimer=265..}] at @e[tag=PinkMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={PinkWoolTimer=265..}] at @e[tag=PinkMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~0.2 ~0.7 ~0.7


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={PinkWoolTimer=1000}] at @e[tag=PinkLock] run tag @a[distance=..0.5] add PinkSpot
execute if entity @e[scores={PinkWoolTimer=1000}] run effect give @a[tag=PinkSpot] instant_damage 1 1 true
execute if entity @e[scores={PinkWoolTimer=1000..}] at @e[tag=PinkLock] run teleport @a[tag=PinkSpot] ~ ~ ~
execute if entity @e[scores={PinkWoolTimer=1020..}] run setblock 8 2 14 pink_concrete
execute if entity @e[scores={PinkWoolTimer=1020..}] run setblock 8 6 14 pink_wool
execute if entity @e[scores={PinkWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={PinkWoolTimer=1020..}] run tag @a remove PinkSpot
execute if entity @e[scores={PinkWoolTimer=1020..}] run kill @e[tag=PinkLock]
execute if entity @e[scores={PinkWoolTimer=1020..}] run advancement grant @a only d3:folder_a/parkour
execute if entity @e[scores={PinkWoolTimer=1020..}] run scoreboard objectives remove PinkWoolTimer