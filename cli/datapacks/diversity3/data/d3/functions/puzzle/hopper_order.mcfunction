####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 4 2017 / MARCH 25 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true
effect give @e[team=SeeCreeper] invisibility 1 255 true
effect give @e[team=SeeZombie] invisibility 1 255 true
effect give @e[team=SeeSkeleton] invisibility 1 255 true
effect give @e[team=SeeWither] invisibility 1 255 true
effect give @e[team=SeeVillager] invisibility 1 255 true
effect give @e[tag=InvisibleMob] invisibility 1 255 true

#scoreboard objectives setdisplay sidebar HopperCorrect
#scoreboard objectives setdisplay sidebar HopperRound
#scoreboard objectives setdisplay sidebar HopperSetup
#scoreboard objectives setdisplay sidebar HopperButton
#scoreboard objectives setdisplay sidebar HopperWin

execute if entity @e[tag=MainPuzzleAEC,scores={HopperSetup=..10}] run weather clear


# ROUND SETUP
scoreboard objectives add HopperSetup dummy
scoreboard players add @e[tag=MainPuzzleAEC] HopperSetup 1
execute if entity @e[scores={HopperSetup=1..10}] run setblock 979 65 -6 clay
execute if entity @e[scores={HopperSetup=1}] run team remove SeeCreeper
execute if entity @e[scores={HopperSetup=1}] run team remove SeeZombie
execute if entity @e[scores={HopperSetup=1}] run team remove SeeSkeleton
execute if entity @e[scores={HopperSetup=1}] run team remove SeeWither
execute if entity @e[scores={HopperSetup=1}] run team remove SeeVillager

scoreboard objectives add HopperRound dummy
scoreboard players add @e[tag=MainPuzzleAEC] HopperRound 0
scoreboard players set @e[tag=MainPuzzleAEC,scores={HopperRound=0}] HopperRound 1


# RUNS BUTTON CHECK
scoreboard objectives add HopperButton dummy
execute if block 986 64 -5 stone_button[powered=false] run scoreboard players set @e[tag=MainPuzzleAEC] HopperButton 0
#execute if block 986 63 -6 hopper{Items:[{Slot:0b,Count:1b},{Slot:1b,Count:1b},{Slot:2b,Count:1b},{Slot:3b,Count:1b},{Slot:4b,Count:1b}]} if block 986 64 -5 stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] HopperButton 1
execute if entity @e[scores={HopperSetup=70..}] if block 986 64 -5 stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] HopperButton 1
execute if block 986 64 -5 stone_button[powered=false] unless entity @e[tag=RoundEnd] run data merge block 986 63 -6 {CustomName:"{\"text\":\"Item Order\"}",Lock:""}
#execute if block 986 64 -5 stone_button[powered=false] 
execute if block 986 64 -5 stone_button[powered=true] run data merge block 986 63 -6 {CustomName:"{\"text\":\"Your answer\"}",Lock:"\"text\":\"Muse-Unintended\""}


# SETS UP MAIN ROUND BUTTON
scoreboard objectives add HopperCorrect dummy
#scoreboard players set @e[tag=MainPuzzleAEC,scores={HopperButton=1}] HopperCorrect 0
scoreboard players set @e[tag=MainPuzzleAEC,scores={HopperButton=0}] HopperCorrect 0


# CHECKS FOR HOPPER ORDER
execute if entity @e[scores={HopperButton=1..,HopperSetup=80..}] run kill @e[nbt={Item:{tag:{HopperItem:1b}}}]
execute if entity @e[scores={HopperButton=1..}] run kill @e[type=falling_block]
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a beetroot
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a mutton
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a wheat_seeds
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a salmon
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a wheat
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a bookshelf
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a dark_prismarine
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a white_shulker_box
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a beacon
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a magma_block
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a creeper_head
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a zombie_head
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a skeleton_skull
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a wither_skeleton_skull
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a player_head
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a birch_sapling
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a dark_oak_sapling
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a acacia_sapling
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a spruce_sapling
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a jungle_sapling
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a potion
execute if entity @e[scores={HopperButton=1,HopperSetup=75..}] run clear @a glass_bottle


execute if entity @e[scores={HopperButton=17}] run fill 982 64 -10 990 64 -10 quartz_block replace crafting_table
execute if entity @e[scores={HopperButton=17}] run fill 982 255 -10 990 255 -10 air replace cobweb
execute if entity @e[scores={HopperButton=17}] run fill 982 65 -10 990 65 -10 air
execute if entity @e[scores={HopperButton=17}] run weather clear
execute if entity @e[scores={HopperButton=17}] run setblock 984 65 -2 air
execute if entity @e[scores={HopperButton=17}] run fill 982 64 -6 990 64 -2 air replace birch_log
execute if entity @e[scores={HopperButton=17}] run fill 982 64 -6 990 64 -2 air replace dark_oak_log
execute if entity @e[scores={HopperButton=17}] run fill 982 64 -6 990 64 -2 air replace acacia_log
execute if entity @e[scores={HopperButton=17}] run fill 982 64 -6 990 64 -2 air replace spruce_log
execute if entity @e[scores={HopperButton=17}] run fill 982 64 -6 990 64 -2 air replace jungle_log
execute if entity @e[scores={HopperButton=17}] run fill 981 63 -7 991 63 -1 iron_block replace bone_block
execute if entity @e[scores={HopperButton=17}] run fill 981 76 -7 991 76 -1 air replace light_blue_stained_glass
execute if entity @e[scores={HopperButton=17}] run gamerule showDeathMessages false
#execute if entity @e[scores={HopperButton=17,HopperSetup=75..}] run kill @e[tag=HopperMob]
execute if entity @e[scores={HopperButton=17..}] run kill @e[nbt={Item:{id:"minecraft:saddle"}}]
execute if entity @e[scores={HopperButton=17}] run gamerule showDeathMessages true
execute if entity @e[scores={HopperButton=17}] run setblock 979 65 -6 command_block[facing=south]{auto:0b,TrackOutput:false}


# TEST FOR CORRECT
execute if entity @e[scores={HopperRound=1,HopperButton=1..}] if block 986 63 -6 hopper{Items:[{Slot:0b,id:"minecraft:beetroot"},{Slot:1b,id:"minecraft:mutton"},{Slot:2b,id:"minecraft:wheat_seeds"},{Slot:3b,id:"minecraft:salmon"},{Slot:4b,id:"minecraft:wheat"}]} run scoreboard players set @e[tag=MainPuzzleAEC] HopperCorrect 1

execute if entity @e[scores={HopperRound=2,HopperButton=1..}] if block 986 63 -6 hopper{Items:[{Slot:0b,id:"minecraft:bookshelf"},{Slot:1b,id:"minecraft:dark_prismarine"},{Slot:2b,id:"minecraft:white_shulker_box"},{Slot:3b,id:"minecraft:beacon"},{Slot:4b,id:"minecraft:magma_block"}]} run scoreboard players set @e[tag=MainPuzzleAEC] HopperCorrect 1

execute if entity @e[scores={HopperRound=3,HopperButton=1..}] if block 986 63 -6 hopper{Items:[{Slot:0b,id:"minecraft:creeper_head"},{Slot:1b,id:"minecraft:zombie_head"},{Slot:2b,id:"minecraft:skeleton_skull"},{Slot:3b,id:"minecraft:wither_skeleton_skull"},{Slot:4b,id:"minecraft:player_head"}]} run scoreboard players set @e[tag=MainPuzzleAEC] HopperCorrect 1

