####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 16 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 71 1069

#scoreboard objectives setdisplay sidebar Incorrect_R9B
#scoreboard objectives setdisplay sidebar R9BSong
#scoreboard objectives setdisplay sidebar R9BWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1036,y=53,z=1229,dx=26,dy=25,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R9B dummy
execute align x align y align z if entity @a[x=1036,y=53,z=1229,dx=26,dy=25,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R9B 1

execute if entity @e[scores={Incorrect_R9B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R9B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R9B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R9B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R9B=1}] run title @a subtitle {"text":"Resource Packs do not use .midi files", "color":"white"}
execute if entity @e[scores={Incorrect_R9B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Hope you have your musical hat on for this one.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R9B=1}] as @e[tag=R9BLamb] at @s run teleport @s ~ ~-100 ~
#execute if entity @e[scores={Incorrect_R9B=1}] run fill 1040 56 1239 1058 56 1239 note_block[note=1] replace note_block

execute if entity @e[scores={Incorrect_R9B=3}] run summon sheep 1049 56 1247 {Age:-9999999,Invulnerable:true,Rotation:[180f,0f],Tags:["R9BLamb"]}

execute unless block 1052 65 1251 note_block[note=5] run setblock 1052 65 1251 note_block[note=5]
execute unless block 1050 64 1251 note_block[note=3] run setblock 1050 64 1251 note_block[note=3]
execute unless block 1048 63 1251 note_block[note=1] run setblock 1048 63 1251 note_block[note=1]
execute unless block 1046 64 1251 note_block[note=3] run setblock 1046 64 1251 note_block[note=3]
execute unless block 1044 65 1251 note_block[note=5] run setblock 1044 65 1251 note_block[note=5]
execute unless block 1042 65 1251 note_block[note=5] run setblock 1042 65 1251 note_block[note=5]
execute unless block 1040 65 1251 note_block[note=5] run setblock 1040 65 1251 note_block[note=5]

execute unless entity @e[tag=R9BAEC1] run summon area_effect_cloud 1058 56 1239 {Tags:["R9BAEC","R9BAEC1"],Duration:200}
execute unless entity @e[tag=R9BAEC2] run summon area_effect_cloud 1055 56 1239 {Tags:["R9BAEC","R9BAEC2"],Duration:200}
execute unless entity @e[tag=R9BAEC3] run summon area_effect_cloud 1052 56 1239 {Tags:["R9BAEC","R9BAEC3"],Duration:200}
execute unless entity @e[tag=R9BAEC4] run summon area_effect_cloud 1049 56 1239 {Tags:["R9BAEC","R9BAEC4"],Duration:200}
execute unless entity @e[tag=R9BAEC5] run summon area_effect_cloud 1046 56 1239 {Tags:["R9BAEC","R9BAEC5"],Duration:200}
execute unless entity @e[tag=R9BAEC6] run summon area_effect_cloud 1043 56 1239 {Tags:["R9BAEC","R9BAEC6"],Duration:200}
execute unless entity @e[tag=R9BAEC7] run summon area_effect_cloud 1040 56 1239 {Tags:["R9BAEC","R9BAEC7"],Duration:200}

execute if entity @e[scores={Incorrect_R9B=1}] at @e[tag=R9BAEC] run setblock ~ ~ ~ note_block[note=1]

execute if block 1049 55 1244 stone_button[powered=true] run scoreboard objectives add R9BSong dummy
scoreboard players add @e[tag=MainTriviaAEC] R9BSong 1

execute if entity @e[scores={R9BSong=10}] run setblock 1052 65 1252 redstone_block
execute if entity @e[scores={R9BSong=20}] run setblock 1050 64 1252 redstone_block
execute if entity @e[scores={R9BSong=30}] run setblock 1048 63 1252 redstone_block
execute if entity @e[scores={R9BSong=40}] run setblock 1046 64 1252 redstone_block
execute if entity @e[scores={R9BSong=50}] run setblock 1044 65 1252 redstone_block
execute if entity @e[scores={R9BSong=60}] run setblock 1042 65 1252 redstone_block
execute if entity @e[scores={R9BSong=70}] run setblock 1040 65 1252 redstone_block
execute if entity @e[scores={R9BSong=80}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @e[scores={R9BSong=80}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BSong=80..}] run fill 1040 63 1253 1052 65 1252 clay replace redstone_block
execute if entity @e[scores={R9BSong=80..}] run scoreboard objectives remove R9BSong



# EASY METHOD
#execute if block 1058 56 1239 note_block[note=2] run setblock 1058 56 1239 note_block[note=3]
#execute if block 1058 56 1239 note_block[note=4] run setblock 1058 56 1239 note_block[note=5]
#execute if block 1058 56 1239 note_block[note=6] run setblock 1058 56 1239 note_block[note=1]
#execute if block 1055 56 1239 note_block[note=2] run setblock 1055 56 1239 note_block[note=3]
#execute if block 1055 56 1239 note_block[note=4] run setblock 1055 56 1239 note_block[note=5]
#execute if block 1055 56 1239 note_block[note=6] run setblock 1055 56 1239 note_block[note=1]
#execute if block 1052 56 1239 note_block[note=2] run setblock 1052 56 1239 note_block[note=3]
#execute if block 1052 56 1239 note_block[note=4] run setblock 1052 56 1239 note_block[note=5]
#execute if block 1052 56 1239 note_block[note=6] run setblock 1052 56 1239 note_block[note=1]
#execute if block 1049 56 1239 note_block[note=2] run setblock 1049 56 1239 note_block[note=3]
#execute if block 1049 56 1239 note_block[note=4] run setblock 1049 56 1239 note_block[note=5]
#execute if block 1049 56 1239 note_block[note=6] run setblock 1049 56 1239 note_block[note=1]
#execute if block 1046 56 1239 note_block[note=2] run setblock 1046 56 1239 note_block[note=3]
#execute if block 1046 56 1239 note_block[note=4] run setblock 1046 56 1239 note_block[note=5]
#execute if block 1046 56 1239 note_block[note=6] run setblock 1046 56 1239 note_block[note=1]
#execute if block 1043 56 1239 note_block[note=2] run setblock 1043 56 1239 note_block[note=3]
#execute if block 1043 56 1239 note_block[note=4] run setblock 1043 56 1239 note_block[note=5]
#execute if block 1043 56 1239 note_block[note=6] run setblock 1043 56 1239 note_block[note=1]
#execute if block 1040 56 1239 note_block[note=2] run setblock 1040 56 1239 note_block[note=3]
#execute if block 1040 56 1239 note_block[note=4] run setblock 1040 56 1239 note_block[note=5]
#execute if block 1040 56 1239 note_block[note=6] run setblock 1040 56 1239 note_block[note=1]



# MORE CHALLENGE
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=2] run setblock ~ ~ ~ note_block[note=3]
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=4] run setblock ~ ~ ~ note_block[note=5]
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=7] run setblock ~ ~ ~ note_block[note=8]
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=9] run setblock ~ ~ ~ note_block[note=10]
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=11] run setblock ~ ~ ~ note_block[note=12]
execute at @e[tag=R9BAEC] if block ~ ~ ~ note_block[note=14] run setblock ~ ~ ~ note_block[note=1]


