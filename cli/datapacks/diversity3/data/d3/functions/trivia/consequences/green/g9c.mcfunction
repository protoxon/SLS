####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018 / APRIL 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1068 69 995

#scoreboard objectives setdisplay sidebar Incorrect_G9C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=939,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 1 true

scoreboard objectives add Incorrect_G9C dummy
execute align x align y align z if entity @a[x=1215,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G9C 1

execute if entity @e[scores={Incorrect_G9C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G9C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G9C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G9C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G9C=1}] run title @a subtitle {"text":"A Fess is not a center vertical stripe", "color":"white"}
execute if entity @e[scores={Incorrect_G9C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: A center vertical stripe is known as a \"Pale\" pattern. Now go take your Pale Flag, and claim that diamond block for your tribe!","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G9C=1}] run setblock 1227 69 960 air

scoreboard objectives add G9CBanner dummy
scoreboard players add @a G9CBanner 1

execute if entity @e[nbt={Item:{id:"minecraft:banner"}}] run scoreboard objectives remove G9CBanner
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:white_banner"}]}] G9CBanner
execute if entity @e[scores={Incorrect_G9C=100..}] if block 1227 69 960 air run give @a[scores={G9CBanner=5..}] white_banner{BlockEntityTag:{Patterns:[{Pattern:"cs",Color:11}]},CanPlaceOn:["minecraft:diamond_block"],G9CBanner:1b}
execute if entity @e[nbt={Item:{id:"minecraft:white_banner",tag:{G9CBanner:1b}}}] run kill @e[nbt={Item:{id:"minecraft:white_banner",tag:{G9CBanner:1b}}}]

execute if entity @e[scores={Incorrect_G9C=80..}] if block 1227 69 960 white_banner{Patterns: [{Pattern: "cs", Color: 11}]} run teleport @a[tag=WrongAnswer] 1068 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives add G9C_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives remove G9C_End
execute align x align y align z unless entity @a[x=1215,y=54,z=939,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G9C_End 1

execute if entity @e[scores={G9C_End=25..}] run clear @a
execute if entity @e[scores={G9C_End=25..}] run scoreboard objectives remove Incorrect_G9C
execute if entity @e[scores={G9C_End=25..}] run scoreboard objectives remove G9CBanner
execute if entity @e[scores={G9C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G9C_End=25..}] run scoreboard objectives remove G9C_End