####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 15 2018 / FEBRUARY 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 72 1055

#scoreboard objectives setdisplay sidebar Incorrect_R7B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1007,y=54,z=1199,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R7B dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R7B 1

execute if entity @e[scores={Incorrect_R7B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R7B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R7B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R7B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R7B=1}] run title @a subtitle {"text":"The ! symbol isn't used for that", "color":"white"}
execute if entity @e[scores={Incorrect_R7B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: ! is a special character used with commands, but not for summoning multiple mobs. Just ask these guys.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R7B=1}] as @e[tag=R7BMob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_R7B=1}] as @e[tag=R7BMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R7B=1}] run setblock 1027 56 1215 air
execute if entity @e[scores={Incorrect_R7B=10}] run kill @e[tag=R7BMob]


execute if entity @e[scores={Incorrect_R7B=120}] run playsound entity.item.pickup master @a 1017 56 1216 1 1 1
execute if entity @e[scores={Incorrect_R7B=120}] run summon zombie_pigman 1017 56 1216 {NoAI:true,Silent:true,HandItems:[{id:"golden_sword",Count:1b}],Anger:1b,Rotation:[204f,0f],Tags:["R7BMob","R7BZombiePigman"]}

execute if entity @e[scores={Incorrect_R7B=125}] run playsound entity.item.pickup master @a 1014 56 1213 1 1 1
execute if entity @e[scores={Incorrect_R7B=125}] run summon wither_skeleton 1014 56 1213 {NoAI:true,Silent:true,HandItems:[{id:"stone_sword",Count:1b}],Rotation:[246f,0f],Tags:["R7BMob","R7BWitherSkeleton"]}

execute if entity @e[scores={Incorrect_R7B=130}] run playsound entity.item.pickup master @a 1014 56 1208 1 1 1
execute if entity @e[scores={Incorrect_R7B=130}] run summon guardian 1014 56 1208 {NoAI:true,Silent:true,Rotation:[296f,0f],Tags:["R7BMob","R7BGuardian"]}

execute if entity @e[scores={Incorrect_R7B=135}] run playsound entity.item.pickup master @a 1017 56 1205 1 1 1
execute if entity @e[scores={Incorrect_R7B=135}] run summon shulker 1017 56 1205 {NoAI:true,Silent:true,Color:16b,Peek:40b,Rotation:[0f,0f],Tags:["R7BMob","R7BShulker"]}

execute if entity @e[scores={Incorrect_R7B=140}] run playsound entity.item.pickup master @a 1022 56 1205 1 1 1
execute if entity @e[scores={Incorrect_R7B=140}] run summon enderman 1022 56 1205 {NoAI:true,Silent:true,Rotation:[25f,0f],Tags:["R7BMob","R7BEnderman"]}

execute if entity @e[scores={Incorrect_R7B=145}] run playsound entity.item.pickup master @a 1025 56 1208 1 1 1
execute if entity @e[scores={Incorrect_R7B=145}] run summon creeper 1025 56 1208 {NoAI:true,Silent:true,Rotation:[66f,0f],Tags:["R7BMob","R7BCreeper"]}


execute if entity @e[scores={Incorrect_R7B=150}] run setblock 1027 56 1215 spawner{MaxNearbyEntities: 0s, RequiredPlayerRange: 0s, SpawnCount: 0s, SpawnData: {id: "minecraft:spider"}, MaxSpawnDelay: 80000s, Delay: 0s, id: "minecraft:mob_spawner", SpawnRange: 0s, MinSpawnDelay: 20000s, SpawnPotentials: [{Entity: {id: "minecraft:spider"}, Weight: 1}]}

execute if entity @e[scores={Incorrect_R7B=150}] run playsound entity.item.pickup master @a 1025 56 1213 1 1 1
execute if entity @e[scores={Incorrect_R7B=150}] run summon spider 1025 56 1213 {NoAI:true,Silent:true,Rotation:[115f,0f],Tags:["R7BMob","R7BSpider"]}

execute if entity @e[scores={Incorrect_R7B=155}] run playsound entity.item.pickup master @a 1022 56 1216 1 1 1
execute if entity @e[scores={Incorrect_R7B=155}] run summon witch 1022 56 1216 {NoAI:true,Silent:true,Rotation:[156f,0f],Tags:["R7BMob","R7BWitch"]}


execute align x align y align z unless entity @e[tag=R7BShulker,x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run teleport @e[tag=R7BShulker] 1017 56 1205 0 0
execute align x align y align z unless entity @e[tag=R7BEnderman,x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run teleport @e[tag=R7BEnderman] 1022 56 1205 25 0

effect give @e[tag=R7BMob] resistance 2 255 true

execute if entity @e[tag=R7BMob,nbt={HurtTime:10s}] as @e[tag=R7BMob] run data merge entity @s {Silent:false,NoAI:false}









# END SAFEGUARD
execute align x align y align z unless entity @a[x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives add R7B_End dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives remove R7B_End
execute align x align y align z unless entity @a[x=1007,y=54,z=1199,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R7B_End 1

execute if entity @e[scores={R7B_End=25..}] run clear @a
execute if entity @e[scores={R7B_End=25..}] run kill @e[tag=R7BMob]
execute if entity @e[scores={R7B_End=25..}] run scoreboard objectives remove Incorrect_R7B
execute if entity @e[scores={R7B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R7B_End=25..}] run scoreboard objectives remove R7B_End