####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 29 2017 / JULY 12 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar WhiteWoolTimer

scoreboard players set @e[tag=MainHubAEC] WhiteFailSafe -100

scoreboard objectives add WhiteWoolTimer dummy
scoreboard players add @e[tag=MainHubAEC] WhiteWoolTimer 0
scoreboard players add @e[scores={WhiteWoolTimer=0..100}] WhiteWoolTimer 1


# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
execute if entity @e[scores={WhiteWoolTimer=1}] run setblock 8 89 1039 air
execute if entity @e[scores={WhiteWoolTimer=1}] run setblock 8 90 1039 stone_bricks
execute if entity @e[scores={WhiteWoolTimer=1}] run fill 8 91 1039 8 92 1039 air


# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
execute if entity @e[scores={WhiteWoolTimer=1}] run kill @e[tag=WhiteMonumentStand]
execute if entity @e[scores={WhiteWoolTimer=1}] run kill @e[tag=WhiteMonumentBlock]
execute if entity @e[scores={WhiteWoolTimer=1}] run kill @e[tag=WhiteMonumentCart]
execute if entity @e[scores={WhiteWoolTimer=1}] as @e[tag=WhiteMonumentShulker] at @s run teleport @s ~ ~-4.755 ~-1

execute if entity @e[scores={WhiteWoolTimer=10}] run kill @e[tag=WhiteMonumentShulker]
###execute if entity @e[scores={WhiteWoolTimer=10}] run setblock 12 6 14 white_wool


# PLEASE WAIT MESSAGE -> TIMED DELAY
execute if entity @e[scores={WhiteWoolTimer=50}] run setblock 12 11 14 redstone_block


# SUMMON MONUMENT POST FOR CORRESPONDING WOOL
execute if entity @e[scores={WhiteWoolTimer=100}] run summon armor_stand 8 90 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["WhiteUpperStand","WhiteMonumentStand","WhiteMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:stone_bricks"},Tags:["WhiteMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={WhiteWoolTimer=100}] run summon armor_stand 8 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["WhiteMiddleStand","WhiteMonumentStand","WhiteMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Tags:["WhiteMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={WhiteWoolTimer=100}] run summon armor_stand 8 88 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["WhiteLowerStand","WhiteMonumentStand","WhiteMonumentBlock","MonumentBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:"false"}},Tags:["WhiteMonumentBlock","MonumentBlock"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={WhiteWoolTimer=100}] run summon armor_stand 8 91 1039 {Invisible:1b,Small:true,NoGravity:true,Marker:true,Tags:["WhiteLock","WhiteMonumentStand"]}

execute if entity @e[scores={WhiteWoolTimer=100}] run playsound entity.minecart.riding master @a 8 90 1039 1 0.5 0


# ADD RIDING SHULKER - MP FIX #
execute if entity @e[scores={WhiteWoolTimer=90}] run summon armor_stand 8 89 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["WhiteBarrierAS","WhiteBarrier","WhiteMonumentStand"],Passengers:[{id:"minecraft:shulker",Color:8b,Tags:["WhiteBarrierShulker","WhiteBarrier","WhiteMonumentStand","MonumentShulker"],NoAI:true,Silent:true}],DisabledSlots:2039583}
execute if entity @e[scores={WhiteWoolTimer=95}] run teleport @e[tag=WhiteBarrier] 8 90 1039
execute if entity @e[scores={WhiteWoolTimer=102}] run teleport @e[tag=WhiteBarrier] 8 3 1036
execute if entity @e[scores={WhiteWoolTimer=112}] run kill @e[tag=WhiteBarrier]


# IF PLAYERS STANDS ON BLOCK
execute if entity @e[scores={WhiteWoolTimer=100..1018}] run team add MonumentRiders
team modify MonumentRiders collisionRule never
team modify MonumentRiders friendlyFire true
team join MonumentRiders @a
execute if entity @e[scores={WhiteWoolTimer=1019..}] run team remove MonumentRiders

