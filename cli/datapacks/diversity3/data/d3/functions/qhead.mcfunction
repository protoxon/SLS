####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2018 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar qHeadTimer

#tag @a add InKwaIslands

execute if block 1 2 4 redstone_block run setblock 1 2 4 clay

execute if block 1 4 2 white_terracotta align x align y align z if entity @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] run scoreboard objectives add qHeadTimer dummy
execute if block 1 4 2 white_terracotta align x align y align z if entity @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] run scoreboard players add @e[tag=MainHubAEC] qHeadTimer 0
#execute if block 1 4 2 white_terracotta align x align y align z if entity @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] run scoreboard players add @e[scores={qHeadTimer=0..400}] qHeadTimer 1
scoreboard players add @e[scores={qHeadTimer=0..2000}] qHeadTimer 1

execute if entity @e[scores={qHeadTimer=1}] run setblock 5 247 995 structure_block[mode=load]{name:"qhead",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:-1,posY:0,posZ:-1,id:"minecraft:structure_block",sizeX:10,sizeY:8,sizeZ:10}
execute if entity @e[scores={qHeadTimer=1}] run setblock 5 248 995 redstone_block

tag @a remove InsideQ
execute if block 1 4 2 white_terracotta align x align y align z run tag @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] add InsideQ
execute if entity @e[scores={qHeadTimer=0..1140}] run teleport @a[tag=!InsideQ] 9.0 250 996 0 0

#execute if entity @e[scores={qHeadTimer=1..}] run execute unless block 8 254 998 air run setblock 8 254 998 air
#execute if entity @e[scores={qHeadTimer=1..10}] run execute unless entity @e[tag=FakeHeadBlock1] run summon falling_block 8 254 998 {BlockState:{Name:"minecraft:dirt"},Tags:["FakeHeadBlock1"],NoGravity:true,DropItem:false,Time:-2147483648}
#execute if entity @e[scores={qHeadTimer=1..10}] run execute unless entity @e[tag=FakeHeadBlock2] run summon falling_block 8 247 998 {BlockState:{Name:"minecraft:white_terracotta"},Tags:["FakeHeadBlock2"],NoGravity:true,DropItem:false,Time:-2147483648}

execute if entity @e[scores={qHeadTimer=1}] run setblock 2 34 2 redstone_block

execute if entity @e[scores={qHeadTimer=2}] run playsound ambient.cave master @a 8 250 998 2 0.5 1
#execute if entity @e[scores={qHeadTimer=2}] run playsound music.under_water ambient @a 8 250 998 1 1 1

execute if entity @e[scores={qHeadTimer=0..1240}] run particle mycelium 9.0 250 999.0 4 4 4 1 100 force

execute if entity @e[scores={qHeadTimer=1}] run effect clear @a levitation
execute if entity @e[scores={qHeadTimer=1}] run effect give @a resistance 10 255 true
execute if entity @e[scores={qHeadTimer=4}] run effect clear @a slowness
execute if entity @e[scores={qHeadTimer=4}] run playsound music.under_water master @a 8 250 998 0.5 1 0.5
execute if entity @e[scores={qHeadTimer=10}] run effect clear @a night_vision
execute if entity @e[scores={qHeadTimer=10}] run effect clear @a blindness
#execute if entity @e[scores={qHeadTimer=30}] run effect give @a night_vision 58 255 true


execute if entity @e[scores={qHeadTimer=100}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qmagnet","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"Stranger...","color":"none","obfuscated":true,"underlined":false}]

execute if entity @e[scores={qHeadTimer=220}] run tellraw @a ["",{"text":"<q","color":"white","bold":false},{"text":"magnet","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"Stranger...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={qHeadTimer=340}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"q","obfuscated":"true","color":"white"},{"text":"m","color":"white"},{"text":"agnet","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"You are a long way from home.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={qHeadTimer=460}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qm","obfuscated":"true","color":"white"},{"text":"a","color":"white"},{"text":"gnet","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"But I feel a connection with you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={qHeadTimer=580}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qma","obfuscated":"true","color":"white"},{"text":"g","color":"white"},{"text":"net","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"Do you feel it also?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={qHeadTimer=700}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qmag","obfuscated":"true","color":"white"},{"text":"n","color":"white"},{"text":"et","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"This place is ","color":"none","bold":false,"underlined":false},{"text":"The Kwa1 Islands.","obfuscated":"true","color":"white"}]

execute if entity @e[scores={qHeadTimer=820}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qmagn","obfuscated":"true","color":"white"},{"text":"e","color":"white"},{"text":"t","obfuscated":"true","color":"white"},{"text":"> ","color":"white"},{"text":"The Monument must be completed.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={qHeadTimer=1060}] run tellraw @a ["",{"text":"<","color":"white","bold":false},{"text":"qmagne","obfuscated":"true","color":"white"},{"text":"t","color":"white"},{"text":"> ","color":"white"},{"text":"You must find the Wool, and insert it into the chest...","color":"none","bold":false,"underlined":false}]


