####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 29 2018 / AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar ArenaAccess
#scoreboard objectives setdisplay sidebar TridentAge
#scoreboard objectives setdisplay sidebar TridentLife
#scoreboard objectives setdisplay sidebar TriviaAccess
#scoreboard objectives setdisplay sidebar PhantomAge
#scoreboard objectives setdisplay sidebar ParkourAccess
#scoreboard objectives setdisplay sidebar EscapeAccess
#scoreboard objectives setdisplay sidebar ElytraAccess
#scoreboard objectives setdisplay sidebar ElytraDeaths
#scoreboard objectives setdisplay sidebar SurvivalButton
#scoreboard objectives setdisplay sidebar SurvivalAccess
#scoreboard objectives setdisplay sidebar PuzzleAccess
#scoreboard objectives setdisplay sidebar PuzzleBridge


# FIX FOR GETTING LOCKED UNDER SHULKER MONUMENT
#execute align x align y align z as @a[x=-3,y=86,z=1033,dx=16,dy=4,dz=5] at @s unless entity @s[x=3,y=90,z=1033,dx=3,dy=1,dz=4] run teleport @s[gamemode=adventure] ~ 91.2 ~1
execute align x align y align z as @a[x=-3,y=86,z=1033,dx=23,dy=4,dz=10] at @s unless entity @s[x=3,y=90,z=1033,dx=3,dy=1,dz=4] unless entity @s[x=17,y=90,z=1033,dx=3,dy=1,dz=4] unless entity @s[x=0,y=90,z=1041,dx=2,dy=1,dz=2] run teleport @s[gamemode=adventure] ~ 91.2 ~


# FIX TO PREVENT ON TOP OF BOSS BRIDGE
execute align x align y align z as @a[x=43,y=90,z=1040,dx=4,dy=0,dz=0] at @s run teleport @s ~ ~ ~-1


# REMOVE WHITE WOOL SEGMENT
fill 8 87 998 8 87 998 air replace end_rod
fill 8 86 998 8 86 998 chiseled_stone_bricks replace observer
execute if block 8 87 998 air run scoreboard objectives remove WhiteFailSafe

execute as @e[tag=BranchSign,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}


# BLOCKS TOP CHEST WHEN PIECE GETS SUMMONED
execute if entity @e[tag=MonumentPiece] if block 8 92 1032 air run setblock 8 92 1032 barrier
execute if entity @e[tag=MonumentPiece] if block 8 94 1032 air run setblock 8 94 1032 barrier

execute unless entity @e[tag=MonumentPiece] if block 8 92 1032 barrier run setblock 8 92 1032 air
execute unless entity @e[tag=MonumentPiece] if block 8 94 1032 barrier run setblock 8 94 1032 air


# ROTATE PLAYER ON MONUMENT WOOL -> GLICTHED IN MULTIPLAYER?
#execute as @a at @s if entity @e[tag=MonumentShulker,dx=0,dy=-0.1,dz=0] if block ~ ~-1 ~ iron_bars run teleport @s ~ ~ ~ ~1 ~
execute as @a at @s if entity @e[tag=MonumentShulker,dx=0,dy=-0.1,dz=0] if block ~ ~-1 ~ iron_bars run scoreboard objectives add MonumentRotate dummy
execute as @a at @s if entity @e[tag=MonumentShulker,dx=0,dy=-0.1,dz=0] if block ~ ~-1 ~ iron_bars run scoreboard players add @s MonumentRotate 1




# ADVENTURE ACCESS -> INVISIBLE BRIDGE
fill -11 87 1044 -11 87 1044 orange_concrete replace air
execute unless entity @e[tag=AdventureSign] run summon item_frame -12 87 1044 {Invulnerable:true,Facing:4b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:1}},Tags:["BranchSign","AdventureSign"]}

execute as @a[x=-26,y=86,z=1043,dx=20,dy=1,dz=37] at @s run fill ~-8 85 ~3 ~8 85 ~6 air replace acacia_button[face=ceiling]
execute as @a[x=-26,y=86,z=1043,dx=20,dy=1,dz=37] at @s run fill ~-8 85 ~-6 ~8 85 ~-3 air replace acacia_button[face=ceiling]

execute as @a[x=-26,y=86,z=1043,dx=20,dy=1,dz=37] at @s run fill ~-2 85 ~-2 ~2 85 ~2 acacia_button[face=ceiling,facing=east] replace structure_void
execute as @a[x=-26,y=86,z=1043,dx=20,dy=1,dz=37] at @s run fill ~-2 86 ~-2 ~2 86 ~2 orange_concrete_powder replace structure_void

execute as @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"},Time:5},x=-26,y=80,z=1044,dx=20,dy=6,dz=36] at @s run fill ~ ~1 ~ ~ ~1 ~ structure_void replace air
execute as @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"},Time:5},x=-26,y=80,z=1044,dx=20,dy=6,dz=36] at @s run fill ~ ~ ~ ~ ~ ~ structure_void replace air



# ARENA ACCESS -> TRIDENT TARGET
fill -28 86 1033 -28 86 1033 yellow_concrete replace jungle_leaves
execute unless entity @e[tag=ArenaSign] run summon item_frame -28 86 1032 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:2}},Tags:["BranchSign","ArenaSign"]}

fill -20 89 1039 -20 89 1039 lever[face=wall,facing=east,powered=false] replace air
fill -21 89 1039 -21 89 1039 yellow_concrete_powder replace oak_wood

execute if block -20 89 1039 lever[powered=false] run fill -26 99 1043 -26 102 1043 air replace ladder
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run playsound entity.experience_orb.pickup master @a -26 99 1043
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run playsound item.chorus_fruit.teleport master @a -26 99 1043 2 0.7 1
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run particle cloud -26 100 1043 0.3 1.5 0.3 0 50
execute if block -20 89 1039 lever[powered=true] run fill -26 99 1043 -26 102 1043 ladder[facing=east] replace air

