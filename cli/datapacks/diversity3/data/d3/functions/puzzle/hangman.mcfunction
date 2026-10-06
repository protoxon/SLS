####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 7 2017 / MAY 25 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar HangmanSetup
#scoreboard objectives setdisplay sidebar HangmanRound
#scoreboard objectives setdisplay sidebar HangmanHint
#scoreboard objectives setdisplay sidebar SelectedLetter
#scoreboard objectives setdisplay sidebar CorrectLetter
#scoreboard objectives setdisplay sidebar LetterTimer
#scoreboard objectives setdisplay sidebar DeathSFX
#scoreboard objectives setdisplay sidebar HangmanWin

# STARTUP
scoreboard objectives add HangmanRound dummy
scoreboard players add @e[tag=MainPuzzleAEC] HangmanRound 0
scoreboard players set @e[scores={HangmanRound=0}] HangmanRound 1

scoreboard objectives add HangmanSetup dummy
scoreboard players add @e[tag=MainPuzzleAEC] HangmanSetup 1

execute if entity @e[scores={HangmanSetup=0..1}] run scoreboard objectives remove HangmanWin


# ROUND RANDOMIZER
execute if entity @e[scores={HangmanRound=1,HangmanSetup=1}] run fill 40 7 14 40 16 14 lime_concrete
execute if entity @e[scores={HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC]
execute if entity @e[scores={HangmanSetup=1}] if block 40 7 14 lime_concrete run summon area_effect_cloud 40 7 14 {Tags:["HangmanGlowstoneAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 8 14 lime_concrete run summon area_effect_cloud 40 8 14 {Tags:["HangmanEndermiteAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 9 14 lime_concrete run summon area_effect_cloud 40 9 14 {Tags:["HangmanGunpowderAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 10 14 lime_concrete run summon area_effect_cloud 40 10 14 {Tags:["HangmanSwamplandAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 11 14 lime_concrete run summon area_effect_cloud 40 11 14 {Tags:["HangmanChainmailAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 12 14 lime_concrete run summon area_effect_cloud 40 12 14 {Tags:["HangmanFramerateAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 13 14 lime_concrete run summon area_effect_cloud 40 13 14 {Tags:["HangmanSuperflatAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 14 14 lime_concrete run summon area_effect_cloud 40 14 14 {Tags:["HangmanShipwreckAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 15 14 lime_concrete run summon area_effect_cloud 40 15 14 {Tags:["HangmanInventoryAEC","RandomHangmanAEC"],Duration:2147483647}
execute if entity @e[scores={HangmanSetup=1}] if block 40 16 14 lime_concrete run summon area_effect_cloud 40 16 14 {Tags:["HangmanExplosionAEC","RandomHangmanAEC"],Duration:2147483647}

execute if entity @e[scores={HangmanRound=1,HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC,limit=9,sort=random]
execute if entity @e[scores={HangmanRound=2,HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC,limit=8,sort=random]
execute if entity @e[scores={HangmanRound=3,HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC,limit=7,sort=random]
execute if entity @e[scores={HangmanRound=4,HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC,limit=6,sort=random]
execute if entity @e[scores={HangmanRound=5,HangmanSetup=1}] run kill @e[tag=RandomHangmanAEC,limit=5,sort=random]


execute if entity @e[scores={HangmanSetup=1}] run setblock 998 63 -6 oak_leaves[persistent=true]
execute if entity @e[scores={HangmanSetup=1}] run kill @e[tag=HangmanMob]
execute if entity @e[scores={HangmanSetup=1}] run kill @e[tag=HangmanHintAEC]
execute if entity @e[scores={HangmanSetup=1}] run clear @a white_banner

execute if entity @e[scores={HangmanSetup=1}] run fill 996 66 -11 1004 66 -11 air
execute if entity @e[scores={HangmanSetup=1}] run setblock 998 63 -6 green_terracotta
execute if entity @e[scores={HangmanSetup=1}] run setblock 1002 63 -6 green_terracotta
execute if entity @e[scores={HangmanSetup=1}] run setblock 1000 64 -6 air

execute if entity @e[scores={HangmanSetup=1}] run setblock 994 65 -13 clay


# ROUND 1 SETUP -> SLOWER
execute if entity @e[scores={HangmanRound=1,HangmanSetup=30}] run setblock 996 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=30}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=35}] run setblock 997 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=35}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=40}] run setblock 998 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=40}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=45}] run setblock 999 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=45}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=50}] run setblock 1000 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=50}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=55}] run setblock 1001 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=55}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=60}] run setblock 1002 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=60}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=65}] run setblock 1003 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HangmanRound=1,HangmanSetup=65}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=1,HangmanSetup=70}] run setblock 1004 66 -11 black_wall_banner[facing=south]{Patterns: [{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:15},{Pattern:"bts",Color:0},{Pattern:"ls",Color:15},{Pattern:"br",Color:15},{Pattern:"ts",Color:0},{Pattern:"bo",Color:15}]}


