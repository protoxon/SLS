####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 13 2018 / SEPTEMEBER 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar Disco
#scoreboard objectives setdisplay sidebar DiscoTimer
#scoreboard objectives setdisplay sidebar TriviaShulker

execute as @e[tag=TriviaMob,nbt={HurtTime:10s}] run data merge entity @s {NoAI:false}
execute as @e[tag=TriviaMob,nbt={HurtTime:10s}] at @s run teleport @s ~ ~-50 ~

# QUESTION GREEN 1 -> FOOD / VILLAGE ROOM
execute if block 1016 64 990 stone_button[powered=true] run scoreboard objectives add Question_G1 dummy
execute if block 1016 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G1 1
execute if block 1016 64 990 stone_button[powered=false] run scoreboard objectives remove Question_G1

execute if entity @e[scores={Question_G1=4}] run summon skeleton 1019 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0d5fd9c3-d044-478f-b774-d37b5f86fa2a",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTJiMzViZGE1ZWJkZjEzNWY0ZTcxY2U0OTcyNmZiZWM1NzM5ZjBhZGVkZjAxYzUxOWUyYWVhN2Y1MTk1MWVhMiJ9fX0="}]}}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG1","TriviaMobG1A"]}
execute if entity @e[scores={Question_G1=9}] run summon skeleton 1013 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"534c47c4-d04d-416a-bf99-c3efd621d668",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjkxMzY1MTRmMzQyZTdjNTIwOGExNDIyNTA2YTg2NjE1OGVmODRkMmIyNDkyMjAxMzllOGJmNjAzMmUxOTMifX19"}]}}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG1","TriviaMobG1B"]}
execute if entity @e[scores={Question_G1=14}] run summon skeleton 1013 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:brown_mushroom_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG1","TriviaMobG1C"]}
execute if entity @e[scores={Question_G1=19}] run summon skeleton 1019 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:blue_ice",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG1","TriviaMobG1D"]}

execute if entity @e[tag=TriviaMobG1] run scoreboard players set @e[scores={Question_G1=3}] Question_G1 19
execute if entity @e[scores={Question_G1=19}] run tellraw @a[tag=G1] ["",{"text":" Q: Minecraft has many foodstuffs. Which of these would you not find in a standard game?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG1A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG1A] unless entity @e[tag=TriviaAECG1A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG1","TriviaAECG1A"],Duration:2147483647,CustomName:"{\"text\":\"Apples\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG1B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG1B] unless entity @e[tag=TriviaAECG1B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG1","TriviaAECG1B"],Duration:2147483647,CustomName:"{\"text\":\"Cake\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG1C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG1C] unless entity @e[tag=TriviaAECG1C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG1","TriviaAECG1C"],Duration:2147483647,CustomName:"{\"text\":\"Mushroom Stew\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG1D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG1D] unless entity @e[tag=TriviaAECG1D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG1","TriviaAECG1D"],Duration:2147483647,CustomName:"{\"text\":\"Popsicles\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG1A] as @e[tag=TriviaMobG1A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG1B] as @e[tag=TriviaMobG1B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG1C] as @e[tag=TriviaMobG1C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG1D] as @e[tag=TriviaMobG1,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG1A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG1A]
execute if entity @e[tag=TriviaMobG1B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG1B]
execute if entity @e[tag=TriviaMobG1C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG1C]
execute if entity @e[tag=TriviaMobG1D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG1D]

execute unless entity @e[tag=TriviaMobG1A] run kill @e[tag=TriviaAECG1A]
execute unless entity @e[tag=TriviaMobG1B] run kill @e[tag=TriviaAECG1B]
execute unless entity @e[tag=TriviaMobG1C] run kill @e[tag=TriviaAECG1C]
execute unless entity @e[tag=TriviaMobG1D] run kill @e[tag=TriviaAECG1D]

# IF WRONG
execute if entity @e[tag=TriviaMobG1A,nbt={HurtTime:10s}] run teleport @a 1107 6 981
execute if entity @e[tag=TriviaMobG1B,nbt={HurtTime:10s}] run teleport @a 1107 6 951
execute if entity @e[tag=TriviaMobG1C,nbt={HurtTime:10s}] run teleport @a 1107 6 921


# IF CORRECT
execute if entity @e[tag=TriviaMobG1D,nbt={HurtTime:10s}] run scoreboard objectives add QG1_Correct dummy

scoreboard players add @e[tag=MainTriviaAEC] QG1_Correct 1
execute if entity @e[scores={QG1_Correct=1}] run setblock 1016 64 990 air
execute if entity @e[scores={QG1_Correct=1}] run kill @e[tag=TriviaAECG1]
execute if entity @e[scores={QG1_Correct=1}] as @e[tag=TriviaMobG1] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG1_Correct=1}] as @e[tag=TriviaMobG1] run teleport @s ~ 0 ~
execute if entity @e[scores={QG1_Correct=20}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG1_Correct=22}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG1_Correct=23}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG1_Correct=24}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG1_Correct=25}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG1_Correct=26}] at @a[tag=G1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG1_Correct=30}] run playsound entity.firework_rocket.launch master @a 1016 64 990 1 1 0

execute if entity @e[scores={QG1_Correct=32}] run title @a[tag=G1] times 1 80 1
execute if entity @e[scores={QG1_Correct=32}] run title @a[tag=G1] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG1_Correct=32}] run title @a[tag=G1] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG1_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG1_Correct=35}] run tellraw @a[tag=G1] ["",{"text":" (✔) CORRECT: There are no popsicles in Minecraft. But maybe one day...","color":"white","bold":false}]
execute if entity @e[scores={QG1_Correct=35}] run fill 1023 63 1004 1023 63 1004 air replace green_concrete
execute if entity @e[scores={QG1_Correct=35}] run setblock 1023 64 1010 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG1_Correct=35}] at @a[tag=G1] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG1_Correct=35..}] run scoreboard objectives remove QG1_Correct

execute align x align y align z run advancement grant @a[x=1021,y=72,z=1019,dx=0,dy=1,dz=4] only d3:folder_c/dead_end

###

# QUESTION GREEN 2 -> EXPERIENCE / MINESHAFT ROOM
execute if block 1023 64 1010 stone_button[powered=true] run scoreboard objectives add Question_G2 dummy
execute if block 1023 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G2 1
execute if block 1023 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_G2

execute if entity @e[scores={Question_G2=4}] run summon skeleton 1026 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:enchanting_table",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG2","TriviaMobG2A"]}
execute if entity @e[scores={Question_G2=9}] run summon skeleton 1020 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:zombie_head",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG2","TriviaMobG2B"]}
execute if entity @e[scores={Question_G2=14}] run summon skeleton 1020 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:diamond_ore",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG2","TriviaMobG2C"]}
execute if entity @e[scores={Question_G2=19}] run summon skeleton 1026 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:wet_sponge",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG2","TriviaMobG2D"]}

execute if entity @e[tag=TriviaMobG2] run scoreboard players set @e[scores={Question_G2=3}] Question_G2 19
execute if entity @e[scores={Question_G2=19}] run tellraw @a[tag=G2] ["",{"text":" Q: Sometimes in Minecraft, we die. But at least we get experience. Which single action would render you the most XP?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG2A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG2A] unless entity @e[tag=TriviaAECG2A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG2","TriviaAECG2A"],Duration:2147483647,CustomName:"{\"text\":\"Smashing a Bottle o' Enchanting\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG2B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG2B] unless entity @e[tag=TriviaAECG2B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG2","TriviaAECG2B"],Duration:2147483647,CustomName:"{\"text\":\"Killing a Baby Zombie\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG2C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG2C] unless entity @e[tag=TriviaAECG2C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG2","TriviaAECG2C"],Duration:2147483647,CustomName:"{\"text\":\"Mining a Diamond Ore block\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG2D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG2D] unless entity @e[tag=TriviaAECG2D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG2","TriviaAECG2D"],Duration:2147483647,CustomName:"{\"text\":\"Catching a Pufferfish\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG2A] as @e[tag=TriviaMobG2A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG2B] as @e[tag=TriviaMobG2B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG2C] as @e[tag=TriviaMobG2C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG2D] as @e[tag=TriviaMobG2,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG2A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG2A]
execute if entity @e[tag=TriviaMobG2B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG2B]
execute if entity @e[tag=TriviaMobG2C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG2C]
execute if entity @e[tag=TriviaMobG2D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG2D]

execute unless entity @e[tag=TriviaMobG2A] run kill @e[tag=TriviaAECG2A]
execute unless entity @e[tag=TriviaMobG2B] run kill @e[tag=TriviaAECG2B]
execute unless entity @e[tag=TriviaMobG2C] run kill @e[tag=TriviaAECG2C]
execute unless entity @e[tag=TriviaMobG2D] run kill @e[tag=TriviaAECG2D]

# IF WRONG
execute if entity @e[tag=TriviaMobG2A,nbt={HurtTime:10s}] run teleport @a 1107 6 1019
execute if entity @e[tag=TriviaMobG2C,nbt={HurtTime:10s}] run teleport @a 1107 6 1049
execute if entity @e[tag=TriviaMobG2D,nbt={HurtTime:10s}] run teleport @a 1107 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobG2B,nbt={HurtTime:10s}] run scoreboard objectives add QG2_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG2_Correct 1

execute if entity @e[scores={QG2_Correct=1}] run setblock 1024 65 985 water
execute if entity @e[scores={QG2_Correct=1}] run setblock 1023 64 1010 air
execute if entity @e[scores={QG2_Correct=1}] run kill @e[tag=TriviaAECG2]
execute if entity @e[scores={QG2_Correct=1}] as @e[tag=TriviaMobG2] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG2_Correct=1}] as @e[tag=TriviaMobG2] run teleport @s ~ 0 ~
execute if entity @e[scores={QG2_Correct=20}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG2_Correct=22}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG2_Correct=23}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG2_Correct=24}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG2_Correct=25}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG2_Correct=26}] at @a[tag=G2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG2_Correct=30}] run playsound entity.firework_rocket.launch master @a 1023 63 1010 1 1 0

