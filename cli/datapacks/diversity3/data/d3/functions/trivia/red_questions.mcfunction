####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 13 2018 / APRIL 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


#scoreboard objectives setdisplay sidebar PuppyCannon
#scoreboard objectives setdisplay sidebar CodeButton
#scoreboard objectives setdisplay sidebar ThrillRider

# QUESTION RED 1 -> TRIPWIRES / PRISMARINE ROOM
execute if block 1010 64 1016 stone_button[powered=true] run scoreboard objectives add Question_R1 dummy
execute if block 1010 64 1016 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R1 1
execute if block 1010 64 1016 stone_button[powered=false] run scoreboard objectives remove Question_R1

execute if entity @e[scores={Question_R1=4}] run summon skeleton 1013 62.5 1019 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:dispenser",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR1","TriviaMobR1A"]}
execute if entity @e[scores={Question_R1=9}] run summon skeleton 1007 62.5 1019 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:dispenser",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR1","TriviaMobR1B"]}
execute if entity @e[scores={Question_R1=14}] run summon skeleton 1007 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:dispenser",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR1","TriviaMobR1C"]}
execute if entity @e[scores={Question_R1=19}] run summon skeleton 1013 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:dispenser",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR1","TriviaMobR1D"]}

execute if block 1012 64 1021 tripwire_hook[powered=true] run scoreboard objectives add PuppyCannon dummy
scoreboard players add @e[tag=MainTriviaAEC] PuppyCannon 1
execute if entity @e[scores={PuppyCannon=1}] run particle smoke 1012 65.3 1021 0.1 0.1 0.1 0 3 force
execute if entity @e[scores={PuppyCannon=1}] run particle smoke 1012 65.3 1012 0.1 0.1 0.1 0 3 force
execute if entity @e[scores={PuppyCannon=1}] run summon slime 1012 65.15 1022 {NoAI:true,Rotation:[180f,0f],Tags:["CannonPup"],Age:-32768,Size:0,Invulnerable:true}
execute if entity @e[scores={PuppyCannon=1}] run summon magma_cube 1012 65.15 1011 {NoAI:true,Rotation:[0f,0f],Tags:["CannonCat"],Age:-32768,Size:0,Invulnerable:true}
execute if entity @e[scores={PuppyCannon=1}] run playsound item.firecharge.use block @a 1012 65 1022 0.5 1 0
execute if entity @e[scores={PuppyCannon=1}] run playsound item.firecharge.use block @a 1012 65 1011 0.5 1 0
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run effect give @s invisibility 2 255 true
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run playsound entity.player.small_fall master @a ~ ~ ~
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run particle block dispenser ~ ~0.2 ~ 0.1 0.1 0.1 0 20 force
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run particle block slime_block ~ ~0.2 ~ 0.1 0.1 0.1 0 200 force
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run playsound block.slime_block.break master @a
execute as @e[tag=CannonPup] at @s if block ~ ~ ~-0.8 dispenser[facing=south] run kill @s
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run effect give @s invisibility 2 255 true
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run playsound entity.player.small_fall master @a ~ ~ ~
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run particle block dispenser ~ ~0.2 ~ 0.1 0.1 0.1 0 20 force
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run particle block magma_block ~ ~0.2 ~ 0.1 0.1 0.1 0 200 force
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run playsound block.slime_block.break master @a
execute as @e[tag=CannonCat] at @s if block ~ ~ ~0.5 dispenser[facing=north] run kill @s
execute as @e[tag=CannonPup] at @s run teleport @s ~ ~ ~-1
execute as @e[tag=CannonCat] at @s run teleport @s ~ ~ ~1

execute if block 1012 64 1021 tripwire_hook[powered=false] run scoreboard objectives remove PuppyCannon


execute if block 1015 65 1015 lever[powered=true] run replaceitem entity @a[tag=R1] armor.head spawner{HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Cage Mask\"}"},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if block 1015 65 1015 lever[powered=false] run clear @a[nbt={Inventory:[{Slot:103b, id:"minecraft:spawner"}]}] spawner

execute if block 1015 65 1016 lever[powered=true] at @a[tag=R1] run particle dust 15 15 15 1 ~ ~0.5 ~ 0.3 0.3 0.3 0 30 force

execute if block 1015 65 1017 lever[powered=true] run effect give @a[tag=R1] nausea 10 255 true
execute if block 1015 65 1017 lever[powered=false] run effect clear @a[tag=R1] nausea


execute as @e[tag=TriviaMobR1] run scoreboard players set @e[scores={Question_R1=3}] Question_R1 19
execute if entity @e[scores={Question_R1=19}] run tellraw @a[tag=R1] ["",{"text":" Q: It's common knowledge Redstone Dust can be powered up to 15 blocks. But do you know the max length of a tripwire line to power a signal?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR1A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR1A] unless entity @e[tag=TriviaAECR1A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR1","TriviaAECR1A"],Duration:2147483647,CustomName:"{\"text\":\"15 blocks\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR1B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR1B] unless entity @e[tag=TriviaAECR1B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR1","TriviaAECR1B"],Duration:2147483647,CustomName:"{\"text\":\"20 blocks\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR1C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR1C] unless entity @e[tag=TriviaAECR1C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR1","TriviaAECR1C"],Duration:2147483647,CustomName:"{\"text\":\"36 blocks\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR1D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR1D] unless entity @e[tag=TriviaAECR1D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR1","TriviaAECR1D"],Duration:2147483647,CustomName:"{\"text\":\"40 blocks\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR1A] as @e[tag=TriviaMobR1A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR1B] as @e[tag=TriviaMobR1B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR1C] as @e[tag=TriviaMobR1C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR1D] as @e[tag=TriviaMobR1,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR1A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR1A]
execute if entity @e[tag=TriviaMobR1B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR1B]
execute if entity @e[tag=TriviaMobR1C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR1C]
execute if entity @e[tag=TriviaMobR1D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR1D]

execute unless entity @e[tag=TriviaMobR1A] run kill @e[tag=TriviaAECR1A]
execute unless entity @e[tag=TriviaMobR1B] run kill @e[tag=TriviaAECR1B]
execute unless entity @e[tag=TriviaMobR1C] run kill @e[tag=TriviaAECR1C]
execute unless entity @e[tag=TriviaMobR1D] run kill @e[tag=TriviaAECR1D]

# IF WRONG
execute if entity @e[tag=TriviaMobR1A,nbt={HurtTime:10s}] run teleport @a 1019 6 1121
execute if entity @e[tag=TriviaMobR1B,nbt={HurtTime:10s}] run teleport @a 1049 6 1121
execute if entity @e[tag=TriviaMobR1C,nbt={HurtTime:10s}] run teleport @a 1079 6 1121


# IF CORRECT
execute if entity @e[tag=TriviaMobR1D,nbt={HurtTime:10s}] run scoreboard objectives add QR1_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR1_Correct 1

execute if entity @e[scores={QR1_Correct=1}] run setblock 1010 64 1016 air
execute if entity @e[scores={QR1_Correct=1}] run kill @e[tag=TriviaAECR1]
execute if entity @e[scores={QR1_Correct=1}] as @e[tag=TriviaMobR1] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR1_Correct=1}] as @e[tag=TriviaMobR1] run teleport @s ~ 0 ~
execute if entity @e[scores={QR1_Correct=20}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR1_Correct=22}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR1_Correct=23}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR1_Correct=24}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR1_Correct=25}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR1_Correct=26}] at @a[tag=R1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR1_Correct=30}] run playsound entity.firework_rocket.launch master @a 1010 64 1016 1 1 0

execute if entity @e[scores={QR1_Correct=32}] run title @a[tag=R1] times 1 80 1
execute if entity @e[scores={QR1_Correct=32}] run title @a[tag=R1] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR1_Correct=32}] run title @a[tag=R1] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR1_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR1_Correct=35}] run tellraw @a[tag=R1] ["",{"text":" (✔) CORRECT: The maximum length a tripwire can be to power a signal is 40 blocks. Now why would you ever need that?","color":"white","bold":false}]
execute if entity @e[scores={QR1_Correct=35}] run fill 996 63 1023 996 63 1023 air replace red_concrete
execute if entity @e[scores={QR1_Correct=35}] run setblock 990 64 1023 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR1_Correct=35}] at @a[tag=R1] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR1_Correct=35..}] run scoreboard objectives remove QR1_Correct

