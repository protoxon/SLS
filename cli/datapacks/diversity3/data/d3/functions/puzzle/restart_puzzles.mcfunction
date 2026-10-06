####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 24 2017 / SEPTEMBER 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FINAL PUZZLE
kill @e[tag=DoorFrame]
kill @e[tag=ChestCart]
kill @e[tag=FinalRoomBlock]


# SECRET ORANGE ROOM
execute unless block 33 2 14 clay run setblock 33 2 14 clay

kill @e[tag=RubiksCube]
summon armor_stand 997.4 46.27 19 {Small:false,HandItems:[{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ca88bec6-5efc-4917-bdbc-7ead2834b614",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzk0ZTI1NGYyMjdlYzk0YWRkZjM5NGVmNWMxNWNkNTBmYjJlYjUyZmUyMWYwOTA5ODI5NjZjY2QwODcxMCJ9fX0="}]}}}}],Tags:["RubiksCube"],NoGravity:true,Rotation:[45f,0f],Pose:{RightArm:[45f,0f,315f]},DisabledSlots:2039583,Invisible:true}

kill @e[tag=PuzzleBook]
summon armor_stand 997.4 46.21 17.4 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"extra\":[{\"bold\":true,\"text\":\"TO DO:\"},{\"strikethrough\":true,\"text\":\"\\n\\nSimon Says\\n\"},{\"strikethrough\":true,\"text\":\"Matching puzzle\\n\"},{\"strikethrough\":true,\"text\":\"Memory puzzle\\n\"},{\"strikethrough\":true,\"text\":\"Sound puzzle\\n\"},{\"strikethrough\":true,\"text\":\"Some sort of moving block thing\\n\"},{\"strikethrough\":true,\"text\":\"Item order puzzle\\n\"},{\"strikethrough\":true,\"text\":\"Hangman with a cat\\n\"},{\"strikethrough\":true,\"text\":\"Controlling villager\\n\"},{\"strikethrough\":true,\"text\":\"Something with shulker bullets?\\n\"},{\"text\":\"\\nAny other ideas?\"}],\"text\":\"\"}","{\"extra\":[{\"bold\":true,\"text\":\"NOTE:\"},{\"text\":\"\\n\\nI highly doubt they will even finish the puzzles without cheating...\\n\\nShould I continue anyway?\"}],\"text\":\"\"}","{\"extra\":[{\"bold\":true,\"text\":\"Note...\"},{\"text\":\"\\n\\nQ, what are you thinking?! Don't just leave this book in your secret Orange room!\\nThey have to come here to get one of the Puzzle Keys.\\n\\nI'll have to remember to take it with me.\"}],\"text\":\"\"}","{\"extra\":[{\"bold\":false,\"text\":\"\"},{\"text\":\"Meh. They probably won't even realize how to use the Puzzle Keys anyway. And I won't tell them.\\n\\nIt's not like they can even restart the puzzles if they wanted to... unless they quit the Branch.\"}],\"text\":\"\"}","{\"extra\":[{\"bold\":false,\"text\":\"\"},{\"text\":\"Seriously, though. Why is this room orange? Isn't the Puzzle Branch supposed to focus on red?\\n\\nWell yeah but this is the orange puzzle section so...\\n\\nI have to stop overthinking everything.\"}],\"text\":\"\"}",],author:"qmagnet",title:"Puzzle ideas..."}}],Rotation:[90f,0f],Pose:{RightArm:[180f,270f,180f]},Tags:["PuzzleBook"],Invulnerable:true,DisabledSlots:1973790}

execute unless entity @e[tag=FishTank] run summon armor_stand 997.75 45.4 15.9 {ArmorItems:[{},{},{},{id:"minecraft:tropical_fish",Count:1b}],Tags:["FishTank"],NoGravity:true,Rotation:[90f,0f],Pose:{Head:[0f,180f,325f]},DisabledSlots:2039583,Invisible:true}

