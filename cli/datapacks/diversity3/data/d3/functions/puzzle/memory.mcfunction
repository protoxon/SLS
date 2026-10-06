####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 25 2017 / JULY 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a poison
effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar MemoryButton
#scoreboard objectives setdisplay sidebar MemorySetup
#scoreboard objectives setdisplay sidebar AECButton
#scoreboard objectives setdisplay sidebar MemoryMatch
#scoreboard objectives setdisplay sidebar GoodMemory
#scoreboard objectives setdisplay sidebar BadMemory
#scoreboard objectives setdisplay sidebar BlueStand
#scoreboard objectives setdisplay sidebar OrangeStand
#scoreboard objectives setdisplay sidebar BluePortal
#scoreboard objectives setdisplay sidebar OrangePortal


difficulty easy

# PLAYER SAVE FOR DROPPING INTO HOLE
execute align x align y align z run teleport @a[x=1017,y=60,z=25,dx=2,dy=1,dz=2,name=!qmagnet] 1013 64 21 315 0
kill @e[nbt={Item:{id:"minecraft:gray_carpet"}}]
kill @e[nbt={Item:{id:"minecraft:pink_carpet"}}]


# MAIN BUTTON RESET
scoreboard objectives add MemoryButton dummy
execute if block 1017 65 17 stone_button[powered=false] run scoreboard players set @e[tag=MainPuzzleAEC] MemoryButton 0
execute if block 1017 65 17 stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] MemoryButton 1

scoreboard objectives add MemorySetup dummy
execute if entity @e[scores={MemoryButton=1}] run scoreboard players set @e[tag=MainPuzzleAEC] MemorySetup 0
scoreboard players add @e[tag=MainPuzzleAEC] MemorySetup 1


# WALL SETUP ANIMATION
execute if entity @e[scores={MemorySetup=1}] run kill @e[tag=MemoryAEC]
execute if entity @e[scores={MemorySetup=1}] run kill @e[tag=MemoryMob]
execute if entity @e[scores={MemorySetup=1}] run fill 1020 65 18 1020 67 22 yellow_concrete
execute if entity @e[scores={MemorySetup=1}] run fill 1019 65 18 1019 67 22 air
execute if entity @e[scores={MemorySetup=1}] run fill 1010 65 28 1014 67 28 yellow_concrete
execute if entity @e[scores={MemorySetup=1}] run fill 1010 65 27 1014 67 27 air
execute if entity @e[scores={MemorySetup=1}] run setblock 1021 64 26 redstone_block
execute if entity @e[scores={MemorySetup=1}] run setblock 1018 64 29 redstone_block
execute if entity @e[scores={MemorySetup=1}] run scoreboard objectives remove AECButton


# GROUP 1 -> positive X
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 65 18 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 65 19 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 65 20 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 65 21 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 65 22 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 66 18 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 66 19 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 66 20 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 66 21 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 66 22 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 67 18 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 67 19 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 67 20 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 67 21 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1019 67 22 {Tags:["RandomMemoryAEC1","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}

# GROUP 2 -> positive Z
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1010 65 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1011 65 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1012 65 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1013 65 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1014 65 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1010 66 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1011 66 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1012 66 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1013 66 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1014 66 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1010 67 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1011 67 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1012 67 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1013 67 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=1}] run summon area_effect_cloud 1014 67 27 {Tags:["RandomMemoryAEC2","RandomMemoryAEC","MemoryAEC"],Duration:2147483647}

execute if entity @e[scores={MemorySetup=10}] run setblock 1020 67 18 black_terracotta
execute if entity @e[scores={MemorySetup=12}] run setblock 1020 66 18 black_terracotta
execute if entity @e[scores={MemorySetup=12}] run setblock 1020 67 19 black_terracotta
execute if entity @e[scores={MemorySetup=14}] run setblock 1020 65 18 black_terracotta
execute if entity @e[scores={MemorySetup=14}] run setblock 1020 66 19 black_terracotta
execute if entity @e[scores={MemorySetup=14}] run setblock 1020 67 20 black_terracotta
execute if entity @e[scores={MemorySetup=16}] run setblock 1020 65 19 black_terracotta
execute if entity @e[scores={MemorySetup=16}] run setblock 1020 66 20 black_terracotta
execute if entity @e[scores={MemorySetup=16}] run setblock 1020 67 21 black_terracotta
execute if entity @e[scores={MemorySetup=18}] run setblock 1020 65 20 black_terracotta
execute if entity @e[scores={MemorySetup=18}] run setblock 1020 66 21 black_terracotta
execute if entity @e[scores={MemorySetup=18}] run setblock 1020 67 22 black_terracotta
execute if entity @e[scores={MemorySetup=20}] run setblock 1020 65 21 black_terracotta
execute if entity @e[scores={MemorySetup=20}] run setblock 1020 66 22 black_terracotta
execute if entity @e[scores={MemorySetup=20}] run setblock 1020 65 22 black_terracotta

