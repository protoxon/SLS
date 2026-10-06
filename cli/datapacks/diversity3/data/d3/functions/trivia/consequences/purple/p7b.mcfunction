####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 28 2018 / JUNE 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 945 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P7B
#scoreboard objectives setdisplay sidebar P7BGiveLeash
#scoreboard objectives setdisplay sidebar P7BWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=45,z=1037,dx=24,dy=33,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P7B dummy
execute align x align y align z if entity @a[x=788,y=45,z=1037,dx=24,dy=33,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P7B 1

execute if entity @e[scores={Incorrect_P7B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P7B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P7B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P7B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P7B=1}] run title @a subtitle {"text":"direwolf20 does not develop Forge", "color":"white"}
execute if entity @e[scores={Incorrect_P7B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: direwolf20 is well known in the modding community and has showcased many modpacks including Feed the Beast but isn't the brain behind Forge. Good luck sorting these 20 wolves though.","color":"red"}]


execute if entity @e[tag=P7BWolf] run gamerule showDeathMessages false
execute unless entity @e[tag=P7BWolf] run gamerule showDeathMessages true

execute if entity @e[scores={Incorrect_P7B=1}] run kill @e[type=leash_knot]
execute if entity @e[scores={Incorrect_P7B=1}] as @e[tag=P7BWolf] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P7B=3}] run kill @e[tag=P7BWolf]
execute if entity @e[scores={Incorrect_P7B=1..3}] run kill @e[type=item,x=788,y=54,z=1037,dx=24,dy=24,dz=24]

execute as @e[tag=P7BWolf,type=wolf,nbt=!{Leash:{}}] run data merge entity @s {NoAI:1b,Sitting:0b}
execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{}}] run data merge entity @s {NoAI:0b,Sitting:0b}

execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:0b}] at @s if block ~ ~-0.1 ~ air run data merge entity @s {NoGravity:0b}

#execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:0b}] run data merge entity @s {NoGravity:0b}


#execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:0b}] at @s if block ~ ~-1 ~ grass_path run data merge entity @s {NoGravity:0b}

execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:1b}] run data merge entity @s {NoGravity:1b}

#execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:0b}] at @s unless block ~ ~-1 ~ air run data merge entity @s {NoGravity:1b}
#execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{}}] at @s if block ~ ~-1 ~ air run data merge entity @s {NoGravity:0b}
#execute as @e[tag=P7BWolf,type=wolf,nbt={Leash:{},OnGround:0b}] run data merge entity @s {NoGravity:0b}


execute if entity @e[tag=P7BLimeWolf1A,nbt={Leash:{}}] run kill @e[tag=P7BLimeWolf1B]
execute if entity @e[tag=P7BLimeWolf2A,nbt={Leash:{}}] run kill @e[tag=P7BLimeWolf2B]
execute if entity @e[tag=P7BLimeWolf3A,nbt={Leash:{}}] run kill @e[tag=P7BLimeWolf3B]
execute if entity @e[tag=P7BLimeWolf4A,nbt={Leash:{}}] run kill @e[tag=P7BLimeWolf4B]
execute if entity @e[tag=P7BLimeWolf5A,nbt={Leash:{}}] run kill @e[tag=P7BLimeWolf5B]

execute if entity @e[tag=P7BBlueWolf1A,nbt={Leash:{}}] run kill @e[tag=P7BBlueWolf1B]
execute if entity @e[tag=P7BBlueWolf2A,nbt={Leash:{}}] run kill @e[tag=P7BBlueWolf2B]
execute if entity @e[tag=P7BBlueWolf3A,nbt={Leash:{}}] run kill @e[tag=P7BBlueWolf3B]
execute if entity @e[tag=P7BBlueWolf4A,nbt={Leash:{}}] run kill @e[tag=P7BBlueWolf4B]
execute if entity @e[tag=P7BBlueWolf5A,nbt={Leash:{}}] run kill @e[tag=P7BBlueWolf5B]