execute if entity @e[scores={HopperRound=4,HopperButton=1..}] if block 986 63 -6 hopper{Items:[{Slot:0b,id:"minecraft:birch_sapling"},{Slot:1b,id:"minecraft:dark_oak_sapling"},{Slot:2b,id:"minecraft:acacia_sapling"},{Slot:3b,id:"minecraft:spruce_sapling"},{Slot:4b,id:"minecraft:jungle_sapling"}]} run scoreboard players set @e[tag=MainPuzzleAEC] HopperCorrect 1

execute if entity @e[scores={HopperRound=5,HopperButton=1..}] if block 986 63 -6 hopper{Items:[{Slot:0b,id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Duration:60}]}},{Slot:1b,id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Duration:21}]}},{Slot:2b,id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Duration:100}]}},{Slot:3b,id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Duration:40}]}},{Slot:4b,id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Duration:80}]}}]} run scoreboard players set @e[tag=MainPuzzleAEC] HopperCorrect 1

execute if entity @e[scores={HopperSetup=0..75}] run tag @e[tag=MainPuzzleAEC] remove RoundEnd
execute if entity @e[scores={HopperCorrect=1,HopperButton=10..}] run tag @e[tag=MainPuzzleAEC] add RoundEnd
execute if entity @e[tag=RoundEnd] run scoreboard players set @e[tag=RoundEnd] HopperSetup 100000

# IF CORRECT
#execute if entity @e[scores={HopperRound=1,HopperButton=19,HopperCorrect=1}] run setblock 982 66 -13 redstone_block
#execute if entity @e[scores={HopperRound=2,HopperButton=19,HopperCorrect=1}] run setblock 984 66 -13 redstone_block
#execute if entity @e[scores={HopperRound=3,HopperButton=19,HopperCorrect=1}] run setblock 986 66 -13 redstone_block
#execute if entity @e[scores={HopperRound=4,HopperButton=19,HopperCorrect=1}] run setblock 988 66 -13 redstone_block
#execute if entity @e[scores={HopperRound=5,HopperButton=19,HopperCorrect=1}] run setblock 990 66 -13 redstone_block

execute if entity @e[scores={HopperRound=1,HopperButton=17,HopperCorrect=1}] if entity @e[scores={HopperRound=1,HopperSetup=70}] at @e[tag=HopperMob,type=!armor_stand] run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 50 force @a
execute if entity @e[scores={HopperRound=2..4,HopperButton=17,HopperCorrect=1}] at @e[tag=HopperMob] run particle portal ~ ~0.3 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HopperRound=1..4,HopperButton=17,HopperCorrect=1}] run playsound entity.enderman.teleport master @a 986 65 -10 0.5 1 0
execute if entity @e[scores={HopperRound=4,HopperButton=17,HopperCorrect=1}] run playsound entity.leash_knot.place master @a 986 65 -10 1 0.7 0
execute if entity @e[scores={HopperRound=5,HopperButton=17,HopperCorrect=1}] run playsound entity.ender_dragon.flap master @a 986 65 -10 1 1 0
execute if entity @e[scores={HopperButton=17,HopperCorrect=1}] run teleport @e[tag=HopperMob] 986 1 -10 
execute if entity @e[scores={HopperButton=17}] run gamerule showDeathMessages false
execute if entity @e[scores={HopperButton=17,HopperCorrect=1,HopperSetup=75..}] run teleport @e[tag=SaplingMob] ~ ~-1000 ~

execute if entity @e[scores={HopperButton=19,HopperCorrect=1,HopperSetup=75..}] run kill @e[tag=HopperMob]
execute if entity @e[scores={HopperButton=17..}] run kill @e[nbt={Item:{id:"minecraft:saddle"}}]
execute if entity @e[scores={HopperButton=19}] run gamerule showDeathMessages true
execute if entity @e[scores={HopperButton=19,HopperCorrect=1}] run playsound block.note_block.pling master @a 986 65 -10 0.7 0.8 0

execute if entity @e[scores={HopperButton=19}] run data merge block 986 63 -6 {CustomName:"{\"text\":\"Item Order\"}",Items:[{},{},{},{},{}]}

scoreboard players set @e[scores={HopperRound=1,HopperButton=19,HopperCorrect=1}] HopperButton -100
scoreboard players set @e[scores={HopperButton=-100}] HopperRound 2

scoreboard players set @e[scores={HopperRound=2,HopperButton=19,HopperCorrect=1}] HopperButton -200
scoreboard players set @e[scores={HopperButton=-200}] HopperRound 3

scoreboard players set @e[scores={HopperRound=3,HopperButton=19,HopperCorrect=1}] HopperButton -300
scoreboard players set @e[scores={HopperButton=-300}] HopperRound 4

scoreboard players set @e[scores={HopperRound=4,HopperButton=19,HopperCorrect=1}] HopperButton -400
scoreboard players set @e[scores={HopperButton=-400}] HopperRound 5

scoreboard players set @e[scores={HopperRound=5,HopperButton=19,HopperCorrect=1}] HopperRound 6


# IF WRONG -> ALTER HERE
#execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] run fill 982 66 -13 990 66 -13 clay replace redstone_block
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run playsound block.ender_chest.open master @a 986 66 -11 1 0.8 0
execute if entity @e[scores={HopperButton=15,HopperCorrect=0,HopperRound=3}] unless entity @e[tag=RoundEnd] run teleport @e[tag=HopperMob] 986 1 -10 
execute if entity @e[scores={HopperButton=17,HopperCorrect=0,HopperSetup=75..}] unless entity @e[tag=RoundEnd] run kill @e[tag=HopperMob]
execute if entity @e[scores={HopperButton=17..}] unless entity @e[tag=RoundEnd] run kill @e[nbt={Item:{id:"minecraft:saddle"}}]

execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] if block 983 66 -12 redstone_lamp if block 986 66 -12 black_terracotta if block 989 66 -12 black_terracotta run setblock 983 66 -12 black_terracotta destroy
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] if block 983 66 -12 redstone_lamp if block 986 66 -12 redstone_lamp if block 989 66 -12 black_terracotta run setblock 986 66 -12 black_terracotta destroy
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] if block 983 66 -12 redstone_lamp if block 986 66 -12 redstone_lamp if block 989 66 -12 redstone_lamp run setblock 989 66 -12 black_terracotta destroy

execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] if block 983 66 -12 black_terracotta if block 986 66 -12 black_terracotta if block 989 66 -12 black_terracotta run scoreboard objectives remove HopperRound
#execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run scoreboard objectives remove HopperRound
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run scoreboard objectives remove HopperSetup
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run scoreboard objectives remove HopperWin
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run data merge block 986 63 -6 {CustomName:"{\"text\":\"Item Order\"}",Lock:"",Items:[{},{},{},{},{}]}
execute if entity @e[scores={HopperButton=17,HopperCorrect=0}] unless entity @e[tag=RoundEnd] run setblock 42 2 14 clay


# ROUND 1
execute if entity @e[scores={HopperRound=1,HopperSetup=20}] run summon item 982 64 -8 {Item:{id:"minecraft:salmon",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=1,HopperSetup=30}] run summon item 984 64 -8 {Item:{id:"minecraft:wheat_seeds",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=1,HopperSetup=40}] run summon item 986 64 -8 {Item:{id:"minecraft:beetroot",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=1,HopperSetup=45}] run summon item 988 64 -8 {Item:{id:"minecraft:wheat",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=1,HopperSetup=50}] run summon item 990 64 -8 {Item:{id:"minecraft:mutton",Count:1b,tag:{HopperItem:1b}}}

execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon pig 982 65 -10 {NoAI:true,Invulnerable:true,Age:-2147483648,Tags:["HopperMob"],Saddle:true}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon wolf 984 65 -10 {NoAI:true,Invulnerable:true,Age:-2147483648,Tags:["HopperMob"],Sitting:true,Owner:qmagnet}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon parrot 986 65 -10 {NoAI:true,Invulnerable:true,Age:-2147483648,Tags:["HopperMob"],Sitting:true,Variant:0}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon ocelot 988 65 -10 {NoAI:true,Invulnerable:true,Age:-2147483648,Tags:["HopperMob"],Sitting:true,CatType:2}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon cow 990 65 -10 {NoAI:true,Invulnerable:true,Age:-2147483648,Tags:["HopperMob"],Sitting:true}

execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon armor_stand 982 65 -10 {Invisible:true,DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon armor_stand 984 65 -10 {Invisible:true,DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon armor_stand 986 65 -10 {Invisible:true,DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon armor_stand 988 65 -10 {Invisible:true,DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] run summon armor_stand 990 65 -10 {Invisible:true,DisabledSlots:2039583,Tags:["HopperMob"]}

execute if entity @e[scores={HopperRound=1,HopperSetup=100}] if block 983 66 -12 black_terracotta if block 986 66 -12 black_terracotta if block 989 66 -12 black_terracotta run playsound minecraft:entity.arrow.hit_player master @a 986 66 -12 1 1 1
execute if entity @e[scores={HopperRound=1,HopperSetup=100}] if block 983 66 -12 black_terracotta if block 986 66 -12 black_terracotta if block 989 66 -12 black_terracotta run fill 983 66 -12 989 66 -12 redstone_lamp[lit=true] replace black_terracotta


# ROUND 2
execute if entity @e[scores={HopperRound=2,HopperSetup=20}] run summon item 982 64 -8 {Item:{id:"minecraft:white_shulker_box",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=2,HopperSetup=30}] run summon item 984 64 -8 {Item:{id:"minecraft:beacon",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=2,HopperSetup=40}] run summon item 986 64 -8 {Item:{id:"minecraft:bookshelf",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=2,HopperSetup=45}] run summon item 988 64 -8 {Item:{id:"minecraft:magma_block",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=2,HopperSetup=50}] run summon item 990 64 -8 {Item:{id:"minecraft:dark_prismarine",Count:1b,tag:{HopperItem:1b}}}

#jukebox - diamond/wood


execute if entity @e[scores={HopperRound=2,HopperSetup=70}] run summon armor_stand 982 65 -10 {Small:true,Invulnerable:true,Rotation:[340.0f,0.0f],CustomName:"{\"text\":\"abrightmoore\",\"color\":\"dark_gray\"}",CustomNameVisible:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"c67563fd-4b7f-4a6b-a908-7237c3f1eaf9",Properties:{textures:[{Signature:"EQmvWH1KszeGISU2MI7VwE9bfe/bORgdXxKQr27/csuB4dfBmk2zH3/CjcL7vB1iY6KXaWqrZ+tgIhBCJS2c6yVSVAFAtWug08NHyAufwge4TDAccdUMRnHwHkmvcus9cUrCtKk6aIn03I+1Csc1Ui3h1T0ZeSBvKPVk9PDP1xBkGMQF4VTTAvNYb9B5RhGuz8TPS/3wC+JAr1OKbLpBlmQYAAF2lMBaoM/hd9fWM3fwfAYUCD+BnLzFPNk+eJOtKJdCyeTgewj6TwY/GSPOGoGIeJqBXg007gYq2c3ZOqs+jLft36JkpRj18qebRxkTSoWleRMHnPzBt0dXIdpfPEt34xLNgbTLekJyuXcyiNB3Ky2OdaeXUBKlC63nbsBsmC2SdotUOYUU35+IpcsRVNsG5CqDb8VNbcUEJ2GRNMTW4cmkzHFLsHMK/Cu7idWcSsncBiguU2abXnPlixQuWlmWChmHMMYMUcIjX798566MeB1Uy1dFGbR/dRJ1HqCz0Lde+D+Dhri3RKD9qkP7GIdSFIRULYK6d8eWcm0FjfSyfPeG/f7yTwSRPRQFPEuUKslx2NBWSE5mvyf/8AE6mbc47tqSa1T7pLRPbQuIgRd9YEK7lzhlPrZrRUXMMEAfTc+2C0BJaPrQtDlIZsxptrT0KDNXc21XEPGL8N8TwIM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzg2MzQ2NDYsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]},Name:"abrightmoore"}},Count:1b}],HandItems:[{},{id:"minecraft:sugar_cane",Count:1b}],DisabledSlots:2039583,Tags:["HopperMob","HopperAdrian"],Pose:{Head:[18f,0f,0f],LeftLeg:[0f,0f,351f],RightLeg:[33f,321f,23f],LeftArm:[335f,360f,250f],RightArm:[10f,290f,40f]}}

execute if entity @e[scores={HopperRound=2,HopperSetup=70}] run summon armor_stand 984 64.68 -10 {Small:true,Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"ColdFusionGaming\",\"color\":\"dark_purple\"}",CustomNameVisible:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"07270730-7cf6-48f4-8850-11847f4d61a3",Properties:{textures:[{Signature:"nsxMOzwN/nK+tylj4RW50WQfBP2Bhipf7e1fx1pkB7MOJDbbcc6El+8gtDBP/4vMwUX+EP3pAfSJDR9vGiy/EVLAj9cjmb3+MGy2IxhaTcnI41CpKov2vtmAJBKJxlT0dNmPS3Y/Bae35FDyFBdGhNAu5imHv3iPoBCVf3DLoIoHPBbgskeNN74+kTDtDKKWf+Z5FQ8PNjHQ80KTo5Bxk3M/K/I+sFoge2atLp9eXeW3srCTEGkk7hEah6KQQTcaCqS2g6cqFoGgkLvcoQsFy6NE7RCNm8xkooFJ7Qjz1d0K1WfLYWphfnjYxmbIWGwLvSaDXmRxb1W9sfGtUnx28Sn54H9RBMGEL8ZRxPT5D1DuFjhPrVsAKlYb39CV1LWeskHt3BmUZoF2lRx2utQ5mGc+GH01eN8WgkenND37tVa/Fx/6NneRAjd5+r1yw4bB6qq2Xk/zdDdzv9QGfJR9Y6CNKadQWAFyHSUuJQ/BaKovddcLkMTjj1q9F4/tWTKkiyeby4st685coahkzaCvKdFaRHQAMQWl1+W0gCQ4wx4HrtBiAAVaQKq+krLeA2W2v1lsBheXmVDSMVEJuryCNdvuf2MTcqAsVssykB2McMcFXKZWwYKr9/du/gVaz4TnkqC+AKWwlr4hKGogIK1VDbMBjeboGcVLXi0mzkeythI=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzg3MTEyMTksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]},Name:"ColdFusionGaming"}},Count:1b}],HandItems:[{id:"minecraft:ink_sac",Count:1b,Damage:0s}],DisabledSlots:2039583,Tags:["HopperMob","HopperCFG"],Pose:{Body:[352f,0f,0f],Head:[17f,0f,0f],LeftLeg:[269f,340f,0f],RightLeg:[268f,14f,0f],LeftArm:[19f,0f,347f],RightArm:[315f,340f,0f]}}

execute if entity @e[scores={HopperRound=2,HopperSetup=70}] run summon armor_stand 986 65 -10 {Small:true,Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"goldenturkey97\",\"color\":\"white\"}",CustomNameVisible:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5910795}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:12694441}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4612140}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"5bcce9e7-8d3b-424a-b480-1eb9e2dc3eee",Properties:{textures:[{Signature:"hHpZxqAEsAonNGbeTs5F9ES2qZ+kv6WuWiWrlKXnhCcXO+tJ6rxHLS5D3xF7UBpcC6wq8trBm/j4bcNDOAL4vcFanLnS96C+podaZpWSK/V6NRevPti/vOzWRguJrJKKHM5mkZ2ieznnn6xO6Edpk1r6FFOyrNHUT70OUExR3rrqT+5pE0GnSi4mOC1FMKLuiFJBtuzgZbi4jaAGD1jyjb10fAx/PJ8KF8lxMEHCFXBPZv8JOHP/F8hRgOZmHPvat+lJXWgf6r2Xu4gXDudbDiSLC0CCLJHkN4wLUIg+3SF1a9CXesFR5SvWzaMFZ5gmNX2jm/R+QwVp8zcC79DPh3GKfv6+PpB9vbChxECOG4/QIxsa6vcWgBpozuhQjqAMFEpEPrqUO19AcK4FvXDHOHyXCyn2irQYX2+1sijHDyf+EEnlJX9KQ0Vfj20ArTiEOMZiV0Njq5ePg16RkTGeJrBQtCGsqWDGp/ZCQSzCnN2UDGqhV86lp0W3Mmp3TMxkCOLy2H4ocRlvmVF6hS9j0LFrY7GcoJMSk/m7ysTZTNzVdpSjoaEE445dgTd9k2xRAT2WVDLuhsM6phe0iTTzFqNaBnRdQD/KrAK7qjQUFiBoC46phwCMHRKU6GK361QnaUUVkVONwBdTCnPhweK0tKSGBmzDyycpeD1BP3mQzgM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzg3NzM5MzksInByb2ZpbGVJZCI6IjViY2NlOWU3OGQzYjQyNGFiNDgwMWViOWUyZGMzZWVlIiwicHJvZmlsZU5hbWUiOiJnb2xkZW50dXJrZXk5NyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjViOTc3NjA3MGFhY2FlNzBiYmEyMWYxNWQ4MjJlZWIwMTM2NjllZmRkODIzNDdiZWRjZDQ0NGU2ODRmMDQ5MyJ9fX0="}]}}},Count:1b}],HandItems:[{},{id:"minecraft:bone",Count:1b}],DisabledSlots:2039583,Tags:["HopperMob","HopperGT"],Pose:{Body:[0f,0f,0f],Head:[7f,0f,0f],LeftLeg:[350f,0f,344f],RightLeg:[10f,0f,17f],LeftArm:[299f,29f,7f],RightArm:[296f,321f,0f]}}

execute if entity @e[scores={HopperRound=2,HopperSetup=70}] run summon armor_stand 988 64.68 -10 {Small:true,Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"Jespertheend\",\"color\":\"blue\"}",CustomNameVisible:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:7895160}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:5129652}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2016708}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"a531d596-41fa-4372-8430-f38d5157c745",Properties:{textures:[{Signature:"QD2+sCcw4Y2o6d0BnapTeADGrAiNIWJApfgBpwh87MecPJgW6K49cFSCIsIpKz3nWkYuZ0ExHCvZuWq92c9p+aq9i786otccp9oT0hPE1KsmDfs3ONC04TPcrkF9eYgsQQ5pk+8LbkWcBpowl9KMEmOEVTYzy3iWdy6+hJCrOCex2bAmSS50uUU/LDmCdvu4eJ4628LNf+oV3mJ3MAZSN8eyNPlZkB61wUZUJORnTAWdp1W5kb8zCSCrpjExDqAK/6689jQcLRx6S3XQZ55dSsnjZCRFv/atedsPBMxGzYjBVk2QYFCYSHip/rMm29faDR1KmtgJLdE/dPxgEwxSNVBZlZsPcwiG5fHqZtuYvQ1zz30YTYpEw/5tB/hyL2uxmxLonC1pVe2uQTIW2MaKGV5n6TtqvUJa3Ex4hmlk9iAhG9Dg3jozjTAiL7AYgZJpsKKWx5yF5FMix99oWhGxC1ugH1IqcrDXu+ZIun49fgjwmZijaDrzzz7NNNVo6rQgQx3fIIVplcz9WL9GgTPb17CRQ/e9Mq9cDjcBec6Rs1buhnxH6GKn0HO7SvFeUkCNqd0wmYiEdb9EEVEyRplS+v0KVcB1VnTfgqkvMgCLBdCDbDlDhLJL2ILsyRB02EgFugCuMOACaFlKl+giqUX285pXrxVRfkMvpkytGwueum0=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzg4NzgxMTgsInByb2ZpbGVJZCI6ImE1MzFkNTk2NDFmYTQzNzI4NDMwZjM4ZDUxNTdjNzQ1IiwicHJvZmlsZU5hbWUiOiJKZXNwZXJ0aGVlbmQiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzY4NDM0YzhkM2M2YWZlM2NmZDIxZTdhMjYwYjc3YmRiOTZiM2UwMDlmNWIzMDQ5YjdhZjcwZGFjNmU5Njg5YjMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzE3OTEyNzkwZmYxNjRiOTMxOTZmMDhiYTcxZDBlNjIxMjkzMDQ3NzZkMGYzNDczMzRmOGE2ZWFlNTA5ZjhhNTYifX19"}]},Name:"Jespertheend"}},Count:1b}],HandItems:[{id:"minecraft:coal",Count:1b},{id:"minecraft:sand",Count:1b}],DisabledSlots:2039583,Tags:["HopperMob","HopperJesper"],Pose:{Head:[309f,0f,0f],LeftLeg:[89f,0f,0f],RightLeg:[270f,0f,0f],LeftArm:[0f,270f,269f],RightArm:[0f,90f,89f]}}

