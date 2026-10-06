####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 25 2017 / SEPTEMBER 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

difficulty easy

scoreboard objectives add SetupFloor dummy
scoreboard objectives add MatchFloorWin dummy
scoreboard objectives add HasStar dummy
scoreboard objectives add FloorBlock dummy
scoreboard objectives add KillFloor1 dummy
scoreboard objectives add KillFloor2 dummy
scoreboard objectives add KillFloor3 dummy
scoreboard objectives add KillFloor4 dummy
scoreboard objectives add MatchHint dummy

#scoreboard objectives setdisplay sidebar SetupFloor
#scoreboard objectives setdisplay sidebar MatchFloorWin
#scoreboard objectives setdisplay sidebar HasStar
#scoreboard objectives setdisplay sidebar FloorBlock
#scoreboard objectives setdisplay sidebar KillFloor1
#scoreboard objectives setdisplay sidebar KillFloor2
#scoreboard objectives setdisplay sidebar KillFloor3
#scoreboard objectives setdisplay sidebar KillFloor4
#scoreboard objectives setdisplay sidebar MatchHint

scoreboard players add @e[tag=MainPuzzleAEC] SetupFloor 0


# RANDOMIZED FLOOR START UP
kill @e[tag=MatchFloorAEC]
execute if entity @e[scores={SetupFloor=0}] run summon area_effect_cloud 44 5 14 {Tags:["MatchFloorAEC","BlackMatchFloorAEC"],Duration:2147483647}
execute if entity @e[scores={SetupFloor=0}] run summon area_effect_cloud 44 6 14 {Tags:["MatchFloorAEC","PurpleMatchFloorAEC"],Duration:2147483647}
execute if entity @e[scores={SetupFloor=0}] run setblock 44 5 14 black_terracotta
execute if entity @e[scores={SetupFloor=0}] run setblock 44 6 14 purple_concrete

# FLOOR 1
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 12 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 12 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 12 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 12 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 12 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 12 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 12 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 12 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 12 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 12 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 12 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 12 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 12 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 12 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 12 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 12 15

# FLOOR 2
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 14 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 14 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 14 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 14 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 14 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 14 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 14 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 14 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 14 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 14 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 14 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 14 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 14 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 14 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 14 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 14 15

# FLOOR 3
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 16 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 16 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 16 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 16 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 16 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 16 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 16 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 16 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 16 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 16 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 16 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 16 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 16 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 16 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 16 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 16 15

# FLOOR 4
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 18 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 18 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 18 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 44 18 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 18 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 18 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 18 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 45 18 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 18 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 18 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 18 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 46 18 15
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 18 12
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 18 13
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 18 14
execute at @e[tag=MatchFloorAEC,sort=random,limit=1] run clone ~ ~ ~ ~ ~ ~ 47 18 15

scoreboard players set @e[tag=MainPuzzleAEC] SetupFloor 1


# SETS UP STAR HOLDER
scoreboard players set @a[nbt=!{SelectedItem:{id:"minecraft:nether_star"}}] HasStar 0
execute align x align y align z run scoreboard players set @a[x=981,y=64,z=17,dx=10,dy=1,dz=10,nbt={SelectedItem:{id:"minecraft:nether_star"}}] HasStar 1
execute if entity @e[scores={MatchFloorWin=1..}] run scoreboard players set @a HasStar 2


# CHECKS FOR PLAYER WITH NO STAR ON FLOOR
scoreboard players set @e[tag=MainPuzzleAEC] KillFloor1 1
execute if blocks 982 63 18 985 63 21 44 10 12 all run scoreboard players set @e[tag=MainPuzzleAEC] KillFloor1 0
scoreboard players set @e[tag=MainPuzzleAEC] KillFloor2 1
execute if blocks 982 63 23 985 63 26 44 10 12 all run scoreboard players set @e[tag=MainPuzzleAEC] KillFloor2 0
scoreboard players set @e[tag=MainPuzzleAEC] KillFloor3 1
execute if blocks 987 63 18 990 63 21 44 10 12 all run scoreboard players set @e[tag=MainPuzzleAEC] KillFloor3 0
scoreboard players set @e[tag=MainPuzzleAEC] KillFloor4 1
execute if blocks 987 63 23 990 63 26 44 10 12 all run scoreboard players set @e[tag=MainPuzzleAEC] KillFloor4 0


