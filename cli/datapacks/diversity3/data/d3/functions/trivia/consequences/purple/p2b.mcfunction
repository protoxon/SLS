####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 2 2018 / JULY 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

difficulty hard

spawnpoint @a 977 71 995

#scoreboard objectives setdisplay sidebar Incorrect_P2B
#scoreboard objectives setdisplay sidebar P2BMineCoal
#scoreboard objectives setdisplay sidebar P2BMineStone
#scoreboard objectives setdisplay sidebar P2BWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=878,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P2B dummy
execute align x align y align z if entity @a[x=878,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P2B 1

execute if entity @e[scores={Incorrect_P2B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P2B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P2B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P2B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P2B=1}] run title @a subtitle {"text":"That's not the correct parody", "color":"white"}
execute if entity @e[scores={Incorrect_P2B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Don't Mine at Night, featured on BebopVox's YouTube channel, is a parody of \"Last Friday Night\" by Katy Perry. In this case, you'll have to mine in the dark to find the hidden diamonds.","color":"red"}]

execute if entity @e[scores={Incorrect_P2B=1}] run clone 878 26 969 902 50 993 878 54 969 masked
execute if entity @e[scores={Incorrect_P2B=10}] run setblock 881 62 984 air
execute if entity @e[scores={Incorrect_P2B=10}] run setblock 881 62 984 chest[facing=east]{Items: [{Slot: 11b, id: "minecraft:stone_pickaxe", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, CanDestroy: ["minecraft:coal_ore","minecraft:iron_ore","minecraft:andesite","minecraft:diorite","minecraft:granite","minecraft:stone","minecraft:diamond_ore"]}},{Slot: 13b, id: "minecraft:stone_pickaxe", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, CanDestroy: ["minecraft:coal_ore","minecraft:iron_ore","minecraft:andesite","minecraft:diorite","minecraft:granite","minecraft:stone","minecraft:diamond_ore"]}},{Slot: 15b, id: "minecraft:stone_pickaxe", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, CanDestroy: ["minecraft:coal_ore","minecraft:iron_ore","minecraft:andesite","minecraft:diorite","minecraft:granite","minecraft:stone","minecraft:diamond_ore"]}}]}

execute if entity @e[scores={Incorrect_P2B=1}] as @e[tag=P2BMob] at @s run teleport @s ~ ~-100 ~


scoreboard objectives add P2BMineStone minecraft.mined:minecraft.stone
scoreboard objectives add P2BMineCoal minecraft.mined:minecraft.coal_ore

execute if entity @a[scores={P2BMineStone=1}] run scoreboard objectives add P2BWin dummy
execute if entity @a[scores={P2BMineCoal=1}] run scoreboard objectives add P2BWin dummy

scoreboard players add @e[tag=MainTriviaAEC] P2BWin 1
execute if entity @e[scores={P2BWin=1}] run summon chicken 888 73 981 {Tags:["P2BChicken","P2BMob"],Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Passengers:[{id:"minecraft:zombie_villager",Rotation:[90f,0f],CustomName:"{\"text\":\"mining at night\",\"color\":\"white\"}",IsBaby:true,Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Tags:["P2BZombie","P2BMob"]}]}

execute if entity @e[scores={P2BWin=1}] run summon chicken 888 73 978 {Tags:["P2BChicken","P2BMob"],Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Passengers:[{id:"minecraft:zombie_villager",Rotation:[90f,0f],CustomName:"{\"text\":\"mining at night\",\"color\":\"white\"}",IsBaby:true,Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Tags:["P2BZombie","P2BMob"]}]}

execute if entity @e[scores={P2BWin=1}] run summon chicken 891 73 984 {Tags:["P2BChicken","P2BMob"],Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Passengers:[{id:"minecraft:zombie_villager",Rotation:[90f,0f],CustomName:"{\"text\":\"mining at night\",\"color\":\"white\"}",IsBaby:true,Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Tags:["P2BZombie","P2BMob"]}]}

execute if entity @e[scores={P2BWin=1}] run summon chicken 885 73 976 {Tags:["P2BChicken","P2BMob"],Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Passengers:[{id:"minecraft:zombie_villager",Rotation:[90f,0f],CustomName:"{\"text\":\"mining at night\",\"color\":\"white\"}",IsBaby:true,Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.3}],Tags:["P2BZombie","P2BMob"]}]}

effect give @e[tag=P2BMob] resistance 3 255 true
effect give @e[tag=P2BZombie] strength 3 8 true
effect give @e[tag=P2BZombie] invisibility 3 255 true

# END SAFEGUARD
execute align x align y align z unless entity @a[x=878,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add P2B_End dummy
execute align x align y align z if entity @a[x=878,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove P2B_End
execute align x align y align z unless entity @a[x=878,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P2B_End 1

execute if entity @e[scores={P2B_End=1..}] as @e[tag=P2BMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P2B_End=25..}] run clear @a
execute if entity @e[scores={P2B_End=25..}] run scoreboard objectives remove P2BMineCoal
execute if entity @e[scores={P2B_End=25..}] run scoreboard objectives remove P2BMineStone
execute if entity @e[scores={P2B_End=25..}] run scoreboard objectives remove P2BWin
execute if entity @e[scores={P2B_End=25..}] run scoreboard objectives remove Incorrect_P2B
execute if entity @e[scores={P2B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P2B_End=25..}] run scoreboard objectives remove P2B_End