execute unless entity @e[tag=PuzzlePainting1] run summon painting 1003 47 15 {Facing:1b,Invulnerable:true,Rotation:[90f,0f],Motive:"minecraft:stage",Tags:["PuzzlePainting1"]}
execute unless entity @e[tag=PuzzlePainting2] run summon painting 1007 47 15 {Facing:1b,Invulnerable:true,Rotation:[90f,0f],Motive:"minecraft:wither",Tags:["PuzzlePainting2"]}

fill 997 45 13 1003 45 19 iron_block replace magma_block
setblock 997 46 13 acacia_button[face=floor]

#setblock 1000 42 22 clay -> troll stand
#kill @e[tag=SecretOrangeBlock]



# SIMON SAYS ROOM
execute unless block 1000 63 22 pumpkin run setblock 1000 63 22 pumpkin
fill 994 65 16 1006 67 28 red_concrete replace orange_concrete

execute unless block 999 65 29 light_blue_concrete run setblock 999 65 29 light_blue_concrete
execute unless block 1000 65 29 lime_concrete run setblock 1000 65 29 lime_concrete
execute unless block 1001 65 29 black_concrete run setblock 1001 65 29 black_concrete
execute unless block 999 66 29 green_concrete run setblock 999 66 29 green_concrete
execute unless block 1000 66 29 white_concrete run setblock 1000 66 29 white_concrete
execute unless block 1001 66 29 brown_concrete run setblock 1001 66 29 brown_concrete
execute unless block 999 67 29 purple_concrete run setblock 999 67 29 purple_concrete
execute unless block 1000 67 29 orange_concrete run setblock 1000 67 29 orange_concrete
execute unless block 1001 67 29 yellow_concrete run setblock 1001 67 29 yellow_concrete
fill 999 65 28 1001 67 28 stone_button[facing=north] replace air
fill 999 65 30 1001 67 30 clay
fill 999 65 30 1001 67 30 command_block[facing=south]{Command:"setblock 46 2 14 redstone_block",auto:0b,TrackOutput:false}

kill @e[tag=SimonCloud]
kill @e[tag=SimonBlock]


# MATCH FLOOR ROOM
setblock 986 65 29 clay
setblock 986 65 29 command_block[facing=west]{auto:0b,TrackOutput:false}

fill 982 62 18 985 62 21 purpur_block
fill 982 62 23 985 62 26 purpur_block
fill 987 62 18 990 62 21 purpur_block
fill 987 62 23 990 62 26 purpur_block

fill 982 63 18 985 63 21 black_terracotta
fill 982 63 23 985 63 26 black_terracotta
fill 987 63 18 990 63 21 black_terracotta
fill 987 63 23 990 63 26 black_terracotta

fill 982 68 18 990 68 26 air



# MEMORY ROOM
setblock 1021 65 15 clay
setblock 1021 65 15 chain_command_block[facing=south]{auto:0b,TrackOutput:false}

fill 1020 65 18 1020 67 22 yellow_concrete
fill 1019 65 18 1019 67 22 air replace stone_button
fill 1010 65 28 1014 67 28 yellow_concrete
fill 1010 65 27 1014 67 27 air replace stone_button

fill 1017 63 18 1017 63 25 black_concrete
fill 1010 63 25 1017 63 25 black_concrete

execute unless block 1021 64 26 redstone_block run setblock 1021 64 26 redstone_block
execute unless block 1018 64 29 redstone_block run setblock 1018 64 29 redstone_block

kill @e[tag=MemoryAEC]
teleport @e[tag=MemoryMob] 1019 65 27



# SOUND PUZZLE ROOM
setblock 1021 65 8 clay
setblock 1021 65 8 command_block[facing=south]{auto:0b,TrackOutput:false}

fill 1010 63 4 1018 63 12 iron_block replace hopper
fill 1010 63 4 1018 63 12 iron_block replace red_sandstone
fill 1010 63 4 1018 63 12 iron_block replace coal_block

