####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 31 2018 / SEPTEMBER 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1062 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G8C
#scoreboard objectives setdisplay sidebar G8COnBlock


tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G8C dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G8C 1

execute if entity @e[scores={Incorrect_G8C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G8C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G8C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G8C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G8C=1}] run title @a subtitle {"text":"Packed Ice chimes", "color":"white"}
execute if entity @e[scores={Incorrect_G8C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now hop up to the top and play us a tune on that Note Block.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G8C=1}] run setblock 1191 72 1043 note_block[instrument=chime,note=0]

# RIGHT SIDE
execute unless block 1188 55 1041 note_block[instrument=chime,note=4] run setblock 1188 55 1041 note_block[instrument=chime,note=4]
execute unless block 1188 56 1043 note_block[instrument=chime,note=5] run setblock 1188 56 1043 note_block[instrument=chime,note=5]
execute unless block 1188 57 1045 note_block[instrument=chime,note=7] run setblock 1188 57 1045 note_block[instrument=chime,note=7]
execute unless block 1188 58 1047 note_block[instrument=chime,note=9] run setblock 1188 58 1047 note_block[instrument=chime,note=9]
execute unless block 1188 59 1049 note_block[instrument=chime,note=11] run setblock 1188 59 1049 note_block[instrument=chime,note=11]
execute unless block 1188 60 1051 note_block[instrument=chime,note=12] run setblock 1188 60 1051 note_block[instrument=chime,note=12]
execute unless block 1188 61 1053 note_block[instrument=chime,note=14] run setblock 1188 61 1053 note_block[instrument=chime,note=14]
execute unless block 1188 62 1055 note_block[instrument=chime,note=16] run setblock 1188 62 1055 note_block[instrument=chime,note=16]

execute unless block 1188 63 1057 note_block[instrument=chime,note=5] run setblock 1188 63 1057 note_block[instrument=chime,note=5]
execute unless block 1190 64 1057 note_block[instrument=chime,note=7] run setblock 1190 64 1057 note_block[instrument=chime,note=7]
execute unless block 1192 65 1057 note_block[instrument=chime,note=9] run setblock 1192 65 1057 note_block[instrument=chime,note=9]
execute unless block 1194 66 1057 note_block[instrument=chime,note=11] run setblock 1194 66 1057 note_block[instrument=chime,note=11]
execute unless block 1196 67 1057 note_block[instrument=chime,note=12] run setblock 1196 67 1057 note_block[instrument=chime,note=12]
execute unless block 1198 68 1057 note_block[instrument=chime,note=14] run setblock 1198 68 1057 note_block[instrument=chime,note=14]
execute unless block 1200 69 1057 note_block[instrument=chime,note=16] run setblock 1200 69 1057 note_block[instrument=chime,note=16]
execute unless block 1202 70 1057 note_block[instrument=chime,note=12] run setblock 1202 70 1057 note_block[instrument=chime,note=12]


execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1041,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.50 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1043,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.56 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1045,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.63 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1047,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.67 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1049,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.75 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1051,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.84 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1053,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.945 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1055,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.00 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1188,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.12 0

