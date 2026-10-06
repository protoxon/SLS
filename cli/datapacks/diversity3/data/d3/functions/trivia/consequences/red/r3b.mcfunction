####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 74 1029

#scoreboard objectives setdisplay sidebar Incorrect_R3B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1007,y=54,z=1139,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R3B dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R3B 1

execute if entity @e[scores={Incorrect_R3B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R3B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R3B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R3B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R3B=1}] run title @a subtitle {"text":"Slime Blocks can grab Sea Lanterns", "color":"white"}
execute if entity @e[scores={Incorrect_R3B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Just light up that lamp hanging from the ceiling to leave.","color":"red","bold":false}]



execute if block 1019 62 1162 stone_button[powered=true] unless block 1019 58 1160 redstone_block run setblock 1019 58 1160 redstone_block
execute if block 1019 62 1162 stone_button[powered=false] unless block 1019 58 1160 red_concrete run setblock 1019 58 1160 red_concrete


execute if entity @e[scores={Incorrect_R3B=80..}] if block 1019 70 1160 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1000 67 1029 270 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1007,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives add R3B_End dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives remove R3B_End
execute align x align y align z unless entity @a[x=1007,y=54,z=1139,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R3B_End 1

execute if entity @e[scores={R3B_End=25..}] run clear @a
execute if entity @e[scores={R3B_End=25..}] run scoreboard objectives remove Incorrect_R3B
execute if entity @e[scores={R3B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R3B_End=25..}] run scoreboard objectives remove R3B_End