# JUMP TIME FOR OTHER ROUNDS
scoreboard players set @e[scores={HangmanRound=2..5,HangmanSetup=35}] HangmanSetup 70

# ROUND 2 BANNER COLOURS
execute if entity @e[scores={HangmanSetup=70}] run playsound block.note_block.hat master @a 1000 64 -11 1 1 0

execute if entity @e[scores={HangmanRound=2,HangmanSetup=70}] run fill 996 66 -11 1004 66 -11 purple_wall_banner[facing=south]{Patterns:[{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:10},{Pattern:"bts",Color:10},{Pattern:"bts",Color:10},{Pattern:"bts",Color:0},{Pattern:"ls",Color:10},{Pattern:"br",Color:10},{Pattern:"ts",Color:0},{Pattern:"bo",Color:10}]}

# ROUND 3 BANNER COLOURS
execute if entity @e[scores={HangmanRound=3,HangmanSetup=70}] run fill 996 66 -11 1004 66 -11 white_wall_banner[facing=south]{Patterns:[{Pattern:"hhb",Color:15},{Pattern:"rs",Color:15},{Pattern:"bts",Color:0},{Pattern:"bts",Color:0},{Pattern:"bts",Color:0},{Pattern:"bts",Color:15},{Pattern:"ls",Color:0},{Pattern:"br",Color:0},{Pattern:"ts",Color:15},{Pattern:"bo",Color:0}]}

# ROUND 4 BANNER COLOURS
execute if entity @e[scores={HangmanRound=4,HangmanSetup=70}] run fill 996 66 -11 1004 66 -11 light_blue_wall_banner[facing=south]{Patterns:[{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:3},{Pattern:"bts",Color:3},{Pattern:"bts",Color:3},{Pattern:"bts",Color:0},{Pattern:"ls",Color:3},{Pattern:"br",Color:3},{Pattern:"ts",Color:0},{Pattern:"bo",Color:3}]}

# ROUND 5 BANNER COLOURS
execute if entity @e[scores={HangmanRound=5,HangmanSetup=70}] run fill 996 66 -11 1004 66 -11 orange_wall_banner[facing=south]{Patterns:[{Pattern:"hhb",Color:0},{Pattern:"rs",Color:0},{Pattern:"bts",Color:1},{Pattern:"bts",Color:1},{Pattern:"bts",Color:1},{Pattern:"bts",Color:0},{Pattern:"ls",Color:1},{Pattern:"br",Color:1},{Pattern:"ts",Color:0},{Pattern:"bo",Color:1}]}


execute if entity @e[scores={HangmanSetup=90}] run setblock 998 63 -6 oak_leaves[persistent=true]
execute if entity @e[scores={HangmanSetup=90}] run playsound block.end_portal_frame.fill master @a 1002 63 -6 1 1.1 0
execute if entity @e[scores={HangmanSetup=90}] run particle happy_villager 998 63 -6 0.3 1 0.3 0 50 force @a

scoreboard players set @e[scores={HangmanRound=2..5,HangmanSetup=90}] HangmanSetup 100

execute if entity @e[scores={HangmanSetup=100}] run setblock 1002 63 -6 lime_shulker_box[facing=down]
execute if entity @e[scores={HangmanSetup=100}] run playsound block.end_portal_frame.fill master @a 1002 63 -6 1 0.95 0
execute if entity @e[scores={HangmanSetup=100}] run particle end_rod 1002 63 -6 0.3 1 0.3 0 50 force @a

execute if entity @e[scores={HangmanSetup=110}] run fill 996 66 -11 1004 66 -11 air
execute if entity @e[scores={HangmanSetup=110}] run playsound entity.ender_dragon.flap master @a 1000 64 -11 1 1 0


