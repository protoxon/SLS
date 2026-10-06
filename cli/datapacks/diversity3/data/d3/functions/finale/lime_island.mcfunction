####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 26 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LimeIsland
#scoreboard objectives setdisplay sidebar FinaleLimeMobAge

execute if block 8 6 110 clay run scoreboard objectives add LimeIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] LimeIsland 0

execute if entity @e[scores={LimeIsland=0}] if block 96 60 5239 air run setblock 96 60 5239 stone_button[face=floor,facing=south,powered=false]


# SET MOB AGE
execute if block 8 6 110 clay run scoreboard objectives add FinaleLimeMobAge dummy
scoreboard players add @e[tag=FinaleTriviaMob] FinaleLimeMobAge 1

effect give @e[tag=FinaleTriviaMob] invisibility 1000000 255 true

execute at @e[scores={FinaleLimeMobAge=1}] run playsound entity.item.pickup master @a ~ ~ ~ 1 1 0
execute as @e[scores={FinaleLimeMobAge=17}] at @s run teleport @s ~ 58.58 ~ ~ 0
execute as @e[scores={FinaleLimeMobAge=17}] run data merge entity @s {NoAI:1b,Invulnerable:0b}

execute as @e[tag=FinaleTriviaMob,nbt={HurtTime:10s}] run data merge entity @s {NoAI:0b}
execute as @e[tag=FinaleTriviaMob,nbt={HurtTime:10s}] at @s run teleport @s ~ ~-100 ~

# QUESTION
#execute if block 96 60 5239 stone_button[powered=true] run scoreboard objectives add LimeIsland dummy
execute if block 96 60 5239 stone_button[powered=true] run scoreboard players add @e[tag=MainFinaleAEC] LimeIsland 1
execute if block 96 60 5239 stone_button[powered=false] run scoreboard players set @e[scores={LimeIsland=..499}] LimeIsland 0

