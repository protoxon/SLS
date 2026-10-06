####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# REMOVE WHITE WOOL SEGMENT
fill 8 87 998 8 87 998 air replace end_rod
fill 8 86 998 8 86 998 chiseled_stone_bricks replace observer

# BLOCKS TOP CHEST WHEN PIECE GETS SUMMONED
execute if entity @e[tag=MonumentPiece] if block 8 92 1032 air run setblock 8 92 1032 barrier
execute if entity @e[tag=MonumentPiece] if block 8 94 1032 air run setblock 8 94 1032 barrier

execute unless entity @e[tag=MonumentPiece] if block 8 92 1032 barrier run setblock 8 92 1032 air
execute unless entity @e[tag=MonumentPiece] if block 8 94 1032 barrier run setblock 8 94 1032 air


# ROTATE PLAYER ON MONUMENT WOOL -> GLICTHED IN MULTIPLAYER?
#execute as @a at @s if entity @e[tag=MonumentShulker,dx=0,dy=-0.1,dz=0] if block ~ ~-1 ~ iron_bars run teleport @s ~ ~ ~ ~1 ~


# ADVENTURE
fill -11 87 1044 -11 87 1044 orange_concrete replace air

# ARENA
fill -28 86 1033 -28 86 1033 yellow_concrete replace jungle_leaves
fill -20 89 1039 -20 89 1039 lever[face=wall,facing=east,powered=false] replace air
fill -21 89 1039 -21 89 1039 yellow_concrete_powder replace oak_wood

# TOO LAZY TO FIX
execute if block -50 57 1024 chest run setblock -50 57 1024 air
execute if block 101 91 969 air run setblock 101 91 969 birch_leaves
execute if block 31 116 1033 air run setblock 31 116 1033 birch_leaves

# TRIVIA ACCESS
fill -24 87 992 -24 87 992 lime_concrete replace jungle_leaves

fill -24 87 985 -24 87 985 air replace oak_leaves
fill -24 86 986 -24 86 986 hopper{CustomName:"{\"text\":\"Phantom Gondola Toll Required\"}"} replace grass_block
fill -24 86 987 -24 86 987 lime_concrete_powder replace stone
fill -24 86 985 -24 86 985 lime_concrete_powder replace grass_block
fill -25 86 986 -25 86 986 lime_concrete_powder replace grass_block
fill -23 86 986 -23 86 986 lime_concrete_powder replace grass_block


# PARKOUR ACCESS
#fill -33 255 950 -31 255 952 ice replace air
#fill -29 255 954 -27 255 956 ice replace air
#fill -24 255 955 -22 255 957 ice replace air
#fill -19 255 952 -17 255 954 ice replace air
#fill -14 255 951 -12 255 953 ice replace air
#fill -9 255 954 -7 255 956 ice replace air
#fill -7 255 959 -5 255 961 ice replace air
#fill -6 255 963 -4 255 965 ice replace air

# 1.14.4 better chunk loading
#fill -33 255 950 -4 255 965 air replace ice

fill -9 85 969 -9 85 969 pink_concrete replace air

fill -1 85 969 -1 85 969 pink_concrete_powder replace air
fill -1 86 969 -1 86 969 lever[face=floor,facing=west,powered=false] replace air


# ESCAPE ACCESS
fill 12 82 964 12 82 964 cyan_concrete replace stone

fill 18 86 968 18 86 968 cyan_concrete_powder replace stone
fill 17 86 968 17 86 968 lever[face=wall,facing=west,powered=false] replace air


# ELYTRA ACCESS
fill 37 61 944 37 61 944 purple_concrete replace air

fill 48 53 924 50 53 926 purple_concrete_powder replace cyan_terracotta
fill 49 53 925 49 53 925 sea_lantern replace smooth_stone

# DROPPER ACCESS
fill 52 86 959 52 86 959 blue_concrete replace andesite

fill 54 85 962 54 85 962 sea_lantern replace smooth_stone
fill 53 85 961 55 85 963 blue_concrete_powder replace grass_path
fill 54 86 962 54 181 962 blue_stained_glass_pane replace air


# SURVIVAL ACCESS
fill 74 81 999 74 81 999 brown_concrete replace birch_leaves

fill 72 80 992 72 80 992 redstone_wire replace grass_block
fill 72 81 992 72 81 992 brown_concrete_powder replace air
fill 73 81 992 73 81 992 stone_button[face=wall,facing=east,powered=false] replace air
fill 78 78 994 80 78 996 brown_concrete_powder replace dirt

execute unless block 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"} run setblock 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"}

execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 structure_void replace acacia_wood
execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 air replace oak_stairs

# PUZZLE ACCESS
fill 66 85 1016 66 85 1016 red_concrete replace air

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

execute if block 62 86 1022 light_gray_stained_glass unless entity @e[tag=BlackHubAS] run summon armor_stand 62 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["BlackHubAS","PuzzleHubAS"]}
execute if block 61 86 1022 light_gray_stained_glass unless entity @e[tag=PurpleHubAS] run summon armor_stand 61 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["PurpleHubAS","PuzzleHubAS"]}
execute if block 60 86 1022 light_gray_stained_glass unless entity @e[tag=WhiteHubAS] run summon armor_stand 60 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["WhiteHubAS","PuzzleHubAS"]}
execute if block 59 86 1022 light_gray_stained_glass unless entity @e[tag=LightBlueHubAS] run summon armor_stand 59 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["LightBlueHubAS","PuzzleHubAS"]}
execute if block 58 86 1022 light_gray_stained_glass unless entity @e[tag=OrangeHubAS] run summon armor_stand 58 84.35 1022.25 {ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}],Rotation:[180f,0f],Invisible:true,NoGravity:true,Invulnerable:true,Tags:["OrangeHubAS","PuzzleHubAS"]}

##??execute if block 78 82 1023 stone if block 79 82 1023 grass_block run scoreboard objectives remove PuzzleBridge


# BOSS ACCESS
fill 45 89 1040 45 89 1040 black_concrete replace orange_concrete

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