# PARROT SHOWS
execute if entity @e[scores={HangmanSetup=129}] run particle portal 996 67.5 -11 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HangmanSetup=130}] run playsound entity.enderman.teleport master @a 996 67.5 -11 0.5 1 0
execute if entity @e[scores={HangmanRound=1,HangmanSetup=130}] run summon parrot 996 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,Variant:2,Tags:["HangmanMob","HangmanParrot"]}
execute if entity @e[scores={HangmanRound=2,HangmanSetup=130}] run summon parrot 996 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,Variant:1,Tags:["HangmanMob","HangmanParrot"]}
execute if entity @e[scores={HangmanRound=3,HangmanSetup=130}] run summon parrot 996 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,Variant:4,Tags:["HangmanMob","HangmanParrot"]}
execute if entity @e[scores={HangmanRound=4,HangmanSetup=130}] run summon parrot 996 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,Variant:3,Tags:["HangmanMob","HangmanParrot"]}
execute if entity @e[scores={HangmanRound=5,HangmanSetup=130}] run summon parrot 996 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,Variant:0,Tags:["HangmanMob","HangmanParrot"]}

scoreboard players set @e[scores={HangmanRound=2..5,HangmanSetup=130}] HangmanSetup 140

execute if entity @e[scores={HangmanSetup=149}] run playsound entity.enderman.teleport master @a 1004.9 67.5 -11 0.5 1 0
execute if entity @e[scores={HangmanSetup=150}] run particle portal 1004 67.5 -11 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HangmanSetup=150}] run summon cat 1004.9 67.5 -10.2 {NoAI:true,Invulnerable:true,Sitting:true,CatType:1,Rotation:[90f,0f],Tags:["HangmanMob","HangmanCat"]}

scoreboard players set @e[scores={HangmanRound=2..5,HangmanSetup=150}] HangmanSetup 160

# RANDOMIZE SIGN HINT
execute if entity @e[scores={HangmanSetup=189}] run setblock 1000 64 -6 air
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanGlowstoneAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"BLOCK\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanEndermiteAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"ENEMY\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanGunpowderAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"DROP\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanSwamplandAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"PLACE\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanChainmailAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"PROTECTION\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanFramerateAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"F3\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanSuperflatAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"WORLD\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanShipwreckAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"AQUATIC\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanInventoryAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"ITEMS\"}",Text4: "{\"text\":\"    \"}"}
execute if entity @e[scores={HangmanSetup=190}] if entity @e[tag=HangmanExplosionAEC] run setblock 1000 64 -6 oak_sign[rotation=0]{Text1: "{\"text\":\"Hint\"}",Text2: "{\"text\":\"---------------\"}",Text3: "{\"bold\":true,\"text\":\"DESTROY\"}",Text4: "{\"text\":\"    \"}"}


execute if entity @e[scores={HangmanSetup=190}] run playsound entity.ender_eye.death master @a 1000 64 -6 1 1 0


# SHULKER ALPHABET CONTENTS
execute as @e[scores={HangmanSetup=101}] run data merge block 1002 63 -6 {CustomName: "{\"text\":\"Alphabox\"}", Items: [{Slot: 0b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "vhr", Color: 15}, {Pattern: "sc", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"A\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 1b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "vhr", Color: 15}, {Pattern: "cs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "cbo", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "bo", Color: 0}], Base: 15}, display: {Name: "{\"text\":\"B\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 2b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "ms", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "bo", Color: 0}], Base: 15}, display: {Name: "{\"text\":\"C\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 3b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"D\",\"italic\":\"false\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 4b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "cs", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "rs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"E\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 5b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "cs", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "rs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"F\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 6b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "rs", Color: 15}, {Pattern: "hh", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "vh", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"G\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 7b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "vhr", Color: 15}, {Pattern: "sc", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"H\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 8b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "cs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"I\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 9b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ls", Color: 15}, {Pattern: "hh", Color: 0}, {Pattern: "sc", Color: 0}, {Pattern: "vhr", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"J\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 10b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "drs", Color: 15}, {Pattern: "cr", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"K\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 11b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ls", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"L\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 12b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "tt", Color: 15}, {Pattern: "tts", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"M\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 13b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "drs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"N\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 14b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"O\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 15b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "hhb", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"P\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 16b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "cr", Color: 15}, {Pattern: "vh", Color: 0}, {Pattern: "hh", Color: 0}, {Pattern: "ms", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"Q\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 17b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "rs", Color: 15}, {Pattern: "hhb", Color: 0}, {Pattern: "drs", Color: 15}, {Pattern: "ld", Color: 0}, {Pattern: "ld", Color: 0}, {Pattern: "ld", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"R\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 18b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "tt", Color: 15}, {Pattern: "bt", Color: 15}, {Pattern: "tr", Color: 15}, {Pattern: "bl", Color: 15}, {Pattern: "mr", Color: 0}, {Pattern: "drs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"S\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 19b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "cs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"T\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 20b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"U\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 21b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "ls", Color: 15}, {Pattern: "bt", Color: 0}, {Pattern: "dls", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"V\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 22b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "bt", Color: 15}, {Pattern: "bts", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"W\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 23b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "tl", Color: 15}, {Pattern: "tr", Color: 15}, {Pattern: "bl", Color: 15}, {Pattern: "br", Color: 15}, {Pattern: "cs", Color: 0}, {Pattern: "cr", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"X\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 24b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "vh", Color: 15}, {Pattern: "vhr", Color: 15}, {Pattern: "sc", Color: 0}, {Pattern: "hhb", Color: 0}, {Pattern: "rs", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"Y\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}},{Slot: 25b, id: "minecraft:white_banner", Count: 1b, tag: {HideFlags: 32, BlockEntityTag: {Patterns: [{Pattern: "dls", Color: 15}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}, display: {Name: "{\"text\":\"Z\",\"italic\":\"false\",\"bold\":\"true\",\"color\":\"white\"}"}, CanPlaceOn: ["minecraft:oak_leaves"]}}]}


