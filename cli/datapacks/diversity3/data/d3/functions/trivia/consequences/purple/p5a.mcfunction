####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 4 2018 / APRIL 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 958 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P5A
scoreboard objectives setdisplay sidebar P5AGyroTimer

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=26,z=1007,dx=24,dy=52,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P5A dummy
execute align x align y align z if entity @a[x=818,y=26,z=1007,dx=24,dy=52,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P5A 1

execute if entity @e[scores={Incorrect_P5A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P5A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P5A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P5A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P5A=1}] run title @a subtitle {"text":"Faithful wasn't created by Glimmar", "color":"white"}
execute if entity @e[scores={Incorrect_P5A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Glimmar's Steampunk Resource Pack was first released in October 2010 and has even been updated for 1.13. That makes it one of the longest supported Texture Packs in Minecraft history. Way to go Glimmar! Now ride the little steam punks and press the button up top to leave.","color":"red"}]


tag @a remove P5AGyro
execute align x align y align z run tag @a[x=831,y=29,z=1020,dx=0,dy=7,dz=0] add P5AGyro
execute align x align y align z run tag @a[x=827,y=37,z=1018,dx=0,dy=9,dz=0] add P5AGyro
execute align x align y align z run tag @a[x=834,y=45,z=1020,dx=0,dy=7,dz=0] add P5AGyro
execute align x align y align z run tag @a[x=830,y=53,z=1023,dx=0,dy=7,dz=0] add P5AGyro
execute align x align y align z run tag @a[x=828,y=61,z=1018,dx=0,dy=7,dz=0] add P5AGyro
execute align x align y align z run tag @a[x=832,y=69,z=1020,dx=0,dy=2,dz=0] add P5AGyro


effect give @a[tag=WrongAnswer] night_vision 12 255 true
effect give @a[tag=WrongAnswer] resistance 2 255 true
effect give @a[tag=P5AGyro] levitation 1 1 true
effect clear @a[tag=!WrongAnswer] night_vision
effect clear @a[tag=!WrongAnswer] levitation


execute if entity @e[scores={Incorrect_P5A=1}] run kill @e[tag=P5AMob]
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 831 28.69 1020 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 827 36.69 1018 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 834 44.69 1020 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 830 52.69 1023 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 828 60.69 1018 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}
execute if entity @e[scores={Incorrect_P5A=1}] run summon husk 832 68.69 1020 {IsBaby:true,Silent:true,Invulnerable:true,NoAI:true,Tags:["P5AMob"]}


execute as @e[tag=P5AMob] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]

execute at @e[tag=P5AMob] run particle cloud ~ ~2 ~ 0 0.3 0 0 1 force
execute at @e[tag=P5AMob] run particle cloud ~ ~5 ~ 0 1.5 0 0 1 force



execute if block 830 76 1019 stone_button[powered=true] run kill @e[tag=P5AMob]
execute if entity @e[scores={Incorrect_P5A=80..}] if block 830 76 1019 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 958 67 1000 0 0







# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=26,z=1007,dx=24,dy=52,dz=24] run scoreboard objectives add P5A_End dummy
execute align x align y align z if entity @a[x=818,y=26,z=1007,dx=24,dy=52,dz=24] run scoreboard objectives remove P5A_End
execute align x align y align z unless entity @a[x=818,y=26,z=1007,dx=24,dy=52,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P5A_End 1

execute if entity @e[scores={P5A_End=25..}] run clear @a
execute if entity @e[scores={P5A_End=25..}] run scoreboard objectives remove Incorrect_P5A
execute if entity @e[scores={P5A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P5A_End=25..}] run scoreboard objectives remove P5A_End