execute if entity @a[x=-48,y=102,z=1033,dx=32,dy=17,dz=32] run scoreboard objectives add ArenaAccess dummy
execute if entity @e[tag=TridentAS] run scoreboard objectives remove ArenaAccess
execute if entity @e[nbt={Item:{id:"minecraft:trident"}}] run scoreboard objectives remove ArenaAccess
execute if entity @a[nbt={Inventory:[{id:"minecraft:trident"}]}] run scoreboard objectives remove ArenaAccess
execute if entity @a[nbt={Inventory:[{id:"minecraft:trident"}]}] run kill @e[tag=TridentAS]
execute if entity @e[type=trident] run scoreboard objectives remove ArenaAccess
execute if block -24 86 986 hopper{Items:[{id:"minecraft:trident"}]} run scoreboard objectives remove ArenaAccess
scoreboard players add @e[tag=MainHubAEC] ArenaAccess 0
scoreboard players add @e[scores={ArenaAccess=0..50}] ArenaAccess 1

execute if entity @e[nbt={Item:{id:"minecraft:trident"}},x=-87,y=34,z=813,dx=220,dy=72,dz=300] run scoreboard objectives add TridentLife dummy
execute unless entity @e[nbt={Item:{id:"minecraft:trident"}}] run scoreboard objectives remove TridentLife
scoreboard players add @e[nbt={Item:{id:"minecraft:trident"}},x=-87,y=34,z=813,dx=220,dy=72,dz=300] TridentLife 1
kill @e[nbt={Item:{id:"minecraft:trident"}},scores={TridentLife=500..}]


execute if entity @e[scores={ArenaAccess=50}] run summon armor_stand -32 105.55 1041 {Invisible:true,NoGravity:true,HandItems:[{id:"minecraft:trident",Count:1b,tag:{HideFlags:63,Unbreakable:true,Enchantments: [{id:"minecraft:loyalty",lvl:3s}]}}],Pose:{RightArm:[90f,95f,15f]},Rotation:[135f,0f],Tags:["TridentAS"]}

execute if entity @e[scores={ArenaAccess=50}] run summon lightning_bolt -32 106 1041
execute if entity @e[scores={ArenaAccess=50}] run playsound item.trident.thunder master @a -32 106 1041 0.5 1 0

execute if entity @e[type=trident] run scoreboard objectives add TridentAge dummy
scoreboard players add @e[type=trident] TridentAge 1
execute at @e[scores={TridentAge=1}] run summon area_effect_cloud ~ ~-1 ~ {Tags:["TridentAEC"],Duration:60}
execute as @e[scores={TridentAge=200..}] run kill @e[tag=TridentAEC]
execute as @e[scores={TridentAge=200..}] run kill @s

#execute if block -63 80 1048 oak_button[powered=true] run clone -64 1 0 -40 13 24 -56 73 1028
execute if block -63 80 1048 oak_button[powered=true] run setblock -64 80 1048 glowstone destroy
execute if block -63 80 1048 oak_button[powered=true] at @e[tag=TridentAEC] run playsound block.glass.break block @a
execute if block -63 80 1048 oak_button[powered=true] run setblock -63 80 1048 air
execute if block -64 80 1048 glowstone if block -55 73 1050 air run setblock -64 2 0 redstone_block
execute if block -64 80 1048 glowstone if block -55 73 1050 air run setblock -56 74 1028 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-1,posZ:0,integrity:1.0f, showair:0b,name:"arena_bridge",sizeX:25,sizeY:13,sizeZ:25,showboundingbox:1b}
execute if block -56 74 1028 structure_block at @e[tag=TridentAEC] run playsound item.trident.riptide_2 master @a
execute if block -56 74 1028 structure_block run setblock -56 73 1028 redstone_block
execute if block -56 74 1028 structure_block run fill -56 73 1028 -56 74 1028 air


# TOO LAZY TO FIX
execute if block -50 57 1024 chest run setblock -50 57 1024 air
execute if block 101 91 969 air run setblock 101 91 969 birch_leaves
execute if block 31 116 1033 air run setblock 31 116 1033 birch_leaves

# TRIVIA ACCESS -> CABLE CAR
fill -24 87 992 -24 87 992 lime_concrete replace jungle_leaves
execute unless entity @e[tag=TriviaSign] run summon item_frame -24 87 991 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:3}},Tags:["BranchSign","TriviaSign"]}

fill -24 87 985 -24 87 985 air replace oak_leaves
#execute if block -24 87 986 air run setblock -24 87 986 wall_sign[facing=south]{Text1: "{\"text\":\"The Phantom\"}",Text2:"{\"text\":\"Gondola requires\"}",Text3: "{\"text\":\"an offering\",\"obfuscated\":\"true\"}",Text4:"{\"text\":\"  \"}"}
fill -24 86 986 -24 86 986 hopper{CustomName:"{\"text\":\"Phantom Gondola Toll Required\"}"} replace grass_block
fill -24 86 987 -24 86 987 lime_concrete_powder replace stone
fill -24 86 985 -24 86 985 lime_concrete_powder replace grass_block
fill -25 86 986 -25 86 986 lime_concrete_powder replace grass_block
fill -23 86 986 -23 86 986 lime_concrete_powder replace grass_block
execute as @e[tag=Phantom] run data merge entity @s {Fire:0s}

execute if block -24 86 986 hopper{Items:[{Count:1b}]} run scoreboard objectives add TriviaAccess dummy
scoreboard players set @e[tag=MainHubAEC] TriviaAccess 0
execute if entity @e[tag=Phantom] run scoreboard players set @e[tag=MainHubAEC,scores={TriviaAccess=0}] TriviaAccess 1