# SHULKER BOX HINT FOR THE OBLIVIOUS
execute if entity @e[scores={HangmanRound=1,HangmanSetup=101}] run scoreboard objectives add HangmanHint dummy
execute if entity @e[scores={HangmanRound=1,HangmanSetup=101}] run setblock 40 5 14 clay
execute if entity @e[scores={HangmanRound=1,HangmanSetup=102}] run clone 1002 63 -6 1002 63 -6 40 5 14
scoreboard players set @e[scores={HangmanRound=1}] HangmanHint 0
execute if blocks 40 5 14 40 5 14 1002 63 -6 all run scoreboard players set @e[scores={HangmanRound=1}] HangmanHint 1

execute if entity @e[scores={HangmanHint=1,HangmanSetup=500}] run playsound block.end_portal_frame.fill master @a 1002 63 -6 1 0.95 0
execute if entity @e[scores={HangmanHint=1,HangmanSetup=500}] run particle end_rod 1002 63 -6 0.3 1 0.3 0 50 force @a

execute if entity @e[scores={HangmanHint=1,HangmanSetup=700}] run playsound block.end_portal_frame.fill master @a 1002 63 -6 1 0.95 0
execute if entity @e[scores={HangmanHint=1,HangmanSetup=700}] run particle end_rod 1002 63 -6 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={HangmanHint=1,HangmanSetup=700}] run summon area_effect_cloud 1002 63.4 -6 {CustomName:"{\"text\":\"↓\",\"bold\":\"false\"}",CustomNameVisible:true,Tags:["HangmanHintAEC"],Duration:2147483647}

execute if entity @e[scores={HangmanRound=1,HangmanHint=0,HangmanSetup=400..}] run kill @e[tag=HangmanHintAEC]
execute if entity @e[scores={HangmanHint=0,HangmanSetup=102..}] run scoreboard objectives remove HangmanHint


# TESTS FOR EACH LETTER
scoreboard objectives add SelectedLetter dummy
######execute if block 998 64 -6 air run scoreboard players add @e[tag=MainPuzzleAEC] SelectedLetter 0

execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"A\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 1
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"B\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 2
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 3
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"D\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 4
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 5
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"F\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 6
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"G\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 7
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 8
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 9
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"J\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 10
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 11
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"L\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 12
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"M\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 13
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"N\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 14
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"O\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 15
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 16
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"Q\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 17
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 18
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 19
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"T\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 20
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"U\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 21
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"V\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 22
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 23
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"X\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 24
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"Y\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 25
execute if block 998 64 -6 white_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"Z\"}"} run scoreboard players set @e[tag=MainPuzzleAEC] SelectedLetter 26


# RUNS TIMING ON SELECTED LETTER SELECTED
execute if entity @e[scores={HangmanSetup=100}] run scoreboard objectives add LetterTimer dummy
scoreboard players add @e[tag=MainPuzzleAEC] LetterTimer 0
execute if block 998 64 -6 white_banner run scoreboard players set @e[scores={LetterTimer=0}] LetterTimer 1
scoreboard players set @e[scores={LetterTimer=100..}] LetterTimer 0
scoreboard players set @e[scores={LetterTimer=0}] SelectedLetter 0

