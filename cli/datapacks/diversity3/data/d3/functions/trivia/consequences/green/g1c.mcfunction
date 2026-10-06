####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 23 2018 / AUGUST 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1016 73 985

#scoreboard objectives setdisplay sidebar Incorrect_G1C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=18,z=909,dx=24,dy=110,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G1C dummy
execute align x align y align z if entity @a[x=1095,y=18,z=909,dx=24,dy=110,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G1C 1

execute if entity @e[scores={Incorrect_G1C=1}] run effect give @a slow_falling 5 255 true
execute if entity @e[scores={Incorrect_G1C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G1C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G1C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G1C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G1C=1}] run title @a subtitle {"text":"Of course Mushroom Stew is a thing", "color":"white"}
execute if entity @e[scores={Incorrect_G1C=100}] run tellraw @a ["",{"text":" [X] INCORRECT: Stew can be piping hot. Best let it cool a bit before indulging.","color":"red","bold":false}]



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=18,z=909,dx=24,dy=110,dz=24] run scoreboard objectives add G1C_End dummy
execute align x align y align z if entity @a[x=1095,y=18,z=909,dx=24,dy=110,dz=24] run scoreboard objectives remove G1C_End
execute align x align y align z unless entity @a[x=1095,y=18,z=909,dx=24,dy=110,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G1C_End 1

#execute if entity @e[scores={G1C_End=25..}] run clear @a
execute if entity @e[scores={G1C_End=25..}] run scoreboard objectives remove Incorrect_G1C
execute if entity @e[scores={G1C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G1C_End=25..}] run scoreboard objectives remove G1C_End