setblock 1021 64 8 air

execute unless block 1010 63 12 black_terracotta run setblock 1010 63 12 black_terracotta
execute unless block 1010 63 4 black_terracotta run setblock 1010 63 4 black_terracotta
execute unless block 1018 63 4 black_terracotta run setblock 1018 63 4 black_terracotta
execute unless block 1018 63 12 black_terracotta run setblock 1018 63 12 black_terracotta

execute unless block 1014 61 8 redstone_block run setblock 1014 61 8 redstone_block

kill @e[tag=SoundAEC]



# PISTON PUZZLE ROOM
setblock 979 65 8 clay
setblock 979 65 8 command_block[facing=north]{auto:0b,TrackOutput:false}

fill 983 61 5 989 61 11 clay replace redstone_block
fill 983 61 5 989 61 11 clay replace stone
execute unless block 985 61 11 redstone_block run setblock 985 61 11 redstone_block
execute unless block 985 61 5 redstone_block run setblock 985 61 5 redstone_block
execute unless block 989 61 7 redstone_block run setblock 989 61 7 redstone_block
execute unless block 983 61 7 redstone_block run setblock 983 61 7 redstone_block
execute unless block 985 61 7 redstone_block run setblock 985 61 7 redstone_block

kill @e[type=end_crystal]



# PATHFINDER ROOM
setblock 1014 65 -13 clay
setblock 1014 65 -13 command_block[facing=west]{auto:0b,TrackOutput:false}

fill 1021 66 -10 1021 66 -2 clay replace redstone_block

fill 1010 57 -10 1018 57 -2 gray_stained_glass
fill 1011 57 -9 1013 57 -7 air
fill 1015 57 -9 1017 57 -7 air
fill 1011 57 -5 1013 57 -3 air
fill 1015 57 -5 1017 57 -3 air
setblock 1010 57 -10 black_stained_glass
setblock 1014 57 -10 black_stained_glass
setblock 1018 57 -10 black_stained_glass
setblock 1010 57 -6 black_stained_glass
setblock 1014 57 -6 black_stained_glass
setblock 1018 57 -6 black_stained_glass
setblock 1010 57 -2 black_stained_glass
setblock 1014 57 -2 black_stained_glass
setblock 1018 57 -2 black_stained_glass

kill @e[tag=PathMob]
kill @e[tag=PathArmorStand]
kill @e[tag=PathAEC]
kill @e[tag=TPVillager]



# BANNER BULLET ROOM
setblock 1000 60 5 clay
setblock 1000 60 5 command_block[facing=down]{auto:0b,TrackOutput:false}

setblock 1000 61 5 clay

execute unless block 993 66 5 stone run setblock 993 66 5 stone
execute unless block 993 66 8 stone run setblock 993 66 8 stone
execute unless block 993 66 11 stone run setblock 993 66 11 stone
execute unless block 997 66 15 stone run setblock 997 66 15 stone
execute unless block 1000 66 15 stone run setblock 1000 66 15 stone
execute unless block 1003 66 15 stone run setblock 1003 66 15 stone
execute unless block 1007 66 11 stone run setblock 1007 66 11 stone
execute unless block 1007 66 8 stone run setblock 1007 66 8 stone
execute unless block 1007 66 5 stone run setblock 1007 66 5 stone

fill 997 64 5 1003 64 11 purple_concrete replace purple_terracotta
fill 997 64 5 1003 64 11 purple_terracotta replace purple_concrete
setblock 1000 64 6 air
setblock 1000 64 5 purple_terracotta

kill @e[tag=BannerStatue]
kill @e[tag=BannerBullet]
teleport @e[tag=BannerShulker] 1000 0 5 
kill @e[type=shulker]


fill 997 65 5 1003 65 11 air
setblock 1000 65 5 end_rod[facing=up]

