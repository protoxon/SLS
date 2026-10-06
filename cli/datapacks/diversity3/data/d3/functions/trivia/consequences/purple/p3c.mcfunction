####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 971 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P3C

difficulty hard

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=845,y=50,z=1071,dx=29,dy=28,dz=33] add WrongAnswer

scoreboard objectives add Incorrect_P3C dummy
execute align x align y align z if entity @a[x=845,y=50,z=1071,dx=29,dy=28,dz=33] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P3C 1

execute if entity @e[scores={Incorrect_P3C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P3C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P3C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P3C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P3C=1}] run title @a subtitle {"text":"RageCraft isn't made by Vechs", "color":"white"}
execute if entity @e[scores={Incorrect_P3C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: RageCraft is another popular CTM map series created by heliceo. So obviously not by Vechs.","color":"red"}]

execute if entity @e[scores={Incorrect_P3C=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_P3C=1}] run kill @e[tag=P3CBlaze]
execute if entity @e[scores={Incorrect_P3C=150..165}] run summon blaze 852 70 1089 {Tags:["P3CBlaze"]}



# END SAFEGUARD
execute align x align y align z unless entity @a[x=845,y=50,z=1071,dx=29,dy=28,dz=33] run scoreboard objectives add P3C_End dummy
execute align x align y align z if entity @a[x=845,y=50,z=1071,dx=29,dy=28,dz=33] run scoreboard objectives remove P3C_End
execute align x align y align z unless entity @a[x=845,y=50,z=1071,dx=29,dy=28,dz=33] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P3C_End 1

execute if entity @e[scores={P3C_End=25..}] run clear @a
execute if entity @e[scores={P3C_End=25..}] run kill @e[tag=P3CBlaze]
execute if entity @e[scores={P3C_End=25..}] run scoreboard objectives remove Incorrect_P3C
execute if entity @e[scores={P3C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P3C_End=25..}] run scoreboard objectives remove P3C_End