execute if entity @e[scores={LetterTimer=0}] as @e[tag=BannerBlocker] run kill @s
execute unless entity @e[scores={HangmanSetup=..-1}] unless entity @e[scores={DeathSFX=0..}] if entity @e[scores={LetterTimer=0}] run setblock 998 63 -6 oak_leaves[persistent=true]
scoreboard players add @e[scores={LetterTimer=1..}] LetterTimer 1
execute if entity @e[scores={LetterTimer=2}] run setblock 998 63 -6 birch_leaves[persistent=true]
##execute if entity @e[scores={LetterTimer=2}] run summon armor_stand 998.8 64 -5.2 {Tags:["BannerBlocker"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={LetterTimer=2}] run summon armor_stand 998.1 64 -5.2 {Tags:["BannerBlocker"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={LetterTimer=2}] run summon armor_stand 998.8 64 -5.9 {Tags:["BannerBlocker"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={LetterTimer=2}] run summon armor_stand 998.1 64 -5.9 {Tags:["BannerBlocker"],Invisible:true,DisabledSlots:2039583}
execute if entity @e[scores={LetterTimer=2}] run playsound block.chorus_flower.grow master @a 998 65 -6 1 0.7 0
execute if entity @e[scores={LetterTimer=14}] run particle enchant 998 65.8 -6 0.1 0.1 0.1 1 60 force @a
execute if entity @e[scores={LetterTimer=54..}] run setblock 998 64 -6 air


# TESTING PURPOSES ONLY
##execute as @e[tag=BannerBlocker] run data merge entity @s {Invisible:false}
##execute as @e[tag=BannerBlocker2] run data merge entity @s {Invisible:false}


# IF WRONG GUESS
scoreboard objectives add CorrectLetter dummy
scoreboard players set @e[scores={LetterTimer=..10}] CorrectLetter 0


# CAT ANIMATIONS TO KILL BIRD
execute if entity @e[scores={CorrectLetter=0,LetterTimer=60}] run setblock 998 63 -6 birch_leaves[persistent=true]
execute if entity @e[scores={CorrectLetter=0,LetterTimer=60}] run summon armor_stand 998 63 -5.2 {NoGravity:true,Invisible:true,ArmorItems:[{},{},{},{id:"minecraft:barrier",Count:1b}],Tags:["BannerBlocker"],DisabledSlots:2039583}

execute if entity @e[scores={CorrectLetter=0,LetterTimer=65}] if entity @e[tag=HangmanCat,x=1000,y=67,z=-11,dx=5,dy=1,dz=0] run playsound entity.witch.ambient master @a 998 64 -6 0.5 1 0
execute if entity @e[scores={CorrectLetter=0,LetterTimer=70}] run data merge entity @e[tag=HangmanCat,limit=1] {Sitting:false}
execute if entity @e[scores={CorrectLetter=0,LetterTimer=70..89}] as @e[tag=HangmanCat,x=998,y=67,z=-11,dx=6,dy=1,dz=0] at @s run teleport @s ~-0.05 ~ ~
execute if entity @e[scores={CorrectLetter=0,LetterTimer=93}] run data merge entity @e[tag=HangmanCat,limit=1] {Sitting:true}

execute at @e[tag=HangmanCat,x=997,y=67,z=-11,dx=2,dy=1,dz=0] run data merge entity @e[tag=HangmanParrot,limit=1] {Sitting:false}

execute if entity @e[scores={CorrectLetter=0,LetterTimer=65}] as @e[tag=HangmanCat,x=998,y=67,z=-11,dx=0,dy=1,dz=0] at @s run teleport @s ~-1.5 ~ ~
execute if entity @e[scores={CorrectLetter=0,LetterTimer=98}] as @e[tag=HangmanCat,x=998,y=67,z=-11,dx=0,dy=1,dz=0] run playsound entity.cat.purreow master @a 997 67 -11 1 1 0
execute at @e[tag=HangmanCat,x=996,y=67,z=-11,dx=2,dy=1,dz=0] run data merge entity @e[tag=HangmanCat,limit=1] {Sitting:false}

execute at @e[tag=HangmanCat,x=997,y=67,z=-11,dx=0,dy=1,dz=0] run scoreboard objectives add DeathSFX dummy
execute at @e[tag=HangmanCat,x=997,y=67,z=-11,dx=0,dy=1,dz=0] run scoreboard players add @e[tag=MainPuzzleAEC] DeathSFX 0
scoreboard players set @e[scores={DeathSFX=0}] DeathSFX 1
scoreboard players add @e[scores={DeathSFX=1..}] DeathSFX 1

execute if entity @e[scores={DeathSFX=2}] run setblock 1000 64 -13 bone_block

