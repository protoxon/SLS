####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 29 2018 / JUNE 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 945 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P7D
#scoreboard objectives setdisplay sidebar P7DTicks
#scoreboard objectives setdisplay sidebar P7DSeconds
#scoreboard objectives setdisplay sidebar P7DCactus

#scoreboard players reset @a P7DSeconds

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=42,z=1067,dx=24,dy=36,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P7D dummy
execute align x align y align z if entity @a[x=788,y=42,z=1067,dx=24,dy=36,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P7D 1

execute if entity @e[scores={Incorrect_P7D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P7D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P7D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P7D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P7D=1}] run title @a subtitle {"text":"sp614x does not develop Forge", "color":"white"}
execute if entity @e[scores={Incorrect_P7D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: sp614x created the massively popular OptiFine mod. Get up to 60 frames per second, but avoid the leg spikes or you'll lose them all.","color":"red"}]

tag @a remove P7DFPS
execute align x align y align z run tag @a[x=796,y=48,z=1076,dx=7,dy=2,dz=7] add P7DFPS

scoreboard objectives add P7DTicks dummy
scoreboard players reset @a[tag=!P7DFPS] P7DTicks
scoreboard players add @a[tag=P7DFPS] P7DTicks 1
scoreboard objectives add P7DSeconds dummy
scoreboard players add @a[scores={P7DTicks=20}] P7DSeconds 1

clear @a[tag=!P7DFPS] item_frame
execute at @a[scores={P7DTicks=20,P7DSeconds=..59}] run playsound entity.item.pickup master @a ~ ~ ~ 0.5 1 0
execute at @a[scores={P7DTicks=20,P7DSeconds=60}] run playsound block.note_block.pling master @a ~ ~ ~ 0.5 1 0
clear @a[scores={P7DTicks=20,P7DSeconds=..59}] item_frame
replaceitem entity @a[scores={P7DSeconds=1,P7DTicks=20}] hotbar.0 item_frame 1
replaceitem entity @a[scores={P7DSeconds=2,P7DTicks=20}] hotbar.0 item_frame 2
replaceitem entity @a[scores={P7DSeconds=3,P7DTicks=20}] hotbar.0 item_frame 3
replaceitem entity @a[scores={P7DSeconds=4,P7DTicks=20}] hotbar.0 item_frame 4
replaceitem entity @a[scores={P7DSeconds=5,P7DTicks=20}] hotbar.0 item_frame 5
replaceitem entity @a[scores={P7DSeconds=6,P7DTicks=20}] hotbar.0 item_frame 6
replaceitem entity @a[scores={P7DSeconds=7,P7DTicks=20}] hotbar.0 item_frame 7
replaceitem entity @a[scores={P7DSeconds=8,P7DTicks=20}] hotbar.0 item_frame 8
replaceitem entity @a[scores={P7DSeconds=9,P7DTicks=20}] hotbar.0 item_frame 9
replaceitem entity @a[scores={P7DSeconds=10,P7DTicks=20}] hotbar.0 item_frame 10
replaceitem entity @a[scores={P7DSeconds=11,P7DTicks=20}] hotbar.0 item_frame 11
replaceitem entity @a[scores={P7DSeconds=12,P7DTicks=20}] hotbar.0 item_frame 12
replaceitem entity @a[scores={P7DSeconds=13,P7DTicks=20}] hotbar.0 item_frame 13
replaceitem entity @a[scores={P7DSeconds=14,P7DTicks=20}] hotbar.0 item_frame 14
replaceitem entity @a[scores={P7DSeconds=15,P7DTicks=20}] hotbar.0 item_frame 15
replaceitem entity @a[scores={P7DSeconds=16,P7DTicks=20}] hotbar.0 item_frame 16
replaceitem entity @a[scores={P7DSeconds=17,P7DTicks=20}] hotbar.0 item_frame 17
replaceitem entity @a[scores={P7DSeconds=18,P7DTicks=20}] hotbar.0 item_frame 18
replaceitem entity @a[scores={P7DSeconds=19,P7DTicks=20}] hotbar.0 item_frame 19
replaceitem entity @a[scores={P7DSeconds=20,P7DTicks=20}] hotbar.0 item_frame 20
replaceitem entity @a[scores={P7DSeconds=21,P7DTicks=20}] hotbar.0 item_frame 21
replaceitem entity @a[scores={P7DSeconds=22,P7DTicks=20}] hotbar.0 item_frame 22
replaceitem entity @a[scores={P7DSeconds=23,P7DTicks=20}] hotbar.0 item_frame 23
replaceitem entity @a[scores={P7DSeconds=24,P7DTicks=20}] hotbar.0 item_frame 24
replaceitem entity @a[scores={P7DSeconds=25,P7DTicks=20}] hotbar.0 item_frame 25
replaceitem entity @a[scores={P7DSeconds=26,P7DTicks=20}] hotbar.0 item_frame 26
replaceitem entity @a[scores={P7DSeconds=27,P7DTicks=20}] hotbar.0 item_frame 27
replaceitem entity @a[scores={P7DSeconds=28,P7DTicks=20}] hotbar.0 item_frame 28
replaceitem entity @a[scores={P7DSeconds=29,P7DTicks=20}] hotbar.0 item_frame 29
replaceitem entity @a[scores={P7DSeconds=30,P7DTicks=20}] hotbar.0 item_frame 30
replaceitem entity @a[scores={P7DSeconds=31,P7DTicks=20}] hotbar.0 item_frame 31
replaceitem entity @a[scores={P7DSeconds=32,P7DTicks=20}] hotbar.0 item_frame 32
replaceitem entity @a[scores={P7DSeconds=33,P7DTicks=20}] hotbar.0 item_frame 33
replaceitem entity @a[scores={P7DSeconds=34,P7DTicks=20}] hotbar.0 item_frame 34
replaceitem entity @a[scores={P7DSeconds=35,P7DTicks=20}] hotbar.0 item_frame 35
replaceitem entity @a[scores={P7DSeconds=36,P7DTicks=20}] hotbar.0 item_frame 36
replaceitem entity @a[scores={P7DSeconds=37,P7DTicks=20}] hotbar.0 item_frame 37
replaceitem entity @a[scores={P7DSeconds=38,P7DTicks=20}] hotbar.0 item_frame 38
replaceitem entity @a[scores={P7DSeconds=39,P7DTicks=20}] hotbar.0 item_frame 39
replaceitem entity @a[scores={P7DSeconds=40,P7DTicks=20}] hotbar.0 item_frame 40
replaceitem entity @a[scores={P7DSeconds=41,P7DTicks=20}] hotbar.0 item_frame 41
replaceitem entity @a[scores={P7DSeconds=42,P7DTicks=20}] hotbar.0 item_frame 42
replaceitem entity @a[scores={P7DSeconds=43,P7DTicks=20}] hotbar.0 item_frame 43
replaceitem entity @a[scores={P7DSeconds=44,P7DTicks=20}] hotbar.0 item_frame 44
replaceitem entity @a[scores={P7DSeconds=45,P7DTicks=20}] hotbar.0 item_frame 45
replaceitem entity @a[scores={P7DSeconds=46,P7DTicks=20}] hotbar.0 item_frame 46
replaceitem entity @a[scores={P7DSeconds=47,P7DTicks=20}] hotbar.0 item_frame 47
replaceitem entity @a[scores={P7DSeconds=48,P7DTicks=20}] hotbar.0 item_frame 48
replaceitem entity @a[scores={P7DSeconds=49,P7DTicks=20}] hotbar.0 item_frame 49
replaceitem entity @a[scores={P7DSeconds=50,P7DTicks=20}] hotbar.0 item_frame 50
replaceitem entity @a[scores={P7DSeconds=51,P7DTicks=20}] hotbar.0 item_frame 51
replaceitem entity @a[scores={P7DSeconds=52,P7DTicks=20}] hotbar.0 item_frame 52
replaceitem entity @a[scores={P7DSeconds=53,P7DTicks=20}] hotbar.0 item_frame 53
replaceitem entity @a[scores={P7DSeconds=54,P7DTicks=20}] hotbar.0 item_frame 54
replaceitem entity @a[scores={P7DSeconds=55,P7DTicks=20}] hotbar.0 item_frame 55
replaceitem entity @a[scores={P7DSeconds=56,P7DTicks=20}] hotbar.0 item_frame 56
replaceitem entity @a[scores={P7DSeconds=57,P7DTicks=20}] hotbar.0 item_frame 57
replaceitem entity @a[scores={P7DSeconds=58,P7DTicks=20}] hotbar.0 item_frame 58
replaceitem entity @a[scores={P7DSeconds=59,P7DTicks=20}] hotbar.0 item_frame 59
replaceitem entity @a[scores={P7DSeconds=60,P7DTicks=20}] hotbar.0 item_frame 60
scoreboard players reset @a[tag=!P7DFPS] P7DSeconds
scoreboard players set @a[scores={P7DTicks=20..}] P7DTicks 0





execute if entity @e[tag=P7DFPS] run scoreboard objectives add P7DCactus dummy
execute unless entity @e[tag=P7DFPS] run scoreboard objectives remove P7DCactus
scoreboard players add @e[tag=MainTriviaAEC] P7DCactus 1
scoreboard players set @e[scores={P7DCactus=80..}] P7DCactus 0


# RANDOM SHOTS
execute if entity @e[scores={P7DCactus=1}] run kill @e[tag=P7DCactusAEC]
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 796 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 797 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 798 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 799 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 800 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 801 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 802 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 803 49 1088 {Duration:10,Tags:["P7DCactusAEC","P7DCactusNorthAEC"]}

execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1076 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1077 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1078 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1079 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1080 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1081 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1082 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 808 49 1083 {Duration:10,Tags:["P7DCactusAEC","P7DCactusWestAEC"]}

execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 796 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 797 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 798 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 799 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 800 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 801 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 802 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 803 49 1071 {Duration:10,Tags:["P7DCactusAEC","P7DCactusSouthAEC"]}

execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1076 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1077 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1078 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1079 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1080 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1081 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1082 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}
execute if entity @e[scores={P7DCactus=1}] run summon area_effect_cloud 791 49 1083 {Duration:10,Tags:["P7DCactusAEC","P7DCactusEastAEC"]}

execute if entity @e[scores={P7DCactus=1}] run kill @e[tag=P7DCactusAEC,sort=random,limit=30]


execute if entity @e[scores={P7DCactus=5}] at @e[tag=P7DCactusNorthAEC] run summon armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["P7DCactusAS","P7DCactusNorthAS","P7DCactusBlock","P7DCactusNorthBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:cactus"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["P7DCactusBlock","P7DCactusNorthBlock"]}],DisabledSlots:2039583}