execute if entity @e[scores={QR1_Correct=1}] run fill 987 62 1020 993 62 1026 clay replace redstone_block

###

# QUESTION RED 2 -> LOGIC GATES / IRON + REDSTONE ROOM
execute if block 990 64 1023 stone_button[powered=true] run scoreboard objectives add Question_R2 dummy
execute if block 990 64 1023 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R2 1
execute if block 990 64 1023 stone_button[powered=false] run scoreboard objectives remove Question_R2

execute if entity @e[scores={Question_R2=4}] run summon skeleton 993 62.5 1026 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR2","TriviaMobR2A"]}
execute if entity @e[scores={Question_R2=9}] run summon skeleton 987 62.5 1026 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR2","TriviaMobR2B"]}
execute if entity @e[scores={Question_R2=14}] run summon skeleton 987 62.5 1020 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR2","TriviaMobR2C"]}
execute if entity @e[scores={Question_R2=19}] run summon skeleton 993 62.5 1020 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR2","TriviaMobR2D"]}

execute as @e[tag=TriviaMobR2] run scoreboard players set @e[scores={Question_R2=3}] Question_R2 19
execute if entity @e[scores={Question_R2=19}] run tellraw @a[tag=R2] ["",{"text":" Q: What is this basic redstone mechanism commonly known as?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR2A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR2A] unless entity @e[tag=TriviaAECR2A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR2","TriviaAECR2A"],Duration:2147483647,CustomName:"{\"text\":\"AND Gate\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR2B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR2B] unless entity @e[tag=TriviaAECR2B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR2","TriviaAECR2B"],Duration:2147483647,CustomName:"{\"text\":\"NOT Gate\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR2C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR2C] unless entity @e[tag=TriviaAECR2C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR2","TriviaAECR2C"],Duration:2147483647,CustomName:"{\"text\":\"OR Gate\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR2D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR2D] unless entity @e[tag=TriviaAECR2D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR2","TriviaAECR2D"],Duration:2147483647,CustomName:"{\"text\":\"XOR Gate\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR2A] as @e[tag=TriviaMobR2A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR2B] as @e[tag=TriviaMobR2B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR2C] as @e[tag=TriviaMobR2C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR2D] as @e[tag=TriviaMobR2,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR2A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR2A]
execute if entity @e[tag=TriviaMobR2B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR2B]
execute if entity @e[tag=TriviaMobR2C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR2C]
execute if entity @e[tag=TriviaMobR2D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR2D]

execute unless entity @e[tag=TriviaMobR2A] run kill @e[tag=TriviaAECR2A]
execute unless entity @e[tag=TriviaMobR2B] run kill @e[tag=TriviaAECR2B]
execute unless entity @e[tag=TriviaMobR2C] run kill @e[tag=TriviaAECR2C]
execute unless entity @e[tag=TriviaMobR2D] run kill @e[tag=TriviaAECR2D]

# IF WRONG
execute if entity @e[tag=TriviaMobR2A,nbt={HurtTime:10s}] run teleport @a 981 6 1121
execute if entity @e[tag=TriviaMobR2B,nbt={HurtTime:10s}] run teleport @a 951 6 1121
execute if entity @e[tag=TriviaMobR2C,nbt={HurtTime:10s}] run teleport @a 921 6 1121


# IF CORRECT
execute if entity @e[tag=TriviaMobR2D,nbt={HurtTime:10s}] run scoreboard objectives add QR2_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR2_Correct 1

execute if entity @e[scores={QR2_Correct=1}] run setblock 990 64 1023 air
execute if entity @e[scores={QR2_Correct=1}] run kill @e[tag=TriviaAECR2]
execute if entity @e[scores={QR2_Correct=1}] as @e[tag=TriviaMobR2] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR2_Correct=1}] as @e[tag=TriviaMobR2] run teleport @s ~ 0 ~
execute if entity @e[scores={QR2_Correct=20}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR2_Correct=22}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR2_Correct=23}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR2_Correct=24}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR2_Correct=25}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR2_Correct=26}] at @a[tag=R2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR2_Correct=30}] run playsound entity.firework_rocket.launch master @a 990 64 1023 1 1 0

execute if entity @e[scores={QR2_Correct=32}] run title @a[tag=R2] times 1 80 1
execute if entity @e[scores={QR2_Correct=32}] run title @a[tag=R2] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR2_Correct=32}] run title @a[tag=R2] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR2_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR2_Correct=35}] run tellraw @a[tag=R2] ["",{"text":" (✔) CORRECT: This circuit is commonly known as the XOR logic gate. Or the \"I don't care thing\" by people who have no interest in redstone.","color":"white","bold":false}]
execute if entity @e[scores={QR2_Correct=35}] run fill 1004 63 1029 1004 63 1029 air replace red_concrete
execute if entity @e[scores={QR2_Correct=35}] run fill 1009 64 1028 1011 66 1030 air
execute if entity @e[scores={QR2_Correct=35}] run setblock 1010 64 1029 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR2_Correct=35}] at @a[tag=R2] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR2_Correct=35..}] run scoreboard objectives remove QR2_Correct

execute as @e[tag=TriviaMobR2,scores={TriviaMobAge=1}] at @s run setblock ~ 62 ~ redstone_block

###

# QUESTION RED 3 -> SLIME BLOCKS / CODE III ROOM
execute if block 1010 64 1029 stone_button[powered=true] run scoreboard objectives add Question_R3 dummy
execute if block 1010 64 1029 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R3 1
execute if block 1010 64 1029 stone_button[powered=false] run scoreboard objectives remove Question_R3

execute if entity @e[scores={Question_R3=4}] run summon skeleton 1014 62.5 1032 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:white_glazed_terracotta",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR3","TriviaMobR3A"]}
execute if entity @e[scores={Question_R3=9}] run summon skeleton 1006 62.5 1032 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:sea_lantern",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR3","TriviaMobR3B"]}
execute if entity @e[scores={Question_R3=14}] run summon skeleton 1006 62.5 1026 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:ice",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR3","TriviaMobR3C"]}
execute if entity @e[scores={Question_R3=19}] run summon skeleton 1014 62.5 1026 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:wet_sponge",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR3","TriviaMobR3D"]}

execute if entity @e[tag=TriviaMobR3] run scoreboard players set @e[scores={Question_R3=3}] Question_R3 19
execute if entity @e[scores={Question_R3=19}] run tellraw @a[tag=R3] ["",{"text":" Q: Which of these blocks will not be pulled alongside slime blocks attached to a piston?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR3A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR3A] unless entity @e[tag=TriviaAECR3A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR3","TriviaAECR3A"],Duration:2147483647,CustomName:"{\"text\":\"Glazed Terracotta\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR3B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR3B] unless entity @e[tag=TriviaAECR3B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR3","TriviaAECR3B"],Duration:2147483647,CustomName:"{\"text\":\"Sea Lantern\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR3C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR3C] unless entity @e[tag=TriviaAECR3C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR3","TriviaAECR3C"],Duration:2147483647,CustomName:"{\"text\":\"Ice\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR3D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR3D] unless entity @e[tag=TriviaAECR3D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR3","TriviaAECR3D"],Duration:2147483647,CustomName:"{\"text\":\"Wet Sponge\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR3A] as @e[tag=TriviaMobR3A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR3B] as @e[tag=TriviaMobR3B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR3C] as @e[tag=TriviaMobR3C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR3D] as @e[tag=TriviaMobR3,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR3A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR3A]
execute if entity @e[tag=TriviaMobR3B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR3B]
execute if entity @e[tag=TriviaMobR3C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR3C]
execute if entity @e[tag=TriviaMobR3D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR3D]

execute unless entity @e[tag=TriviaMobR3A] run kill @e[tag=TriviaAECR3A]
execute unless entity @e[tag=TriviaMobR3B] run kill @e[tag=TriviaAECR3B]
execute unless entity @e[tag=TriviaMobR3C] run kill @e[tag=TriviaAECR3C]
execute unless entity @e[tag=TriviaMobR3D] run kill @e[tag=TriviaAECR3D]

execute if block 1015 65 1029 stone_button[powered=true] run scoreboard objectives add CodeButton dummy
scoreboard players add @e[tag=MainTriviaAEC] CodeButton 0

