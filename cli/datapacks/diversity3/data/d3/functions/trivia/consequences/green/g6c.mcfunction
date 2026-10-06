####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 31 2018 / APRIL 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1049 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G6C
#scoreboard objectives setdisplay sidebar G6CWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G6C dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G6C 1

execute if entity @e[scores={Incorrect_G6C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G6C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G6C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G6C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G6C=1}] run title @a subtitle {"text":"Gold Nuggets create Star-shaped fireworks", "color":"white"}
execute if entity @e[scores={Incorrect_G6C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now you'll have to get all the gold nuggets into the Star-shaped hole.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G6C=1}] run kill @e[tag=G6CNuggetMob]

execute if entity @e[scores={Incorrect_G6C=3}] run summon zombie_pigman 1176.0 61 1041.0 {Invulnerable:true,Rotation:[45f,0f],Tags:["G6CNuggetMob"],Attributes:[{Name:"generic.followRange",Base:0.00},{Name:"generic.movementSpeed",Base:0.05},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Team:G6CNuggets}

execute if entity @e[scores={Incorrect_G6C=3}] run summon zombie_pigman 1175.0 58 1057.0 {Invulnerable:true,Rotation:[135f,0f],Tags:["G6CNuggetMob"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.05},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Team:G6CNuggets}

execute if entity @e[scores={Incorrect_G6C=3}] run summon zombie_pigman 1161.0 60 1057.0 {Invulnerable:true,Rotation:[215f,0f],Tags:["G6CNuggetMob"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.05},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Team:G6CNuggets}

execute if entity @e[scores={Incorrect_G6C=3}] run summon zombie_pigman 1157.5 60 1041.5 {Invulnerable:true,Rotation:[270f,0f],Tags:["G6CNuggetMob"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Team:G6CNuggets}

execute at @e[type=cod] run summon zombie_pigman ~ ~ ~ {Invulnerable:true,Rotation:[270f,0f],Tags:["G6CNuggetMob"],Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],HandItems:[{id:"minecraft:gold_nugget",Count:1b}],Team:G6CNuggets}
execute as @e[type=cod] run kill @s


# MOTION X Y Z FIX

execute align x align y align z as @e[tag=G6CNuggetMob,x=1157,y=59,z=1042,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1157,y=58,z=1043,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1157,y=58,z=1040,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1158,y=56,z=1039,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.01d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1177,y=56,z=1039,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.01d,0.0d,0.03d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1178,y=56,z=1040,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[-0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1178,y=56,z=1059,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[-0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1173,y=55,z=1058,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[-0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1173,y=55,z=1055,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[-0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1176,y=55,z=1058,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.0d]}
execute align x align y align z as @e[tag=G6CNuggetMob,x=1176,y=55,z=1055,dx=0,dy=0.1,dz=0] run data merge entity @s {Motion:[0.03d,0.0d,0.0d]}


execute as @e[tag=G6CNuggetMob,nbt={Motion:[-0.03d,0.0d,0.0d]}] run data merge entity @s {Rotation:[90f,0f]}
execute as @e[tag=G6CNuggetMob,nbt={Motion:[0.03d,0.0d,0.0d]}] run data merge entity @s {Rotation:[270f,0f]}
execute as @e[tag=G6CNuggetMob,nbt={Motion:[0.0d,0.0d,0.03d]}] run data merge entity @s {Rotation:[0f,0f]}
execute as @e[tag=G6CNuggetMob,nbt={Motion:[0.0d,0.0d,-0.03d]}] run data merge entity @s {Rotation:[180f,0f]}


# FOR THE WIN
scoreboard objectives add G6CWin dummy
scoreboard players add @e[tag=G6CNuggetMob] G6CWin 0
execute as @e[tag=G6CNuggetMob] at @s if block ~ ~-1 ~ gold_block run scoreboard players set @s[scores={G6CWin=0}] G6CWin 1

execute if entity @e[scores={Incorrect_G6C=80..}] unless entity @e[scores={G6CWin=0}] run scoreboard players add @e[scores={G6CWin=1..}] G6CWin 1
execute if entity @e[scores={G6CWin=30..}] run teleport @a[tag=WrongAnswer] 1049 67 1000 0 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add G6C_End dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove G6C_End
execute align x align y align z unless entity @a[x=1155,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G6C_End 1

execute if entity @e[scores={G6C_End=25..}] run kill @e[tag=G6CNuggetMob]
execute if entity @e[scores={G6C_End=25..}] run clear @a
execute if entity @e[scores={G6C_End=25..}] run scoreboard objectives remove G6CWin
execute if entity @e[scores={G6C_End=25..}] run scoreboard objectives remove Incorrect_G6C
execute if entity @e[scores={G6C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G6C_End=25..}] run scoreboard objectives remove G6C_End