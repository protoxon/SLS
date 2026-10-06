####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018 / JUNE 3 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1015 73 1016

#scoreboard objectives setdisplay sidebar Incorrect_R1C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1067,y=13,z=1109,dx=25,dy=65,dz=25] add WrongAnswer

scoreboard objectives add Incorrect_R1C dummy
execute align x align y align z if entity @a[x=1067,y=13,z=1109,dx=25,dy=65,dz=25] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R1C 1

execute if entity @e[scores={Incorrect_R1C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R1C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R1C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R1C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R1C=1}] run title @a subtitle {"text":"36 is not the correct amount", "color":"white"}
execute if entity @e[scores={Incorrect_R1C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Maybe you can locate the tripwire hook among these 36 pillars.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R1C=1}] align x align y align z run kill @e[type=item,x=1067,y=13,z=1109,dx=25,dy=65,dz=25]

execute if entity @e[scores={Incorrect_R1C=1}] run kill @e[tag=G1CChestAEC]
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1114 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1117 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1120 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1123 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1126 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1072 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1075 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1078 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1081 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1084 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_R1C=1}] run summon area_effect_cloud 1087 70 1129 {Tags:["G1CRandomAEC","G1CChestAEC"],Duration:2147483647}

execute if entity @e[scores={Incorrect_R1C=2}] at @e[tag=G1CRandomAEC] run setblock ~ ~ ~ air
execute if entity @e[scores={Incorrect_R1C=3}] at @e[tag=G1CRandomAEC,limit=1,sort=random] run setblock ~ ~ ~ chest[facing=south]{Items:[{Slot: 13b,id:"minecraft:tripwire_hook",Count: 1b}]}
execute if entity @e[scores={Incorrect_R1C=3}] at @e[tag=G1CRandomAEC] if block ~ ~ ~ air run setblock ~ ~ ~ chest[facing=north]
execute if entity @e[scores={Incorrect_R1C=4}] run kill @e[tag=G1CRandomAEC]

effect give @a[tag=WrongAnswer] resistance 2 255 true

execute if entity @e[scores={Incorrect_R1C=80..}] if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:tripwire_hook"}]}] run teleport @a[tag=WrongAnswer] 1000 67 1016 270 0
execute if entity @e[scores={Incorrect_R1C=80..}] align x align y align z if entity @e[type=item,x=1067,y=13,z=1109,dx=25,dy=65,dz=25,nbt={Item:{id:"minecraft:tripwire_hook"}}] run teleport @a[tag=WrongAnswer] 1000 67 1016 270 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1067,y=13,z=1109,dx=25,dy=65,dz=25] run scoreboard objectives add R1C_End dummy
execute align x align y align z if entity @a[x=1067,y=13,z=1109,dx=25,dy=65,dz=25] run scoreboard objectives remove R1C_End
execute align x align y align z unless entity @a[x=1067,y=13,z=1109,dx=25,dy=65,dz=25] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R1C_End 1

execute if entity @e[scores={R1C_End=25..}] run clear @a
execute if entity @e[scores={R1C_End=25..}] run scoreboard objectives remove Incorrect_R1C
execute if entity @e[scores={R1C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R1C_End=25..}] run scoreboard objectives remove R1C_End