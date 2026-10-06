####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 17 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1018 71 1069

#scoreboard objectives setdisplay sidebar Incorrect_R10C
#scoreboard objectives setdisplay sidebar R10CWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=930,y=54,z=1229,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R10C dummy
execute align x align y align z if entity @a[x=930,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R10C 1

execute if entity @e[scores={Incorrect_R10C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R10C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R10C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R10C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R10C=1}] run title @a subtitle {"text":"/scoreboard doesn't use insertion", "color":"white"}
execute if entity @e[scores={Incorrect_R10C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now slam dunk that thing before the time runs out!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R10C=1}] run fill 934 61 1240 934 62 1241 glass
execute if entity @e[scores={Incorrect_R10C=1}] run setblock 935 60 1240 iron_bars[east=true,west=true,south=true]
execute if entity @e[scores={Incorrect_R10C=1}] run setblock 935 60 1241 iron_bars[east=true,west=true,north=true]
execute if entity @e[scores={Incorrect_R10C=1}] run fill 946 63 1250 948 63 1250 air
execute if entity @e[scores={Incorrect_R10C=1}] run setblock 947 63 1250 black_wall_banner[facing=north]{Patterns: [{Pattern: "ls", Color: 14}, {Pattern: "ls", Color: 14}, {Pattern: "hhb", Color: 15}, {Pattern: "hhb", Color: 15}, {Pattern: "rs", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "ms", Color: 14}, {Pattern: "ms", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "ts", Color: 14}]}
execute if entity @e[scores={Incorrect_R10C=1}] run setblock 946 63 1250 black_wall_banner[facing=north]{Patterns: [{Pattern: "ts", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "ls", Color: 14}, {Pattern: "ls", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "ms", Color: 14}, {Pattern: "ms", Color: 14}, {Pattern: "bs", Color: 14}, {Pattern: "bs", Color: 14}]}
execute if entity @e[scores={Incorrect_R10C=1}] run fill 935 67 1251 936 70 1251 black_concrete

execute if entity @e[scores={Incorrect_R10C=80}] run give @p[tag=WrongAnswer] pumpkin{display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"Basketball\"}"}}

execute if entity @e[scores={Incorrect_R10C=1}] as @e[tag=R10CMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R10C=1}] run summon zombie 937 56 1235 {Rotation:[270f,0f],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.7},{Name:"generic.attackDamage",Base:0.0}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b}],Tags:["R10CMob"]}

execute if entity @e[scores={Incorrect_R10C=1}] run summon zombie 937 56 1245 {Rotation:[270f,0f],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.7},{Name:"generic.attackDamage",Base:0.0}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b}],Tags:["R10CMob"]}

execute if entity @e[scores={Incorrect_R10C=1}] run summon zombie 949 56 1247 {Rotation:[180f,0f],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.7},{Name:"generic.attackDamage",Base:0.0}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b}],Tags:["R10CMob"]}

execute if entity @e[scores={Incorrect_R10C=1}] run summon zombie 945 56 1243 {Rotation:[180f,0f],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.7},{Name:"generic.attackDamage",Base:0.0}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b}],Tags:["R10CMob"]}

execute if entity @e[scores={Incorrect_R10C=1}] run summon zombie 943 56 1232 {Rotation:[270f,0f],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.7},{Name:"generic.attackDamage",Base:0.0}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b}],Tags:["R10CMob"]}

execute if entity @e[scores={Incorrect_R10C=1}] run kill @e[type=item,x=930,y=54,z=1229,dx=24,dy=24,dz=24]


effect give @a[tag=WrongAnswer] slowness 1 3 true
effect give @a[tag=WrongAnswer] slow_falling 1 3 true
effect give @e[tag=R10CMob] slowness 1 5 true
effect give @e[tag=R10CMob] weakness 1 255 true



execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ orange_concrete run effect give @s jump_boost 1 3 true
execute unless entity @e[tag=R10CTopAEC1] run summon area_effect_cloud 936.0 61.0 1241.0 {Tags:["R10CTopAEC1","R10CTopAEC"],Duration:200}
execute unless entity @e[tag=R10CTopAEC2] run summon area_effect_cloud 935.5 61.0 1241.0 {Tags:["R10CTopAEC2","R10CTopAEC"],Duration:200}
execute unless entity @e[tag=R10CBottomAEC] run summon area_effect_cloud 936.0 59.8 1241.0 {Tags:["R10CBottomAEC"],Duration:200}

execute align x align y align z run tag @e[type=item,x=930,y=54,z=1229,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:pumpkin"}}] add R10CBasketball
execute if entity @e[scores={Incorrect_R10C=90..}] run data merge entity @e[tag=R10CBasketball,limit=1] {Age:-32768}


execute at @e[tag=R10CTopAEC] as @e[tag=R10CBasketball,distance=..0.5] run scoreboard objectives add R10CWin dummy
execute at @e[tag=R10CBottomAEC] as @e[tag=R10CBasketball,distance=..0.5] run data merge entity @s {Motion:[0.0d,-0.1d,0.0d]}
scoreboard players add @e[tag=MainTriviaAEC] R10CWin 1

execute if entity @e[scores={R10CWin=1}] run fill 934 61 1240 934 62 1241 air destroy
execute if entity @e[scores={R10CWin=1}] run fill 946 63 1250 948 63 1250 air
execute if entity @e[scores={R10CWin=1}] run setblock 948 63 1250 black_wall_banner[facing=north]{Patterns: [{Pattern: "rs", Color: 14}, {Pattern: "rs", Color: 14}]}
execute if entity @e[scores={R10CWin=1}] run setblock 947 63 1250 black_wall_banner[facing=north]{Patterns: [{Pattern: "ls", Color: 14}, {Pattern: "ls", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "bs", Color: 14}, {Pattern: "bs", Color: 14}]}
execute if entity @e[scores={R10CWin=1}] run setblock 946 63 1250 black_wall_banner[facing=north]{Patterns: [{Pattern: "ls", Color: 14}, {Pattern: "ls", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "rs", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "ts", Color: 14}, {Pattern: "bs", Color: 14}, {Pattern: "bs", Color: 14}]}
execute if entity @e[scores={R10CWin=1}] run clone 939 67 1251 940 70 1251 935 67 1251
execute if entity @e[scores={R10CWin=1..}] at @a[tag=WrongAnswer] run playsound weather.rain master @a ~ ~ ~ 1 1.5 1

execute if entity @e[scores={R10CWin=80..}] run teleport @a[tag=WrongAnswer] 1000 67 1075 90 0

# END SAFEGUARD
execute align x align y align z unless entity @a[x=930,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives add R10C_End dummy
execute align x align y align z if entity @a[x=930,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives remove R10C_End
execute align x align y align z unless entity @a[x=930,y=54,z=1229,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R10C_End 1

effect clear @a[tag=!WrongAnswer] slow_falling
execute if entity @e[scores={R10C_End=25..}] run clear @a
execute if entity @e[scores={R10C_End=25..}] run scoreboard objectives remove R10CWin
execute if entity @e[scores={R10C_End=25..}] run scoreboard objectives remove Incorrect_R10C
execute if entity @e[scores={R10C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R10C_End=25..}] run scoreboard objectives remove R10C_End