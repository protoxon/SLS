####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 3 2018 / MAY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1075 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G10D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=1067,dx=24,dy=201,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G10D dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1067,dx=24,dy=201,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G10D 1

execute if entity @e[scores={Incorrect_G10D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G10D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G10D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G10D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G10D=1}] run title @a subtitle {"text":"That's not the first line of the End Poem", "color":"white"}
execute if entity @e[scores={Incorrect_G10D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: We ran out of ideas. So just click the sign and you can go.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G10D=1}] run setblock 1227 55 1081 polished_andesite
execute if entity @e[scores={Incorrect_G10D=1}] run setblock 1227 63 1081 air
execute if entity @e[scores={Incorrect_G10D=2}] run setblock 1227 63 1081 oak_sign[rotation=8]{Text1:"[{\"text\":\"   \"}]",Text2:"[{\"text\":\"CLICK TO LEAVE\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"setblock 1227 55 1081 stone\"}}]",Text3:"[{\"text\":\"   \"}]",Text4:"[{\"text\":\"   \"}]"}



effect give @a[tag=WrongAnswer] resistance 2 255 true
execute if entity @e[scores={Incorrect_G10D=..10}] run effect give @a[tag=WrongAnswer] jump_boost 1000000 90 true
effect clear @a[tag=!WrongAnswer] jump_boost


execute if entity @e[scores={Incorrect_G10D=2..}] if block 1227 55 1081 stone run effect clear @a jump_boost
execute if entity @e[scores={Incorrect_G10D=2..}] if block 1227 55 1081 stone run teleport @a[tag=WrongAnswer] 1075 67 1000 0 0

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=1067,dx=24,dy=201,dz=24] run scoreboard objectives add G10D_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1067,dx=24,dy=201,dz=24] run scoreboard objectives remove G10D_End
execute align x align y align z unless entity @a[x=1215,y=54,z=1067,dx=24,dy=201,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G10D_End 1

execute if entity @e[scores={G10D_End=25..}] run clear @a
execute if entity @e[scores={G10D_End=25..}] run scoreboard objectives remove Incorrect_G10D
execute if entity @e[scores={G10D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G10D_End=25..}] run scoreboard objectives remove G10D_End