execute if entity @e[scores={LimeIsland=4}] run summon skeleton 99 58.5 5242 {Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:blue_ice",Count:1b}],Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Motion:[0.0d,0.7d,0.0d],Attributes:[{Name:"generic.attackDamage",Base:0.0},{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["FinaleTriviaMob","FinaleTriviaMob1"]}
data merge entity @e[tag=FinaleTriviaMob1,limit=1] {Rotation:[135.0f,0.0f]}

execute if entity @e[scores={LimeIsland=9}] run summon skeleton 93 58.5 5242 {Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:dispenser",Count:1b}],Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Motion:[0.0d,0.7d,0.0d],Attributes:[{Name:"generic.attackDamage",Base:0.0},{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["FinaleTriviaMob","FinaleTriviaMob2"]}
data merge entity @e[tag=FinaleTriviaMob2,limit=1] {Rotation:[225.0f,0.0f]}

execute if entity @e[scores={LimeIsland=14}] run summon skeleton 93 58.5 5236 {Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}}}],Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Motion:[0.0d,0.7d,0.0d],Attributes:[{Name:"generic.attackDamage",Base:0.0},{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["FinaleTriviaMob","FinaleTriviaMob3"]}
data merge entity @e[tag=FinaleTriviaMob3,limit=1] {Rotation:[315.0f,0.0f]}

execute if entity @e[scores={LimeIsland=19}] run summon skeleton 99 58.5 5236 {Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:lime_terracotta",Count:1b}],Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Motion:[0.0d,0.7d,0.0d],Attributes:[{Name:"generic.attackDamage",Base:0.0},{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["FinaleTriviaMob","FinaleTriviaMob4"]}
data merge entity @e[tag=FinaleTriviaMob4,limit=1] {Rotation:[45.0f,0.0f]}

execute if entity @e[tag=FinaleTriviaMob] run scoreboard players set @e[scores={LimeIsland=3}] LimeIsland 19
execute if entity @e[scores={LimeIsland=19}] run tellraw @a ["",{"text":" Q: What was the very first correct answer back in the Trivia Branch?","color":"green","bold":false,"underlined":false}]

execute if entity @e[tag=FinaleTriviaMob4,scores={FinaleLimeMobAge=25}] at @e[tag=FinaleTriviaMob1] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["FinaleTriviaAEC","FinaleTriviaAEC1"],Duration:2147483647,CustomName:"{\"text\":\"Popsicles\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=FinaleTriviaMob4,scores={FinaleLimeMobAge=25}] at @e[tag=FinaleTriviaMob2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["FinaleTriviaAEC","FinaleTriviaAEC2"],Duration:2147483647,CustomName:"{\"text\":\"40 blocks\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=FinaleTriviaMob4,scores={FinaleLimeMobAge=25}] at @e[tag=FinaleTriviaMob3] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["FinaleTriviaAEC","FinaleTriviaAEC3"],Duration:2147483647,CustomName:"{\"text\":\"qmagnet\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=FinaleTriviaMob4,scores={FinaleLimeMobAge=25}] at @e[tag=FinaleTriviaMob4] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["FinaleTriviaAEC","FinaleTriviaAEC4"],Duration:2147483647,CustomName:"{\"text\":\"Yes\",\"color\":\"white\"}",CustomNameVisible:true}


# IF WRONG
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run kill @e[tag=FinaleTriviaAEC1]
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run kill @e[tag=FinaleTriviaAEC2]
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run kill @e[tag=FinaleTriviaAEC3]
execute if entity @e[tag=FinaleTriviaMob4,nbt={HurtTime:10s}] run kill @e[tag=FinaleTriviaAEC]

execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run playsound item.totem.use master @a 96 60 5239 30 1 0
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run title @a title {"text":"NOPE!","bold":false,"color":"red"}
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run title @a subtitle {"text":"Can't remember?", "color":"white"}
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run effect give @a blindness 3 255 true
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run spawnpoint @a 0 34 4998
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run teleport @a -5 40 4997 321 0
execute if entity @e[tag=FinaleTriviaMob1,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" [X] It wasn't Popsicles. Let's jog that memory. Better retrace your steps.","color":"red","bold":false,"italic":false}]

execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run playsound item.totem.use master @a 96 60 5239 30 1 0
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run title @a title {"text":"NAH!","bold":false,"color":"red"}
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run title @a subtitle {"text":"Not 40 blocks", "color":"white"}
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run effect give @a blindness 1 255 true
#execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run spawnpoint @a 0 34 4998
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] as @a at @s run teleport @s ~ ~40 ~
execute if entity @e[tag=FinaleTriviaMob2,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" [X] Not 40 blocks. But this is.","color":"red","bold":false,"italic":false}]

execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run playsound item.totem.use master @a 96 60 5239 30 1 0
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run title @a title {"text":"NO WAY!","bold":false,"color":"red"}
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run title @a subtitle {"text":"It wasn't qmagnet", "color":"white"}
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run effect give @a blindness 1 255 true
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] at @a run summon area_effect_cloud ~ ~ ~ {Tags:["FinaleTriviaAEC","FinaleTriviaStopAEC"],Duration:400}
execute if entity @e[tag=FinaleTriviaMob3,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" [X] Maybe you should just stop and think about it for a moment.","color":"red","bold":false,"italic":false}]
execute if entity @e[tag=FinaleTriviaStopAEC] as @a at @e[tag=FinaleTriviaStopAEC,sort=nearest,limit=1] run teleport @s ~ ~ ~


# IF CORRECT
execute as @e[tag=FinaleTriviaMob4,nbt={HurtTime:10s}] run scoreboard players set @e[scores={LimeIsland=..499}] LimeIsland 500 

scoreboard players add @e[scores={LimeIsland=500..}] LimeIsland 1