execute if entity @e[scores={MemorySetup=22}] run setblock 1014 67 28 black_terracotta
execute if entity @e[scores={MemorySetup=24}] run setblock 1014 66 28 black_terracotta
execute if entity @e[scores={MemorySetup=24}] run setblock 1013 67 28 black_terracotta
execute if entity @e[scores={MemorySetup=26}] run setblock 1014 65 28 black_terracotta
execute if entity @e[scores={MemorySetup=26}] run setblock 1013 66 28 black_terracotta
execute if entity @e[scores={MemorySetup=26}] run setblock 1012 67 28 black_terracotta
execute if entity @e[scores={MemorySetup=28}] run setblock 1013 65 28 black_terracotta
execute if entity @e[scores={MemorySetup=28}] run setblock 1012 66 28 black_terracotta
execute if entity @e[scores={MemorySetup=28}] run setblock 1011 67 28 black_terracotta
execute if entity @e[scores={MemorySetup=30}] run setblock 1012 65 28 black_terracotta
execute if entity @e[scores={MemorySetup=30}] run setblock 1011 66 28 black_terracotta
execute if entity @e[scores={MemorySetup=30}] run setblock 1010 67 28 black_terracotta
execute if entity @e[scores={MemorySetup=32}] run setblock 1011 65 28 black_terracotta
execute if entity @e[scores={MemorySetup=32}] run setblock 1010 66 28 black_terracotta
execute if entity @e[scores={MemorySetup=34}] run setblock 1010 65 28 black_terracotta

# SETS BUTTONS AT RANDOM PLACES
execute if entity @e[scores={MemorySetup=40}] run scoreboard objectives add AECButton dummy
scoreboard players add @e[tag=RandomMemoryAEC] AECButton 0
execute as @e[tag=RandomMemoryAEC] at @s if block ~ ~ ~ stone_button run scoreboard players set @s AECButton 1

execute if entity @e[scores={MemorySetup=44}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=48}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=52}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=56}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=60}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=64}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=68}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=72}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=76}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=80}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=84}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=88}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=92}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=96}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=100}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=104}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air
execute if entity @e[scores={MemorySetup=108}] at @e[tag=RandomMemoryAEC1,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=west] replace air

execute if entity @e[scores={MemorySetup=46}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=50}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=54}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=58}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=62}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=66}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=70}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=74}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=78}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=82}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=86}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=90}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=94}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=98}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=102}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=106}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air
execute if entity @e[scores={MemorySetup=110}] at @e[tag=RandomMemoryAEC2,scores={AECButton=0},sort=random,limit=1] run fill ~ ~ ~ ~ ~ ~ stone_button[facing=north] replace air


# BUTTON FILLING TUNE
execute if entity @e[scores={MemorySetup=45}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1 0
execute if entity @e[scores={MemorySetup=49}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.3 0
execute if entity @e[scores={MemorySetup=53}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.9 0
execute if entity @e[scores={MemorySetup=57}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.6 0
execute if entity @e[scores={MemorySetup=61}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.2 0
execute if entity @e[scores={MemorySetup=65}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.4 0
execute if entity @e[scores={MemorySetup=69}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.7 0
execute if entity @e[scores={MemorySetup=73}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.8 0
execute if entity @e[scores={MemorySetup=77}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.2 0
execute if entity @e[scores={MemorySetup=81}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.1 0
execute if entity @e[scores={MemorySetup=85}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.5 0
execute if entity @e[scores={MemorySetup=89}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.7 0
execute if entity @e[scores={MemorySetup=93}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.9 0
execute if entity @e[scores={MemorySetup=97}] run playsound block.note_block.bell master @a 1014 64 22 0.5 1.4 0
execute if entity @e[scores={MemorySetup=101}] run playsound block.note_block.bell master @a 1014 64 22 0.5 0.6 0

execute if entity @e[scores={MemorySetup=110}] run scoreboard objectives remove AECButton


# LIGHT BARS
execute if entity @e[scores={MemorySetup=116}] run setblock 1017 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=118}] run setblock 1017 63 24 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=118}] run setblock 1016 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=120}] run setblock 1017 63 23 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=120}] run setblock 1015 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=122}] run setblock 1017 63 22 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=122}] run setblock 1014 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=124}] run setblock 1017 63 21 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=124}] run setblock 1013 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=126}] run setblock 1017 63 20 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=126}] run setblock 1012 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=128}] run setblock 1017 63 19 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=128}] run setblock 1011 63 25 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=130}] run setblock 1017 63 18 redstone_lamp[lit=true]
execute if entity @e[scores={MemorySetup=130}] run setblock 1010 63 25 redstone_lamp[lit=true]