# KILLS FLOOR PORTION IF NO STAR
execute as @a[scores={HasStar=0},x=982.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor1=1}] run playsound block.redstone_torch.burnout master @a 983 63 19
execute as @a[scores={HasStar=0},x=982.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor1=1}] run particle smoke 984.0 63.8 20.0 1 0.2 1 0 200 force @a
execute as @a[scores={HasStar=0},x=982.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s run fill 982 63 18 985 63 21 black_terracotta replace purple_concrete
execute as @a[scores={HasStar=0},x=982.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s run fill 982 63 18 985 63 21 black_terracotta replace air

execute as @a[scores={HasStar=0},x=982.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor2=1}] run playsound block.redstone_torch.burnout master @a 983 63 24
execute as @a[scores={HasStar=0},x=982.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor2=1}] run particle smoke 984.0 63.8 25.0 1 0.2 1 0 200 force @a
execute as @a[scores={HasStar=0},x=982.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s run fill 982 63 23 985 63 26 black_terracotta replace purple_concrete
execute as @a[scores={HasStar=0},x=982.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s run fill 982 63 23 985 63 26 black_terracotta replace air

execute as @a[scores={HasStar=0},x=987.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor3=1}] run playsound block.redstone_torch.burnout master @a 988 63 19
execute as @a[scores={HasStar=0},x=987.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor3=1}] run particle smoke 989.0 63.8 20.0 1 0.2 1 0 200 force @a
execute as @a[scores={HasStar=0},x=987.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s run fill 987 63 18 990 63 21 black_terracotta replace purple_concrete
execute as @a[scores={HasStar=0},x=987.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] at @s run fill 987 63 18 990 63 21 black_terracotta replace air

execute as @a[scores={HasStar=0},x=987.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor4=1}] run playsound block.redstone_torch.burnout master @a 988 63 24
execute as @a[scores={HasStar=0},x=987.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s if entity @e[scores={KillFloor4=1}] run particle smoke 989.0 63.8 25.0 1 0.2 1 0 200 force @a
execute as @a[scores={HasStar=0},x=987.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s run fill 987 63 23 990 63 26 black_terracotta replace purple_concrete
execute as @a[scores={HasStar=0},x=987.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] at @s run fill 987 63 23 990 63 26 black_terracotta replace air


# SWITCHES BLOCK FOR STAR HOLDER
scoreboard players reset @a[scores={HasStar=0}] FloorBlock
#scoreboard players set @a[scores={HasStar=1}] FloorBlock 0

#execute as @a[scores={HasStar=1}] at @s if block ~ ~-1 ~ black_terracotta run scoreboard players add @a[scores={HasStar=1}] FloorBlock 1
#execute as @a[scores={HasStar=1}] at @s if block ~ ~-1 ~ purple_concrete run scoreboard players add @a[scores={HasStar=1}] FloorBlock 1

execute as @a[scores={HasStar=1}] at @s if block ~ ~-1 ~ air run scoreboard players set @a[scores={HasStar=1}] FloorBlock 0
execute as @a[scores={HasStar=1}] at @s if block ~ ~-1 ~ iron_block run scoreboard players set @a[scores={HasStar=1}] FloorBlock 0

execute as @a[scores={HasStar=1}] at @s if block ~ ~-2 ~ purpur_block run scoreboard players set @a[scores={HasStar=1}] FloorBlock 0
execute as @a[scores={HasStar=1}] at @s run fill ~ ~-2 ~ ~ ~-2 ~ end_stone_bricks replace purpur_block
execute as @a[scores={HasStar=1}] at @s run fill ~-1 ~-2 ~-1 ~1 ~-2 ~-1 purpur_block replace end_stone_bricks
execute as @a[scores={HasStar=1}] at @s run fill ~-1 ~-2 ~1 ~1 ~-2 ~1 purpur_block replace end_stone_bricks
execute as @a[scores={HasStar=1}] at @s run fill ~-1 ~-2 ~ ~-1 ~-2 ~ purpur_block replace end_stone_bricks
execute as @a[scores={HasStar=1}] at @s run fill ~1 ~-2 ~ ~1 ~-2 ~ purpur_block replace end_stone_bricks
execute as @a[scores={HasStar=1}] at @s if block ~ ~-2 ~ end_stone_bricks run scoreboard players add @a[scores={HasStar=1}] FloorBlock 1


# PURPLE TO BLACK
execute as @a[scores={FloorBlock=1}] at @s if block ~ ~-1 ~ purple_concrete run tag @s add FoundPurple
execute as @a[tag=FoundPurple,scores={FloorBlock=1}] at @s run fill ~ ~-1 ~ ~ ~-1 ~ black_terracotta replace purple_concrete
execute as @a[tag=FoundPurple,scores={FloorBlock=1}] at @s run playsound block.note_block.xylophone master @a ~ ~ ~ 0.5 0.5 0
scoreboard players set @a[tag=FoundPurple] FloorBlock 100
tag @a remove FoundPurple

# BLACK TO PURPLE
execute as @a[scores={FloorBlock=1}] at @s if block ~ ~-1 ~ black_terracotta run tag @s add FoundBlack
execute as @a[tag=FoundBlack,scores={FloorBlock=1}] at @s run fill ~ ~-1 ~ ~ ~-1 ~ purple_concrete replace black_terracotta
execute as @a[tag=FoundBlack,scores={FloorBlock=1}] at @s run playsound block.note_block.xylophone master @a ~ ~ ~ 0.5 0.7 0
scoreboard players set @a[tag=FoundBlack] FloorBlock 100
tag @a remove FoundBlack


# SHOWS THE CLUE
# FLOOR 1 - clone 44 12 12 47 12 15 982 68 18
# FLOOR 2 - clone 44 14 12 47 14 15 982 68 23
# FLOOR 3 - clone 44 16 12 47 16 15 987 68 18
# FLOOR 4 - clone 44 18 12 47 18 15 987 68 23

scoreboard players reset @a MatchHint
scoreboard players set @a[x=982.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] MatchHint 0
scoreboard players set @a[x=982.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] MatchHint 0
scoreboard players set @a[x=987.3,y=64,z=18.3,dx=2.4,dy=0,dz=2.4] MatchHint 0
scoreboard players set @a[x=987.3,y=64,z=23.3,dx=2.4,dy=0,dz=2.4] MatchHint 0

execute as @a[scores={MatchHint=0}] run fill 982 68 18 990 68 26 air replace purple_concrete
execute as @a[scores={MatchHint=0}] run fill 982 68 18 990 68 26 air replace black_terracotta

scoreboard players set @a[scores={HasStar=1},x=983.3,y=64,z=19.3,dx=0.4,dy=1,dz=0.4] MatchHint 1
scoreboard players set @a[scores={HasStar=1},x=983.3,y=64,z=24.3,dx=0.4,dy=1,dz=0.4] MatchHint 2
scoreboard players set @a[scores={HasStar=1},x=988.3,y=64,z=19.3,dx=0.4,dy=1,dz=0.4] MatchHint 3
scoreboard players set @a[scores={HasStar=1},x=988.3,y=64,z=24.3,dx=0.4,dy=1,dz=0.4] MatchHint 4

execute as @a[scores={MatchHint=1}] run clone 44 18 12 47 18 15 987 68 23
execute as @a[scores={MatchHint=2}] run clone 44 16 12 47 16 15 987 68 18
execute as @a[scores={MatchHint=3}] run clone 44 14 12 47 14 15 982 68 23
execute as @a[scores={MatchHint=4}] run clone 44 12 12 47 12 15 982 68 18

# NEW CHICKEN HINT
execute unless entity @a[scores={MatchHint=1}] if entity @e[tag=MatchChicken1] as @e[tag=MatchChicken1] at @s run teleport @s ~ ~-100 ~
execute unless entity @a[scores={MatchHint=2}] if entity @e[tag=MatchChicken2] as @e[tag=MatchChicken2] at @s run teleport @s ~ ~-100 ~
execute unless entity @a[scores={MatchHint=3}] if entity @e[tag=MatchChicken3] as @e[tag=MatchChicken3] at @s run teleport @s ~ ~-100 ~
execute unless entity @a[scores={MatchHint=4}] if entity @e[tag=MatchChicken4] as @e[tag=MatchChicken4] at @s run teleport @s ~ ~-100 ~

execute if entity @a[scores={MatchHint=1}] unless entity @e[tag=MatchChicken1] run summon endermite 989.0 68.5 25.0 {Glowing:1,NoAI:1b,Invulnerable:1b,Tags:["MatchChicken1","MatchChicken"]}
execute if entity @a[scores={MatchHint=2}] unless entity @e[tag=MatchChicken2] run summon endermite 989.0 68.5 20.0 {Glowing:1,NoAI:1b,Invulnerable:1b,Tags:["MatchChicken2","MatchChicken"]}
execute if entity @a[scores={MatchHint=3}] unless entity @e[tag=MatchChicken3] run summon endermite 984.0 68.5 25.0 {Glowing:1,NoAI:1b,Invulnerable:1b,Tags:["MatchChicken3","MatchChicken"]}
execute if entity @a[scores={MatchHint=4}] unless entity @e[tag=MatchChicken4] run summon endermite 984.0 68.5 20.0 {Glowing:1,NoAI:1b,Invulnerable:1b,Tags:["MatchChicken4","MatchChicken"]}


# 1.14 CLARIFIES CORRECT QUARTER
execute unless blocks 44 12 12 47 12 15 982 63 18 all unless block 980 68 16 black_terracotta run setblock 980 68 16 black_terracotta
execute if blocks 44 12 12 47 12 15 982 63 18 all if block 980 68 16 black_terracotta run particle dragon_breath 984.0 63.8 20.0 0.8 0.3 0.8 0 100 force @a
execute if blocks 44 12 12 47 12 15 982 63 18 all if block 980 68 16 black_terracotta run playsound block.bell.use block @a 984 53 20 0.5 1 0
execute if blocks 44 12 12 47 12 15 982 63 18 all unless block 980 68 16 purple_concrete run setblock 980 68 16 purple_concrete

execute unless blocks 44 14 12 47 14 15 982 63 23 all unless block 980 68 28 black_terracotta run setblock 980 68 28 black_terracotta
execute if blocks 44 14 12 47 14 15 982 63 23 all if block 980 68 28 black_terracotta run particle dragon_breath 984.0 63.8 25.0 0.8 0.3 0.8 0 100 force @a
execute if blocks 44 14 12 47 14 15 982 63 23 all if block 980 68 28 black_terracotta run playsound block.bell.use block @a 984 53 24 0.5 1 0
execute if blocks 44 14 12 47 14 15 982 63 23 all unless block 980 68 28 purple_concrete run setblock 980 68 28 purple_concrete

execute unless blocks 44 16 12 47 16 15 987 63 18 all unless block 992 68 16 black_terracotta run setblock 992 68 16 black_terracotta
execute if blocks 44 16 12 47 16 15 987 63 18 all if block 992 68 16 black_terracotta run particle dragon_breath 989.0 63.8 20.0 0.8 0.3 0.8 0 100 force @a
execute if blocks 44 16 12 47 16 15 987 63 18 all if block 992 68 16 black_terracotta run playsound block.bell.use block @a 988 53 20 0.5 1 0
execute if blocks 44 16 12 47 16 15 987 63 18 all unless block 992 68 16 purple_concrete run setblock 992 68 16 purple_concrete

execute unless blocks 44 18 12 47 18 15 987 63 23 all unless block 992 68 28 black_terracotta run setblock 992 68 28 black_terracotta
execute if blocks 44 18 12 47 18 15 987 63 23 all if block 992 68 28 black_terracotta run particle dragon_breath 989.0 63.8 25.0 0.8 0.3 0.8 0 100 force @a
execute if blocks 44 18 12 47 18 15 987 63 23 all if block 992 68 28 black_terracotta run playsound block.bell.use block @a 988 53 24 0.5 1 0
execute if blocks 44 18 12 47 18 15 987 63 23 all unless block 992 68 28 purple_concrete run setblock 992 68 28 purple_concrete


# TESTS FOR THE WIN
execute if blocks 44 12 12 47 12 15 982 63 18 all if blocks 44 14 12 47 14 15 982 63 23 all if blocks 44 16 12 47 16 15 987 63 18 all if blocks 44 18 12 47 18 15 987 63 23 all run scoreboard players add @e[tag=MainPuzzleAEC] MatchFloorWin 1

execute if entity @e[scores={MatchFloorWin=52..}] run fill 982 68 18 990 68 26 air

# DOORS OPEN
execute if entity @e[scores={MatchFloorWin=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={MatchFloorWin=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={MatchFloorWin=70}] run fill 984 64 15 993 66 24 clay replace redstone_block


# SWITCH TO END KEY
execute as @e[scores={MatchFloorWin=70}] run setblock 986 65 29 clay
execute as @e[scores={MatchFloorWin=70}] run setblock 986 65 29 command_block[facing=up]{auto:0b,TrackOutput:false}


# END
execute if entity @e[scores={MatchFloorWin=70}] run clear @a nether_star
execute if entity @e[scores={MatchFloorWin=70}] run setblock 44 2 14 clay
execute if entity @e[scores={MatchFloorWin=70}] run teleport @e[tag=MatchChicken] ~ ~-1000 ~
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove SetupFloor
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove HasStar
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove FloorBlock
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove KillFloor1
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove KillFloor2
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove KillFloor3
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove KillFloor4
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove MatchHint
execute if entity @e[scores={MatchFloorWin=70}] run scoreboard objectives remove MatchFloorWin

#[tag=MainPuzzleAEC]