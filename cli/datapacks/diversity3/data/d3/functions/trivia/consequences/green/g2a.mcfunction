####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2018 / AUGUST 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1023 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G2A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G2A dummy
execute align x align y align z if entity @a[x=1095,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G2A 1

execute if entity @e[scores={Incorrect_G2A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G2A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G2A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G2A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G2A=1}] run title @a subtitle {"text":"A Bottle o' Enchanting earns you 3-11 XP", "color":"white"}
execute if entity @e[scores={Incorrect_G2A=80}] run tellraw @a ["",{"text":"[X] INCORRECT: One bottle gives a max of 11 XP. But at least now you'll know how it feels to be inside the bottle.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G2A=1..99}] run fill 1102 56 1014 1112 68 1024 air replace water
execute if entity @e[scores={Incorrect_G2A=1}] run setblock 1107 72 1019 dispenser[facing=down]
execute if entity @e[scores={Incorrect_G2A=100}] run setblock 1107 72 1019 air

execute if entity @e[scores={Incorrect_G2A=100..}] run execute align x align y align z as @a[x=1107,y=67,z=1019,dx=0,dy=0,dz=0] at @s run teleport @s 1107 64 1019


execute if entity @e[scores={Incorrect_G2A=1}] run execute as @e[tag=G2ADrowned] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G2A=100..735}] run execute as @a[tag=WrongAnswer] at @s if block ~ ~1 ~ air run playsound weather.rain.above master @a ~ ~2 ~ 0.5 1 0.5

execute if entity @e[scores={Incorrect_G2A=230}] run fill 1102 57 1014 1112 57 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=230}] run fill 1102 57 1014 1112 57 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=280}] run fill 1102 58 1014 1112 58 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=280}] run fill 1102 58 1014 1112 58 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=330}] run fill 1102 59 1014 1112 59 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=330}] run fill 1102 59 1014 1112 59 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=330}] run summon drowned 1107 72 1019 {Tags:["G2ADrowned"]}

execute if entity @e[scores={Incorrect_G2A=380}] run fill 1102 60 1014 1112 60 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=380}] run fill 1102 60 1014 1112 60 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=430}] run fill 1102 61 1014 1112 61 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=430}] run fill 1102 61 1014 1112 61 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=430}] run summon drowned 1107 72 1019 {Tags:["G2ADrowned"]}

execute if entity @e[scores={Incorrect_G2A=480}] run fill 1102 62 1014 1112 62 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=480}] run fill 1102 62 1014 1112 62 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=530}] run fill 1102 63 1014 1112 63 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=530}] run fill 1102 63 1014 1112 63 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=580}] run fill 1102 64 1014 1112 64 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=580}] run fill 1102 64 1014 1112 64 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=630}] run fill 1102 65 1014 1112 65 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=630}] run fill 1102 65 1014 1112 65 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=680}] run fill 1102 66 1014 1112 66 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=680}] run fill 1102 66 1014 1112 66 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=730}] run fill 1102 67 1014 1112 67 1024 water replace air
execute if entity @e[scores={Incorrect_G2A=730}] run fill 1102 67 1014 1112 67 1024 water replace water

execute if entity @e[scores={Incorrect_G2A=735}] run setblock 1107 72 1019 dispenser[facing=down]

execute if entity @e[scores={Incorrect_G2A=1}] run effect clear @a[tag=WrongAnswer] saturation
execute if entity @e[scores={Incorrect_G2A=1}] run gamerule naturalRegeneration false
execute if entity @e[scores={Incorrect_G2A=15}] run effect give @a[tag=WrongAnswer] instant_damage 1 1 true




# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add G2A_End dummy
execute align x align y align z if entity @a[x=1095,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove G2A_End
execute align x align y align z unless entity @a[x=1095,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G2A_End 1

execute if entity @e[scores={G2A_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G2A_End=25..}] run clear @a
execute if entity @e[scores={G2A_End=25..}] run scoreboard objectives remove Incorrect_G2A
execute if entity @e[scores={G2A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G2A_End=25..}] run scoreboard objectives remove G2A_End