execute if entity @e[scores={LimeIsland=501}] run kill @e[tag=FinaleTriviaAEC]
execute if entity @e[scores={LimeIsland=501..}] as @e[tag=FinaleTriviaMob] run data merge entity @s {NoAI:0b}
execute if entity @e[scores={LimeIsland=501..}] as @e[tag=FinaleTriviaMob] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={LimeIsland=501}] run setblock 96 60 5239 air
execute if entity @e[scores={LimeIsland=520}] run playsound block.note_block.chime master @a 96 60 5239 2 1 1
execute if entity @e[scores={LimeIsland=522}] run playsound block.note_block.chime master @a 96 60 5239 2 1.1 1
execute if entity @e[scores={LimeIsland=523}] run playsound block.note_block.chime master @a 96 60 5239 2 1.2 1
execute if entity @e[scores={LimeIsland=524}] run playsound block.note_block.chime master @a 96 60 5239 2 1.3 1
execute if entity @e[scores={LimeIsland=525}] run playsound block.note_block.chime master @a 96 60 5239 2 1.4 1
execute if entity @e[scores={LimeIsland=526}] run playsound block.note_block.chime master @a 96 60 5239 2 1.5 1
execute if entity @e[scores={LimeIsland=530}] run playsound entity.firework_rocket.launch master @a 96 60 5239 2 1 0


# SET UP FOR WOOL DROP
scoreboard players set @e[scores={LimeIsland=570}] LimeIsland 1000


# WOOL DROPS
execute if entity @e[scores={LimeIsland=1002}] run setblock 8 6 110 lime_wool

execute if entity @e[scores={LimeIsland=1002}] run playsound entity.evoker.cast_spell master @a 94 62 5262 2 1 1
execute if entity @e[scores={LimeIsland=1002}] run playsound entity.ender_eye.death master @a 94 62 5262 2 0.5 1
execute if entity @e[scores={LimeIsland=1002}] run playsound entity.player.levelup master @a 94 62 5262 3 1 1

execute if entity @e[scores={LimeIsland=1002}] run kill @e[tag=RandomLimeWoolAEC]
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 93 62 5261 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 94 62 5261 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 95 62 5261 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 93 62 5262 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 94 62 5262 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 95 62 5262 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 93 62 5263 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 94 62 5263 {Tags:["RandomLimeWoolAEC"],Duration:200}
execute if entity @e[scores={LimeIsland=1002}] run summon area_effect_cloud 95 62 5263 {Tags:["RandomLimeWoolAEC"],Duration:200}

execute if entity @e[scores={LimeIsland=1002}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1007}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1012}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1017}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1022}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1027}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1032}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1037}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC
execute if entity @e[scores={LimeIsland=1042}] run tag @e[tag=RandomLimeWoolAEC,limit=1,sort=random] add ChosenLimeWoolAEC

execute if entity @e[scores={LimeIsland=1002..}] at @e[tag=ChosenLimeWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:lime_wool"},Tags:["FinaleWoolFB","LimeWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenLimeWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={LimeIsland=1002..}] if block 93 62 5261 lime_wool if block 94 62 5261 lime_wool if block 95 62 5261 lime_wool if block 93 62 5262 lime_wool if block 94 62 5262 lime_wool if block 95 62 5262 lime_wool if block 93 62 5263 lime_wool if block 94 62 5263 lime_wool if block 95 62 5263 lime_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={LimeIsland=1002..}] if block 93 62 5261 lime_wool if block 94 62 5261 lime_wool if block 95 62 5261 lime_wool if block 93 62 5262 lime_wool if block 94 62 5262 lime_wool if block 95 62 5262 lime_wool if block 93 62 5263 lime_wool if block 94 62 5263 lime_wool if block 95 62 5263 lime_wool run scoreboard objectives remove FinaleLimeMobAge
execute if entity @e[scores={LimeIsland=1002..}] if block 93 62 5261 lime_wool if block 94 62 5261 lime_wool if block 95 62 5261 lime_wool if block 93 62 5262 lime_wool if block 94 62 5262 lime_wool if block 95 62 5262 lime_wool if block 93 62 5263 lime_wool if block 94 62 5263 lime_wool if block 95 62 5263 lime_wool run scoreboard objectives remove LimeIsland

