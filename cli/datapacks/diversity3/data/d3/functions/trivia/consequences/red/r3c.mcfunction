####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 9 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 74 1029

#scoreboard objectives setdisplay sidebar Incorrect_R3C
#scoreboard objectives setdisplay sidebar R3CPistonButton
#scoreboard objectives setdisplay sidebar R3CChickenSound
#scoreboard objectives setdisplay sidebar R3CWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1037,y=48,z=1139,dx=24,dy=30,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R3C dummy
execute align x align y align z if entity @a[x=1037,y=48,z=1139,dx=24,dy=30,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R3C 1

execute if entity @e[scores={Incorrect_R3C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R3C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R3C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R3C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R3C=1}] run title @a subtitle {"text":"Slime Blocks do grab Ice", "color":"white"}
execute if entity @e[scores={Incorrect_R3C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now get your feathered friend through this icy death trap.","color":"red","bold":false}]


gamerule randomTickSpeed 0

execute if entity @e[scores={Incorrect_R3C=1}] run kill @e[tag=R3CChicken]

execute if entity @e[scores={Incorrect_R3C=150}] run summon chicken 1054 76 1159 {Rotation:[180f,0f],Invulnerable:true,Tags:["R3CChicken"]}
scoreboard players set @e[scores={Incorrect_R3C=250..}] Incorrect_R3C 145


# BUTTON METHOD
scoreboard objectives add R3CPistonButton dummy

execute if block 1049 62 1144 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] R3CPistonButton 1
execute if entity @e[scores={R3CPistonButton=10}] run setblock 1049 62 1144 stone_button[face=wall,facing=north,powered=false] 
execute if block 1049 62 1144 stone_button[powered=false] run scoreboard players set @e[tag=MainTriviaAEC] R3CPistonButton 0

execute if entity @e[scores={R3CPistonButton=0}] run fill 1041 52 1159 1057 71 1159 packed_ice replace redstone_block
execute if entity @e[scores={R3CPistonButton=1}] run fill 1041 52 1159 1057 71 1159 redstone_block replace packed_ice



# PISTON FIX
#execute if block 1056 71 1159 sticky_piston[extended=true] align x align y align z as @e[type=chicken,x=1054,y=71,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-1.0d,0.1d,0.0d]}
#execute if block 1056 71 1159 sticky_piston[extended=true] align x align y align z as @e[type=chicken,x=1044,y=67,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.9d,0.1d,0.0d]}
#execute if block 1056 71 1159 sticky_piston[extended=true] align x align y align z as @e[type=chicken,x=1052,y=63,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-0.6d,0.1d,0.0d]}
#execute if block 1056 71 1159 sticky_piston[extended=true] align x align y align z as @e[type=chicken,x=1046,y=59,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.5d,0.1d,0.0d]}
#execute if block 1056 71 1159 sticky_piston[extended=true] align x align y align z as @e[type=chicken,x=1050,y=55,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-0.3d,0.1d,0.0d]}

execute if block 1054 71 1159 slime_block align x align y align z as @e[type=chicken,x=1054,y=71,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-1.0d,0.1d,0.0d]}
execute if block 1044 67 1159 slime_block align x align y align z as @e[type=chicken,x=1044,y=67,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.8d,0.1d,0.0d]}
execute if block 1052 63 1159 slime_block align x align y align z as @e[type=chicken,x=1052,y=63,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-0.6d,0.1d,0.0d]}
execute if block 1046 59 1159 slime_block align x align y align z as @e[type=chicken,x=1046,y=59,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[0.5d,0.1d,0.0d]}
execute if block 1050 55 1159 slime_block align x align y align z as @e[type=chicken,x=1050,y=55,z=1159,dx=0,dy=0,dz=0] run data merge entity @s {Motion:[-0.3d,0.1d,0.0d]}



# CHICKEN SOUNDS
execute as @e[type=chicken] at @s[nbt={Invulnerable:true}] if block ~ ~ ~ lava run playsound entity.chicken.death master @a ~ ~ ~ 1.5 1 0
execute as @e[type=chicken] at @s if block ~ ~ ~ lava run data merge entity @s {Invulnerable:false}

scoreboard objectives add R3CChickenSound dummy
scoreboard players add @e[tag=R3CChicken] R3CChickenSound 1
scoreboard players set @e[scores={R3CChickenSound=200..}] R3CChickenSound 0
execute at @e[scores={R3CChickenSound=1}] run playsound entity.chicken.ambient master @a ~ ~ ~ 1.7 1 0


# FOR THE WIN
execute if block 1048 52 1159 redstone_lamp[lit=false] run scoreboard objectives remove R3CWin
execute if entity @e[scores={Incorrect_R3C=80..}] if block 1048 52 1159 redstone_lamp[lit=true] run scoreboard objectives add R3CWin dummy
scoreboard players add @e[tag=MainTriviaAEC] R3CWin 1

execute if entity @e[scores={R3CWin=2}] at @a[tag=WrongAnswer] run playsound block.note_block.pling master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R3CWin=50..}] run teleport @a[tag=WrongAnswer] 1000 67 1029 270 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1037,y=48,z=1139,dx=24,dy=30,dz=24] run scoreboard objectives add R3C_End dummy
execute align x align y align z if entity @a[x=1037,y=48,z=1139,dx=24,dy=30,dz=24] run scoreboard objectives remove R3C_End
execute align x align y align z unless entity @a[x=1037,y=48,z=1139,dx=24,dy=30,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R3C_End 1

execute if entity @e[scores={R3C_End=25..}] run clear @a
execute if entity @e[scores={R3C_End=25..}] run scoreboard objectives remove R3CPistonButton
execute if entity @e[scores={R3C_End=25..}] run scoreboard objectives remove R3CChickenSound
execute if entity @e[scores={R3C_End=25..}] run scoreboard objectives remove R3CWin
execute if entity @e[scores={R3C_End=25..}] run scoreboard objectives remove Incorrect_R3C
execute if entity @e[scores={R3C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R3C_End=25..}] run scoreboard objectives remove R3C_End