execute if entity @e[scores={HopperRound=2,HopperSetup=70}] run summon armor_stand 990 65 -10 {Small:true,Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"qwertyuiopthepie\",\"color\":\"gold\"}",CustomNameVisible:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"03b07a62-98e6-4fc4-8187-fb276d5a317c",Properties:{textures:[{Signature:"sGcbap0GeJ5XpsHOPscPN29YDGirgd0rydHIDoaV/rnuewmzQJBqhkZNU/D9Kp955QfjWtd9ehQE2yc/++8T63Dguzb91QQPI+ld/5peFUT04gHS7QcAPLHbMfGN2yFTmZwOP5SeLqM7NZc4ekuX+eCII/mk5uNksHMJnCxe/bt/3CsPC4oAStzIIAwVxXOVVRblcXhD653NpUcBYZ1hAhqruDPsfUbxJkICLs7/PchrpJfqJZr9egsilhAGOZJiXqc7Zw6tSppwC/BbepBri2+gws/JPdG3EjifYwGhbQCmJrtEK7F2Gt6hwaqPAc+FDD8VIrUB1VrYekkWqBK0Kkgg09eyqvcMt3b1mXWHmaOyi4LrwdHZhK47IGA8FjrD7d5beET97AWLE9/OJQD53OzaEBFyMDK9dNeXc+954VwclFhkLkwkq682YGmHPb6mWSA8X1CcEhsqTC4k9VJ/Z5XH8XKVziZYcNFzRrj1YyCPCudOXlz4J9PJogZVCYOcncOLRj3cb1iUdeNutDpYzEPlnK/YxVaas3ZKvzK85Ugliaga2Pjq+qkiumkseldIfSk8hD6RcFVtxXxBSkXiLCHLfSnxtBKD3hyD+payFAF9hcvwbv6LOYMHWLqmSsMSfWZkuVw3MVXgmxyQ6ZLh9EWpaXXzByhRYouXAHzGsSM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzg5NDE3NTksInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]},Name:"qwertyuiopthepie"}},Count:1b}],HandItems:[{},{id:"minecraft:slime_ball",Count:1b}],DisabledSlots:2039583,Tags:["HopperMob","HopperQwerty"],Pose:{Head:[355f,57f,0f],LeftLeg:[0f,350f,352f],RightLeg:[259f,60f,0f],LeftArm:[311f,4f,337f],RightArm:[327f,37f,52f]}}

execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run data merge entity @e[tag=HopperAdrian,limit=1] {HandItems:[{id:"minecraft:leather",Count:1b},{id:"minecraft:paper",Count:1b}]}
execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run data merge entity @e[tag=HopperCFG,limit=1] {HandItems:[{id:"minecraft:ink_sac",Count:1b},{id:"minecraft:prismarine_shard",Count:1b}]}
execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run data merge entity @e[tag=HopperGT,limit=1] {HandItems:[{id:"minecraft:shulker_shell",Count:1b},{id:"minecraft:bone_meal",Count:1b}],Pose:{LeftArm:[299f,10f,7f],RightArm:[296f,350f,0f]}}
execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run data merge entity @e[tag=HopperJesper,limit=1] {HandItems:[{id:"minecraft:obsidian",Count:1b},{id:"minecraft:glass",Count:1b}]}
execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run data merge entity @e[tag=HopperQwerty,limit=1] {HandItems:[{id:"minecraft:magma_cream",Count:1b},{id:"minecraft:magma_cream",Count:1b}]}

execute if entity @e[scores={HopperRound=2,HopperSetup=2000}] run playsound entity.item_frame.remove_item master @a 986 65 -10

execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run fill 982 64 -10 990 64 -10 crafting_table replace quartz_block
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run data merge entity @e[tag=HopperAdrian,limit=1] {CustomName:"{\"text\":\"C\",\"color\":\"dark_gray\"}"}
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run data merge entity @e[tag=HopperCFG,limit=1] {CustomName:"{\"text\":\"R\",\"color\":\"dark_purple\"}"}
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run data merge entity @e[tag=HopperGT,limit=1] {CustomName:"{\"text\":\"A\",\"color\":\"white\"}"}
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run data merge entity @e[tag=HopperJesper,limit=1] {CustomName:"{\"text\":\"F\",\"color\":\"blue\"}"}
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run data merge entity @e[tag=HopperQwerty,limit=1] {CustomName:"{\"text\":\"T\",\"color\":\"gold\"}"}
execute if entity @e[scores={HopperRound=2,HopperSetup=3000}] run playsound entity.item_frame.remove_item master @a 986 65 -10


# ROUND 3
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add SeeCreeper
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add SeeZombie
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add SeeSkeleton
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add SeeWither
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add SeeVillager
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run team add NoCollision

execute if entity @e[scores={HopperRound=3,HopperSetup=1..10}] run difficulty easy
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run summon item 982 64 -8 {Item:{id:"minecraft:skeleton_skull",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=3,HopperSetup=30}] run summon item 984 64 -8 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=3,HopperSetup=40}] run summon item 986 64 -8 {Item:{id:"minecraft:zombie_head",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=3,HopperSetup=45}] run summon item 988 64 -8 {Item:{id:"minecraft:player_head",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=3,HopperSetup=50}] run summon item 990 64 -8 {Item:{id:"minecraft:creeper_head",Count:1b,tag:{HopperItem:1b}}}

execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run setblock 982 255 -10 cobweb
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run setblock 984 255 -10 cobweb
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run setblock 986 255 -10 cobweb
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run setblock 988 255 -10 cobweb
execute if entity @e[scores={HopperRound=3,HopperSetup=20}] run setblock 990 255 -10 cobweb

execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon creeper 982 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:SeeCreeper}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon zombie 982 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon skeleton 982 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon wither_skeleton 982 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon villager 982 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},Offers:{},Team:NoCollision}

execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon creeper 984 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon zombie 984 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:SeeZombie}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon skeleton 984 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon wither_skeleton 984 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon villager 984 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},Offers:{},Team:NoCollision}

execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon creeper 986 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon zombie 986 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon skeleton 986 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:SeeSkeleton}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon wither_skeleton 986 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon villager 986 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},Offers:{},Team:NoCollision}

execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon creeper 988 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon zombie 988 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon skeleton 988 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon wither_skeleton 988 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:SeeWither}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon villager 988 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},Offers:{},Team:NoCollision}

execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon creeper 990 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon zombie 990 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon skeleton 990 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon wither_skeleton 990 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],Team:NoCollision}
execute if entity @e[scores={HopperRound=3,HopperSetup=65}] run summon villager 990 55 -10 {NoAI:true,Invulnerable:true,Tags:["HopperMob","InvisibleMob"],VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},Offers:{},Team:SeeVillager}


execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz unless entity @a[x=982,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=PUT] remove PUT
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=982,y=69,z=-10,dx=0,dy=0,dz=0] unless entity @e[tag=PUT] run tellraw @a [{"text":"e","color":"dark_gray","italic":true}]
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=982,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=MainPuzzleAEC] add PUT

execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz unless entity @a[x=984,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=IT] remove IT
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=984,y=69,z=-10,dx=0,dy=0,dz=0] unless entity @e[tag=IT] run tellraw @a [{"text":"q","color":"dark_purple","italic":true}]
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=984,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=MainPuzzleAEC] add IT

execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz unless entity @a[x=986,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=ON] remove ON
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=986,y=69,z=-10,dx=0,dy=0,dz=0] unless entity @e[tag=ON] run tellraw @a [{"text":"u","color":"light_gray","italic":true}]
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=986,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=MainPuzzleAEC] add ON

execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz unless entity @a[x=988,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=YOUR] remove YOUR
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=988,y=69,z=-10,dx=0,dy=0,dz=0] unless entity @e[tag=YOUR] run tellraw @a [{"text":"i","color":"blue","italic":true}]
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=988,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=MainPuzzleAEC] add YOUR

execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz unless entity @a[x=990,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=HEAD] remove HEAD
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=990,y=69,z=-10,dx=0,dy=0,dz=0] unless entity @e[tag=HEAD] run tellraw @a [{"text":"p","color":"gold","italic":true}]
execute if entity @e[scores={HopperRound=3}] unless entity @e[tag=RoundEnd] align xyz if entity @a[x=990,y=69,z=-10,dx=0,dy=0,dz=0] run tag @e[tag=MainPuzzleAEC] add HEAD


execute if entity @e[scores={HopperRound=3,HopperSetup=70}] as @e[tag=HopperMob] at @s run teleport @s ~ 65 ~

#execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 982 65 -10 coal_block
#execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 984 65 -10 purpur_block
#execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 986 65 -10 mushroom_stem
#execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 988 65 -10 packed_ice
#execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 990 65 -10 carved_pumpkin

execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 982 65 -10 black_stained_glass
execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 984 65 -10 purple_stained_glass
execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 986 65 -10 white_stained_glass
execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 988 65 -10 light_blue_stained_glass
execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run setblock 990 65 -10 orange_stained_glass