execute if entity @e[scores={QG2_Correct=32}] run title @a[tag=G2] times 1 80 1
execute if entity @e[scores={QG2_Correct=32}] run title @a[tag=G2] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG2_Correct=32}] run title @a[tag=G2] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG2_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG2_Correct=35}] run tellraw @a[tag=G2] ["",{"text":" (✔) CORRECT: Baby Zombies and Baby Zombie Pigmen offer 12 XP with every kill.","color":"white","bold":false}]
execute if entity @e[scores={QG2_Correct=35}] run fill 1029 63 996 1029 63 996 air replace green_concrete
execute if entity @e[scores={QG2_Correct=35}] run setblock 1029 64 990 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG2_Correct=35}] at @a[tag=G2] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG2_Correct=35..}] run scoreboard objectives remove QG2_Correct

###

# QUESTION GREEN 3 -> SUNFLOWER / FLOWER ROOM
execute if block 1029 64 990 stone_button[powered=true] run scoreboard objectives add Question_G3 dummy
execute if block 1029 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G3 1
execute if block 1029 64 990 stone_button[powered=false] run scoreboard objectives remove Question_G3

execute if entity @e[scores={Question_G3=4}] run summon skeleton 1032 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:horn_coral_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG3","TriviaMobG3A"]}
execute if entity @e[scores={Question_G3=9}] run summon skeleton 1026 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:horn_coral_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG3","TriviaMobG3B"]}
execute if entity @e[scores={Question_G3=14}] run summon skeleton 1026 63.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:horn_coral_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG3","TriviaMobG3C"]}
execute if entity @e[scores={Question_G3=19}] run summon skeleton 1032 63.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:horn_coral_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG3","TriviaMobG3D"]}

execute as @e[tag=TriviaMobG3C,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 63.58 ~ ~ 0
execute as @e[tag=TriviaMobG3D,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 63.58 ~ ~ 0

execute if entity @e[tag=TriviaMobG3] run scoreboard players set @e[scores={Question_G3=3}] Question_G3 19
execute if entity @e[scores={Question_G3=19}] run tellraw @a[tag=G3] ["",{"text":" Q: Flowers are lovely. Just like your nose, you can pick them. Which direction does the sunflower always face?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG3A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG3A] unless entity @e[tag=TriviaAECG3A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG3","TriviaAECG3A"],Duration:2147483647,CustomName:"{\"text\":\"East\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG3B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG3B] unless entity @e[tag=TriviaAECG3B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG3","TriviaAECG3B"],Duration:2147483647,CustomName:"{\"text\":\"South\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG3C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG3C] unless entity @e[tag=TriviaAECG3C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG3","TriviaAECG3C"],Duration:2147483647,CustomName:"{\"text\":\"West\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG3D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG3D] unless entity @e[tag=TriviaAECG3D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG3","TriviaAECG3D"],Duration:2147483647,CustomName:"{\"text\":\"North\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG3A] as @e[tag=TriviaMobG3A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG3B] as @e[tag=TriviaMobG3B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG3C] as @e[tag=TriviaMobG3C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG3D] as @e[tag=TriviaMobG3,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG3A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG3A]
execute if entity @e[tag=TriviaMobG3B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG3B]
execute if entity @e[tag=TriviaMobG3C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG3C]
execute if entity @e[tag=TriviaMobG3D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG3D]

execute unless entity @e[tag=TriviaMobG3A] run kill @e[tag=TriviaAECG3A]
execute unless entity @e[tag=TriviaMobG3B] run kill @e[tag=TriviaAECG3B]
execute unless entity @e[tag=TriviaMobG3C] run kill @e[tag=TriviaAECG3C]
execute unless entity @e[tag=TriviaMobG3D] run kill @e[tag=TriviaAECG3D]

# IF WRONG
execute if entity @e[tag=TriviaMobG3B,nbt={HurtTime:10s}] run teleport @a 1137 6 981
execute if entity @e[tag=TriviaMobG3C,nbt={HurtTime:10s}] run teleport @a 1137 6 944
execute if entity @e[tag=TriviaMobG3D,nbt={HurtTime:10s}] run teleport @a 1137 6 871


# IF CORRECT
execute if entity @e[tag=TriviaMobG3A,nbt={HurtTime:10s}] run scoreboard objectives add QG3_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG3_Correct 1

execute if entity @e[scores={QG3_Correct=1}] run setblock 1029 64 990 grass_block
execute if entity @e[scores={QG3_Correct=1}] run setblock 1029 65 990 sunflower[half=lower]
execute if entity @e[scores={QG3_Correct=1}] run setblock 1029 66 990 sunflower[half=upper]
execute if entity @e[scores={QG3_Correct=1}] run kill @e[tag=TriviaAECG3]
execute if entity @e[scores={QG3_Correct=1}] as @e[tag=TriviaMobG3] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG3_Correct=1}] as @e[tag=TriviaMobG3] run teleport @s ~ 0 ~
execute if entity @e[scores={QG3_Correct=20}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG3_Correct=22}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG3_Correct=23}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG3_Correct=24}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG3_Correct=25}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG3_Correct=26}] at @a[tag=G3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG3_Correct=30}] run playsound entity.firework_rocket.launch master @a 1029 64 990 1 1 0

execute if entity @e[scores={QG3_Correct=32}] run title @a[tag=G3] times 1 80 1
execute if entity @e[scores={QG3_Correct=32}] run title @a[tag=G3] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG3_Correct=32}] run title @a[tag=G3] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG3_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG3_Correct=35}] run tellraw @a[tag=G3] ["",{"text":" (✔) CORRECT: As you can see, sunflowers always face east.","color":"white","bold":false}]
execute if entity @e[scores={QG3_Correct=35}] run fill 1036 63 1004 1036 63 1004 air replace green_concrete
execute if entity @e[scores={QG3_Correct=35}] run setblock 1036 64 1010 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG3_Correct=35}] at @a[tag=G3] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG3_Correct=35..}] run scoreboard objectives remove QG3_Correct

execute if entity @e[scores={QG3_Correct=1}] run kill @e[tag=DiscoGuardian]
execute if entity @e[scores={QG3_Correct=1}] run setblock 1036 68 1010 air
execute if entity @e[scores={QG3_Correct=1}] run setblock 1036 64 1010 air
execute if entity @e[scores={QG3_Correct=1}] run fill 1033 64 1015 1039 64 1015 nether_brick_fence[south=false] replace nether_brick_fence
execute if entity @e[scores={QG3_Correct=1}] run kill @e[tag=DiscoStand]
execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1036 68 1010 {NoGravity:true,Rotation:[180f,0f],Invisible:true,Tags:["DiscoStand","DiscoBall"]}
execute if entity @e[scores={QG3_Correct=1}] run summon guardian 1036 67.96 1010 {NoAI:true,Rotation:[180f,0f],Silent:true,Tags:["DiscoGuardian","DiscoBall"]}
execute if entity @e[scores={QG3_Correct=1}] run kill @e[tag=DiscoFrame]
execute if entity @e[scores={QG3_Correct=15}] run summon item_frame 1033 65 1014 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:firework_star",Count:1b},Tags:["DiscoFrame"]}
execute if entity @e[scores={QG3_Correct=15}] run summon item_frame 1033 66 1014 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:firework_star",Count:1b},Tags:["DiscoFrame"]}
execute if entity @e[scores={QG3_Correct=15}] run summon item_frame 1039 65 1014 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:firework_star",Count:1b},Tags:["DiscoFrame"]}
execute if entity @e[scores={QG3_Correct=15}] run summon item_frame 1039 66 1014 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:firework_star",Count:1b},Tags:["DiscoFrame"]}

execute if entity @e[scores={QG3_Correct=1}] run kill @e[tag=DiscoDrink]

execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1031.75 63.1 1007 {NoGravity:true,Invisible:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:100}],CustomPotionColor:16751621,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"There\'s a skull and crossbones on the label...","italic":"true","color":"green"}','{"text":"Obviously must be a sweet pirate beverage.","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink1"]}

execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1031.75 63.1 1008 {NoGravity:true,Invisible:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:100}],CustomPotionColor:7512056,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"You can hear whispers of tiny voices","italic":"true","color":"green"}','{"text":"asking for someone named Horton...","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink2"]}

execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1031.75 63.1 1009 {NoGravity:true,Invisible:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:100}],CustomPotionColor:16777215,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Smells like eyedrops and mountain lions.","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink3"]}

execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1031.75 63.1 1010 {NoGravity:true,Invisible:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:100}],CustomPotionColor:11812351,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"It\'s full of bubbles and a cute-looking worm...","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink4"]}

execute if entity @e[scores={QG3_Correct=1}] run summon armor_stand 1031.75 63.1 1011 {NoGravity:true,Invisible:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:100}],CustomPotionColor:0,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Looks sparkly but is it safe to drink?","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink5"]}

execute if entity @e[scores={QG3_Correct=2}] at @e[tag=DiscoDrink1] run summon armor_stand ~-0.3 ~1 ~ {NoGravity:true,Invisible:true,Rotation:[270f,0f],Pose:{RightArm:[0f,270f,0f]},HandItems:[{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:400}],CustomPotionColor:16751621,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"There\'s a skull and crossbones on the label...","italic":"true","color":"green"}','{"text":"Obviously must be a sweet pirate beverage.","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink1"]}

execute if entity @e[scores={QG3_Correct=2}] at @e[tag=DiscoDrink2] run summon armor_stand ~-0.3 ~1 ~ {NoGravity:true,Invisible:true,Rotation:[270f,0f],Pose:{RightArm:[0f,270f,0f]},HandItems:[{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:400}],CustomPotionColor:7512056,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"You can hear whispers of tiny voices","italic":"true","color":"green"}','{"text":"asking for someone named Horton...","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink2"]}

execute if entity @e[scores={QG3_Correct=2}] at @e[tag=DiscoDrink3] run summon armor_stand ~-0.3 ~1 ~ {NoGravity:true,Invisible:true,Rotation:[270f,0f],Pose:{RightArm:[0f,270f,0f]},HandItems:[{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:400}],CustomPotionColor:16777215,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Smells like eyedrops and mountain lions.","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink3"]}

execute if entity @e[scores={QG3_Correct=2}] at @e[tag=DiscoDrink4] run summon armor_stand ~-0.3 ~1 ~ {NoGravity:true,Invisible:true,Rotation:[270f,0f],Pose:{RightArm:[0f,270f,0f]},HandItems:[{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:400}],CustomPotionColor:11812351,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"It\'s full of bubbles and a cute-looking worm...","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink4"]}

