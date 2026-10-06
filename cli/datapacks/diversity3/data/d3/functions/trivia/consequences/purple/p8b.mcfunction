####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 73 995

#scoreboard objectives setdisplay sidebar Incorrect_P8B
#scoreboard objectives setdisplay sidebar P8BWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=54,z=909,dx=24,dy=24,dz=84] add WrongAnswer

scoreboard objectives add Incorrect_P8B dummy
execute align x align y align z if entity @a[x=788,y=54,z=909,dx=24,dy=24,dz=84] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P8B 1

execute if entity @e[scores={Incorrect_P8B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P8B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P8B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P8B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8B=1}] run title @a subtitle {"text":"Hypnotoad wasn't the first LP", "color":"white"}
execute if entity @e[scores={Incorrect_P8B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Hypnotoad posted his LP on April 21, 2010. But someone was earlier. Now race this turtle to get back to the Branch (it's the closest thing to toads we got).","color":"red"}]

execute if entity @e[scores={Incorrect_P8B=1}] as @e[tag=P8BTurtle] run data merge entity @s {Invulnerable:false,NoAI:false}
execute if entity @e[scores={Incorrect_P8B=1}] as @e[tag=P8BTurtle] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P8B=2}] run summon turtle 799.0 56 979.0 {Invulnerable:true,NoAI:true,Rotation:[180f,0f],Tags:["P8BTurtle"]}

execute if entity @e[scores={Incorrect_P8B=250}] run playsound block.note_block.pling master @a 800 56 977 0.5 0.59 0.5
execute if entity @e[scores={Incorrect_P8B=270}] run playsound block.note_block.pling master @a 800 56 977 0.5 0.59 0.5
execute if entity @e[scores={Incorrect_P8B=290}] run playsound block.note_block.pling master @a 800 56 977 0.5 0.59 0.5
execute if entity @e[scores={Incorrect_P8B=315}] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1

execute if entity @e[scores={Incorrect_P8B=250}] run title @a times 1 40 1
execute if entity @e[scores={Incorrect_P8B=250}] run title @a[tag=WrongAnswer] title {"text":"3","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8B=270}] run title @a times 1 40 1
execute if entity @e[scores={Incorrect_P8B=270}] run title @a[tag=WrongAnswer] title {"text":"2","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8B=290}] run title @a times 1 40 1
execute if entity @e[scores={Incorrect_P8B=290}] run title @a[tag=WrongAnswer] title {"text":"1","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8B=315}] run title @a times 1 40 1
execute if entity @e[scores={Incorrect_P8B=315}] run title @a[tag=WrongAnswer] title {"text":"GO!","bold":false,"color":"green"}

execute if entity @e[scores={Incorrect_P8B=315}] run tag @e[tag=P8BTurtle] add P8BSlowTurtle

tag @a remove P8BRunner
execute if entity @e[scores={Incorrect_P8B=..315}] align x align y align z run tag @a[x=801,y=56,z=978,dx=1,dy=2,dz=2] add P8BRunner
execute if entity @e[scores={Incorrect_P8B=..315}] as @a[tag=WrongAnswer,tag=!P8BRunner] at @s run teleport @s 802.0 56 979.0 ~ ~
execute if entity @e[scores={Incorrect_P8B=..315}] run scoreboard objectives remove P8BWin

execute align x align y align z as @e[tag=P8BSlowTurtle,x=794,y=56,z=917,dx=12,dy=1,dz=64] at @s run teleport @s 799.0 56 ~-0.01 180 0
execute align x align y align z as @e[tag=P8BFastTurtle,x=794,y=56,z=917,dx=12,dy=1,dz=64] at @s run teleport @s 799.0 56 ~-1 180 0

execute align x align y align z if entity @a[x=788,y=56,z=942,dx=24,dy=2,dz=1] run tag @e[tag=P8BSlowTurtle] add P8BFastTurtle
tag @e[tag=P8BFastTurtle] remove P8BSlowTurtle

execute at @e[tag=P8BFastTurtle] run particle smoke ~ ~ ~1 0.1 0.1 0.1 0 5 force
execute at @e[tag=P8BFastTurtle] run playsound entity.guardian.attack master @a ~ ~ ~ 1 1.5 0

execute align x align y align z if entity @e[tag=P8BTurtle,x=788,y=56,z=913,dx=24,dy=2,dz=2] run tag @e[tag=P8BTurtle] add P8BWinTurtle
tag @e[tag=P8BWinTurtle] remove P8BFastTurtle

execute as @e[tag=P8BWinTurtle] run data merge entity @s {NoAI:false}




# TO WIN
execute align x align y align z if entity @e[x=794,y=56,z=918,dx=12,dy=2,dz=1] run scoreboard objectives add P8BWin dummy
scoreboard players add @e[tag=MainTriviaAEC] P8BWin 1
execute if entity @e[scores={P8BWin=5}] at @a[tag=WrongAnswer] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={P8BWin=8}] at @a[tag=WrongAnswer] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={P8BWin=11}] at @a[tag=WrongAnswer] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={P8BWin=35}] at @a[tag=WrongAnswer] run playsound entity.villager.yes master @a ~ ~ ~ 2 1 1

execute if entity @e[scores={P8BWin=70..}] run kill @e[tag=P8BTurtle]
execute if entity @e[scores={P8BWin=70..}] run teleport @a[tag=WrongAnswer] 938 67 1000 180 0
execute if entity @e[scores={P8BWin=70..}] run scoreboard objectives remove P8BWin

# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=54,z=909,dx=24,dy=24,dz=84] run scoreboard objectives add P8B_End dummy
execute align x align y align z if entity @a[x=788,y=54,z=909,dx=24,dy=24,dz=84] run scoreboard objectives remove P8B_End
execute align x align y align z unless entity @a[x=788,y=54,z=909,dx=24,dy=24,dz=84] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P8B_End 1

execute if entity @e[scores={P8B_End=25..}] run clear @a
execute if entity @e[scores={P8B_End=25..}] run scoreboard objectives remove P8BWin
execute if entity @e[scores={P8B_End=25..}] run scoreboard objectives remove Incorrect_P8B
execute if entity @e[scores={P8B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P8B_End=25..}] run scoreboard objectives remove P8B_End