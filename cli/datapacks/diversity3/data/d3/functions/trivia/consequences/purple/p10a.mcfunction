####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 30 2018 / FEBRUARY 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 71 985

#scoreboard objectives setdisplay sidebar Incorrect_P10A
#scoreboard objectives setdisplay sidebar P10AWin
#scoreboard objectives setdisplay sidebar P10A_MadeShears

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=758,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P10A dummy
execute align x align y align z if entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P10A 1

execute if entity @e[scores={Incorrect_P10A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P10A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P10A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P10A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P10A=1}] run title @a subtitle {"text":"Noobcrew didn't create Ant Farm Survival", "color":"white"}
execute if entity @e[scores={Incorrect_P10A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Ant Farm Survival was created by MGPlatinium. Now you'll have to tend to your Aunt's Farm to get back.","color":"red"}]

execute if entity @e[scores={Incorrect_P10A=1}] run gamerule doTileDrops true

execute if entity @e[scores={Incorrect_P10A=1}] run kill @e[tag=P10AASBook]
execute if entity @e[scores={Incorrect_P10A=1}] as @e[tag=P10AMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P10A=1}] as @e[type=!player,x=758,y=54,z=969,dx=24,dy=24,dz=24] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_P10A=1}] run summon armor_stand 777.3 57.2 987.3 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Darling,\\nNeed you to do a few chores while we're out.\\n\\n- Harvest and replant the wheat\\n- Milk Bessie\\n- Put a pie in the oven\\n\\nUncle Ben and I will be back before you know it. Luv u lots!\\n\\n- Aunt May\"}"],author:"Aunt May",title:"To Do"}}],Rotation:[270f,0f],Pose:{RightArm:[180f,270f,180f]},Tags:["P10AASBook"],Invulnerable:true,DisabledSlots:1973790}
kill @e[tag=P10AASBook,nbt=!{HandItems:[{Count:1b}]}]

execute if entity @e[scores={Incorrect_P10A=1}] run fill 759 63 974 759 63 975 air

execute if entity @e[scores={Incorrect_P10A=1}] run setblock 759 63 975 chest[facing=east,type=right]{Items: [{Slot: 0b, id: "minecraft:cobweb", Count: 1b}, {Slot: 7b, id: "minecraft:writable_book", Count: 1b}, {Slot: 12b, id: "minecraft:lead", Count: 3b}, {Slot: 15b, id: "minecraft:wooden_hoe", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, CanDestroy: ["minecraft:sugar_cane", "minecraft:wheat"]}}, {Slot: 17b, id: "minecraft:cobweb", Count: 1b}, {Slot: 19b, id: "minecraft:iron_ingot", Count: 3b}]}
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 759 63 974 chest[facing=east,type=left]{Items: [{Slot: 4b, id: "minecraft:lead", Count: 1b}, {Slot: 8b, id: "minecraft:saddle", Count: 1b}, {Slot: 9b, id: "minecraft:cobweb", Count: 1b}, {Slot: 14b, id: "minecraft:wooden_axe", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, CanDestroy: ["minecraft:pumpkin"]}}, {Slot: 16b, id: "minecraft:saddle", Count: 1b}, {Slot: 20b, id: "minecraft:fishing_rod", Count: 1b}, {Slot: 25b, id: "minecraft:leather_chestplate", Count: 1b}, {Slot: 26b, id: "minecraft:leather_leggings", Count: 1b}]}

execute if entity @e[scores={Incorrect_P10A=1}] run setblock 768 57 987 air
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 768 57 987 chest[facing=south]{Items: [{Slot: 0b, id: "minecraft:emerald", Count: 9b}, {Slot: 3b, id: "minecraft:clock", Count: 1b}, {Slot: 6b, id: "minecraft:allium", Count: 1b}, {Slot: 8b, id: "minecraft:leather_chestplate", Count: 1b}, {Slot: 10b, id: "minecraft:stone_shovel", Count: 1b}, {Slot: 14b, id: "minecraft:book", Count: 3b}, {Slot: 20b, id: "minecraft:emerald", Count: 4b}, {Slot: 25b, id: "minecraft:book", Count: 1b}, {Slot: 26b, id: "minecraft:leather_leggings", Count: 1b}]}





