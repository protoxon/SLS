####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

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