# chicken
setblock 1003 65 11 white_banner[rotation=2]{Patterns: [{Pattern: "cre", Color: 15}, {Pattern: "cre", Color: 15}, {Pattern: "hhb", Color: 14}, {Pattern: "hhb", Color: 14}, {Pattern: "bs", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "ms", Color: 12}, {Pattern: "ms", Color: 4}]} replace

# creeper
setblock 1003 65 5 white_banner[rotation=6]{Patterns: [{Pattern: "hh", Color: 13}, {Pattern: "hhb", Color: 13}, {Pattern: "cre", Color: 15}, {Pattern: "cre", Color: 15}]} replace

# enderman
setblock 997 65 8 white_banner[rotation=2]{Patterns: [{Pattern: "hh", Color: 2}, {Pattern: "hhb", Color: 2}, {Pattern: "ss", Color: 0}, {Pattern: "ss", Color: 0}, {Pattern: "bo", Color: 0}, {Pattern: "bo", Color: 0}, {Pattern: "sc", Color: 15}, {Pattern: "sc", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "hhb", Color: 15}, {Pattern: "hhb", Color: 15}, {Pattern: "ts", Color: 15}, {Pattern: "ts", Color: 15}]} replace

# golem
setblock 997 65 5 white_banner[rotation=10]{Patterns: [{Pattern: "hh", Color: 14}, {Pattern: "hhb", Color: 14}, {Pattern: "mr", Color: 15}, {Pattern: "mr", Color: 15}, {Pattern: "bs", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "cs", Color: 8}, {Pattern: "bo", Color: 0}, {Pattern: "bo", Color: 0}, {Pattern: "ms", Color: 12}, {Pattern: "ms", Color: 12}, {Pattern: "hh", Color: 0}]} replace

# slime
setblock 997 65 11 white_banner[rotation=10]{Patterns: [{Pattern: "hh", Color: 5}, {Pattern: "hhb", Color: 13}, {Pattern: "rs", Color: 5}, {Pattern: "vh", Color: 5}, {Pattern: "hh", Color: 13}, {Pattern: "sc", Color: 5}, {Pattern: "bo", Color: 5}, {Pattern: "ts", Color: 5}, {Pattern: "bs", Color: 5}]} replace

# squid
setblock 1003 65 8 white_banner[rotation=14]{Patterns: [{Pattern: "cbo", Color: 15}, {Pattern: "cbo", Color: 15}, {Pattern: "hhb", Color: 9}, {Pattern: "hhb", Color: 9}, {Pattern: "ts", Color: 9}, {Pattern: "ts", Color: 9}, {Pattern: "cs", Color: 9}, {Pattern: "cs", Color: 9}, {Pattern: "bo", Color: 9}, {Pattern: "bo", Color: 9}, {Pattern: "gru", Color: 15}]} replace

# villager
setblock 1000 65 11 white_banner[rotation=14]{Patterns: [{Pattern: "mr", Color: 13}, {Pattern: "mr", Color: 13}, {Pattern: "bs", Color: 12}, {Pattern: "bs", Color: 12}, {Pattern: "cs", Color: 1}, {Pattern: "bo", Color: 12}, {Pattern: "ms", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 12}, {Pattern: "hh", Color: 12}]} replace

execute unless block 1000 64 4 stone_button[facing=north] run setblock 1000 64 4 stone_button[facing=north]
execute unless block 999 64 5 stone_button[facing=west] run setblock 999 64 5 stone_button[facing=west]
execute unless block 1001 64 5 stone_button[facing=east] run setblock 1001 64 5 stone_button[facing=east]
execute unless block 1002 64 5 stone_button[facing=west] run setblock 1002 64 5 stone_button[facing=west]
execute unless block 1002 64 8 stone_button[facing=west] run setblock 1002 64 8 stone_button[facing=west]
execute unless block 1002 64 11 stone_button[facing=west] run setblock 1002 64 11 stone_button[facing=west]
execute unless block 1000 64 10 stone_button[facing=north] run setblock 1000 64 10 stone_button[facing=north]
execute unless block 998 64 11 stone_button[facing=east] run setblock 998 64 11 stone_button[facing=east]
execute unless block 998 64 8 stone_button[facing=east] run setblock 998 64 8 stone_button[facing=east]
execute unless block 998 64 5 stone_button[facing=east] run setblock 998 64 5 stone_button[facing=east]

