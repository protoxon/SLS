####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 28 2018 / JUNE 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 945 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P7A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P7A dummy
execute align x align y align z if entity @a[x=788,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P7A 1

execute if entity @e[scores={Incorrect_P7A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P7A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P7A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P7A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P7A=1}] run title @a subtitle {"text":"dan200 does not develop Forge", "color":"white"}
execute if entity @e[scores={Incorrect_P7A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: dan200 created the popular mod ComputerCraft. Can you debug this consequence?","color":"red"}]

execute if entity @e[scores={Incorrect_P7A=1}] run clone 798 65 1023 802 67 1023 798 65 1022
execute if entity @e[scores={Incorrect_P7A=1}] run fill 797 63 1017 803 63 1020 stone_pressure_plate[powered=false]
execute if entity @e[scores={Incorrect_P7A=1}] as @e[tag=P7APigman] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_P7A=250}] run fill 797 63 1017 803 63 1020 stone_pressure_plate[powered=true]
execute if entity @e[scores={Incorrect_P7A=250}] run fill 798 65 1022 802 67 1022 blue_concrete
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}
execute if entity @e[scores={Incorrect_P7A=250}] run summon zombie 800 70 1018 {CustomName:"{\"text\":\"Blue Screen of Death\",\"color\":\"white\"}",Invulnerable:true,Silent:true,Anger:1000,Tags:["P7APigman"]}

execute if entity @e[scores={Incorrect_P7A=250}] run playsound entity.wither.spawn master @a[tag=WrongAnswer] 800 65 1022 1 0.5 1
execute if entity @e[scores={Incorrect_P7A=250..400}] as @a[tag=WrongAnswer] at @s run teleport @s ^ ^ ^ facing 800 65 1022

effect give @e[tag=P7APigman] invisibility 3 255 true
effect give @e[tag=P7APigman] speed 3 2 true
effect give @e[tag=P7APigman] strength 3 20 true

execute if entity @e[scores={Incorrect_P7A=251}] run teleport @e[tag=P7APigman] 800 65 1014 0 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add P7A_End dummy
execute align x align y align z if entity @a[x=788,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove P7A_End
execute align x align y align z unless entity @a[x=788,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P7A_End 1

execute if entity @e[scores={P7A_End=25..}] run clear @a
execute if entity @e[scores={P7A_End=25..}] run scoreboard objectives remove Incorrect_P7A
execute if entity @e[scores={P7A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P7A_End=25..}] run scoreboard objectives remove P7A_End