execute if block 1016 64 1030 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 3
execute if entity @e[scores={CodeButton=3}] run setblock 1016 64 1030 chiseled_quartz_block
execute if entity @e[scores={CodeButton=3}] run setblock 1016 65 1030 quartz_pillar[axis=x]

execute if block 1016 65 1030 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 6
execute if entity @e[scores={CodeButton=6}] run setblock 1016 65 1030 quartz_pillar[axis=y]
execute if entity @e[scores={CodeButton=6}] run setblock 1016 66 1030 quartz_pillar[axis=x]

execute if block 1016 66 1030 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 9
execute if entity @e[scores={CodeButton=9}] run setblock 1016 66 1030 chiseled_quartz_block
execute if entity @e[scores={CodeButton=9}] run setblock 1016 66 1029 quartz_pillar[axis=x]

execute if block 1016 66 1029 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 8
execute if entity @e[scores={CodeButton=8}] run setblock 1016 66 1029 quartz_pillar[axis=z]
execute if entity @e[scores={CodeButton=8}] run setblock 1016 66 1028 quartz_pillar[axis=x]

execute if block 1016 66 1028 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 7
execute if entity @e[scores={CodeButton=7}] run setblock 1016 66 1028 chiseled_quartz_block
execute if entity @e[scores={CodeButton=7}] run setblock 1016 65 1028 quartz_pillar[axis=x]

execute if block 1016 65 1028 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 4
execute if entity @e[scores={CodeButton=4}] run setblock 1016 65 1028 quartz_pillar[axis=y]
execute if entity @e[scores={CodeButton=4}] run setblock 1016 64 1028 quartz_pillar[axis=x]

execute if block 1016 64 1028 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 1
execute if entity @e[scores={CodeButton=1}] run setblock 1016 64 1028 chiseled_quartz_block
execute if entity @e[scores={CodeButton=1}] run setblock 1016 64 1029 quartz_pillar[axis=x]

execute if block 1016 64 1029 quartz_pillar[axis=x] run scoreboard players set @e[scores={CodeButton=0}] CodeButton 2
execute if entity @e[scores={CodeButton=2}] run summon zombie 1010 73 1033 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:Jespertheend}}],HandItems:[{id:"minecraft:paper",Count:1b},{id:"minecraft:anvil",Count:1b}],Tags:["Jesper"],Rotation:[180f,0f],Invulnerable:true}
execute if entity @e[scores={CodeButton=2}] run effect give @e[tag=Jesper] resistance 3 255 true
execute if entity @e[scores={CodeButton=2}] run setblock 1016 64 1029 quartz_pillar[axis=z]
execute if entity @e[scores={CodeButton=2}] run setblock 1016 64 1030 quartz_pillar[axis=x]

execute as @e[tag=Jesper] align x align y align z unless entity @s[x=1010,y=64,z=1033,dx=0,dy=10,dz=0] run data merge entity @s {Invulnerable:false}
execute as @e[tag=Jesper,nbt={HurtTime:10s}] run kill @s

execute if block 1015 65 1029 stone_button[powered=false] run scoreboard objectives remove CodeButton


# IF WRONG
execute if entity @e[tag=TriviaMobR3B,nbt={HurtTime:10s}] run teleport @a 1019 6 1151
execute if entity @e[tag=TriviaMobR3C,nbt={HurtTime:10s}] run teleport @a 1049 6 1151
execute if entity @e[tag=TriviaMobR3D,nbt={HurtTime:10s}] run teleport @a 1079 6 1151


# IF CORRECT
execute if entity @e[tag=TriviaMobR3A,nbt={HurtTime:10s}] run scoreboard objectives add QR3_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR3_Correct 1

execute if entity @e[scores={QR3_Correct=1}] run setblock 1010 64 1029 air
execute if entity @e[scores={QR3_Correct=1}] run kill @e[tag=TriviaAECR3]
execute if entity @e[scores={QR3_Correct=1}] as @e[tag=TriviaMobR3] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR3_Correct=1}] as @e[tag=TriviaMobR3] run teleport @s ~ 0 ~
execute if entity @e[scores={QR3_Correct=20}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR3_Correct=22}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR3_Correct=23}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR3_Correct=24}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR3_Correct=25}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR3_Correct=26}] at @a[tag=R3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR3_Correct=30}] run playsound entity.firework_rocket.launch master @a 1010 64 1029 1 1 0

execute if entity @e[scores={QR3_Correct=32}] run title @a[tag=R3] times 1 80 1
execute if entity @e[scores={QR3_Correct=32}] run title @a[tag=R3] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR3_Correct=32}] run title @a[tag=R3] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR3_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR3_Correct=35}] run tellraw @a[tag=R3] ["",{"text":" (✔) CORRECT: Glazed Terracotta will not be grabbed by a slime block attached to a piston. Curious if glazed donuts do or not.","color":"white","bold":false}]
execute if entity @e[scores={QR3_Correct=35}] run fill 996 63 1036 996 63 1036 air replace red_concrete
execute if entity @e[scores={QR3_Correct=35}] run setblock 990 64 1036 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR3_Correct=35}] at @a[tag=R3] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR3_Correct=35..}] run scoreboard objectives remove QR3_Correct

execute if entity @e[scores={QR3_Correct=34}] run setblock 1010 64 1029 chiseled_quartz_block
execute if entity @e[scores={QR3_Correct=34}] run setblock 1010 65 1029 sticky_piston[facing=up]
execute if entity @e[scores={QR3_Correct=34}] run setblock 1010 66 1029 slime_block
execute if entity @e[scores={QR3_Correct=34}] run setblock 1009 64 1029 stone_button[face=wall,facing=west]
execute if entity @e[scores={QR3_Correct=34}] run setblock 1010 66 1030 white_glazed_terracotta
execute if entity @e[scores={QR3_Correct=34}] run setblock 1009 66 1029 sea_lantern
execute if entity @e[scores={QR3_Correct=34}] run setblock 1010 66 1028 infested_stone
execute if entity @e[scores={QR3_Correct=34}] run setblock 1011 66 1029 wet_sponge

###

# QUESTION RED 4 -> ACTIVATOR RAIL / WOODEN RAIL ROOM
execute if block 990 64 1036 stone_button[powered=true] run scoreboard objectives add Question_R4 dummy
execute if block 990 64 1036 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R4 1
execute if block 990 64 1036 stone_button[powered=false] run scoreboard objectives remove Question_R4

execute if entity @e[scores={Question_R4=4}] run summon skeleton 993 62.5 1039 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:observer",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR4","TriviaMobR4A"]}
execute if entity @e[scores={Question_R4=9}] run summon skeleton 987 62.5 1039 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:observer",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR4","TriviaMobR4B"]}
execute if entity @e[scores={Question_R4=14}] run summon skeleton 987 62.5 1033 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:observer",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR4","TriviaMobR4C"]}
execute if entity @e[scores={Question_R4=19}] run summon skeleton 993 62.5 1033 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:observer",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR4","TriviaMobR4D"]}

execute if entity @e[tag=TriviaMobR4] run scoreboard players set @e[scores={Question_R4=3}] Question_R4 19
execute if entity @e[scores={Question_R4=19}] run tellraw @a[tag=R4] ["",{"text":" Q: What is not a purpose of an Activator Rail when powered?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR4A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR4A] unless entity @e[tag=TriviaAECR4A1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4A","TriviaAECR4A1"],Duration:2147483647,CustomName:"{\"text\":\"Ejects a rider\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR4A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR4A] unless entity @e[tag=TriviaAECR4A2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4A","TriviaAECR4A2"],Duration:2147483647,CustomName:"{\"text\":\"from stationary minecart\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR4B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR4B] unless entity @e[tag=TriviaAECR4B1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4B","TriviaAECR4B1"],Duration:2147483647,CustomName:"{\"text\":\"Disables hopper minecarts\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR4B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR4B] unless entity @e[tag=TriviaAECR4B2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4B","TriviaAECR4B2"],Duration:2147483647,CustomName:"{\"text\":\"from picking up items\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR4C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR4C] unless entity @e[tag=TriviaAECR4C1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4C","TriviaAECR4C1"],Duration:2147483647,CustomName:"{\"text\":\"Toggles corner\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR4C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR4C] unless entity @e[tag=TriviaAECR4C2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4C","TriviaAECR4C2"],Duration:2147483647,CustomName:"{\"text\":\"rail directions\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR4D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR4D] unless entity @e[tag=TriviaAECR4D1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4D","TriviaAECR4D1"],Duration:2147483647,CustomName:"{\"text\":\"Repeatedly executes\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR4D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR4D] unless entity @e[tag=TriviaAECR4D2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR4","TriviaAECR4D","TriviaAECR4D2"],Duration:2147483647,CustomName:"{\"text\":\"command block minecarts\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR4A] as @e[tag=TriviaMobR4A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR4B] as @e[tag=TriviaMobR4B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR4C] as @e[tag=TriviaMobR4C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR4D] as @e[tag=TriviaMobR4,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR4A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR4A]
execute if entity @e[tag=TriviaMobR4B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR4B]
execute if entity @e[tag=TriviaMobR4C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR4C]
execute if entity @e[tag=TriviaMobR4D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR4D]

