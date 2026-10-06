####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 11 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1015 73 1016

#scoreboard objectives setdisplay sidebar Incorrect_R1B
#scoreboard objectives setdisplay sidebar R1BFeather

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R1B dummy
execute align x align y align z if entity @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R1B 1

execute if entity @e[scores={Incorrect_R1B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R1B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R1B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R1B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R1B=1}] run title @a subtitle {"text":"20 blocks is not the answer", "color":"white"}
execute if entity @e[scores={Incorrect_R1B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Looks like you'll have to pull an Impossible Mission, and avoid the 20 levels of security wires to get to the bottom. This thing should help.","color":"red","bold":false}]


execute as @a[tag=WrongAnswer] at @s if block ~ ~ ~ tripwire run playsound block.ender_chest.open master @a ~ ~ ~ 6 0.5 0
execute as @a[tag=WrongAnswer] at @s if block ~ ~ ~ tripwire run teleport @s 1049 105 1116 0 0
execute as @a[tag=WrongAnswer] at @s if block ~ ~1 ~ tripwire run playsound block.ender_chest.open master @a ~ ~ ~ 6 0.5 0
execute as @a[tag=WrongAnswer] at @s if block ~ ~1 ~ tripwire run teleport @s 1049 105 1116 0 0
execute as @a[tag=WrongAnswer] at @s if block ~ ~2 ~ tripwire run playsound block.ender_chest.open master @a ~ ~ ~ 6 0.5 0
execute as @a[tag=WrongAnswer] at @s if block ~ ~2 ~ tripwire run teleport @s 1049 105 1116 0 0


scoreboard objectives add R1BFeather dummy
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:feather"}]}] R1BFeather
scoreboard players add @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:feather"}]}] R1BFeather 1

give @a[tag=WrongAnswer,scores={R1BFeather=90..}] feather

effect give @a[tag=WrongAnswer] resistance 1 255 true
execute align x align y align z run effect give @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24,nbt={SelectedItem:{id:"minecraft:feather"}}] levitation 300 254 true
effect clear @a[nbt=!{SelectedItem:{id:"minecraft:feather"}}] levitation

#execute align x align y align z run effect give @a[x=1046,y=19,z=1118,dx=6,dy=0,dz=6,nbt=!{SelectedItem:{id:"minecraft:feather"}}] slow_falling 1 255 true

execute align x align y align z run effect give @a[x=1046,y=19,z=1118,dx=6,dy=0,dz=6,nbt=!{SelectedItem:{id:"minecraft:feather"}}] jump_boost 1 255 true



execute if block 1049 16 1131 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1000 67 1016 270 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24] run scoreboard objectives add R1B_End dummy
execute align x align y align z if entity @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24] run scoreboard objectives remove R1B_End
execute align x align y align z unless entity @a[x=1037,y=13,z=1109,dx=24,dy=99,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R1B_End 1

execute if entity @e[scores={R1B_End=25..}] run clear @a
execute if entity @e[scores={R1B_End=25..}] run effect clear @a levitation
execute if entity @e[scores={R1B_End=25..}] run scoreboard objectives remove R1BFeather
execute if entity @e[scores={R1B_End=25..}] run scoreboard objectives remove Incorrect_R1B
execute if entity @e[scores={R1B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R1B_End=25..}] run scoreboard objectives remove R1B_End