# REPLACES GROUP 1 RANDOMS WITH TAGGED (15 TOTAL)
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CaveSpiderAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=CaveSpiderAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CreeperAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=CreeperAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["DrownedAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=DrownedAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FoxAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=FoxAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["HuskAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=HuskAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["LlamaAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=LlamaAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["MooshroomAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=MooshroomAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PandaAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=PandaAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PigmanAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=PigmanAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PufferFishAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=PufferFishAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RabbitAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=RabbitAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SheepAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SheepAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SkeletonAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SkeletonAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SnowGolemAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SnowGolemAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["StrayAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=StrayAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["VindicatorAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=VindicatorAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["TraderAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=TraderAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC1,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ZombieAEC1","MemoryAEC","MemoryAEC1"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=ZombieAEC1] run kill @e[tag=RandomMemoryAEC1,sort=nearest,limit=1]


# REPLACES GROUP 2 RANDOMS WITH TAGGED (15 TOTAL)
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CaveSpiderAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=CaveSpiderAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CreeperAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=CreeperAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["DrownedAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=DrownedAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FoxAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=FoxAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["HuskAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=HuskAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["LlamaAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=LlamaAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["MooshroomAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=MooshroomAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

#execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PandaAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
#execute if entity @e[scores={MemorySetup=131}] at @e[tag=PandaAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PigmanAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=PigmanAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PufferFishAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=PufferFishAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RabbitAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=RabbitAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SheepAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SheepAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SkeletonAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SkeletonAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SnowGolemAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=SnowGolemAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["StrayAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=StrayAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["VindicatorAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=VindicatorAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["TraderAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=TraderAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]

execute if entity @e[scores={MemorySetup=131}] at @e[tag=RandomMemoryAEC2,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ZombieAEC2","MemoryAEC","MemoryAEC2"],Duration:2147483647}
execute if entity @e[scores={MemorySetup=131}] at @e[tag=ZombieAEC2] run kill @e[tag=RandomMemoryAEC2,sort=nearest,limit=1]


# ALTERED PISTON BOOST MECHANIC
execute align x align y align z at @e[tag=MemoryMob,x=1019,y=60,z=25,dx=0,dy=0,dz=0] run setblock 1021 64 26 clay
execute align x align y align z at @e[tag=MemoryMob,x=1017,y=60,z=27,dx=0,dy=0,dz=0] run setblock 1018 64 29 clay
execute align x align y align z run data merge entity @e[tag=MemoryMob,x=1019,y=60,z=25,dx=0,dy=0,dz=0,limit=1] {Motion:[0.0d,2.5d,0.0d]}
execute align x align y align z run data merge entity @e[tag=MemoryMob,x=1017,y=60,z=27,dx=0,dy=0,dz=0,limit=1] {Motion:[0.0d,2.5d,0.0d]}
execute align x align y align z at @e[tag=MemoryMob,x=1019,y=68,z=25,dx=0,dy=-0.1,dz=0] run fill 1021 64 26 1021 64 26 redstone_block replace clay
execute align x align y align z at @e[tag=MemoryMob,x=1017,y=68,z=27,dx=0,dy=-0.1,dz=0] run fill 1018 64 29 1018 64 29 redstone_block replace clay


# TELEPORT FIX FOR PUFFERFISH #
execute align x align y align z run tag @e[type=pufferfish,x=1019,y=67,z=25,dx=0,dy=0,dz=0] add PufferFix1
#teleport @e[tag=PufferFix1,nbt={OnGround:1b}] 1019 65 25
execute align x align y align z run teleport @e[tag=PufferFix1,x=1019,y=65,z=25,dx=0,dy=0,dz=0] 1019 65.2 25
execute align x align y align z run tag @e[type=pufferfish,x=1017,y=67,z=27,dx=0,dy=0,dz=0] add PufferFix2
#teleport @e[tag=PufferFix1,nbt={OnGround:1b}] 1017 65 27
execute align x align y align z run teleport @e[tag=PufferFix2,x=1017,y=65,z=27,dx=0,dy=0,dz=0] 1017 65.2 27
###############################

team add Memory
team modify Memory collisionRule never

execute at @e[type=sheep,tag=MemoryMob] run particle enchant ~ ~1.5 ~ 0 0 0 1 2


# MOB SELECTION 1
#execute at @e[tag=CaveSpiderAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
#execute at @e[tag=CaveSpiderAEC1] if block ~ ~ ~ stone_button[powered=true] run summon cave_spider 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
#execute at @e[tag=CaveSpiderAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=CreeperAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=CreeperAEC1] if block ~ ~ ~ stone_button[powered=true] run summon creeper 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=CreeperAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=DrownedAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=DrownedAEC1] if block ~ ~ ~ stone_button[powered=true] run summon drowned 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=DrownedAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=FoxAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=FoxAEC1] if block ~ ~ ~ stone_button[powered=true] run summon fox 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Type:"red",Team:Memory}
execute at @e[tag=FoxAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

#execute at @e[tag=HuskAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
#execute at @e[tag=HuskAEC1] if block ~ ~ ~ stone_button[powered=true] run summon husk 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
#execute at @e[tag=HuskAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=LlamaAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=LlamaAEC1] if block ~ ~ ~ stone_button[powered=true] run summon llama 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Age:-2147483648,DecorItem:{id:"minecraft:gray_carpet",Count:1b},Team:Memory}
execute at @e[tag=LlamaAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=MooshroomAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=MooshroomAEC1] if block ~ ~ ~ stone_button[powered=true] run summon mooshroom 1019 61 25 {Type:"red",Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=MooshroomAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

#execute at @e[tag=PandaAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
#execute at @e[tag=PandaAEC1] if block ~ ~ ~ stone_button[powered=true] run summon panda 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Age:-2147483648,MainGene:"lazy",HiddenGene:"lazy",Team:Memory}
#execute at @e[tag=PandaAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=PigmanAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=PigmanAEC1] if block ~ ~ ~ stone_button[powered=true] run summon zombie_pigman 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:carrot",Count:1b}],Team:Memory}
execute at @e[tag=PigmanAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=PufferFishAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=PufferFishAEC1] if block ~ ~ ~ stone_button[powered=true] run summon pufferfish 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],PuffState:2,Team:Memory}
execute at @e[tag=PufferFishAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=RabbitAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=RabbitAEC1] if block ~ ~ ~ stone_button[powered=true] run summon rabbit 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],RabbitType:99,Team:Memory}
execute at @e[tag=RabbitAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=SheepAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=SheepAEC1] if block ~ ~ ~ stone_button[powered=true] run summon sheep 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Color: 11b,CustomName:"{\"text\":\"BluePortal\",\"color\":\"white\"}",CustomNameVisible:true,Team:Memory}
execute at @e[tag=SheepAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=SkeletonAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=SkeletonAEC1] if block ~ ~ ~ stone_button[powered=true] run summon skeleton 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:zombie_head",Count:1b}],Team:Memory}
execute at @e[tag=SkeletonAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=SnowGolemAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=SnowGolemAEC1] if block ~ ~ ~ stone_button[powered=true] run summon snow_golem 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Pumpkin:false,Team:Memory}
execute at @e[tag=SnowGolemAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=StrayAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=StrayAEC1] if block ~ ~ ~ stone_button[powered=true] run summon stray 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=StrayAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=VindicatorAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=VindicatorAEC1] if block ~ ~ ~ stone_button[powered=true] run summon vindicator 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=VindicatorAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=TraderAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=TraderAEC1] if block ~ ~ ~ stone_button[powered=true] run summon wandering_trader 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Offers:{},Team:Memory}
execute at @e[tag=TraderAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air

execute at @e[tag=ZombieAEC1] if block ~ ~ ~ stone_button[powered=true] run setblock ~1 ~ ~ yellow_concrete
execute at @e[tag=ZombieAEC1] if block ~ ~ ~ stone_button[powered=true] run summon zombie 1019 61 25 {Invulnerable:true,Rotation:[90f,0f],Tags:["MemoryMob","MemoryMob1"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:skeleton_skull",Count:1b}],Team:Memory}
execute at @e[tag=ZombieAEC1] if block ~ ~ ~ stone_button[powered=true] run fill 1019 65 18 1019 67 22 air


# MOB SELECTION 2
#execute at @e[tag=CaveSpiderAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
#execute at @e[tag=CaveSpiderAEC2] if block ~ ~ ~ stone_button[powered=true] run summon cave_spider 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
#execute at @e[tag=CaveSpiderAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=CreeperAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=CreeperAEC2] if block ~ ~ ~ stone_button[powered=true] run summon creeper 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=CreeperAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=DrownedAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=DrownedAEC2] if block ~ ~ ~ stone_button[powered=true] run summon drowned 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=DrownedAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=FoxAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=FoxAEC2] if block ~ ~ ~ stone_button[powered=true] run summon fox 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Type:"snow",Team:Memory}
execute at @e[tag=FoxAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

#execute at @e[tag=HuskAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
#execute at @e[tag=HuskAEC2] if block ~ ~ ~ stone_button[powered=true] run summon husk 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
#execute at @e[tag=HuskAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=LlamaAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=LlamaAEC2] if block ~ ~ ~ stone_button[powered=true] run summon llama 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Age:-2147483648,DecorItem:{id:"minecraft:pink_carpet",Count:1b},Variant:2,Team:Memory}
execute at @e[tag=LlamaAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=MooshroomAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=MooshroomAEC2] if block ~ ~ ~ stone_button[powered=true] run summon mooshroom 1017 60 27 {Type:"brown",Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=MooshroomAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

#execute at @e[tag=PandaAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
#execute at @e[tag=PandaAEC2] if block ~ ~ ~ stone_button[powered=true] run summon panda 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Age:-2147483648,MainGene:"brown",HiddenGene:"brown",Team:Memory}
#execute at @e[tag=PandaAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=PigmanAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=PigmanAEC2] if block ~ ~ ~ stone_button[powered=true] run summon zombie_pigman 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:cake",Count:1b}],Team:Memory}
execute at @e[tag=PigmanAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=PufferFishAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=PufferFishAEC2] if block ~ ~ ~ stone_button[powered=true] run summon pufferfish 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],PuffState:2,Team:Memory}
execute at @e[tag=PufferFishAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=RabbitAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=RabbitAEC2] if block ~ ~ ~ stone_button[powered=true] run summon rabbit 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],RabbitType:3,CustomName:'{"text":"Toast"}',Team:Memory}
execute at @e[tag=RabbitAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=SheepAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=SheepAEC2] if block ~ ~ ~ stone_button[powered=true] run summon sheep 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Color: 1b,CustomName:"{\"text\":\"OrangePortal\",\"color\":\"white\"}",CustomNameVisible:true,Team:Memory}
execute at @e[tag=SheepAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=SkeletonAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=SkeletonAEC2] if block ~ ~ ~ stone_button[powered=true] run summon skeleton 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=SkeletonAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=SnowGolemAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=SnowGolemAEC2] if block ~ ~ ~ stone_button[powered=true] run summon snow_golem 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Pumpkin:true,Team:Memory}
execute at @e[tag=SnowGolemAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=StrayAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=StrayAEC2] if block ~ ~ ~ stone_button[powered=true] run summon stray 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=StrayAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=VindicatorAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=VindicatorAEC2] if block ~ ~ ~ stone_button[powered=true] run summon vindicator 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Memory}
execute at @e[tag=VindicatorAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=TraderAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=TraderAEC2] if block ~ ~ ~ stone_button[powered=true] run summon wandering_trader 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Age:-2147483648,Offers:{},Team:Memory}
execute at @e[tag=TraderAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air

execute at @e[tag=ZombieAEC2] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~1 yellow_concrete
execute at @e[tag=ZombieAEC2] if block ~ ~ ~ stone_button[powered=true] run summon zombie 1017 60 27 {Invulnerable:true,Rotation:[180f,0f],Tags:["MemoryMob","MemoryMob2"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:Memory}
execute at @e[tag=ZombieAEC2] if block ~ ~ ~ stone_button[powered=true] run fill 1010 65 27 1014 67 27 air


# TEST FOR TWO MOBS PRESENT
scoreboard objectives add MemoryMatch dummy
scoreboard players set @e[tag=MainPuzzleAEC] MemoryMatch -2
execute if entity @e[tag=MemoryMob1] run scoreboard players add @e[tag=MainPuzzleAEC] MemoryMatch 1
execute if entity @e[tag=MemoryMob2] run scoreboard players add @e[tag=MainPuzzleAEC] MemoryMatch 1


# TEST FOR MATCHES
execute if entity @e[tag=MemoryMob1,type=cave_spider] if entity @e[tag=MemoryMob2,type=cave_spider] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=creeper] if entity @e[tag=MemoryMob2,type=creeper] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=drowned] if entity @e[tag=MemoryMob2,type=drowned] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=fox] if entity @e[tag=MemoryMob2,type=fox] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=husk] if entity @e[tag=MemoryMob2,type=husk] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=llama] if entity @e[tag=MemoryMob2,type=llama] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=mooshroom] if entity @e[tag=MemoryMob2,type=mooshroom] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=panda] if entity @e[tag=MemoryMob2,type=panda] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=zombie_pigman] if entity @e[tag=MemoryMob2,type=zombie_pigman] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=pufferfish] if entity @e[tag=MemoryMob2,type=pufferfish] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=rabbit] if entity @e[tag=MemoryMob2,type=rabbit] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=sheep] if entity @e[tag=MemoryMob2,type=sheep] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=skeleton] if entity @e[tag=MemoryMob2,type=skeleton] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=snow_golem] if entity @e[tag=MemoryMob2,type=snow_golem] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=stray] if entity @e[tag=MemoryMob2,type=stray] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=vindicator] if entity @e[tag=MemoryMob2,type=vindicator] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=wandering_trader] if entity @e[tag=MemoryMob2,type=wandering_trader] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1
execute if entity @e[tag=MemoryMob1,type=zombie] if entity @e[tag=MemoryMob2,type=zombie] run scoreboard players set @e[scores={MemoryMatch=0}] MemoryMatch 1


