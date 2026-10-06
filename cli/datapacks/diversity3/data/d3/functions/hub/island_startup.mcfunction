####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 29 2018 / AUGUST 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar WhiteFailSafe



# MONUMENT RESET
#execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run advancement revoke @a everything
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] if entity @e[tag=MonumentCart] run kill @e[tag=MonumentCart]
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] if entity @e[tag=MonumentShulker] run kill @e[tag=MonumentShulker]
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 0 91 1033 16 91 1039 air replace iron_bars
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 16 90 1033 16 90 1033 grass_block replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 15 90 1035 15 90 1035 grass_block replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 14 90 1037 14 90 1037 mossy_stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 12 90 1038 12 90 1038 stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 10 90 1039 10 90 1039 mossy_stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 8 90 1039 8 90 1039 stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 6 90 1039 6 90 1039 cracked_stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 4 90 1038 4 90 1038 stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 2 90 1037 2 90 1037 mossy_stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 1 90 1035 1 90 1035 stone_bricks replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 0 90 1033 0 90 1033 coarse_dirt replace redstone_lamp
execute if entity @e[tag=FailSafeStand] unless entity @e[scores={WhiteWoolTimer=0..}] unless entity @e[scores={LoadAccessPoints=0..}] run fill 1 6 14 12 6 14 gravel


# WHITE WOOL
fill 8 87 998 8 87 998 end_rod[facing=down] replace air
fill 8 86 998 8 86 998 observer[facing=down] replace chiseled_stone_bricks

execute if block 8 87 998 end_rod run scoreboard objectives add WhiteFailSafe dummy
execute if entity @e[scores={WhiteWoolTimer=0..}] run scoreboard objectives remove WhiteFailSafe
execute if entity @e[scores={LoadAccessPoints=0..}] run scoreboard objectives remove WhiteFailSafe

scoreboard players add @e[tag=MainHubAEC] WhiteFailSafe 1
execute if entity @e[tag=FailSafeStand] run scoreboard players set @e[tag=MainHubAEC] WhiteFailSafe 0
execute if entity @a[nbt={Inventory:[{id:"minecraft:white_wool"}]}] run scoreboard players set @e[tag=MainHubAEC] WhiteFailSafe 0
execute if entity @e[type=item,nbt={Item:{id:"minecraft:white_wool"}}] run scoreboard players set @e[tag=MainHubAEC] WhiteFailSafe 0

execute if entity @e[tag=MainHubAEC,scores={WhiteFailSafe=2}] run playsound entity.zombie_villager.converted master @a 8 87 998 1 1 0
execute if entity @e[tag=MainHubAEC,scores={WhiteFailSafe=20..}] run summon armor_stand 8 87.25 998 {NoGravity:true,Small:true,Invisible:true,ShowArms:false,ArmorItems:[{},{},{},{id:"minecraft:white_wool",Count:1b}],Tags:["FailSafeStand"]}
execute if entity @e[tag=FailSafeStand] unless entity @e[tag=SpectralStand] if block 8 87 998 end_rod run summon armor_stand 8 87.25 998 {NoGravity:true,Small:true,Invisible:true,Marker:1b,ShowArms:false,ArmorItems:[{},{},{},{id:"minecraft:white_wool",Count:1b}],Tags:["SpectralStand"]}
execute at @e[tag=FailSafeStand] if entity @a[distance=12..] as @e[tag=SpectralStand] run data merge entity @s {Glowing:1b}
execute at @e[tag=FailSafeStand] if entity @a[distance=..11] as @e[tag=SpectralStand] run data merge entity @s {Glowing:0b}



execute if entity @e[tag=SpectralStand] unless entity @e[tag=FailSafeStand] run kill @e[tag=SpectralStand]

execute if entity @a[nbt={Inventory:[{id:"minecraft:white_wool"}]}] if entity @e[tag=FailSafeStand] run playsound block.wool.break master @a 8 88 998 1 1 0
execute if entity @a[nbt={Inventory:[{id:"minecraft:white_wool"}]}] run execute as @e[tag=FailSafeStand] run kill @s

