####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 29 2018 / AUGUST 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1036 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G4A
#scoreboard objectives setdisplay sidebar G4AMusic

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G4A dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G4A 1

execute if entity @e[scores={Incorrect_G4A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G4A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G4A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G4A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G4A=1}] run title @a subtitle {"text":"Red is not right", "color":"white"}
execute if entity @e[scores={Incorrect_G4A=100}] run tellraw @a ["",{"text":" [X] INCORRECT: The red disc is titled \"chirp\". Have a listen.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G4A=1}] run execute as @e[tag=G4AParrot] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G4A=1}] run kill @e[tag=G4AParrot]
execute if entity @e[scores={Incorrect_G4A=1}] run setblock 1137 57 1019 note_block
execute if entity @e[scores={Incorrect_G4A=2}] run setblock 1137 57 1019 jukebox
execute if entity @e[scores={Incorrect_G4A=1}] run scoreboard objectives remove G4AMusic
execute if block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} run scoreboard objectives add G4AMusic dummy

execute if entity @e[scores={Incorrect_G4A=2}] run summon parrot 1137 73 1019 {NoAI:true, Invulnerable:true, Rotation:[180f,0f], Silent:true, Variant:0, Tags:["G4AParrot","G4AParrot0"]}
execute if entity @e[scores={Incorrect_G4A=2}] run summon parrot 1137 73 1019 {NoAI:true, Invulnerable:true, Rotation:[135f,0f], Silent:true, Variant:1, Tags:["G4AParrot","G4AParrot1"]}
execute if entity @e[scores={Incorrect_G4A=2}] run summon parrot 1137 73 1019 {NoAI:true, Invulnerable:true, Rotation:[315f,0f], Silent:true, Variant:2, Tags:["G4AParrot","G4AParrot2"]}
execute if entity @e[scores={Incorrect_G4A=2}] run summon parrot 1137 73 1019 {NoAI:true, Invulnerable:true, Rotation:[225f,0f], Silent:true, Variant:3, Tags:["G4AParrot","G4AParrot3"]}
execute if entity @e[scores={Incorrect_G4A=2}] run summon parrot 1137 73 1019 {NoAI:true, Invulnerable:true, Rotation:[45f,0f], Silent:true, Variant:4, Tags:["G4AParrot","G4AParrot4"]}

execute if entity @e[scores={Incorrect_G4A=5..7}] run teleport @e[tag=G4AParrot0] 1137 60 1019
execute if entity @e[scores={Incorrect_G4A=5..7}] run teleport @e[tag=G4AParrot1] 1136 60 1018
execute if entity @e[scores={Incorrect_G4A=5..7}] run teleport @e[tag=G4AParrot2] 1138 60 1020
execute if entity @e[scores={Incorrect_G4A=5..7}] run teleport @e[tag=G4AParrot3] 1138 60 1018
execute if entity @e[scores={Incorrect_G4A=5..7}] run teleport @e[tag=G4AParrot4] 1136 60 1020

execute if entity @e[scores={Incorrect_G4A=120}] run playsound entity.item.pickup master @a 1137 58 1019
execute if entity @e[scores={Incorrect_G4A=120}] run summon item 1137 58 1019 {Item: {id:"minecraft:music_disc_chirp", Count:1b, tag: {HideFlags:16, CanPlaceOn: ["minecraft:jukebox"]}}}
execute if entity @e[scores={Incorrect_G4A=..119}] run execute align x align y align z run kill @e[type=item,x=1125,y=54,z=1007,dx=24,dy=24,dz=24]

scoreboard players add @e[tag=MainTriviaAEC] G4AMusic 1
execute if entity @e[scores={G4AMusic=10}] as @e[tag=G4AParrot] at @s run teleport @s ~ ~-1.5 ~

execute unless entity @e[scores={G4AMusic=100..}] run effect give @e[tag=G4AParrot] invisibility 1000000 255 true
execute if entity @e[scores={G4AMusic=120..}] run effect clear @e[tag=G4AParrot0] invisibility
execute if entity @e[scores={G4AMusic=120}] at @e[tag=G4AParrot0] run particle portal ~ ~0.3 ~ 0.1 0.1 0.1 0.5 10 force @a
execute if entity @e[scores={G4AMusic=120}] at @e[tag=G4AParrot0] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={G4AMusic=130..}] run effect clear @e[tag=G4AParrot1] invisibility
execute if entity @e[scores={G4AMusic=130}] at @e[tag=G4AParrot1] run particle portal ~ ~0.3 ~ 0.1 0.1 0.1 0.5 10 force @a
execute if entity @e[scores={G4AMusic=130}] at @e[tag=G4AParrot1] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={G4AMusic=140..}] run effect clear @e[tag=G4AParrot2] invisibility
execute if entity @e[scores={G4AMusic=140}] at @e[tag=G4AParrot2] run particle portal ~ ~0.3 ~ 0.1 0.1 0.1 0.5 10 force @a
execute if entity @e[scores={G4AMusic=140}] at @e[tag=G4AParrot2] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={G4AMusic=150..}] run effect clear @e[tag=G4AParrot3] invisibility
execute if entity @e[scores={G4AMusic=150}] at @e[tag=G4AParrot3] run particle portal ~ ~0.3 ~ 0.1 0.1 0.1 0.5 10 force @a
execute if entity @e[scores={G4AMusic=150}] at @e[tag=G4AParrot3] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={G4AMusic=160..}] run effect clear @e[tag=G4AParrot4] invisibility
execute if entity @e[scores={G4AMusic=160}] at @e[tag=G4AParrot4] run particle portal ~ ~0.3 ~ 0.1 0.1 0.1 0.5 10 force @a
execute if entity @e[scores={G4AMusic=160}] at @e[tag=G4AParrot4] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={G4AMusic=230}] as @e[tag=G4AParrot] run data merge entity @s {Sitting:false, NoAI:false}
execute if entity @e[scores={G4AMusic=1..}] as @e[nbt={Item: {id:"minecraft:music_disc_chirp"}}] run data merge entity @s {Item: {tag: {CanPlaceOn: ["minecraft:bedrock"]}}}