execute unless entity @e[tag=TriviaMobR4A] run kill @e[tag=TriviaAECR4A]
execute unless entity @e[tag=TriviaMobR4B] run kill @e[tag=TriviaAECR4B]
execute unless entity @e[tag=TriviaMobR4C] run kill @e[tag=TriviaAECR4C]
execute unless entity @e[tag=TriviaMobR4D] run kill @e[tag=TriviaAECR4D]

execute unless entity @e[tag=CartCoaster] run summon minecart 994 64 1041 {Tags:["CartCoaster"]}
execute as @e[tag=CartCoaster,x=972,y=64,z=1041,dx=0,dy=2,dz=0] run data merge entity @s {Motion:[3.0d,1.5d,0.0d]}
execute align x align y align z if entity @e[tag=CartCoaster,x=992,y=70,z=1041,dx=2,dy=8,dz=0] run setblock 993 75 1043 clay
execute align x align y align z unless entity @e[tag=CartCoaster,x=992,y=70,z=1041,dx=2,dy=8,dz=0] run setblock 993 75 1043 redstone_block
execute if entity @a[x=983,y=64,z=1032,dx=0,dy=1,dz=0] run scoreboard objectives add ThrillRider dummy
scoreboard players add @a[x=983,y=64,z=1032,dx=0,dy=1,dz=0] ThrillRider 0
scoreboard players set @a[x=983,y=64,z=1032,dx=0,dy=1,dz=0,scores={ThrillRider=0}] ThrillRider 1
scoreboard players set @a[x=993,y=76,z=1041,dx=0,dy=1,dz=0,scores={ThrillRider=1}] ThrillRider 2
scoreboard players set @a[x=983,y=64,z=1032,dx=0,dy=1,dz=0,scores={ThrillRider=2}] ThrillRider 3
scoreboard players set @a[x=993,y=76,z=1041,dx=0,dy=1,dz=0,scores={ThrillRider=3}] ThrillRider 4

execute align x align y align z run spawnpoint @a[x=984,y=64,z=1032,dx=0,dy=1,dz=0] 1015 72 1029
advancement grant @a[scores={ThrillRider=4}] only d3:folder_c/thrill_rider


# IF WRONG
execute if entity @e[tag=TriviaMobR4A,nbt={HurtTime:10s}] run teleport @a 981 6 1151
execute if entity @e[tag=TriviaMobR4B,nbt={HurtTime:10s}] run teleport @a 951 6 1151
execute if entity @e[tag=TriviaMobR4D,nbt={HurtTime:10s}] run teleport @a 921 6 1151


# IF CORRECT
execute if entity @e[tag=TriviaMobR4C,nbt={HurtTime:10s}] run scoreboard objectives add QR4_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR4_Correct 1

execute if entity @e[scores={QR4_Correct=1}] run setblock 990 64 1036 air
execute if entity @e[scores={QR4_Correct=1}] run kill @e[tag=TriviaAECR4]
execute if entity @e[scores={QR4_Correct=1}] as @e[tag=TriviaMobR4] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR4_Correct=1}] as @e[tag=TriviaMobR4] run teleport @s ~ 0 ~
execute if entity @e[scores={QR4_Correct=20}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR4_Correct=22}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR4_Correct=23}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR4_Correct=24}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR4_Correct=25}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR4_Correct=26}] at @a[tag=R4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR4_Correct=30}] run playsound entity.firework_rocket.launch master @a 990 64 1036 1 1 0

execute if entity @e[scores={QR4_Correct=32}] run title @a[tag=R4] times 1 80 1
execute if entity @e[scores={QR4_Correct=32}] run title @a[tag=R4] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR4_Correct=32}] run title @a[tag=R4] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR4_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR4_Correct=35}] run tellraw @a[tag=R4] ["",{"text":" (✔) CORRECT: Activator Rails do a few things, but they do not toggle corner directions. They also don't get invited to parties much.","color":"white","bold":false}]
execute if entity @e[scores={QR4_Correct=35}] run fill 1004 63 1042 1004 63 1042 air replace red_concrete
execute if entity @e[scores={QR4_Correct=35}] run setblock 1010 65 1042 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR4_Correct=35}] at @a[tag=R4] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR4_Correct=35..}] run scoreboard objectives remove QR4_Correct

execute if entity @e[scores={QR4_Correct=1}] run kill @e[tag=BurnSkeleton]
execute if entity @e[scores={QR4_Correct=1}] run fill 1021 69 1039 1021 69 1045 redstone_block replace clay
execute if entity @e[scores={QR4_Correct=1}] run setblock 1018 67 1039 structure_void
execute if entity @e[scores={QR4_Correct=1}] run setblock 1018 68 1039 lime_carpet
execute if entity @e[scores={QR4_Correct=1}] run setblock 1018 68 1041 cobweb
execute if entity @e[scores={QR4_Correct=1}] run setblock 1018 68 1043 chest[facing=west]
execute if entity @e[scores={QR4_Correct=2}] run data merge block 1018 68 1043 {Items:[{Slot:13b,id:"minecraft:daylight_detector",Count:1b,tag:{display:{Name:'{"text":"Press F for 1.13 Sun \\"blocker\\"","italic":"false"}'}}}]}
execute if entity @e[scores={QR4_Correct=1}] run setblock 1018 68 1045 hopper


###

# QUESTION RED 5 -> SUNLIGHT / THEATRE ROOM
execute if block 1010 65 1042 stone_button[powered=true] run scoreboard objectives add Question_R5 dummy
execute if block 1010 65 1042 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R5 1
execute if block 1010 65 1042 stone_button[powered=false] run scoreboard objectives remove Question_R5

execute if entity @e[scores={Question_R5=4}] run summon skeleton 1013 62.5 1045 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_lamp",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR5","TriviaMobR5A"]}
execute if entity @e[scores={Question_R5=9}] run summon skeleton 1007 62.5 1045 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_lamp",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR5","TriviaMobR5B"]}
execute if entity @e[scores={Question_R5=14}] run summon skeleton 1007 62.5 1039 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_lamp",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR5","TriviaMobR5C"]}
execute if entity @e[scores={Question_R5=19}] run summon skeleton 1013 62.5 1039 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:redstone_lamp",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR5","TriviaMobR5D"]}

execute if entity @e[tag=TriviaMobR5] run scoreboard players set @e[scores={Question_R5=3}] Question_R5 19
execute if entity @e[scores={Question_R5=19}] run tellraw @a[tag=R5] ["",{"text":" Q: Which of these blocks prevents a skeleton from burning in the sunlight when placed over its head?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR5A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR5A] unless entity @e[tag=TriviaAECR5A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR5","TriviaAECR5A"],Duration:2147483647,CustomName:"{\"text\":\"Carpet\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR5B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR5B] unless entity @e[tag=TriviaAECR5B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR5","TriviaAECR5B"],Duration:2147483647,CustomName:"{\"text\":\"Cobweb\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR5C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR5C] unless entity @e[tag=TriviaAECR5C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR5","TriviaAECR5C"],Duration:2147483647,CustomName:"{\"text\":\"Chest\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR5D] unless entity @e[tag=TriviaAECR5D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR5","TriviaAECR5D"],Duration:2147483647,CustomName:"{\"text\":\"Hopper\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR5A] as @e[tag=TriviaMobR5A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR5B] as @e[tag=TriviaMobR5B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR5C] as @e[tag=TriviaMobR5C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR5D] as @e[tag=TriviaMobR5,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR5A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR5A]
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR5B]
execute if entity @e[tag=TriviaMobR5C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR5C]
execute if entity @e[tag=TriviaMobR5D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR5D]