execute if entity @e[scores={QG3_Correct=2}] at @e[tag=DiscoDrink5] run summon armor_stand ~-0.3 ~1 ~ {NoGravity:true,Invisible:true,Rotation:[270f,0f],Pose:{RightArm:[0f,270f,0f]},HandItems:[{id:"minecraft:potion",Count:1b,tag:{CustomPotionEffects:[{Id:9,Amplifier:0,Duration:400}],CustomPotionColor:0,HideFlags:63,display:{Name:"{\"text\":\"Mystery Concoction\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Looks sparkly but is it safe to drink?","italic":"true","color":"green"}']}}}],Tags:["DiscoDrink","DiscoDrink5"]}

execute if entity @e[nbt={Inventory:[{id:"minecraft:potion",tag:{CustomPotionColor:16751621}}]}] run kill @e[tag=DiscoDrink1]
execute if entity @e[nbt={Inventory:[{id:"minecraft:potion",tag:{CustomPotionColor:7512056}}]}] run kill @e[tag=DiscoDrink2]
execute if entity @e[nbt={Inventory:[{id:"minecraft:potion",tag:{CustomPotionColor:16777215}}]}] run kill @e[tag=DiscoDrink3]
execute if entity @e[nbt={Inventory:[{id:"minecraft:potion",tag:{CustomPotionColor:11812351}}]}] run kill @e[tag=DiscoDrink4]
execute if entity @e[nbt={Inventory:[{id:"minecraft:potion",tag:{CustomPotionColor:0}}]}] run kill @e[tag=DiscoDrink5]

execute if entity @e[scores={QG3_Correct=1}] run fill 1033 61 1007 1039 61 1013 clay
execute if entity @e[scores={QG3_Correct=1}] run clone 1033 58 1007 1039 58 1013 1033 63 1007


###

# QUESTION GREEN 4 -> MUSIC DISCS / DISCO ROOM
execute if block 1036 64 1010 stone_button[powered=true] run scoreboard objectives add Question_G4 dummy
execute if block 1036 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G4 1
execute if block 1036 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_G4

execute if entity @e[scores={Question_G4=4}] run summon skeleton 1039 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:jukebox",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG4","TriviaMobG4A"]}
execute if entity @e[scores={Question_G4=9}] run summon skeleton 1033 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:jukebox",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG4","TriviaMobG4B"]}
execute if entity @e[scores={Question_G4=14}] run summon skeleton 1033 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:jukebox",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG4","TriviaMobG4C"]}
execute if entity @e[scores={Question_G4=19}] run summon skeleton 1039 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:jukebox",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG4","TriviaMobG4D"]}

execute if entity @e[tag=TriviaMobG4] run scoreboard players set @e[scores={Question_G4=3}] Question_G4 19
execute if entity @e[scores={Question_G4=19}] run tellraw @a[tag=G4] ["",{"text":" Q: Perfect for family goodbyes, this tune will turn the frownies upside down! What colour is the music disc \"ward\"?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG4A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG4A] unless entity @e[tag=TriviaAECG4A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG4","TriviaAECG4A"],Duration:2147483647,CustomName:"{\"text\":\"Red\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG4B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG4B] unless entity @e[tag=TriviaAECG4B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG4","TriviaAECG4B"],Duration:2147483647,CustomName:"{\"text\":\"Blue\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG4C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG4C] unless entity @e[tag=TriviaAECG4C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG4","TriviaAECG4C"],Duration:2147483647,CustomName:"{\"text\":\"Green\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG4D] unless entity @e[tag=TriviaAECG4D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG4","TriviaAECG4D"],Duration:2147483647,CustomName:"{\"text\":\"Orange\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG4A] unless entity @e[tag=TriviaASG4A] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:music_disc_chirp",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG4","TriviaASG4A"]}
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG4B] unless entity @e[tag=TriviaASG4B] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:music_disc_wait",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG4","TriviaASG4B"]}
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG4C] unless entity @e[tag=TriviaASG4C] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:music_disc_ward",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG4","TriviaASG4C"]}
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG4D] unless entity @e[tag=TriviaASG4D] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:music_disc_blocks",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG4","TriviaASG4D"]}

execute if entity @e[tag=TriviaAECG4A] as @e[tag=TriviaMobG4A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG4B] as @e[tag=TriviaMobG4B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG4C] as @e[tag=TriviaMobG4C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG4D] as @e[tag=TriviaMobG4,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute align x align y align z at @a[x=1033,y=64,z=1007,dx=6,dy=1,dz=6] run scoreboard objectives add Disco dummy
execute if block 1036 64 1010 jukebox run scoreboard objectives remove Disco
scoreboard players set @e[tag=MainTriviaAEC] Disco 0
execute align x align y align z if entity @a[x=1033,y=64,z=1007,dx=6,dy=1,dz=6] run scoreboard players set @e[tag=MainTriviaAEC] Disco 1
execute if block 1036 64 1010 jukebox run scoreboard objectives remove DiscoTimer
#execute if entity @e[scores={Disco=0}] run fill 1033 61 1007 1039 61 1013 clay replace redstone_block
execute if entity @e[scores={Disco=0}] run clone 1033 58 1007 1039 58 1013 1033 63 1007
execute if entity @e[scores={Disco=0}] run scoreboard objectives remove DiscoTimer
execute if entity @e[scores={Disco=1}] run scoreboard objectives add DiscoTimer dummy
execute if entity @e[scores={Disco=0}] run scoreboard objectives remove Disco
scoreboard players add @e[tag=MainTriviaAEC] DiscoTimer 1
scoreboard players set @e[scores={DiscoTimer=19..}] DiscoTimer 0

execute if entity @e[scores={DiscoTimer=1}] run playsound block.note_block.basedrum master @a 1039 65.5 1014 0.5 1 0
execute if entity @e[scores={DiscoTimer=10}] run playsound block.note_block.basedrum master @a 1039 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=5}] run playsound block.note_block.hat master @a 1039 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=15}] run playsound block.note_block.hat master @a 1039 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=10}] run playsound block.note_block.snare master @a 1039 65.5 1014 0.8 1 0
execute if entity @e[scores={DiscoTimer=1}] run playsound block.note_block.basedrum master @a 1033 65.5 1014 0.5 1 0
execute if entity @e[scores={DiscoTimer=10}] run playsound block.note_block.basedrum master @a 1033 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=5}] run playsound block.note_block.hat master @a 1033 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=15}] run playsound block.note_block.hat master @a 1033 65.5 1014 0.5 1 0
#execute if entity @e[scores={DiscoTimer=10}] run playsound block.note_block.snare master @a 1033 65.5 1014 0.8 1 0

#execute if entity @e[scores={Disco=1}] run fill 1033 61 1007 1039 61 1013 redstone_block replace clay

execute unless entity @e[scores={Disco=1}] unless block 1036 68 1010 air run setblock 1036 68 1010 air
execute if entity @e[scores={Disco=1}] if block 1036 68 1010 air run setblock 1036 68 1010 end_rod[facing=down]

execute if entity @e[scores={DiscoTimer=1}] run clone 1033 56 1007 1039 56 1013 1033 63 1007
execute if entity @e[scores={DiscoTimer=10}] run clone 1033 54 1007 1039 54 1013 1033 63 1007
#execute if entity @e[scores={DiscoTimer=10}] run clone 1033 52 1007 1039 52 1013 1033 63 1007
#execute if entity @e[scores={DiscoTimer=15}] run clone 1033 50 1007 1039 50 1013 1033 63 1007


execute if block 1036 64 1010 jukebox run kill @e[tag=DiscoBall]
execute if block 1036 64 1010 jukebox run fill 1036 68 1010 1036 68 1010 redstone_torch replace air
execute if block 1036 64 1010 jukebox run fill 1033 63 1007 1039 63 1013 black_terracotta

execute if entity @e[scores={Disco=1}] as @e[tag=DiscoStand] at @s run teleport @s ~ ~ ~ ~-1 ~
execute as @e[tag=DiscoStand] at @s run teleport @e[tag=DiscoGuardian] ~ ~ ~ ~ ~


execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG4A] run teleport @e[tag=TriviaASG4A] ~-0.145 ~0.8 ~-0.125
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG4B] run teleport @e[tag=TriviaASG4B] ~0.125 ~0.8 ~-0.145
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG4C] run teleport @e[tag=TriviaASG4C] ~0.145 ~0.8 ~0.125
execute if entity @e[tag=TriviaMobG4D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG4D] run teleport @e[tag=TriviaASG4D] ~-0.125 ~0.8 ~0.145

execute if entity @e[tag=TriviaMobG4A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG4A]
execute if entity @e[tag=TriviaMobG4B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG4B]
execute if entity @e[tag=TriviaMobG4C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG4C]
execute if entity @e[tag=TriviaMobG4D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG4D]
execute if entity @e[tag=TriviaMobG4A,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG4A]
execute if entity @e[tag=TriviaMobG4B,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG4B]
execute if entity @e[tag=TriviaMobG4C,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG4C]
execute if entity @e[tag=TriviaMobG4D,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG4D]

execute unless entity @e[tag=TriviaMobG4A] run kill @e[tag=TriviaAECG4A]
execute unless entity @e[tag=TriviaMobG4B] run kill @e[tag=TriviaAECG4B]
execute unless entity @e[tag=TriviaMobG4C] run kill @e[tag=TriviaAECG4C]
execute unless entity @e[tag=TriviaMobG4D] run kill @e[tag=TriviaAECG4D]
execute unless entity @e[tag=TriviaMobG4A] run kill @e[tag=TriviaASG4A]
execute unless entity @e[tag=TriviaMobG4B] run kill @e[tag=TriviaASG4B]
execute unless entity @e[tag=TriviaMobG4C] run kill @e[tag=TriviaASG4C]
execute unless entity @e[tag=TriviaMobG4D] run kill @e[tag=TriviaASG4D]