execute if entity @e[scores={WhiteWoolTimer=102..999}] run tag @a remove WhiteSpot
execute align x align y align z at @e[tag=WhiteLock] run tag @a[distance=..0.5] add WhiteSpot
execute if entity @e[scores={WhiteWoolTimer=100..101}] run effect give @a[tag=WhiteSpot] levitation 1 255 true
execute align x align y align z at @e[tag=WhiteLock] run effect clear @a[distance=0.6..10] levitation
execute if entity @e[scores={WhiteWoolTimer=100..103}] as @e[tag=WhiteLock] at @s run teleport @a[tag=WhiteSpot] ~ ~ ~


# SUDDEN STOP FOR MONUMENT POST
execute if entity @e[scores={WhiteWoolTimer=100..101}] as @e[tag=WhiteMonumentStand] at @s run teleport @s ~ ~0.03 ~
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] run effect clear @a[tag=WhiteSpot] levitation
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] as @e[tag=WhiteLock] run data merge entity @s {NoGravity:false}
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=WhiteLowerStand] run setblock ~ ~-1 ~ lever[face=ceiling,powered=true]
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=WhiteLowerStand] run setblock ~ ~ ~ redstone_lamp[lit=true]
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=WhiteUpperStand] run setblock ~ ~ ~ stone_bricks
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] at @e[tag=WhiteMiddleStand] run setblock ~ ~ ~ iron_bars
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] run playsound entity.iron_golem.hurt master @a 8 90 1039 1 0.6 0
execute if entity @e[tag=WhiteUpperStand,x=8,y=92.1,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=WhiteMonumentBlock]

execute if entity @e[scores={WhiteWoolTimer=103}] as @a[tag=WhiteSpot] at @s run teleport @s ~ 94.0 ~


# SUMMONS MONUMENT PIECE
execute if block 8 92 1039 stone_bricks run scoreboard players add @e[scores={WhiteWoolTimer=..200}] WhiteWoolTimer 1
execute if entity @e[scores={WhiteWoolTimer=160}] run kill @e[tag=WhiteMonumentPiece]
execute if entity @e[scores={WhiteWoolTimer=160}] run summon armor_stand 8 90.1 1032 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:white_wool",Count:1b}],Tags:["WhiteMonumentPiece","MonumentPiece"],DisabledSlots:2039583}
execute if entity @e[scores={WhiteWoolTimer=160..201}] at @e[tag=WhiteMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.1 1
execute if entity @e[scores={WhiteWoolTimer=160}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.3 0

execute as @e[tag=WhiteMonumentPiece,x=8,y=89,z=1032,dx=0,dy=1.6,dz=0] at @s run teleport @s ~ ~0.03 ~

execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1032,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={WhiteWoolTimer=201}] WhiteWoolTimer 202
scoreboard players add @e[scores={WhiteWoolTimer=202..}] WhiteWoolTimer 1

execute if entity @e[scores={WhiteWoolTimer=202..}] at @e[tag=WhiteMonumentPiece] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.7 1
execute if entity @e[scores={WhiteWoolTimer=238}] run playsound entity.guardian.attack master @a 8 91 1032 1 0.9 0
execute if entity @e[scores={WhiteWoolTimer=..239}] as @e[tag=WhiteMonumentPiece] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={WhiteWoolTimer=240..249}] as @e[tag=WhiteMonumentPiece] at @s run teleport @s ~ ~ ~ ~50 ~
execute if entity @e[scores={WhiteWoolTimer=250..264}] as @e[tag=WhiteMonumentPiece] at @s run teleport @s ~ ~ ~ ~70 ~


