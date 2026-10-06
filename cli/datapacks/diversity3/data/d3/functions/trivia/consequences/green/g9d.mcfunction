####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018 / JULY 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1068 69 995

#scoreboard objectives setdisplay sidebar Incorrect_G9D
#scoreboard objectives setdisplay sidebar G9DThief
#scoreboard objectives setdisplay sidebar G9DTrader
#scoreboard objectives setdisplay sidebar G9DHulk

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=904,dx=29,dy=24,dz=29] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 1 true

scoreboard objectives add Incorrect_G9D dummy
execute align x align y align z if entity @a[x=1215,y=54,z=904,dx=29,dy=24,dz=29] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G9D 1

execute if entity @e[scores={Incorrect_G9D=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_G9D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G9D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G9D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G9D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G9D=1}] run title @a subtitle {"text":"A Fess is not a diagonal stripe", "color":"white"}
execute if entity @e[scores={Incorrect_G9D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: A diagonal left to right stripe is known as a \"Bend\" pattern. You seem to like that pattern. That Salesman likely has one for sale.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G9D=1}] run tag @a remove G9DThief
execute if entity @e[scores={Incorrect_G9D=1}] run scoreboard objectives remove G9DHulk
execute if entity @e[scores={Incorrect_G9D=1}] run scoreboard objectives remove G9DThief
execute if entity @e[scores={Incorrect_G9D=1}] run scoreboard objectives remove G9DTrader
#execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1228 55 906 quartz_pillar[axis=y]
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1243 56 920 iron_door[facing=north,half=lower,hinge=left,open=true,powered=true]
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1243 57 920 iron_door[facing=north,half=upper,hinge=left,open=true,powered=true]
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1242 57 920 air
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1242 57 919 chiseled_quartz_block
execute if entity @e[scores={Incorrect_G9D=1}] run fill 1242 56 921 1242 57 921 chiseled_quartz_block
execute if entity @e[scores={Incorrect_G9D=2}] run setblock 1242 57 920 oak_wall_sign[facing=west]{Text1: "{\"text\":\"Diversity 2\"}", Text2: "{\"text\":\"- CLOSED -\"}", Text3: "{\"text\":\"due to Mojang\"}", Text4: "{\"text\":\"\\\"improvements\\\"\"}"}

execute if entity @e[scores={Incorrect_G9D=1}] as @e[tag=G9DHulk] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1242 56 920 air
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1219 57 930 lever[face=floor,facing=east,powered=false]
#execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1223 55 932 air
#execute if entity @e[scores={Incorrect_G9D=2}] run setblock 1223 55 932 chest[facing=west]{CustomName:"{\"text\":\"Wayne's Stash\"}", Items: [{Slot: 0b, id: "minecraft:emerald", Count: 59b}, {Slot: 2b, id: "minecraft:emerald", Count: 6b}, {Slot: 5b, id: "minecraft:emerald", Count: 64b}, {Slot: 8b, id: "minecraft:bread", Count: 28b}, {Slot: 10b, id: "minecraft:emerald", Count: 4b}, {Slot: 12b, id: "minecraft:emerald", Count: 5b}, {Slot: 13b, id: "minecraft:emerald", Count: 3b}, {Slot: 15b, id: "minecraft:emerald", Count: 35b}, {Slot: 18b, id: "minecraft:white_banner", Count: 10b}, {Slot: 19b, id: "minecraft:white_banner", Count: 3b}, {Slot: 20b, id: "minecraft:lapis_lazuli", Count: 15b}, {Slot: 25b, id: "minecraft:emerald", Count: 11b}]}
execute if entity @e[scores={Incorrect_G9D=1}] run setblock 1223 57 932 air
execute if entity @e[scores={Incorrect_G9D=2}] run setblock 1223 57 932 chest[facing=west]{CustomName:"{\"text\":\"Wayne's Stash\"}", Items: [{Slot: 0b, id: "minecraft:emerald", Count: 59b}, {Slot: 2b, id: "minecraft:emerald", Count: 6b}, {Slot: 5b, id: "minecraft:emerald", Count: 64b}, {Slot: 8b, id: "minecraft:bread", Count: 28b}, {Slot: 10b, id: "minecraft:emerald", Count: 4b}, {Slot: 12b, id: "minecraft:emerald", Count: 5b}, {Slot: 13b, id: "minecraft:emerald", Count: 3b}, {Slot: 15b, id: "minecraft:emerald", Count: 35b}, {Slot: 18b, id: "minecraft:white_banner", Count: 10b}, {Slot: 19b, id: "minecraft:white_banner", Count: 3b}, {Slot: 20b, id: "minecraft:lapis_lazuli", Count: 15b}, {Slot: 25b, id: "minecraft:emerald", Count: 11b}]}

execute if entity @e[scores={Incorrect_G9D=1}] as @e[tag=G9DSalesman] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G9D=5}] run summon villager 1221 56 929 {CustomName:"{\"text\":\"Wayne\"}",Invulnerable:true,Rotation:[180f,0f],Tags:["G9DSalesman1","G9DSalesman"],VillagerData:{profession:"minecraft:mason",type:"minecraft:taiga",level:6},Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Offers: {Recipes: [{maxUses: 1, buy: {id: "minecraft:emerald", Count: 12b}, sell: {id: "minecraft:white_banner", Count: 1b, tag: {display:{Lore:["This is the last one left for sale"]},BlockEntityTag:{Patterns:[{Pattern:"drs",Color:11}]},G9DBanner:1b}}, uses: 0, rewardExp: 0b}]}, Team:G9D}