# IF WRONG
execute if entity @e[tag=TriviaMobG4A,nbt={HurtTime:10s}] run teleport @a 1137 6 1019
execute if entity @e[tag=TriviaMobG4B,nbt={HurtTime:10s}] run teleport @a 1137 6 1049
execute if entity @e[tag=TriviaMobG4D,nbt={HurtTime:10s}] run teleport @a 1137 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobG4C,nbt={HurtTime:10s}] run scoreboard objectives add QG4_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG4_Correct 1

execute if entity @e[scores={QG4_Correct=1}] run setblock 1036 64 1010 jukebox[has_record=true]{RecordItem:{id:"minecraft:music_disc_ward",Count:1b,tag:{CustomDisc:1b}}}
#execute if block 1036 64 1010 jukebox[has_record=false] run stopsound @a record
execute if entity @e[scores={QG4_Correct=1}] run kill @e[tag=TriviaAECG4]
execute if entity @e[scores={QG4_Correct=1}] run kill @e[tag=TriviaASG4]
execute if entity @e[scores={QG4_Correct=1}] as @e[tag=TriviaMobG4] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG4_Correct=1}] as @e[tag=TriviaMobG4] run teleport @s ~ 0 ~
execute if entity @e[scores={QG4_Correct=20}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG4_Correct=22}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG4_Correct=23}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG4_Correct=24}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG4_Correct=25}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG4_Correct=26}] at @a[tag=G4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG4_Correct=30}] run playsound entity.firework_rocket.launch master @a 1036 64 1010 1 1 0

execute if entity @e[scores={QG4_Correct=32}] run title @a[tag=G4] times 1 80 1
execute if entity @e[scores={QG4_Correct=32}] run title @a[tag=G4] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG4_Correct=32}] run title @a[tag=G4] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG4_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG4_Correct=35}] run tellraw @a[tag=G4] ["",{"text":" (✔) CORRECT: The \"ward\" record is the green music disc. Also, \"cat\" and \"far\" are light green.","color":"white","bold":false}]
execute if entity @e[scores={QG4_Correct=35}] run fill 1042 63 996 1042 63 996 air replace green_concrete
execute if entity @e[scores={QG4_Correct=35}] run setblock 1042 66 990 stone_button[face=floor,facing=south]
execute if entity @e[scores={QG4_Correct=1}] run fill 1038 60 992 1046 60 995 redstone_block replace clay
execute if entity @e[scores={QG4_Correct=1}] run fill 1038 60 993 1038 60 995 clay
execute if entity @e[scores={QG4_Correct=1}] run fill 1046 60 993 1046 60 995 clay
execute if entity @e[scores={QG4_Correct=10}] run fill 1038 63 993 1038 63 995 lava replace air
execute if entity @e[scores={QG4_Correct=10}] run fill 1046 63 993 1046 63 995 lava replace air
execute if entity @e[scores={QG4_Correct=20}] run fill 1038 62 993 1038 62 995 stone_bricks
execute if entity @e[scores={QG4_Correct=20}] run fill 1046 62 993 1046 62 995 stone_bricks

#execute if entity @e[scores={QG4_Correct=35}] at @a[tag=G4] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG4_Correct=35}] run playsound music_disc.ward record @a 1036 64 1010 1 1 0
execute if entity @e[nbt={Item:{id:"minecraft:music_disc_ward",tag:{CustomDisc:1b}}}] run stopsound @a record
execute as @e[nbt={Item:{id:"minecraft:music_disc_ward",tag:{CustomDisc:1b}}}] run data merge entity @s {Item:{id:"minecraft:music_disc_ward",tag:{CustomDisc:0b}}}
execute if entity @e[scores={QG4_Correct=35..}] run scoreboard objectives remove QG4_Correct

###

# QUESTION GREEN 5 -> SILVERFISH / STRONGHOLD ROOM
execute if block 1042 66 990 stone_button[powered=true] run scoreboard objectives add Question_G5 dummy
execute if block 1042 66 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G5 1
execute if block 1042 66 990 stone_button[powered=false] run scoreboard objectives remove Question_G5

execute if entity @e[scores={Question_G5=4}] run summon skeleton 1045 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:spawner",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG5","TriviaMobG5A"]}
execute if entity @e[scores={Question_G5=9}] run summon skeleton 1039 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:spawner",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG5","TriviaMobG5B"]}
execute if entity @e[scores={Question_G5=14}] run summon skeleton 1039 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:spawner",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG5","TriviaMobG5C"]}
execute if entity @e[scores={Question_G5=19}] run summon skeleton 1045 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:spawner",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG5","TriviaMobG5D"]}

execute if entity @e[tag=TriviaMobG5] run scoreboard players set @e[scores={Question_G5=3}] Question_G5 19
execute if entity @e[scores={Question_G5=19}] run tellraw @a[tag=G5] ["",{"text":" Q: When silverfish hide in a stone block, the block becomes infested. How many of these types of silverfish blocks are there?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG5A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG5A] unless entity @e[tag=TriviaAECG5A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG5","TriviaAECG5A"],Duration:2147483647,CustomName:"{\"text\":\"3\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG5B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG5B] unless entity @e[tag=TriviaAECG5B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG5","TriviaAECG5B"],Duration:2147483647,CustomName:"{\"text\":\"4\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG5C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG5C] unless entity @e[tag=TriviaAECG5C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG5","TriviaAECG5C"],Duration:2147483647,CustomName:"{\"text\":\"6\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG5D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG5D] unless entity @e[tag=TriviaAECG5D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG5","TriviaAECG5D"],Duration:2147483647,CustomName:"{\"text\":\"8\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG5A] as @e[tag=TriviaMobG5A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG5B] as @e[tag=TriviaMobG5B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG5C] as @e[tag=TriviaMobG5C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG5D] as @e[tag=TriviaMobG5,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG5A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG5A]
execute if entity @e[tag=TriviaMobG5B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG5B]
execute if entity @e[tag=TriviaMobG5C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG5C]
execute if entity @e[tag=TriviaMobG5D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG5D]

execute unless entity @e[tag=TriviaMobG5A] run kill @e[tag=TriviaAECG5A]
execute unless entity @e[tag=TriviaMobG5B] run kill @e[tag=TriviaAECG5B]
execute unless entity @e[tag=TriviaMobG5C] run kill @e[tag=TriviaAECG5C]
execute unless entity @e[tag=TriviaMobG5D] run kill @e[tag=TriviaAECG5D]

# IF WRONG
execute if entity @e[tag=TriviaMobG5A,nbt={HurtTime:10s}] run teleport @a 1167 6 981
execute if entity @e[tag=TriviaMobG5B,nbt={HurtTime:10s}] run teleport @a 1167 6 951
execute if entity @e[tag=TriviaMobG5D,nbt={HurtTime:10s}] run teleport @a 1167 6 921


# IF CORRECT
execute if entity @e[tag=TriviaMobG5C,nbt={HurtTime:10s}] run scoreboard objectives add QG5_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG5_Correct 1

execute if entity @e[scores={QG5_Correct=1}] run setblock 1042 66 990 air
execute if entity @e[scores={QG5_Correct=1}] run kill @e[tag=TriviaAECG5]
execute if entity @e[scores={QG5_Correct=1}] as @e[tag=TriviaMobG5] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG5_Correct=1}] as @e[tag=TriviaMobG5] run teleport @s ~ 0 ~
execute if entity @e[scores={QG5_Correct=20}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG5_Correct=22}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG5_Correct=23}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG5_Correct=24}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG5_Correct=25}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG5_Correct=26}] at @a[tag=G5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG5_Correct=30}] run playsound entity.firework_rocket.launch master @a 1042 64 990 1 1 0

execute if entity @e[scores={QG5_Correct=32}] run title @a[tag=G5] times 1 80 1
execute if entity @e[scores={QG5_Correct=32}] run title @a[tag=G5] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG5_Correct=32}] run title @a[tag=G5] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG5_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG5_Correct=30}] run setblock 1038 62 993 infested_chiseled_stone_bricks
execute if entity @e[scores={QG5_Correct=30}] run setblock 1038 62 994 infested_cobblestone
execute if entity @e[scores={QG5_Correct=30}] run setblock 1038 62 995 infested_stone
execute if entity @e[scores={QG5_Correct=30}] run setblock 1046 62 993 infested_stone_bricks
execute if entity @e[scores={QG5_Correct=30}] run setblock 1046 62 994 infested_cracked_stone_bricks
execute if entity @e[scores={QG5_Correct=30}] run setblock 1046 62 995 infested_mossy_stone_bricks

execute if entity @e[scores={QG5_Correct=35}] run fill 1038 60 992 1046 60 995 clay replace redstone_block
execute if entity @e[scores={QG5_Correct=35}] run fill 1038 60 993 1038 60 995 redstone_block
execute if entity @e[scores={QG5_Correct=35}] run fill 1046 60 993 1046 60 995 redstone_block
execute if entity @e[scores={QG5_Correct=35}] run fill 1038 64 993 1038 64 995 torch
execute if entity @e[scores={QG5_Correct=35}] run fill 1046 64 993 1046 64 995 torch

execute if entity @e[scores={QG5_Correct=35}] run tellraw @a[tag=G5] ["",{"text":" (✔) CORRECT: There are 6 Infested Stone variants: Stone, Cobblestone, Stone Brick, Mossy Stone Bricks, Cracked Stone Bricks and Chiseled Stone Bricks.","color":"white","bold":false}]
execute if entity @e[scores={QG5_Correct=35}] run fill 1049 63 1004 1049 63 1004 air replace green_concrete
execute if entity @e[scores={QG5_Correct=35}] run setblock 1049 64 1010 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG5_Correct=35}] at @a[tag=G5] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG5_Correct=35..}] run scoreboard objectives remove QG5_Correct

execute if entity @e[scores={QG5_Correct=1}] run kill @e[tag=TriviaTurtle]
execute if entity @e[scores={QG5_Correct=1}] run summon turtle 1044 62 1006 {Age:-2147483647,Tags:["TriviaTurtle"]}
execute if entity @e[scores={QG5_Correct=1}] run summon turtle 1044 62 1013 {Age:-2147483647,Tags:["TriviaTurtle"]}
execute if entity @e[scores={QG5_Correct=1}] run summon turtle 1044 62 1010 {Age:-2147483647,Tags:["TriviaTurtle"]}
execute if entity @e[scores={QG5_Correct=1}] run summon turtle 1044 62 1012 {Age:-2147483647,Tags:["TriviaTurtle"]}
execute as @e[type=turtle,x=1045,y=64,z=1005,dx=0,dy=-0.5,dz=10] run data merge entity @s {Motion:[-0.2d,-0.1d,0.0d],Rotation:[90f,0f]}