# SHOOTS MONUMENT PIECE
execute if entity @e[scores={WhiteWoolTimer=264}] run stopsound @a
execute if entity @e[scores={WhiteWoolTimer=264}] run summon armor_stand 8 86 1039 {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["WhiteMonumentShulker"],Passengers:[{id:"minecraft:shulker",Tags:["WhiteMonumentShulker","MonumentShulker"],NoAI:true,Silent:true,Invulnerable:true,Color:0b}],DisabledSlots:2039583}
execute if entity @e[scores={WhiteWoolTimer=265}] run playsound entity.wither.shoot master @a 8 91 1032 0.3 1.5 0
execute if entity @e[scores={WhiteWoolTimer=265}] as @e[tag=WhiteMonumentPiece] at @s run teleport @s ^ ^ ^ facing 8 91.6 1039
execute if entity @e[scores={WhiteWoolTimer=265..}] as @e[tag=WhiteMonumentPiece] at @s run teleport @s ^ ^ ^1.5 facing 8 91.6 1039


# COMPLETES MONUMENT BUILD FOR WOOL
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] as @e[tag=WhiteLock] run data merge entity @s {Marker:0b,Motion:[0.0d,0.4d,0.7d]}
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound block.end_portal.spawn master @a ~ ~ ~ 0.5 0.7 0.5
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] at @a run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run setblock 8 92 1039 air
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run summon minecart 8 89 1039 {NoGravity:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:white_wool"},DisplayOffset:64,Tags:["WhiteMonumentCart","MonumentCart"]}
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run teleport @e[tag=WhiteMonumentShulker] 8 91.755 1039
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run particle falling_dust white_wool 8 92.5 1039 0.5 0.5 0.5 1 500 force @a
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainHubAEC] WhiteWoolTimer 1000
execute if entity @e[tag=WhiteMonumentPiece,x=8,y=92,z=1039,dx=0,dy=0,dz=0] run kill @e[tag=WhiteMonumentPiece]


# INJURES PLAYER IN PATHWAY
execute if entity @e[scores={WhiteWoolTimer=265..}] at @e[tag=WhiteMonumentPiece] run effect give @a[distance=..1.5] instant_damage 1 1 true
execute if entity @e[scores={WhiteWoolTimer=265..}] at @e[tag=WhiteMonumentPiece] as @a[distance=..1.5] at @s run teleport @s ~ ~0.7 ~1


# FIRES OFF PLAYER AND ENDS WOOL
execute if entity @e[scores={WhiteWoolTimer=1000}] at @e[tag=WhiteLock] run tag @a[distance=..0.5] add WhiteSpot
execute if entity @e[scores={WhiteWoolTimer=1000}] run effect give @a[tag=WhiteSpot] instant_damage 1 1 true
execute if entity @e[scores={WhiteWoolTimer=1000..}] at @e[tag=WhiteLock] run teleport @a[tag=WhiteSpot] ~ ~ ~

execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:announce_advancements/root
execute if entity @e[scores={WhiteWoolTimer=1020}] run advancement revoke @a only d3:announce_advancements/root
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_a/root
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_a/line_a1_end
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_a/line_a2_end
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_b/root
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_b/line_b1_end
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_b/line_b2_end
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_b/line_b3_end
execute if entity @e[scores={WhiteWoolTimer=1015}] run advancement grant @a only d3:folder_b/line_b4_end

execute if entity @e[scores={WhiteWoolTimer=1015}] run playsound block.beacon.power_select master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={WhiteWoolTimer=1020..}] run setblock 12 2 14 white_concrete
execute if entity @e[scores={WhiteWoolTimer=1020..}] run setblock 12 11 14 clay
execute if entity @e[scores={WhiteWoolTimer=1020..}] run tag @a remove WhiteSpot
execute if entity @e[scores={WhiteWoolTimer=1020..}] run kill @e[tag=WhiteLock]

execute if entity @e[scores={WhiteWoolTimer=1019}] run scoreboard objectives add LoadAccessPoints dummy
execute if entity @e[scores={WhiteWoolTimer=1020..}] run scoreboard objectives remove WhiteWoolTimer