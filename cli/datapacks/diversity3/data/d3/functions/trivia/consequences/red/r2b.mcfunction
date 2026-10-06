####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 73 1023

#scoreboard objectives setdisplay sidebar Incorrect_R2B


tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R2B dummy
execute align x align y align z if entity @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R2B 1

execute if entity @e[scores={Incorrect_R2B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R2B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R2B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R2B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R2B=1}] run title @a subtitle {"text":"That wasn't a NOT gate", "color":"white"}
execute if entity @e[scores={Incorrect_R2B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: A NOT gate requires the input to be powered so the output turns off. Now just turn off that lamp and you'll be good to go.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R2B=1}] run fill 941 55 1111 961 55 1131 air replace redstone_wire
execute if entity @e[scores={Incorrect_R2B=1}] run setblock 951 56 1120 air
execute if entity @e[scores={Incorrect_R2B=2}] run setblock 951 56 1120 lever[face=wall,facing=north,powered=false]

execute at @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] if block ~ ~-1 ~ light_gray_concrete if block ~ ~ ~ air run setblock ~ ~ ~ redstone_wire


execute if entity @e[scores={Incorrect_R2B=80..}] if block 951 58 1121 redstone_lamp[lit=false] run teleport @a[tag=WrongAnswer] 1000 67 1023 90 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives add R2B_End dummy
execute align x align y align z if entity @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives remove R2B_End
execute align x align y align z unless entity @a[x=939,y=54,z=1109,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R2B_End 1

execute if entity @e[scores={R2B_End=25..}] run clear @a
execute if entity @e[scores={R2B_End=25..}] run scoreboard objectives remove Incorrect_R2B
execute if entity @e[scores={R2B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R2B_End=25..}] run scoreboard objectives remove R2B_End