execute if entity @e[tag=P7BYellowWolf1A,nbt={Leash:{}}] run kill @e[tag=P7BYellowWolf1B]
execute if entity @e[tag=P7BYellowWolf2A,nbt={Leash:{}}] run kill @e[tag=P7BYellowWolf2B]
execute if entity @e[tag=P7BYellowWolf3A,nbt={Leash:{}}] run kill @e[tag=P7BYellowWolf3B]
execute if entity @e[tag=P7BYellowWolf4A,nbt={Leash:{}}] run kill @e[tag=P7BYellowWolf4B]
execute if entity @e[tag=P7BYellowWolf5A,nbt={Leash:{}}] run kill @e[tag=P7BYellowWolf5B]

execute if entity @e[tag=P7BRedWolf1A,nbt={Leash:{}}] run kill @e[tag=P7BRedWolf1B]
execute if entity @e[tag=P7BRedWolf2A,nbt={Leash:{}}] run kill @e[tag=P7BRedWolf2B]
execute if entity @e[tag=P7BRedWolf3A,nbt={Leash:{}}] run kill @e[tag=P7BRedWolf3B]
execute if entity @e[tag=P7BRedWolf4A,nbt={Leash:{}}] run kill @e[tag=P7BRedWolf4B]
execute if entity @e[tag=P7BRedWolf5A,nbt={Leash:{}}] run kill @e[tag=P7BRedWolf5B]