execute if entity @e[scores={QG5_Correct=1}] run fill 1054 65 1005 1055 67 1015 water
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1005 horn_coral
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1005 kelp[age=1]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1006 kelp_plant
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 66 1006 kelp
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1007 tall_seagrass[half=lower]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 66 1007 tall_seagrass[half=upper]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1008 fire_coral
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1008 seagrass
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1009 seagrass
execute if entity @e[scores={QG5_Correct=1}] run fill 1055 65 1010 1055 66 1010 kelp_plant
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 67 1010 kelp
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1011 seagrass
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1011 brain_coral
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1012 tall_seagrass[half=lower]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 66 1012 tall_seagrass[half=upper]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1012 fire_coral
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1014 kelp
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1013 kelp_plant
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 66 1013 kelp
execute if entity @e[scores={QG5_Correct=1}] run setblock 1055 65 1015 tube_coral
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 65 1015 tall_seagrass[half=lower]
execute if entity @e[scores={QG5_Correct=1}] run setblock 1054 66 1015 tall_seagrass[half=upper]

execute if entity @e[scores={QG5_Correct=1}] run kill @e[type=tropical_fish]
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1005
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1006
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1007
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1008
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1009
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1010
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1011
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1013
execute if entity @e[scores={QG5_Correct=1}] run summon tropical_fish 1055 66 1014

###

# QUESTION GREEN 6 -> FIREWORKS / AQUARIUM ROOM
execute if block 1049 64 1010 stone_button[powered=true] run scoreboard objectives add Question_G6 dummy
execute if block 1049 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G6 1
execute if block 1049 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_G6

execute if entity @e[scores={Question_G6=4}] run summon skeleton 1052 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG6","TriviaMobG6A"]}
execute if entity @e[scores={Question_G6=9}] run summon skeleton 1046 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG6","TriviaMobG6B"]}
execute if entity @e[scores={Question_G6=14}] run summon skeleton 1046 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG6","TriviaMobG6C"]}
execute if entity @e[scores={Question_G6=19}] run summon skeleton 1052 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG6","TriviaMobG6D"]}

execute if entity @e[tag=TriviaMobG6] run scoreboard players set @e[scores={Question_G6=3}] Question_G6 19
execute if entity @e[scores={Question_G6=19}] run tellraw @a[tag=G6] ["",{"text":" Q: What specific ingredient is required for a burst firework?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG6A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG6A] unless entity @e[tag=TriviaAECG6A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG6","TriviaAECG6A"],Duration:2147483647,CustomName:"{\"text\":\"Diamond\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG6B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG6B] unless entity @e[tag=TriviaAECG6B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG6","TriviaAECG6B"],Duration:2147483647,CustomName:"{\"text\":\"Feather\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG6C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG6C] unless entity @e[tag=TriviaAECG6C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG6","TriviaAECG6C"],Duration:2147483647,CustomName:"{\"text\":\"Gold Nugget\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG6D] unless entity @e[tag=TriviaAECG6D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG6","TriviaAECG6D"],Duration:2147483647,CustomName:"{\"text\":\"Glowstone Dust\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG6A] unless entity @e[tag=TriviaASG6A] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Marker:true,Rotation:[45f,0f],HandItems:[{id:"minecraft:diamond",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG6","TriviaASG6A"]}
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG6B] unless entity @e[tag=TriviaASG6B] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Marker:true,Rotation:[135f,0f],HandItems:[{id:"minecraft:feather",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG6","TriviaASG6B"]}
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG6C] unless entity @e[tag=TriviaASG6C] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Marker:true,Rotation:[225f,0f],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG6","TriviaASG6C"]}
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=24}] at @e[tag=TriviaMobG6D] unless entity @e[tag=TriviaASG6D] run summon armor_stand ~ ~-3 ~ {Small:true,NoGravity:true,Invisible:true,Marker:true,Rotation:[315f,0f],HandItems:[{id:"minecraft:glowstone_dust",Count:1b}],Pose:{RightArm:[180f,270f,180f]},Tags:["TriviaAS","TriviaASG6","TriviaASG6D"]}

execute if entity @e[tag=TriviaAECG6A] as @e[tag=TriviaMobG6A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG6B] as @e[tag=TriviaMobG6B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG6C] as @e[tag=TriviaMobG6C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG6D] as @e[tag=TriviaMobG6,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG6A] run teleport @e[tag=TriviaASG6A] ~0.028 ~1.66 ~-0.015
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG6B] run teleport @e[tag=TriviaASG6B] ~0.015 ~1.66 ~0.038
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG6C] run teleport @e[tag=TriviaASG6C] ~-0.020 ~1.66 ~0.021
execute if entity @e[tag=TriviaMobG6D,scores={TriviaMobAge=25}] at @e[tag=TriviaMobG6D] run teleport @e[tag=TriviaASG6D] ~-0.015 ~1.66 ~-0.028

execute if entity @e[tag=TriviaMobG6A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG6A]
execute if entity @e[tag=TriviaMobG6B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG6B]
execute if entity @e[tag=TriviaMobG6C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG6C]
execute if entity @e[tag=TriviaMobG6D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG6D]
execute if entity @e[tag=TriviaMobG6A,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG6A]
execute if entity @e[tag=TriviaMobG6B,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG6B]
execute if entity @e[tag=TriviaMobG6C,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG6C]
execute if entity @e[tag=TriviaMobG6D,nbt={HurtTime:10s}] run kill @e[tag=TriviaASG6D]

execute unless entity @e[tag=TriviaMobG6A] run kill @e[tag=TriviaAECG6A]
execute unless entity @e[tag=TriviaMobG6B] run kill @e[tag=TriviaAECG6B]
execute unless entity @e[tag=TriviaMobG6C] run kill @e[tag=TriviaAECG6C]
execute unless entity @e[tag=TriviaMobG6D] run kill @e[tag=TriviaAECG6D]
execute unless entity @e[tag=TriviaMobG6A] run kill @e[tag=TriviaASG6A]
execute unless entity @e[tag=TriviaMobG6B] run kill @e[tag=TriviaASG6B]
execute unless entity @e[tag=TriviaMobG6C] run kill @e[tag=TriviaASG6C]
execute unless entity @e[tag=TriviaMobG6D] run kill @e[tag=TriviaASG6D]

# IF WRONG
execute if entity @e[tag=TriviaMobG6A,nbt={HurtTime:10s}] run teleport @a 1167 6 1019
execute if entity @e[tag=TriviaMobG6C,nbt={HurtTime:10s}] run teleport @a 1167 6 1049
execute if entity @e[tag=TriviaMobG6D,nbt={HurtTime:10s}] run teleport @a 1167 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobG6B,nbt={HurtTime:10s}] run scoreboard objectives add QG6_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG6_Correct 1

execute if entity @e[scores={QG6_Correct=1}] run setblock 1049 64 1010 air
execute if entity @e[scores={QG6_Correct=1}] run kill @e[tag=TriviaAECG6]
execute if entity @e[scores={QG6_Correct=1}] run kill @e[tag=TriviaASG6]
execute if entity @e[scores={QG6_Correct=1}] as @e[tag=TriviaMobG6] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG6_Correct=1}] as @e[tag=TriviaMobG6] run teleport @s ~ 0 ~
execute if entity @e[scores={QG6_Correct=20}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG6_Correct=22}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG6_Correct=23}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG6_Correct=24}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG6_Correct=25}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG6_Correct=26}] at @a[tag=G6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG6_Correct=30}] run playsound entity.firework_rocket.launch master @a 1049 64 1010 1 1 0

execute if entity @e[scores={QG6_Correct=32}] run title @a[tag=G6] times 1 80 1
execute if entity @e[scores={QG6_Correct=32}] run title @a[tag=G6] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG6_Correct=32}] run title @a[tag=G6] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG6_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG6_Correct=35}] run tellraw @a[tag=G6] ["",{"text":" (✔) CORRECT: Feathers make Burst firework stars, Diamonds make Trail fireworks, Gold Nuggets make Star-shaped ones and Glowstone Dust makes a firework Twinkle.","color":"white","bold":false}]
execute if entity @e[scores={QG6_Correct=35}] run fill 1055 63 996 1055 63 996 air replace green_concrete
execute if entity @e[scores={QG6_Correct=35}] run setblock 1055 64 990 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG6_Correct=35}] at @a[tag=G6] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG6_Correct=35..}] run scoreboard objectives remove QG6_Correct

execute if entity @e[scores={QG6_Correct=1}] run fill 1054 65 985 1055 67 985 black_terracotta
execute if entity @e[scores={QG6_Correct=1}] run fill 1051 65 984 1058 67 984 redstone_block replace clay
execute if entity @e[scores={QG6_Correct=10}] run fill 1054 65 984 1055 67 984 air
execute if entity @e[scores={QG6_Correct=10}] run fill 1054 65 983 1055 67 983 sticky_piston[facing=south]
execute if entity @e[scores={QG6_Correct=10}] run fill 1054 65 982 1055 67 982 redstone_block

###

# QUESTION GREEN 7 -> ENCHANTING / D2 ROOM
execute if block 1055 64 990 stone_button[powered=true] run scoreboard objectives add Question_G7 dummy
execute if block 1055 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G7 1
execute if block 1055 64 990 stone_button[powered=false] run scoreboard objectives remove Question_G7

execute if entity @e[scores={Question_G7=4}] run summon skeleton 1058 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG7","TriviaMobG7A"]}
execute if entity @e[scores={Question_G7=9}] run summon skeleton 1052 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG7","TriviaMobG7B"]}
execute if entity @e[scores={Question_G7=14}] run summon skeleton 1052 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG7","TriviaMobG7C"]}
execute if entity @e[scores={Question_G7=19}] run summon skeleton 1058 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG7","TriviaMobG7D"]}