scoreboard players set @e[tag=FailSafeStand,scores={WhiteFailSafe=30..}] WhiteFailSafe 0
scoreboard players add @e[tag=FailSafeStand] WhiteFailSafe 1
#execute at @e[tag=FailSafeStand,scores={WhiteFailSafe=2}] run particle mycelium ~ ~1 ~ 0.2 0.2 0.2 0 7 force
#execute at @e[tag=FailSafeStand] run particle end_rod ~ ~1 ~ 0.2 0.2 0.2 0 5 force

scoreboard players add @e[type=item,nbt={Item:{id:"minecraft:white_wool"}}] WhiteFailSafe 1
execute as @e[type=item,scores={WhiteFailSafe=500..}] run kill @s

execute if entity @e[tag=BranchSign] run kill @e[tag=BranchSign]


# BLOCKS TOP CHEST WHEN PIECE GETS SUMMONED
execute if entity @e[tag=MonumentPiece] if block 8 92 1032 air run setblock 8 92 1032 barrier
execute if entity @e[tag=MonumentPiece] if block 8 94 1032 air run setblock 8 94 1032 barrier

execute unless entity @e[tag=MonumentPiece] if block 8 92 1032 barrier run setblock 8 92 1032 air
execute unless entity @e[tag=MonumentPiece] if block 8 94 1032 barrier run setblock 8 94 1032 air


# ORANGE
fill -11 87 1044 -11 87 1044 air replace orange_concrete


# YELLOW
fill -28 86 1033 -28 86 1033 jungle_leaves[persistent=true] replace yellow_concrete

fill -20 89 1039 -20 89 1039 air replace lever
fill -21 89 1039 -21 89 1039 oak_wood replace yellow_concrete_powder
fill -26 99 1043 -26 102 1043 air replace ladder
fill -64 80 1048 -64 80 1048 redstone_lamp[lit=false] replace glowstone
fill -63 80 1048 -63 80 1048 oak_button[face=wall,facing=east,powered=false] replace air
fill -56 73 1028 -32 85 1052 air replace oak_fence
fill -56 73 1028 -32 85 1052 air replace oak_slab
fill -56 73 1028 -32 85 1052 air replace spruce_planks
fill -56 73 1028 -32 85 1052 air replace spruce_slab
execute if entity @e[tag=TridentAS] run kill @e[tag=TridentAS]


# LIME
fill -24 87 992 -24 87 992 jungle_leaves[persistent=true] replace lime_concrete
fill -22 86 978 -22 86 978 air replace lime_concrete_powder
fill -22 86 977 -22 86 977 air replace oak_wall_sign
fill -24 87 985 -24 87 985 oak_leaves[persistent=true] replace air
fill -24 87 986 -24 87 986 air replace bone_block
fill -23 87 985 -23 87 985 jungle_leaves[persistent=true] replace air
fill -23 88 985 -23 88 985 oak_leaves[persistent=true] replace air

execute if entity @e[tag=TriviaBoneFrame] run kill @e[tag=TriviaBoneFrame]

#fill -24 86 986 -24 86 986 grass_block replace hopper
fill -24 85 986 -24 85 986 dirt replace sticky_piston
fill -24 86 986 -24 86 986 grass_block replace piston_head
fill -24 86 986 -24 86 986 grass_block replace air
fill -24 86 986 -24 86 986 grass_block replace bone_block
fill -24 86 987 -24 86 987 stone replace lime_concrete_powder
fill -25 86 986 -25 86 986 grass_block replace lime_concrete_powder
fill -23 86 986 -23 86 986 grass_block replace lime_concrete_powder
fill -24 86 985 -24 86 985 grass_block replace lime_concrete_powder


# PINK
fill -33 255 950 -4 255 965 air replace ice

fill -9 85 969 -9 85 969 air replace pink_concrete

fill -1 86 969 -1 86 969 air replace lever
fill -1 85 969 -1 85 969 air replace pink_concrete_powder

fill -33 78 950 -4 84 965 air replace sea_lantern
fill -33 78 950 -4 84 965 air replace pink_concrete
fill -33 78 950 -4 84 965 air replace pink_concrete_powder
fill -33 78 950 -4 84 965 air replace barrier


