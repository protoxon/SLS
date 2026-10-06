####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 18 2018 / JULY 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 72 1042

#scoreboard objectives setdisplay sidebar Incorrect_R5A
#scoreboard objectives setdisplay sidebar R5AWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1007,y=48,z=1169,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R5A dummy
execute align x align y align z if entity @a[x=1007,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R5A 1

execute if entity @e[scores={Incorrect_R5A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R5A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R5A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R5A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R5A=1}] run title @a subtitle {"text":"Carpet is a transparent block", "color":"white"}
execute if entity @e[scores={Incorrect_R5A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Believe it or not, carpet does not prevent a skeleton from burning in sunlight.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_R5A=1}] run setblock 1019 61 1181 lime_carpet

execute if entity @e[scores={Incorrect_R5A=1}] as @e[tag=R5ASkeleton] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_R5A=1}] as @e[tag=R5AMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R5A=10}] run kill @e[tag=R5ABlaze]

execute if entity @e[scores={Incorrect_R5A=1}] run summon skeleton 1019 59 1181 {NoAI:true,Rotation:[180f,0f],Attributes:[{Name:"generic.maxHealth",Base:4.0}],Health:4f,Tags:["R5ASkeleton","R5AMob"]}
execute if entity @e[scores={Incorrect_R5A=..100}] run effect give @e[tag=R5ASkeleton] resistance 2 255 true

execute if entity @e[scores={Incorrect_R5A=100..}] unless entity @e[tag=R5ASkeleton] run scoreboard objectives add R5AWin dummy

scoreboard players add @e[tag=MainTriviaAEC] R5AWin 1

execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}
execute if entity @e[scores={R5AWin=1}] run summon zombie 1019 55 1181 {Rotation:[180f,0f],Silent:true,HandItems:[{id:"minecraft:bone",Count:1b}],Invulnerable:true,CustomName:"{\"text\":\"flaming bone\",\"color\":\"white\"}",Tags:["R5AZombie","R5AMob"]}

execute if entity @e[scores={R5AWin=2..15}] run teleport @e[tag=R5AZombie] 1019 59 1181

effect give @e[tag=R5AZombie] invisibility 11 255 true
effect give @e[tag=R5AZombie] strength 11 255 true
execute if entity @e[scores={Incorrect_R5A=100}] run gamerule naturalRegeneration false




# END SAFEGUARD
execute align x align y align z unless entity @a[x=1007,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives add R5A_End dummy
execute align x align y align z if entity @a[x=1007,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives remove R5A_End
execute align x align y align z unless entity @a[x=1007,y=48,z=1169,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R5A_End 1

execute if entity @e[scores={R5A_End=25..}] run clear @a
execute if entity @e[scores={R5A_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={R5A_End=25..}] run scoreboard objectives remove R5AWin
execute if entity @e[scores={R5A_End=25..}] run scoreboard objectives remove Incorrect_R5A
execute if entity @e[scores={R5A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R5A_End=25..}] run scoreboard objectives remove R5A_End