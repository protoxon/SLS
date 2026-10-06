####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 1 2018 / SPETEMBER 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1062 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G8B
#scoreboard objectives setdisplay sidebar G8BNoteBlock
#scoreboard objectives setdisplay sidebar G8BTextTimer

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G8B dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G8B 1

execute if entity @e[scores={Incorrect_G8B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G8B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G8B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G8B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G8B=1}] run title @a subtitle {"text":"Gold Blocks make a bell sound", "color":"white"}
execute if entity @e[scores={Incorrect_G8B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: You better find a gold block and play us a proper tune.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G8B=1}] run setblock 1197 66 1020 air
execute if entity @e[scores={Incorrect_G8B=1}] run fill 1185 54 1007 1209 78 1031 yellow_glazed_terracotta replace gold_block
execute if entity @e[scores={Incorrect_G8B=1}] run fill 1185 54 1007 1209 78 1031 birch_button[face=floor,facing=south,powered=false] replace stone_button

execute if entity @e[scores={Incorrect_G8B=1}] run clear @a gold_block
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.0 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.1 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.2 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.3 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.4 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.5 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.6 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.7 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.8 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.9 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.10 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.11 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.12 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.13 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.14 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.15 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.16 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.17 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.18 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.19 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.20 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.21 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.22 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.23 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.24 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.25 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64
execute if entity @e[scores={Incorrect_G8B=2}] run replaceitem entity @a[tag=WrongAnswer] inventory.26 gold_block{display:{Lore:['{"text":"Oh you found it!","italic":"true","color":"green"}']},CanPlaceOn:["minecraft:gold_ore"]} 64


#scoreboard objectives add G8BTextTimer dummy
#execute as @a at @s if block ~ ~-1 ~ yellow_glazed_terracotta run scoreboard players add @s G8BTextTimer 1
#execute as @a at @s unless block ~ ~-1 ~ yellow_glazed_terracotta run scoreboard players reset @s G8BTextTimer



execute if block 1207 67 1008 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"X","color":"white","obfuscated":true},{"text":"I","color":"white","obfuscated":"false"},{"text":"NVENTORYX","color":"white","obfuscated":true}]
execute if block 1207 67 1008 birch_button[powered=true] run setblock 1207 67 1008 birch_button[face=floor,facing=south,powered=false]

execute if block 1199 57 1015 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XI","color":"white","obfuscated":true},{"text":"N","color":"white","obfuscated":"false"},{"text":"VENTORYX","color":"white","obfuscated":true}]
execute if block 1199 57 1015 birch_button[powered=true] run setblock 1199 57 1015 birch_button[face=floor,facing=south,powered=false]

execute if block 1190 62 1008 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XIN","color":"white","obfuscated":true},{"text":"V","color":"white","obfuscated":"false"},{"text":"ENTORYX","color":"white","obfuscated":true}]
execute if block 1190 62 1008 birch_button[powered=true] run setblock 1190 62 1008 birch_button[face=floor,facing=south,powered=false]

execute if block 1189 60 1026 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINV","color":"white","obfuscated":true},{"text":"E","color":"white","obfuscated":"false"},{"text":"NTORYX","color":"white","obfuscated":true}]
execute if block 1189 60 1026 birch_button[powered=true] run setblock 1189 60 1026 birch_button[face=floor,facing=south,powered=false]

execute if block 1190 56 1019 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINVE","color":"white","obfuscated":true},{"text":"N","color":"white","obfuscated":"false"},{"text":"TORYX","color":"white","obfuscated":true}]
execute if block 1190 56 1019 birch_button[powered=true] run setblock 1190 56 1019 birch_button[face=floor,facing=south,powered=false]

execute if block 1207 62 1012 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINVEN","color":"white","obfuscated":true},{"text":"T","color":"white","obfuscated":"false"},{"text":"ORYX","color":"white","obfuscated":true}]
execute if block 1207 62 1012 birch_button[powered=true] run setblock 1207 62 1012 birch_button[face=floor,facing=south,powered=false]

execute if block 1207 65 1029 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINVENT","color":"white","obfuscated":true},{"text":"O","color":"white","obfuscated":"false"},{"text":"RYX","color":"white","obfuscated":true}]
execute if block 1207 65 1029 birch_button[powered=true] run setblock 1207 65 1029 birch_button[face=floor,facing=south,powered=false]

execute if block 1186 64 1012 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINVENTO","color":"white","obfuscated":true},{"text":"R","color":"white","obfuscated":"false"},{"text":"YX","color":"white","obfuscated":true}]
execute if block 1186 64 1012 birch_button[powered=true] run setblock 1186 64 1012 birch_button[face=floor,facing=south,powered=false]

execute if block 1188 65 1030 birch_button[powered=true] run tellraw @a[tag=WrongAnswer] ["",{"text":"XINVENTOR","color":"white","obfuscated":true},{"text":"Y","color":"white","obfuscated":"false"},{"text":"X","color":"white","obfuscated":true}]
execute if block 1188 65 1030 birch_button[powered=true] run setblock 1188 65 1030 birch_button[face=floor,facing=south,powered=false]




execute if block 1197 66 1020 air run scoreboard objectives remove G8BNoteBlock
execute if block 1197 66 1020 gold_block run scoreboard objectives add G8BNoteBlock minecraft.custom:minecraft.tune_noteblock
execute if entity @a[scores={G8BNoteBlock=24..}] run teleport @a[tag=WrongAnswer] 1062 67 1000 0 0

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add G8B_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove G8B_End
execute align x align y align z unless entity @a[x=1185,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G8B_End 1

execute if entity @e[scores={G8B_End=25..}] run clear @a
execute if entity @e[scores={G8B_End=25..}] run scoreboard objectives remove G8BNoteBlock
execute if entity @e[scores={G8B_End=25..}] run scoreboard objectives remove Incorrect_G8B
execute if entity @e[scores={G8B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G8B_End=25..}] run scoreboard objectives remove G8B_End