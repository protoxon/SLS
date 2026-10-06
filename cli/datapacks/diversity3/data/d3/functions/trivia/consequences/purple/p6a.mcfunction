####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 74 987

#scoreboard objectives setdisplay sidebar Incorrect_P6A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=13,z=969,dx=24,dy=208,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P6A dummy
execute align x align y align z if entity @a[x=818,y=13,z=969,dx=24,dy=208,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P6A 1

execute if entity @e[scores={Incorrect_P6A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P6A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P6A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P6A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P6A=1}] run title @a subtitle {"text":"Dimension Jumper is not the subtitle", "color":"white"}
execute if entity @e[scores={Incorrect_P6A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Dimension Jumper is actually another map by Bigre. Look around. You'll figure it out...","color":"red"}]

effect clear @a[tag=!WrongAnswer]
execute if entity @e[scores={Incorrect_P6A=..10}] run effect give @a[tag=WrongAnswer] jump_boost 1000000 20 true
effect give @a[tag=WrongAnswer] night_vision 12 255 true
effect give @a[tag=WrongAnswer] resistance 3 255 true


execute if entity @e[scores={Incorrect_P6A=80..}] if block 832 204 980 stone_button[powered=true] run effect clear @a[tag=WrongAnswer]
execute if entity @e[scores={Incorrect_P6A=80..}] if block 832 204 980 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 951 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=13,z=969,dx=24,dy=208,dz=24] run scoreboard objectives add P6A_End dummy
execute align x align y align z if entity @a[x=818,y=13,z=969,dx=24,dy=208,dz=24] run scoreboard objectives remove P6A_End
execute align x align y align z unless entity @a[x=818,y=13,z=969,dx=24,dy=208,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P6A_End 1

execute if entity @e[scores={P6A_End=25..}] run clear @a
execute if entity @e[scores={P6A_End=25..}] run scoreboard objectives remove Incorrect_P6A
execute if entity @e[scores={P6A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P6A_End=25..}] run scoreboard objectives remove P6A_End