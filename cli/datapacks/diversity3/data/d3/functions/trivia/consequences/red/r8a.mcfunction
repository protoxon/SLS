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

#scoreboard objectives setdisplay sidebar Incorrect_R8A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=969,y=54,z=1199,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R8A dummy
execute align x align y align z if entity @a[x=969,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R8A 1

execute if entity @e[scores={Incorrect_R8A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R8A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R8A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R8A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R8A=1}] run title @a subtitle {"text":"Anger:1 is not the correct tag", "color":"white"}
execute if entity @e[scores={Incorrect_R8A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: The Anger:1 tag isn't used for rabbits. It's used for pigmen.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R8A=1}] run fill 969 54 1199 993 77 1223 grass_block replace netherrack

execute if entity @e[scores={Incorrect_R8A=1}] as @e[tag=R8AMob] at @s run teleport ~ ~-100 ~
execute if entity @e[scores={Incorrect_R8A=50}] run kill @e[tag=R8AMob]

execute if entity @e[scores={Incorrect_R8A=150}] run playsound entity.item.pickup master @a 981 61 1212 1 1 0
execute if entity @e[scores={Incorrect_R8A=150}] run summon rabbit 981 61 1212 {RabbitType:99,Rotation:[180f,0f],Tags:["R8ARabbit","R8AMob"],Passengers:[{id:"minecraft:zombie_pigman",Anger:1,Health:300f,Attributes:[{Name:generic.maxHealth,Base:300.0}],IsBaby:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:carrot",Count:1b}],Tags:["R8APigman","R8AMob"]}]}

effect give @e[tag=R8AMob] resistance 2 255 true
effect give @e[tag=R8AMob] strength 2 3 true
effect give @e[tag=R8AMob] speed 2 6 true
execute as @e[tag=R8ARabbit] at @s run teleport @e[tag=R8APigman,sort=nearest,limit=1] ~ ~ ~ ~ 0

execute as @e[tag=R8ARabbit] at @s run fill ~ ~-1 ~ ~ ~-1 ~ netherrack replace grass_block


# END SAFEGUARD
execute align x align y align z unless entity @a[x=969,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives add R8A_End dummy
execute align x align y align z if entity @a[x=969,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives remove R8A_End
execute align x align y align z unless entity @a[x=969,y=54,z=1199,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R8A_End 1

execute if entity @e[scores={R8A_End=25..}] run clear @a
execute if entity @e[scores={R8A_End=25..}] run kill @e[tag=R8AMob]
execute if entity @e[scores={R8A_End=25..}] run scoreboard objectives remove Incorrect_R8A
execute if entity @e[scores={R8A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R8A_End=25..}] run scoreboard objectives remove R8A_End