# RUNS TIMER ON TWO MOBS
execute if entity @e[scores={MemoryMatch=0}] run scoreboard objectives add BadMemory dummy	
execute if entity @e[scores={MemoryMatch=1}] run scoreboard objectives add GoodMemory dummy
scoreboard players add @e[tag=MainPuzzleAEC] BadMemory 1
scoreboard players add @e[tag=MainPuzzleAEC] GoodMemory 1


# IF WRONG
execute if entity @e[scores={BadMemory=40}] run playsound entity.wither.hurt master @a 1018 65 26 0.7 0.7 0
execute if entity @e[scores={BadMemory=40}] run kill @e[tag=MemoryMob]
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 redstone_lamp at @e[tag=MemoryAEC1] run setblock ~1 ~ ~ black_terracotta
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 redstone_lamp at @e[tag=MemoryAEC1] run setblock ~ ~ ~ stone_button[facing=west]
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 redstone_lamp at @e[tag=MemoryAEC2] run setblock ~ ~ ~1 black_terracotta
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 redstone_lamp at @e[tag=MemoryAEC2] run setblock ~ ~ ~ stone_button[facing=north]
execute if entity @e[scores={BadMemory=80}] run playsound block.ender_chest.open master @a 1013 63 21 1 0.8 0


# BREAKS LAMPS
execute if entity @e[scores={BadMemory=80}] if block 1016 63 25 black_concrete if block 1017 63 25 redstone_lamp run setblock 1017 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 24 black_concrete if block 1016 63 25 redstone_lamp run setblock 1016 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1015 63 25 black_concrete if block 1017 63 24 redstone_lamp run setblock 1017 63 24 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 23 black_concrete if block 1015 63 25 redstone_lamp run setblock 1015 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1014 63 25 black_concrete if block 1017 63 23 redstone_lamp run setblock 1017 63 23 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 22 black_concrete if block 1014 63 25 redstone_lamp run setblock 1014 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1013 63 25 black_concrete if block 1017 63 22 redstone_lamp run setblock 1017 63 22 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 21 black_concrete if block 1013 63 25 redstone_lamp run setblock 1013 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1012 63 25 black_concrete if block 1017 63 21 redstone_lamp run setblock 1017 63 21 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 20 black_concrete if block 1012 63 25 redstone_lamp run setblock 1012 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1011 63 25 black_concrete if block 1017 63 20 redstone_lamp run setblock 1017 63 20 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 19 black_concrete if block 1011 63 25 redstone_lamp run setblock 1011 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1010 63 25 black_concrete if block 1017 63 19 redstone_lamp run setblock 1017 63 19 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 18 black_concrete if block 1010 63 25 redstone_lamp run setblock 1010 63 25 black_concrete destroy
execute if entity @e[scores={BadMemory=80}] if block 1017 63 18 redstone_lamp run setblock 1017 63 18 black_concrete destroy