execute if entity @e[scores={P7DCactus=5}] at @e[tag=P7DCactusEastAEC] run summon armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["P7DCactusAS","P7DCactusEastAS","P7DCactusBlock","P7DCactusEastBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:cactus"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["P7DCactusBlock","P7DCactusEastBlock"]}],DisabledSlots:2039583}

execute if entity @e[scores={P7DCactus=5}] at @e[tag=P7DCactusSouthAEC] run summon armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["P7DCactusAS","P7DCactusSouthAS","P7DCactusBlock","P7DCactusSouthBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:cactus"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["P7DCactusBlock","P7DCactusSouthBlock"]}],DisabledSlots:2039583}

execute if entity @e[scores={P7DCactus=5}] at @e[tag=P7DCactusWestAEC] run summon armor_stand ~ ~ ~ {Invisible:true,NoGravity:true,Small:true,Marker:true,Tags:["P7DCactusAS","P7DCactusWestAS","P7DCactusBlock","P7DCactusWestBlock"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:cactus"},NoGravity:true,DropItem:false,Time:-2147483648,Tags:["P7DCactusBlock","P7DCactusWestBlock"]}],DisabledSlots:2039583}

execute align x align y align z run kill @e[tag=P7DCactusNorthBlock,x=796,y=48,z=1070,dx=7,dy=2,dz=0]
execute align x align y align z run kill @e[tag=P7DCactusEastBlock,x=809,y=48,z=1076,dx=0,dy=2,dz=7]
execute align x align y align z run kill @e[tag=P7DCactusSouthBlock,x=796,y=48,z=1089,dx=7,dy=2,dz=0]
execute align x align y align z run kill @e[tag=P7DCactusWestBlock,x=790,y=48,z=1076,dx=0,dy=2,dz=7]


#execute as @e[tag=P7DCactusAS] run data merge entity @s {Invisible:false}

execute as @e[tag=P7DCactusNorthAS] at @s run teleport @s ~ ~ ~-0.1
execute as @e[tag=P7DCactusEastAS] at @s run teleport @s ~0.1 ~ ~
execute as @e[tag=P7DCactusSouthAS] at @s run teleport @s ~ ~ ~0.1
execute as @e[tag=P7DCactusWestAS] at @s run teleport @s ~-0.1 ~ ~

#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run playsound enchant.thorns.hit master @a ~ ~1 ~ 1 1 0
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run playsound entity.generic.hurt master @a ~ ~ ~ 0.5 1 0
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run scoreboard players reset @s P7DSeconds
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run scoreboard players reset @s P7DTicks
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run clear @s item_frame
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run teleport @s ~ ~0.5 ~
#execute as @a[tag=P7DFPS] at @s align x align z if entity @e[tag=P7DCactusBlock,type=falling_block,dx=0,dy=1,dz=0] run effect give @s blindness 1 255 true

execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run playsound enchant.thorns.hit master @a ~ ~1 ~ 1 1 0
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run playsound entity.generic.hurt master @a ~ ~ ~ 0.5 1 0
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run scoreboard players reset @s P7DSeconds
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run scoreboard players reset @s P7DTicks
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run clear @s item_frame
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run teleport @s ~ ~0.5 ~
execute as @a[tag=P7DFPS] at @s positioned ~ ~1 ~ if entity @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run effect give @s blindness 1 255 true



execute at @a[tag=P7DFPS] positioned ~ ~ ~ as @e[tag=P7DCactusBlock,type=falling_block,distance=..0.9] run kill @s
kill @e[tag=P7DCactusAS,nbt=!{Passengers:[{Tags:["P7DCactusBlock"]}]}]


#execute as @e[tag=P7DCactusBlock] run data merge entity @s {Invisible:false,Small:false}



# TO WIN
execute if entity @a[scores={P7DSeconds=61..}] run kill @e[tag=P7DCactusBlock]
execute if entity @a[scores={P7DSeconds=61}] run teleport @a[tag=WrongAnswer] 945 67 1000 0 0




# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=42,z=1067,dx=24,dy=36,dz=24] run scoreboard objectives add P7D_End dummy
execute align x align y align z if entity @a[x=788,y=42,z=1067,dx=24,dy=36,dz=24] run scoreboard objectives remove P7D_End
execute align x align y align z unless entity @a[x=788,y=42,z=1067,dx=24,dy=36,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P7D_End 1

execute if entity @e[scores={P7D_End=25..}] run clear @a
execute if entity @e[scores={P7D_End=25..}] run scoreboard objectives remove P7DTicks
execute if entity @e[scores={P7D_End=25..}] run scoreboard objectives remove P7DSeconds
execute if entity @e[scores={P7D_End=25..}] run scoreboard objectives remove P7DCactus
execute if entity @e[scores={P7D_End=25..}] run scoreboard objectives remove Incorrect_P7D
execute if entity @e[scores={P7D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P7D_End=25..}] run scoreboard objectives remove P7D_End