execute if entity @e[scores={DeathSFX=2}] run setblock 998 63 -6 birch_leaves[persistent=true]
##execute if entity @e[scores={DeathSFX=2}] run summon armor_stand 998.8 64 -5.2 {Tags:["BannerBlocker2"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={DeathSFX=2}] run summon armor_stand 998.1 64 -5.2 {Tags:["BannerBlocker2"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={DeathSFX=2}] run summon armor_stand 998.8 64 -5.9 {Tags:["BannerBlocker2"],Invisible:true,DisabledSlots:2039583}
##execute if entity @e[scores={DeathSFX=2}] run summon armor_stand 998.1 64 -5.9 {Tags:["BannerBlocker2"],Invisible:true,DisabledSlots:2039583}

execute if entity @e[scores={DeathSFX=2}] run playsound entity.cat.death master @a 997 67 -11 1 1 0
execute if entity @e[scores={DeathSFX=5}] run playsound entity.parrot.death master @a 997 67 -11 1 1 0
execute if entity @e[scores={DeathSFX=6}] run kill @e[tag=HangmanParrot]

execute if entity @e[scores={DeathSFX=40..}] run data merge entity @e[tag=HangmanCat,limit=1] {Sitting:true,Rotation:[340f,30f]}
execute if entity @e[scores={DeathSFX=35}] run playsound entity.cat.purr master @a 997 67 -11 1 1 0

execute if entity @e[scores={DeathSFX=90}] at @e[tag=HangmanCat] run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={DeathSFX=90}] run playsound entity.enderman.teleport master @a 996 67 -11 0.5 1 0.5
execute if entity @e[scores={DeathSFX=90}] run teleport @e[tag=HangmanCat] 986 3 -10

execute if entity @e[scores={DeathSFX=110}] run playsound block.ender_chest.open master @a 1000 64 -9 1 0.8 1
execute if entity @e[scores={DeathSFX=110}] run fill 996 62 -9 1004 62 -9 iron_block
execute if entity @e[scores={DeathSFX=110}] run setblock 998 63 -6 oak_leaves[persistent=true]
execute if entity @e[scores={DeathSFX=110}] run kill @e[tag=BannerBlocker]
##execute if entity @e[scores={DeathSFX=110}] run kill @e[tag=BannerBlocker2]
execute if entity @e[scores={DeathSFX=110}] run clear @a white_banner

execute if entity @e[scores={DeathSFX=110}] run kill @e[nbt={Item:{id:"minecraft:white_banner"}}]
execute if entity @e[scores={DeathSFX=110}] run fill 996 66 -11 1004 66 -11 air
execute if entity @e[scores={DeathSFX=110}] run setblock 998 63 -6 green_terracotta
execute if entity @e[scores={DeathSFX=110}] run setblock 1002 63 -6 green_terracotta
execute if entity @e[scores={DeathSFX=110}] run setblock 1000 64 -6 air

execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove HangmanSetup
execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove HangmanRound
execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove LetterTimer
execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove CorrectLetter
execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove SelectedLetter
execute if entity @e[scores={DeathSFX=110}] run kill @e[tag=HangmanMob]
execute if entity @e[scores={DeathSFX=110}] run setblock 994 65 -13 chain_command_block[facing=east]{auto:1b,TrackOutput:false}
execute if entity @e[scores={DeathSFX=110}] run setblock 40 2 14 clay
execute if entity @e[scores={DeathSFX=110}] run scoreboard objectives remove DeathSFX


# WORDS
execute if entity @e[tag=HangmanGlowstoneAEC] run function d3:puzzle/hangman_word_1
execute if entity @e[tag=HangmanEndermiteAEC] run function d3:puzzle/hangman_word_2
execute if entity @e[tag=HangmanGunpowderAEC] run function d3:puzzle/hangman_word_3
execute if entity @e[tag=HangmanSwamplandAEC] run function d3:puzzle/hangman_word_4
execute if entity @e[tag=HangmanChainmailAEC] run function d3:puzzle/hangman_word_5
execute if entity @e[tag=HangmanFramerateAEC] run function d3:puzzle/hangman_word_6
execute if entity @e[tag=HangmanSuperflatAEC] run function d3:puzzle/hangman_word_7
execute if entity @e[tag=HangmanShipwreckAEC] run function d3:puzzle/hangman_word_8
execute if entity @e[tag=HangmanInventoryAEC] run function d3:puzzle/hangman_word_9
execute if entity @e[tag=HangmanExplosionAEC] run function d3:puzzle/hangman_word_10