execute if entity @e[tag=TriviaMobG7] run scoreboard players set @e[scores={Question_G7=3}] Question_G7 19
execute if entity @e[scores={Question_G7=19}] run tellraw @a[tag=G7] ["",{"text":" Q: What is the minimum amount of bookshelves required for a level 30 enchantment?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG7A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG7A] unless entity @e[tag=TriviaAECG7A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG7","TriviaAECG7A"],Duration:2147483647,CustomName:"{\"text\":\"15\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG7B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG7B] unless entity @e[tag=TriviaAECG7B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG7","TriviaAECG7B"],Duration:2147483647,CustomName:"{\"text\":\"18\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG7C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG7C] unless entity @e[tag=TriviaAECG7C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG7","TriviaAECG7C"],Duration:2147483647,CustomName:"{\"text\":\"8\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG7D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG7D] unless entity @e[tag=TriviaAECG7D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG7","TriviaAECG7D"],Duration:2147483647,CustomName:"{\"text\":\"12\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG7A] as @e[tag=TriviaMobG7A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG7B] as @e[tag=TriviaMobG7B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG7C] as @e[tag=TriviaMobG7C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG7D] as @e[tag=TriviaMobG7,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG7A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG7A]
execute if entity @e[tag=TriviaMobG7B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG7B]
execute if entity @e[tag=TriviaMobG7C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG7C]
execute if entity @e[tag=TriviaMobG7D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG7D]

execute unless entity @e[tag=TriviaMobG7A] run kill @e[tag=TriviaAECG7A]
execute unless entity @e[tag=TriviaMobG7B] run kill @e[tag=TriviaAECG7B]
execute unless entity @e[tag=TriviaMobG7C] run kill @e[tag=TriviaAECG7C]
execute unless entity @e[tag=TriviaMobG7D] run kill @e[tag=TriviaAECG7D]

# IF WRONG
execute if entity @e[tag=TriviaMobG7B,nbt={HurtTime:10s}] run teleport @a 1197 6 981
execute if entity @e[tag=TriviaMobG7C,nbt={HurtTime:10s}] run teleport @a 1197 6 951
execute if entity @e[tag=TriviaMobG7D,nbt={HurtTime:10s}] run teleport @a 1197 6 921


# IF CORRECT
execute if entity @e[tag=TriviaMobG7A,nbt={HurtTime:10s}] run scoreboard objectives add QG7_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG7_Correct 1

execute if entity @e[scores={QG7_Correct=1}] run setblock 1055 64 990 air
execute if entity @e[scores={QG7_Correct=1}] run kill @e[tag=TriviaAECG7]
execute if entity @e[scores={QG7_Correct=1}] as @e[tag=TriviaMobG7] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG7_Correct=1}] as @e[tag=TriviaMobG7] run teleport @s ~ 0 ~
execute if entity @e[scores={QG7_Correct=20}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG7_Correct=22}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG7_Correct=23}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG7_Correct=24}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG7_Correct=25}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG7_Correct=26}] at @a[tag=G7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG7_Correct=30}] run playsound entity.firework_rocket.launch master @a 1055 64 990 1 1 0

execute if entity @e[scores={QG7_Correct=32}] run title @a[tag=G7] times 1 80 1
execute if entity @e[scores={QG7_Correct=32}] run title @a[tag=G7] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG7_Correct=32}] run title @a[tag=G7] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG7_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG7_Correct=35}] run tellraw @a[tag=G7] ["",{"text":" (✔) CORRECT: For a level 30 enchantment, you need at least 15 bookshelves. But they need to be in a specific placement around the Enchanting Table.","color":"white","bold":false}]
execute if entity @e[scores={QG7_Correct=35}] run fill 1062 63 1004 1062 63 1004 air replace green_concrete
execute if entity @e[scores={QG7_Correct=35}] run setblock 1062 65 1010 air
execute if entity @e[scores={QG7_Correct=35}] run setblock 1062 64 1010 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG7_Correct=35}] at @a[tag=G7] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG7_Correct=35..}] run scoreboard objectives remove QG7_Correct

execute if entity @e[scores={QG7_Correct=30}] run fill 1054 65 982 1055 67 982 air
execute if entity @e[scores={QG7_Correct=32}] run fill 1054 65 983 1055 67 983 air
execute if entity @e[scores={QG7_Correct=34}] run fill 1051 65 984 1058 67 984 clay replace redstone_block
execute if entity @e[scores={QG7_Correct=34}] run fill 1053 64 934 1056 64 937 cut_sandstone
execute if entity @e[scores={QG7_Correct=34}] run setblock 1056 66 933 lever[face=floor,facing=north]

execute align x align y align z if entity @a[x=1053,y=62,z=934,dx=3,dy=5,dz=2] run fill 1053 64 934 1056 64 937 air destroy
execute align x align y align z if entity @a[x=1053,y=17,z=934,dx=3,dy=10,dz=3] run fill 1053 64 934 1056 64 937 cut_sandstone replace air

###

# QUESTION GREEN 8 -> NOTE BLOCKS / JUNGLE ROOM
execute if block 1062 64 1010 stone_button[powered=true] run scoreboard objectives add Question_G8 dummy
execute if block 1062 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G8 1
execute if block 1062 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_G8

execute if entity @e[scores={Question_G8=1}] run setblock 1071 255 993 cobweb
execute if entity @e[scores={Question_G8=1}] run setblock 1065 255 993 cobweb
execute if entity @e[scores={Question_G8=1}] run setblock 1065 255 987 cobweb
execute if entity @e[scores={Question_G8=1}] run setblock 1071 255 987 cobweb

execute if entity @e[scores={Question_G8=4}] run summon skeleton 1065 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:clay",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG8","TriviaMobG8A"]}
execute if entity @e[scores={Question_G8=9}] run summon skeleton 1059 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG8","TriviaMobG8B"]}
execute if entity @e[scores={Question_G8=14}] run summon skeleton 1059 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:packed_ice",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG8","TriviaMobG8C"]}
execute if entity @e[scores={Question_G8=19}] run summon skeleton 1065 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:bone_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG8","TriviaMobG8D"]}

execute as @e[tag=TriviaMobG8] run scoreboard players set @e[scores={Question_G8=3}] Question_G8 19
execute if entity @e[scores={Question_G8=19}] run tellraw @a[tag=G8] ["",{"text":" Q: Note Blocks create different sounds based on what block you place them on. Which block would cause a Note Block to use the ","color":"green","bold":false},{"text":"flute","color":"green","italic":true},{"text":" sound?","color":"green","italic":false}]

execute if entity @e[tag=TriviaMobG8A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG8A] unless entity @e[tag=TriviaAECG8A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG8","TriviaAECG8A"],Duration:2147483647,CustomName:"{\"text\":\"Clay\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG8B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG8B] unless entity @e[tag=TriviaAECG8B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG8","TriviaAECG8B"],Duration:2147483647,CustomName:"{\"text\":\"Gold Block\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG8C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG8C] unless entity @e[tag=TriviaAECG8C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG8","TriviaAECG8C"],Duration:2147483647,CustomName:"{\"text\":\"Packed Ice\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG8D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG8D] unless entity @e[tag=TriviaAECG8D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECG8","TriviaAECG8D"],Duration:2147483647,CustomName:"{\"text\":\"Bone Block\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG8A] as @e[tag=TriviaMobG8A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG8B] as @e[tag=TriviaMobG8B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG8C] as @e[tag=TriviaMobG8C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG8D] as @e[tag=TriviaMobG8,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG8A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG8A]
execute if entity @e[tag=TriviaMobG8B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG8B]
execute if entity @e[tag=TriviaMobG8C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG8C]
execute if entity @e[tag=TriviaMobG8D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG8D]

execute unless entity @e[tag=TriviaMobG8A] run kill @e[tag=TriviaAECG8A]
execute unless entity @e[tag=TriviaMobG8B] run kill @e[tag=TriviaAECG8B]
execute unless entity @e[tag=TriviaMobG8C] run kill @e[tag=TriviaAECG8C]
execute unless entity @e[tag=TriviaMobG8D] run kill @e[tag=TriviaAECG8D]

# IF WRONG
execute if entity @e[tag=TriviaMobG8B,nbt={HurtTime:10s}] run teleport @a 1197 6 1019
execute if entity @e[tag=TriviaMobG8C,nbt={HurtTime:10s}] run teleport @a 1197 6 1049
execute if entity @e[tag=TriviaMobG8D,nbt={HurtTime:10s}] run teleport @a 1197 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobG8A,nbt={HurtTime:10s}] run scoreboard objectives add QG8_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG8_Correct 1

execute if entity @e[scores={QG8_Correct=1}] run setblock 1062 65 1010 note_block
execute if entity @e[scores={QG8_Correct=1}] run setblock 1062 64 1010 clay
execute if entity @e[scores={QG8_Correct=1}] run kill @e[tag=TriviaAECG8]
execute if entity @e[scores={QG8_Correct=1}] as @e[tag=TriviaMobG8] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG8_Correct=1}] as @e[tag=TriviaMobG8] run teleport @s ~ 0 ~
execute if entity @e[scores={QG8_Correct=20}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG8_Correct=22}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG8_Correct=23}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG8_Correct=24}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG8_Correct=25}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG8_Correct=26}] at @a[tag=G8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG8_Correct=30}] run playsound entity.firework_rocket.launch master @a 1062 64 1010 1 1 0

execute if entity @e[scores={QG8_Correct=32}] run title @a[tag=G8] times 1 80 1
execute if entity @e[scores={QG8_Correct=32}] run title @a[tag=G8] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG8_Correct=32}] run title @a[tag=G8] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG8_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG8_Correct=35}] run tellraw @a[tag=G8] ["",{"text":" (✔) CORRECT: Standard blocks under the Note Block use the harp sound effect. Clay uses the flute sound. Gold blocks make a bell sound, Packed Ice makes it chime and Bone Blocks play the xylophone.","color":"white","bold":false}]
execute if entity @e[scores={QG8_Correct=35}] run fill 1068 63 996 1068 63 996 air replace green_concrete
execute if entity @e[scores={QG8_Correct=35}] run setblock 1068 64 990 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG8_Correct=35}] at @a[tag=G8] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG8_Correct=35..}] run scoreboard objectives remove QG8_Correct