execute if entity @e[scores={G4AMusic=160..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] run data merge entity @s {NoAI:true, Sitting:false}
execute if entity @e[scores={G4AMusic=160..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer] eyes
execute if entity @e[scores={G4AMusic=230..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] at @s run teleport @s ^ ^ ^1 facing entity @p[tag=WrongAnswer] eyes
execute if entity @e[scores={G4AMusic=230..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] at @s run effect give @a[dy=-2] wither
execute if entity @e[scores={G4AMusic=230..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] at @s run gamerule naturalRegeneration false
execute if entity @e[scores={G4AMusic=230..}] unless block 1137 57 1019 jukebox{RecordItem: {id: "minecraft:music_disc_chirp"}} as @e[tag=G4AParrot] at @s run effect give @a[dy=-2] hunger 1 1 true

execute if entity @e[scores={G4AMusic=400..}] as @a[x=1137,y=57,z=1019,distance=..1] run setblock 1137 57 1019 air destroy




# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add G4A_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove G4A_End
execute align x align y align z unless entity @a[x=1125,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G4A_End 1

execute if entity @e[scores={G4A_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G4A_End=25..}] run kill @e[tag=G4AParrot]
execute if entity @e[scores={G4A_End=25..}] run kill @e[type=item,x=1125,y=54,z=1007,dx=24,dy=24,dz=24]
execute if entity @e[scores={G4A_End=25..}] run clear @a
execute if entity @e[scores={G4A_End=25..}] run scoreboard objectives remove G4AMusic
execute if entity @e[scores={G4A_End=25..}] run scoreboard objectives remove Incorrect_G4A
execute if entity @e[scores={G4A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G4A_End=25..}] run scoreboard objectives remove G4A_End