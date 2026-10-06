####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

difficulty hard

spawnpoint @a 1023 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G2C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=54,z=1037,dx=24,dy=44,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G2C dummy
execute align x align y align z if entity @a[x=1095,y=34,z=1037,dx=24,dy=44,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G2C 1

execute if entity @e[scores={Incorrect_G2C=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_G2C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G2C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G2C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G2C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G2C=1}] run title @a subtitle {"text":"Mining diamond ore earns you 3-7 XP", "color":"white"}
execute if entity @e[scores={Incorrect_G2C=80}] run tellraw @a ["",{"text":"[X] INCORRECT: Diamond ore gives you max of 7 XP. Looks like you could use some experience in mining.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G2C=1}] run execute align x align y align z run kill @e[type=item,x=1095,y=34,z=1037,dx=24,dy=44,dz=24]
execute if entity @e[scores={Incorrect_G2C=1}] run gamerule doTileDrops true
execute if entity @e[scores={Incorrect_G2C=1}] run setblock 1107 57 1049 diamond_ore
execute if entity @e[scores={Incorrect_G2C=1}] run setblock 1107 58 1049 obsidian
execute if entity @e[scores={Incorrect_G2C=1}] run setblock 1107 60 1055 stone
execute if entity @e[scores={Incorrect_G2C=2}] run setblock 1107 60 1055 chest[facing=north]{Items:[{Slot: 11b, id: "minecraft:diamond_pickaxe", Count: 1b, tag: {HideFlags:6, Unbreakable:true,CanDestroy: ["minecraft:obsidian","minecraft:diamond_ore"]}}, {Slot: 13b, id: "minecraft:diamond_pickaxe", Count: 1b, tag: {HideFlags:6, Unbreakable:true,CanDestroy: ["minecraft:obsidian","minecraft:diamond_ore"]}}, {Slot: 15b, id: "minecraft:diamond_pickaxe", Count: 1b, tag: {HideFlags:6, Unbreakable:true,CanDestroy: ["minecraft:obsidian","minecraft:diamond_ore"]}}]}


execute if entity @e[scores={Incorrect_G2C=10..}] if block 1107 57 1049 air at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {CustomName:"{\"text\":\"being greedy\",\"color\":\"white\"}",Fuse:0,powdered:1}
execute if entity @e[scores={Incorrect_G2C=10..}] if block 1107 57 1049 air at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {CustomName:"{\"text\":\"being greedy\",\"color\":\"white\"}",Fuse:0,powdered:1}
execute if entity @e[scores={Incorrect_G2C=10..}] if block 1107 57 1049 air at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {CustomName:"{\"text\":\"being greedy\",\"color\":\"white\"}",Fuse:0,powdered:1}
execute if entity @e[scores={Incorrect_G2C=10..}] if block 1107 57 1049 air at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {CustomName:"{\"text\":\"being greedy\",\"color\":\"white\"}",Fuse:0,powdered:1}
execute if entity @e[scores={Incorrect_G2C=10..}] if block 1107 57 1049 air run setblock 1107 57 1049 diamond_ore
execute if entity @e[type=experience_orb] run kill @e[type=experience_orb]



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=34,z=1037,dx=24,dy=44,dz=24] run scoreboard objectives add G2C_End dummy
execute align x align y align z if entity @a[x=1095,y=34,z=1037,dx=24,dy=44,dz=24] run scoreboard objectives remove G2C_End
execute align x align y align z unless entity @a[x=1095,y=34,z=1037,dx=24,dy=44,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G2C_End 1

execute if entity @e[scores={G2C_End=25..}] run gamerule doTileDrops false
execute if entity @e[scores={G2C_End=25..}] run clear @a
execute if entity @e[scores={G2C_End=25..}] run scoreboard objectives remove Incorrect_G2C
execute if entity @e[scores={G2C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G2C_End=25..}] run scoreboard objectives remove G2C_End