# CYAN
fill 12 82 964 12 82 964 stone replace cyan_concrete

fill 17 86 968 17 86 968 air replace lever
fill 18 86 968 18 86 968 stone replace cyan_concrete_powder
fill 13 81 964 15 83 964 cyan_concrete_powder replace air


# PURPLE
fill 37 61 944 37 61 944 air replace purple_concrete

fill 48 53 924 50 53 926 cyan_terracotta replace purple_concrete_powder
fill 49 53 925 49 53 925 smooth_stone replace sea_lantern
execute if entity @e[tag=ElytraBat] run kill @e[tag=ElytraBat]


# BLUE
fill 52 86 959 52 86 959 andesite replace blue_concrete

fill 54 85 962 54 85 962 smooth_stone replace sea_lantern
fill 53 85 961 55 85 963 grass_path replace blue_concrete_powder
fill 54 86 962 54 181 962 air replace blue_stained_glass_pane


# BROWN
fill 74 81 999 74 81 999 birch_leaves[persistent=true] replace brown_concrete

fill 73 81 992 73 81 992 air replace stone_button
fill 72 80 992 72 80 992 grass_block replace redstone_wire
fill 72 81 992 72 81 992 air replace brown_concrete_powder
fill 78 78 994 80 78 996 dirt replace brown_concrete_powder

fill 79 79 995 79 79 995 acacia_sapling replace acacia_wood
execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 structure_void replace acacia_wood
execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 air replace jungle_stairs


# RED
fill 66 85 1016 66 85 1016 air replace red_concrete

fill 58 85 1021 62 85 1021 air replace jungle_button
fill 58 85 1021 62 85 1021 air replace structure_void
fill 58 85 1022 59 85 1022 jungle_leaves[persistent=true] replace red_concrete_powder
fill 61 85 1022 62 85 1022 jungle_leaves[persistent=true] replace red_concrete_powder
fill 60 85 1022 60 85 1022 air replace red_concrete_powder
fill 58 86 1022 62 86 1022 air replace light_gray_stained_glass
fill 62 84 1023 62 84 1027 grass_block replace red_concrete_powder
fill 92 84 1027 92 84 1027 air replace red_concrete_powder
fill 62 85 1027 92 89 1027 air replace nether_brick_fence
fill 62 90 1026 92 90 1028 air replace redstone_torch
fill 62 90 1027 92 90 1027 air replace observer
fill 62 91 1027 92 91 1027 air replace iron_trapdoor
execute if entity @e[tag=PuzzleHubAS] run kill @e[tag=PuzzleHubAS]

fill 64 82 1023 64 82 1025 quartz_block replace redstone_block
fill 93 82 1023 93 82 1025 quartz_block replace redstone_block
fill 67 82 1023 67 82 1025 stone replace red_stained_glass
fill 67 82 1023 67 82 1025 stone replace air
fill 68 82 1023 89 82 1025 air replace stone
fill 68 82 1023 89 82 1025 air replace grass_block
fill 68 82 1023 89 82 1025 air replace red_stained_glass
fill 90 82 1023 90 82 1025 grass_block replace red_stained_glass
fill 90 82 1023 90 82 1025 grass_block replace air

fill 89 77 1028 89 77 1028 vine[east=true] replace purpur_block
fill 89 79 1029 89 79 1029 vine[east=true] replace purpur_block
fill 88 76 1034 88 76 1034 vine[east=true] replace pumpkin
fill 88 77 1032 88 77 1032 vine[east=true] replace pumpkin
fill 88 79 1034 88 79 1034 vine[east=true] replace pumpkin
fill 88 80 1031 88 80 1031 vine[east=true] replace pumpkin
fill 88 81 1033 88 81 1033 vine[east=true] replace pumpkin
fill 87 79 1037 87 79 1037 air replace obsidian
fill 87 79 1042 87 79 1042 vine[east=true] replace iron_block
fill 88 80 1040 88 80 1040 vine[east=true] replace iron_block
fill 87 82 1041 87 82 1041 air replace iron_block
fill 88 79 1045 88 79 1045 vine[east=true] replace blue_ice
fill 88 80 1047 88 80 1047 vine[east=true] replace blue_ice
fill 88 81 1045 88 81 1045 vine[east=true] replace blue_ice
fill 88 82 1047 88 82 1047 vine[east=true] replace blue_ice