execute if entity @e[scores={QG8_Correct=1}] run kill @e[tag=ShowerFrame]
execute if entity @e[scores={QG8_Correct=1}] run setblock 1077 65 992 blue_wall_banner[facing=south]
execute if entity @e[scores={QG8_Correct=1}] run setblock 1077 65 982 blue_wall_banner[facing=north]
execute if entity @e[scores={QG8_Correct=1}] run fill 1066 61 984 1070 63 993 stone_brick_stairs[facing=south,half=bottom,waterlogged=true] replace stone_brick_stairs[waterlogged=false]
execute if entity @e[scores={QG8_Correct=1}] run setblock 1065 63 977 stone_brick_stairs[facing=west,half=bottom,waterlogged=true]
execute if entity @e[scores={QG8_Correct=1}] run setblock 1071 63 977 stone_brick_stairs[facing=east,half=bottom,waterlogged=true]
execute if entity @e[scores={QG8_Correct=1}] run setblock 1070 59 992 white_banner[rotation=6]{Patterns:[{Pattern:"ts",Color:11},{Pattern:"ts",Color:11},{Pattern:"ts",Color:11}]}
execute if entity @e[scores={QG8_Correct=1}] run setblock 1066 59 992 white_banner[rotation=10]{Patterns:[{Pattern:"ms",Color:11},{Pattern:"ms",Color:11},{Pattern:"ms",Color:11}]}
execute if entity @e[scores={QG8_Correct=1}] run setblock 1066 59 988 white_banner[rotation=14]{Patterns:[{Pattern:"cs",Color:11},{Pattern:"cs",Color:11},{Pattern:"cs",Color:11}]}
execute if entity @e[scores={QG8_Correct=1}] run setblock 1070 59 988 white_banner[rotation=2]{Patterns:[{Pattern:"drs",Color:11},{Pattern:"drs",Color:11},{Pattern:"drs",Color:11}]}

execute if entity @e[scores={QG8_Correct=10}] run summon item_frame 1077 65 994 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:white_concrete",Count:1b},Tags:["ShowerFrame","ShowerFrame1"]}
execute if entity @e[scores={QG8_Correct=10}] run summon item_frame 1077 65 980 {Invulnerable:true,Facing:3b,Item:{id:"minecraft:white_concrete",Count:1b},Tags:["ShowerFrame","ShowerFrame2"]}

###

# QUESTION GREEN 9 -> BANNERS / POOL ROOM
execute if block 1068 64 990 stone_button[powered=true] run scoreboard objectives add Question_G9 dummy
execute if block 1068 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G9 1
execute if block 1068 64 990 stone_button[powered=false] run scoreboard objectives remove Question_G9

execute if entity @e[scores={Question_G9=1}] run setblock 1071 255 993 cobweb
execute if entity @e[scores={Question_G9=1}] run setblock 1065 255 993 cobweb
execute if entity @e[scores={Question_G9=1}] run setblock 1065 255 987 cobweb
execute if entity @e[scores={Question_G9=1}] run setblock 1071 255 987 cobweb

execute if entity @e[scores={Question_G9=4}] run summon skeleton 1071 60 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],Silent:true,NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG9","TriviaMobG9A"]}
execute if entity @e[scores={Question_G9=9}] run summon skeleton 1065 60 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],Silent:true,NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG9","TriviaMobG9B"]}
execute if entity @e[scores={Question_G9=14}] run summon skeleton 1065 60 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],Silent:true,NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG9","TriviaMobG9C"]}
execute if entity @e[scores={Question_G9=19}] run summon skeleton 1071 60 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],Silent:true,NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG9","TriviaMobG9D"]}

execute if entity @e[tag=TriviaMobG9A,scores={TriviaMobAge=1}] run setblock 1071 64 993 white_banner[rotation=6]{Patterns:[{Pattern:"ts",Color:11},{Pattern:"ts",Color:11},{Pattern:"ts",Color:11}]}
execute if entity @e[tag=TriviaMobG9B,scores={TriviaMobAge=1}] run setblock 1065 64 993 white_banner[rotation=10]{Patterns:[{Pattern:"ms",Color:11},{Pattern:"ms",Color:11},{Pattern:"ms",Color:11}]}
execute if entity @e[tag=TriviaMobG9C,scores={TriviaMobAge=1}] run setblock 1065 64 987 white_banner[rotation=14]{Patterns:[{Pattern:"cs",Color:11},{Pattern:"cs",Color:11},{Pattern:"cs",Color:11}]}
execute if entity @e[tag=TriviaMobG9D,scores={TriviaMobAge=1}] run setblock 1071 64 987 white_banner[rotation=2]{Patterns:[{Pattern:"drs",Color:11},{Pattern:"drs",Color:11},{Pattern:"drs",Color:11}]}

execute if block 1071 64 993 white_banner as @e[tag=TriviaMobG9A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if block 1065 64 993 white_banner as @e[tag=TriviaMobG9B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if block 1065 64 987 white_banner as @e[tag=TriviaMobG9C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if block 1071 64 987 white_banner as @e[tag=TriviaMobG9,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute as @e[tag=TriviaMobG9,scores={TriviaMobAge=1..20}] at @s run teleport @s ~ 64 ~

execute if entity @e[tag=TriviaMobG9] run scoreboard players set @e[scores={Question_G9=3}] Question_G9 19
execute if entity @e[scores={Question_G9=19}] run tellraw @a[tag=G9] ["",{"text":" Q: Which Banner has the pattern design known as a \"Fess\"?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobG9A,nbt={HurtTime:10s}] run setblock 1071 64 993 air
execute if entity @e[tag=TriviaMobG9B,nbt={HurtTime:10s}] run setblock 1065 64 993 air
execute if entity @e[tag=TriviaMobG9C,nbt={HurtTime:10s}] run setblock 1065 64 987 air
execute if entity @e[tag=TriviaMobG9D,nbt={HurtTime:10s}] run setblock 1071 64 987 air

execute unless entity @e[tag=TriviaMobG9A] run setblock 1071 64 993 air
execute unless entity @e[tag=TriviaMobG9B] run setblock 1065 64 993 air
execute unless entity @e[tag=TriviaMobG9C] run setblock 1065 64 987 air
execute unless entity @e[tag=TriviaMobG9D] run setblock 1071 64 987 air

# IF WRONG
execute if entity @e[tag=TriviaMobG9A,nbt={HurtTime:10s}] run teleport @a 1227 6 981
execute if entity @e[tag=TriviaMobG9C,nbt={HurtTime:10s}] run teleport @a 1227 6 951
execute if entity @e[tag=TriviaMobG9D,nbt={HurtTime:10s}] run teleport @a 1228 6 920


# IF CORRECT
execute if entity @e[tag=TriviaMobG9B,nbt={HurtTime:10s}] run scoreboard objectives add QG9_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG9_Correct 1

execute if entity @e[scores={QG9_Correct=1}] run setblock 1068 64 990 air
execute if entity @e[scores={QG9_Correct=1}] run kill @e[tag=TriviaAECG9]
execute if entity @e[scores={QG9_Correct=1}] as @e[tag=TriviaMobG9] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG9_Correct=1}] at @e[tag=TriviaMobG9] run setblock ~ ~ ~ air
execute if entity @e[scores={QG9_Correct=1}] as @e[tag=TriviaMobG9] run teleport @s ~ 0 ~
execute if entity @e[scores={QG9_Correct=20}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG9_Correct=22}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG9_Correct=23}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG9_Correct=24}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG9_Correct=25}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG9_Correct=26}] at @a[tag=G9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG9_Correct=30}] run playsound entity.firework_rocket.launch master @a 1068 64 990 1 1 0

execute if entity @e[scores={QG9_Correct=32}] run title @a[tag=G9] times 1 80 1
execute if entity @e[scores={QG9_Correct=32}] run title @a[tag=G9] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG9_Correct=32}] run title @a[tag=G9] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QG9_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG9_Correct=35}] run tellraw @a[tag=G9] ["",{"text":" (✔) CORRECT: The \"Fess\" banner pattern is a horizontal middle stripe.","color":"white","bold":false}]
#execute if entity @e[scores={QG9_Correct=35}] run fill 1065 255 987 1071 255 993 air replace cobweb
execute if entity @e[scores={QG9_Correct=35}] run fill 1075 63 1004 1075 63 1004 air replace green_concrete
execute if entity @e[scores={QG9_Correct=35}] run setblock 1075 64 1010 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG9_Correct=35}] at @a[tag=G9] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG9_Correct=35..}] run scoreboard objectives remove QG9_Correct

execute if entity @e[scores={QG9_Correct=1}] run kill @e[type=dolphin]
execute if entity @e[scores={QG9_Correct=1}] run playsound entity.dolphin.play master @a 1068 69 980 1 1 1
execute if entity @e[scores={QG9_Correct=1}] run summon dolphin 1068 69 980
execute align x align y align z run effect give @a[x=1068,y=65,z=977,dx=0,dy=0,dz=0] jump_boost 10 2 true
execute if entity @e[scores={QG9_Correct=13}] run playsound entity.dolphin.splash master @a 1068 63 980 2 1 1

#execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:0b}] {Item:{id:"minecraft:white_concrete"}}
execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:1b}] {Item:{id:"minecraft:blue_concrete"}}
execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:3b}] {Item:{id:"minecraft:cyan_concrete"}}
execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:4b}] {Item:{id:"minecraft:light_blue_concrete"}}
execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:5b}] {Item:{id:"minecraft:pink_concrete"}}
execute as @e[tag=ShowerFrame] run data merge entity @s[nbt={ItemRotation:6b}] {Item:{id:"minecraft:red_concrete"}}

execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:1b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:2b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:3b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:4b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:5b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:6b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:7b}] run particle rain 1077 67 994 0.2 1 0.2 1 200 force

execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:1b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:2b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:3b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:4b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:5b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:6b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:7b}] run particle rain 1077 67 980 0.2 1 0.2 1 200 force

execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:1b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:2b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:3b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:4b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:5b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:6b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0
execute if entity @e[tag=ShowerFrame1,nbt={ItemRotation:7b}] run playsound weather.rain master @a 1077 75 994 0.5 0.7 0

execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:1b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:2b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:3b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:4b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:5b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:6b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0
execute if entity @e[tag=ShowerFrame2,nbt={ItemRotation:7b}] run playsound weather.rain master @a 1077 75 980 0.5 0.7 0

execute as @e[tag=ShowerFrame,nbt={Item:{id:"minecraft:red_concrete"},ItemRotation:0b}] run stopsound @a[x=1075,y=64,z=979,dx=7,dy=3,dz=14]
execute as @e[tag=ShowerFrame,nbt={ItemRotation:0b}] run data merge entity @s {Item:{id:"minecraft:white_concrete"}}

execute if entity @e[scores={QG9_Correct=1}] run kill @e[tag=ElytraFrame]
execute if entity @e[scores={QG9_Correct=10}] run summon item_frame 1071 66 1011 {Invulnerable:true,Facing:5b,Item:{id:"minecraft:elytra",Count:1b},Tags:["ElytraFrame"]}
execute if entity @e[scores={QG9_Correct=1}] run fill 1071 65 1010 1071 65 1012 air
execute if entity @e[scores={QG9_Correct=1}] run setblock 1071 65 1012 chest[facing=east]{Items: [{Slot: 0b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 3b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 9b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 10b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 12b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 15b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 22b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 23b, id: "minecraft:diamond_chestplate", Count: 1b, tag: {ench: [{lvl: 3s, id: 34s}, {lvl: 3s, id: 0s}]}}, {Slot: 24b, id: "minecraft:saddle", Count: 1b}]}
execute if entity @e[scores={QG9_Correct=1}] run setblock 1071 65 1010 chest[facing=east]{Items: [{Slot: 3b, id: "minecraft:beetroot_seeds", Count: 1b}, {Slot: 4b, id: "minecraft:iron_pickaxe", Count: 1b, tag: {ench: [{lvl: 3s, id: 34s}, {lvl: 3s, id: 32s}, {lvl: 1s, id: 33s}]}}, {Slot: 12b, id: "minecraft:beetroot_seeds", Count: 1b}, {Slot: 13b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 14b, id: "minecraft:beetroot_seeds", Count: 1b}, {Slot: 15b, id: "minecraft:gold_ingot", Count: 1b}, {Slot: 22b, id: "minecraft:gold_ingot", Count: 1b}]}

execute if entity @e[scores={QG9_Correct=1}] run kill @e[tag=TriviaShulker]
execute if entity @e[scores={QG9_Correct=1}] run kill @e[tag=TriviaShulkerAS]
execute if entity @e[scores={QG9_Correct=25}] run summon shulker 1072 65 1011 {Invulnerable:true,NoAI:true,Color:16b,Tags:["TriviaShulker"]}
execute if entity @e[scores={QG9_Correct=25}] run summon armor_stand 1072 64.65 1011 {NoGravity:true,Invulnerable:true,Invisible:true,Marker:true,Small:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:qmagnet}}],Tags:["TriviaShulkerAS"]}
execute if entity @e[scores={QG9_Correct=1}] run scoreboard objectives add TriviaShulker dummy
execute if entity @e[scores={QG9_Correct=1}] run setblock 1072 63 1011 sea_lantern

###

# QUESTION GREEN 10 -> END POEM / END SHIP ROOM
execute if block 1075 64 1010 stone_button[powered=true] run scoreboard objectives add Question_G10 dummy
execute if block 1075 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_G10 1
execute if block 1075 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_G10

execute if entity @e[scores={Question_G10=4}] run summon skeleton 1078 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:end_stone",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG10","TriviaMobG10A"]}
execute if entity @e[scores={Question_G10=9}] run summon skeleton 1072 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:purpur_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG10","TriviaMobG10B"]}
execute if entity @e[scores={Question_G10=14}] run summon skeleton 1072 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:end_stone_bricks",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG10","TriviaMobG10C"]}
execute if entity @e[scores={Question_G10=19}] run summon skeleton 1078 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:purpur_pillar",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobG10","TriviaMobG10D"]}

execute if entity @e[tag=TriviaMobG10] run scoreboard players set @e[scores={Question_G10=3}] Question_G10 19
execute if entity @e[scores={Question_G10=19}] run tellraw @a[tag=G10] ["",{"text":" Q: What is the opening line of the End Poem that starts directly under the Minecraft logo during the closing credits?","color":"green","italic":false}]

execute if entity @e[tag=TriviaMobG10A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobG10A] unless entity @e[tag=TriviaAECG10A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG10","TriviaAECG10A"],Duration:2147483647,CustomName:"{\"text\":\"It reads our thoughts.\",\"color\":\"dark_aqua\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG10B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobG10B] unless entity @e[tag=TriviaAECG10B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG10","TriviaAECG10B"],Duration:2147483647,CustomName:"{\"text\":\"Wake up.\",\"color\":\"dark_aqua\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG10C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobG10C] unless entity @e[tag=TriviaAECG10C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG10","TriviaAECG10C"],Duration:2147483647,CustomName:"{\"text\":\"I see the player you mean.\",\"color\":\"dark_aqua\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobG10D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobG10D] unless entity @e[tag=TriviaAECG10D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECG10","TriviaAECG10D"],Duration:2147483647,CustomName:"{\"text\":\"Once upon a time, there was a player.\",\"color\":\"dark_aqua\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECG10A] as @e[tag=TriviaMobG10A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG10B] as @e[tag=TriviaMobG10B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG10C] as @e[tag=TriviaMobG10C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECG10D] as @e[tag=TriviaMobG10,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobG10A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG10A]
execute if entity @e[tag=TriviaMobG10B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG10B]
execute if entity @e[tag=TriviaMobG10C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG10C]
execute if entity @e[tag=TriviaMobG10D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECG10D]

execute unless entity @e[tag=TriviaMobG10A] run kill @e[tag=TriviaAECG10A]
execute unless entity @e[tag=TriviaMobG10B] run kill @e[tag=TriviaAECG10B]
execute unless entity @e[tag=TriviaMobG10C] run kill @e[tag=TriviaAECG10C]
execute unless entity @e[tag=TriviaMobG10D] run kill @e[tag=TriviaAECG10D]

execute if entity @e[tag=G10] run scoreboard players add @e[tag=TriviaShulker] TriviaShulker 1
scoreboard players set @e[scores={TriviaShulker=200..}] TriviaShulker 0
data merge entity @e[scores={TriviaShulker=0..},limit=1] {Rotation:[270f,0f]}
data merge entity @e[scores={TriviaShulker=1},limit=1] {Peek:0b}
data merge entity @e[scores={TriviaShulker=70},limit=1] {Peek:40b}
data merge entity @e[scores={TriviaShulker=100},limit=1] {Peek:0b}
execute if entity @e[tag=G10] if entity @e[scores={TriviaShulker=70}] run playsound entity.shulker.ambient hostile @a 1072 64 1011
teleport @e[tag=TriviaShulkerAS] 1072 64.65 1011


# IF WRONG
execute if entity @e[tag=TriviaMobG10A,nbt={HurtTime:10s}] run teleport @a 1227 6 1019
execute if entity @e[tag=TriviaMobG10B,nbt={HurtTime:10s}] run teleport @a 1227 6 1049
execute if entity @e[tag=TriviaMobG10D,nbt={HurtTime:10s}] run teleport @a 1227 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobG10C,nbt={HurtTime:10s}] run scoreboard objectives add QG10_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QG10_Correct 1

execute if entity @e[scores={QG10_Correct=1}] run setblock 1075 64 1010 air
execute if entity @e[scores={QG10_Correct=1}] run kill @e[tag=TriviaAECG10]
execute if entity @e[scores={QG10_Correct=1}] as @e[tag=TriviaMobG10] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QG10_Correct=1}] as @e[tag=TriviaMobG10] run teleport @s ~ 0 ~
execute if entity @e[scores={QG10_Correct=20}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QG10_Correct=22}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QG10_Correct=23}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QG10_Correct=24}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QG10_Correct=25}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QG10_Correct=26}] at @a[tag=G10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QG10_Correct=30}] run playsound entity.firework_rocket.launch master @a 1075 64 1010 1 1 0

execute if entity @e[scores={QG10_Correct=32}] run title @a[tag=G10] times 1 80 1
execute if entity @e[scores={QG10_Correct=32}] run title @a[tag=G10] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QG10_Correct=32}] run title @a[tag=G10] subtitle {"text":"All General Trivia Complete", "color":"white"}
execute if entity @e[scores={QG10_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QG10_Correct=35}] run tellraw @a[tag=G10] ["",{"text":" (✔) CORRECT: After defeating the dragon and entering the exit portal, the \"End Poem\" rolls. Following the Minecraft logo, the poem starts off, \"","color":"white","bold":false},{"text":"I see the player you mean.","color":"dark_aqua","bold":false},{"text":"\", followed by your Minecraft account name.","color":"white","bold":false}]
#execute if entity @e[scores={QG10_Correct=35}] run fill 1068 63 996 1068 63 996 air replace green_concrete
#execute if entity @e[scores={QG10_Correct=35}] run setblock 1068 64 990 stone_button[face=floor,facing=south]
#execute if entity @e[scores={QG10_Correct=35}] at @a[tag=G10] run playsound entity.player.levelup master @a
execute if entity @e[scores={QG10_Correct=35..}] run scoreboard objectives add FinalGreen dummy

execute if entity @e[scores={QG10_Correct=35..}] run scoreboard objectives remove QG10_Correct





# SPAWNPOINT TELEPORTS
# G1
execute align x align y align z run teleport @a[x=1016,y=72,z=985,dx=0,dy=1,dz=0] 1016 67 1000 180 0

# G3
execute align x align y align z run teleport @a[x=1029,y=72,z=985,dx=0,dy=1,dz=0] 1029 67 1000 180 0

# G5
execute align x align y align z run teleport @a[x=1029,y=72,z=995,dx=0,dy=1,dz=0] 1042 67 1000 180 0

# G7
execute align x align y align z run teleport @a[x=1055,y=69,z=986,dx=0,dy=1,dz=0] 1055 67 1000 180 0

# G9
execute align x align y align z run teleport @a[x=1068,y=69,z=995,dx=0,dy=1,dz=0] 1068 67 1000 180 0

