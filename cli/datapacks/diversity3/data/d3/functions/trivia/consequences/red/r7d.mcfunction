####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 15 2018 / APRIL 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 72 1055

#scoreboard objectives setdisplay sidebar Incorrect_R7D
#scoreboard objectives setdisplay sidebar R7DDoor
#scoreboard objectives setdisplay sidebar R7DWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1067,y=54,z=1199,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R7D dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R7D 1

execute if entity @e[scores={Incorrect_R7D=1}] run effect give @a[tag=WrongAnswer] blindness 2 255 true
execute if entity @e[scores={Incorrect_R7D=1}] at @a[tag=WrongAnswer] run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R7D=1}] run title @a[tag=WrongAnswer] times 1 80 1
execute if entity @e[scores={Incorrect_R7D=1}] run title @a[tag=WrongAnswer] title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R7D=1}] run title @a[tag=WrongAnswer] subtitle {"text":"The ! symbol isn't used for that", "color":"white"}
execute if entity @e[scores={Incorrect_R7D=80}] run tellraw @a[tag=WrongAnswer] ["",{"text":" [X] INCORRECT: ! is a special character used with commands, but it has nothing to do repeating commands.","color":"red","bold":false}]



# DOORS OPEN
execute align x align y align z if entity @a[x=1079,y=65,z=1202,dx=0,dy=1,dz=-2] run setblock 1079 63 1201 redstone_torch
execute align x align y align z unless entity @a[x=1079,y=65,z=1202,dx=0,dy=1,dz=-2] run setblock 1079 63 1201 air

execute align x align y align z if entity @a[x=1081,y=65,z=1204,dx=2,dy=1,dz=0] run setblock 1082 63 1204 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1204,dx=2,dy=1,dz=0] run setblock 1082 63 1204 air

execute align x align y align z if entity @a[x=1081,y=65,z=1207,dx=2,dy=1,dz=0] run setblock 1082 63 1207 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1207,dx=2,dy=1,dz=0] run setblock 1082 63 1207 air

execute align x align y align z if entity @a[x=1081,y=65,z=1210,dx=2,dy=1,dz=0] run setblock 1082 63 1210 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1210,dx=2,dy=1,dz=0] run setblock 1082 63 1210 air

execute align x align y align z if entity @a[x=1081,y=65,z=1213,dx=2,dy=1,dz=0] run setblock 1082 63 1213 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1213,dx=2,dy=1,dz=0] run setblock 1082 63 1213 air

execute align x align y align z if entity @a[x=1081,y=65,z=1216,dx=2,dy=1,dz=0] run setblock 1082 63 1216 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1216,dx=2,dy=1,dz=0] run setblock 1082 63 1216 air

execute align x align y align z if entity @a[x=1081,y=65,z=1219,dx=2,dy=1,dz=0] run setblock 1082 63 1219 redstone_torch
execute align x align y align z unless entity @a[x=1081,y=65,z=1219,dx=2,dy=1,dz=0] run setblock 1082 63 1219 air

execute align x align y align z if entity @a[x=1079,y=65,z=1221,dx=0,dy=1,dz=2] run setblock 1079 63 1222 redstone_torch
execute align x align y align z unless entity @a[x=1079,y=65,z=1221,dx=0,dy=1,dz=2] run setblock 1079 63 1222 air

execute align x align y align z if entity @a[x=1077,y=65,z=1219,dx=-2,dy=1,dz=0] run setblock 1076 63 1219 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1219,dx=-2,dy=1,dz=0] run setblock 1076 63 1219 air

execute align x align y align z if entity @a[x=1077,y=65,z=1216,dx=-2,dy=1,dz=0] run setblock 1076 63 1216 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1216,dx=-2,dy=1,dz=0] run setblock 1076 63 1216 air

execute align x align y align z if entity @a[x=1077,y=65,z=1213,dx=-2,dy=1,dz=0] run setblock 1076 63 1213 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1213,dx=-2,dy=1,dz=0] run setblock 1076 63 1213 air

execute align x align y align z if entity @a[x=1077,y=65,z=1210,dx=-2,dy=1,dz=0] run setblock 1076 63 1210 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1210,dx=-2,dy=1,dz=0] run setblock 1076 63 1210 air

execute align x align y align z if entity @a[x=1077,y=65,z=1207,dx=-2,dy=1,dz=0] run setblock 1076 63 1207 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1207,dx=-2,dy=1,dz=0] run setblock 1076 63 1207 air

execute align x align y align z if entity @a[x=1077,y=65,z=1204,dx=-2,dy=1,dz=0] run setblock 1076 63 1204 redstone_torch
execute align x align y align z unless entity @a[x=1077,y=65,z=1204,dx=-2,dy=1,dz=0] run setblock 1076 63 1204 air

scoreboard objectives add R7DDoor dummy
scoreboard players add @e[tag=MainTriviaAEC] R7DDoor 0

execute align x align y align z at @a[tag=WrongAnswer] if block ~ ~-2 ~ green_glazed_terracotta run scoreboard players add @e[tag=MainTriviaAEC] R7DDoor 1
execute if entity @e[scores={R7DDoor=..15}] align x align y align z at @a[tag=WrongAnswer] if block ~ ~-2 ~ green_glazed_terracotta run scoreboard objectives remove Incorrect_R7D
execute if entity @e[scores={R7DDoor=..15}] align x align y align z at @a[tag=WrongAnswer] if block ~ ~-2 ~ green_glazed_terracotta run teleport @a[tag=WrongAnswer] 1079 66 1212.0 0 0
execute if entity @e[scores={R7DDoor=15..}] align x align y align z at @a[tag=WrongAnswer] if block ~ ~-2 ~ green_glazed_terracotta run scoreboard objectives add R7DWin dummy
execute if entity @e[scores={R7DDoor=15..}] align x align y align z at @a[tag=WrongAnswer] if block ~ ~-2 ~ green_glazed_terracotta run teleport @a[tag=WrongAnswer] 1000 67 1055 270 0
execute align x align y align z if entity @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] run scoreboard players add @e[tag=MainTriviaAEC] R7DWin 1

execute if entity @e[scores={R7DWin=1}] run effect give @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] blindness 2 255 true
execute if entity @e[scores={R7DWin=1}] at @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={R7DWin=1}] run title @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] times 1 80 1
execute if entity @e[scores={R7DWin=1}] run title @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] title {"text":"OKAY! OKAY!","bold":false,"color":"red"}
execute if entity @e[scores={R7DWin=1}] run title @a[x=1000,y=64,z=1055,dx=0,dy=4,dz=0] subtitle {"text":"Enough messing around!", "color":"white"}







# END SAFEGUARD
execute align x align y align z unless entity @a[x=1067,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives add R7D_End dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives remove R7D_End
execute align x align y align z unless entity @a[x=1067,y=54,z=1199,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R7D_End 1

execute if entity @e[scores={R7D_End=25..}] run clear @a
execute if entity @e[scores={R7D_End=25..}] run scoreboard objectives remove R7DDoor
execute if entity @e[scores={R7D_End=25..}] run scoreboard objectives remove R7DWin
execute if entity @e[scores={R7D_End=25..}] run scoreboard objectives remove Incorrect_R7D
execute if entity @e[scores={R7D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R7D_End=25..}] run scoreboard objectives remove R7D_End