execute if block -24 86 986 hopper{Items:[{}]} unless entity @e[tag=Phantom] run playsound entity.phantom.ambient master @a -24 78 988 2 1 1
execute if block -24 86 986 hopper{Items:[{}]} if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run summon armor_stand -22 75 988 {Rotation:[90f,0f],NoGravity:true,Marker:true,Invisible:true,Passengers:[{id:"minecraft:boat",Invulnerable:false,Rotation:[90f,0f],Tags:["PhantomOakBoat","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:phantom",Invulnerable:true,NoAI:true,Rotation:[90f,0f],Tags:["Phantom","PhantomBoat"]}]}]}]}]}],Tags:["MainPhantomBoatAS","PhantomBlock","PhantomBoat"]}
execute if entity @e[tag=Phantom] run scoreboard players set @e[tag=MainHubAEC,scores={TriviaAccess=0}] TriviaAccess 1
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run kill @e[tag=PhantomBlock]
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run scoreboard objectives remove TriviaAccess

execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.0 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.1 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.2 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.3 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.4 air

scoreboard players set @e[tag=Phantom,x=-22,y=74,z=988,dx=0,dy=4,dz=0] TriviaAccess 1
execute if entity @e[tag=Phantom,scores={TriviaAccess=1}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ~-0.2 ~ ~ ~ 0

scoreboard players set @e[tag=Phantom,x=-30,y=74,z=988,dx=0,dy=4,dz=0] TriviaAccess 2
execute if entity @e[tag=Phantom,scores={TriviaAccess=2}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ~ ~0.1 ~ ~ 0

scoreboard players set @e[tag=Phantom,x=-31,y=91,z=987,dx=2,dy=1,dz=2,scores={TriviaAccess=2}] TriviaAccess 3
scoreboard players add @e[tag=Phantom,scores={TriviaAccess=3..49}] TriviaAccess 1

execute if entity @e[tag=Phantom,scores={TriviaAccess=50}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ^ ^ ^0.2 facing -54 105 970
execute if entity @e[tag=Phantom,scores={TriviaAccess=50}] as @e[tag=PhantomBoat] at @s run teleport @s ^ ^ ^ facing -54 105 970

scoreboard players set @e[tag=Phantom,x=-54,y=100,z=970,dx=3,dy=8,dz=3] TriviaAccess 51
execute if entity @e[tag=Phantom,scores={TriviaAccess=51}] run kill @e[tag=PhantomBlock]
execute if entity @e[tag=Phantom,scores={TriviaAccess=51}] run tag @e remove PhantomBoat
execute as @e[tag=Phantom,scores={TriviaAccess=51}] at @s run teleport @s ^ ^ ^0.2 facing -64 105 982

scoreboard players set @e[tag=Phantom,x=-65,y=104,z=981,dx=2,dy=2,dz=2] TriviaAccess 52
execute as @e[tag=Phantom,scores={TriviaAccess=52}] at @s run teleport @s ^ ^ ^0.3 facing -69 100 994

scoreboard players set @e[tag=Phantom,x=-70,y=99,z=993,dx=2,dy=2,dz=2] TriviaAccess 53
execute as @e[tag=Phantom,scores={TriviaAccess=53}] at @s run teleport @s ^ ^ ^0.4 facing -58 93 1008

scoreboard players set @e[tag=Phantom,x=-59,y=92,z=1007,dx=2,dy=2,dz=2] TriviaAccess 54
execute as @e[tag=Phantom,scores={TriviaAccess=54}] at @s run teleport @s ^ ^ ^0.6 facing -20 59 1008

scoreboard players set @e[tag=Phantom,x=-21,y=58,z=1007,dx=2,dy=2,dz=2] TriviaAccess 55
execute as @e[tag=Phantom,scores={TriviaAccess=55}] at @s run teleport @s ^ ^ ^0.6 facing -2 59 1008


execute as @e[tag=Phantom,x=-13,y=58,z=1007,dx=2,dy=2,dz=2] run data merge entity @s {Silent:true}
kill @e[tag=Phantom,x=-2,y=58,z=1007,dx=2,dy=2,dz=2]

execute as @e[tag=PhantomOakBoat,type=boat] at @s if block ~-1 ~ ~ water run data merge entity @s {Motion:[0.2d,0.0d,0.1d]}
execute as @e[tag=PhantomOakBoat,type=boat] at @s if block ~ ~ ~-1 water run data merge entity @s {Motion:[0.2d,0.0d,0.1d]}


# FIX FOR BROKEN PHANTOM
execute if entity @e[tag=Phantom,type=phantom] run scoreboard objectives add PhantomAge dummy
execute unless entity @e[tag=Phantom,type=phantom] run scoreboard objectives remove PhantomAge
execute if entity @e[tag=Phantom,type=phantom] run scoreboard players add @e[tag=Phantom] PhantomAge 1
execute if entity @e[tag=Phantom,type=phantom] run kill @e[tag=Phantom,scores={PhantomAge=700..}]


# PARKOUR ACCESS -> TIMED PLATFORMS
fill -33 255 950 -31 255 952 ice replace air
fill -29 255 954 -27 255 956 ice replace air
fill -24 255 955 -22 255 957 ice replace air
fill -19 255 952 -17 255 954 ice replace air
fill -14 255 951 -12 255 953 ice replace air
fill -9 255 954 -7 255 956 ice replace air
fill -7 255 959 -5 255 961 ice replace air
fill -6 255 963 -4 255 965 ice replace air

# 1.14.4 better chunk loading
fill -33 255 950 -4 255 965 air replace ice


fill -9 85 969 -9 85 969 pink_concrete replace air
execute unless entity @e[tag=ParkourSign] run summon item_frame -8 85 969 {Invulnerable:true,Facing:5b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:4}},Tags:["BranchSign","ParkourSign"]}

fill -1 85 969 -1 85 969 pink_concrete_powder replace air
fill -1 86 969 -1 86 969 lever[face=floor,facing=west,powered=false] replace air

execute if block -1 86 969 lever[powered=true] run scoreboard objectives add ParkourAccess dummy
scoreboard players add @e[tag=MainHubAEC] ParkourAccess 1
execute if entity @e[scores={ParkourAccess=220..}] if block -1 86 969 lever[powered=true] run playsound block.lever.click block @a -1 86 969 0.1 0.5 0
execute if entity @e[scores={ParkourAccess=220..}] run fill -1 86 969 -1 86 969 lever[face=floor,facing=west,powered=false] replace lever[powered=true]

execute if block -1 86 969 lever[powered=false] run scoreboard objectives remove ParkourAccess
execute if block -1 86 969 lever[powered=false] run fill -33 77 950 -4 84 965 air replace sea_lantern
execute if block -1 86 969 lever[powered=false] run fill -33 77 950 -4 84 965 air replace pink_concrete
execute if block -1 86 969 lever[powered=false] run fill -33 77 950 -4 84 965 air replace pink_concrete_powder
execute if block -1 86 969 lever[powered=false] run fill -33 77 950 -4 84 965 air replace barrier

execute if entity @e[scores={ParkourAccess=10}] run playsound block.note_block.chime block @a -6 83 963 1 1 0
execute if entity @e[scores={ParkourAccess=10}] run clone 7 11 13 9 12 15 -6 83 963
execute if entity @e[scores={ParkourAccess=30}] run playsound block.note_block.chime block @a -7 82 959 1 1 0
execute if entity @e[scores={ParkourAccess=30}] run clone 7 11 13 9 12 15 -7 82 959
execute if entity @e[scores={ParkourAccess=50}] run playsound block.note_block.chime block @a -9 81 954 1 1 0
execute if entity @e[scores={ParkourAccess=50}] run clone 7 11 13 9 12 15 -9 81 954
execute if entity @e[scores={ParkourAccess=70}] run playsound block.note_block.chime block @a -14 80 951 1 1 0
execute if entity @e[scores={ParkourAccess=70}] run clone 7 11 13 9 12 15 -14 80 951
execute if entity @e[scores={ParkourAccess=90}] run playsound block.note_block.chime block @a -19 79 952 1 1 0
execute if entity @e[scores={ParkourAccess=90}] run clone 7 11 13 9 12 15 -19 79 952
execute if entity @e[scores={ParkourAccess=110}] run playsound block.note_block.chime block @a -24 78 955 1 1 0
execute if entity @e[scores={ParkourAccess=110}] run clone 7 11 13 9 12 15 -24 78 955
execute if entity @e[scores={ParkourAccess=130}] run playsound block.note_block.chime block @a -29 77 954 1 1 0
execute if entity @e[scores={ParkourAccess=130}] run clone 7 11 13 9 12 15 -29 77 954
execute if entity @e[scores={ParkourAccess=150}] run playsound block.note_block.chime block @a -33 78 950 1 1 0
execute if entity @e[scores={ParkourAccess=150}] run clone 7 11 13 9 12 15 -33 78 950



# ESCAPE ACCESS -> MINECART
fill 12 82 964 12 82 964 cyan_concrete replace stone
execute if block 13 82 964 air unless entity @e[tag=EscapeSign] run summon item_frame 13 82 964 {Invulnerable:true,Facing:5b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:5}},Tags:["BranchSign","EscapeSign"]}

