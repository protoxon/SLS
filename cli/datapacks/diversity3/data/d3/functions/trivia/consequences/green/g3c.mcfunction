####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2018 / FEBRUARY 17 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 985

#scoreboard objectives setdisplay sidebar Incorrect_G3C
#scoreboard objectives setdisplay sidebar G3CForceLook

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=925,dx=24,dy=24,dz=38] add WrongAnswer

scoreboard objectives add Incorrect_G3C dummy
execute align x align y align z if entity @a[x=1125,y=54,z=925,dx=24,dy=24,dz=38] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G3C 1

execute if entity @e[scores={Incorrect_G3C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G3C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G3C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G3C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G3C=1}] run title @a subtitle {"text":"Sunflowers do not face West", "color":"white"}
execute if entity @e[scores={Incorrect_G3C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: West? You chose West? Well, maybe you should spend some quality time with West, since you seem to love it so much...","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G3C=1}] run setblock 1137 57 960 stone_button[face=floor,facing=west,powered=false]

execute if entity @e[scores={Incorrect_G3C=1}] run scoreboard objectives add G3CForceLook dummy
scoreboard players add @e[tag=MainTriviaAEC] G3CForceLook 1
scoreboard players set @e[scores={G3CForceLook=3..}] G3CForceLook 0


execute if entity @e[scores={G3CForceLook=1}] as @a[tag=WrongAnswer] at @s run teleport @s ~ ~ ~ 90 ~
execute if block 1137 57 960 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1029 67 1000 180 0
execute if block 1137 57 960 stone_button[powered=true] run setblock 1137 57 960 stone_button[face=floor,facing=west,powered=false]



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=925,dx=24,dy=24,dz=38] run scoreboard objectives add G3C_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=925,dx=24,dy=24,dz=38] run scoreboard objectives remove G3C_End
execute align x align y align z unless entity @a[x=1125,y=54,z=925,dx=24,dy=24,dz=38] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G3C_End 1

execute if entity @e[scores={G3C_End=25..}] run clear @a
execute if entity @e[scores={G3C_End=25..}] run scoreboard objectives remove G3CForceLook
execute if entity @e[scores={G3C_End=25..}] run scoreboard objectives remove Incorrect_G3C
execute if entity @e[scores={G3C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G3C_End=25..}] run scoreboard objectives remove G3C_End