# GAME OVER
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run setblock 37 2 14 clay
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run kill @e[tag=MemoryAEC]
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run kill @e[tag=MemoryMob]
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run fill 1019 65 18 1019 67 22 air
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run fill 1010 65 27 1014 67 27 air
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run fill 1020 65 18 1020 67 22 black_terracotta
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run fill 1010 65 28 1014 67 28 black_terracotta
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove MemoryButton
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove MemorySetup
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove AECButton
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove MemoryMatch
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove GoodMemory
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove BlueStand
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove OrangeStand
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove BluePortal
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run scoreboard objectives remove OrangePortal
execute if entity @e[scores={BadMemory=80}] if block 1017 63 25 black_concrete run team remove Memory
execute if entity @e[scores={BadMemory=80}] run scoreboard objectives remove BadMemory


# IF CORRECT -> KILLS AEC
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=cave_spider] run kill @e[tag=CaveSpiderAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=cave_spider] run kill @e[tag=CaveSpiderAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=creeper] run kill @e[tag=CreeperAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=creeper] run kill @e[tag=CreeperAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=drowned] run kill @e[tag=DrownedAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=drowned] run kill @e[tag=DrownedAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=fox] run kill @e[tag=FoxAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=fox] run kill @e[tag=FoxAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=husk] run kill @e[tag=HuskAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=husk] run kill @e[tag=HuskAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=llama] run kill @e[tag=LlamaAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=llama] run kill @e[tag=LlamaAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=mooshroom] run kill @e[tag=MooshroomAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=mooshroom] run kill @e[tag=MooshroomAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=panda] run kill @e[tag=PandaAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=panda] run kill @e[tag=PandaAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=zombie_pigman] run kill @e[tag=PigmanAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=zombie_pigman] run kill @e[tag=PigmanAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=pufferfish] run kill @e[tag=PufferFishAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=pufferfish] run kill @e[tag=PufferFishAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=rabbit] run kill @e[tag=RabbitAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=rabbit] run kill @e[tag=RabbitAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=sheep] run kill @e[tag=SheepAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=sheep] run kill @e[tag=SheepAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=skeleton] run kill @e[tag=SkeletonAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=skeleton] run kill @e[tag=SkeletonAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=snow_golem] run kill @e[tag=SnowGolemAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=snow_golem] run kill @e[tag=SnowGolemAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=stray] run kill @e[tag=StrayAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=stray] run kill @e[tag=StrayAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=vindicator] run kill @e[tag=VindicatorAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=vindicator] run kill @e[tag=VindicatorAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=wandering_trader] run kill @e[tag=TraderAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=wandering_trader] run kill @e[tag=TraderAEC2]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob1,type=zombie] run kill @e[tag=ZombieAEC1]
execute if entity @e[scores={GoodMemory=50}] if entity @e[tag=MemoryMob2,type=zombie] run kill @e[tag=ZombieAEC2]


