####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 30 2018 / JULY 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 71 985

#scoreboard objectives setdisplay sidebar Incorrect_P10B
#scoreboard objectives setdisplay sidebar P10BWin

difficulty hard

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=758,y=49,z=939,dx=24,dy=28,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P10B dummy
execute align x align y align z if entity @a[x=758,y=49,z=939,dx=24,dy=28,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P10B 1

execute if entity @e[scores={Incorrect_P10B=1..}] run gamerule naturalRegeneration false
execute if entity @e[scores={Incorrect_P10B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P10B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P10B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P10B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P10B=1}] run title @a subtitle {"text":"Noobcrew didn't create The Building Game", "color":"white"}
execute if entity @e[scores={Incorrect_P10B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: The Building Game came from the mind of SethBling. Now you must build this mural.","color":"red"}]

execute if entity @e[scores={Incorrect_P10B=1}] run scoreboard objectives remove P10BWin
execute if entity @e[scores={Incorrect_P10B=1}] run fill 772 48 961 779 57 961 stripped_jungle_wood[axis=y] replace jungle_planks
execute if entity @e[scores={Incorrect_P10B=1}] run fill 766 54 946 773 54 955 stripped_jungle_wood[axis=y] replace jungle_planks
execute if entity @e[scores={Incorrect_P10B=1}] run clone 772 47 960 779 57 961 766 63 960
execute if entity @e[scores={Incorrect_P10B=5}] run kill @e[tag=P10BIllager]

execute if entity @e[scores={Incorrect_P10B=1}] run fill 766 59 946 773 59 955 air
execute if entity @e[scores={Incorrect_P10B=1}] run fill 769 59 945 770 59 948 quartz_block
execute if entity @e[scores={Incorrect_P10B=1}] run fill 769 60 945 770 60 948 air
execute if entity @e[scores={Incorrect_P10B=1}] run setblock 770 60 959 air
execute if entity @e[scores={Incorrect_P10B=1}] run clear @a[tag=WrongAnswer]
execute if entity @e[scores={Incorrect_P10B=1}] align x align y align z run kill @e[type=item,x=758,y=49,z=939,dx=24,dy=28,dz=24]
execute if entity @e[scores={Incorrect_P10B=1}] run setblock 770 60 959 chest[facing=north]{Items:[{Slot:3b,id:"minecraft:terracotta",Count:35b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:5b,id:"minecraft:dark_oak_planks",Count:6b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:11b,id:"minecraft:stripped_jungle_wood",Count:21b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:13b,id:"minecraft:white_concrete",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:15b,id:"minecraft:green_concrete",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:21b,id:"minecraft:brown_concrete",Count:14b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:23b,id:"minecraft:brown_terracotta",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}}]}
execute if entity @e[scores={Incorrect_P10B=1}] run setblock 769 60 958 stone_button[facing=north,face=wall,powered=false]

execute if entity @e[scores={Incorrect_P10B=1}] as @e[tag=P10BMob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_P10B=1}] as @e[tag=P10BMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P10B=1}] run summon villager 774 60 946 {NoAI:true,Rotation:[45f,0f],Offers:{},VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Invulnerable:true,Tags:["P10BVillager1","P10BVillager","P10BMob"]}
execute if entity @e[scores={Incorrect_P10B=1}] run summon villager 774 60 956 {NoAI:true,Rotation:[135f,0f],Offers:{},VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Invulnerable:true,Tags:["P10BVillager2","P10BVillager","P10BMob"]}
execute if entity @e[scores={Incorrect_P10B=1}] run summon villager 765 60 956 {NoAI:true,Rotation:[225f,0f],Offers:{},VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Invulnerable:true,Tags:["P10BVillager3","P10BVillager","P10BMob"]}
execute if entity @e[scores={Incorrect_P10B=1}] run summon villager 765 60 946 {NoAI:true,Rotation:[315f,0f],Offers:{},VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:6},Invulnerable:true,Tags:["P10BVillager4","P10BVillager","P10BMob"]}
execute as @e[tag=P10BVillager,nbt={NoAI:true}] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]


# RESET
execute if block 769 60 958 stone_button[powered=true] run fill 766 59 946 773 59 955 air
execute if block 769 60 958 stone_button[powered=true] run fill 769 59 945 770 59 948 quartz_block
execute if block 769 60 958 stone_button[powered=true] run fill 769 60 945 770 60 948 air
execute if block 769 60 958 stone_button[powered=true] at @e[tag=P10BVillager] run playsound entity.villager.no master @a ~ ~ ~ 1 1 0
execute if block 769 60 958 stone_button[powered=true] run setblock 770 60 959 air
execute if block 769 60 958 stone_button[powered=true] run clear @a[tag=WrongAnswer]
execute if block 769 60 958 stone_button[powered=true] align x align y align z run kill @e[type=item,x=758,y=49,z=939,dx=24,dy=28,dz=24]
execute if block 769 60 958 stone_button[powered=true] run setblock 770 60 959 chest[facing=north]{Items:[{Slot:3b,id:"minecraft:terracotta",Count:35b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:5b,id:"minecraft:dark_oak_planks",Count:6b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:11b,id:"minecraft:stripped_jungle_wood",Count:21b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:13b,id:"minecraft:white_concrete",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:15b,id:"minecraft:green_concrete",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:21b,id:"minecraft:brown_concrete",Count:14b,tag:{CanPlaceOn:["minecraft:quartz_block"]}},{Slot:23b,id:"minecraft:brown_terracotta",Count:2b,tag:{CanPlaceOn:["minecraft:quartz_block"]}}]}
execute if block 769 60 958 stone_button[powered=true] run setblock 769 60 958 stone_button[facing=north,face=wall,powered=false]


