####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 23 2018 / SEPTEMBER 23 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1016 73 985

#scoreboard objectives setdisplay sidebar Incorrect_G1B
#scoreboard objectives setdisplay sidebar G1B_End

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=18,z=939,dx=24,dy=86,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G1B dummy
execute align x align y align z if entity @a[x=1095,y=46,z=939,dx=24,dy=86,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G1B 1

execute if entity @e[scores={Incorrect_G1B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G1B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G1B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G1B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G1B=1}] run title @a subtitle {"text":"Cake is in Minecraft. That is not a lie.", "color":"white"}
execute if entity @e[scores={Incorrect_G1B=95}] run tellraw @a ["",{"text":" [X] INCORRECT: Of course there is cake. Now shoot it down and have a snack!","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_G1B=1}] run fill 1100 55 945 1113 55 958 air

execute if entity @e[scores={Incorrect_G1B=1}] run team add G1BTeam

execute if entity @e[scores={Incorrect_G1B=..5}] as @e[tag=G1BMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G1B=3..5}] run kill @e[tag=G1BMob]


#execute if entity @e[scores={Incorrect_G1B=10}] run summon slime 1109 67 949 {Size:3,NoAI:true,Team:G1BTeam,NoGravity:true,Silent:true,Tags:["G1BMob","G1BCube"],Passengers:[{id:"minecraft:falling_block",Invulnerable:false,BlockState:{Name:"minecraft:cake"},Time:-2147483648,Tags:["G1BMob","G1BCakeBlock"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:true,Tags:["G1BAS"]}]}]}

execute if entity @e[scores={Incorrect_G1B=10}] run summon slime 1109 67 949 {Size:3,NoAI:true,Team:G1BTeam,NoGravity:true,Silent:true,Tags:["G1BMob","G1BCube"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:true,Tags:["G1BKillStand","G1BAS"],Passengers:[{id:"minecraft:falling_block",Invulnerable:false,BlockState:{Name:"minecraft:cake"},Time:-2147483648,Tags:["G1BMob","G1BCakeBlock"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:true,Tags:["G1BAS"]}]}]}]}


execute align x align y align z if entity @e[tag=G1BMob,x=1101,y=66,z=946,dx=11,dy=3,dz=0] as @e[tag=G1BBat] run data merge entity @s {Motion:[0.0d,0.0d,1.0d],Rotation:[0f,0f]}
execute align x align y align z if entity @e[tag=G1BMob,x=1101,y=66,z=946,dx=0,dy=3,dz=11] as @e[tag=G1BBat] run data merge entity @s {Motion:[1.0d,0.0d,0.0d],Rotation:[270f,0f]}
execute align x align y align z if entity @e[tag=G1BMob,x=1101,y=66,z=957,dx=11,dy=3,dz=0] as @e[tag=G1BBat] run data merge entity @s {Motion:[0.0d,0.0d,-1.0d],Rotation:[180f,0f]}
execute align x align y align z if entity @e[tag=G1BMob,x=1112,y=66,z=946,dx=11,dy=3,dz=0] as @e[tag=G1BBat] run data merge entity @s {Motion:[-1.0d,0.0d,0.0d],Rotation:[90f,0f]}

execute if entity @e[scores={Incorrect_G1B=12..}] if entity @e[tag=G1BCube,nbt={HurtTime:10s}] run kill @e[tag=G1BKillStand]
execute if entity @e[scores={Incorrect_G1B=12..}] unless entity @e[tag=G1BKillStand] as @e[tag=G1BCube] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_G1B=12..}] if entity @e[tag=G1BKillStand] run effect give @a saturation 1 255 true
execute if entity @e[scores={Incorrect_G1B=12..}] unless entity @e[tag=G1BKillStand] run effect give @a hunger 1 255 true


execute if entity @e[tag=G1BKillStand] as @e[tag=G1BCube] at @s run teleport @s ~ 67 ~
execute if entity @e[tag=G1BKillStand] as @e[tag=G1BCube] at @s run teleport @s ^0.6 ^ ^0.1 facing 1107.0 67 952.0

effect give @e[tag=G1BMob] invisibility 255 255 true

execute if entity @e[scores={Incorrect_G1B=100}] run give @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:bow"}]}] bow{Unbreakable:true,HideFlags:4,Enchantments:[{id:"minecraft:infinity",lvl:1}]}
execute if entity @e[scores={Incorrect_G1B=100}] run give @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:arrow"}]}] arrow

scoreboard players set @e[scores={Incorrect_G1B=150..}] Incorrect_G1B 99

kill @e[type=arrow,nbt={inGround:1b}]

execute at @e[tag=G1BAS] if block ~ ~-1 ~ cake[bites=6] run teleport @a[tag=WrongAnswer] 1016 67 1000 180 0
execute if block 1107 55 952 cake[bites=6] run teleport @a[tag=WrongAnswer] 1016 67 1000 180 0
execute at @e[tag=G1BAS] if block ~ ~ ~ cake[bites=6] run teleport @a[tag=WrongAnswer] 1016 67 1000 180 0

teleport @e[x=1096,y=47,z=940,dx=24,dy=5,dz=24] 1107.0 55 952.0 0 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=46,z=939,dx=24,dy=86,dz=24] run scoreboard objectives add G1B_End dummy
execute align x align y align z if entity @a[x=1095,y=46,z=939,dx=24,dy=86,dz=24] run scoreboard objectives remove G1B_End
execute align x align y align z unless entity @a[x=1095,y=46,z=939,dx=24,dy=86,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G1B_End 1

execute if entity @e[scores={G1B_End=25..}] run team remove G1BTeam
execute if entity @e[scores={G1B_End=25..}] run kill @e[tag=G1BMob]
execute if entity @e[scores={G1B_End=25..}] run kill @e[tag=G1BAS]
execute if entity @e[scores={G1B_End=25..}] run clear @a
execute if entity @e[scores={G1B_End=25..}] run scoreboard objectives remove Incorrect_G1B
execute if entity @e[scores={G1B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G1B_End=25..}] run scoreboard objectives remove G1B_End