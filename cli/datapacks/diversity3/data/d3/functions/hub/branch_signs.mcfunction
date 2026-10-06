####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute as @e[tag=BranchSign,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}

execute if block -11 87 1044 orange_concrete unless entity @e[tag=AdventureSign] run summon item_frame -12 87 1044 {Invulnerable:true,Facing:4b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:1}},Tags:["BranchSign","AdventureSign"]}

execute if block -28 86 1033 yellow_concrete unless entity @e[tag=ArenaSign] run summon item_frame -28 86 1032 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:2}},Tags:["BranchSign","ArenaSign"]}

execute if block -24 87 992 lime_concrete unless entity @e[tag=TriviaSign] run summon item_frame -24 87 991 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:3}},Tags:["BranchSign","TriviaSign"]}

execute if block -9 85 969 pink_concrete unless entity @e[tag=ParkourSign] run summon item_frame -8 85 969 {Invulnerable:true,Facing:5b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:4}},Tags:["BranchSign","ParkourSign"]}

execute if block 13 82 964 air if block 12 82 964 cyan_concrete unless entity @e[tag=EscapeSign] run summon item_frame 13 82 964 {Invulnerable:true,Facing:5b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:5}},Tags:["BranchSign","EscapeSign"]}

execute if block 37 61 944 purple_concrete unless entity @e[tag=ElytraSign] run summon item_frame 37 61 945 {Invulnerable:true,Facing:3b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:6}},Tags:["BranchSign","ElytraSign"]}

execute if block 52 86 959 blue_concrete unless entity @e[tag=DropperSign] run summon item_frame 52 86 960 {Invulnerable:true,Facing:3b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:7}},Tags:["BranchSign","DropperSign"]}

execute if block 74 81 999 brown_concrete unless entity @e[tag=SurvivalSign] run summon item_frame 74 81 998 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:8}},Tags:["BranchSign","SurvivalSign"]}

execute if block 66 85 1016 red_concrete unless entity @e[tag=PuzzleSign] run summon item_frame 65 85 1016 {Invulnerable:true,Facing:4b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:9}},Tags:["BranchSign","PuzzleSign"]}

execute if block 45 89 1040 black_concrete unless entity @e[tag=BossSign] run summon item_frame 45 89 1039 {Invulnerable:true,Facing:2b,Silent:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:10}},Tags:["BranchSign","BossSign"]}