# MATCH ANIMATION
execute if entity @e[scores={GoodMemory=30}] as @e[tag=MemoryMob1] run data merge entity @s {NoAI:true,Rotation:[90f,0f]}
execute if entity @e[scores={GoodMemory=30}] as @e[tag=MemoryMob2] run data merge entity @s {NoAI:true,Rotation:[180f,0f]}
execute if entity @e[scores={GoodMemory=30}] run tag @e remove PufferFix1
execute if entity @e[scores={GoodMemory=30}] run tag @e remove PufferFix2
execute if entity @e[scores={GoodMemory=30}] run playsound block.portal.trigger master @a 1017 65 25 0.5 0.9 0
execute if entity @e[scores={GoodMemory=40..90}] at @e[tag=MemoryMob] run particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 1
execute if entity @e[scores={GoodMemory=40..120}] as @e[tag=MemoryMob1] at @s run teleport @s ~ ~ ~ ~-30 ~
execute if entity @e[scores={GoodMemory=40..120}] as @e[tag=MemoryMob2] at @s run teleport @s ~ ~ ~ ~30 ~
execute if entity @e[scores={GoodMemory=50..120}] as @e[tag=MemoryMob1] at @s run teleport @s ~-0.03 ~ ~ ~ ~
execute if entity @e[scores={GoodMemory=50..120}] as @e[tag=MemoryMob2] at @s run teleport @s ~ ~ ~-0.03 ~ ~
execute if entity @e[scores={GoodMemory=120..125}] as @e[tag=MemoryMob] at @s run teleport @s 1017 65 25
execute if entity @e[scores={GoodMemory=125}] run playsound entity.wither.shoot master @a 1017 65 25 1 1.3 0
execute if entity @e[scores={GoodMemory=125..}] at @e[tag=MemoryMob] run particle heart 1017 ~-1 25 0.1 0.5 0.1 0 1
execute if entity @e[scores={GoodMemory=125..}] as @e[tag=MemoryMob] at @s run teleport @s 1017 ~1 25
execute align x align y align z at @e[tag=MemoryMob,type=!creeper,x=1017,y=95,z=25,dx=0,dy=0,dz=0] run summon firework_rocket ~ ~1 ~ {LifeTime:-3,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:0b,Explosions:[{Type:1b,Colors:[I;16711680]}]}}},Life:-3}
execute align x align y align z at @e[tag=MemoryMob2,type=creeper,x=1017,y=95,z=25,dx=0,dy=0,dz=0] run summon firework_rocket ~ ~1 ~ {LifeTime:-3,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:0b,Explosions:[{Type:3b,Colors:[I;16711680]}]}}},Life:-3}
execute align x align y align z at @e[tag=MemoryMob,x=1017,y=95,z=25,dx=0,dy=0,dz=0] run playsound entity.lightning_bolt.impact master @a 1017 97 25 1 0.7 1
execute align x align y align z run kill @e[tag=MemoryMob,x=1017,y=95,z=25,dx=0,dy=0,dz=0]