fill 18 86 968 18 86 968 cyan_concrete_powder replace stone
fill 17 86 968 17 86 968 lever[face=wall,facing=west,powered=false] replace air

execute if block 16 82 964 oak_button[powered=true] run scoreboard objectives add EscapeAccess dummy
scoreboard players add @e[tag=MainHubAEC] EscapeAccess 1
execute if entity @e[scores={EscapeAccess=1}] run kill @e[tag=HubCart,x=14,y=81,z=965,distance=5..]
execute if entity @e[scores={EscapeAccess=1}] run data merge entity @e[tag=HubCart,type=armor_stand,limit=1,x=14,y=80,z=965,dx=0,dy=1,dz=0] {NoGravity:0b,Motion:[0.0d,1.5d,-8.7d]}
execute if entity @e[scores={EscapeAccess=1}] run setblock 14 80 966 redstone_block
execute if entity @e[scores={EscapeAccess=2}] if entity @e[tag=HubCart] run playsound block.end_gateway.spawn master @a 14 81 965 100000 1.4 1
execute if entity @e[scores={EscapeAccess=15}] run setblock 14 80 966 clay
execute if entity @e[scores={EscapeAccess=35}] run playsound block.dispenser.dispense master @a 14 84 965 1 1.2 0

#execute if entity @e[scores={EscapeAccess=35}] run summon armor_stand 14 83 965 {Passengers:[{id:"minecraft:minecart",Invulnerable:true,Rotation:[90f,0f],Tags:["HubCart"]}],Marker:0b,Invisible:0b,Tags:["HubCart"]}
execute if entity @e[scores={EscapeAccess=35}] run summon armor_stand 14 83 965 {Passengers:[{id:"minecraft:minecart",Invulnerable:false,Rotation:[90f,0f],Tags:["HubCart"]}],Marker:0b,Invisible:1b,Small:1b,Tags:["HubCart"]}
#execute if entity @e[scores={EscapeAccess=35}] run summon minecart 14 83 965 {Invulnerable:true,Rotation:[90f,0f],Tags:["HubCart"]}
execute if entity @e[scores={EscapeAccess=50..}] run scoreboard objectives remove EscapeAccess

execute if entity @e[scores={EscapeAccess=45}] align x align y align z as @e[tag=HubCart,type=armor_stand,x=14,y=81,z=965,dx=0,dy=0,dz=0] run data merge entity @s {NoGravity:1b}
execute if entity @e[scores={EscapeAccess=45}] align x align y align z as @e[tag=HubCart,type=armor_stand,x=14,y=81,z=965,dx=0,dy=0,dz=0] at @s run teleport @s ~ ~-0.8 ~

execute if entity @e[tag=HubCart,type=armor_stand] align xyz as @e[tag=HubCart,type=armor_stand,x=13,y=67,z=902,dx=2,dy=0,dz=4,nbt={OnGround:1b}] run kill @s