execute if entity @e[scores={HopperRound=3,HopperSetup=2000}] run kill @e[tag=HopperMob,type=armor_stand]
execute if entity @e[scores={HopperRound=3,HopperSetup=2000}] run summon armor_stand 986 140 -2 {Small:true,Invulnerable:true,ShowArms:true,NoBasePlate:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:dragon_head",Count:1b}],Pose:{Head:[350f,0f,0f],RightArm:[270f,0f,0f]},Rotation:[180f,0f],DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=3,HopperSetup=2060}] run summon armor_stand 986 63.74 -2 {CustomName:"{\"text\":\"My mask is better than yours!\",\"color\":\"white\"}",CustomNameVisible:true,Small:false,Invisible:true,NoGravity:true,DisabledSlots:2039583,Tags:["HopperMob"]}
execute if entity @e[scores={HopperRound=3,HopperSetup=2060}] run summon armor_stand 986 63.5 -2 {CustomName:"{\"text\":\"I can see all of them!\",\"color\":\"white\"}",CustomNameVisible:true,Small:false,Invisible:true,NoGravity:true,DisabledSlots:2039583,Tags:["HopperMob"]}

# SEE INVISIBLES -> TEAMS
team leave @a[team=SeeCreeper,nbt=!{Inventory:[{Slot:103b,id:"minecraft:creeper_head"}]}]
team join SeeCreeper @a[nbt={Inventory:[{Slot:103b,id:"minecraft:creeper_head"}]}]
team leave @a[team=SeeZombie,nbt=!{Inventory:[{Slot:103b,id:"minecraft:zombie_head"}]}]
team join SeeZombie @a[nbt={Inventory:[{Slot:103b,id:"minecraft:zombie_head"}]}]
team leave @a[team=SeeSkeleton,nbt=!{Inventory:[{Slot:103b,id:"minecraft:skeleton_skull"}]}]
team join SeeSkeleton @a[nbt={Inventory:[{Slot:103b,id:"minecraft:skeleton_skull"}]}]
team leave @a[team=SeeWither,nbt=!{Inventory:[{Slot:103b,id:"minecraft:wither_skeleton_skull"}]}]
team join SeeWither @a[nbt={Inventory:[{Slot:103b,id:"minecraft:wither_skeleton_skull"}]}]
team leave @a[team=SeeVillager,nbt=!{Inventory:[{Slot:103b,id:"minecraft:player_head"}]}]
team join SeeVillager @a[nbt={Inventory:[{Slot:103b,id:"minecraft:player_head"}]}]
team modify SeeCreeper seeFriendlyInvisibles true
team modify SeeCreeper collisionRule never
team modify SeeZombie seeFriendlyInvisibles true
team modify SeeZombie collisionRule never
team modify SeeSkeleton seeFriendlyInvisibles true
team modify SeeSkeleton collisionRule never
team modify SeeWither seeFriendlyInvisibles true
team modify SeeWither collisionRule never
team modify SeeVillager seeFriendlyInvisibles true
team modify SeeVillager collisionRule never
team modify NoCollision collisionRule never


################################################
# 1.13 BUG (KEEP IF NOT FIXED) -> BACK UP PLAN #
execute as @a[team=SeeCreeper] run effect give @e[type=creeper,team=SeeCreeper] glowing 1 255 true
execute as @a[team=SeeZombie] run effect give @e[type=zombie,team=SeeZombie] glowing 1 255 true
execute as @a[team=SeeSkeleton] run effect give @e[type=skeleton,team=SeeSkeleton] glowing 1 255 true
execute as @a[team=SeeWither] run effect give @e[type=wither_skeleton,team=SeeWither] glowing 1 255 true
execute as @a[team=SeeVillager] run effect give @e[type=villager,team=SeeVillager] glowing 1 255 true
################################################


# ROUND 4
execute if block 988 65 -3 birch_log run setblock 988 65 -3 air
execute if block 989 65 -6 dark_oak_log run setblock 989 65 -6 air
execute if block 990 65 -2 acacia_log run setblock 990 65 -2 air
execute if block 984 65 -2 spruce_log run setblock 984 65 -2 air
execute if block 982 65 -5 jungle_log run setblock 982 65 -5 air


execute if entity @e[scores={HopperRound=4,HopperSetup=20}] run summon item 982 64 -8 {Item:{id:"minecraft:spruce_sapling",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=4,HopperSetup=30}] run summon item 984 64 -8 {Item:{id:"minecraft:birch_sapling",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=4,HopperSetup=40}] run summon item 986 64 -8 {Item:{id:"minecraft:jungle_sapling",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=4,HopperSetup=45}] run summon item 988 64 -8 {Item:{id:"minecraft:acacia_sapling",Count:1b,tag:{HopperItem:1b}}}
execute if entity @e[scores={HopperRound=4,HopperSetup=50}] run summon item 990 64 -8 {Item:{id:"minecraft:dark_oak_sapling",Count:1b,tag:{HopperItem:1b}}}

execute if entity @e[scores={HopperRound=4,HopperSetup=70}] unless entity @e[tag=BirchMob] run summon villager 982 65 -10 {NoAI:1b,Age:-999999,Invulnerable:1b,VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:4},Tags:["BirchMob","SaplingMob","HopperMob"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=70}] unless entity @e[tag=DarkOakMob] run summon villager 984 65 -10 {NoAI:1b,Age:-999999,Invulnerable:1b,VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:4},Tags:["DarkOakMob","SaplingMob","HopperMob"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=70}] unless entity @e[tag=AcaciaMob] run summon villager 986 65 -10 {NoAI:1b,Age:-999999,Invulnerable:1b,VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:4},Tags:["AcaciaMob","SaplingMob","HopperMob"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=70}] unless entity @e[tag=SpruceMob] run summon villager 988 65 -10 {NoAI:1b,Age:-999999,Invulnerable:1b,VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:4},Tags:["SpruceMob","SaplingMob","HopperMob"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=70}] unless entity @e[tag=JungleMob] run summon villager 990 65 -10 {NoAI:1b,Age:-999999,Invulnerable:1b,VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:4},Tags:["JungleMob","SaplingMob","HopperMob"]}

#execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run setblock 984 65 -10 purple_glazed_terracotta
#execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run setblock 986 65 -10 white_glazed_terracotta
#execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run setblock 988 65 -10 light_blue_glazed_terracotta
#execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run setblock 990 65 -10 orange_glazed_terracotta

