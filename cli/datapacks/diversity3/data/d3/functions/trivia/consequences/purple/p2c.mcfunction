####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 4 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 977 71 995

difficulty hard

#scoreboard objectives setdisplay sidebar Incorrect_P2C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=878,y=54,z=939,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P2C dummy
execute align x align y align z if entity @a[x=878,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P2C 1

execute if entity @e[scores={Incorrect_P2C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P2C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P2C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P2C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P2C=1}] run title @a subtitle {"text":"That's not the correct parody", "color":"white"}
execute if entity @e[scores={Incorrect_P2C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Supernatural Mobs, featured on TheAtlanticCraft's YouTube channel, is a parody of \"California Gurls\" by Katy Perry. These ones seem a bit upset they didn't get into the video.","color":"red"}]

execute if entity @e[scores={Incorrect_P2C=1}] as @e[tag=P2CMob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_P2C=1}] as @e[tag=P2CMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P2C=1}] run summon witch 890 57 958 {NoAI:true,Rotation:[180f,0f],Tags:["P2CWitch","P2CMob"]}

execute if entity @e[scores={Incorrect_P2C=..250}] as @e[tag=P2CWitch,x=878,y=54,z=939,dx=24,dy=24,dz=24] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={Incorrect_P2C=150}] run summon lightning_bolt 885 56 954
execute if entity @e[scores={Incorrect_P2C=151}] run summon evoker 885 56 954 {Rotation:[270f,0f],Tags:["P2CEvoker","P2CMob"]}

execute if entity @e[scores={Incorrect_P2C=170}] run summon lightning_bolt 895 56 954
execute if entity @e[scores={Incorrect_P2C=171}] run summon illusioner 895 56 954 {Rotation:[90f,0f],Tags:["P2CIllusioner","P2CMob"]}

execute if entity @e[scores={Incorrect_P2C=250}] as @e[tag=P2CWitch] run data merge entity @s {NoAI:false}


execute as @e[tag=P2CMob] run data merge entity @s {Fire:0s}
effect give @e[tag=P2CMob] resistance 3 255 true



# END SAFEGUARD
execute align x align y align z unless entity @a[x=878,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives add P2C_End dummy
execute align x align y align z if entity @a[x=878,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives remove P2C_End
execute align x align y align z unless entity @a[x=878,y=54,z=939,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P2C_End 1

execute if entity @e[scores={P2C_End=1..}] as @e[tag=P2CMob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={P2C_End=1..}] as @e[tag=P2CMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P2C_End=1..}] run kill @e[type=vex]
execute if entity @e[scores={P2C_End=25..}] run clear @a
execute if entity @e[scores={P2C_End=25..}] run scoreboard objectives remove Incorrect_P2C
execute if entity @e[scores={P2C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P2C_End=25..}] run scoreboard objectives remove P2C_End