summon shulker 1000 66 5 {NoAI:true,Color:16b,Silent:true,Tags:["BannerShulker"],Invulnerable:true,Rotation:[0f,0f],UUIDLeast:-8743152485644460451L,UUIDMost:-8869172746962386557L}


# BANNER BULLET -> SQUID FIXER COMMANDS
setblock 39 5 14 clay


# HOPPER ORDER ROOM
setblock 979 65 -6 clay
setblock 979 65 -6 command_block[facing=south]{auto:0b,TrackOutput:false}

#setblock 986 64 -6 stone_button[face=floor]
setblock 986 63 -6 hopper{CustomName: "{\"text\":\"Item Hopper\"}", Lock: ""}
#data merge block 984 63 -6 {CustomName: "{\"text\":\"Item Hopper\"}", Lock: "{\"text\":\"Locked\"}"}
 
execute unless block 983 66 -13 redstone_block run setblock 983 66 -13 redstone_block
execute unless block 983 66 -12 black_terracotta run setblock 983 66 -12 black_terracotta

execute unless block 986 66 -13 redstone_block run setblock 986 66 -13 redstone_block
execute unless block 986 66 -12 black_terracotta run setblock 986 66 -12 black_terracotta

execute unless block 989 66 -13 redstone_block run setblock 989 66 -13 redstone_block
execute unless block 989 66 -12 black_terracotta run setblock 989 66 -12 black_terracotta

fill 982 65 -10 990 65 -10 air
fill 982 64 -10 990 64 -10 quartz_block replace crafting_table

setblock 984 65 -2 air
fill 982 64 -6 990 64 -2 air replace black_glazed_terracotta
fill 982 64 -6 990 64 -2 air replace purple_glazed_terracotta
fill 982 64 -6 990 64 -2 air replace white_glazed_terracotta
fill 982 64 -6 990 64 -2 air replace light_blue_glazed_terracotta
fill 982 64 -6 990 64 -2 air replace orange_glazed_terracotta

fill 981 76 -7 991 76 -1 air replace light_blue_stained_glass

gamerule showDeathMessages false
kill @e[tag=HopperMob]
gamerule showDeathMessages true

kill @e[nbt={Item:{tag:{HopperItem:1b}}}]
kill @e[nbt={Item:{id:"minecraft:saddle"}}]
kill @e[type=falling_block]

kill @e[tag=PreLoadStand]

