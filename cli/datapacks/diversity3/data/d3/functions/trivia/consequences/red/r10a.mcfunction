####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 18 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1018 71 1069

#scoreboard objectives setdisplay sidebar Incorrect_R10A
#scoreboard objectives setdisplay sidebar R10ALetter

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=960,y=48,z=1229,dx=33,dy=30,dz=29] add WrongAnswer

scoreboard objectives add Incorrect_R10A dummy
execute align x align y align z if entity @a[x=960,y=48,z=1229,dx=33,dy=30,dz=29] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R10A 1

execute if entity @e[scores={Incorrect_R10A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R10A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R10A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R10A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R10A=1}] run title @a subtitle {"text":"/clickEvent isn't even a command", "color":"white"}
execute if entity @e[scores={Incorrect_R10A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now you're gonna have to click EVENT.","color":"red","bold":false}]

execute unless block 990 66 1252 air run setblock 990 66 1252 air
execute unless block 984 68 1254 air run setblock 984 68 1254 air
execute unless block 979 66 1255 air run setblock 979 66 1255 air
execute unless block 974 64 1256 air run setblock 974 64 1256 air
execute unless block 969 67 1255 air run setblock 969 67 1255 air
execute unless block 964 66 1255 air run setblock 964 66 1255 air

execute unless entity @e[tag=R10AFallingBlock1] run summon falling_block 990 66 1252 {BlockState:{Name:"minecraft:stone"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock1","R10AFallingBlock"]}
execute unless entity @e[tag=R10AFallingBlock2] run summon falling_block 984 68 1254 {BlockState:{Name:"minecraft:andesite"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock2","R10AFallingBlock"]}
execute unless entity @e[tag=R10AFallingBlock3] run summon falling_block 979 66 1255 {BlockState:{Name:"minecraft:stone"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock3","R10AFallingBlock"]}
execute unless entity @e[tag=R10AFallingBlock4] run summon falling_block 974 64 1256 {BlockState:{Name:"minecraft:stone"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock4","R10AFallingBlock"]}
execute unless entity @e[tag=R10AFallingBlock5] run summon falling_block 969 67 1255 {BlockState:{Name:"minecraft:stone"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock5","R10AFallingBlock"]}
execute unless entity @e[tag=R10AFallingBlock6] run summon falling_block 964 66 1255 {BlockState:{Name:"minecraft:stone"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["R10AFallingBlock6","R10AFallingBlock"]}

execute align x align y align z as @a[x=961,y=60,z=1241,dx=31,dy=0,dz=12] at @s run teleport @s ~ 64 1241

execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard objectives add R10ALetter dummy

execute if entity @e[scores={Incorrect_R10A=1}] run kill @e[tag=R10AAEC]
execute if entity @e[scores={Incorrect_R10A=1}] run summon area_effect_cloud 985 64 1253 {Tags:["R10AAEC1","R10AAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R10A=1}] run summon area_effect_cloud 980 64 1254 {Tags:["R10AAEC2","R10AAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R10A=1}] run summon area_effect_cloud 975 64 1255 {Tags:["R10AAEC3","R10AAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R10A=1}] run summon area_effect_cloud 970 64 1255 {Tags:["R10AAEC4","R10AAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R10A=1}] run summon area_effect_cloud 965 64 1254 {Tags:["R10AAEC5","R10AAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R10A=1}] run setblock 987 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R10A=1}] run setblock 982 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R10A=1}] run setblock 977 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R10A=1}] run setblock 972 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R10A=1}] run setblock 967 65 1242 stone_button[face=floor,facing=south,powered=false]


execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard players set @e[tag=R10AAEC1] R10ALetter 1
execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard players set @e[tag=R10AAEC2] R10ALetter 51
execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard players set @e[tag=R10AAEC3] R10ALetter 101
execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard players set @e[tag=R10AAEC4] R10ALetter 151
execute if entity @e[scores={Incorrect_R10A=1}] run scoreboard players set @e[tag=R10AAEC5] R10ALetter 201

scoreboard players add @e[tag=R10AAEC] R10ALetter 1

execute as @e[scores={R10ALetter=1}] at @s run clone 43 54 38 46 58 38 ~ ~ ~
execute as @e[scores={R10ALetter=11}] at @s run clone 43 48 38 46 52 38 ~ ~ ~
execute as @e[scores={R10ALetter=21}] at @s run clone 43 42 38 46 46 38 ~ ~ ~
execute as @e[scores={R10ALetter=31}] at @s run clone 43 36 38 46 40 38 ~ ~ ~
#E
execute as @e[scores={R10ALetter=41}] at @s run clone 43 30 38 46 34 38 ~ ~ ~
execute as @e[scores={R10ALetter=51}] at @s run clone 43 24 38 46 28 38 ~ ~ ~
execute as @e[scores={R10ALetter=61}] at @s run clone 43 18 38 46 22 38 ~ ~ ~
execute as @e[scores={R10ALetter=71}] at @s run clone 43 12 38 46 16 38 ~ ~ ~
execute as @e[scores={R10ALetter=81}] at @s run clone 43 6 38 46 10 38 ~ ~ ~

execute as @e[scores={R10ALetter=91}] at @s run clone 38 54 38 41 58 38 ~ ~ ~
execute as @e[scores={R10ALetter=101}] at @s run clone 38 48 38 41 52 38 ~ ~ ~
execute as @e[scores={R10ALetter=111}] at @s run clone 38 42 38 41 46 38 ~ ~ ~
execute as @e[scores={R10ALetter=121}] at @s run clone 38 36 38 41 40 38 ~ ~ ~
#N
execute as @e[scores={R10ALetter=131}] at @s run clone 38 30 38 41 34 38 ~ ~ ~
execute as @e[scores={R10ALetter=141}] at @s run clone 38 24 38 41 28 38 ~ ~ ~
execute as @e[scores={R10ALetter=151}] at @s run clone 38 18 38 41 22 38 ~ ~ ~
execute as @e[scores={R10ALetter=161}] at @s run clone 38 12 38 41 16 38 ~ ~ ~
execute as @e[scores={R10ALetter=171}] at @s run clone 38 6 38 41 10 38 ~ ~ ~

execute as @e[scores={R10ALetter=181}] at @s run clone 33 54 38 36 58 38 ~ ~ ~
#T
execute as @e[scores={R10ALetter=191}] at @s run clone 33 48 38 36 52 38 ~ ~ ~
#V
execute as @e[scores={R10ALetter=201}] at @s run clone 33 42 38 36 46 38 ~ ~ ~
execute as @e[scores={R10ALetter=211}] at @s run clone 33 36 38 36 40 38 ~ ~ ~
execute as @e[scores={R10ALetter=221}] at @s run clone 33 30 38 36 34 38 ~ ~ ~
execute as @e[scores={R10ALetter=231}] at @s run clone 33 24 38 36 28 38 ~ ~ ~
execute as @e[scores={R10ALetter=241}] at @s run clone 33 18 38 36 22 38 ~ ~ ~
execute as @e[scores={R10ALetter=251}] at @s run clone 33 12 38 36 16 38 ~ ~ ~

scoreboard players set @e[scores={R10ALetter=260}] R10ALetter 0

execute if entity @e[tag=R10AAEC1,scores={R10ALetter=1}] run setblock 987 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[tag=R10AAEC2,scores={R10ALetter=1}] run setblock 982 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[tag=R10AAEC3,scores={R10ALetter=1}] run setblock 977 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[tag=R10AAEC4,scores={R10ALetter=1}] run setblock 972 65 1242 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[tag=R10AAEC5,scores={R10ALetter=1}] run setblock 967 65 1242 stone_button[face=floor,facing=south,powered=false]


execute if block 987 65 1242 stone_button[powered=true] as @e[tag=R10AAEC1,scores={R10ALetter=41..50}] run scoreboard players set @s R10ALetter 1000
execute if block 982 65 1242 stone_button[powered=true] as @e[tag=R10AAEC2,scores={R10ALetter=211..220}] run scoreboard players set @s R10ALetter 1000
execute if block 977 65 1242 stone_button[powered=true] as @e[tag=R10AAEC3,scores={R10ALetter=41..50}] run scoreboard players set @s R10ALetter 1000
execute if block 972 65 1242 stone_button[powered=true] as @e[tag=R10AAEC4,scores={R10ALetter=131..140}] run scoreboard players set @s R10ALetter 1000
execute if block 967 65 1242 stone_button[powered=true] as @e[tag=R10AAEC5,scores={R10ALetter=191..200}] run scoreboard players set @s R10ALetter 1000

execute if block 987 65 1242 stone_button[powered=true] run setblock 987 65 1242 air
execute if block 982 65 1242 stone_button[powered=true] run setblock 982 65 1242 air
execute if block 977 65 1242 stone_button[powered=true] run setblock 977 65 1242 air
execute if block 972 65 1242 stone_button[powered=true] run setblock 972 65 1242 air
execute if block 967 65 1242 stone_button[powered=true] run setblock 967 65 1242 air

execute at @e[scores={R10ALetter=1000}] run particle end_rod ~1.5 ~2.5 ~-0.6 1.1 1.5 0 0.1 200 force
execute at @e[scores={R10ALetter=1000}] run playsound entity.player.levelup master @a ~1.5 ~2 ~ 10 1.5 1
execute if entity @e[scores={Incorrect_R10A=80..}] unless entity @e[scores={R10ALetter=..1060}] run teleport @a[tag=WrongAnswer] 1000 67 1075 90 0






# END SAFEGUARD
execute align x align y align z unless entity @a[x=960,y=48,z=1229,dx=33,dy=30,dz=29] run scoreboard objectives add R10A_End dummy
execute align x align y align z if entity @a[x=960,y=48,z=1229,dx=33,dy=30,dz=29] run scoreboard objectives remove R10A_End
execute align x align y align z unless entity @a[x=960,y=48,z=1229,dx=33,dy=30,dz=29] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R10A_End 1

execute if entity @e[scores={R10A_End=25..}] run clear @a
execute if entity @e[scores={R10A_End=25..}] run kill @e[tag=R10AMob]
execute if entity @e[scores={R10A_End=25..}] run scoreboard objectives remove R10ALetter
execute if entity @e[scores={R10A_End=25..}] run scoreboard objectives remove Incorrect_R10A
execute if entity @e[scores={R10A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R10A_End=25..}] run scoreboard objectives remove R10A_End