execute if entity @e[scores={EscapeAccess=1..34}] at @e[tag=HubCart,type=minecart] run particle dust 0 1 1 1 ~ ~ ~0.5 0.2 0.1 0.2 0 10 force
execute if entity @e[scores={EscapeAccess=1}] at @e[tag=HubCart,type=minecart] run particle smoke ~ ~1 ~-1 0.3 0.3 0.3 0 100 force
execute if entity @e[scores={EscapeAccess=1..3}] align x align y align z run effect give @a[x=14,y=81,z=963,dx=0,dy=2,dz=1.5,nbt=!{RootVehicle:{Entity:{id:"minecraft:armor_stand"}}}] instant_damage 1 1 true
execute if entity @e[scores={EscapeAccess=1..3}] align x align y align z at @e[tag=HubCart] run teleport @a[x=14,y=81,z=963,dx=0,dy=2,dz=1.5,nbt=!{RootVehicle:{Entity:{id:"minecraft:armor_stand"}}}] ~ ~ ~

effect give @a[nbt={RootVehicle:{Entity:{id:"minecraft:armor_stand",Tags:["HubCart"]}}}] resistance 1 255 true

# ELYTRA ACCESS -> BAT
fill 37 61 944 37 61 944 purple_concrete replace air
execute unless entity @e[tag=ElytraSign] run summon item_frame 37 61 945 {Invulnerable:true,Facing:3b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:6}},Tags:["BranchSign","ElytraSign"]}

fill 48 53 924 50 53 926 purple_concrete_powder replace cyan_terracotta
fill 49 53 925 49 53 925 sea_lantern replace smooth_stone

scoreboard objectives add ElytraAccess dummy
scoreboard players add @e[tag=MainHubAEC] ElytraAccess 1
execute if entity @e[tag=ElytraBat] run scoreboard objectives remove ElytraAccess
execute if entity @e[scores={ElytraAccess=499}] run particle portal 49 57 925 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={ElytraAccess=500}] run playsound entity.enderman.teleport master @a 49 57 925 0.5 1 0
execute if entity @e[scores={ElytraAccess=500..}] run summon bat 49 57 925 {NoAI:true,Tags:["ElytraBat"]}
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] at @e[tag=ElytraBat] run summon item ~ ~ ~ {Item:{id:"minecraft:elytra",Count:1b},Motion:[0.0d,0.4d,0.0d]}
#execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] at @e[tag=ElytraBat] run playsound entity.item.pickup master @a
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] at @e[tag=ElytraBat] run playsound entity.vex.death master @a
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] at @e[tag=ElytraBat] run playsound block.enchantment_table.use ambient @a
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] at @e[tag=ElytraBat] run particle witch ~ ~0.3 ~ 0.1 0.2 0.1 1 50 force
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] run kill @e[tag=ElytraBat]

execute if entity @a[nbt={Inventory:[{id:"minecraft:elytra"}]}] run scoreboard objectives add ElytraDeaths deathCount
execute as @a[scores={ElytraDeaths=1..}] run clear @s elytra
scoreboard players reset @a[scores={ElytraDeaths=1..}]

execute if entity @a[nbt={Inventory:[{id:"minecraft:elytra"}]}] align x align y align z as @a at @s run clear @s[nbt={Inventory:[{id:"minecraft:elytra"}]},x=-87,y=71,z=813,dx=220,dy=20,dz=300] elytra


# DROPPER ACCESS -> LEVITATION POLE
fill 52 86 959 52 86 959 blue_concrete replace andesite
execute unless entity @e[tag=DropperSign] run summon item_frame 52 86 960 {Invulnerable:true,Facing:3b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:7}},Tags:["BranchSign","DropperSign"]}

fill 54 85 962 54 85 962 sea_lantern replace smooth_stone
fill 53 85 961 55 85 963 blue_concrete_powder replace grass_path
fill 54 86 962 54 181 962 blue_stained_glass_pane replace air
execute if block 54 86 962 blue_stained_glass_pane align x align y align z run effect give @a[x=54,y=86,z=962,dx=0,dy=85,dz=0] levitation 1 10



# SURVIVAL ACCESS -> SKELETON GRINDER
fill 74 81 999 74 81 999 brown_concrete replace birch_leaves
execute unless entity @e[tag=SurvivalSign] run summon item_frame 74 81 998 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:8}},Tags:["BranchSign","SurvivalSign"]}

difficulty easy
fill 72 80 992 72 80 992 redstone_wire replace grass_block
fill 72 81 992 72 81 992 brown_concrete_powder replace air
fill 73 81 992 73 81 992 stone_button[face=wall,facing=east,powered=false] replace air
fill 78 78 994 80 78 996 brown_concrete_powder replace dirt

#execute if block 73 81 992 stone_button[powered=true] run scoreboard objectives add SurvivalButton dummy
#scoreboard players add @e[tag=MainHubAEC] SurvivalButton 1
#execute if entity @e[scores={SurvivalButton=1}] run summon skeleton 74 74 990 {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["GrinderSkeleton"]}
#execute if block 73 81 992 stone_button[powered=false] run scoreboard objectives remove SurvivalButton
execute unless block 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"} run setblock 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"}

execute as @e[type=skeleton,x=74,y=75,z=990,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.0d,2.0d,0.0d]}
execute at @e[tag=GrinderSkeleton,nbt={HurtTime:10s}] run summon item ~ ~0.2 ~ {Item:{id:"minecraft:bone",Count:1b}}
execute as @e[tag=GrinderSkeleton,nbt={HurtTime:10s}] run kill @s

execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 structure_void replace acacia_wood
execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 air replace oak_stairs
execute if block 79 79 995 acacia_sapling[stage=1] run scoreboard objectives add SurvivalAccess dummy
execute if block 79 79 995 acacia_sapling[stage=1] run scoreboard players add @e[tag=MainHubAEC] SurvivalAccess 1
execute if block 79 79 995 acacia_sapling[stage=1] run fill 79 79 995 79 79 995 acacia_sapling[stage=0]
execute if entity @e[scores={SurvivalAccess=4}] run summon armor_stand 79 79 995 {Invulnerable:true,NoGravity:true,Invisible:true,Marker:true,Tags:["RootGrowth"]}
execute if entity @e[scores={SurvivalAccess=4}] run playsound block.chorus_flower.grow master @a 79 79 995 2 0.6 1

