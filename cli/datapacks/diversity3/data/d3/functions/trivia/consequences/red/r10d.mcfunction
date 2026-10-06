####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 17 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1018 71 1069

#scoreboard objectives setdisplay sidebar Incorrect_R10D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=900,y=54,z=1229,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R10D dummy
execute align x align y align z if entity @a[x=900,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R10D 1

execute if entity @e[scores={Incorrect_R10D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R10D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R10D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R10D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R10D=1}] run title @a subtitle {"text":"/msg is not used with the insertion event", "color":"white"}
execute if entity @e[scores={Incorrect_R10D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Looks like these guys got the wrong msg from you.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R10D=1}] as @e[tag=R10DBear] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R10D=1}] run summon polar_bear 918 59 1237 {Rotation:[45f,0f],Tags:["R10DBear","R10DMob"]}
execute if entity @e[scores={Incorrect_R10D=1}] run summon polar_bear 917 59 1246 {Rotation:[135f,0f],Tags:["R10DBear","R10DMob"]}
execute if entity @e[scores={Incorrect_R10D=1}] run summon polar_bear 909 59 1244 {Rotation:[225f,0f],Tags:["R10DBear","R10DMob"]}
execute if entity @e[scores={Incorrect_R10D=1}] run summon polar_bear 906 59 1234 {Rotation:[315f,0f],Tags:["R10DBear","R10DMob"]}

execute if entity @e[scores={Incorrect_R10D=100}] run summon polar_bear 912 30 1242 {Silent:true,Age:-9999999,Tags:["R10DBabyBear","R10DMob"]}

execute at @e[tag=R10DBear,limit=1] run teleport @e[tag=R10DBabyBear] ~ ~ ~ ~ ~
effect give @e[tag=R10DBear] strength 9 4 true
effect give @e[tag=R10DBear] speed 2 4 true
effect give @e[tag=R10DMob] resistance 2 255 true

effect give @e[tag=R10DBabyBear] invisibility 11 255 true




# END SAFEGUARD
execute align x align y align z unless entity @a[x=900,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives add R10D_End dummy
execute align x align y align z if entity @a[x=900,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives remove R10D_End
execute align x align y align z unless entity @a[x=900,y=54,z=1229,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R10D_End 1

execute if entity @e[scores={R10D_End=25..}] run clear @a
execute if entity @e[scores={R10D_End=25..}] run kill @e[tag=R10DMob]
execute if entity @e[scores={R10D_End=25..}] run scoreboard objectives remove Incorrect_R10D
execute if entity @e[scores={R10D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R10D_End=25..}] run scoreboard objectives remove R10D_End