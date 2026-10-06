####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 31 2018 / APRIL 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1049 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G6D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G6D dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G6D 1

execute if entity @e[scores={Incorrect_G6D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G6D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G6D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G6D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G6D=1}] run title @a subtitle {"text":"Glowstone Dust is used for Twinkle fireworks", "color":"white"}
execute if entity @e[scores={Incorrect_G6D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Better chase down all that glowstone dust.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G6D=0..5}] run kill @e[tag=G6DOcelot]
execute if entity @e[scores={Incorrect_G6D=0..5}] run kill @e[tag=G6DGlowstone]

effect give @e[tag=G6DOcelot] invisibility 100 255 true
effect give @e[tag=G6DOcelot] speed 100 3 true

execute if entity @e[scores={Incorrect_G6D=100}] run summon ocelot 1167 56 1079 {Rotation:[180f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot1","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone1","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=105}] run summon ocelot 1167 56 1079 {Rotation:[135f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot2","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone2","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=110}] run summon ocelot 1167 56 1079 {Rotation:[225f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot3","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone3","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=115}] run summon ocelot 1167 56 1079 {Rotation:[315f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot4","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone4","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=120}] run summon ocelot 1167 56 1079 {Rotation:[45f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot5","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone5","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=125}] run summon ocelot 1167 56 1079 {Rotation:[180f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot6","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone6","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=130}] run summon ocelot 1167 56 1079 {Rotation:[135f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot7","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone7","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=135}] run summon ocelot 1167 56 1079 {Rotation:[225f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot8","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone8","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=140}] run summon ocelot 1167 56 1079 {Rotation:[315f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot9","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone9","G6DGlowstone"]}]}
execute if entity @e[scores={Incorrect_G6D=145}] run summon ocelot 1167 56 1079 {Rotation:[45f,0f],Invulnerable:true,Silent:true,Motion:[0.0d,0.7d,0.0d],Tags:["G6DOcelot10","G6DOcelot"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:glowstone_dust",Count:1b},Age:-32768,PickupDelay:60,Tags:["G6DGlowstone10","G6DGlowstone"]}]}



execute if entity @e[scores={Incorrect_G6D=100}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=105}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=110}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=115}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=120}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=125}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=130}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=135}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=140}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0
execute if entity @e[scores={Incorrect_G6D=145}] run playsound entity.item.pickup master @a 1167 56 1079 1 1 0


execute if entity @e[scores={Incorrect_G6D=100..}] unless entity @e[tag=G6DGlowstone1] as @e[tag=G6DOcelot1] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=105..}] unless entity @e[tag=G6DGlowstone2] as @e[tag=G6DOcelot2] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=110..}] unless entity @e[tag=G6DGlowstone3] as @e[tag=G6DOcelot3] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=115..}] unless entity @e[tag=G6DGlowstone4] as @e[tag=G6DOcelot4] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=120..}] unless entity @e[tag=G6DGlowstone5] as @e[tag=G6DOcelot5] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=125..}] unless entity @e[tag=G6DGlowstone6] as @e[tag=G6DOcelot6] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=130..}] unless entity @e[tag=G6DGlowstone7] as @e[tag=G6DOcelot7] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=135..}] unless entity @e[tag=G6DGlowstone8] as @e[tag=G6DOcelot8] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=140..}] unless entity @e[tag=G6DGlowstone9] as @e[tag=G6DOcelot9] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G6D=145..}] unless entity @e[tag=G6DGlowstone10] as @e[tag=G6DOcelot10] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_G6D=120..}] unless entity @e[tag=G6DOcelot] run teleport @a[tag=WrongAnswer] 1049 67 1000 0 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add G6D_End dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove G6D_End
execute align x align y align z unless entity @a[x=1155,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G6D_End 1

execute if entity @e[scores={G6D_End=25..}] run clear @a
execute if entity @e[scores={G6D_End=25..}] run scoreboard objectives remove Incorrect_G6D
execute if entity @e[scores={G6D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G6D_End=25..}] run scoreboard objectives remove G6D_End