execute unless entity @e[tag=PreLoadAdrian] run summon armor_stand 982 64 -13 {Small:true,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "c67563fd-4b7f-4a6b-a908-7237c3f1eaf9", Properties: {textures: [{Signature: "EQmvWH1KszeGISU2MI7VwE9bfe/bORgdXxKQr27/csuB4dfBmk2zH3/CjcL7vB1iY6KXaWqrZ+tgIhBCJS2c6yVSVAFAtWug08NHyAufwge4TDAccdUMRnHwHkmvcus9cUrCtKk6aIn03I+1Csc1Ui3h1T0ZeSBvKPVk9PDP1xBkGMQF4VTTAvNYb9B5RhGuz8TPS/3wC+JAr1OKbLpBlmQYAAF2lMBaoM/hd9fWM3fwfAYUCD+BnLzFPNk+eJOtKJdCyeTgewj6TwY/GSPOGoGIeJqBXg007gYq2c3ZOqs+jLft36JkpRj18qebRxkTSoWleRMHnPzBt0dXIdpfPEt34xLNgbTLekJyuXcyiNB3Ky2OdaeXUBKlC63nbsBsmC2SdotUOYUU35+IpcsRVNsG5CqDb8VNbcUEJ2GRNMTW4cmkzHFLsHMK/Cu7idWcSsncBiguU2abXnPlixQuWlmWChmHMMYMUcIjX798566MeB1Uy1dFGbR/dRJ1HqCz0Lde+D+Dhri3RKD9qkP7GIdSFIRULYK6d8eWcm0FjfSyfPeG/f7yTwSRPRQFPEuUKslx2NBWSE5mvyf/8AE6mbc47tqSa1T7pLRPbQuIgRd9YEK7lzhlPrZrRUXMMEAfTc+2C0BJaPrQtDlIZsxptrT0KDNXc21XEPGL8N8TwIM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzg2MzQ2NDYsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]}, Name: "abrightmoore"}},Count:1b}],HandItems:[{},{id:"minecraft:sugar_cane",Count:1b}],DisabledSlots:2039583,Tags:["PreLoadStand","PreLoadAdrian"]}

execute unless entity @e[tag=PreLoadCFG] run summon armor_stand 984 64 -13 {Small:true,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "07270730-7cf6-48f4-8850-11847f4d61a3", Properties: {textures: [{Signature: "nsxMOzwN/nK+tylj4RW50WQfBP2Bhipf7e1fx1pkB7MOJDbbcc6El+8gtDBP/4vMwUX+EP3pAfSJDR9vGiy/EVLAj9cjmb3+MGy2IxhaTcnI41CpKov2vtmAJBKJxlT0dNmPS3Y/Bae35FDyFBdGhNAu5imHv3iPoBCVf3DLoIoHPBbgskeNN74+kTDtDKKWf+Z5FQ8PNjHQ80KTo5Bxk3M/K/I+sFoge2atLp9eXeW3srCTEGkk7hEah6KQQTcaCqS2g6cqFoGgkLvcoQsFy6NE7RCNm8xkooFJ7Qjz1d0K1WfLYWphfnjYxmbIWGwLvSaDXmRxb1W9sfGtUnx28Sn54H9RBMGEL8ZRxPT5D1DuFjhPrVsAKlYb39CV1LWeskHt3BmUZoF2lRx2utQ5mGc+GH01eN8WgkenND37tVa/Fx/6NneRAjd5+r1yw4bB6qq2Xk/zdDdzv9QGfJR9Y6CNKadQWAFyHSUuJQ/BaKovddcLkMTjj1q9F4/tWTKkiyeby4st685coahkzaCvKdFaRHQAMQWl1+W0gCQ4wx4HrtBiAAVaQKq+krLeA2W2v1lsBheXmVDSMVEJuryCNdvuf2MTcqAsVssykB2McMcFXKZWwYKr9/du/gVaz4TnkqC+AKWwlr4hKGogIK1VDbMBjeboGcVLXi0mzkeythI=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzg3MTEyMTksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]}, Name: "ColdFusionGaming"}},Count:1b}],HandItems:[{id:"minecraft:ink_sac",Count:1b}],DisabledSlots:2039583,Tags:["PreLoadStand","PreLoadCFG"]}

execute unless entity @e[tag=PreLoadGT97] run summon armor_stand 986 64 -13 {Small:true,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5910795}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:12694441}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4612140}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "5bcce9e7-8d3b-424a-b480-1eb9e2dc3eee", Properties: {textures: [{Signature: "MfOTynmekAv3eXlhf6863HhEnFYuFqiHu4kzQ0CQZ8XcjJIDPioew68OSNQ24covIZdy2Giqleb6ZO/IR0oTl2CLoAoR5TCeO0/6EYYtrM2M5X6UdZLx0xjHqZkryV3e2S0MAdmXcsNaxSWrVOuyMI3EtB92aYsWBIOuH4jb+DSxhDe3WUVjdJrBUOAT0ip9On2uRXOcOuNIeEwX3RudIzK0syyvjdlZ76GttU0qnQDGbXIi3Da9dipn0PiK5m/OuPomrR8VSZwtGZ/VgEkljw3tpRo3RC0yrKZD0+bGM+kXXwhEw5k07ySAJhONMBZEeRRHhwAio884HMu/J9mtGd0rg+EvFeJ/kkFQpVdhBvH4FfTPG7JIlabifAsDdZai86LSA+/n8Aw7XPti1CN1VknF1sKc/TVnRZLVJcplt5BwpvHZ2OCCt9mx1V3l7ZFuCBPQXC94eG2E67DPGmcfw13idChp588FTlTkCxvJ/YGaVvDaiWvEy4Q78N0ZbnIHd5lD6mPPGqRQIZIQuyBN+Y9fNmsDp8yy/cUw8E3SoQMssz0YjTNcmryeK2QJJ4mxgDuyqmIv/RUbyVZ5aePM0/46EoFAmFEECcUJFoKFLYill7v6QY5IPbLH1bP2nM+vUQKc2A/SszYNDEEkfbxHn+glBrcSojJWgOBAAUTH5Lk=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTk2NDE4NjcsInByb2ZpbGVJZCI6IjViY2NlOWU3OGQzYjQyNGFiNDgwMWViOWUyZGMzZWVlIiwicHJvZmlsZU5hbWUiOiJnb2xkZW50dXJrZXk5NyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjViOTc3NjA3MGFhY2FlNzBiYmEyMWYxNWQ4MjJlZWIwMTM2NjllZmRkODIzNDdiZWRjZDQ0NGU2ODRmMDQ5MyJ9fX0="}]}, Name: "goldenturkey97"}},Count:1b}],HandItems:[{},{id:"minecraft:bone",Count:1b}],DisabledSlots:2039583,Tags:["PreLoadStand","PreLoadGT97"]}

execute unless entity @e[tag=PreLoadJesper] run summon armor_stand 988 64 -13 {Small:true,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:7895160}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:5129652}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2016708}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "a531d596-41fa-4372-8430-f38d5157c745", Properties: {textures: [{Signature: "QD2+sCcw4Y2o6d0BnapTeADGrAiNIWJApfgBpwh87MecPJgW6K49cFSCIsIpKz3nWkYuZ0ExHCvZuWq92c9p+aq9i786otccp9oT0hPE1KsmDfs3ONC04TPcrkF9eYgsQQ5pk+8LbkWcBpowl9KMEmOEVTYzy3iWdy6+hJCrOCex2bAmSS50uUU/LDmCdvu4eJ4628LNf+oV3mJ3MAZSN8eyNPlZkB61wUZUJORnTAWdp1W5kb8zCSCrpjExDqAK/6689jQcLRx6S3XQZ55dSsnjZCRFv/atedsPBMxGzYjBVk2QYFCYSHip/rMm29faDR1KmtgJLdE/dPxgEwxSNVBZlZsPcwiG5fHqZtuYvQ1zz30YTYpEw/5tB/hyL2uxmxLonC1pVe2uQTIW2MaKGV5n6TtqvUJa3Ex4hmlk9iAhG9Dg3jozjTAiL7AYgZJpsKKWx5yF5FMix99oWhGxC1ugH1IqcrDXu+ZIun49fgjwmZijaDrzzz7NNNVo6rQgQx3fIIVplcz9WL9GgTPb17CRQ/e9Mq9cDjcBec6Rs1buhnxH6GKn0HO7SvFeUkCNqd0wmYiEdb9EEVEyRplS+v0KVcB1VnTfgqkvMgCLBdCDbDlDhLJL2ILsyRB02EgFugCuMOACaFlKl+giqUX285pXrxVRfkMvpkytGwueum0=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzg4NzgxMTgsInByb2ZpbGVJZCI6ImE1MzFkNTk2NDFmYTQzNzI4NDMwZjM4ZDUxNTdjNzQ1IiwicHJvZmlsZU5hbWUiOiJKZXNwZXJ0aGVlbmQiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzY4NDM0YzhkM2M2YWZlM2NmZDIxZTdhMjYwYjc3YmRiOTZiM2UwMDlmNWIzMDQ5YjdhZjcwZGFjNmU5Njg5YjMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzE3OTEyNzkwZmYxNjRiOTMxOTZmMDhiYTcxZDBlNjIxMjkzMDQ3NzZkMGYzNDczMzRmOGE2ZWFlNTA5ZjhhNTYifX19"}]}, Name: "Jespertheend"}},Count:1b}],HandItems:[{id:"minecraft:sand",Count:1b},{id:"minecraft:sand",Count:1b}],DisabledSlots:2039583,Tags:["PreLoadStand","PreLoadJesper"]}