execute as @e[tag=RootGrowth] at @s run teleport @s ^ ^ ^0.5 facing 105 74 994
scoreboard players add @e[scores={SurvivalAccess=4..}] SurvivalAccess 1
execute as @e[tag=RootGrowth] at @s run fill 79 79 995 79 79 995 acacia_wood replace acacia_sapling
execute as @e[tag=RootGrowth] at @s run fill ~ ~-4 ~-2 ~ ~2 ~6 acacia_wood replace structure_void
kill @e[tag=RootGrowth,x=105,y=74,z=994,dx=0,dy=0,dz=0]
execute if entity @e[scores={SurvivalAccess=50..}] run scoreboard objectives remove SurvivalAccess

execute if block 82 79 1000 acacia_wood run fill 82 80 1000 82 80 1000 jungle_stairs[half=bottom,facing=south] replace air
execute if block 82 79 1000 acacia_wood run fill 82 80 1001 82 80 1001 jungle_stairs[half=top,facing=north] replace air
execute if block 82 79 1000 acacia_wood run fill 82 81 1001 82 81 1001 jungle_stairs[half=bottom,facing=north] replace air

execute if block 83 79 1001 acacia_wood run fill 83 78 1002 83 78 1002 jungle_stairs[half=top,facing=south] replace air
execute if block 83 79 1001 acacia_wood run fill 83 79 1002 83 79 1002 jungle_stairs[half=bottom,facing=north] replace air

execute if block 83 79 997 acacia_wood run fill 84 79 997 84 79 997 jungle_stairs[half=top,facing=west] replace air
execute if block 83 79 997 acacia_wood run fill 84 80 997 84 80 997 jungle_stairs[half=bottom,facing=east] replace air

execute if block 85 79 999 acacia_wood run fill 86 79 999 86 79 999 jungle_stairs[half=top,facing=west] replace air
execute if block 85 79 999 acacia_wood run fill 86 80 999 86 80 999 jungle_stairs[half=bottom,facing=west] replace air

execute if block 87 77 1001 acacia_wood run fill 87 76 1001 87 76 1001 jungle_stairs[half=top,facing=south] replace air
execute if block 87 77 1001 acacia_wood run fill 87 76 1002 87 76 1002 jungle_stairs[half=top,facing=north] replace air
execute if block 87 77 1001 acacia_wood run fill 87 77 1002 87 77 1002 jungle_stairs[half=bottom,facing=south] replace air

execute if block 89 75 997 acacia_wood run fill 89 75 996 89 75 996 jungle_stairs[half=top,facing=east] replace air
execute if block 89 75 997 acacia_wood run fill 89 76 996 89 76 996 jungle_stairs[half=bottom,facing=north] replace air
execute if block 89 75 997 acacia_wood run fill 89 76 995 89 76 995 jungle_stairs[half=bottom,facing=south] replace air

execute if block 91 74 997 acacia_wood run fill 90 72 997 90 72 997 jungle_stairs[half=top,facing=west] replace air
execute if block 91 74 997 acacia_wood run fill 90 73 997 90 73 997 jungle_stairs[half=bottom,facing=east] replace air
execute if block 91 74 997 acacia_wood run fill 91 73 997 91 73 997 jungle_stairs[half=top,facing=west] replace air

execute if block 91 75 998 acacia_wood run fill 91 74 1000 91 74 1000 jungle_stairs[half=bottom,facing=south] replace air
execute if block 91 75 998 acacia_wood run fill 91 74 999 91 74 999 jungle_stairs[half=top,facing=south] replace air
execute if block 91 75 998 acacia_wood run fill 91 75 999 91 75 999 jungle_stairs[half=bottom,facing=north] replace air

execute if block 92 75 998 acacia_wood run fill 92 76 998 92 76 998 jungle_stairs[half=bottom,facing=east] replace air
execute if block 92 75 998 acacia_wood run fill 93 76 998 93 76 998 jungle_stairs[half=top,facing=west] replace air
execute if block 92 75 998 acacia_wood run fill 93 77 998 93 77 998 jungle_stairs[half=bottom,facing=west] replace air

execute if block 94 73 994 acacia_wood run fill 94 72 993 94 72 993 jungle_stairs[half=bottom,facing=south] replace air
execute if block 94 73 994 acacia_wood run fill 94 72 994 94 72 994 jungle_stairs[half=top,facing=north] replace air

execute if block 96 73 995 acacia_wood run fill 96 74 996 96 74 996 jungle_stairs[half=bottom,facing=south] replace air

execute if block 97 73 993 acacia_wood run fill 97 72 992 97 72 992 jungle_stairs[half=top,facing=north] replace air
execute if block 97 73 993 acacia_wood run fill 97 73 992 97 73 992 jungle_stairs[half=bottom,facing=south] replace air

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 1
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:2b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 2
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:3b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 3
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:4b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 4
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:5b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 5
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:6b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 6
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:7b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 7
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:8b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 8
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:9b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 9

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:10b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 10
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:11b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 11
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:12b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 12
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:13b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 13
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:14b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 14
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:15b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 15
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:16b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 16
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:17b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 17
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:18b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 18
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:19b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 19

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:20b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 20
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:21b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 21
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:22b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 22
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:23b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 23
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:24b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 24
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:25b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 25
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:26b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 26
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:27b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 27
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:28b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 28
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:29b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 29

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:30b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 30
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:31b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 31
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:32b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 32
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:33b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 33
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:34b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 34
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:35b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 35
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:36b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 36
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:37b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 37
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:38b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 38
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:39b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 39

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:40b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 40
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:41b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 41
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:42b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 42
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:43b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 43
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:44b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 44
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:45b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 45
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:46b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 46
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:47b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 47
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:48b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 48
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:49b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 49

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:50b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 50
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:51b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 51
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:52b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 52
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:53b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 53
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:54b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 54
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:55b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 55
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:56b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 56
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:57b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 57
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:58b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 58
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:59b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 59

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:60b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 60
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:61b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 61
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:62b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 62
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:63b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 63
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal",Count:64b}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] weapon.mainhand bone_meal{CanPlaceOn:["minecraft:acacia_sapling"],HideFlags:16} 64



