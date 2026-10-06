####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019 / AUGUST 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar TriviaAccess

# TRIVIA ACCESS -> CABLE CAR
execute if entity @e[tag=Phantom] run scoreboard players set @e[tag=MainHubAEC,scores={TriviaAccess=0}] TriviaAccess 1
#execute if block -24 86 986 hopper{Items:[{}]} unless entity @e[tag=Phantom] run playsound entity.phantom.ambient master @a -24 78 988 2 1 1
#execute if block -24 86 986 hopper{Items:[{}]} if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run summon armor_stand -22 75 988 {Rotation:[90f,0f],NoGravity:true,Marker:true,Invisible:true,Passengers:[{id:"minecraft:boat",Invulnerable:false,Rotation:[90f,0f],Tags:["PhantomOakBoat","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:phantom",Invulnerable:true,NoAI:true,Rotation:[90f,0f],Tags:["Phantom","PhantomBoat"]}]}]}]}]}],Tags:["MainPhantomBoatAS","PhantomBlock","PhantomBoat"]}

execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] as @e[tag=TriviaBoneFrame,nbt=!{Invulnerable:1b}] run playsound entity.item_frame.add_item block @a -24 87 986 1 1 0
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] as @e[tag=TriviaBoneFrame,nbt=!{Invulnerable:1b}] run data merge entity @s {Invulnerable:1b,Silent:1b}
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] unless entity @e[tag=Phantom] run playsound entity.phantom.ambient master @a -24 78 988 4 1 1
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] unless entity @e[tag=Phantom] run summon armor_stand -22 75 988 {Rotation:[90f,0f],NoGravity:true,Marker:true,Invisible:true,Passengers:[{id:"minecraft:boat",Invulnerable:false,Rotation:[90f,0f],Tags:["PhantomOakBoat","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:iron_bars"},Time:-2147483648,Tags:["PhantomBlock","PhantomBoat"],Passengers:[{id:"minecraft:phantom",Invulnerable:true,NoAI:true,Rotation:[90f,0f],Tags:["Phantom","PhantomBoat"]}]}]}]}]}],Tags:["MainPhantomBoatAS","PhantomBlock","PhantomBoat"]}
execute if entity @e[tag=Phantom] run scoreboard players set @e[tag=MainHubAEC,scores={TriviaAccess=0}] TriviaAccess 1
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run kill @e[tag=PhantomBlock]
execute if entity @e[tag=MainHubAEC,scores={TriviaAccess=0}] run scoreboard objectives remove TriviaAccess

execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.0 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.1 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.2 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.3 air
execute if block -24 86 986 hopper{Items:[{}]} run replaceitem block -24 86 986 container.4 air

scoreboard players set @e[tag=Phantom,x=-22,y=74,z=988,dx=0,dy=4,dz=0] TriviaAccess 1
execute if entity @e[tag=Phantom,scores={TriviaAccess=1}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ~-0.2 ~ ~ ~ 0

scoreboard players set @e[tag=Phantom,x=-30,y=74,z=988,dx=0,dy=4,dz=0] TriviaAccess 2
execute if entity @e[tag=Phantom,scores={TriviaAccess=2}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ~ ~0.1 ~ ~ 0

scoreboard players set @e[tag=Phantom,x=-31,y=91,z=987,dx=2,dy=1,dz=2,scores={TriviaAccess=2}] TriviaAccess 3
scoreboard players add @e[tag=Phantom,scores={TriviaAccess=3..49}] TriviaAccess 1

execute if entity @e[tag=Phantom,scores={TriviaAccess=50}] as @e[tag=MainPhantomBoatAS] at @s run teleport @s ^ ^ ^0.2 facing -54 105 970
execute if entity @e[tag=Phantom,scores={TriviaAccess=50}] as @e[tag=PhantomBoat] at @s run teleport @s ^ ^ ^ facing -54 105 970

scoreboard players set @e[tag=Phantom,x=-54,y=100,z=970,dx=3,dy=8,dz=3] TriviaAccess 51
execute if entity @e[tag=Phantom,scores={TriviaAccess=51}] run kill @e[tag=PhantomBlock]
execute if entity @e[tag=Phantom,scores={TriviaAccess=51}] run tag @e remove PhantomBoat
execute as @e[tag=Phantom,scores={TriviaAccess=51}] at @s run teleport @s ^ ^ ^0.2 facing -64 105 982

scoreboard players set @e[tag=Phantom,x=-65,y=104,z=981,dx=2,dy=2,dz=2] TriviaAccess 52
execute as @e[tag=Phantom,scores={TriviaAccess=52}] at @s run teleport @s ^ ^ ^0.3 facing -69 100 994

scoreboard players set @e[tag=Phantom,x=-70,y=99,z=993,dx=2,dy=2,dz=2] TriviaAccess 53
execute as @e[tag=Phantom,scores={TriviaAccess=53}] at @s run teleport @s ^ ^ ^0.4 facing -58 93 1008

scoreboard players set @e[tag=Phantom,x=-59,y=92,z=1007,dx=2,dy=2,dz=2] TriviaAccess 54
execute as @e[tag=Phantom,scores={TriviaAccess=54}] at @s run teleport @s ^ ^ ^0.6 facing -20 59 1008

scoreboard players set @e[tag=Phantom,x=-21,y=58,z=1007,dx=2,dy=2,dz=2] TriviaAccess 55
execute as @e[tag=Phantom,scores={TriviaAccess=55}] at @s run teleport @s ^ ^ ^0.6 facing -2 59 1008


execute as @e[tag=Phantom,x=-13,y=58,z=1007,dx=2,dy=2,dz=2] run data merge entity @s {Silent:true}
execute if entity @e[tag=Phantom,x=-2,y=58,z=1007,dx=2,dy=2,dz=2] run scoreboard objectives remove TriviaAccess
kill @e[tag=Phantom,x=-2,y=58,z=1007,dx=2,dy=2,dz=2]

execute as @e[tag=PhantomOakBoat,type=boat] at @s if block ~-1 ~ ~ water run data merge entity @s {Motion:[0.2d,0.0d,0.1d]}
execute as @e[tag=PhantomOakBoat,type=boat] at @s if block ~ ~ ~-1 water run data merge entity @s {Motion:[0.2d,0.0d,0.1d]}