# BLACK
fill 47 87 1033 47 87 1033 air replace black_concrete

fill 43 84 1040 47 89 1072 air replace black_concrete_powder
fill 43 84 1040 47 89 1072 air replace black_stained_glass
fill 43 84 1040 47 89 1072 air replace black_stained_glass_pane
fill 43 84 1040 47 89 1072 air replace orange_concrete
fill 43 84 1040 47 89 1072 air replace yellow_concrete
fill 43 84 1040 47 89 1072 air replace lime_concrete
fill 43 84 1040 47 89 1072 air replace pink_concrete
fill 43 84 1040 47 89 1072 air replace cyan_concrete
fill 43 84 1040 47 89 1072 air replace purple_concrete
fill 43 84 1040 47 89 1072 air replace blue_concrete
fill 43 84 1040 47 89 1072 air replace brown_concrete
fill 43 84 1040 47 89 1072 air replace red_concrete
fill 43 84 1040 47 89 1072 air replace black_concrete
fill 43 84 1040 47 89 1072 air replace barrier


# BRANCH TELEPORTER BEAMS
execute if block 11 6 14 gravel run execute if block -23 87 1091 barrier run setblock -23 87 1091 redstone_lamp
execute if block 11 6 14 gravel run execute if block -23 88 1091 orange_carpet run setblock -23 88 1091 heavy_weighted_pressure_plate

execute if block 10 6 14 gravel run execute if block -62 73 1057 barrier run setblock -62 73 1057 redstone_lamp
execute if block 10 6 14 gravel run execute if block -62 74 1057 yellow_carpet run setblock -62 74 1057 heavy_weighted_pressure_plate

execute if block 9 6 14 gravel run execute if block -65 90 981 barrier run setblock -65 90 981 redstone_lamp
execute if block 9 6 14 gravel run execute if block -65 91 981 lime_carpet run setblock -65 91 981 heavy_weighted_pressure_plate

execute if block 8 6 14 gravel run execute if block -33 81 930 barrier run setblock -33 81 930 redstone_lamp
execute if block 8 6 14 gravel run execute if block -33 82 930 pink_carpet run setblock -33 82 930 heavy_weighted_pressure_plate

execute if block 7 6 14 gravel run execute if block 10 67 888 barrier run setblock 10 67 888 redstone_lamp
execute if block 7 6 14 gravel run execute if block 10 68 888 cyan_carpet run setblock 10 68 888 heavy_weighted_pressure_plate

execute if block 6 6 14 gravel run execute if block 89 38 824 barrier run setblock 89 38 824 redstone_lamp
execute if block 6 6 14 gravel run execute if block 89 39 824 purple_carpet run setblock 89 39 824 heavy_weighted_pressure_plate

execute if block 5 6 14 gravel run execute if block 60 93 940 barrier run setblock 60 93 940 redstone_lamp
execute if block 5 6 14 gravel run execute if block 60 94 940 blue_carpet run setblock 60 94 940 heavy_weighted_pressure_plate

execute if block 4 6 14 gravel run execute if block 106 77 980 barrier run setblock 106 77 980 redstone_lamp
execute if block 4 6 14 gravel run execute if block 106 78 980 brown_carpet run setblock 106 78 980 heavy_weighted_pressure_plate

execute if block 3 6 14 gravel run execute if block 105 90 1049 barrier run setblock 105 90 1049 redstone_lamp
execute if block 3 6 14 gravel run execute if block 105 91 1049 red_carpet run setblock 105 91 1049 heavy_weighted_pressure_plate

execute if block 2 6 14 gravel run execute if block 47 89 1090 barrier run setblock 47 89 1090 redstone_lamp
execute if block 2 6 14 gravel run execute if block 47 90 1090 black_carpet run setblock 47 90 1090 heavy_weighted_pressure_plate