execute align x align y align z at @a[scores={G8COnBlock=3},x=1190,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.26 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1192,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.33 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1194,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.50 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1196,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.68 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1198,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.89 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1200,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 2.0 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1202,y=55,z=1057,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.5 0

# MINUS 1

#4 5 7 9 11 12 14 16 | 16 17 19 21 23 24 26 28
#0 2 4 5  7  9 11 12 | 12 14 16 17 19 21 23 24 0



# NEW LEFT SIDE
execute unless block 1189 55 1040 note_block[instrument=chime,note=0] run setblock 1189 55 1040 note_block[instrument=chime,note=0]
execute unless block 1191 56 1040 note_block[instrument=chime,note=2] run setblock 1191 56 1040 note_block[instrument=chime,note=2]
execute unless block 1193 57 1040 note_block[instrument=chime,note=4] run setblock 1193 57 1040 note_block[instrument=chime,note=4]
execute unless block 1195 58 1040 note_block[instrument=chime,note=5] run setblock 1195 58 1040 note_block[instrument=chime,note=5]
execute unless block 1197 59 1040 note_block[instrument=chime,note=7] run setblock 1197 59 1040 note_block[instrument=chime,note=7]
execute unless block 1199 60 1040 note_block[instrument=chime,note=9] run setblock 1199 60 1040 note_block[instrument=chime,note=9]
execute unless block 1201 61 1040 note_block[instrument=chime,note=11] run setblock 1201 61 1040 note_block[instrument=chime,note=11]
execute unless block 1203 62 1040 note_block[instrument=chime,note=12] run setblock 1203 62 1040 note_block[instrument=chime,note=12]

execute unless block 1205 63 1040 note_block[instrument=chime,note=14] run setblock 1205 63 1040 note_block[instrument=chime,note=14]
execute unless block 1205 64 1042 note_block[instrument=chime,note=16] run setblock 1205 64 1042 note_block[instrument=chime,note=16]
execute unless block 1205 65 1044 note_block[instrument=chime,note=17] run setblock 1205 65 1044 note_block[instrument=chime,note=17]
execute unless block 1205 66 1046 note_block[instrument=chime,note=19] run setblock 1205 66 1046 note_block[instrument=chime,note=19]
execute unless block 1205 67 1048 note_block[instrument=chime,note=21] run setblock 1205 67 1048 note_block[instrument=chime,note=21]
execute unless block 1205 68 1050 note_block[instrument=chime,note=23] run setblock 1205 68 1050 note_block[instrument=chime,note=23]
execute unless block 1205 69 1052 note_block[instrument=chime,note=24] run setblock 1205 69 1052 note_block[instrument=chime,note=24]
execute unless block 1205 70 1054 note_block[instrument=chime,note=0] run setblock 1205 70 1054 note_block[instrument=chime,note=0]



# LEFT SIDE
#execute unless block 1189 55 1040 note_block[instrument=chime,note=4] run setblock 1189 55 1040 note_block[instrument=chime,note=4]
#execute unless block 1191 56 1040 note_block[instrument=chime,note=5] run setblock 1191 56 1040 note_block[instrument=chime,note=5]
#execute unless block 1193 57 1040 note_block[instrument=chime,note=7] run setblock 1193 57 1040 note_block[instrument=chime,note=7]
#execute unless block 1195 58 1040 note_block[instrument=chime,note=9] run setblock 1195 58 1040 note_block[instrument=chime,note=9]
#execute unless block 1197 59 1040 note_block[instrument=chime,note=11] run setblock 1197 59 1040 note_block[instrument=chime,note=11]
#execute unless block 1199 60 1040 note_block[instrument=chime,note=12] run setblock 1199 60 1040 note_block[instrument=chime,note=12]
#execute unless block 1201 61 1040 note_block[instrument=chime,note=14] run setblock 1201 61 1040 note_block[instrument=chime,note=14]
#execute unless block 1203 62 1040 note_block[instrument=chime,note=16] run setblock 1203 62 1040 note_block[instrument=chime,note=16]

#execute unless block 1205 63 1040 note_block[instrument=chime,note=17] run setblock 1205 63 1040 note_block[instrument=chime,note=17]
#execute unless block 1205 64 1042 note_block[instrument=chime,note=19] run setblock 1205 64 1042 note_block[instrument=chime,note=19]
#execute unless block 1205 65 1044 note_block[instrument=chime,note=21] run setblock 1205 65 1044 note_block[instrument=chime,note=21]
#execute unless block 1205 66 1046 note_block[instrument=chime,note=23] run setblock 1205 66 1046 note_block[instrument=chime,note=23]
#execute unless block 1205 67 1048 note_block[instrument=chime,note=24] run setblock 1205 67 1048 note_block[instrument=chime,note=24]
#execute unless block 1205 68 1050 note_block[instrument=chime,note=2] run setblock 1205 68 1050 note_block[instrument=chime,note=14]
#execute unless block 1205 69 1052 note_block[instrument=chime,note=4] run setblock 1205 69 1052 note_block[instrument=chime,note=16]
#execute unless block 1205 70 1054 note_block[instrument=chime,note=5] run setblock 1205 70 1054 note_block[instrument=chime,note=17]




# MOVE TO LEFT
execute align x align y align z at @a[scores={G8COnBlock=3},x=1189,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.63 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1191,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.67 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1193,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.75 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1195,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.84 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1197,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 0.945 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1199,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.00 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1201,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.12 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1203,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.26 0

execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1040,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.33 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1042,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.50 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1044,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.68 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1046,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.89 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1048,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 2.00 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1050,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.12 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1052,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.26 0
execute align x align y align z at @a[scores={G8COnBlock=3},x=1205,y=55,z=1054,dx=0,dy=16,dz=0] run playsound block.note_block.chime block @a ~ ~-1 ~ 1 1.00 0


execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ note_block run scoreboard objectives add G8COnBlock dummy
execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ note_block run scoreboard players add @s G8COnBlock 1
execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ air run scoreboard players reset @s G8COnBlock
execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ gray_terracotta run scoreboard players reset @s G8COnBlock
execute align x align y align z at @a[scores={G8COnBlock=3}] run particle note ~ ~-0.2 ~ 0.1 0.1 0.1 1 1 force



execute if block 1191 72 1043 note_block[note=24] run teleport @a[tag=WrongAnswer] 1062 67 1000 0 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add G8C_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove G8C_End
execute align x align y align z unless entity @a[x=1185,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G8C_End 1

execute if entity @e[scores={G8C_End=25..}] run clear @a
execute if entity @e[scores={G8C_End=25..}] run scoreboard objectives remove G8COnBlock
execute if entity @e[scores={G8C_End=25..}] run scoreboard objectives remove Incorrect_G8C
execute if entity @e[scores={G8C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G8C_End=25..}] run scoreboard objectives remove G8C_End