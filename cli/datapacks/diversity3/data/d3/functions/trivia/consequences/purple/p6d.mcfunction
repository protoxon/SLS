####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 28 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 74 987

#scoreboard objectives setdisplay sidebar Incorrect_P6D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=39,z=909,dx=24,dy=38,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P6D dummy
execute align x align y align z if entity @a[x=818,y=39,z=909,dx=24,dy=38,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P6D 1

execute if entity @e[scores={Incorrect_P6D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P6D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P6D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P6D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P6D=1}] run title @a subtitle {"text":"The Dropper 2 has a subtitle", "color":"white"}
execute if entity @e[scores={Incorrect_P6D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now find the button to return to the Branch.","color":"red"}]

execute if block 819 69 931 stone_button run setblock 819 69 931 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_P6D=80..}] if block 819 69 931 jungle_button[powered=true] run teleport @a[tag=WrongAnswer] 951 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=39,z=909,dx=24,dy=38,dz=24] run scoreboard objectives add P6D_End dummy
execute align x align y align z if entity @a[x=818,y=39,z=909,dx=24,dy=38,dz=24] run scoreboard objectives remove P6D_End
execute align x align y align z unless entity @a[x=818,y=39,z=909,dx=24,dy=38,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P6D_End 1

execute if entity @e[scores={P6D_End=25..}] run clear @a
execute if entity @e[scores={P6D_End=25..}] run scoreboard objectives remove Incorrect_P6D
execute if entity @e[scores={P6D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P6D_End=25..}] run scoreboard objectives remove P6D_End