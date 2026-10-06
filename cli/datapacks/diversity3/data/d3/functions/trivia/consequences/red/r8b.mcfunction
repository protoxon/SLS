####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 16 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 72 1062

difficulty hard

#scoreboard objectives setdisplay sidebar Incorrect_R8B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=939,y=54,z=1199,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R8B dummy
execute align x align y align z if entity @a[x=939,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R8B 1

execute if entity @e[scores={Incorrect_R8B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R8B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R8B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R8B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R8B=1}] run title @a subtitle {"text":"Variant:6 is not the correct tag", "color":"white"}
execute if entity @e[scores={Incorrect_R8B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Variant:6 isn't actually a proper tag, but it will typically summon the brown rabbit.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_R8B=1}] as @e[tag=R8BMob] at @s run teleport ~ ~-100 ~
execute if entity @e[scores={Incorrect_R8B=10}] run kill @e[tag=R8BMob]

effect give @e[tag=R8BMob] resistance 2 255 true
effect give @e[tag=R8BKillerBunny] strength 2 3 true
effect give @e[tag=R8BKillerBunny] speed 2 10 true

execute if entity @e[scores={Incorrect_R8B=11}] run summon rabbit 951 61 1213 {Rotation:[100f,0f],NoAI:true,Tags:["R8BRabbit1","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=11}] run summon rabbit 949 61 1212 {Rotation:[290f,0f],NoAI:true,Tags:["R8BRabbit2","R8BMob"]}

execute if entity @e[scores={Incorrect_R8B=..330}] run teleport @e[tag=R8BRabbit1] 951 61 1213
execute if entity @e[scores={Incorrect_R8B=..330}] run teleport @e[tag=R8BRabbit2] 949 61 1212
execute if entity @e[scores={Incorrect_R8B=..330}] as @e[tag=R8BRabbit1] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R8BRabbit2,limit=1] eyes
execute if entity @e[scores={Incorrect_R8B=..330}] as @e[tag=R8BRabbit2] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R8BRabbit1,limit=1] eyes

execute if entity @e[scores={Incorrect_R8B=180}] at @e[tag=R8BRabbit1] run particle heart ~ ~0.7 ~ 0.3 0.3 0.3 0 5 force
execute if entity @e[scores={Incorrect_R8B=230}] at @e[tag=R8BRabbit2] run particle heart ~ ~0.7 ~ 0.3 0.3 0.3 0 5 force
execute if entity @e[scores={Incorrect_R8B=330}] as @e[tag=R8BMob] run data merge entity @s {NoAI:false}


execute if entity @e[scores={Incorrect_R8B=300}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=300}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=305}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=305}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=310}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=310}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=315}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=315}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=320}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=320}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}
execute if entity @e[scores={Incorrect_R8B=325}] run playsound entity.item.pickup master @a 950 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8B=325}] run summon rabbit 950 61 1212 {Rotation:[215f,0f],Motion:[0.0d,0.5d,0.0d],RabbitType:99,Age:-999999,Tags:["R8BKillerBunny","R8BMob"]}

# END SAFEGUARD
execute align x align y align z unless entity @a[x=939,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives add R8B_End dummy
execute align x align y align z if entity @a[x=939,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives remove R8B_End
execute align x align y align z unless entity @a[x=939,y=54,z=1199,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R8B_End 1

execute if entity @e[scores={R8B_End=25..}] run clear @a
execute if entity @e[scores={R8B_End=25..}] run kill @e[tag=R8BMob]
execute if entity @e[scores={R8B_End=25..}] run scoreboard objectives remove Incorrect_R8B
execute if entity @e[scores={R8B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R8B_End=25..}] run scoreboard objectives remove R8B_End