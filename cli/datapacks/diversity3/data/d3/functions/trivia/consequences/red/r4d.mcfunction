####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 13 2018 / APRIL 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1015 72 1029

#scoreboard objectives setdisplay sidebar Incorrect_R4D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R4D dummy
execute align x align y align z if entity @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R4D 1

execute if entity @e[scores={Incorrect_R4D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R4D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R4D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R4D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R4D=1}] run title @a subtitle {"text":"Activator Rails repeatedly execute commands", "color":"white"}
execute if entity @e[scores={Incorrect_R4D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Command block minecarts will run commands every four game ticks if the Minecart is on an activator rail. Like this.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R4D=1}] run kill @e[tag=R4DMinecart]
execute if entity @e[scores={Incorrect_R4D=1}] run fill 909 54 1139 933 59 1163 air replace fire
execute if entity @e[scores={Incorrect_R4D=30}] run summon command_block_minecart 921 178 1151 {Invulnerable:true,Tags:["R4DMinecart"],Command:"execute align x align y align z at @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] unless block ~ ~-1 ~ air run fill ~ ~ ~ ~ ~ ~ fire replace air"}

execute if entity @e[scores={Incorrect_R4D=80}] run gamerule naturalRegeneration false

execute as @e[tag=R4DMinecart] at @s if block ~ ~ ~ activator_rail run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}



# END SAFEGUARD
execute align x align y align z unless entity @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives add R4D_End dummy
execute align x align y align z if entity @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives remove R4D_End
execute align x align y align z unless entity @a[x=909,y=54,z=1139,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R4D_End 1

execute if entity @e[scores={R4D_End=25..}] run clear @a
execute if entity @e[scores={R4D_End=25..}] run kill @e[tag=R4DMinecart]
execute if entity @e[scores={R4D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={R4D_End=25..}] run scoreboard objectives remove Incorrect_R4D
execute if entity @e[scores={R4D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R4D_End=25..}] run scoreboard objectives remove R4D_End