# PUZZLE ACCESS -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE
fill 66 85 1016 66 85 1016 red_concrete replace air
execute unless entity @e[tag=PuzzleSign] run summon item_frame 65 85 1016 {Invulnerable:true,Facing:4b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:9}},Tags:["BranchSign","PuzzleSign"]}


fill 58 85 1022 62 85 1022 red_concrete_powder replace jungle_leaves
fill 58 85 1022 62 85 1022 red_concrete_powder replace air
fill 58 86 1022 62 86 1022 light_gray_stained_glass replace air
fill 58 85 1021 62 85 1021 jungle_button[face=wall,facing=north,powered=false] replace air

fill 62 84 1023 62 84 1027 red_concrete_powder replace grass_block
fill 62 85 1027 62 89 1027 nether_brick_fence replace air
fill 62 90 1027 62 90 1027 observer[facing=west] replace air
fill 62 90 1026 62 90 1026 redstone_wall_torch[facing=north] replace air
fill 62 90 1028 62 90 1028 redstone_wall_torch[facing=south] replace air
fill 62 91 1027 62 91 1027 iron_trapdoor[half=bottom,open=false] replace air
fill 92 84 1027 92 84 1027 red_concrete_powder replace air
fill 92 85 1027 92 89 1027 nether_brick_fence replace air
fill 92 90 1027 92 90 1027 observer[facing=east] replace air
fill 92 90 1026 92 90 1026 redstone_wall_torch[facing=north] replace air
fill 92 90 1028 92 90 1028 redstone_wall_torch[facing=south] replace air
fill 92 91 1027 92 91 1027 iron_trapdoor[half=bottom,open=false] replace air

fill 89 77 1028 89 77 1028 purpur_block replace vine
fill 89 79 1029 89 79 1029 purpur_block replace vine
fill 88 76 1034 88 76 1034 pumpkin replace vine
fill 88 77 1032 88 77 1032 pumpkin replace vine
fill 88 79 1034 88 79 1034 pumpkin replace vine
fill 88 80 1031 88 80 1031 pumpkin replace vine
fill 88 81 1033 88 81 1033 pumpkin replace vine
fill 87 79 1037 87 79 1037 obsidian replace air
fill 87 79 1042 87 79 1042 iron_block replace vine
fill 88 80 1040 88 80 1040 iron_block replace vine
fill 87 82 1041 87 82 1041 iron_block replace air
fill 88 79 1045 88 79 1045 blue_ice replace vine
fill 88 80 1047 88 80 1047 blue_ice replace vine
fill 88 81 1045 88 81 1045 blue_ice replace vine
fill 88 82 1047 88 82 1047 blue_ice replace vine

execute unless entity @e[tag=BlackHubAS] run summon armor_stand 62 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["BlackHubAS","PuzzleHubAS"]}
execute unless entity @e[tag=PurpleHubAS] run summon armor_stand 61 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["PurpleHubAS","PuzzleHubAS"]}
execute unless entity @e[tag=WhiteHubAS] run summon armor_stand 60 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["WhiteHubAS","PuzzleHubAS"]}
execute unless entity @e[tag=LightBlueHubAS] run summon armor_stand 59 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["LightBlueHubAS","PuzzleHubAS"]}
execute unless entity @e[tag=OrangeHubAS] run summon armor_stand 58 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["OrangeHubAS","PuzzleHubAS"]}

execute at @e[tag=PuzzleHubAS] if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard objectives add PuzzleAccess dummy

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 1
execute as @e[scores={PuzzleAccess=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}
execute as @e[scores={PuzzleAccess=1}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=1}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 2
execute as @e[scores={PuzzleAccess=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}
execute as @e[scores={PuzzleAccess=2}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=2}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 3
execute as @e[scores={PuzzleAccess=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}
execute as @e[scores={PuzzleAccess=3}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=3}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 4
execute as @e[scores={PuzzleAccess=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}
execute as @e[scores={PuzzleAccess=4}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=4}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 5
execute as @e[scores={PuzzleAccess=5}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}
execute as @e[scores={PuzzleAccess=5}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=5}] run scoreboard objectives remove PuzzleAccess

execute if entity @e[tag=BlackHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] if entity @e[tag=PurpleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] if entity @e[tag=WhiteHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] if entity @e[tag=LightBlueHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] if entity @e[tag=OrangeHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] if block 58 85 1021 jungle_button run scoreboard objectives add PuzzleBridge dummy

execute if entity @e[tag=BlackHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] if entity @e[tag=PurpleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] if entity @e[tag=WhiteHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] if entity @e[tag=LightBlueHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] if entity @e[tag=OrangeHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] run fill 58 85 1021 62 85 1021 structure_void replace jungle_button

scoreboard players add @e[tag=MainHubAEC] PuzzleBridge 1

execute if entity @e[scores={PuzzleBridge=..119}] run fill 64 82 1023 64 82 1025 quartz_block replace redstone_block
execute if entity @e[scores={PuzzleBridge=..119}] run fill 93 82 1023 93 82 1025 quartz_block replace redstone_block

execute if entity @e[scores={PuzzleBridge=10}] run playsound entity.illusioner.cast_spell master @a 62 84 1027 1 0.7 0
execute if entity @e[scores={PuzzleBridge=30}] run playsound block.beacon.activate master @a 62 90 1027 2 1 0
execute if entity @e[scores={PuzzleBridge=30..65}] run particle instant_effect 62 90.5 1027 0.3 0.3 0.3 0 15 force
execute if entity @e[scores={PuzzleBridge=80}] run playsound block.beacon.power_select master @a 62 90 1027 0.5 1.5 0
execute if entity @e[scores={PuzzleBridge=80..87}] run particle dust 1 0 0 1 63 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=80..88}] run particle dust 1 0 0 1 64 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=80..89}] run particle dust 1 0 0 1 65 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..90}] run particle dust 1 0 0 1 66 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..91}] run particle dust 1 0 0 1 67 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..92}] run particle dust 1 0 0 1 68 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..93}] run particle dust 1 0 0 1 69 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..94}] run particle dust 1 0 0 1 70 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..95}] run particle dust 1 0 0 1 71 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..96}] run particle dust 1 0 0 1 72 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..97}] run particle dust 1 0 0 1 73 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..98}] run particle dust 1 0 0 1 74 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..99}] run particle dust 1 0 0 1 75 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..100}] run particle dust 1 0 0 1 76 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..101}] run particle dust 1 0 0 1 77 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..102}] run particle dust 1 0 0 1 78 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..103}] run particle dust 1 0 0 1 79 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..104}] run particle dust 1 0 0 1 80 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..105}] run particle dust 1 0 0 1 81 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..106}] run particle dust 1 0 0 1 82 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..107}] run particle dust 1 0 0 1 83 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..108}] run particle dust 1 0 0 1 84 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..109}] run particle dust 1 0 0 1 85 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..110}] run particle dust 1 0 0 1 86 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..111}] run particle dust 1 0 0 1 87 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..112}] run particle dust 1 0 0 1 88 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..113}] run particle dust 1 0 0 1 89 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=89..114}] run particle dust 1 0 0 1 90 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=89..115}] run particle dust 1 0 0 1 91 90.5 1027 0.3 0 0 0 3 force

