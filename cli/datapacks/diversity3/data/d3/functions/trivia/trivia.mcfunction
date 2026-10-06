####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 10 2018 / MARCH 25 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[tag=!WrongAnswer,nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

execute unless entity @a[tag=WrongAnswer] run gamerule naturalRegeneration true

difficulty easy

#scoreboard objectives setdisplay sidebar TriviaMobAge

#scoreboard objectives setdisplay sidebar CorrectScore
#scoreboard objectives setdisplay sidebar IncorrectScore
#scoreboard objectives setdisplay sidebar Question_0
#scoreboard objectives setdisplay sidebar Q0_Correct
#scoreboard objectives setdisplay sidebar FinalGreen
#scoreboard objectives setdisplay sidebar FinalRed
#scoreboard objectives setdisplay sidebar FinalPurple
#scoreboard objectives setdisplay sidebar FinalLime

scoreboard objectives add TriviaTally dummy {"text":"Trivia Tally","color":"green","bold":"true","underlined":"true"}
#execute if entity @e[tag=TriviaFrameAEC] if block 1009 64 1000 air run scoreboard objectives setdisplay sidebar TriviaTally

scoreboard objectives add CorrectScore dummy
scoreboard players operation @e[tag=MainTriviaAEC] CorrectScore = Correct TriviaTally

scoreboard objectives add IncorrectScore dummy
scoreboard players operation @e[tag=MainTriviaAEC] IncorrectScore = Incorrect TriviaTally

execute if entity @e[scores={CorrectScore=30,IncorrectScore=..29}] run advancement grant @a only d3:folder_b/smart_cookie


scoreboard objectives add TriviaMobAge dummy
scoreboard players add @e[tag=TriviaMob] TriviaMobAge 1

team add Trivia
team modify Trivia collisionRule never
effect give @e[team=Trivia] invisibility 1000000 255 true

execute at @e[scores={TriviaMobAge=1}] run playsound entity.item.pickup master @a ~ ~ ~ 1 1 0
execute as @e[scores={TriviaMobAge=1}] run data merge entity @s {Motion:[0.0d,0.7d,0.0d]}
execute as @e[scores={TriviaMobAge=17}] at @s run teleport @s ~ 62.58 ~ ~ 0
execute as @e[scores={TriviaMobAge=17}] run data merge entity @s {NoAI:true}

execute as @e[tag=TriviaMob,nbt={HurtTime:10s}] run data merge entity @s {NoAI:false}
execute as @e[tag=TriviaMob,nbt={HurtTime:10s}] at @s run teleport @s ~ ~-50 ~
execute as @e[tag=TriviaMob] at @s run data merge entity @s[y=0,dy=17,nbt={NoAI:1b}] {NoAI:0b}


# BRING STRAGGLERS
execute if block 1 4 2 lime_wool run gamemode adventure @a[tag=!InTriviaBranch,tag=!D3Admin]
execute if block 1 4 2 lime_wool run spawnpoint @a[tag=!InTriviaBranch] 1000 64 994
execute if block 1 4 2 lime_wool at @p[tag=WrongAnswer] as @a[tag=!InTriviaBranch] run teleport @s ~ ~ ~
execute if block 1 4 2 lime_wool unless entity @a[tag=WrongAnswer] run teleport @a[tag=!InTriviaBranch] 1000 64 994 0 0
execute if block 1 4 2 lime_wool run clear @a[tag=!InTriviaBranch]
execute if block 1 4 2 lime_wool run tag @a add InTriviaBranch




# RELOAD ISSUE
execute if block 1000 64 1000 stone_button[powered=false] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] run function d3:trivia/setup_blocks

# RUN QUESTION FUNCTIONS
execute align x align y align z if entity @a[x=1008,y=15,z=931,dx=84,dy=60,dz=98] run function d3:trivia/green_questions
execute align x align y align z if entity @a[x=908,y=43,z=1010,dx=115,dy=36,dz=94] run function d3:trivia/red_questions
execute align x align y align z if entity @a[x=913,y=60,z=967,dx=77,dy=16,dz=53] run function d3:trivia/purple_questions


# QUESTION 0
execute if block 1000 64 1000 stone_button[powered=true] unless block 39 25 46 redstone_block run scoreboard objectives add Question_0 dummy
execute if block 1000 64 1000 stone_button[powered=true] unless block 39 25 46 redstone_block run scoreboard players add @e[tag=MainTriviaAEC] Question_0 1
execute if block 1000 64 1000 stone_button[powered=false] run scoreboard objectives remove Question_0

#execute if entity @e[scores={Question_0=4}] run title @a times 20 120 20
#execute if entity @e[scores={Question_0=4}] run title @a title {"text":"IMPORTANT TEXT!","bold":false,"color":"green"}
#execute if entity @e[scores={Question_0=4}] run title @a subtitle {"text":"Keep your eyes on the bottom left.", "color":"white"}

