####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 28 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 958 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P5C

difficulty hard

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P5C dummy
execute align x align y align z if entity @a[x=818,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P5C 1

execute if entity @e[scores={Incorrect_P5C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P5C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P5C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P5C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P5C=1}] run title @a subtitle {"text":"Faithful wasn't created by Misa", "color":"white"}
execute if entity @e[scores={Incorrect_P5C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Misa's Realistic Texture Pack was first released for the 2010 Halloween Update and saw new additions until 1.6. Misa's mobs became a favourite among the community, unlike these unrealistic angry Mooshrooms.","color":"red"}]

execute if entity @e[scores={Incorrect_P5C=1}] as @e[tag=P5CMob] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_P5C=2}] run summon mooshroom 836 59 1085 {Invulnerable:true,Rotation:[135f,0f],Tags:["P5CMob","P5CMoooshroom","P5CMooshroom1"]}
execute if entity @e[scores={Incorrect_P5C=2}] run summon mooshroom 824 57 1085 {Invulnerable:true,Rotation:[225f,0f],Tags:["P5CMob","P5CMoooshroom","P5CMooshroom2"]}
execute if entity @e[scores={Incorrect_P5C=2}] run summon mooshroom 822 61 1074 {Invulnerable:true,Rotation:[135f,0f],Tags:["P5CMob","P5CMoooshroom","P5CMooshroom3"]}
execute if entity @e[scores={Incorrect_P5C=2}] run summon mooshroom 836 58 1074 {Invulnerable:true,Rotation:[45f,0f],Tags:["P5CMob","P5CMoooshroom","P5CMooshroom4"]}

execute if entity @e[scores={Incorrect_P5C=150}] run summon zombie 840 65 1069 {CustomName:"{\"text\":\"an unrealistic Mooshroom\",\"color\":\"white\"}",Invulnerable:true,Silent:true,IsBaby:true,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],NoAI:true,Tags:["P5CMob","P5CZombie","P5CZombie1"]}
execute if entity @e[scores={Incorrect_P5C=150}] run summon zombie 840 65 1069 {CustomName:"{\"text\":\"an unrealistic Mooshroom\",\"color\":\"white\"}",Invulnerable:true,Silent:true,IsBaby:true,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],NoAI:true,Tags:["P5CMob","P5CZombie","P5CZombie2"]}
execute if entity @e[scores={Incorrect_P5C=150}] run summon zombie 840 65 1069 {CustomName:"{\"text\":\"an unrealistic Mooshroom\",\"color\":\"white\"}",Invulnerable:true,Silent:true,IsBaby:true,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],NoAI:true,Tags:["P5CMob","P5CZombie","P5CZombie3"]}
execute if entity @e[scores={Incorrect_P5C=150}] run summon zombie 840 65 1069 {CustomName:"{\"text\":\"an unrealistic Mooshroom\",\"color\":\"white\"}",Invulnerable:true,Silent:true,IsBaby:true,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],NoAI:true,Tags:["P5CMob","P5CZombie","P5CZombie4"]}

effect give @e[tag=P5CZombie] invisibility 3 255 true
effect give @e[tag=P5CZombie] strength 3 4 true

execute if entity @e[scores={Incorrect_P5C=151..153}] at @e[tag=P5CMooshroom1] run teleport @e[tag=P5CZombie1] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=151..153}] at @e[tag=P5CMooshroom2] run teleport @e[tag=P5CZombie2] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=151..153}] at @e[tag=P5CMooshroom3] run teleport @e[tag=P5CZombie3] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=151..153}] at @e[tag=P5CMooshroom4] run teleport @e[tag=P5CZombie4] ~ ~ ~ ~ ~

execute if entity @e[scores={Incorrect_P5C=153}] as @e[tag=P5CMooshroom] run data merge entity @s {NoAI:true}
execute if entity @e[scores={Incorrect_P5C=153}] as @e[tag=P5CZombie] run data merge entity @s {NoAI:false}

execute if entity @e[scores={Incorrect_P5C=153..}] at @e[tag=P5CZombie1] run teleport @e[tag=P5CMooshroom1] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=153..}] at @e[tag=P5CZombie2] run teleport @e[tag=P5CMooshroom2] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=153..}] at @e[tag=P5CZombie3] run teleport @e[tag=P5CMooshroom3] ~ ~ ~ ~ ~
execute if entity @e[scores={Incorrect_P5C=153..}] at @e[tag=P5CZombie4] run teleport @e[tag=P5CMooshroom4] ~ ~ ~ ~ ~


# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add P5C_End dummy
execute align x align y align z if entity @a[x=818,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove P5C_End
execute align x align y align z unless entity @a[x=818,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P5C_End 1

execute if entity @e[scores={P5C_End=25..}] run clear @a
execute if entity @e[scores={P5C_End=25..}] run scoreboard objectives remove Incorrect_P5C
execute if entity @e[scores={P5C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P5C_End=25..}] run scoreboard objectives remove P5C_End