# COMPLETE ROUND
execute if entity @e[scores={HangmanSetup=-999}] run setblock 998 63 -6 birch_leaves[persistent=true]
execute if entity @e[scores={HangmanSetup=-999}] at @e[tag=RandomHangmanAEC] run setblock ~ ~ ~ clay
scoreboard players set @e[scores={HangmanSetup=-800}] HangmanSetup 1000


# WOLF ARRIVES
#effect give @e[tag=HangmanSheep] invisibility 1000000 255 true
execute if entity @e[scores={HangmanSetup=-999}] run kill @e[tag=HangmanSheep]
execute if entity @e[scores={HangmanSetup=-999}] run kill @e[tag=HangmanWolf]

execute if entity @e[scores={HangmanSetup=-999}] run summon turtle 997.3 58.0 -10.2 {NoAI:true,Invulnerable:0b,Rotation:[270f,0f],Tags:["HangmanMob","HangmanSheep"],Silent:1b,Age:-999999}

execute if entity @e[scores={HangmanSetup=-990}] run particle portal 997 67.5 -11 0.2 0.2 0.2 0.5 40 force @a
execute if entity @e[scores={HangmanSetup=-990}] run playsound entity.enderman.teleport master @a 997 67.5 -11 0.5 1 0
execute if entity @e[scores={HangmanSetup=-990}] run summon wolf 997.3 67.5 -10.2 {NoAI:false,Invulnerable:true,Rotation:[270f,0f],Tags:["HangmanMob","HangmanWolf"]}
execute if entity @e[scores={HangmanSetup=-990}] run playsound entity.wolf.ambient master @a 997 67.5 -10.2 0.5 1 0
execute if entity @e[scores={HangmanSetup=-991..0}] run data merge entity @e[tag=HangmanParrot,limit=1] {Sitting:true}
execute if entity @e[scores={HangmanSetup=-981}] run teleport @e[tag=HangmanSheep] 997.0 68.0 -10.2 90 0
teleport @e[tag=HangmanWolf,nbt=!{NoAI:true}] 997.3 67.5 -10.2
data merge entity @e[tag=HangmanWolf,limit=1] {Rotation:[270f,0f]}
data merge entity @e[tag=HangmanWolf,nbt={Angry:1b},limit=1] {NoAI:true,Silent:true}

execute if entity @e[tag=HangmanWolf,nbt={Angry:1b}] run scoreboard objectives add HangmanWin dummy
execute if entity @e[tag=HangmanWolf,nbt=!{NoAI:true}] run scoreboard players set @e[tag=MainPuzzleAEC] HangmanWin 0
scoreboard players add @e[tag=MainPuzzleAEC] HangmanWin 1

execute if entity @e[scores={HangmanWin=2}] run playsound entity.wolf.growl master @a 997 67.5 -10.2 0.5 1 0

execute if entity @e[scores={HangmanWin=8}] run data merge entity @e[tag=HangmanCat,limit=1] {Sitting:false}
execute if entity @e[scores={HangmanWin=11}] at @e[tag=HangmanCat] run playsound entity.cat.hiss master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={HangmanWin=13..26}] as @e[tag=HangmanCat] at @s run teleport @s ~0.05 ~ ~ 90 0
execute if entity @e[scores={HangmanWin=31}] at @e[tag=HangmanCat] run particle portal ~ ~0.3 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HangmanWin=31}] at @e[tag=HangmanCat] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={HangmanWin=31}] run teleport @e[tag=HangmanCat] 986 3 -10
execute if entity @e[scores={HangmanWin=32}] run kill @e[tag=HangmanCat]

execute if entity @e[scores={HangmanWin=41}] run data merge entity @e[tag=HangmanWolf,limit=1] {Angry:false,Sitting:true}
execute if entity @e[scores={HangmanWin=41}] run teleport @e[tag=HangmanSheep] 986 3 -10
execute if entity @e[scores={HangmanWin=42}] run kill @e[tag=HangmanSheep]

execute if entity @e[scores={HangmanWin=66}] at @e[tag=HangmanWolf] run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HangmanWin=66}] at @e[tag=HangmanWolf] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={HangmanWin=66}] at @e[tag=HangmanWolf] run teleport @e[tag=HangmanWolf] 986 3 -10
execute if entity @e[scores={HangmanWin=67}] run gamerule showDeathMessages false
execute if entity @e[scores={HangmanWin=67}] run kill @e[tag=HangmanWolf]
execute if entity @e[scores={HangmanWin=67}] run gamerule showDeathMessages true