execute if entity @e[scores={Question_0=4}] run summon skeleton 1003 62.5 1003 {Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:lime_terracotta",Count:1b}],Silent:true,Team:Trivia,Tags:["TriviaMob","TriviaMob0","TriviaMob0A"]}
data merge entity @e[tag=TriviaMob0A,limit=1] {Rotation:[135.0f,0.0f]}
execute if entity @e[scores={Question_0=9}] run summon skeleton 997 62.5 1003 {Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:lime_terracotta",Count:1b}],Silent:true,Team:Trivia,Tags:["TriviaMob","TriviaMob0","TriviaMob0B"]}
data merge entity @e[tag=TriviaMob0B,limit=1] {Rotation:[225.0f,0.0f]}
execute if entity @e[scores={Question_0=14}] run summon skeleton 997 62.5 997 {Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:lime_terracotta",Count:1b}],Silent:true,Team:Trivia,Tags:["TriviaMob","TriviaMob0","TriviaMob0C"]}
data merge entity @e[tag=TriviaMob0C,limit=1] {Rotation:[315.0f,0.0f]}
execute if entity @e[scores={Question_0=19}] run summon skeleton 1003 62.5 997 {Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:lime_terracotta",Count:1b}],Silent:true,Team:Trivia,Tags:["TriviaMob","TriviaMob0","TriviaMob0D"]}
data merge entity @e[tag=TriviaMob0D,limit=1] {Rotation:[45.0f,0.0f]}

execute as @e[tag=TriviaMob0] run scoreboard players set @e[scores={Question_0=3}] Question_0 19
execute if entity @e[scores={Question_0=19}] run tellraw @a ["",{"text":" Welcome to the Trivia Branch. Center button presents the question. Punch the answer you believe is correct. ","color":"white","bold":false},{"text":"Do you understand?","color":"green","bold":false,"underlined":false}]

execute if entity @e[tag=TriviaMob0D,scores={TriviaMobAge=25}] at @e[tag=TriviaMob0A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAEC0","TriviaAEC0A"],Duration:2147483647,CustomName:"{\"text\":\"Yes\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMob0D,scores={TriviaMobAge=25}] at @e[tag=TriviaMob0B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAEC0","TriviaAEC0B"],Duration:2147483647,CustomName:"{\"text\":\"No\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMob0D,scores={TriviaMobAge=25}] at @e[tag=TriviaMob0C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAEC0","TriviaAEC0C"],Duration:2147483647,CustomName:"{\"text\":\"I don't get it...\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMob0D,scores={TriviaMobAge=25}] at @e[tag=TriviaMob0D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAEC0","TriviaAEC0D"],Duration:2147483647,CustomName:"{\"text\":\"Questions?!? I hate you!\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAEC0A] as @e[tag=TriviaMob0A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAEC0B] as @e[tag=TriviaMob0B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAEC0C] as @e[tag=TriviaMob0C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAEC0D] as @e[tag=TriviaMob0D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}


# IF WRONG
execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] run title @a subtitle {"text":"You must be joking...", "color":"white"}
execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] run summon creeper 997 64 1003 {Fuse:0}

#execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" Yes I figured you may be a bit ","color":"red","bold":false},{"text":"*slow*","color":"red","bold":false,"italic":true},{"text":". Well, try again anyway...","color":"red","bold":false,"italic":false}]

execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
#execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" Yes I figured you may be a bit ","color":"red","bold":false},{"text":"*slow*","color":"red","bold":false,"italic":true},{"text":". Well, try again anyway...","color":"red","bold":false,"italic":false}]
execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run title @a times 1 140 1
execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run title @a subtitle {"text":"Come on! Are you really that slow?", "color":"white"}
execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run effect give @a slowness 15 5 true

execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run summon vex ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["LoveVex"]}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run summon vex ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["LoveVex"]}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run summon vex ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["LoveVex"]}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run summon vex ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["LoveVex"]}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] at @a run summon vex ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["LoveVex"]}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run effect give @a blindness 15 255 true
#execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run tellraw @a ["",{"text":" Hate is such a strong word. But I love you. And love is blind.","color":"dark_red","bold":false}]

execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run title @a times 1 140 1
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run title @a subtitle {"text":"Hate is strong. But love is blind.", "color":"white"}

execute at @e[tag=LoveVex] run particle heart ~ ~ ~ 1 1 1 0 1 force
execute as @e[tag=LoveVex,nbt={HurtTime:10s}] run kill @s

# IF CORRECT
execute as @e[tag=TriviaMob0A,nbt={HurtTime:10s}] run scoreboard objectives add Q0_Correct dummy

execute as @e[tag=TriviaMob0A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAEC0A]
execute as @e[tag=TriviaMob0B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAEC0B]
execute as @e[tag=TriviaMob0C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAEC0C]
execute as @e[tag=TriviaMob0D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAEC0D]


scoreboard players add @e[tag=MainTriviaAEC] Q0_Correct 1

execute if entity @e[scores={Q0_Correct=1}] run kill @e[type=vex]
execute if entity @e[scores={Q0_Correct=1}] run setblock 1000 64 1000 air
execute if entity @e[scores={Q0_Correct=1}] run kill @e[tag=TriviaAEC0]
execute if entity @e[scores={Q0_Correct=1}] as @e[tag=TriviaMob0] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Q0_Correct=1}] as @e[tag=TriviaMob0] run teleport @s ~ 0 ~
execute if entity @e[scores={Q0_Correct=20}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={Q0_Correct=22}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={Q0_Correct=23}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={Q0_Correct=24}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={Q0_Correct=25}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={Q0_Correct=26}] at @a run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={Q0_Correct=30}] run playsound entity.firework_rocket.launch master @a 1000 64 1000 1 1 0