execute unless entity @e[tag=PreLoadQwerty] run summon armor_stand 990 64 -13 {Small:true,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "03b07a62-98e6-4fc4-8187-fb276d5a317c", Properties: {textures: [{Signature: "sGcbap0GeJ5XpsHOPscPN29YDGirgd0rydHIDoaV/rnuewmzQJBqhkZNU/D9Kp955QfjWtd9ehQE2yc/++8T63Dguzb91QQPI+ld/5peFUT04gHS7QcAPLHbMfGN2yFTmZwOP5SeLqM7NZc4ekuX+eCII/mk5uNksHMJnCxe/bt/3CsPC4oAStzIIAwVxXOVVRblcXhD653NpUcBYZ1hAhqruDPsfUbxJkICLs7/PchrpJfqJZr9egsilhAGOZJiXqc7Zw6tSppwC/BbepBri2+gws/JPdG3EjifYwGhbQCmJrtEK7F2Gt6hwaqPAc+FDD8VIrUB1VrYekkWqBK0Kkgg09eyqvcMt3b1mXWHmaOyi4LrwdHZhK47IGA8FjrD7d5beET97AWLE9/OJQD53OzaEBFyMDK9dNeXc+954VwclFhkLkwkq682YGmHPb6mWSA8X1CcEhsqTC4k9VJ/Z5XH8XKVziZYcNFzRrj1YyCPCudOXlz4J9PJogZVCYOcncOLRj3cb1iUdeNutDpYzEPlnK/YxVaas3ZKvzK85Ugliaga2Pjq+qkiumkseldIfSk8hD6RcFVtxXxBSkXiLCHLfSnxtBKD3hyD+payFAF9hcvwbv6LOYMHWLqmSsMSfWZkuVw3MVXgmxyQ6ZLh9EWpaXXzByhRYouXAHzGsSM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzg5NDE3NTksInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]}, Name: "qwertyuiopthepie"}},Count:1b}],HandItems:[{},{id:"minecraft:slime_ball",Count:1b}],DisabledSlots:2039583,Tags:["PreLoadStand","PreLoadQwerty"]}



# HANGMAN ROOM
setblock 994 65 -13 clay
setblock 994 65 -13 chain_command_block[facing=east]{auto:1b,TrackOutput:false}

setblock 1000 64 -13 air
setblock 998 63 -6 green_terracotta
setblock 1002 63 -6 green_terracotta
fill 996 65 -11 1004 66 -11 air
setblock 1000 64 -6 air
fill 996 62 -9 1004 62 -9 iron_block

kill @e[tag=HangmanHintAEC]
kill @e[tag=HangmanMob]
kill @e[tag=BannerBlocker]
kill @e[tag=BannerBlocker2]




# RESETS ALL DOORS
fill 984 64 -8 1016 65 24 redstone_block replace clay