# REPLACES LAMPS -> REMOVE THESE IF TOO EASY
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 18 black_concrete run playsound block.note_block.pling master @a 1013 63 21 1 0.8 0
execute if entity @e[scores={GoodMemory=195}] if block 1010 63 25 redstone_lamp run fill 1017 63 18 1017 63 18 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 19 redstone_lamp run fill 1010 63 25 1010 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1011 63 25 redstone_lamp run fill 1017 63 19 1017 63 19 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 20 redstone_lamp run fill 1011 63 25 1011 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1012 63 25 redstone_lamp run fill 1017 63 20 1017 63 20 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 21 redstone_lamp run fill 1012 63 25 1012 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1013 63 25 redstone_lamp run fill 1017 63 21 1017 63 21 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 22 redstone_lamp run fill 1013 63 25 1013 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1014 63 25 redstone_lamp run fill 1017 63 22 1017 63 22 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 23 redstone_lamp run fill 1014 63 25 1014 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1015 63 25 redstone_lamp run fill 1017 63 23 1017 63 23 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 24 redstone_lamp run fill 1015 63 25 1015 63 25 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1016 63 25 redstone_lamp run fill 1017 63 24 1017 63 24 redstone_lamp[lit=true] replace black_concrete
execute if entity @e[scores={GoodMemory=195}] if block 1017 63 25 redstone_lamp run fill 1016 63 25 1016 63 25 redstone_lamp[lit=true] replace black_concrete

execute if entity @e[scores={GoodMemory=195}] at @e[tag=MemoryAEC1] run setblock ~ ~ ~ stone_button[facing=west]
execute if entity @e[scores={GoodMemory=195}] at @e[tag=MemoryAEC2] run setblock ~ ~ ~ stone_button[facing=north]
execute if entity @e[tag=MemoryAEC] if entity @e[scores={GoodMemory=195..}] run scoreboard objectives remove GoodMemory

# FOXES
execute as @e[type=fox,tag=MemoryMob,nbt={Sleeping:1b}] run data merge entity @s {Sleeping:0b}

# PANDAS
#execute if entity @e[scores={MemoryMatch=-2..-1}] as @e[type=panda,tag=MemoryMob1] align xyz unless entity @s[x=1019,y=61,z=25,dx=0,dy=8,dz=0] run teleport @s 1019 65 25
#execute if entity @e[scores={MemoryMatch=-2..-1}] as @e[type=panda,tag=MemoryMob2] align xyz unless entity @s[x=1017,y=61,z=27,dx=0,dy=8,dz=0] run teleport @s 1017 65 27

# PORTAL SHEEP EASTER EGG ##########################################################

advancement grant @a[scores={BluePortal=2..}] only d3:folder_c/portal_sheep
advancement grant @a[scores={OrangePortal=2..}] only d3:folder_c/portal_sheep

