####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 73 1023

#scoreboard objectives setdisplay sidebar Incorrect_R2C
#scoreboard objectives setdisplay sidebar R2CPickaxe


tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=909,y=54,z=1109,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R2C dummy
execute align x align y align z if entity @a[x=909,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R2C 1

execute if entity @e[scores={Incorrect_R2C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R2C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R2C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R2C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R2C=1}] run title @a subtitle {"text":"That was not an OR gate", "color":"white"}
execute if entity @e[scores={Incorrect_R2C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: An OR gate has multiple inputs where any can turn on the output but all inputs must be unpowered for the output to be off. But you get to choose which input you'd like to turn on!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R2C=1}] run setblock 918 68 1128 air
execute if entity @e[scores={Incorrect_R2C=2}] run setblock 918 68 1128 lever[face=wall,facing=west,powered=false]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 924 68 1128 air
execute if entity @e[scores={Incorrect_R2C=2}] run setblock 924 68 1128 lever[face=wall,facing=east,powered=false]

execute if entity @e[scores={Incorrect_R2C=1}] run setblock 915 67 1113 ender_chest[facing=east]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 915 68 1113 ender_chest[facing=east]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1113 ender_chest[facing=east]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1113 ender_chest[facing=east]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1116 ender_chest[facing=north]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1116 ender_chest[facing=north]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1119 ender_chest[facing=north]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1119 ender_chest[facing=north]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1122 ender_chest[facing=north]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1122 ender_chest[facing=north]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1125 ender_chest[facing=north]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1125 ender_chest[facing=north]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 67 1128 ender_chest[facing=north]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 912 68 1128 ender_chest[facing=north]
execute if entity @e[scores={Incorrect_R2C=1}] run setblock 915 67 1128 ender_chest[facing=west]
#execute if entity @e[scores={Incorrect_R2C=1}] run setblock 915 68 1128 ender_chest[facing=west]


# TOO LAXY TO FIX
fill 921 60 1115 921 62 1117 glass_pane replace air



effect give @a[tag=WrongAnswer] resistance 2 255 true

scoreboard objectives add R2CPickaxe dummy
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:wooden_pickaxe"}]}] R2CPickaxe
execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ red_nether_bricks run scoreboard players add @s[nbt=!{Inventory:[{id:"minecraft:wooden_pickaxe"}]}] R2CPickaxe 1

give @a[tag=WrongAnswer,scores={R2CPickaxe=5..}] wooden_pickaxe{HideFlags:2,Unbreakable:true,CanDestroy:["minecraft:ender_chest"],display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Bargain Bin Pickaxe\"}",Lore:['{"text":"The one thing worse than mining Obsidian...","italic":"true","color":"green"}']}}

execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ red_concrete run clear @s wooden_pickaxe
execute as @a[tag=WrongAnswer] at @s if block ~ ~-1 ~ white_concrete run clear @s wooden_pickaxe


kill @e[nbt={Item:{id:"minecraft:wooden_pickaxe"}}]



execute align x align y align z run teleport @a[x=910,y=58,z=1111,dx=10,dy=2,dz=20] 919 67 1113 90 0
execute align x align y align z run teleport @a[x=922,y=58,z=1111,dx=10,dy=2,dz=20] 923 67 1113 270 0


execute if entity @e[scores={Incorrect_R2C=80..}] if block 921 68 1128 redstone_lamp[lit=true] run teleport @a[tag=WrongAnswer] 1000 67 1023 90 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=909,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives add R2C_End dummy
execute align x align y align z if entity @a[x=909,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives remove R2C_End
execute align x align y align z unless entity @a[x=909,y=54,z=1109,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R2C_End 1

execute if entity @e[scores={R2C_End=25..}] run clear @a
execute if entity @e[scores={R2C_End=25..}] run scoreboard objectives remove R2CPickaxe
execute if entity @e[scores={R2C_End=25..}] run scoreboard objectives remove Incorrect_R2C
execute if entity @e[scores={R2C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R2C_End=25..}] run scoreboard objectives remove R2C_End