execute if entity @e[scores={HopperRound=4,HopperSetup=180}] run summon falling_block 982 140 -5 {BlockState:{Name:"minecraft:jungle_log"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2.0f,FallHurtMax:15,Tags:["HopperBlock"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=140}] run summon falling_block 990 140 -2 {BlockState:{Name:"minecraft:acacia_log"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2.0f,FallHurtMax:15,Tags:["HopperBlock"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=100}] run summon falling_block 988 140 -3 {BlockState:{Name:"minecraft:birch_log"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2.0f,FallHurtMax:15,Tags:["HopperBlock"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=120}] run summon falling_block 989 140 -6 {BlockState:{Name:"minecraft:dark_oak_log"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2.0f,FallHurtMax:15,Tags:["HopperBlock"]}
execute if entity @e[scores={HopperRound=4,HopperSetup=160}] run summon falling_block 984 140 -2 {BlockState:{Name:"minecraft:spruce_log"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2.0f,FallHurtMax:15,Tags:["HopperBlock"]}

#execute as @e[tag=HopperBlock] at @s if block ~ ~-1 ~ iron_block run playsound block.note_block.basedrum master @a
execute as @e[tag=HopperBlock] at @s if block ~ ~-1 ~ iron_block run playsound block.ladder.break master @a ~ ~ ~ 1 0.5 0
execute as @e[tag=HopperBlock] at @s if block ~ ~-1 ~ iron_block run playsound block.anvil.hit master @a ~ ~ ~ 1 0.5 0
#execute as @e[tag=HopperBlock] at @s if block ~ ~-1 ~ iron_block run playsound block.anvil.land master @a

scoreboard objectives add HopperEffect dummy
scoreboard players set @a HopperEffect 0

#blindness
#nausea
#slowness

#scoreboard objectives setdisplay sidebar HopperEffect

execute if block 988 64 -3 birch_log align xyz run scoreboard players set @a[x=988,y=66,z=-3,dx=0,dy=1,dz=0] HopperEffect 1
execute if block 989 64 -6 dark_oak_log align xyz run scoreboard players set @a[x=989,y=66,z=-6,dx=0,dy=1,dz=0] HopperEffect 2
execute if block 990 64 -2 acacia_log align xyz run scoreboard players set @a[x=990,y=66,z=-2,dx=0,dy=1,dz=0] HopperEffect 3
execute if block 984 64 -2 spruce_log align xyz run scoreboard players set @a[x=984,y=66,z=-2,dx=0,dy=1,dz=0] HopperEffect 4
execute if block 982 64 -5 jungle_log align xyz run scoreboard players set @a[x=982,y=66,z=-5,dx=0,dy=1,dz=0] HopperEffect 5

scoreboard objectives add SaplingTimer dummy
scoreboard players reset @a[scores={HopperEffect=0}] SaplingTimer
scoreboard players add @a[scores={HopperEffect=1..}] SaplingTimer 1

execute if entity @a[scores={SaplingTimer=3}] at @e[tag=SaplingMob] run playsound entity.villager.celebrate master @a ~ ~ ~ 1 1.4 0
execute if entity @a[scores={HopperEffect=1,SaplingTimer=3}] as @e[tag=SaplingMob] run data merge entity @s {VillagerData:{profession:"minecraft:mason",type:"minecraft:taiga",level:4}}
execute if entity @a[scores={HopperEffect=2,SaplingTimer=3}] as @e[tag=SaplingMob] run data merge entity @s {VillagerData:{profession:"minecraft:mason",type:"minecraft:swamp",level:4}}
execute if entity @a[scores={HopperEffect=3,SaplingTimer=3}] as @e[tag=SaplingMob] run data merge entity @s {VillagerData:{profession:"minecraft:mason",type:"minecraft:savanna",level:4}}
execute if entity @a[scores={HopperEffect=4,SaplingTimer=3}] as @e[tag=SaplingMob] run data merge entity @s {VillagerData:{profession:"minecraft:mason",type:"minecraft:snow",level:4}}
execute if entity @a[scores={HopperEffect=5,SaplingTimer=3}] as @e[tag=SaplingMob] run data merge entity @s {VillagerData:{profession:"minecraft:mason",type:"minecraft:jungle",level:4}}

execute as @e[tag=SaplingMob] at @s run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=SaplingMob] at @s run teleport @s ~ ~ ~ ~ 0

experience set @a[scores={HopperEffect=0}] 0 levels
experience set @a[scores={HopperEffect=0}] 0 points

execute if entity @e[scores={HopperRound=4,HopperSetup=..2000}] run effect give @a[scores={HopperEffect=1..5}] nausea 5 255 true
execute if entity @e[scores={HopperRound=4,HopperSetup=..2000}] run effect give @a[scores={HopperEffect=2..5}] slowness 5 3 true
execute if entity @e[scores={HopperRound=4,HopperSetup=..2000}] run effect give @a[scores={HopperEffect=3..5}] blindness 5 255 true
execute if entity @e[scores={HopperRound=4,HopperSetup=..2000}] run effect give @a[scores={HopperEffect=4..5}] speed 5 10 true
execute if entity @e[scores={HopperRound=4,HopperSetup=..2000}] run effect give @a[scores={HopperEffect=5}] absorption 5 4 true

execute if entity @e[scores={HopperRound=4,HopperSetup=2000..}] run effect give @a[scores={HopperEffect=1..5}] nausea 5 255
execute if entity @e[scores={HopperRound=4,HopperSetup=2000..}] run effect give @a[scores={HopperEffect=2..5}] slowness 5 3
execute if entity @e[scores={HopperRound=4,HopperSetup=2000..}] run effect give @a[scores={HopperEffect=3..5}] blindness 5 255
execute if entity @e[scores={HopperRound=4,HopperSetup=2000..}] run effect give @a[scores={HopperEffect=4..5}] speed 5 10
execute if entity @e[scores={HopperRound=4,HopperSetup=2000..}] run effect give @a[scores={HopperEffect=5}] absorption 5 4

execute if entity @e[scores={HopperRound=4,HopperSetup=3000..}] run experience set @a[scores={HopperEffect=1}] 1 levels
execute if entity @e[scores={HopperRound=4,HopperSetup=3000..}] run experience set @a[scores={HopperEffect=2}] 2 levels
execute if entity @e[scores={HopperRound=4,HopperSetup=3000..}] run experience set @a[scores={HopperEffect=3}] 3 levels
execute if entity @e[scores={HopperRound=4,HopperSetup=3000..}] run experience set @a[scores={HopperEffect=4}] 4 levels
execute if entity @e[scores={HopperRound=4,HopperSetup=3000..}] run experience set @a[scores={HopperEffect=5}] 5 levels

effect clear @a[scores={HopperEffect=0}] nausea
effect clear @a[scores={HopperEffect=0}] blindness
effect clear @a[scores={HopperEffect=0}] slowness
effect clear @a[scores={HopperEffect=0}] speed
effect clear @a[scores={HopperEffect=0}] absorption

scoreboard objectives remove HopperEffect

execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] at @e[tag=SaplingMob] run playsound entity.villager.no master @a ~ ~ ~ 1 1.4 0
execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] as @e[tag=BirchMob] run data merge entity @s {CustomName:"{\"text\":\"bmagnet\"}"}
execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] as @e[tag=DarkOakMob] run data merge entity @s {CustomName:"{\"text\":\"domagnet\"}"}
execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] as @e[tag=AcaciaMob] run data merge entity @s {CustomName:"{\"text\":\"amagnet\"}"}
execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] as @e[tag=SpruceMob] run data merge entity @s {CustomName:"{\"text\":\"smagnet\"}"}
execute if entity @e[scores={HopperRound=4,HopperSetup=3001}] as @e[tag=JungleMob] run data merge entity @s {CustomName:"{\"text\":\"jmagnet\"}"}

#scoreboard objectives setdisplay sidebar HopperSetup



#execute if entity @e[scores={HopperRound=4,HopperSetup=300}] run weather rain
#execute if entity @e[scores={HopperRound=4,HopperSetup=300}] at @a run playsound entity.lightning_bolt.thunder master @a