execute if entity @e[scores={Q0_Correct=1}] run kill @e[tag=TriviaFrameAS]
execute if entity @e[scores={Q0_Correct=1}] run kill @e[tag=TriviaFrameAEC]
execute if entity @e[scores={Q0_Correct=60}] run playsound item.trident.return master @a 1007 67 1000 10 1 0.5
execute if entity @e[scores={Q0_Correct=60}] run summon armor_stand 1008.9 65.6 1000 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:grass_block",Count:1b}],Rotation:[90.0f,0.0f],DisabledSlots:2039583,Tags:["TriviaFrameAS","GreenTriviaFrameAEC"]}
execute if entity @e[scores={Q0_Correct=60}] run summon area_effect_cloud 1008.7 65.95 1000 {Tags:["TriviaFrameAEC","GreenTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"General\",\"color\":\"dark_green\"}",CustomNameVisible:true}
execute if entity @e[scores={Q0_Correct=85}] run playsound item.trident.return master @a 1000 67 1007 10 1.1 0.5
execute if entity @e[scores={Q0_Correct=85}] run summon armor_stand 1000 65.6 1008.9 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Rotation:[180.0f,0.0f],DisabledSlots:2039583,Tags:["TriviaFrameAS","RedTriviaFrameAEC"]}
execute if entity @e[scores={Q0_Correct=85}] run summon area_effect_cloud 1000 65.95 1008.7 {Tags:["TriviaFrameAEC","RedTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"Technical\",\"color\":\"dark_red\"}",CustomNameVisible:true}
execute if entity @e[scores={Q0_Correct=110}] run playsound item.trident.return master @a 993 67 1000 10 1.3 0.5
execute if entity @e[scores={Q0_Correct=110}] run summon armor_stand 992.0 65.55 1000 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"30365a82-8bf5-484e-946d-6cb9458301ae",Properties:{textures:[{Signature:"QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]},Name:"AdamDJM"}}}],Rotation:[270.0f,0.0f],DisabledSlots:2039583,Tags:["TriviaFrameAS","PurpleTriviaFrameAEC"]}
execute if entity @e[scores={Q0_Correct=110}] run summon area_effect_cloud 992.3 65.95 1000 {Tags:["TriviaFrameAEC","PurpleTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"Community\",\"color\":\"dark_purple\"}",CustomNameVisible:true}
execute if entity @e[scores={Q0_Correct=135}] run setblock 1006 63 1013 minecraft:sea_pickle[pickles=4,waterlogged=true]
execute if entity @e[scores={Q0_Correct=135}] run setblock 1006 63 1012 minecraft:sea_pickle[pickles=3,waterlogged=true]
execute if entity @e[scores={Q0_Correct=135}] run fill 1006 66 1012 1006 66 1013 prismarine_stairs[half=top,facing=west]
execute if entity @e[scores={Q0_Correct=135}] run fill 1006 68 1011 1006 68 1019 prismarine_slab[type=bottom]
execute if entity @e[scores={Q0_Correct=135}] run fill 1007 64 1020 1010 67 1021 prismarine_brick_stairs[facing=west,half=bottom] replace stone_brick_stairs
execute if entity @e[scores={Q0_Correct=135}] run fill 1007 64 1020 1010 67 1021 dark_prismarine replace stone_bricks
execute if entity @e[scores={Q0_Correct=135}] run fill 1013 65 1012 1015 65 1012 prismarine_slab[type=bottom]
execute if entity @e[scores={Q0_Correct=135}] run fill 1014 64 1012 1015 64 1012 prismarine_brick_stairs[facing=north,half=top]
execute if entity @e[scores={Q0_Correct=135}] run setblock 1013 64 1012 prismarine_brick_stairs[facing=east,half=top,shape=outer_left]
execute if entity @e[scores={Q0_Correct=135}] run fill 1009 64 1000 1009 65 1000 air destroy
execute if entity @e[scores={Q0_Correct=135}] run fill 1000 64 1009 1000 65 1009 air destroy
execute if entity @e[scores={Q0_Correct=135}] run fill 991 64 1000 991 65 1000 air destroy
#execute if entity @e[scores={Q0_Correct=135}] run scoreboard objectives setdisplay sidebar TriviaTally
execute if entity @e[scores={Q0_Correct=135}] run scoreboard players add Correct TriviaTally 0
execute if entity @e[scores={Q0_Correct=135}] run scoreboard players add Incorrect TriviaTally 0
execute if entity @e[scores={Q0_Correct=135}] run team join CorrectTrivia Correct
execute if entity @e[scores={Q0_Correct=135}] run team join IncorrectTrivia Incorrect
execute if entity @e[scores={Q0_Correct=135}] run fill 1016 63 996 1016 63 996 air replace green_concrete
execute if entity @e[scores={Q0_Correct=135}] run fill 1004 63 1016 1004 63 1016 air replace red_concrete
execute if entity @e[scores={Q0_Correct=135}] run fill 984 63 1004 984 63 1004 air replace purple_concrete
execute if entity @e[scores={Q0_Correct=135}] run setblock 1016 64 990 stone_button[face=floor,facing=north]
execute if entity @e[scores={Q0_Correct=135}] run setblock 1010 64 1016 stone_button[face=floor,facing=east]
execute if entity @e[scores={Q0_Correct=135}] run setblock 984 64 1010 stone_button[face=floor,facing=north]
execute if entity @e[scores={Q0_Correct=135}] run scoreboard objectives remove Q0_Correct

# PERMANENT TRIVIATALLY DISPLAY
execute if block 1000 64 1009 air unless entity @e[scores={Incorrect_R7C=0..790}] unless entity @e[scores={R7CFakeOut=650..}] run scoreboard objectives setdisplay sidebar TriviaTally
#execute if block 1000 64 1009 air unless entity @e[scores={R7CFakeOut=650..}] run scoreboard objectives setdisplay sidebar TriviaTally


###

# PLAYER LOCATION TAGS
tag @a remove G1
tag @a[x=1008,y=62,z=982,dx=14,dy=13,dz=14] add G1

tag @a remove G2
tag @a[x=1016,y=58,z=1004,dx=13,dy=17,dz=25] add G2

tag @a remove G3
tag @a[x=1023,y=62,z=984,dx=12,dy=13,dz=12] add G3

tag @a remove G4
tag @a[x=1030,y=62,z=1004,dx=12,dy=13,dz=12] add G4

tag @a remove G5
tag @a[x=1036,y=62,z=980,dx=12,dy=13,dz=16] add G5

tag @a remove G6
tag @a[x=1043,y=60,z=1004,dx=12,dy=15,dz=12] add G6

tag @a remove G7
tag @a[x=1049,y=15,z=931,dx=12,dy=60,dz=65] add G7

tag @a remove G8
tag @a[x=1056,y=62,z=1004,dx=12,dy=13,dz=12] add G8

tag @a remove G9
tag @a[x=1062,y=59,z=972,dx=21,dy=16,dz=24] add G9

tag @a remove G10
tag @a[x=1069,y=62,z=1004,dx=23,dy=13,dz=12] add G10

#execute if entity @a[tag=P3] run say In Range

tag @a remove R1
tag @a[x=1004,y=62,z=1010,dx=12,dy=13,dz=12] add R1

tag @a remove R2
tag @a[x=984,y=62,z=1017,dx=12,dy=13,dz=12] add R2

tag @a remove R3
tag @a[x=1004,y=62,z=1023,dx=12,dy=14,dz=12] add R3

tag @a remove R4
tag @a[x=908,y=43,z=1030,dx=88,dy=40,dz=12] add R4

tag @a remove R5
tag @a[x=1004,y=62,z=1036,dx=17,dy=13,dz=12] add R5

tag @a remove R6
tag @a[x=984,y=61,z=1043,dx=12,dy=14,dz=12] add R6

tag @a remove R7
tag @a[x=1004,y=62,z=1049,dx=19,dy=13,dz=11] add R7

tag @a remove R8
tag @a[x=984,y=62,z=1056,dx=12,dy=13,dz=12] add R8

tag @a remove R9
tag @a[x=1004,y=62,z=1061,dx=16,dy=13,dz=16] add R9

tag @a remove R10
tag @a[x=982,y=62,z=1069,dx=14,dy=13,dz=35] add R10


tag @a remove P1
tag @a[x=979,y=62,z=1004,dx=12,dy=13,dz=12] add P1

tag @a remove P2
tag @a[x=970,y=62,z=967,dx=14,dy=11,dz=29] add P2

tag @a remove P3
tag @a[x=964,y=60,z=1004,dx=14,dy=14,dz=23] add P3

tag @a remove P4
tag @a[x=958,y=62,z=984,dx=12,dy=14,dz=12] add P4

tag @a remove P5
tag @a[x=952,y=62,z=1004,dx=12,dy=11,dz=21] add P5

tag @a remove P6
tag @a[x=945,y=62,z=984,dx=12,dy=14,dz=12] add P6

tag @a remove P7
tag @a[x=939,y=62,z=1004,dx=12,dy=13,dz=21] add P7

tag @a remove P8
tag @a[x=932,y=62,z=984,dx=12,dy=13,dz=12] add P8

tag @a remove P9
tag @a[x=926,y=62,z=1004,dx=12,dy=13,dz=17] add P9

tag @a remove P10
tag @a[x=920,y=62,z=979,dx=12,dy=13,dz=17] add P10


# SET UP FINAL BIT
execute as @e[tag=FinalTriviaAS] run data merge entity @s {Invisible:true}

execute if block 37 2 46 green_stained_glass if block 1084 66 1000 air run setblock 1084 66 1000 green_stained_glass
execute if block 37 2 46 green_stained_glass unless entity @e[tag=FinalGreenAS] run summon armor_stand 1084 66.18 1000 {Marker:1b,NoGravity:1b,DisabledSlots:2039583,Tags:["FinalTriviaPiece","FinalTriviaAS","FinalGreenAS","ContainedPiece"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:lime_dye",Count:1b},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["FinalTriviaPiece","FinalItem","FinalGreenItem","ContainedPiece"]}]}

execute if block 35 2 46 red_stained_glass if block 1000 66 1084 air run setblock 1000 66 1084 red_stained_glass
execute if block 35 2 46 red_stained_glass unless entity @e[tag=FinalRedAS] run summon armor_stand 1000 66.18 1084 {Marker:1b,NoGravity:1b,DisabledSlots:2039583,Tags:["FinalTriviaPiece","FinalTriviaAS","FinalRedAS","ContainedPiece"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:string",Count:1b},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["FinalTriviaPiece","FinalItem","FinalRedItem","ContainedPiece"]}]}

execute if block 33 2 46 purple_stained_glass if block 916 66 1000 air run setblock 916 66 1000 purple_stained_glass
execute if block 33 2 46 purple_stained_glass unless entity @e[tag=FinalPurpleAS] run summon armor_stand 916 66.18 1000 {Marker:1b,NoGravity:1b,DisabledSlots:2039583,Tags:["FinalTriviaPiece","FinalTriviaAS","FinalPurpleAS","ContainedPiece"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:armor_stand",Count:1b},Age:-32768s,PickupDelay:32767,NoGravity:true,Tags:["FinalTriviaPiece","FinalItem","FinalPurpleItem","ContainedPiece"]}]}


# NEW FIX FOR EXTRA ITEMS
execute if entity @e[tag=FinalGreenAS] run scoreboard objectives add CountGreen dummy
scoreboard players set @e[tag=FinalGreenAS] CountGreen 0
scoreboard players set @e[tag=FinalGreenItem] CountGreen 0
execute as @e[tag=FinalGreenAS] run scoreboard players add @e[tag=FinalGreenAS] CountGreen 1
execute as @e[tag=FinalGreenItem] run scoreboard players add @e[tag=FinalGreenItem] CountGreen 1
execute if entity @e[scores={CountGreen=2..}] run kill @e[tag=FinalGreenAS]
execute if entity @e[scores={CountGreen=2..}] run kill @e[tag=FinalItem]
execute if entity @e[tag=FinalGreenAS,nbt=!{Passengers:[{id:"minecraft:item"}]}] run kill @e[tag=FinalGreenAS]
scoreboard objectives remove CountGreen


execute if entity @e[tag=FinalRedAS] run scoreboard objectives add CountRed dummy
scoreboard players set @e[tag=FinalRedAS] CountRed 0
scoreboard players set @e[tag=FinalRedItem] CountRed 0
execute as @e[tag=FinalRedAS] run scoreboard players add @e[tag=FinalRedAS] CountRed 1
execute as @e[tag=FinalRedItem] run scoreboard players add @e[tag=FinalRedItem] CountRed 1
execute if entity @e[scores={CountRed=2..}] run kill @e[tag=FinalRedAS]
execute if entity @e[scores={CountRed=2..}] run kill @e[tag=FinalItem]
execute if entity @e[tag=FinalRedAS,nbt=!{Passengers:[{id:"minecraft:item"}]}] run kill @e[tag=FinalRedAS]
scoreboard objectives remove CountRed


execute if entity @e[tag=FinalPurpleAS] run scoreboard objectives add CountPurple dummy
scoreboard players set @e[tag=FinalPurpleAS] CountPurple 0
scoreboard players set @e[tag=FinalPurpleItem] CountPurple 0
execute as @e[tag=FinalPurpleAS] run scoreboard players add @e[tag=FinalPurpleAS] CountPurple 1
execute as @e[tag=FinalPurpleItem] run scoreboard players add @e[tag=FinalPurpleItem] CountPurple 1
execute if entity @e[scores={CountPurple=2..}] run kill @e[tag=FinalPurpleAS]
execute if entity @e[scores={CountPurple=2..}] run kill @e[tag=FinalItem]
execute if entity @e[tag=FinalPurpleAS,nbt=!{Passengers:[{id:"minecraft:item"}]}] run kill @e[tag=FinalPurpleAS]
scoreboard objectives remove CountPurple


# FINAL BIT


# GREEN
execute unless entity @e[scores={FinalGreen=0..}] run teleport @e[tag=FinalGreenAS] 1084 66.18 1000
execute align x align y align z if entity @a[x=1073,y=64,z=998,dx=4,dy=2,dz=4] run scoreboard players add @e[tag=MainTriviaAEC] FinalGreen 0
scoreboard players add @e[scores={FinalGreen=0..79}] FinalGreen 1
execute if entity @e[scores={FinalGreen=1}] run setblock 37 2 46 glass
execute if entity @e[scores={FinalGreen=10}] run playsound block.beacon.power_select master @a 1084 66 1000 1 1 0
execute if entity @e[scores={FinalGreen=10..56}] run particle instant_effect 1084 66.4 1000 0.35 0.25 0.35 0 3 force
execute if entity @e[scores={FinalGreen=11}] run playsound entity.guardian.attack master @a 1084 66 1000 2 0.7 1
execute if entity @e[scores={FinalGreen=69}] run setblock 1084 66 1000 air destroy
execute if entity @e[scores={FinalGreen=69..}] run tag @e[tag=FinalGreenItem] remove ContainedPiece
execute if entity @e[scores={FinalGreen=69..}] run tag @e[tag=FinalGreenAS] remove ContainedPiece
execute if entity @e[scores={FinalGreen=70..80}] if entity @e[tag=FinalGreenAS] as @e[tag=FinalGreenAS] at @s run teleport @s ^ ^ ^0.18 facing 1000 66.18 1000
scoreboard players set @e[scores={FinalGreen=80}] FinalGreen 70
execute if entity @e[scores={FinalGreen=70}] at @e[tag=FinalGreenItem] run playsound block.beacon.ambient master @a ~-2 ~ ~ 0.5 1.3 0
execute align x align y align z if entity @e[tag=FinalItem,x=1009,y=66,z=1000,dx=0,dy=1,dz=0] if block 1009 66 1000 quartz_pillar run setblock 1009 66 1000 air destroy
execute align x align y align z if entity @e[tag=FinalItem,x=1009,y=66,z=1000,dx=0,dy=1,dz=0] run kill @e[tag=GreenTriviaFrameAEC]
execute if entity @e[scores={FinalGreen=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] run kill @e[tag=GreenTriviaFrameAEC]
execute if entity @e[scores={FinalFreen=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] unless block 1009 66 1000 air run setblock 1009 66 1000 air
execute align x align y align z if entity @e[tag=FinalGreenItem,x=1000,y=65,z=1000,dx=1,dy=1,dz=0] run scoreboard players set @e[scores={FinalGreen=70..80}] FinalGreen 100
scoreboard players add @e[scores={FinalGreen=100..109}] FinalGreen 1
scoreboard players set @e[scores={FinalGreen=110}] FinalGreen 100
execute if entity @e[scores={FinalGreen=100}] at @e[tag=FinalGreenItem] unless entity @e[scores={FinalLime=50..}] run playsound block.beacon.ambient master @a ~ ~ ~ 0.5 1.3 0

# RED
execute unless entity @e[scores={FinalRed=0..}] run teleport @e[tag=FinalRedAS] 1000 66.18 1084
execute align x align y align z if entity @a[x=998,y=64,z=1073,dx=4,dy=2,dz=4] run scoreboard players add @e[tag=MainTriviaAEC] FinalRed 0
scoreboard players add @e[scores={FinalRed=0..79}] FinalRed 1
execute if entity @e[scores={FinalRed=1}] run setblock 35 2 46 glass
execute if entity @e[scores={FinalRed=10}] run playsound block.beacon.power_select master @a 1000 66 1084 1 1 0
execute if entity @e[scores={FinalRed=10..56}] run particle instant_effect 1000 66.4 1084 0.35 0.25 0.35 0 3 force
execute if entity @e[scores={FinalRed=11}] run playsound entity.guardian.attack master @a 1000 66 1084 2 0.7 1
execute if entity @e[scores={FinalRed=69}] run setblock 1000 66 1084 air destroy
execute if entity @e[scores={FinalRed=69..}] run tag @e[tag=FinalRedItem] remove ContainedPiece
execute if entity @e[scores={FinalRed=69..}] run tag @e[tag=FinalRedAS] remove ContainedPiece
execute if entity @e[scores={FinalRed=70..80}] if entity @e[tag=FinalRedAS] as @e[tag=FinalRedAS] at @s run teleport @s ^ ^ ^0.18 facing 1000 66.18 1000
scoreboard players set @e[scores={FinalRed=80}] FinalRed 70
execute if entity @e[scores={FinalRed=70}] at @e[tag=FinalRedItem] run playsound block.beacon.ambient master @a ~ ~ ~-2 0.5 1.4 0
execute align x align y align z if entity @e[tag=FinalItem,x=1000,y=66,z=1009,dx=0,dy=1,dz=0] if block 1000 66 1009 quartz_pillar run setblock 1000 66 1009 air destroy
execute align x align y align z if entity @e[tag=FinalItem,x=1000,y=66,z=1009,dx=0,dy=1,dz=0] run kill @e[tag=RedTriviaFrameAEC]
execute if entity @e[scores={FinalRed=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] run kill @e[tag=RedTriviaFrameAEC]
execute if entity @e[scores={FinalRed=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] unless block 1000 66 1009 air run setblock 1000 66 1009 air
execute align x align y align z if entity @e[tag=FinalRedItem,x=1000,y=65,z=1000,dx=0,dy=1,dz=1] run scoreboard players set @e[scores={FinalRed=70..80}] FinalRed 100
scoreboard players add @e[scores={FinalRed=100..109}] FinalRed 1
scoreboard players set @e[scores={FinalRed=110}] FinalRed 100
execute if entity @e[scores={FinalRed=100}] at @e[tag=FinalRedItem] unless entity @e[scores={FinalLime=50..}] run playsound block.beacon.ambient master @a ~ ~ ~ 0.5 1.4 0

# PURPLE
execute unless entity @e[scores={FinalPurple=0..}] run teleport @e[tag=FinalPurpleAS] 916 66.18 1000
execute align x align y align z if entity @a[x=923,y=64,z=998,dx=4,dy=2,dz=4] run scoreboard players add @e[tag=MainTriviaAEC] FinalPurple 0
scoreboard players add @e[scores={FinalPurple=0..79}] FinalPurple 1
execute if entity @e[scores={FinalPurple=1}] run setblock 33 2 46 glass
execute if entity @e[scores={FinalPurple=10}] run playsound block.beacon.power_select master @a 916 66 1000 1 1 0
execute if entity @e[scores={FinalPurple=10..56}] run particle instant_effect 916 66.4 1000 0.35 0.25 0.35 0 3 force
execute if entity @e[scores={FinalPurple=11}] run playsound entity.guardian.attack master @a 916 66 1000 2 0.7 1
execute if entity @e[scores={FinalPurple=69}] run setblock 916 66 1000 air destroy
execute if entity @e[scores={FinalPurple=69..}] run tag @e[tag=FinalPurpleItem] remove ContainedPiece
execute if entity @e[scores={FinalPurple=69..}] run tag @e[tag=FinalPurpleAS] remove ContainedPiece
execute if entity @e[scores={FinalPurple=70..80}] if entity @e[tag=FinalPurpleAS] as @e[tag=FinalPurpleAS] at @s run teleport @s ^ ^ ^0.18 facing 1000 66.18 1000
scoreboard players set @e[scores={FinalPurple=80}] FinalPurple 70
execute if entity @e[scores={FinalPurple=70}] at @e[tag=FinalPurpleItem] run playsound block.beacon.ambient master @a ~2 ~ ~ 0.5 1.4 0
execute align x align y align z if entity @e[tag=FinalItem,x=991,y=66,z=1000,dx=0,dy=1,dz=0] if block 991 66 1000 quartz_pillar run setblock 991 66 1000 air destroy
execute align x align y align z if entity @e[tag=FinalItem,x=991,y=66,z=1000,dx=0,dy=1,dz=0] run kill @e[tag=PurpleTriviaFrameAEC]
execute if entity @e[scores={FinalPurple=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] run kill @e[tag=PurpleTriviaFrameAEC]
execute if entity @e[scores={FinalPurple=100..}] unless entity @e[scores={Incorrect_R7C=0..}] unless entity @e[scores={R7CFakeOut=0..}] unless block 991 66 1000 air run setblock 991 66 1000 air
execute align x align y align z if entity @e[tag=FinalPurpleItem,x=999,y=65,z=1000,dx=1,dy=1,dz=0] run scoreboard players set @e[scores={FinalPurple=70..80}] FinalPurple 100
scoreboard players add @e[scores={FinalPurple=100..109}] FinalPurple 1
scoreboard players set @e[scores={FinalPurple=110}] FinalPurple 100
execute if entity @e[scores={FinalPurple=100}] at @e[tag=FinalPurpleItem] unless entity @e[scores={FinalLime=50..}] run playsound block.beacon.ambient master @a ~ ~ ~ 0.5 1.4 0


# ROTATION ANIMATION
execute if entity @e[scores={FinalGreen=100..}] unless entity @e[scores={R7CFakeOut=0..650}] unless entity @e[scores={FinalLime=1..99}] as @e[tag=FinalGreenAS] at @s run teleport @s ^0.15 ^ ^0.01 facing 1000 70 1000
execute if entity @e[scores={FinalRed=100..}] unless entity @e[scores={FinalLime=1..99}] as @e[tag=FinalRedAS] at @s run teleport @s ^0.15 ^ ^0.01 facing 1000 70 1000
execute if entity @e[scores={FinalPurple=100..}] unless entity @e[scores={R7CFakeOut=0..650}] unless entity @e[scores={FinalLime=1..99}] as @e[tag=FinalPurpleAS] at @s run teleport @s ^0.15 ^ ^0.01 facing 1000 70 1000

execute if entity @e[scores={FinalGreen=100..,FinalRed=100..,FinalPurple=100..}] run scoreboard objectives add FinalLime dummy
scoreboard players add @e[tag=MainTriviaAEC] FinalLime 0

execute align x align y align z if entity @e[tag=FinalGreenAS,x=998,y=68,z=998,dx=4,dy=2,dz=4] align x align y align z if entity @e[tag=FinalRedAS,x=998,y=68,z=998,dx=4,dy=2,dz=4] align x align y align z if entity @e[tag=FinalPurpleAS,x=998,y=68,z=998,dx=4,dy=2,dz=4] run scoreboard players set @e[scores={FinalLime=0}] FinalLime 1

execute if entity @e[scores={FinalLime=1}] as @e[tag=FinalGreenAS] at @s run teleport @s ^ ^ ^0.05 facing 1002 70 998
execute if entity @e[scores={FinalLime=1}] as @e[tag=FinalRedAS] at @s run teleport @s ^ ^ ^0.05 facing 1000 70 1002
execute if entity @e[scores={FinalLime=1}] as @e[tag=FinalPurpleAS] at @s run teleport @s ^ ^ ^0.05 facing 998 70 998

execute if entity @e[scores={FinalLime=1}] align x align y align z if entity @e[tag=FinalGreenAS,x=1002,y=69,z=998,dx=0,dy=2,dz=0] align x align y align z if entity @e[tag=FinalRedAS,x=1000,y=69,z=1002,dx=0,dy=2,dz=0] align x align y align z if entity @e[tag=FinalPurpleAS,x=998,y=69,z=998,dx=0,dy=2,dz=0] run scoreboard players set @e[scores={FinalLime=1}] FinalLime 2

scoreboard players add @e[scores={FinalLime=2..100}] FinalLime 1
#execute if entity @e[scores={FinalLime=50}] run stopsound @a
execute if entity @e[scores={FinalLime=50}] run playsound entity.guardian.attack master @a 1000 67 1000 2 0.8 1
execute if entity @e[scores={FinalLime=50..90}] at @e[tag=FinalTriviaAS] run particle instant_effect ~ ~0.15 ~ 0.1 0.1 0.1 0 1 force
execute if entity @e[scores={FinalLime=100}] run playsound entity.wither.shoot master @a 1000 67 1000 0.3 1.5 0
execute if entity @e[scores={FinalLime=100..}] as @e[tag=FinalTriviaAS] at @s run teleport @s ^ ^ ^0.5 facing 1000 70 1000
execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=1,dz=0] run particle cloud 1000 70 1000 1 1 1 0 130 force
execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] run stopsound @a
execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] run playsound block.end_gateway.spawn master @a 1000 70 1000 1 1.5 0
execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] run kill @e[tag=Triviaqmagnet]
#execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] run summon armor_stand 1000 70 1000 {Tags:["Triviaqmagnet"],Invulnerable:true,Rotation:[180.0f,0.0f],CustomName:"{\"text\":\"qmagnet\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,HandItems:[{id:"minecraft:lime_wool",Count:0b}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}},Count:1b}],Pose:{Head:[40f,0f,0f]},DisabledSlots:2039583}
execute if entity @e[scores={FinalLime=101}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] unless entity @e[tag=Triviaqmagnet] run summon armor_stand 1000 70 1000 {Tags:["Triviaqmagnet"],Invulnerable:true,Rotation:[180.0f,0.0f],CustomName:"{\"text\":\"qmagnet\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,HandItems:[{id:"minecraft:lime_wool",Count:0b}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}},Count:1b}],Pose:{Head:[40f,0f,0f]},DisabledSlots:2039583}
execute if entity @e[scores={FinalLime=100..}] align x align y align z if entity @e[tag=FinalTriviaAS,x=1000,y=70,z=1000,dx=0,dy=0,dz=0] run kill @e[tag=FinalTriviaPiece]
#execute if entity @e[scores={FinalLime=101}] if entity @e[tag=Triviaqmagnet] run kill @e[tag=FinalTriviaPiece]
execute if entity @e[scores={FinalLime=101}] as @e[tag=Triviaqmagnet] at @s run teleport @s ~ ~-0.05 ~
execute align x align y align z if entity @e[tag=Triviaqmagnet,x=999,y=63,z=999,dx=2,dy=0,dz=2] run scoreboard players set @e[scores={FinalLime=101}] FinalLime 102
execute if entity @e[scores={FinalLime=102}] run teleport @e[tag=Triviaqmagnet] 1000 64 1000
scoreboard players add @e[scores={FinalLime=102..}] FinalLime 1

execute if entity @e[scores={FinalLime=103}] run playsound block.metal.step master @a 1000 63 1000 0.5 0.5 0
execute if entity @e[scores={FinalLime=110}] run data merge entity @e[tag=Triviaqmagnet,limit=1] {Pose:{Head:[0f,0f,0f]}}
execute if entity @e[scores={FinalLime=115..}] as @e[tag=Triviaqmagnet] at @s run teleport @s ^ ^ ^ facing entity @p[x=1000,y=64,z=1000]

execute if entity @e[scores={FinalLime=120}] run tellraw @a ["",{"text":"<qmagnet> ","color":"green","bold":false},{"text":"Well done. You passed.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinalLime=160}] run tellraw @a ["",{"text":"<qmagnet> ","color":"green","bold":false},{"text":"Barely...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={FinalLime=170}] run playsound block.wool.step master @a 1000 64 1000 0.5 1 0
execute if entity @e[scores={FinalLime=170..}] run data merge entity @e[tag=Triviaqmagnet,limit=1] {HandItems:[{id:"minecraft:lime_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,-20f,10f]}}




# COMPLETE BRANCH
tag @a remove HasLimeWool
execute if entity @e[scores={FinalLime=120..}] run tag @p[nbt={Inventory:[{id:"minecraft:lime_wool"}]}] add HasLimeWool
execute if entity @p[tag=HasLimeWool] if entity @e[scores={CorrectScore=30,IncorrectScore=..9}] run advancement grant @a only d3:folder_b/brainiac
execute if entity @p[tag=HasLimeWool] run clear @a
replaceitem entity @p[tag=HasLimeWool] weapon.mainhand lime_wool
execute if entity @p[tag=HasLimeWool] run setblock 46 2 46 clay
execute if entity @p[tag=HasLimeWool] run teleport @a 40 4 33 0 -90