# FOR THE WIN
execute if block 1058 56 1239 note_block[note=5] if block 1055 56 1239 note_block[note=3] if block 1052 56 1239 note_block[note=1] if block 1049 56 1239 note_block[note=3] if block 1046 56 1239 note_block[note=5] if block 1043 56 1239 note_block[note=5] if block 1040 56 1239 note_block[note=5] if block 1041 56 1239 repeater[powered=true] run scoreboard objectives add R9BWin dummy

scoreboard players add @e[tag=MainTriviaAEC] R9BWin 1
execute if entity @e[scores={R9BWin=0..}] as @e[tag=R9BLamb] run data merge entity @s {Rotation:[180f,0f]}
execute if entity @e[scores={R9BWin=10}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d],Silent:true}
execute if entity @e[scores={R9BWin=10}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BWin=25}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @e[scores={R9BWin=25}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BWin=40}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @e[scores={R9BWin=40}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BWin=55}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @e[scores={R9BWin=55}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BWin=70}] as @e[tag=R9BLamb] run data merge entity @s {Motion:[0.0d,0.5d,0.0d]}
execute if entity @e[scores={R9BWin=70}] at @e[tag=R9BLamb] run playsound entity.sheep.ambient master @a ~ ~ ~ 3 1.5 1
execute if entity @e[scores={R9BWin=88}] as @e[tag=R9BLamb] run data merge entity @s {Invulnerable:false}
#execute if entity @e[scores={R9BWin=110}] at @e[tag=R9BLamb] run summon creeper ~ ~-1 ~ {Fuse:0}
execute if entity @e[scores={R9BWin=88}] at @e[tag=R9BLamb] run particle explosion_emitter ~ ~0.3 ~ 1 1 1 0 0 force
execute if entity @e[scores={R9BWin=88}] at @e[tag=R9BLamb] run playsound entity.generic.explode master @a ~ ~ ~ 2 1 0
execute if entity @e[scores={R9BWin=89}] run kill @e[tag=R9BLamb]

execute if entity @e[scores={R9BWin=180..}] run teleport @a[tag=WrongAnswer] 1000 67 1069 270 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1036,y=53,z=1229,dx=26,dy=25,dz=24] run scoreboard objectives add R9B_End dummy
execute align x align y align z if entity @a[x=1036,y=53,z=1229,dx=26,dy=25,dz=24] run scoreboard objectives remove R9B_End
execute align x align y align z unless entity @a[x=1036,y=53,z=1229,dx=26,dy=25,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R9B_End 1

execute if entity @e[scores={R9B_End=25..}] run clear @a
execute if entity @e[scores={R9B_End=25..}] run scoreboard objectives remove R9BWin
execute if entity @e[scores={R9B_End=25..}] run scoreboard objectives remove R9BSong
execute if entity @e[scores={R9B_End=25..}] run scoreboard objectives remove Incorrect_R9B
execute if entity @e[scores={R9B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R9B_End=25..}] run scoreboard objectives remove R9B_End