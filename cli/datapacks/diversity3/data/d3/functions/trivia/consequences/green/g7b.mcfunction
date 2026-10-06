####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 3 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1055 69 986

#scoreboard objectives setdisplay sidebar Incorrect_G7B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true
effect give @e[tag=G7BStray] resistance 3 255 true

scoreboard objectives add Incorrect_G7B dummy
execute align x align y align z if entity @a[x=1185,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G7B 1

execute if entity @e[scores={Incorrect_G7B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G7B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G7B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G7B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G7B=1}] run title @a subtitle {"text":"18 is not the correct amount", "color":"white"}
execute if entity @e[scores={Incorrect_G7B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Just hop up these 18 bookshelves and step on that Enchanting Table to leave.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G7B=1}] as @e[tag=G7BStray] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G7B=80}] run summon stray 1197 55.5 987 {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["G7BStray","G7BStray1"]}
#execute if entity @e[scores={Incorrect_G7B=80}] run summon stray 1191 55.5 981 {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["G7BStray","G7BStray2"]}
#execute if entity @e[scores={Incorrect_G7B=80}] run summon stray 1203 55.5 981 {HandItems:[{id:"minecraft:bow",Count:1b}],Tags:["G7BStray","G7BStray3"]}

execute if entity @e[scores={Incorrect_G7B=80..}] as @e[tag=G7BStray] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer,x=1197,y=73,z=981]
execute if entity @e[scores={Incorrect_G7B=80..}] run teleport @e[tag=G7BStray1] 1197 55.5 987
execute if entity @e[scores={Incorrect_G7B=80..}] run teleport @e[tag=G7BStray2] 1191 55.5 981
execute if entity @e[scores={Incorrect_G7B=80..}] run teleport @e[tag=G7BStray3] 1203 55.5 981

execute if entity @e[scores={Incorrect_G7B=80..}] at @a[tag=WrongAnswer] if block ~ ~ ~ enchanting_table run teleport @a[tag=WrongAnswer] 1055 67 1000 180 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add G7B_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove G7B_End
execute align x align y align z unless entity @a[x=1185,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G7B_End 1

effect clear @a[tag=!WrongAnswer] slowness
execute if entity @e[scores={G7B_End=25..}] run kill @e[tag=G7BStray]
execute if entity @e[scores={G7B_End=25..}] run clear @a
execute if entity @e[scores={G7B_End=25..}] run scoreboard objectives remove Incorrect_G7B
execute if entity @e[scores={G7B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G7B_End=25..}] run scoreboard objectives remove G7B_End