# ROUND 5 - BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE
execute if entity @e[scores={HopperRound=5,HopperSetup=20}] run summon item 982 64 -8 {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:13,Amplifier:0,Duration:40}],CustomPotionColor:7512056,display:{Name:"{\"text\":\"H.G. Wells' Scuba Juice\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"You\'re only a minute away","italic":"true","color":"red"}','{"text":"from adventure!™","italic":"true","color":"red"}']},HopperItem:1b}}}
execute if entity @e[scores={HopperRound=5,HopperSetup=30}] run summon item 984 64 -8 {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:12,Amplifier:0,Duration:80}],CustomPotionColor:16751621,display:{Name:"{\"text\":\"Dr. E. Brown's Tire Defense\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Safeguard your DeLorean this day!™","italic":"true","color":"red"}','{"text":"Recommended for speeds over 88 MpH.","italic":"true","color":"red"}']},HopperItem:1b}}}
execute if entity @e[scores={HopperRound=5,HopperSetup=40}] run summon item 986 64 -8 {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:10,Amplifier:0,Duration:21}],CustomPotionColor:11812351,display:{Name:"{\"text\":\"Elixer of Gallifrey\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Never settle for second best!™","italic":"true","color":"red"}','{"text":"If side effects occur, see Doctor","italic":"true","color":"red"}']},HopperItem:1b}}}
execute if entity @e[scores={HopperRound=5,HopperSetup=45}] run summon item 988 64 -8 {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:6,Amplifier:0,Duration:100}],CustomPotionColor:16777215,display:{Name:"{\"text\":\"Bill & Ted's Excellent Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"The most triumphant stuff","italic":"true","color":"red"}','{"text":"you\'ll drink all year!™","italic":"true","color":"red"}']},HopperItem:1b}}}
execute if entity @e[scores={HopperRound=5,HopperSetup=50}] run summon item 990 64 -8 {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:16,Amplifier:0,Duration:60}],CustomPotionColor:0,display:{Name:"{\"text\":\"Terminator Upgrade 101\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Apply hourly to living tissue","italic":"true","color":"red"}','{"text":"over metal endoskeleton.","italic":"true","color":"red"}']},HopperItem:1b}}}

execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run setblock 982 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"ms",Color:14},{Pattern:"ls",Color:0},{Pattern:"ts",Color:14},{Pattern:"bs",Color:14},{Pattern:"rs",Color:14},{Pattern:"bo",Color:0}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run setblock 984 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"ts",Color:14},{Pattern:"vhr",Color:0},{Pattern:"cs",Color:14},{Pattern:"bs",Color:14},{Pattern:"bo",Color:0}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run setblock 986 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"bs",Color:14},{Pattern:"drs",Color:14},{Pattern:"cbo",Color:0},{Pattern:"bl",Color:14},{Pattern:"ts",Color:14},{Pattern:"bo",Color:0}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run setblock 988 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"ts",Color:14},{Pattern:"mr",Color:0},{Pattern:"dls",Color:14},{Pattern:"bs",Color:14},{Pattern:"bo",Color:0}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run setblock 990 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"ls",Color:14},{Pattern:"hhb",Color:0},{Pattern:"rs",Color:14},{Pattern:"ms",Color:14},{Pattern:"bo",Color:0}]}

execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run fill 982 65 -10 990 65 -10 air
execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run playsound entity.ender_dragon.flap master @a 986 65 -10 1 1 0

execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run setblock 982 65 -10 black_banner[rotation=0]{Patterns:[{Pattern:"ms",Color:14},{Pattern:"ls",Color:15},{Pattern:"ts",Color:14},{Pattern:"bs",Color:14},{Pattern:"rs",Color:14},{Pattern:"bo",Color:15}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run setblock 984 65 -10 purple_banner[rotation=0]{Patterns:[{Pattern:"ts",Color:14},{Pattern:"vhr",Color:10},{Pattern:"cs",Color:14},{Pattern:"bs",Color:14},{Pattern:"bo",Color:10}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run setblock 986 65 -10 white_banner[rotation=0]{Patterns:[{Pattern:"bs",Color:14},{Pattern:"drs",Color:14},{Pattern:"cbo",Color:0},{Pattern:"bl",Color:14},{Pattern:"ts",Color:14},{Pattern:"bo",Color:0}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run setblock 988 65 -10 light_blue_banner[rotation=0]{Patterns:[{Pattern:"ts",Color:14},{Pattern:"mr",Color:3},{Pattern:"dls",Color:14},{Pattern:"bs",Color:14},{Pattern:"bo",Color:3}]}
execute if entity @e[scores={HopperRound=5,HopperSetup=2000}] run setblock 990 65 -10 orange_banner[rotation=0]{Patterns:[{Pattern:"ls",Color:14},{Pattern:"hhb",Color:1},{Pattern:"rs",Color:14},{Pattern:"ms",Color:14},{Pattern:"bo",Color:1}]}


# POP / ROUND SOUNDS
execute if entity @e[scores={HopperRound=..5,HopperSetup=20}] run playsound entity.item.pickup master @a 982 64 -8 1 1 0
execute if entity @e[scores={HopperRound=..5,HopperSetup=30}] run playsound entity.item.pickup master @a 984 64 -8 1 1 0
execute if entity @e[scores={HopperRound=..5,HopperSetup=40}] run playsound entity.item.pickup master @a 986 64 -8 1 1 0
execute if entity @e[scores={HopperRound=..5,HopperSetup=45}] run playsound entity.item.pickup master @a 988 64 -8 1 1 0
execute if entity @e[scores={HopperRound=..5,HopperSetup=50}] run playsound entity.item.pickup master @a 990 64 -8 1 1 0

execute if entity @e[scores={HopperRound=1..2,HopperSetup=70}] run playsound entity.enderman.teleport master @a 986 65 -10 1 1 0
execute if entity @e[scores={HopperRound=1,HopperSetup=70}] at @e[tag=HopperMob,type=!armor_stand] run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HopperRound=2,HopperSetup=70}] at @e[tag=HopperMob] run particle portal ~ ~0.3 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={HopperRound=3,HopperSetup=70}] run playsound enchant.thorns.hit master @a 986 65 -10 1 1 0
#execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run playsound block.metal.place master @a 986 65 -10 1 1 0
execute if entity @e[scores={HopperRound=4,HopperSetup=70}] run playsound entity.wandering_trader.yes master @a 986 65 -10 1 1.4 0
execute if entity @e[scores={HopperRound=5,HopperSetup=70}] run playsound entity.ender_dragon.flap master @a 986 65 -10 1 1 0


# DOORS OPEN
scoreboard objectives add HopperWin dummy
scoreboard players set @e[scores={HopperRound=0..5}] HopperWin 0
scoreboard players add @e[scores={HopperRound=6}] HopperWin 1
execute if entity @e[scores={HopperRound=6}] run data merge block 986 63 -6 {CustomName:"{\"text\":\"Hopper puzzle\"}",Lock:"\"text\":\"Muse-Unintended\""}
#scoreboard players add @e[scores={HopperWin=1..}] HopperWin 1
execute if entity @e[scores={HopperWin=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={HopperWin=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={HopperWin=70}] run fill 984 64 -8 993 65 1 clay replace redstone_block


# SWITCH TO END KEY
execute as @e[scores={HopperWin=70}] run setblock 979 65 -6 clay
execute as @e[scores={HopperWin=70}] run setblock 979 65 -6 command_block[facing=up]{auto:0b,TrackOutput:false}


# END
execute if entity @e[scores={HopperWin=70}] run scoreboard objectives remove HopperSetup
execute if entity @e[scores={HopperWin=70}] run scoreboard objectives remove HopperButton
execute if entity @e[scores={HopperWin=70}] run scoreboard objectives remove HopperCorrect
execute if entity @e[scores={HopperWin=70}] run scoreboard objectives remove HopperRound
execute as @e[scores={HopperWin=70}] run setblock 42 2 14 clay
execute as @e[scores={HopperWin=70}] run scoreboard objectives remove HopperWin

#[tag=MainPuzzleAEC]