execute if entity @e[scores={PuzzleBridge=125}] run playsound entity.guardian.attack master @a 62 90 1027 2 1.4 1
execute if entity @e[scores={PuzzleBridge=125..150}] run particle instant_effect 92 90.5 1027 0.3 0.3 0.3 0 15 force

scoreboard players set @e[scores={PuzzleBridge=180..}] PuzzleBridge 160
execute if entity @e[scores={PuzzleBridge=160}] run fill 64 82 1023 64 82 1025 redstone_block
execute if entity @e[scores={PuzzleBridge=160}] run fill 93 82 1023 93 82 1025 redstone_block

execute if entity @e[scores={PuzzleBridge=170}] run fill 64 82 1023 64 82 1025 quartz_block
execute if entity @e[scores={PuzzleBridge=170}] run fill 93 82 1023 93 82 1025 quartz_block

execute if entity @e[scores={PuzzleBridge=178}] run fill 66 82 1023 66 82 1025 red_stained_glass replace air
execute if entity @e[scores={PuzzleBridge=178}] run fill 91 82 1023 91 82 1025 red_stained_glass replace air

execute if block 78 82 1023 stone if block 79 82 1023 grass_block run scoreboard objectives remove PuzzleBridge


# BOSS ACCESS -> LOCKED WALKWAY
#fill 47 87 1033 47 87 1033 black_concrete replace air
#execute unless entity @e[tag=BossSign] run summon item_frame 46 87 1033 {Invulnerable:true,Facing:4b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:10}},Tags:["BranchSign","BossSign"]}
fill 45 89 1040 45 89 1040 black_concrete replace orange_concrete
execute unless entity @e[tag=BossSign] run summon item_frame 45 89 1039 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:10}},Tags:["BranchSign","BossSign"]}

execute if block 43 84 1040 air run setblock -80 2 0 redstone_block
execute if block 43 84 1040 air run setblock -80 2 0 clay
execute if block 43 84 1040 air run setblock 43 89 1040 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-5,posZ:0,integrity:1.0f, showair:0b,name:"boss_bridge_1",sizeX:5,sizeY:6,sizeZ:16,showboundingbox:1b}
execute if block 43 84 1040 air run setblock 43 88 1040 redstone_block

execute if block 43 84 1056 air run setblock -80 2 16 redstone_block
execute if block 43 84 1056 air run setblock -80 2 16 clay
execute if block 43 84 1056 air run setblock 43 89 1056 structure_block[mode=load]{metadata:"",ignoreEntities:1b,powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:-5,posZ:0,integrity:1.0f, showair:0b,name:"boss_bridge_2",sizeX:5,sizeY:6,sizeZ:17,showboundingbox:1b}
execute if block 43 84 1056 air run setblock 43 88 1056 redstone_block

execute if block 11 6 14 orange_wool if block 45 86 1040 orange_concrete run fill 45 86 1040 45 87 1040 air destroy
execute if block 10 6 14 yellow_wool if block 45 86 1044 yellow_concrete run fill 45 86 1044 45 87 1044 air destroy
execute if block 9 6 14 lime_wool if block 45 86 1048 lime_concrete run fill 45 86 1048 45 87 1048 air destroy
execute if block 8 6 14 pink_wool if block 45 86 1052 pink_concrete run fill 45 86 1052 45 87 1052 air destroy
execute if block 7 6 14 cyan_wool if block 45 86 1056 cyan_concrete run fill 45 86 1056 45 87 1056 air destroy
execute if block 6 6 14 purple_wool if block 45 86 1060 purple_concrete run fill 45 86 1060 45 87 1060 air destroy
execute if block 5 6 14 blue_wool if block 45 86 1064 blue_concrete run fill 45 86 1064 45 87 1064 air destroy
execute if block 4 6 14 brown_wool if block 45 86 1068 brown_concrete run fill 45 86 1068 45 87 1068 air destroy
execute if block 3 6 14 red_wool if block 45 86 1072 red_concrete run fill 45 86 1072 45 87 1072 air destroy
