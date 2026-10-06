####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 995

#scoreboard objectives setdisplay sidebar Incorrect_G5B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=54,z=939,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G5B dummy
execute align x align y align z if entity @a[x=1155,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G5B 1

execute if entity @e[scores={Incorrect_G5B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G5B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G5B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G5B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G5B=1}] run title @a subtitle {"text":"4 Infested Blocks is not correct", "color":"white"}
execute if entity @e[scores={Incorrect_G5B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now you'll have to high five these 4 \"Silver Fish\"...","color":"red","bold":false}]

effect give @a[tag=WrongAnswer] water_breathing 3 1 true

execute if entity @e[scores={Incorrect_G5B=..4}] run kill @e[tag=G5BFish]
execute if entity @e[scores={Incorrect_G5B=5}] run summon tropical_fish 1174 60 956 {Variant:1,Tags:["G5BFish"]}
execute if entity @e[scores={Incorrect_G5B=5}] run summon tropical_fish 1169 64 949 {Variant:257,Tags:["G5BFish"]}
execute if entity @e[scores={Incorrect_G5B=5}] run summon tropical_fish 1165 56 945 {Variant:1280,Tags:["G5BFish"]}
execute if entity @e[scores={Incorrect_G5B=5}] run summon tropical_fish 1168 67 959 {Variant:1281,Tags:["G5BFish"]}

execute as @e[tag=G5BFish,nbt={HurtTime:10s}] run kill @s


execute if entity @e[scores={Incorrect_G5B=80..}] unless entity @e[tag=G5BFish] run teleport @a[tag=WrongAnswer] 1042 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives add G5B_End dummy
execute align x align y align z if entity @a[x=1155,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives remove G5B_End
execute align x align y align z unless entity @a[x=1155,y=54,z=939,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G5B_End 1

execute if entity @e[scores={G5B_End=25..}] run kill @e[tag=G5BFish]
execute if entity @e[scores={G5B_End=25..}] run clear @a
execute if entity @e[scores={G5B_End=25..}] run scoreboard objectives remove Incorrect_G5B
execute if entity @e[scores={G5B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G5B_End=25..}] run scoreboard objectives remove G5B_End