execute unless entity @e[tag=TriviaMobR5A] run kill @e[tag=TriviaAECR5A]
execute unless entity @e[tag=TriviaMobR5B] run kill @e[tag=TriviaAECR5B]
execute unless entity @e[tag=TriviaMobR5C] run kill @e[tag=TriviaAECR5C]
execute unless entity @e[tag=TriviaMobR5D] run kill @e[tag=TriviaAECR5D]

execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=1}] run fill 1021 69 1039 1021 69 1045 redstone_block replace clay
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=1}] run kill @e[tag=BurnSkeleton]
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] run particle portal 1018 65.6 1039 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] run particle portal 1018 65.6 1041 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] run particle portal 1018 65.6 1043 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] run particle portal 1018 65.6 1045 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] run playsound entity.enderman.teleport master @a 1018 65 1042 0.5 1 0
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] unless entity @e[tag=BurnSkeletonA] run summon skeleton 1018 65 1039 {Invulnerable:true,Silent:1b,NoAI:true,Rotation:[90f,0f],Tags:["BurnSkeleton","BurnSkeletonA"]}
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] unless entity @e[tag=BurnSkeletonB] run summon skeleton 1018 65 1041 {Invulnerable:true,Silent:1b,NoAI:true,Rotation:[90f,0f],Tags:["BurnSkeleton","BurnSkeletonB"]}
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] unless entity @e[tag=BurnSkeletonC] run summon skeleton 1018 65 1043 {Invulnerable:true,Silent:1b,NoAI:true,Rotation:[90f,0f],Tags:["BurnSkeleton","BurnSkeletonC"]}
execute if entity @e[tag=TriviaMobR5D,scores={TriviaMobAge=30}] unless entity @e[tag=BurnSkeletonD] run summon skeleton 1018 65 1045 {Invulnerable:true,Silent:1b,NoAI:true,Rotation:[90f,0f],Tags:["BurnSkeleton","BurnSkeletonD"]}
execute if entity @e[tag=TriviaMobR5A,nbt={HurtTime:10s}] run setblock 1021 69 1039 clay
execute if entity @e[tag=TriviaMobR5A,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonA,limit=1] {Fire:-20s}
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run fill 1021 69 1039 1021 69 1045 clay replace redstone_block
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonA,limit=1] {Fire:-20s}
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonC,limit=1] {Fire:-20s}
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonD,limit=1] {Fire:-20s}
execute if entity @e[tag=TriviaMobR5C,nbt={HurtTime:10s}] run setblock 1021 69 1043 clay
execute if entity @e[tag=TriviaMobR5C,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonC,limit=1] {Fire:-20s}
execute if entity @e[tag=TriviaMobR5D,nbt={HurtTime:10s}] run setblock 1021 69 1045 clay
execute if entity @e[tag=TriviaMobR5D,nbt={HurtTime:10s}] run data merge entity @e[tag=BurnSkeletonD,limit=1] {Fire:-20s}

execute if entity @e[tag=BurnSkeletonA] unless entity @e[tag=TriviaMobR5A] if block 1021 69 1039 redstone_block run setblock 1021 69 1039 clay
execute if entity @e[tag=BurnSkeletonB] unless entity @e[tag=TriviaMobR5B] if block 1021 69 1041 redstone_block run setblock 1021 69 1041 clay
execute if entity @e[tag=BurnSkeletonC] unless entity @e[tag=TriviaMobR5C] if block 1021 69 1043 redstone_block run setblock 1021 69 1043 clay
execute if entity @e[tag=BurnSkeletonD] unless entity @e[tag=TriviaMobR5D] if block 1021 69 1045 redstone_block run setblock 1021 69 1045 clay


# IF WRONG
execute if entity @e[tag=TriviaMobR5A,nbt={HurtTime:10s}] run teleport @a 1019 6 1181
execute if entity @e[tag=TriviaMobR5C,nbt={HurtTime:10s}] run teleport @a 1049 6 1181
execute if entity @e[tag=TriviaMobR5D,nbt={HurtTime:10s}] run teleport @a 1079 6 1181


# IF CORRECT
execute if entity @e[tag=TriviaMobR5B,nbt={HurtTime:10s}] run scoreboard objectives add QR5_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR5_Correct 1

execute if entity @e[scores={QR5_Correct=1}] run setblock 1010 65 1042 air
execute if entity @e[scores={QR5_Correct=1}] run kill @e[tag=TriviaAECR5]
execute if entity @e[scores={QR5_Correct=1}] as @e[tag=TriviaMobR5] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR5_Correct=1}] as @e[tag=TriviaMobR5] run teleport @s ~ 0 ~
execute if entity @e[scores={QR5_Correct=20}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR5_Correct=22}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR5_Correct=23}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR5_Correct=24}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR5_Correct=25}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR5_Correct=26}] at @a[tag=R5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR5_Correct=30}] run playsound entity.firework_rocket.launch master @a 1010 64 1042 1 1 0

execute if entity @e[scores={QR5_Correct=32}] run title @a[tag=R5] times 1 80 1
execute if entity @e[scores={QR5_Correct=32}] run title @a[tag=R5] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR5_Correct=32}] run title @a[tag=R5] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR5_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR5_Correct=35}] run tellraw @a[tag=R5] ["",{"text":" (✔) CORRECT: Cobwebs block sunlight surprisingly. Don't tell Mojang, or they might change that clever trick in future releases :(","color":"white","bold":false}]
execute if entity @e[scores={QR5_Correct=35}] run fill 996 63 1049 996 63 1049 air replace red_concrete
execute if entity @e[scores={QR5_Correct=35}] run setblock 990 64 1049 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR5_Correct=35}] at @a[tag=R5] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR5_Correct=35..}] run scoreboard objectives remove QR5_Correct

###

# QUESTION RED 6 -> NBT / BEACH ROOM
execute if block 990 64 1049 stone_button[powered=true] run scoreboard objectives add Question_R6 dummy
execute if block 990 64 1049 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R6 1
execute if block 990 64 1049 stone_button[powered=false] run scoreboard objectives remove Question_R6

execute if entity @e[scores={Question_R6=4}] run summon skeleton 993 62.5 1052 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR6","TriviaMobR6A"]}
execute if entity @e[scores={Question_R6=9}] run summon skeleton 987 62.5 1052 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR6","TriviaMobR6B"]}
execute if entity @e[scores={Question_R6=14}] run summon skeleton 987 62.5 1046 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR6","TriviaMobR6C"]}
execute if entity @e[scores={Question_R6=19}] run summon skeleton 993 62.5 1046 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR6","TriviaMobR6D"]}

execute if entity @e[tag=TriviaMobR6] run scoreboard players set @e[scores={Question_R6=3}] Question_R6 19
execute if entity @e[scores={Question_R6=19}] run tellraw @a[tag=R6] ["",{"text":" Q: What does NBT stand for?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR6A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR6A] unless entity @e[tag=TriviaAECR6A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR6","TriviaAECR6A"],Duration:2147483647,CustomName:"{\"text\":\"Named Binary Tag\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR6B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR6B] unless entity @e[tag=TriviaAECR6B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR6","TriviaAECR6B"],Duration:2147483647,CustomName:"{\"text\":\"Native Byte Type\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR6C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR6C] unless entity @e[tag=TriviaAECR6C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR6","TriviaAECR6C"],Duration:2147483647,CustomName:"{\"text\":\"Nested Byte Tag\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR6D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR6D] unless entity @e[tag=TriviaAECR6D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR6","TriviaAECR6D"],Duration:2147483647,CustomName:"{\"text\":\"Network Boolean Type\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR6A] as @e[tag=TriviaMobR6A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR6B] as @e[tag=TriviaMobR6B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR6C] as @e[tag=TriviaMobR6C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR6D] as @e[tag=TriviaMobR6,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR6A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR6A]
execute if entity @e[tag=TriviaMobR6B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR6B]
execute if entity @e[tag=TriviaMobR6C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR6C]
execute if entity @e[tag=TriviaMobR6D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR6D]

