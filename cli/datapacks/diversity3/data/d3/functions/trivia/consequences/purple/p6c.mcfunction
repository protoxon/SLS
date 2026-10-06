####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 1 2018 / MARCH 28 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 74 987

#scoreboard objectives setdisplay sidebar Incorrect_P6C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=54,z=939,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P6C dummy
execute align x align y align z if entity @a[x=818,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P6C 1

execute if entity @e[scores={Incorrect_P6C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P6C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P6C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P6C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P6C=1}] run title @a subtitle {"text":"Sticks & Stones is not the subtitle", "color":"white"}
execute if entity @e[scores={Incorrect_P6C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now collect the 6 sticks and 4 stones to get back to the Branch.","color":"red"}]

execute if entity @e[scores={Incorrect_P6C=1}] as @e[type=!player,x=818,y=54,z=939,dx=24,dy=24,dz=24] at @s run teleport @s ~ ~-100 ~
execute align x align y align z as @e[type=item,x=818,y=54,z=939,dx=24,dy=24,dz=24] run data merge entity @s {Age:-32768}

execute if entity @e[scores={Incorrect_P6C=1}] run summon item 820 62 961 {Item:{id:"minecraft:stone",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 819 57 954 {Item:{id:"minecraft:stone",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 834 60 954 {Item:{id:"minecraft:stone",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 840 62 962 {Item:{id:"minecraft:stone",Count:1b}}

execute if entity @e[scores={Incorrect_P6C=1}] run summon item 834 59 944 {Item:{id:"minecraft:stick",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 826 60 959 {Item:{id:"minecraft:stick",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 841 61 955 {Item:{id:"minecraft:stick",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 835 60 941 {Item:{id:"minecraft:stick",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 824 61 942 {Item:{id:"minecraft:stick",Count:1b}}
execute if entity @e[scores={Incorrect_P6C=1}] run summon item 834 64 960 {Item:{id:"minecraft:stick",Count:1b}}

execute if entity @e[scores={Incorrect_P6C=80..}] unless entity @e[type=item,x=818,y=54,z=939,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:stone",Count:1b}}] unless entity @e[type=item,x=818,y=54,z=939,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:stick",Count:1b}}] run teleport @a[tag=WrongAnswer] 951 67 1000 180 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives add P6C_End dummy
execute align x align y align z if entity @a[x=818,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives remove P6C_End
execute align x align y align z unless entity @a[x=818,y=54,z=939,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P6C_End 1

execute if entity @e[scores={P6C_End=25..}] run clear @a
execute if entity @e[scores={P6C_End=25..}] run scoreboard objectives remove Incorrect_P6C
execute if entity @e[scores={P6C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P6C_End=25..}] run scoreboard objectives remove P6C_End