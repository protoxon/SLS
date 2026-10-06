####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018 / SEPTEMBER 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 74 1029

#scoreboard objectives setdisplay sidebar Incorrect_R3D
#scoreboard objectives setdisplay sidebar R3DBluePiston
#scoreboard objectives setdisplay sidebar R3DPurplePiston
#scoreboard objectives setdisplay sidebar R3DYellowPiston

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1067,y=54,z=1139,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R3D dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R3D 1

execute if entity @e[scores={Incorrect_R3D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R3D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R3D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R3D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R3D=1}] run title @a subtitle {"text":"Slime Blocks can grab Wet Sponge", "color":"white"}
execute if entity @e[scores={Incorrect_R3D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: See that button above the red room? Press it.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R3D=1}] run fill 1069 57 1141 1089 59 1161 tube_coral_block replace blue_terracotta
execute if entity @e[scores={Incorrect_R3D=1}] run fill 1069 57 1141 1089 59 1161 bubble_coral_block replace purple_terracotta
execute if entity @e[scores={Incorrect_R3D=1}] run fill 1069 57 1141 1089 59 1161 horn_coral_block replace yellow_terracotta
execute if entity @e[scores={Incorrect_R3D=1}] run fill 1069 57 1141 1089 59 1161 fire_coral_block replace red_terracotta
execute if entity @e[scores={Incorrect_R3D=1}] run setblock 1082 57 1156 stone_button[face=floor,facing=west,powered=false]
execute if entity @e[scores={Incorrect_R3D=1}] run setblock 1072 57 1146 stone_button[face=floor,facing=west,powered=false]

execute if entity @e[scores={Incorrect_R3D=1}] run setblock 1087 56 1152 air
execute if entity @e[scores={Incorrect_R3D=2}] run setblock 1087 56 1152 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R3D=1}] run setblock 1078 56 1159 air
execute if entity @e[scores={Incorrect_R3D=2}] run setblock 1078 56 1159 lever[face=wall,facing=west,powered=false]
execute if entity @e[scores={Incorrect_R3D=1}] run setblock 1071 56 1150 air
execute if entity @e[scores={Incorrect_R3D=2}] run setblock 1071 56 1150 lever[face=wall,facing=north,powered=false]


#scoreboard players set @e[scores={Incorrect_R3D=160..}] Incorrect_R3D 100
#execute if entity @e[scores={Incorrect_R3D=100}] run setblock 1084 64 1143 redstone_block
#execute if entity @e[scores={Incorrect_R3D=100}] run playsound block.piston.extend master @a 1084 64 1144 0.3 1 0.1
#execute if entity @e[scores={Incorrect_R3D=110}] run setblock 1084 64 1143 white_concrete
#execute if entity @e[scores={Incorrect_R3D=110}] run playsound block.piston.contract master @a 1084 64 1144 0.3 1 0.1
#execute if entity @e[scores={Incorrect_R3D=120}] run setblock 1087 64 1156 redstone_block
#execute if entity @e[scores={Incorrect_R3D=120}] run playsound block.piston.extend master @a 1087 64 1156 0.3 1 0.1
#execute if entity @e[scores={Incorrect_R3D=130}] run setblock 1087 64 1156 white_concrete
#execute if entity @e[scores={Incorrect_R3D=130}] run playsound block.piston.contract master @a 1087 64 1156 0.3 1 0.1
#execute if entity @e[scores={Incorrect_R3D=140}] run setblock 1074 64 1159 redstone_block
#execute if entity @e[scores={Incorrect_R3D=140}] run playsound block.piston.extend master @a 1074 64 1159 0.3 1 0.1
#execute if entity @e[scores={Incorrect_R3D=150}] run setblock 1074 64 1159 white_concrete
#execute if entity @e[scores={Incorrect_R3D=150}] run playsound block.piston.contract master @a 1074 64 1159 0.3 1 0.1

execute if block 1084 57 1148 stone_button[powered=true] run scoreboard objectives add R3DBluePiston dummy
execute if block 1084 57 1148 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] R3DBluePiston 1
execute if entity @e[scores={R3DBluePiston=13}] run setblock 1084 64 1143 redstone_block
execute if block 1084 57 1148 stone_button[powered=false] run setblock 1084 64 1143 white_concrete
execute if block 1084 57 1148 stone_button[powered=false] run scoreboard objectives remove R3DBluePiston


execute if block 1082 57 1156 stone_button[powered=true] run scoreboard objectives add R3DPurplePiston dummy
execute if block 1082 57 1156 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] R3DPurplePiston 1
execute if entity @e[scores={R3DPurplePiston=13}] run setblock 1087 64 1156 redstone_block
execute if block 1082 57 1156 stone_button[powered=false] run setblock 1087 64 1156 white_concrete
execute if block 1082 57 1156 stone_button[powered=false] run scoreboard objectives remove R3DPurplePiston


execute if block 1074 57 1154 stone_button[powered=true] run scoreboard objectives add R3DYellowPiston dummy
execute if block 1074 57 1154 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] R3DYellowPiston 1
execute if entity @e[scores={R3DYellowPiston=13}] run setblock 1074 64 1159 redstone_block
execute if block 1074 57 1154 stone_button[powered=false] run setblock 1074 64 1159 white_concrete
execute if block 1074 57 1154 stone_button[powered=false] run scoreboard objectives remove R3DYellowPiston




effect give @a[tag=WrongAnswer] resistance 2 255 true
execute if entity @e[scores={Incorrect_R3D=80..}] if block 1072 64 1146 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1000 67 1029 270 0

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1067,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives add R3D_End dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives remove R3D_End
execute align x align y align z unless entity @a[x=1067,y=54,z=1139,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R3D_End 1

execute if entity @e[scores={R3D_End=25..}] run clear @a
execute if entity @e[scores={R3D_End=25..}] run scoreboard objectives remove Incorrect_R3D
execute if entity @e[scores={R3D_End=25..}] run scoreboard objectives remove R3DBluePiston
execute if entity @e[scores={R3D_End=25..}] run scoreboard objectives remove R3DPurplePiston
execute if entity @e[scores={R3D_End=25..}] run scoreboard objectives remove R3DYellowPiston
execute if entity @e[scores={R3D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R3D_End=25..}] run scoreboard objectives remove R3D_End