execute if entity @e[scores={Incorrect_G9D=1}] run team add G9D

scoreboard objectives add G9DThief minecraft.custom:minecraft.open_chest
scoreboard players add @a G9DThief 0
execute at @e[scores={G9DThief=1}] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["G9DThiefAEC"]}
execute if entity @e[scores={G9DThief=1}] run scoreboard players add @a[scores={G9DThief=0}] G9DThief 100
execute at @a[scores={G9DThief=1..99}] if entity @e[tag=G9DThiefAEC,distance=0.5..] run tellraw @a[tag=WrongAnswer] ["",{"text":"<Wayne> What was that noise?","color":"white","bold":false}]
execute at @a[scores={G9DThief=1..99}] if entity @e[tag=G9DThiefAEC,distance=0.5..] run tag @a[scores={G9DThief=1..99}] add G9DThief
execute at @a[scores={G9DThief=1..99}] if entity @e[tag=G9DThiefAEC,distance=0.5..] run kill @e[tag=G9DThiefAEC]
scoreboard players add @a[scores={G9DThief=1}] G9DThief 1

execute as @e[tag=G9DSalesman] at @s run teleport @s ^ ^ ^ facing entity @p[tag=G9DThief] eyes

scoreboard objectives add G9DTrader minecraft.custom:minecraft.traded_with_villager
execute if entity @a[scores={G9DTrader=1}] run scoreboard players add @a G9DThief 200
execute if entity @a[scores={G9DTrader=1}] run tag @a remove G9DThief
execute if entity @a[scores={G9DTrader=1}] at @e[tag=G9DSalesman1] run summon villager ~ ~ ~ {CustomName:"{\"text\":\"Wayne\"}",Invulnerable:true,Rotation:[180f,0f],Tags:["G9DSalesman2","G9DSalesman"],VillagerData:{profession:"minecraft:mason",type:"minecraft:taiga",level:6},Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}], Offers: {}, Silent:true, Team:G9D}
execute if entity @a[scores={G9DTrader=1..2}] at @e[tag=G9DSalesman1] run teleport @e[tag=G9DSalesman2] ~ ~ ~ ~ ~
execute if entity @a[scores={G9DTrader=3}] as @e[tag=G9DSalesman1] at @s run teleport @s ~ ~-100 ~
scoreboard players add @a[scores={G9DTrader=1..}] G9DTrader 1

