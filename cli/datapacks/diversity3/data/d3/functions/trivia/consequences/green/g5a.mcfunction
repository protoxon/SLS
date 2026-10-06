####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 30 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 995

#scoreboard objectives setdisplay sidebar Incorrect_G5A
#scoreboard objectives setdisplay sidebar G5AFishStick

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=52,z=969,dx=24,dy=26,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G5A dummy
execute align x align y align z if entity @a[x=1155,y=52,z=969,dx=24,dy=26,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G5A 1

execute if entity @e[scores={Incorrect_G5A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G5A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G5A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G5A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G5A=1}] run title @a subtitle {"text":"There are more than 3 infested blocks", "color":"white"}
execute if entity @e[scores={Incorrect_G5A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now find the 3 Silverfish you thought there were, and knock 'em into the lava.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G5A=1}] run team add G5A
execute if entity @e[scores={Incorrect_G5A=..10}] run team join G5A @a[tag=WrongAnswer]
execute if entity @e[scores={Incorrect_G5A=1}] run kill @e[tag=G5AFish]


scoreboard objectives add G5AFishStick dummy
scoreboard players add @a G5AFishStick 1

execute if entity @e[nbt={Item:{id:"minecraft:stick"}}] run scoreboard objectives remove G5AFishStick
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:stick"}]}] G5AFishStick
execute if entity @e[scores={Incorrect_G5A=100..}] run give @a[tag=WrongAnswer,scores={G5AFishStick=30..}] stick{Unbreakable:true,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Fish Stick\"}",Lore:['{"text":"Gives Silverfish that special smackdown","italic":"true","color":"green"}']},Enchantments:[{id:"minecraft:knockback",lvl:2}]}

execute if entity @e[scores={Incorrect_G5A=5}] run summon silverfish 1167 64 979 {Rotation:[180f,0f],Tags:["G5AFish"],Attributes:[{Name:"generic.movementSpeed",Base:0.2}],Team:G5A}
execute if entity @e[scores={Incorrect_G5A=5}] run summon silverfish 1176 63 991 {Rotation:[180f,0f],Tags:["G5AFish"],Attributes:[{Name:"generic.movementSpeed",Base:0.2}],Team:G5A}
execute if entity @e[scores={Incorrect_G5A=5}] run summon silverfish 1158 58 976 {Rotation:[180f,0f],Tags:["G5AFish"],Attributes:[{Name:"generic.movementSpeed",Base:0.2}],Team:G5A}

effect give @e[tag=G5AFish] resistance 3 255 true
execute align x align y align z as @a[x=1166,y=58,z=990,dx=2,dy=0,dz=1] at @s run teleport @s ~ ~ ~-0.5

execute as @e[tag=G5AFish] at @s if block ~ ~ ~ lava at @a[tag=WrongAnswer] run playsound block.note_block.bell master @a ~ ~ ~ 2 1 1
execute as @e[tag=G5AFish] at @s if block ~ ~ ~ lava run kill @s

execute if entity @e[scores={Incorrect_G5A=80..}] unless entity @e[tag=G5AFish] run scoreboard players set @e[scores={Incorrect_G5A=80..}] Incorrect_G5A -100

execute if entity @e[scores={Incorrect_G5A=-80..-1}] run teleport @a[tag=WrongAnswer] 1042 67 1000 180 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=52,z=969,dx=24,dy=26,dz=24] run scoreboard objectives add G5A_End dummy
execute align x align y align z if entity @a[x=1155,y=52,z=969,dx=24,dy=26,dz=24] run scoreboard objectives remove G5A_End
execute align x align y align z unless entity @a[x=1155,y=52,z=969,dx=24,dy=26,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G5A_End 1

execute if entity @e[scores={G5A_End=25..}] run kill @e[tag=G5AFish]
execute if entity @e[scores={G5A_End=25..}] run clear @a
execute if entity @e[scores={G5A_End=25..}] run scoreboard objectives remove G5AFishStick
execute if entity @e[scores={G5A_End=25..}] run scoreboard objectives remove Incorrect_G5A
execute if entity @e[scores={G5A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G5A_End=25..}] run scoreboard objectives remove G5A_End