execute unless entity @e[tag=TriviaMobR6A] run kill @e[tag=TriviaAECR6A]
execute unless entity @e[tag=TriviaMobR6B] run kill @e[tag=TriviaAECR6B]
execute unless entity @e[tag=TriviaMobR6C] run kill @e[tag=TriviaAECR6C]
execute unless entity @e[tag=TriviaMobR6D] run kill @e[tag=TriviaAECR6D]

# IF WRONG
execute if entity @e[tag=TriviaMobR6B,nbt={HurtTime:10s}] run teleport @a 981 6 1181
execute if entity @e[tag=TriviaMobR6C,nbt={HurtTime:10s}] run teleport @a 951 6 1181
execute if entity @e[tag=TriviaMobR6D,nbt={HurtTime:10s}] run teleport @a 884 6 1182


# IF CORRECT
execute if entity @e[tag=TriviaMobR6A,nbt={HurtTime:10s}] run scoreboard objectives add QR6_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR6_Correct 1

execute if entity @e[scores={QR6_Correct=1}] run setblock 990 64 1049 air
execute if entity @e[scores={QR6_Correct=1}] run kill @e[tag=TriviaAECR6]
execute if entity @e[scores={QR6_Correct=1}] as @e[tag=TriviaMobR6] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR6_Correct=1}] as @e[tag=TriviaMobR6] run teleport @s ~ 0 ~
execute if entity @e[scores={QR6_Correct=20}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR6_Correct=22}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR6_Correct=23}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR6_Correct=24}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR6_Correct=25}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR6_Correct=26}] at @a[tag=R6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR6_Correct=30}] run playsound entity.firework_rocket.launch master @a 990 64 1049 1 1 0

execute if entity @e[scores={QR6_Correct=32}] run title @a[tag=R6] times 1 80 1
execute if entity @e[scores={QR6_Correct=32}] run title @a[tag=R6] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR6_Correct=32}] run title @a[tag=R6] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR6_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR6_Correct=35}] run tellraw @a[tag=R6] ["",{"text":" (✔) CORRECT: N.B.T. -> Named Binary Tag","color":"white","bold":false}]
execute if entity @e[scores={QR6_Correct=35}] run fill 1004 63 1055 1004 63 1055 air replace red_concrete
execute if entity @e[scores={QR6_Correct=35}] run setblock 1010 64 1055 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR6_Correct=35}] at @a[tag=R6] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR6_Correct=35..}] run scoreboard objectives remove QR6_Correct

###

# QUESTION RED 7 -> EXCLAMATION MARK / APARTMENT BUILDING ROOM
execute if block 1010 64 1055 stone_button[powered=true] run scoreboard objectives add Question_R7 dummy
execute if block 1010 64 1055 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R7 1
execute if block 1010 64 1055 stone_button[powered=false] run scoreboard objectives remove Question_R7

execute if entity @e[scores={Question_R7=4}] run summon skeleton 1013 62.5 1058 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:repeating_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR7","TriviaMobR7A"]}
execute if entity @e[scores={Question_R7=9}] run summon skeleton 1007 62.5 1058 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:repeating_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR7","TriviaMobR7B"]}
execute if entity @e[scores={Question_R7=14}] run summon skeleton 1007 62.5 1052 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:repeating_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR7","TriviaMobR7C"]}
execute if entity @e[scores={Question_R7=19}] run summon skeleton 1013 62.5 1052 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:repeating_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR7","TriviaMobR7D"]}

execute if entity @e[tag=TriviaMobR7] run scoreboard players set @e[scores={Question_R7=3}] Question_R7 19
execute if entity @e[scores={Question_R7=19}] run tellraw @a[tag=R7] ["",{"text":" Q: What does the ! symbol indicate in a command?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR7A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR7A] unless entity @e[tag=TriviaAECR7A1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7A","TriviaAECR7A1"],Duration:2147483647,CustomName:"{\"text\":\"Creates an inverted\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR7A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR7A] unless entity @e[tag=TriviaAECR7A2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7A","TriviaAECR7A2"],Duration:2147483647,CustomName:"{\"text\":\"selector argument\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR7B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR7B] unless entity @e[tag=TriviaAECR7B1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7B","TriviaAECR7B1"],Duration:2147483647,CustomName:"{\"text\":\"Summons multiple mobs\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR7B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR7B] unless entity @e[tag=TriviaAECR7B2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7B","TriviaAECR7B2"],Duration:2147483647,CustomName:"{\"text\":\"in one command\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR7C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR7C] unless entity @e[tag=TriviaAECR7C1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7C","TriviaAECR7C1"],Duration:2147483647,CustomName:"{\"text\":\"Resets a negative\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR7C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR7C] unless entity @e[tag=TriviaAECR7C2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7C","TriviaAECR7C2"],Duration:2147483647,CustomName:"{\"text\":\"scoreboard objective\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaMobR7D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR7D] unless entity @e[tag=TriviaAECR7D1] run summon area_effect_cloud ~ ~1.95 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7D","TriviaAECR7D1"],Duration:2147483647,CustomName:"{\"text\":\"Forces a command\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR7D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR7D] unless entity @e[tag=TriviaAECR7D2] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECR7","TriviaAECR7D","TriviaAECR7D2"],Duration:2147483647,CustomName:"{\"text\":\"to run without repeat\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR7A] as @e[tag=TriviaMobR7A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR7B] as @e[tag=TriviaMobR7B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR7C] as @e[tag=TriviaMobR7C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR7D] as @e[tag=TriviaMobR7,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR7A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR7A]
execute if entity @e[tag=TriviaMobR7B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR7B]
execute if entity @e[tag=TriviaMobR7C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR7C]
execute if entity @e[tag=TriviaMobR7D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR7D]

execute unless entity @e[tag=TriviaMobR7A] run kill @e[tag=TriviaAECR7A]
execute unless entity @e[tag=TriviaMobR7B] run kill @e[tag=TriviaAECR7B]
execute unless entity @e[tag=TriviaMobR7C] run kill @e[tag=TriviaAECR7C]
execute unless entity @e[tag=TriviaMobR7D] run kill @e[tag=TriviaAECR7D]

# IF WRONG
execute if entity @e[tag=TriviaMobR7B,nbt={HurtTime:10s}] run teleport @a 1019 6 1211
execute if entity @e[tag=TriviaMobR7C,nbt={HurtTime:10s}] run teleport @a 1049 6 1211
execute if entity @e[tag=TriviaMobR7D,nbt={HurtTime:10s}] run teleport @a 1079 6 1211


# IF CORRECT
execute if entity @e[tag=TriviaMobR7A,nbt={HurtTime:10s}] run scoreboard objectives add QR7_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR7_Correct 1

execute if entity @e[scores={QR7_Correct=1}] run setblock 1010 64 1055 air
execute if entity @e[scores={QR7_Correct=1}] run kill @e[tag=TriviaAECR7]
execute if entity @e[scores={QR7_Correct=1}] as @e[tag=TriviaMobR7] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR7_Correct=1}] as @e[tag=TriviaMobR7] run teleport @s ~ 0 ~
execute if entity @e[scores={QR7_Correct=20}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR7_Correct=22}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR7_Correct=23}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR7_Correct=24}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR7_Correct=25}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR7_Correct=26}] at @a[tag=R7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR7_Correct=30}] run playsound entity.firework_rocket.launch master @a 1010 64 1055 1 1 0

execute if entity @e[scores={QR7_Correct=32}] run title @a[tag=R7] times 1 80 1
execute if entity @e[scores={QR7_Correct=32}] run title @a[tag=R7] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR7_Correct=32}] run title @a[tag=R7] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR7_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR7_Correct=35}] run tellraw @a[tag=R7] ["",{"text":" (✔) CORRECT: The ! symbol is handy syntax digit that allows excluding targets. Meaning, we could give cake to everyone, excluding you, if we wanted.","color":"white","bold":false}]
execute if entity @e[scores={QR7_Correct=35}] run fill 996 63 1062 996 63 1062 air replace red_concrete
execute if entity @e[scores={QR7_Correct=35}] run setblock 990 64 1062 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR7_Correct=35}] at @a[tag=R7] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR7_Correct=35..}] run scoreboard objectives remove QR7_Correct

###