execute if entity @a[scores={G9DTrader=100}] run tellraw @a[tag=WrongAnswer] ["",{"text":"<Wayne> Thank you for your purchase. Here is a free Easter Egg gift just for you. Today's special. Have a nice day :)","color":"white","bold":false}]
give @p[x=1221,y=56,z=929,scores={G9DTrader=170}] heavy_weighted_pressure_plate{CanPlaceOn:["minecraft:iron_door"],display:{Name:"{\"text\":\"Diversity 2 Conversion Plate\",\"italic\":\"false\"}",Lore:['{"text":"Magically runs 1.8 Minecraft maps in 1.14","italic":"true","color":"green"}']}}




# HULK ARRIVES
execute if entity @a[scores={G9DTrader=40..}] if entity @a[x=1237,y=56,z=918,dx=5,dy=3,dz=4] run scoreboard objectives add G9DHulk dummy
scoreboard players add @e[tag=MainTriviaAEC] G9DHulk 1
execute if entity @e[scores={G9DHulk=1}] run kill @e[tag=G9DHulk]
execute if entity @e[scores={G9DHulk=1}] run summon creeper 1243 56 920 {Fuse:0}
execute if entity @e[scores={G9DHulk=2}] run playsound minecraft:entity.zombie.break_wooden_door master @a 1242 56 920 1 1 0
execute if entity @e[scores={G9DHulk=2}] run setblock 1243 56 920 air destroy
execute if entity @e[scores={G9DHulk=2}] run setblock 1242 57 919 air destroy
execute if entity @e[scores={G9DHulk=2}] run fill 1242 56 921 1242 57 921 air destroy


execute if entity @e[scores={G9DHulk=2}] run summon zombie_villager 1243 56 920 {Silent:true, CustomName:"{\"text\":\"THE HULK\"}", CustomNameVisible:true, IsBaby:false, Invulnerable:true, HandItems:[{id:"minecraft:oak_sign", Count:1b, tag:{Enchantments:[{id:"minecraft:knockback",lvl:10}]}}], ArmorItems:[{},{},{},{id:"minecraft:stone_button", Count:1b}], Rotation:[90f,0f], Motion:[-1.0d,0.1d,0.0d] ,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:2}, Tags:["G9DHulk"], Team:G9D}

effect give @e[tag=G9DHulk] strength 100 19 true
effect give @e[tag=G9DHulk] speed 100 3 true

execute if entity @e[scores={G9DHulk=10}] run tellraw @a[tag=WrongAnswer] ["",{"text":"<HULK> ","color":"dark_green","bold":false},{"text":"HULK SMASH BANNER!!!!","color":"none","bold":false,"underlined":false}]


# PREVENT STUCK IN PICNIC TABLE
execute as @a[x=1223.5,y=56.0,z=913.0,dx=0,dy=0,dz=0.5] at @s run teleport @s ~0.1 ~0.6 ~0.1



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=904,dx=29,dy=24,dz=29] run scoreboard objectives add G9D_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=904,dx=29,dy=24,dz=29] run scoreboard objectives remove G9D_End
execute align x align y align z unless entity @a[x=1215,y=54,z=904,dx=29,dy=24,dz=29] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G9D_End 1

execute if entity @e[scores={G9D_End=25..}] run kill @e[tag=G9DHulk]
execute if entity @e[scores={G9D_End=25..}] run kill @e[tag=G9DSalesman]
execute if entity @e[scores={G9D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G9D_End=25..}] run clear @a
execute if entity @e[scores={G9D_End=25..}] run scoreboard objectives remove G9DThief
execute if entity @e[scores={G9D_End=25..}] run scoreboard objectives remove G9DTrader
execute if entity @e[scores={G9D_End=25..}] run scoreboard objectives remove G9DHulk
execute if entity @e[scores={G9D_End=25..}] run scoreboard objectives remove Incorrect_G9D
execute if entity @e[scores={G9D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G9D_End=25..}] run scoreboard objectives remove G9D_End