execute if entity @e[scores={Incorrect_P10A=1}] run setblock 777 58 991 air
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 777 57 991 air
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 777 57 991 furnace[facing=west]{CustomName:"{\"text\":\"Oven\"}"}
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 777 58 991 stone_pressure_plate

execute if entity @e[scores={Incorrect_P10A=1}] run fill 780 57 985 780 57 991 pumpkin

execute if entity @e[scores={Incorrect_P10A=1}] run fill 776 51 970 780 51 974 farmland
execute if entity @e[scores={Incorrect_P10A=1}] run fill 776 52 970 780 52 974 wheat[age=0]

execute if entity @e[scores={Incorrect_P10A=1}] run fill 776 56 970 780 56 974 farmland
fill 776 56 970 780 56 974 farmland replace dirt
execute if entity @e[scores={Incorrect_P10A=1}] run fill 776 57 970 780 57 974 wheat[age=7]

execute if entity @e[scores={Incorrect_P10A=1}] run fill 762 57 990 762 58 990 air
execute if entity @e[scores={Incorrect_P10A=1}] run fill 762 57 990 762 58 990 sugar_cane[age=0]
execute if entity @e[scores={Incorrect_P10A=1}] run fill 763 57 992 763 58 992 air
execute if entity @e[scores={Incorrect_P10A=1}] run fill 763 57 992 763 58 992 sugar_cane[age=0]
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 765 57 991 air
execute if entity @e[scores={Incorrect_P10A=1}] run setblock 765 57 991 sugar_cane[age=0]

execute if entity @e[scores={Incorrect_P10A=1}] run setblock 759 56 973 andesite

