####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2018 / AUGUST 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 985

fill 1139 67 901 1139 71 901 cobblestone_wall[west=false] replace cobblestone_wall[west=true]

#teleport @a 1144 68 913.0 180 0

#scoreboard objectives setdisplay sidebar Incorrect_G3D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] add WrongAnswer

scoreboard objectives add Incorrect_G3D dummy
execute align x align y align z if entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G3D 1

execute if entity @e[scores={Incorrect_G3D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G3D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G3D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G3D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G3D=1}] run title @a subtitle {"text":"Sunflowers do not face North", "color":"white"}
execute if entity @e[scores={Incorrect_G3D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Hey! Let's do it like we do in the Great White North!","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G3D=..10}] run kill @e[tag=G3DRacer]
execute if entity @e[scores={Incorrect_G3D=1}] run scoreboard objectives remove G3DBoat1
execute if entity @e[scores={Incorrect_G3D=1}] run scoreboard objectives remove G3DBoat2
execute if entity @e[scores={Incorrect_G3D=1}] run scoreboard objectives remove G3DBoat3
execute if entity @e[scores={Incorrect_G3D=100}] run scoreboard objectives add G3DBoat1 dummy
execute if entity @e[scores={Incorrect_G3D=105}] run scoreboard objectives add G3DBoat2 dummy
execute if entity @e[scores={Incorrect_G3D=110}] run scoreboard objectives add G3DBoat3 dummy

#scoreboard objectives setdisplay sidebar G3DBoat2

execute unless entity @e[scores={G3DFinish=0..}] run scoreboard players add @e[tag=MainTriviaAEC] G3DBoat1 1
execute if entity @e[tag=G3DBirchBoat] run scoreboard players reset @e[tag=MainTriviaAEC] G3DBoat1
execute unless entity @e[scores={G3DFinish=0..}] run scoreboard players add @e[tag=MainTriviaAEC] G3DBoat2 1
execute if entity @e[tag=G3DOakBoat] run scoreboard players reset @e[tag=MainTriviaAEC] G3DBoat2
execute unless entity @e[scores={G3DFinish=0..}] run scoreboard players add @e[tag=MainTriviaAEC] G3DBoat3 1
execute if entity @e[tag=G3DAcaciaBoat] run scoreboard players reset @e[tag=MainTriviaAEC] G3DBoat3


execute if entity @e[scores={G3DBoat1=0..29}] run kill @e[tag=G3DBirchAS]
execute if entity @e[scores={G3DBoat1=30..}] run summon armor_stand 1142 66.55 908.0 {Invisible:true, NoGravity:true, Tags:["G3DBirchAS","G3DAS","G3DRacer"], Passengers:[{id:"minecraft:boat", Type: "birch", Invulnerable: true, Rotation: [180f,0f], Tags: ["G3DBirchBoat","G3DBoat","G3DRacer","StartingBoat"]}],DisabledSlots:2039583}
execute if entity @e[scores={G3DBoat1=30..}] run execute at @e[tag=G3DBirchBoat] run playsound entity.item.pickup master @a ~ ~ ~

execute if entity @e[scores={G3DBoat2=0..29}] run kill @e[tag=G3DOakAS]
execute if entity @e[scores={G3DBoat2=30..}] run summon armor_stand 1144 66.55 908.0 {Invisible:true, NoGravity:true, Tags:["G3DOakAS","G3DAS","G3DRacer"], Passengers:[{id:"minecraft:boat", Type: "oak", Invulnerable: true, Rotation: [180f,0f], Tags: ["G3DOakBoat","G3DBoat","G3DRacer","StartingBoat"]}],DisabledSlots:2039583}
execute if entity @e[scores={G3DBoat2=30..}] run execute at @e[tag=G3DOakBoat] run playsound entity.item.pickup master @a ~ ~ ~

execute if entity @e[scores={G3DBoat3=0..29}] run kill @e[tag=G3DAcaciaAS]
execute if entity @e[scores={G3DBoat3=30..}] run summon armor_stand 1146 66.55 908.0 {Invisible:true, NoGravity:true, Tags:["G3DAcaciaAS","G3DAS","G3DRacer"], Passengers:[{id:"minecraft:boat", Type: "acacia", Invulnerable: true, Rotation: [180f,0f], Tags: ["G3DAcaciaBoat","G3DBoat","G3DRacer","StartingBoat"]}],DisabledSlots:2039583}
execute if entity @e[scores={G3DBoat3=30..}] run execute at @e[tag=G3DAcaciaBoat] run playsound entity.item.pickup master @a ~ ~ ~

execute unless entity @e[scores={G3DFinish=0..}] if entity @e[scores={G3DBoatTimer=93..}] unless entity @a[nbt={RootVehicle: {Entity: {Tags: ["G3DRacer"]}}}] run kill @e[tag=G3DBoat]

execute if entity @a[nbt={RootVehicle: {Entity: {Tags: ["G3DRacer"]}}}] run scoreboard objectives add G3DBoatTimer dummy
execute unless entity @a[nbt={RootVehicle: {Entity: {Tags: ["G3DRacer"]}}}] run scoreboard objectives add G3DBoatCheck dummy
execute if entity @a[nbt={RootVehicle: {Entity: {Tags: ["G3DRacer"]}}}] run scoreboard objectives remove G3DBoatCheck
scoreboard players add @e[tag=MainTriviaAEC] G3DBoatCheck 1
execute if entity @e[scores={G3DBoatCheck=3..}] run scoreboard objectives remove G3DBoatTimer


#scoreboard objectives setdisplay sidebar G3DBoatTimer
#scoreboard objectives setdisplay sidebar G3DMusic


# RACE MECHANIC
execute align x align y align z run tag @a[x=1141,y=68,z=906,dx=7,dy=8,dz=9] add StartingPoint
execute align x align y align z run tag @e[type=boat,x=1141,y=68,z=906,dx=7,dy=8,dz=9] add StartingBoat

scoreboard players add @e[tag=MainTriviaAEC] G3DBoatTimer 1

execute if entity @e[scores={G3DBoatTimer=105..}] run scoreboard objectives add G3DMusic dummy
execute if entity @e[scores={G3DFinish=0..}] run scoreboard objectives remove G3DMusic
execute unless entity @e[scores={G3DBoatTimer=0..}] run scoreboard objectives remove G3DMusic

scoreboard players add @e[tag=MainTriviaAEC] G3DMusic 0
scoreboard players set @e[scores={G3DMusic=20..}] G3DMusic 0
#execute if entity @e[scores={G3DMusic=0}] at @a[tag=WrongAnswer] run playsound block.note_block.hat master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[scores={G3DMusic=0}] at @a[tag=WrongAnswer] run playsound block.note_block.basedrum master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[scores={G3DMusic=5}] at @a[tag=WrongAnswer] run playsound block.note_block.hat master @a ~ ~ ~ 0.5 1 0.5
#execute if entity @e[scores={G3DMusic=10}] at @a[tag=WrongAnswer] run playsound block.note_block.hat master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[scores={G3DMusic=10}] at @a[tag=WrongAnswer] run playsound block.note_block.basedrum master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[scores={G3DMusic=10}] at @a[tag=WrongAnswer] run playsound block.note_block.snare master @a ~ ~ ~ 0.5 1 0.5
execute if entity @e[scores={G3DMusic=15}] at @a[tag=WrongAnswer] run playsound block.note_block.hat master @a ~ ~ ~ 0.5 1 0.5
scoreboard players add @e[tag=MainTriviaAEC] G3DMusic 1


execute unless entity @e[scores={G3DBoatTimer=0..}] if entity @e[tag=G3DStartingLight] run kill @e[tag=G3DStartingLight]
execute if entity @e[scores={G3DBoatTimer=30}] at @a[tag=StartingPoint] run playsound block.note_block.pling master @a ~ ~ ~ 0.5 0.59 0.5
execute if entity @e[scores={G3DBoatTimer=30}] run summon armor_stand 1144 73.7 902.0 {Small:true, NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:red_concrete", Count:1b}], Tags:["G3DStartingLight"]}
execute if entity @e[scores={G3DBoatTimer=50}] at @a[tag=StartingPoint] run playsound block.note_block.pling master @a ~ ~ ~ 0.5 0.59 0.5
execute if entity @e[scores={G3DBoatTimer=50}] run summon armor_stand 1144 73.1 902.0 {Small:true, NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:red_concrete", Count:1b}], Tags:["G3DStartingLight"]}
execute if entity @e[scores={G3DBoatTimer=70}] at @a[tag=StartingPoint] run playsound block.note_block.pling master @a ~ ~ ~ 0.5 0.59 0.5
execute if entity @e[scores={G3DBoatTimer=70}] run summon armor_stand 1144 72.5 902.0 {Small:true, NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:red_concrete", Count:1b}], Tags:["G3DStartingLight"]}

execute if entity @e[scores={G3DBoatTimer=93}] run kill @e[tag=G3DStartingLight]
execute if entity @e[scores={G3DBoatTimer=95}] at @a[tag=StartingPoint] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={G3DBoatTimer=95}] run summon armor_stand 1144 72.2 902.0 {NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:lime_concrete", Count:1b}] ,Tags:["G3DStartingLight"]}

execute if entity @e[scores={G3DBoatTimer=95}] run title @a times 1 40 1
execute if entity @e[scores={G3DBoatTimer=95}] run title @a[x=1141,y=68,z=907,dx=7,dy=8,dz=8] title {"text":"ROW!","bold":false,"color":"green"}

execute if entity @e[scores={G3DBoatTimer=93}] run kill @e[tag=G3DAS]
execute unless entity @e[scores={G3DFinish=0..}] unless entity @e[scores={G3DBoatTimer=95..}] run teleport @a[tag=!StartingPoint,x=1125,y=54,z=823,dx=24,dy=24,dz=96] 1144 68 913.0 180 0
execute unless entity @e[scores={G3DFinish=0..}] unless entity @e[scores={G3DBoatTimer=95..}] run kill @e[type=boat,tag=!StartingBoat]

execute unless entity @e[scores={G3DFinish=0..}] unless entity @e[scores={G3DBoatTimer=95..}] run execute as @a[tag=StartingPoint,x=1141,y=68,z=906,dx=7,dy=8,dz=0] at @s run teleport @s ~ ~ 907


tag @a remove StartingPoint
tag @e remove StartingBoat



# FOR THE WIN
execute align x align y align z run tag @e[tag=G3DBoat,x=1129,y=57,z=908,dx=7,dy=3,dz=8] add G3DFinishLine
execute if entity @e[tag=G3DFinishLine] run scoreboard objectives add G3DFinish dummy
execute unless entity @e[tag=G3DFinishLine] run scoreboard objectives remove G3DFinish
execute if entity @e[tag=G3DFinishLine] run scoreboard players add @e[tag=MainTriviaAEC] G3DFinish 1
#scoreboard objectives setdisplay sidebar G3DFinish

execute if entity @e[scores={G3DFinish=5}] at @e[tag=G3DFinishLine] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={G3DFinish=8}] at @e[tag=G3DFinishLine] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={G3DFinish=11}] at @e[tag=G3DFinishLine] run playsound block.note_block.pling master @a ~ ~ ~ 2 1.2 1
execute if entity @e[scores={G3DFinish=25}] at @e[tag=G3DFinishLine] run playsound entity.villager.yes master @a ~ ~ ~ 2 1 1

execute if entity @e[scores={G3DFinish=40..}] run teleport @a[tag=WrongAnswer] 1029 67 1000 180 0




# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives add G3D_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3D_End
execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G3D_End 1

execute if entity @e[scores={G3D_End=25..}] run kill @e[tag=G3DRacer]
execute if entity @e[scores={G3D_End=25..}] run kill @e[tag=G3DStartingLight]
execute if entity @e[scores={G3D_End=25..}] run clear @a
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoat1
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoat2
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoat3
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoat4
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoatCheck
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DBoatTimer
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DMusic
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3DFinish
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove Incorrect_G3D
execute if entity @e[scores={G3D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G3D_End=25..}] run scoreboard objectives remove G3D_End


#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run tag @a remove WrongAnswer
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run tag @a remove WrongAnswer
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run kill @e[tag=G3DRacer]
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run kill @e[tag=G3DStartingLight]
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DBoat1
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DBoat2
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DBoat3
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DBoatCheck
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DBoatTimer
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DMusic
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove G3DFinish
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run scoreboard objectives remove Incorrect_G3D
#clear @a[tag=!WrongAnswer]
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run clear @a
#execute align x align y align z unless entity @a[x=1125,y=54,z=823,dx=24,dy=24,dz=96] run setblock 43 13 46 clay