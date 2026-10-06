####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018 / MARCH 17 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1068 69 995

#scoreboard objectives setdisplay sidebar Incorrect_G9A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G9A dummy
execute align x align y align z if entity @a[x=1215,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G9A 1

execute if entity @e[scores={Incorrect_G9A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G9A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G9A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G9A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G9A=1}] run title @a subtitle {"text":"A Fess is not top horizontal stripe", "color":"white"}
execute if entity @e[scores={Incorrect_G9A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: A top horizontal stripe is known as a \"Chief\" pattern. Now go find that Chief banner hidden somewhere around here...","color":"red","bold":false}]

effect give @a[tag=WrongAnswer] night_vision 12 255 true
effect give @a[tag=WrongAnswer] resistance 3 255 true

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1221 57 972 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1221 57 972 dropper[facing=down]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1232 65 992 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1232 65 992 brown_shulker_box[facing=north]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1236 57 981 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1236 57 981 chest[facing=north]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1237 58 992 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1237 58 992 chest[facing=north]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1230 58 973 air
execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1230 58 972 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1230 58 972 dispenser[facing=south]{Items: [{Slot: 4b, id: "minecraft:tipped_arrow", Count: 64b, tag: {Potion: "minecraft:long_invisibility"}}]}

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1236 58 974 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1236 58 974 dispenser[facing=west]{Items: [{Slot: 4b, id: "minecraft:spectral_arrow", Count: 64b}]}

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1235 57 974 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1235 57 974 chest[facing=west]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1220 57 988 air
execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1220 56 988 air
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1220 56 988 hopper[facing=down]

execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1234 68 975 cobblestone
execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1234 68 975 furnace[facing=north]

#execute if entity @e[scores={Incorrect_G9A=1}] run setblock 1223 68 972 air
#execute if entity @e[scores={Incorrect_G9A=2}] run setblock 1223 68 972 cyan_shulker_box[facing=up]{Items: [{Slot: 13b, id: "minecraft:white_banner", Count: 1b, tag: {BlockEntityTag: {id: "minecraft:banner", Patterns: [{Pattern: "ts", Color: 11}]}}}]}

execute if entity @e[scores={Incorrect_G9A=100}] run setblock 1223 68 972 air
execute if entity @e[scores={Incorrect_G9A=102}] run setblock 1223 68 972 cyan_shulker_box[facing=up]{Items: [{Slot: 13b, id: "minecraft:white_banner", Count: 1b, tag: {BlockEntityTag: {id: "minecraft:banner", Patterns: [{Pattern: "ts", Color: 11}]}}}]}


effect clear @a[tag=!WrongAnswer] invisibility
effect clear @a[tag=!WrongAnswer] glowing

execute if entity @a[nbt={Inventory: [{id: "minecraft:white_banner", tag: {BlockEntityTag: {id: "minecraft:banner", Patterns: [{Pattern: "ts"}]}}}]}] run teleport @a[tag=WrongAnswer] 1068 67 1000 180 0





# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add G9A_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove G9A_End
execute align x align y align z unless entity @a[x=1215,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G9A_End 1

execute if entity @e[scores={G9A_End=25..}] run clear @a
execute if entity @e[scores={G9A_End=25..}] run scoreboard objectives remove Incorrect_G9A
execute if entity @e[scores={G9A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G9A_End=25..}] run scoreboard objectives remove G9A_End