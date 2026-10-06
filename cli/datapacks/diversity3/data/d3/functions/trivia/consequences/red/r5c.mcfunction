####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 18 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 72 1042

#scoreboard objectives setdisplay sidebar Incorrect_R5C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1037,y=48,z=1169,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R5C dummy
execute align x align y align z if entity @a[x=1037,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R5C 1

execute if entity @e[scores={Incorrect_R5C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R5C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R5C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R5C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R5C=1}] run title @a subtitle {"text":"Chests are transparent blocks", "color":"white"}
execute if entity @e[scores={Incorrect_R5C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: As you can see, the chest doesn't prevent a skeleton from burning in sunlight.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R5C=1}] run setblock 1048 63 1182 chest[facing=north]

execute if entity @e[scores={Incorrect_R5C=1}] as @e[tag=R5CSkeleton] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_R5C=1}] as @e[tag=R5CMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R5C=10}] run kill @e[tag=R5CBlaze]

execute if entity @e[scores={Incorrect_R5C=1}] run summon skeleton 1048 60 1182 {NoAI:true,Rotation:[180f,0f],Tags:["R5CSkeleton","R5CMob"]}
effect give @e[tag=R5CSkeleton] resistance 2 255 true

execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",Tags:["R5CBlaze","R5CMob"]}
execute if entity @e[scores={Incorrect_R5C=150}] run summon blaze 1048 56 1182 {Rotation:[180f,0f],Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a burning skeleton\",\"color\":\"white\"}",wTags:["R5CBlaze","R5CMob"]}

execute if entity @e[scores={Incorrect_R5C=152..}] run teleport @e[tag=R5CBlaze] 1048 60 1182
effect give @e[tag=R5CBlaze] invisibility 11 255 true
execute if entity @e[scores={Incorrect_R5C=150}] run gamerule naturalRegeneration false

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1037,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives add R5C_End dummy
execute align x align y align z if entity @a[x=1037,y=48,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives remove R5C_End
execute align x align y align z unless entity @a[x=1037,y=48,z=1169,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R5C_End 1

execute if entity @e[scores={R5C_End=25..}] run clear @a
execute if entity @e[scores={R5C_End=25..}] run kill @e[tag=R5CMob]
execute if entity @e[scores={R5C_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={R5C_End=25..}] run scoreboard objectives remove Incorrect_R5C
execute if entity @e[scores={R5C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R5C_End=25..}] run scoreboard objectives remove R5C_End