execute if entity @e[scores={Incorrect_P10A=5}] run summon horse 761 57 971 {Tags:["P10AHorse","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon cow 763 57 971 {Tags:["P10ACow","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon pig 765 57 971 {Tags:["P10APig","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon chicken 770 58 971 {Tags:["P10AChicken","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon chicken 771 58 971 {Tags:["P10AChicken","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon chicken 772 58 971 {Tags:["P10AChicken","P10AMob"]}
execute if entity @e[scores={Incorrect_P10A=5}] run summon item 772 57 971 {Item:{id:"minecraft:egg",Count:2b}}
execute if entity @e[scores={Incorrect_P10A=5}] run summon item 770 57 973 {Item:{id:"minecraft:egg",Count:3b}}

fill 759 58 983 767 69 977 spruce_trapdoor[facing=south,half=top,open=true] replace oak_trapdoor
fill 769 63 974 769 69 971 spruce_trapdoor[facing=east,half=top,open=true] replace oak_trapdoor
fill 768 58 985 770 58 985 spruce_trapdoor[facing=north,half=top,open=true] replace oak_trapdoor
fill 766 58 988 766 58 990 spruce_trapdoor[facing=west,half=top,open=true] replace oak_trapdoor
fill 779 58 986 779 58 990 spruce_trapdoor[facing=east,half=top,open=true] replace oak_trapdoor

execute align x align y align z run effect give @e[tag=P10AMob,x=758,y=54,z=969,dx=24,dy=24,dz=24] resistance 3 255 true


execute align x align y align z as @e[type=item,x=758,y=54,z=969,dx=24,dy=24,dz=24] run data merge entity @s {Age:-32768}

execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}},nbt=!{Item:{tag:{CanPlaceOn:["minecraft:farmland"],HideFlags:16}}}] run data merge entity @s {Item:{tag:{CanPlaceOn:["minecraft:farmland"],HideFlags:16}}}


# SHEARS FIX
execute align x align y align z if entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24,nbt={Inventory:[{id:"minecraft:shears"}]}] run scoreboard objectives add P10A_MadeShears dummy
scoreboard players add @e[tag=MainTriviaAEC] P10A_MadeShears 1
execute if entity @e[scores={P10A_MadeShears=10}] run tellraw @a ["",{"text":" You made shears?!","color":"red"}]
execute if entity @e[scores={P10A_MadeShears=80}] run tellraw @a ["",{"text":" Like, that's all the iron your aunt left you.","color":"red"}]
execute if entity @e[scores={P10A_MadeShears=170}] run tellraw @a ["",{"text":" Are you trying to break the map?","color":"red"}]
execute if entity @e[scores={P10A_MadeShears=270}] run tellraw @a ["",{"text":" You are, aren't you?","color":"red"}]
execute if entity @e[scores={P10A_MadeShears=370}] run tellraw @a ["",{"text":" In Aunt's Farm, you don't break map, map breaks you.","color":"red"}]
execute if entity @e[scores={P10A_MadeShears=500..510}] at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"trying to break the map\",\"color\":\"white\"}"}
execute if entity @e[scores={P10A_MadeShears=510}] run kill @a[tag=WrongAnswer]

# PLATE FIX
execute align x align y align z if entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24,nbt={Inventory:[{id:"minecraft:heavy_weighted_pressure_plate"}]}] run scoreboard objectives add P10A_MadePlate dummy
scoreboard players add @e[tag=MainTriviaAEC] P10A_MadePlate 1
execute if entity @e[scores={P10A_MadePlate=10}] run tellraw @a ["",{"text":" You made a pressure plate?!","color":"red"}]
execute if entity @e[scores={P10A_MadePlate=80}] run tellraw @a ["",{"text":" Like, that's all the iron your aunt left you.","color":"red"}]
execute if entity @e[scores={P10A_MadePlate=170}] run tellraw @a ["",{"text":" Are you trying to break the map?","color":"red"}]
execute if entity @e[scores={P10A_MadePlate=270}] run tellraw @a ["",{"text":" You are, aren't you?","color":"red"}]
execute if entity @e[scores={P10A_MadePlate=370}] run tellraw @a ["",{"text":" In Aunt's Farm, you don't break map, map breaks you.","color":"red"}]
execute if entity @e[scores={P10A_MadePlate=500..510}] at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"trying to break the map\",\"color\":\"white\"}"}
execute if entity @e[scores={P10A_MadePlate=510}] run kill @a[tag=WrongAnswer]





execute align x align y align z if entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24,nbt={Inventory:[{id:"minecraft:milk_bucket"}]}] if block 759 56 973 andesite run setblock 759 56 973 stone

execute if entity @e[scores={Incorrect_P10A=80..}] if block 759 56 973 stone if blocks 776 52 970 780 52 974 776 57 970 all if block 777 57 991 furnace{Items: [{Slot: 0b, id: "minecraft:pumpkin_pie"}]} run scoreboard objectives add P10AWin dummy

scoreboard players add @e[tag=MainTriviaAEC] P10AWin 1
execute if entity @e[scores={P10AWin=50..}] run teleport @a[tag=WrongAnswer] 925 67 1000 180 0




# END SAFEGUARD
execute align x align y align z unless entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add P10A_End dummy
execute align x align y align z if entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove P10A_End
execute align x align y align z unless entity @a[x=758,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P10A_End 1

execute if entity @e[scores={P10A_End=25..}] run clear @a
execute if entity @e[scores={P10A_End=25..}] run gamerule doTileDrops false
execute if entity @e[scores={P10A_End=25..}] run scoreboard objectives remove P10AWin
execute if entity @e[scores={P10A_End=25..}] run scoreboard objectives remove Incorrect_P10A
execute if entity @e[scores={P10A_End=25..}] run scoreboard objectives remove P10A_MadeShears
execute if entity @e[scores={P10A_End=25..}] run scoreboard objectives remove P10A_MadePlate
execute if entity @e[scores={P10A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P10A_End=25..}] run scoreboard objectives remove P10A_End