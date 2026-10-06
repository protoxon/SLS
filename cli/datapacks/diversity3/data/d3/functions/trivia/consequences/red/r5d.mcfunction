####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 18 2018 / MARCH 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 72 1042

#scoreboard objectives setdisplay sidebar Incorrect_R5D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1067,y=48,z=1169,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R5D dummy
execute align x align y align z if entity @a[x=1067,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R5D 1

execute if entity @e[scores={Incorrect_R5D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R5D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R5D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R5D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R5D=1}] run title @a subtitle {"text":"Hoppers are transparent blocks", "color":"white"}
execute if entity @e[scores={Incorrect_R5D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: As you can see, a hopper doesn't prevent a skeleton from burning in sunlight.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R5D=1}] run setblock 1079 60 1183 hopper
execute if entity @e[scores={Incorrect_R5D=1}] run setblock 1079 57 1183 air

execute if entity @e[scores={Incorrect_R5D=1}] as @e[tag=R5DSkeleton] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_R5D=1}] as @e[tag=R5DMob] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_R5D=1}] run summon skeleton 1079 57 1183 {NoAI:true,Rotation:[180f,0f],Tags:["R5DSkeleton","R5DMob"]}
effect give @e[tag=R5DSkeleton] resistance 2 255 true

execute if entity @e[scores={Incorrect_R5D=250}] run gamerule naturalRegeneration false
execute if entity @e[scores={Incorrect_R5D=250}] run setblock 1079 57 1183 fire
execute if entity @e[scores={Incorrect_R5D=250}] run tellraw @a ["",{"text":" Here. Have a closer look.","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_R5D=270..}] as @a[tag=WrongAnswer] at @s run teleport @s ^ ^ ^0.2 facing 1079 57.2 1183
execute if entity @e[scores={Incorrect_R5D=270..}] run effect give @a[tag=WrongAnswer] levitation 100 255 true
execute if entity @e[scores={Incorrect_R5D=270..}] run effect clear @a[tag=!WrongAnswer] levitation

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1067,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives add R5D_End dummy
execute align x align y align z if entity @a[x=1067,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives remove R5D_End
execute align x align y align z unless entity @a[x=1067,y=48,z=1169,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R5D_End 1

execute if entity @e[scores={R5D_End=25..}] run clear @a
execute if entity @e[scores={R5D_End=25..}] run kill @e[tag=R5DMob]
execute if entity @e[scores={R5D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={R5D_End=25..}] run scoreboard objectives remove Incorrect_R5D
execute if entity @e[scores={R5D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R5D_End=25..}] run scoreboard objectives remove R5D_End