# QUESTION RED 8 -> KILLER RABBIT / DISCO BUNNY BOSS ROOM
execute if block 990 64 1062 stone_button[powered=true] run scoreboard objectives add Question_R8 dummy
execute if block 990 64 1062 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R8 1
execute if block 990 64 1062 stone_button[powered=false] run scoreboard objectives remove Question_R8

execute if entity @e[scores={Question_R8=4}] run summon skeleton 993 62.5 1065 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR8","TriviaMobR8A"]}
execute if entity @e[scores={Question_R8=9}] run summon skeleton 987 62.5 1065 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR8","TriviaMobR8B"]}
execute if entity @e[scores={Question_R8=14}] run summon skeleton 987 62.5 1059 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR8","TriviaMobR8C"]}
execute if entity @e[scores={Question_R8=19}] run summon skeleton 993 62.5 1059 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR8","TriviaMobR8D"]}

execute if entity @e[tag=TriviaMobR8] run scoreboard players set @e[scores={Question_R8=3}] Question_R8 19
execute if entity @e[scores={Question_R8=19}] run tellraw @a[tag=R8] ["",{"text":" Q: What syntax is required to summon the Killer Rabbit?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR8A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR8A] unless entity @e[tag=TriviaAECR8A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR8","TriviaAECR8A"],Duration:2147483647,CustomName:"{\"text\":\"Anger:1\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR8B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR8B] unless entity @e[tag=TriviaAECR8B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR8","TriviaAECR8B"],Duration:2147483647,CustomName:"{\"text\":\"Variant:6\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR8C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR8C] unless entity @e[tag=TriviaAECR8C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR8","TriviaAECR8C"],Duration:2147483647,CustomName:"{\"text\":\"KillerRabbit:true\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR8D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR8D] unless entity @e[tag=TriviaAECR8D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR8","TriviaAECR8D"],Duration:2147483647,CustomName:"{\"text\":\"RabbitType:99\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR8A] as @e[tag=TriviaMobR8A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR8B] as @e[tag=TriviaMobR8B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR8C] as @e[tag=TriviaMobR8C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR8D] as @e[tag=TriviaMobR8,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR8A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR8A]
execute if entity @e[tag=TriviaMobR8B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR8B]
execute if entity @e[tag=TriviaMobR8C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR8C]
execute if entity @e[tag=TriviaMobR8D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR8D]

execute unless entity @e[tag=TriviaMobR8A] run kill @e[tag=TriviaAECR8A]
execute unless entity @e[tag=TriviaMobR8B] run kill @e[tag=TriviaAECR8B]
execute unless entity @e[tag=TriviaMobR8C] run kill @e[tag=TriviaAECR8C]
execute unless entity @e[tag=TriviaMobR8D] run kill @e[tag=TriviaAECR8D]

# IF WRONG
execute if entity @e[tag=TriviaMobR8A,nbt={HurtTime:10s}] run teleport @a 981 6 1211
execute if entity @e[tag=TriviaMobR8B,nbt={HurtTime:10s}] run teleport @a 951 6 1211
execute if entity @e[tag=TriviaMobR8C,nbt={HurtTime:10s}] run teleport @a 921 6 1211


# IF CORRECT
execute if entity @e[tag=TriviaMobR8D,nbt={HurtTime:10s}] run scoreboard objectives add QR8_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR8_Correct 1

execute if entity @e[scores={QR8_Correct=1}] run setblock 990 64 1062 air
execute if entity @e[scores={QR8_Correct=1}] run kill @e[tag=TriviaAECR8]
execute if entity @e[scores={QR8_Correct=1}] as @e[tag=TriviaMobR8] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR8_Correct=1}] as @e[tag=TriviaMobR8] run teleport @s ~ 0 ~
execute if entity @e[scores={QR8_Correct=20}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR8_Correct=22}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR8_Correct=23}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR8_Correct=24}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR8_Correct=25}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR8_Correct=26}] at @a[tag=R8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR8_Correct=30}] run playsound entity.firework_rocket.launch master @a 990 64 1062 1 1 0

execute if entity @e[scores={QR8_Correct=32}] run title @a[tag=R8] times 1 80 1
execute if entity @e[scores={QR8_Correct=32}] run title @a[tag=R8] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR8_Correct=32}] run title @a[tag=R8] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR8_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR8_Correct=35}] run tellraw @a[tag=R8] ["",{"text":" (✔) CORRECT: If you want to play with killer bunnies, you can summon one with {RabbitType:99} and let the fun begin with your friends.","color":"white","bold":false}]
execute if entity @e[scores={QR8_Correct=35}] run fill 1004 63 1069 1004 63 1069 air replace red_concrete
execute if entity @e[scores={QR8_Correct=35}] run setblock 1011 64 1069 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR8_Correct=35}] at @a[tag=R8] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR8_Correct=35..}] run scoreboard objectives remove QR8_Correct

execute if entity @e[scores={QR8_Correct=1}] run fill 1004 64 1062 1004 65 1066 air replace red_concrete_powder

###

# QUESTION RED 9 -> SOUND TYPE / AVENGERS PIXEL ART ROOM
execute if block 1011 64 1069 stone_button[powered=true] run scoreboard objectives add Question_R9 dummy
execute if block 1011 64 1069 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R9 1
execute if block 1011 64 1069 stone_button[powered=false] run scoreboard objectives remove Question_R9

execute if entity @e[scores={Question_R9=4}] run summon skeleton 1014 62.5 1072 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:note_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR9","TriviaMobR9A"]}
execute if entity @e[scores={Question_R9=9}] run summon skeleton 1008 62.5 1072 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:note_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR9","TriviaMobR9B"]}
execute if entity @e[scores={Question_R9=14}] run summon skeleton 1008 62.5 1066 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:note_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR9","TriviaMobR9C"]}
execute if entity @e[scores={Question_R9=19}] run summon skeleton 1014 62.5 1066 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:note_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR9","TriviaMobR9D"]}

execute if entity @e[tag=TriviaMobR9] run scoreboard players set @e[scores={Question_R9=3}] Question_R9 19
execute if entity @e[scores={Question_R9=19}] run tellraw @a[tag=R9] ["",{"text":" Q: What sound file type do Resource Packs require for custom sounds to work?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR9A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR9A] unless entity @e[tag=TriviaAECR9A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR9","TriviaAECR9A"],Duration:2147483647,CustomName:"{\"text\":\".aiff\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR9B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR9B] unless entity @e[tag=TriviaAECR9B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR9","TriviaAECR9B"],Duration:2147483647,CustomName:"{\"text\":\".midi\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR9C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR9C] unless entity @e[tag=TriviaAECR9C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR9","TriviaAECR9C"],Duration:2147483647,CustomName:"{\"text\":\".ogg\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR9D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR9D] unless entity @e[tag=TriviaAECR9D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR9","TriviaAECR9D"],Duration:2147483647,CustomName:"{\"text\":\".wav\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR9A] as @e[tag=TriviaMobR9A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR9B] as @e[tag=TriviaMobR9B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR9C] as @e[tag=TriviaMobR9C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR9D] as @e[tag=TriviaMobR9,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR9A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR9A]
execute if entity @e[tag=TriviaMobR9B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR9B]
execute if entity @e[tag=TriviaMobR9C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR9C]
execute if entity @e[tag=TriviaMobR9D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR9D]

execute unless entity @e[tag=TriviaMobR9A] run kill @e[tag=TriviaAECR9A]
execute unless entity @e[tag=TriviaMobR9B] run kill @e[tag=TriviaAECR9B]
execute unless entity @e[tag=TriviaMobR9C] run kill @e[tag=TriviaAECR9C]
execute unless entity @e[tag=TriviaMobR9D] run kill @e[tag=TriviaAECR9D]

# IF WRONG
execute if entity @e[tag=TriviaMobR9A,nbt={HurtTime:10s}] run teleport @a 1019 6 1241
execute if entity @e[tag=TriviaMobR9B,nbt={HurtTime:10s}] run teleport @a 1049 6 1241
execute if entity @e[tag=TriviaMobR9D,nbt={HurtTime:10s}] run teleport @a 1079 6 1248


# IF CORRECT
execute if entity @e[tag=TriviaMobR9C,nbt={HurtTime:10s}] run scoreboard objectives add QR9_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR9_Correct 1