fill 766 59 946 773 59 955 stripped_jungle_wood[axis=y] replace stripped_jungle_wood[axis=x]
fill 766 59 946 773 59 955 stripped_jungle_wood[axis=y] replace stripped_jungle_wood[axis=z]
execute if entity @e[scores={Incorrect_P10B=80..}] if blocks 766 54 946 773 54 955 766 59 946 all if blocks 769 55 945 770 55 948 769 60 945 all run scoreboard objectives add P10BWin dummy
scoreboard players add @e[tag=MainTriviaAEC] P10BWin 1
execute if entity @e[scores={P10BWin=1}] run setblock 769 60 958 air
execute if entity @e[scores={P10BWin=10}] at @e[tag=P10BVillager] run playsound entity.villager.yes master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={P10BWin=50}] at @e[tag=P10BVillager1] run summon vindicator ~ ~-5 ~ {NoAI:true,Invulnerable:true,Silent:true,Tags:["P10BIllager1","P10BIllager","P10BMob"]}
execute if entity @e[scores={P10BWin=50}] at @e[tag=P10BVillager2] run summon vindicator ~ ~-5 ~ {NoAI:true,Invulnerable:true,Silent:true,Tags:["P10BIllager2","P10BIllager","P10BMob"]}
execute if entity @e[scores={P10BWin=50}] at @e[tag=P10BVillager3] run summon vindicator ~ ~-5 ~ {NoAI:true,Invulnerable:true,Silent:true,Tags:["P10BIllager3","P10BIllager","P10BMob"]}
execute if entity @e[scores={P10BWin=50}] at @e[tag=P10BVillager4] run summon vindicator ~ ~-5 ~ {NoAI:true,Invulnerable:true,Silent:true,Tags:["P10BIllager4","P10BIllager","P10BMob"]}
execute if entity @e[scores={P10BWin=50}] at @a[tag=WrongAnswer] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={P10BWin=..81}] run effect give @e[tag=P10BIllager] invisibility 3 255 true
execute if entity @e[scores={P10BWin=51..81}] as @e[tag=P10BVillager1] at @s run teleport @e[tag=P10BIllager1] ~ ~ ~ ~ ~
execute if entity @e[scores={P10BWin=51..81}] as @e[tag=P10BVillager2] at @s run teleport @e[tag=P10BIllager2] ~ ~ ~ ~ ~
execute if entity @e[scores={P10BWin=51..81}] as @e[tag=P10BVillager3] at @s run teleport @e[tag=P10BIllager3] ~ ~ ~ ~ ~
execute if entity @e[scores={P10BWin=51..81}] as @e[tag=P10BVillager4] at @s run teleport @e[tag=P10BIllager4] ~ ~ ~ ~ ~
execute if entity @e[scores={P10BWin=81}] run effect clear @e[tag=P10BIllager] invisibility
execute if entity @e[scores={P10BWin=81}] as @e[tag=P10BVillager] run data merge entity @s {NoAI:false}
execute if entity @e[scores={P10BWin=81}] as @e[tag=P10BIllager] run data merge entity @s {NoAI:false,Silent:false}
execute if entity @e[scores={P10BWin=81}] as @e[tag=P10BVillager] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P10BWin=81}] as @e[tag=P10BIllager] run data merge entity @s {HandItems:[{id:"minecraft:iron_axe",Count:1b}]}
execute if entity @e[scores={P10BWin=81}] run clone 760 47 960 767 57 961 766 63 960
execute if entity @e[scores={P10BWin=81}] run clone 766 49 946 773 49 955 766 59 946
execute if entity @e[scores={P10BWin=81}] run fill 769 60 945 770 60 948 cyan_terracotta


# END SAFEGUARD
execute align x align y align z unless entity @a[x=758,y=49,z=939,dx=24,dy=28,dz=24] run scoreboard objectives add P10B_End dummy
execute align x align y align z if entity @a[x=758,y=49,z=939,dx=24,dy=28,dz=24] run scoreboard objectives remove P10B_End
execute align x align y align z unless entity @a[x=758,y=49,z=939,dx=24,dy=28,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P10B_End 1

execute if entity @e[scores={P10B_End=25..}] run clear @a
execute if entity @e[scores={P10B_End=25..}] run scoreboard objectives remove P10BWin
execute if entity @e[scores={P10B_End=25..}] run scoreboard objectives remove Incorrect_P10B
execute if entity @e[scores={P10B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P10B_End=25..}] run scoreboard objectives remove P10B_End