scoreboard objectives add BlueStand dummy
scoreboard objectives add OrangeStand dummy
scoreboard players set @e[tag=MainPuzzleAEC] BlueStand 0
scoreboard players set @e[tag=MainPuzzleAEC] OrangeStand 0
execute if entity @e[tag=BlueStand] run scoreboard players set @e[tag=MainPuzzleAEC] BlueStand 1
execute if entity @e[tag=OrangeStand] run scoreboard players set @e[tag=MainPuzzleAEC] OrangeStand 1

scoreboard objectives add BluePortal dummy
scoreboard objectives add OrangePortal dummy

scoreboard players add @a BluePortal 0
scoreboard players add @a OrangePortal 0

execute align x align y align z as @e[type=sheep,tag=MemoryMob2,x=1017,y=65,z=25,dx=0,dy=2,dz=2] align x align y align z at @e[type=sheep,tag=MemoryMob1,x=1017,y=65,z=25,dx=2,dy=2,dz=0] align x align y align z as @a[dx=0,dy=0,dz=0] at @s run scoreboard players set @s[scores={BluePortal=0}] BluePortal 1
scoreboard players add @a[scores={BluePortal=1..}] BluePortal 1
scoreboard players set @a[scores={BluePortal=1..}] OrangePortal -1
scoreboard players set @a[scores={BluePortal=13}] BluePortal 0
scoreboard players set @a[scores={BluePortal=0}] OrangePortal 0

execute align x align y align z as @e[type=sheep,tag=MemoryMob1,x=1017,y=65,z=25,dx=2,dy=2,dz=0] align x align y align z at @e[type=sheep,tag=MemoryMob2,x=1017,y=65,z=25,dx=0,dy=2,dz=2] align x align y align z as @a[dx=0,dy=0,dz=0] at @s run scoreboard players set @s[scores={OrangePortal=0}] OrangePortal 1
scoreboard players add @a[scores={OrangePortal=1..}] OrangePortal 1
scoreboard players set @a[scores={OrangePortal=1..}] BluePortal -1
scoreboard players set @a[scores={OrangePortal=13}] OrangePortal 0
scoreboard players set @a[scores={OrangePortal=0}] BluePortal 0

execute if entity @a[scores={BluePortal=2}] run playsound entity.enderman.teleport master @a 1018 65 26 0.5 1 0
execute if entity @a[scores={OrangePortal=2}] run playsound entity.enderman.teleport master @a 1018 65 26 0.5 1 0

execute align x align y align z as @a[scores={BluePortal=3}] at @s run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a
execute align x align y align z as @a[scores={OrangePortal=3}] at @s run particle portal ~ ~ ~ 0.2 0.2 0.2 0.5 20 force @a


execute if entity @e[scores={OrangeStand=0}] if entity @a[scores={OrangePortal=2}] at @e[tag=MemoryMob1] run summon armor_stand ~ ~ ~ {Tags:["OrangeStand"],Motion:[-1.0d,0.2d,0.0d],DisabledSlots:2039583,Invisible:true}
execute if entity @e[scores={BlueStand=0}] if entity @a[scores={BluePortal=2}] at @e[tag=MemoryMob2] run summon armor_stand ~ ~ ~ {Tags:["BlueStand"],Motion:[0.0d,0.2d,-1.0d],DisabledSlots:2039583,Invisible:true}

execute if entity @a[scores={BluePortal=12}] run kill @e[tag=BlueStand]
execute if entity @a[scores={OrangePortal=12}] run kill @e[tag=OrangeStand]

execute at @e[tag=BlueStand] run teleport @a[scores={BluePortal=1..}] ~ ~ ~
execute at @e[tag=OrangeStand] run teleport @a[scores={OrangePortal=1..}] ~ ~ ~

execute as @e[scores={BluePortal=2}] at @s run teleport @s ~ ~0.2 ~ ~270 ~
execute as @e[scores={OrangePortal=2}] at @s run teleport @s ~ ~0.2 ~ ~90 ~

execute as @a[scores={BluePortal=12}] at @s run teleport ~ ~0.5 ~
execute as @a[scores={OrangePortal=12}] at @s run teleport ~ ~0.5 ~

# NEXT LINE FOR TESTING SHEEP 
#scoreboard players set @e[tag=MainPuzzleAEC] GoodMemory 0

####################################################################################




# DOORS OPEN
execute if entity @e[scores={GoodMemory=247}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={GoodMemory=250}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={GoodMemory=265}] run fill 1007 64 15 1016 65 24 clay replace redstone_block


# SWITCH TO END KEY
execute as @e[scores={GoodMemory=265}] run setblock 1021 65 15 clay
execute as @e[scores={GoodMemory=265}] run setblock 1021 65 15 chain_command_block[facing=up]{auto:1b,TrackOutput:false}


# END
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove MemoryButton
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove MemorySetup
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove AECButton
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove MemoryMatch
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove BadMemory
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove BlueStand
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove OrangeStand
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove BluePortal
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove OrangePortal
execute as @e[scores={GoodMemory=265}] run team remove Memory
execute as @e[scores={GoodMemory=265}] run setblock 37 2 14 clay
execute as @e[scores={GoodMemory=265}] run scoreboard objectives remove GoodMemory


#[tag=MainPuzzleAEC]