execute if entity @e[scores={QR9_Correct=1}] run setblock 1011 64 1069 air
execute if entity @e[scores={QR9_Correct=1}] run kill @e[tag=TriviaAECR9]
execute if entity @e[scores={QR9_Correct=1}] as @e[tag=TriviaMobR9] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR9_Correct=1}] as @e[tag=TriviaMobR9] run teleport @s ~ 0 ~
execute if entity @e[scores={QR9_Correct=20}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR9_Correct=22}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR9_Correct=23}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR9_Correct=24}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR9_Correct=25}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR9_Correct=26}] at @a[tag=R9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR9_Correct=30}] run playsound entity.firework_rocket.launch master @a 1011 64 1069 1 1 0

execute if entity @e[scores={QR9_Correct=32}] run title @a[tag=R9] times 1 80 1
execute if entity @e[scores={QR9_Correct=32}] run title @a[tag=R9] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR9_Correct=32}] run title @a[tag=R9] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QR9_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR9_Correct=35}] run tellraw @a[tag=R9] ["",{"text":" (✔) CORRECT: Resource Packs use .ogg files for any custom sounds.","color":"white","bold":false}]
execute if entity @e[scores={QR9_Correct=35}] run fill 996 63 1075 996 63 1075 air replace red_concrete
execute if entity @e[scores={QR9_Correct=35}] run setblock 990 64 1075 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR9_Correct=35}] at @a[tag=R9] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR9_Correct=35..}] run scoreboard objectives remove QR9_Correct

###

# QUESTION RED 10 -> INSERTION / DIVERSITY PRISON ROOM
execute if block 990 64 1075 stone_button[powered=true] run scoreboard objectives add Question_R10 dummy
execute if block 990 64 1075 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_R10 1
execute if block 990 64 1075 stone_button[powered=false] run scoreboard objectives remove Question_R10

execute if entity @e[scores={Question_R10=4}] run summon skeleton 993 62.5 1078 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR10","TriviaMobR10A"]}
execute if entity @e[scores={Question_R10=9}] run summon skeleton 987 62.5 1078 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR10","TriviaMobR10B"]}
execute if entity @e[scores={Question_R10=14}] run summon skeleton 987 62.5 1072 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR10","TriviaMobR10C"]}
execute if entity @e[scores={Question_R10=19}] run summon skeleton 993 62.5 1072 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:chain_command_block",Count:1b}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobR10","TriviaMobR10D"]}

execute if entity @e[tag=TriviaMobR10] run scoreboard players set @e[scores={Question_R10=3}] Question_R10 19
execute if entity @e[scores={Question_R10=19}] run tellraw @a[tag=R10] ["",{"text":" Q: Which command is the \"insertion\" listener event restricted to?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobR10A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobR10A] unless entity @e[tag=TriviaAECR10A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR10","TriviaAECR10A"],Duration:2147483647,CustomName:"{\"text\":\"/clickEvent\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR10B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobR10B] unless entity @e[tag=TriviaAECR10B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR10","TriviaAECR10B"],Duration:2147483647,CustomName:"{\"text\":\"/tellraw\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR10C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobR10C] unless entity @e[tag=TriviaAECR10C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR10","TriviaAECR10C"],Duration:2147483647,CustomName:"{\"text\":\"/scoreboard\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobR10D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobR10D] unless entity @e[tag=TriviaAECR10D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECR10","TriviaAECR10D"],Duration:2147483647,CustomName:"{\"text\":\"/msg\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECR10A] as @e[tag=TriviaMobR10A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR10B] as @e[tag=TriviaMobR10B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR10C] as @e[tag=TriviaMobR10C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECR10D] as @e[tag=TriviaMobR10,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobR10A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR10A]
execute if entity @e[tag=TriviaMobR10B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR10B]
execute if entity @e[tag=TriviaMobR10C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR10C]
execute if entity @e[tag=TriviaMobR10D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECR10D]

execute unless entity @e[tag=TriviaMobR10A] run kill @e[tag=TriviaAECR10A]
execute unless entity @e[tag=TriviaMobR10B] run kill @e[tag=TriviaAECR10B]
execute unless entity @e[tag=TriviaMobR10C] run kill @e[tag=TriviaAECR10C]
execute unless entity @e[tag=TriviaMobR10D] run kill @e[tag=TriviaAECR10D]

# IF WRONG
execute if entity @e[tag=TriviaMobR10A,nbt={HurtTime:10s}] run teleport @a 977 6 1243
execute if entity @e[tag=TriviaMobR10C,nbt={HurtTime:10s}] run teleport @a 942 6 1241
execute if entity @e[tag=TriviaMobR10D,nbt={HurtTime:10s}] run teleport @a 912 6 1241


# IF CORRECT
execute if entity @e[tag=TriviaMobR10B,nbt={HurtTime:10s}] run scoreboard objectives add QR10_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QR10_Correct 1

execute if entity @e[scores={QR10_Correct=1}] run setblock 990 64 1075 air
execute if entity @e[scores={QR10_Correct=1}] run kill @e[tag=TriviaAECR10]
execute if entity @e[scores={QR10_Correct=1}] as @e[tag=TriviaMobR10] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QR10_Correct=1}] as @e[tag=TriviaMobR10] run teleport @s ~ 0 ~
execute if entity @e[scores={QR10_Correct=20}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QR10_Correct=22}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QR10_Correct=23}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QR10_Correct=24}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QR10_Correct=25}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QR10_Correct=26}] at @a[tag=R10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QR10_Correct=30}] run playsound entity.firework_rocket.launch master @a 990 64 1075 1 1 0

execute if entity @e[scores={QR10_Correct=32}] run title @a[tag=R10] times 1 80 1
execute if entity @e[scores={QR10_Correct=32}] run title @a[tag=R10] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QR10_Correct=32}] run title @a[tag=R10] subtitle {"text":"All Technical Trivia Complete!", "color":"white"}
execute if entity @e[scores={QR10_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QR10_Correct=35}] run tellraw @a[tag=R10] ["",{"text":" (✔) CORRECT: ","color":"white","bold":false},{"text":"This is a insertion listener event","color":"red","bold":true,"insertion":"/say The more you know!"},{"text":" <---. Put your mouse over that, and shift-click. It can only be used with the /tellraw command.","color":"white","bold":false}]

#execute if entity @e[scores={QR10_Correct=35}] run fill 1004 63 1068 1004 63 1068 air replace red_concrete
#execute if entity @e[scores={QR10_Correct=35}] run setblock 1010 64 1068 stone_button[face=floor,facing=west]
#execute if entity @e[scores={QR10_Correct=35}] at @a[tag=R10] run playsound entity.player.levelup master @a
execute if entity @e[scores={QR10_Correct=35..}] run scoreboard objectives add FinalRed dummy

execute if entity @e[scores={QR10_Correct=35..}] run scoreboard objectives remove QR10_Correct





# SPAWNPOINT TELEPORTS
# R1
execute align x align y align z run teleport @a[x=1015,y=72,z=1016,dx=0,dy=1,dz=0] 1000 67 1016 270 0

# R2
execute align x align y align z run teleport @a[x=995,y=72,z=1023,dx=0,dy=1,dz=0] 1000 67 1023 90 0

# R3
execute align x align y align z run teleport @a[x=1005,y=73,z=1029,dx=0,dy=1,dz=0] 1000 67 1029 270 0

# R4
execute align x align y align z run teleport @a[x=1015,y=73,z=1029,dx=0,dy=1,dz=0] 1000 67 1036 90 0

# R5
execute align x align y align z run teleport @a[x=1005,y=71,z=1042,dx=0,dy=1,dz=0] 1000 67 1042 270 0

# R6
execute align x align y align z run teleport @a[x=995,y=72,z=1049,dx=0,dy=1,dz=0] 1000 67 1049 90 0

# R7
execute align x align y align z run teleport @a[x=1005,y=71,z=1055,dx=0,dy=1,dz=0] 1000 67 1055 270 0

# R8
execute align x align y align z run teleport @a[x=995,y=72,z=1062,dx=0,dy=1,dz=0] 1000 67 1062 90 0

# R9
execute align x align y align z run teleport @a[x=1005,y=72,z=1069,dx=0,dy=1,dz=0] 1000 67 1069 270 0

# R10
execute align x align y align z run teleport @a[x=1018,y=72,z=1069,dx=0,dy=1,dz=0] 1000 67 1075 90 0