execute if entity @e[tag=P7BLimeWolf1A,nbt=!{Leash:{}}] unless entity @e[tag=P7BLimeWolf1B] at @e[tag=P7BLimeWolf1A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BLimeWolf1B","P7BWolf"]}
execute if entity @e[tag=P7BLimeWolf2A,nbt=!{Leash:{}}] unless entity @e[tag=P7BLimeWolf2B] at @e[tag=P7BLimeWolf2A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BLimeWolf2B","P7BWolf"]}
execute if entity @e[tag=P7BLimeWolf3A,nbt=!{Leash:{}}] unless entity @e[tag=P7BLimeWolf3B] at @e[tag=P7BLimeWolf3A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BLimeWolf3B","P7BWolf"]}
execute if entity @e[tag=P7BLimeWolf4A,nbt=!{Leash:{}}] unless entity @e[tag=P7BLimeWolf4B] at @e[tag=P7BLimeWolf4A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BLimeWolf4B","P7BWolf"]}
execute if entity @e[tag=P7BLimeWolf5A,nbt=!{Leash:{}}] unless entity @e[tag=P7BLimeWolf5B] at @e[tag=P7BLimeWolf5A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BLimeWolf5B","P7BWolf"]}

execute if entity @e[tag=P7BBlueWolf1A,nbt=!{Leash:{}}] unless entity @e[tag=P7BBlueWolf1B] at @e[tag=P7BBlueWolf1A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BBlueWolf1B","P7BWolf"]}
execute if entity @e[tag=P7BBlueWolf2A,nbt=!{Leash:{}}] unless entity @e[tag=P7BBlueWolf2B] at @e[tag=P7BBlueWolf2A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BBlueWolf2B","P7BWolf"]}
execute if entity @e[tag=P7BBlueWolf3A,nbt=!{Leash:{}}] unless entity @e[tag=P7BBlueWolf3B] at @e[tag=P7BBlueWolf3A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BBlueWolf3B","P7BWolf"]}
execute if entity @e[tag=P7BBlueWolf4A,nbt=!{Leash:{}}] unless entity @e[tag=P7BBlueWolf4B] at @e[tag=P7BBlueWolf4A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BBlueWolf4B","P7BWolf"]}
execute if entity @e[tag=P7BBlueWolf5A,nbt=!{Leash:{}}] unless entity @e[tag=P7BBlueWolf5B] at @e[tag=P7BBlueWolf5A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BBlueWolf5B","P7BWolf"]}

execute if entity @e[tag=P7BYellowWolf1A,nbt=!{Leash:{}}] unless entity @e[tag=P7BYellowWolf1B] at @e[tag=P7BYellowWolf1A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BYellowWolf1B","P7BWolf"]}
execute if entity @e[tag=P7BYellowWolf2A,nbt=!{Leash:{}}] unless entity @e[tag=P7BYellowWolf2B] at @e[tag=P7BYellowWolf2A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BYellowWolf2B","P7BWolf"]}
execute if entity @e[tag=P7BYellowWolf3A,nbt=!{Leash:{}}] unless entity @e[tag=P7BYellowWolf3B] at @e[tag=P7BYellowWolf3A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BYellowWolf3B","P7BWolf"]}
execute if entity @e[tag=P7BYellowWolf4A,nbt=!{Leash:{}}] unless entity @e[tag=P7BYellowWolf4B] at @e[tag=P7BYellowWolf4A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BYellowWolf4B","P7BWolf"]}
execute if entity @e[tag=P7BYellowWolf5A,nbt=!{Leash:{}}] unless entity @e[tag=P7BYellowWolf5B] at @e[tag=P7BYellowWolf5A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BYellowWolf5B","P7BWolf"]}

execute if entity @e[tag=P7BRedWolf1A,nbt=!{Leash:{}}] unless entity @e[tag=P7BRedWolf1B] at @e[tag=P7BRedWolf1A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BRedWolf1B","P7BWolf"]}
execute if entity @e[tag=P7BRedWolf2A,nbt=!{Leash:{}}] unless entity @e[tag=P7BRedWolf2B] at @e[tag=P7BRedWolf2A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BRedWolf2B","P7BWolf"]}
execute if entity @e[tag=P7BRedWolf3A,nbt=!{Leash:{}}] unless entity @e[tag=P7BRedWolf3B] at @e[tag=P7BRedWolf3A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BRedWolf3B","P7BWolf"]}
execute if entity @e[tag=P7BRedWolf4A,nbt=!{Leash:{}}] unless entity @e[tag=P7BRedWolf4B] at @e[tag=P7BRedWolf4A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BRedWolf4B","P7BWolf"]}
execute if entity @e[tag=P7BRedWolf5A,nbt=!{Leash:{}}] unless entity @e[tag=P7BRedWolf5B] at @e[tag=P7BRedWolf5A] run summon silverfish ~ ~-9 ~ {Silent:true,Rotation:[180f,0f],Invulnerable:true,Tags:["P7BRedWolf5B","P7BWolf"]}


execute at @e[tag=P7BLimeWolf1B] run teleport @e[tag=P7BLimeWolf1A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BLimeWolf2B] run teleport @e[tag=P7BLimeWolf2A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BLimeWolf3B] run teleport @e[tag=P7BLimeWolf3A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BLimeWolf4B] run teleport @e[tag=P7BLimeWolf4A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BLimeWolf5B] run teleport @e[tag=P7BLimeWolf5A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~

execute at @e[tag=P7BBlueWolf1B] run teleport @e[tag=P7BBlueWolf1A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BBlueWolf2B] run teleport @e[tag=P7BBlueWolf2A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BBlueWolf3B] run teleport @e[tag=P7BBlueWolf3A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BBlueWolf4B] run teleport @e[tag=P7BBlueWolf4A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BBlueWolf5B] run teleport @e[tag=P7BBlueWolf5A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~

execute at @e[tag=P7BYellowWolf1B] run teleport @e[tag=P7BYellowWolf1A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BYellowWolf2B] run teleport @e[tag=P7BYellowWolf2A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BYellowWolf3B] run teleport @e[tag=P7BYellowWolf3A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BYellowWolf4B] run teleport @e[tag=P7BYellowWolf4A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BYellowWolf5B] run teleport @e[tag=P7BYellowWolf5A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~

execute at @e[tag=P7BRedWolf1B] run teleport @e[tag=P7BRedWolf1A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BRedWolf2B] run teleport @e[tag=P7BRedWolf2A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BRedWolf3B] run teleport @e[tag=P7BRedWolf3A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BRedWolf4B] run teleport @e[tag=P7BRedWolf4A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~
execute at @e[tag=P7BRedWolf5B] run teleport @e[tag=P7BRedWolf5A,nbt=!{Leash:{}}] ~ ~9 ~ ~ ~


execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 800 60 1059 {Sitting:false, Invulnerable: true, Age: 0, CollarColor: 5b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BLimeWolf1A","P7BLimeWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 791 58 1049 {Sitting:false, Invulnerable: true, Age: 0, CollarColor: 5b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BLimeWolf2A","P7BLimeWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 794 60 1038 {Sitting:false, Invulnerable: true, Age: 0, CollarColor: 5b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BLimeWolf3A","P7BLimeWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 807 58 1045 {Sitting:false, Invulnerable: true, Age: 0, CollarColor: 5b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BLimeWolf4A","P7BLimeWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 811 60 1052 {Sitting:false, Invulnerable: true, Age: 0, CollarColor: 5b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BLimeWolf5A","P7BLimeWolf","P7BWolf"]}

execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 807 60 1055 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 11b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BBlueWolf1A","P7BBlueWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 797 57 1054 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 11b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BBlueWolf2A","P7BBlueWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 792 58 1043 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 11b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BBlueWolf3A","P7BBlueWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 803 58 1040 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 11b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BBlueWolf4A","P7BBlueWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 810 58 1048 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 11b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BBlueWolf5A","P7BBlueWolf","P7BWolf"]}

execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 797 58 1042 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 4b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BYellowWolf1A","P7BYellowWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 803 57 1045 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 4b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BYellowWolf2A","P7BYellowWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 811 60 1057 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 4b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BYellowWolf3A","P7BYellowWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 792 60 1060 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 4b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BYellowWolf4A","P7BYellowWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 794 58 1053 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 4b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BYellowWolf5A","P7BYellowWolf","P7BWolf"]}

execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 799 58 1040 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 14b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BRedWolf1A","P7BRedWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 806 57 1046 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 14b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BRedWolf2A","P7BRedWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 803 57 1049 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 14b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BRedWolf3A","P7BRedWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 792 58 1047 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 14b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BRedWolf4A","P7BRedWolf","P7BWolf"]}
execute if entity @e[scores={Incorrect_P7B=4}] run summon wolf 797 59 1038 {Sitting:false, Rotation:[0f,0f], Invulnerable: true, Age: 0, CollarColor: 14b, OwnerUUID: "087c312d-b6f4-4d3d-b240-c5fa815580a3", Tags:["P7BRedWolf5A","P7BRedWolf","P7BWolf"]}


execute if block 800 57 1049 stone_button[powered=true] run scoreboard objectives add P7BGiveLeash dummy
execute if block 800 57 1049 stone_button[powered=false] run scoreboard objectives remove P7BGiveLeash
scoreboard players add @e[tag=MainTriviaAEC] P7BGiveLeash 1
execute if entity @e[scores={P7BGiveLeash=1}] run give @p[x=800,y=57,z=1049] lead


execute if entity @e[scores={Incorrect_P7B=80..}] unless entity @e[tag=P7BLimeWolf,nbt=!{Leash:{X:803,Y:58,Z:1046}}] unless entity @e[tag=P7BBlueWolf,nbt=!{Leash:{X:803,Y:58,Z:1052}}] unless entity @e[tag=P7BYellowWolf,nbt=!{Leash:{X:797,Y:58,Z:1052}}] unless entity @e[tag=P7BRedWolf,nbt=!{Leash:{X:797,Y:58,Z:1046}}] run scoreboard objectives add P7BWin dummy
scoreboard players add @e[tag=MainTriviaAEC] P7BWin 1
execute if entity @e[scores={P7BWin=1}] run kill @e[type=leash_knot]
execute if entity @e[scores={P7BWin=1}] run kill @e[type=item,x=788,y=54,z=1037,dx=24,dy=24,dz=24]
execute if entity @e[scores={P7BWin=1}] as @e[tag=P7BWolf] run data merge entity @s {Silent:true}
execute if entity @e[scores={P7BWin=1..}] as @e[tag=P7BWolf] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P7BWin=1}] run kill @e[tag=P7BWolf,type=silverfish]
execute if entity @e[scores={P7BWin=1}] run teleport @a[tag=WrongAnswer] 945 67 1000 0 0





# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=45,z=1037,dx=24,dy=33,dz=24] run scoreboard objectives add P7B_End dummy
execute align x align y align z if entity @a[x=788,y=45,z=1037,dx=24,dy=33,dz=24] run scoreboard objectives remove P7B_End
execute align x align y align z unless entity @a[x=788,y=45,z=1037,dx=24,dy=33,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P7B_End 1

execute if entity @e[scores={P7B_End=25..}] run clear @a
execute if entity @e[scores={P7B_End=25..}] run gamerule showDeathMessages true
execute if entity @e[scores={P7B_End=25..}] run scoreboard objectives remove P7BWin
execute if entity @e[scores={P7B_End=25..}] run scoreboard objectives remove Incorrect_P7B
execute if entity @e[scores={P7B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P7B_End=25..}] run scoreboard objectives remove P7B_End