execute if entity @e[scores={HangmanWin=80}] at @e[tag=HangmanParrot] run playsound entity.parrot.imitate.wolf master @a ~ ~ ~ 1 1.2 0
execute if entity @e[scores={HangmanWin=86}] at @e[tag=HangmanParrot] run playsound entity.parrot.imitate.wolf master @a ~ ~ ~ 1 1 0

execute if entity @e[scores={HangmanWin=96}] at @e[tag=HangmanParrot] run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HangmanWin=96}] at @e[tag=HangmanParrot] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={HangmanWin=96}] at @e[tag=HangmanParrot] run teleport @e[tag=HangmanParrot] 986 3 -10
execute if entity @e[scores={HangmanWin=97}] run kill @e[tag=HangmanParrot]


# FOR THE WIN
execute if entity @e[scores={HangmanWin=107}] run setblock 998 63 -6 green_terracotta
execute if entity @e[scores={HangmanWin=107}] run setblock 1002 63 -6 green_terracotta
execute if entity @e[scores={HangmanWin=107}] run setblock 1000 64 -6 air
execute if entity @e[scores={HangmanWin=107}] run fill 996 65 -11 1004 66 -11 air

execute if entity @e[scores={HangmanWin=107}] run clear @a white_banner
execute if entity @e[scores={HangmanWin=107}] run kill @e[nbt={Item:{id:"minecraft:white_banner"}}]
##execute if entity @e[scores={HangmanWin=107}] run kill @e[tag=BannerBlocker2]
##execute if entity @e[scores={HangmanWin=107}] run setblock 998 63 -6 oak_leaves[persistent=true]

execute if entity @e[scores={HangmanWin=107}] run playsound block.note_block.pling master @a 1000 64 -9 0.7 0.8 0
execute if entity @e[scores={HangmanWin=107,HangmanRound=1}] run setblock 996 62 -9 redstone_block
execute if entity @e[scores={HangmanWin=107,HangmanRound=2}] run setblock 998 62 -9 redstone_block
execute if entity @e[scores={HangmanWin=107,HangmanRound=3}] run setblock 1000 62 -9 redstone_block
execute if entity @e[scores={HangmanWin=107,HangmanRound=4}] run setblock 1002 62 -9 redstone_block
execute if entity @e[scores={HangmanWin=107,HangmanRound=5}] run setblock 1004 62 -9 redstone_block

execute if entity @e[scores={HangmanWin=107,HangmanRound=1..4}] run setblock 994 65 -13 clay
execute if entity @e[scores={HangmanWin=107,HangmanRound=1..4}] run setblock 994 65 -13 chain_command_block[facing=east]{auto:1b,TrackOutput:false}

execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run setblock 40 2 14 clay
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove HangmanSetup
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove HangmanHint
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove SelectedLetter
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove LetterTimer
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove CorrectLetter
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..4}] run scoreboard objectives remove DeathSFX

scoreboard players add @e[scores={HangmanWin=107}] HangmanRound 1
execute if entity @e[scores={HangmanWin=107..,HangmanRound=1..5}] run scoreboard objectives remove HangmanWin

execute if entity @e[scores={HangmanWin=159}] if block 1000 64 -13 air run advancement grant @a only d3:folder_b/dog_person

# DOORS OPEN
execute if entity @e[scores={HangmanWin=159}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={HangmanWin=162}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={HangmanWin=177}] run fill 993 64 -8 1007 65 1 clay replace redstone_block


# SWITCH TO END KEY
execute if entity @e[scores={HangmanWin=177}] run setblock 994 65 -13 clay
execute if entity @e[scores={HangmanWin=177}] run setblock 994 65 -13 chain_command_block[facing=up]{auto:1b,TrackOutput:false}


# END
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove HangmanSetup
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove HangmanHint
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove SelectedLetter
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove LetterTimer
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove CorrectLetter
execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove DeathSFX
execute if entity @e[scores={HangmanWin=177}] run setblock 40 2 14 clay

execute if entity @e[scores={HangmanWin=150}] run kill @e[tag=BannerShulker]
execute if entity @e[scores={HangmanWin=176}] run summon shulker 1000 66 5 {NoAI:true,Color:16b,Silent:true,Tags:["BannerShulker"],Invulnerable:true,Rotation:[0f,0f],UUIDLeast:-8743152485644460451L,UUIDMost:-8869172746962386557L}

execute if entity @e[scores={HangmanWin=177}] run scoreboard objectives remove HangmanWin