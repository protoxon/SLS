####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 17 2018 / JULY 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 71 1069

difficulty hard

#scoreboard objectives setdisplay sidebar Incorrect_R9D
#scoreboard objectives setdisplay sidebar R9DBadFan

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1067,y=54,z=1229,dx=30,dy=24,dz=39] add WrongAnswer

scoreboard objectives add Incorrect_R9D dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1229,dx=30,dy=24,dz=39] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R9D 1

execute if entity @e[scores={Incorrect_R9D=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_R9D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R9D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R9D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R9D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R9D=1}] run title @a subtitle {"text":"Resource Packs do not use .wav files", "color":"white"}
execute if entity @e[scores={Incorrect_R9D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: But go ahead, Celebrity.","color":"red","bold":false},{"text":" Wave ","color":"red","italic":true},{"text":"to all your endearing fans!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R9D=1}] run scoreboard objectives remove R9DBadFan
execute if entity @e[scores={Incorrect_R9D=1}] run kill @e[tag=R9DFrame]
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1073 63 1262 {Invulnerable:true,Facing:5b,Item:{id:"minecraft:yellow_glazed_terracotta",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1073 63 1261 {Invulnerable:true,Facing:5b,Item:{id:"minecraft:yellow_glazed_terracotta",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1084 63 1262 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:yellow_glazed_terracotta",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1084 63 1261 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:yellow_glazed_terracotta",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}

execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1086 57 1246 {Invulnerable:true,Facing:5b,Item:{id:"minecraft:yellow_concrete",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1086 57 1249 {Invulnerable:true,Facing:5b,Item:{id:"minecraft:yellow_concrete",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1071 57 1246 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:red_concrete",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}
execute if entity @e[scores={Incorrect_R9D=1}] run summon item_frame 1071 57 1249 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:red_concrete",Count:1b},ItemRotation:3b,Tags:["R9DFrame"]}


execute if entity @e[scores={Incorrect_R9D=1}] run setblock 1076 57 1262 birch_fence[north=true,south=true]

execute if entity @e[scores={Incorrect_R9D=1}] run team add R9D
execute if entity @e[scores={Incorrect_R9D=1}] as @e[tag=R9DMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R9D=1}] as @e[tag=R9DMob] run data merge entity @s {NoAI:false,Silent:true}
execute if entity @e[scores={Incorrect_R9D=9}] run kill @e[tag=R9DMob]

execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1256 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1257 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1258 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1259 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1260 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1261 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1262 {NoAI:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:swamp",level:6},Silent:true,Invulnerable:true,Rotation:[270f,25f],Team:R9D,Tags:["R9DVillager","R9DBadFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1076.0 57 1263 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[270f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}

execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1256 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1257 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1258 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1259 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1260 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1261 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1262 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}
execute if entity @e[scores={Incorrect_R9D=10}] run summon villager 1082.0 57 1263 {NoAI:true,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Offers:{},Invulnerable:true,Rotation:[90f,0f],Team:R9D,Tags:["R9DVillager","R9DFan","R9DMob"]}

execute if entity @e[scores={Incorrect_R9D=10}] run summon vindicator 1076.0 57 1262 {CustomName:"{\"text\":\"Obsessive Fan\",\"color\":\"white\"}",NoAI:true,Silent:true,Invulnerable:true,Rotation:[270f,25f],Team:R9D,Tags:["R9DIllager","R9DMob"]}
 
execute as @e[tag=R9DFan] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]

execute as @e[tag=R9DIllager] at @s run teleport @e[tag=R9DBadFan] ~ ~ ~ ~ ~
effect give @e[tag=R9DIllager] strength 4 4 true
effect give @e[tag=R9DIllager] speed 4 4 true

execute align x align y align z if entity @a[x=1077,y=57,z=1262,dx=2,dy=1,dz=0] run scoreboard objectives add R9DBadFan dummy
scoreboard players add @e[tag=MainTriviaAEC] R9DBadFan 1

execute if entity @e[scores={R9DBadFan=10}] at @e[tag=R9DIllager] run playsound entity.vindicator.ambient master @a
execute if entity @e[scores={R9DBadFan=50}] at @e[tag=R9DIllager] run playsound entity.vindicator.ambient master @a
execute if entity @e[scores={R9DBadFan=100}] at @e[tag=R9DIllager] run playsound entity.vindicator.ambient master @a

execute if entity @e[scores={R9DBadFan=160}] as @e[tag=R9DIllager] at @s run teleport @s ~ ~ ~ ~ 0
execute if entity @e[scores={R9DBadFan=170}] at @e[tag=R9DIllager] run playsound entity.vindicator.ambient master @a
execute if entity @e[scores={R9DBadFan=200}] run playsound entity.zombie.break_wooden_door master @a 1076 57 1262 0.5 1 0.1
execute if entity @e[scores={R9DBadFan=200}] run setblock 1076 57 1262 air destroy
execute if entity @e[scores={R9DBadFan=200}] as @e[tag=R9DIllager] run data merge entity @s {NoAI:false,Motion:[0.5d,0.1d,0.0d]}
execute if entity @e[scores={R9DBadFan=200}] as @e[tag=R9DFan] run data merge entity @s {NoAI:false}
execute if entity @e[scores={R9DBadFan=200}] run tag @e[tag=R9DFan] remove R9DFan


effect give @e[tag=R9DIllager] invisibility 11 255 true

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1067,y=54,z=1229,dx=30,dy=24,dz=39] run scoreboard objectives add R9D_End dummy
execute align x align y align z if entity @a[x=1067,y=54,z=1229,dx=30,dy=24,dz=39] run scoreboard objectives remove R9D_End
execute align x align y align z unless entity @a[x=1067,y=54,z=1229,dx=30,dy=24,dz=39] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R9D_End 1

execute if entity @e[scores={R9D_End=25..}] run clear @a
execute if entity @e[scores={R9D_End=25..}] run kill @e[tag=R9DMob]
execute if entity @e[scores={R9D_End=25..}] run scoreboard objectives remove R9DBadFan
execute if entity @e[scores={R9D_End=25..}] run scoreboard objectives remove Incorrect_R9D
execute if entity @e[scores={R9D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R9D_End=25..}] run scoreboard objectives remove R9D_End