# FLOATING WOOL
execute if entity @e[scores={qHeadTimer=1030}] run kill @e[tag=qHeadWool]
execute if entity @e[scores={qHeadTimer=1030}] run playsound entity.item.pickup master @a 9.0 255 999.0 1 1 0
execute if entity @e[scores={qHeadTimer=1030}] run setblock 11 251 996 redstone_torch[lit=true]
execute if entity @e[scores={qHeadTimer=1030}] run setblock 11 251 1001 redstone_torch[lit=true]
execute if entity @e[scores={qHeadTimer=1030}] run setblock 6 251 1001 redstone_torch[lit=true]
execute if entity @e[scores={qHeadTimer=1030}] run setblock 6 251 996 redstone_torch[lit=true]

execute if entity @e[scores={qHeadTimer=1030}] run summon item 8.52 251 1000 {Item:{id:"minecraft:orange_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 7.8 251 999.9 {Item:{id:"minecraft:yellow_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 7.5 251 999.0 {Item:{id:"minecraft:lime_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 7.8 251 998.1 {Item:{id:"minecraft:pink_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 8.52 251 997.5 {Item:{id:"minecraft:cyan_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}

execute if entity @e[scores={qHeadTimer=1030}] run summon item 9.48 251 997.5 {Item:{id:"minecraft:purple_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 10.2 251 998.1 {Item:{id:"minecraft:blue_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 10.5 251 999.0 {Item:{id:"minecraft:brown_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 10.2 251 999.9 {Item:{id:"minecraft:red_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}
execute if entity @e[scores={qHeadTimer=1030}] run summon item 9.48 251 1000.5 {Item:{id:"minecraft:black_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["qHeadWool"]}


# EXPLOSION
execute if entity @e[scores={qHeadTimer=1250}] run stopsound @a
execute if entity @e[scores={qHeadTimer=1237}] run effect clear @a
execute if entity @e[scores={qHeadTimer=1250}] run playsound entity.generic.explode master @a 8 250 998 2 1 1
execute if entity @e[scores={qHeadTimer=1250}] run particle explosion_emitter 9.0 250 999.0 1 1 1 1 10 force
execute if entity @e[scores={qHeadTimer=1251}] run particle block white_terracotta 9.0 250 999.0 3 3 3 0 1000 force
execute if entity @e[scores={qHeadTimer=1251}] run particle block dirt 9.0 250 999.0 3 3 3 0 1000 force
execute if entity @e[scores={qHeadTimer=1251}] run particle block black_wool 9.0 258 999.0 3 3 3 0 500 force
execute if entity @e[scores={qHeadTimer=1251}] run particle block spruce_log 9.0 250 999.0 3 3 3 0 500 force
execute if entity @e[scores={qHeadTimer=1250}] run execute align x align y align z as @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] at @s run teleport @s ~ ~1 ~
execute if entity @e[scores={qHeadTimer=1250}] run fill 4 247 994 13 254 1003 air
execute if entity @e[scores={qHeadTimer=1250}] run kill @e[tag=FakeHeadBlock1]
execute if entity @e[scores={qHeadTimer=1250}] run kill @e[tag=FakeHeadBlock2]
execute if entity @e[scores={qHeadTimer=1250}] run spawnpoint @a 8 88 998
execute if entity @e[scores={qHeadTimer=1250}] run execute align x align y align z run effect give @a[x=6,y=248,z=996,dx=5,dy=5,dz=5] resistance 7 255 true

execute if entity @e[scores={qHeadTimer=1255}] run title @a times 20 40 20
execute if entity @e[scores={qHeadTimer=1255}] run title @a title {"text":"qmagnet presents...","bold":false,"color":"white"}

execute if entity @e[scores={qHeadTimer=1310}] run kill @e[tag=qHeadWool]

execute if entity @e[scores={qHeadTimer=1340}] run playsound entity.elder_guardian.ambient master @a 8 87 998 1 0.5 1
execute if entity @e[scores={qHeadTimer=1340}] run playsound entity.zombie_villager.converted master @a 8 87 998 1 0.5 1
#execute if entity @e[scores={qHeadTimer=1340}] run playsound entity.wither.spawn ambient @a 8 87 998 1 0.5 1

execute if entity @e[scores={qHeadTimer=1340}] run title @a times 40 210 40
execute if entity @e[scores={qHeadTimer=1340}] run title @a title {"text":"D I V E R S I T Y  3","bold":true,"color":"dark_purple"}
#execute if entity @e[scores={qHeadTimer=1340}] run title @a subtitle {"text":"- Bring in the Wool -", "color":"white"}


execute if entity @e[scores={qHeadTimer=1345..}] run setblock 1 2 7 clay
execute if entity @e[scores={qHeadTimer=1345..}] run setblock 1 4 2 stone_bricks
execute if entity @e[scores={qHeadTimer=1345..}] run scoreboard players reset @a Speedrunner
execute if entity @e[scores={qHeadTimer=1345..}] run scoreboard objectives remove qHeadTimer