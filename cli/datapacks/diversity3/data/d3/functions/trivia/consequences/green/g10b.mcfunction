####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1075 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G10B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G10B dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G10B 1

execute if entity @e[scores={Incorrect_G10B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G10B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G10B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G10B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G10B=1}] run title @a subtitle {"text":"That's not the first line of the End Poem", "color":"white"}
execute if entity @e[scores={Incorrect_G10B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: That line is in the poem, but it's not the first line. Now you better find the difference between the two rooms so you can wake up out of this consequence.","color":"red","bold":false}]


# SETUP ROOMS
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1226 57 1055 flower_pot
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1228 57 1055 potted_allium

execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1226 57 1052 potted_pink_tulip
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1228 57 1052 potted_pink_tulip

##execute if entity @e[scores={Incorrect_G10B=1}] run fill 1226 58 1052 1226 58 1055 birch_trapdoor[facing=west,half=top,open=false]
execute if entity @e[scores={Incorrect_G10B=1}] run fill 1228 58 1052 1228 58 1055 birch_trapdoor[facing=east,half=top,open=false]

##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1220 56 1048 spruce_trapdoor[facing=east,half=top,open=false]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1234 56 1048 spruce_trapdoor[facing=west,half=top,open=false]

##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1221 58 1048 spruce_trapdoor[facing=west,half=top,open=true]
##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1223 58 1048 spruce_trapdoor[facing=east,half=top,open=true]
##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1221 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false]
##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1221 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=false]
##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1223 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false]
##execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1223 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=false]

execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1231 58 1048 spruce_trapdoor[facing=west,half=top,open=true]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1233 58 1048 spruce_trapdoor[facing=east,half=top,open=true]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1231 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1231 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=false]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1233 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false]
execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1233 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=false]

execute if entity @e[scores={Incorrect_G10B=3}] run kill @e[tag=G10BBedroomEntity]

execute if entity @e[scores={Incorrect_G10B=3}] run summon item_frame 1224 56 1054 {Silent:true, Facing: 4b, ItemRotation: 4b, Invulnerable: true, Item: {id: "minecraft:spruce_stairs", Count: 1b}, Tags:["G10BStairFrame1","G10BBedroomEntity"]}
execute if entity @e[scores={Incorrect_G10B=3}] run summon item_frame 1230 56 1054 {Silent:true, Facing: 5b, ItemRotation: 4b, Invulnerable: true, Item: {id: "minecraft:spruce_stairs", Count: 1b}, Tags:["G10BStairFrame2","G10BBedroomEntity"]}

execute if entity @e[scores={Incorrect_G10B=3}] run summon item_frame 1222 58 1049 {Silent:true, Facing: 3b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:clock", Count: 1b}, Tags:["G10BClockFrame1","G10BBedroomEntity"]}
execute if entity @e[scores={Incorrect_G10B=3}] run summon item_frame 1232 58 1049 {Silent:true, Facing: 3b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:clock", Count: 1b}, Tags:["G10BClockFrame2","G10BBedroomEntity"]}

execute if entity @e[scores={Incorrect_G10B=3}] run summon armor_stand 1222.521 57.0 1048.13 {Small:true, NoGravity:true, Invisible:true, ShowArms:true, Invulnerable:true, HandItems:[{id:"minecraft:gold_block",Count:1b}], Pose:{RightArm:[345f,315f,0f]}, DisabledSlots:2039583, Tags:["G10BGoldAS1","G10BBedroomEntity"], Rotation:[0f,0f]}
execute if entity @e[scores={Incorrect_G10B=3}] run summon armor_stand 1222 56.85 1048.1 {NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:end_rod",Count:1b}], Pose:{Head:[120f,0f,0f]}, DisabledSlots:2039583, Tags:["G10BRodAS1","G10BBedroomEntity"], Rotation:[0f,0f]}

execute if entity @e[scores={Incorrect_G10B=3}] run summon armor_stand 1232.521 57.0 1048.13 {Small:true, NoGravity:true, Invisible:true, ShowArms:true, Invulnerable:true, HandItems:[{id:"minecraft:gold_block",Count:1b}], Pose:{RightArm:[345f,315f,0f]}, DisabledSlots:2039583, Tags:["G10BGoldAS2","G10BBedroomEntity"], Rotation:[0f,0f]}
execute if entity @e[scores={Incorrect_G10B=3}] run summon armor_stand 1232 56.85 1048.1 {NoGravity:true, Invisible:true, Invulnerable:true, ArmorItems:[{},{},{},{id:"minecraft:end_rod",Count:1b}], Pose:{Head:[120f,0f,0f]}, DisabledSlots:2039583, Tags:["G10BRodAS2","G10BBedroomEntity"], Rotation:[0f,0f]}


execute if entity @e[scores={Incorrect_G10B=1}] run setblock 1227 55 1047 air

execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1228 55 1044 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1229 55 1044 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1230 55 1044 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1228 55 1045 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1229 55 1045 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1230 55 1045 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1228 55 1046 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1229 55 1046 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={Incorrect_G10B=1}] run summon falling_block 1230 55 1046 {BlockState:{Name:"minecraft:spruce_planks"},Tags:["G10BFakeBlock","G10ABedroomEntity"],NoGravity:true,DropItem:false,Time:-2147483648}


# MIRROR CHANGES
execute if block 1228 57 1052 flower_pot unless block 1226 57 1052 flower_pot run setblock 1226 57 1052 flower_pot
execute if block 1228 57 1052 potted_pink_tulip unless block 1226 57 1052 potted_pink_tulip run setblock 1226 57 1052 potted_pink_tulip
execute if block 1228 57 1052 potted_allium unless block 1226 57 1052 potted_allium run setblock 1226 57 1052 potted_allium

execute if block 1228 58 1052 birch_trapdoor[facing=east,half=top,open=false] unless block 1226 58 1052 birch_trapdoor[facing=west,half=top,open=false] run setblock 1226 58 1052 birch_trapdoor[facing=west,half=top,open=false]
execute if block 1228 58 1052 birch_trapdoor[facing=east,half=top,open=true] unless block 1226 58 1052 birch_trapdoor[facing=west,half=top,open=true] run setblock 1226 58 1052 birch_trapdoor[facing=west,half=top,open=true]

execute if block 1228 58 1053 birch_trapdoor[facing=east,half=top,open=false] unless block 1226 58 1053 birch_trapdoor[facing=west,half=top,open=false] run setblock 1226 58 1053 birch_trapdoor[facing=west,half=top,open=false]
execute if block 1228 58 1053 birch_trapdoor[facing=east,half=top,open=true] unless block 1226 58 1053 birch_trapdoor[facing=west,half=top,open=true] run setblock 1226 58 1053 birch_trapdoor[facing=west,half=top,open=true]

execute if block 1228 58 1054 birch_trapdoor[facing=east,half=top,open=false] unless block 1226 58 1054 birch_trapdoor[facing=west,half=top,open=false] run setblock 1226 58 1054 birch_trapdoor[facing=west,half=top,open=false]
execute if block 1228 58 1054 birch_trapdoor[facing=east,half=top,open=true] unless block 1226 58 1054 birch_trapdoor[facing=west,half=top,open=true] run setblock 1226 58 1054 birch_trapdoor[facing=west,half=top,open=true]

execute if block 1228 58 1055 birch_trapdoor[facing=east,half=top,open=false] unless block 1226 58 1055 birch_trapdoor[facing=west,half=top,open=false] run setblock 1226 58 1055 birch_trapdoor[facing=west,half=top,open=false]
execute if block 1228 59 1055 birch_trapdoor[facing=east,half=top,open=true] unless block 1226 58 1055 birch_trapdoor[facing=west,half=top,open=true] run setblock 1226 58 1055 birch_trapdoor[facing=west,half=top,open=true]

execute if block 1234 56 1048 spruce_trapdoor[facing=west,half=top,open=false] unless block 1220 56 1048 spruce_trapdoor[facing=east,half=top,open=false] run setblock 1220 56 1048 spruce_trapdoor[facing=east,half=top,open=false]
execute if block 1234 56 1048 spruce_trapdoor[facing=west,half=top,open=true] unless block 1220 56 1048 spruce_trapdoor[facing=east,half=top,open=true] run setblock 1220 56 1048 spruce_trapdoor[facing=east,half=top,open=true]


execute if block 1231 58 1048 spruce_trapdoor[facing=west,half=top,open=true] unless block 1223 58 1048 spruce_trapdoor[facing=east,half=top,open=true] run setblock 1223 58 1048 spruce_trapdoor[facing=east,half=top,open=true]
execute if block 1231 58 1048 spruce_trapdoor[facing=west,half=top,open=false] unless block 1223 58 1048 spruce_trapdoor[facing=east,half=top,open=false] run setblock 1223 58 1048 spruce_trapdoor[facing=east,half=top,open=false]

execute if block 1233 58 1048 spruce_trapdoor[facing=east,half=top,open=true] unless block 1221 58 1048 spruce_trapdoor[facing=west,half=top,open=true] run setblock 1221 58 1048 spruce_trapdoor[facing=west,half=top,open=true]
execute if block 1233 58 1048 spruce_trapdoor[facing=east,half=top,open=false] unless block 1221 58 1048 spruce_trapdoor[facing=west,half=top,open=false] run setblock 1221 58 1048 spruce_trapdoor[facing=west,half=top,open=false]


execute if block 1231 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false] unless block 1223 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false] run setblock 1223 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false]
execute if block 1231 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false] unless block 1223 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false] run setblock 1223 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false]

execute if block 1231 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=true] unless block 1223 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=true] run setblock 1223 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=true]
execute if block 1231 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=true] unless block 1223 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=true] run setblock 1223 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=true]

execute if block 1233 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=false] unless block 1221 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false] run setblock 1221 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=false]
execute if block 1233 56 1048 spruce_door[facing=east,half=lower,hinge=left,open=true] unless block 1221 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=true] run setblock 1221 56 1048 spruce_door[facing=west,half=lower,hinge=right,open=true]

execute if block 1233 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=false] unless block 1221 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=false] run setblock 1221 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=false]
execute if block 1233 57 1048 spruce_door[facing=east,half=upper,hinge=left,open=true] unless block 1221 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=true] run setblock 1221 57 1048 spruce_door[facing=west,half=upper,hinge=right,open=true]

execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:0b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:1b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:1b}] run data merge entity @s {ItemRotation:1b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:2b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:2b}] run data merge entity @s {ItemRotation:2b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:3b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:3b}] run data merge entity @s {ItemRotation:3b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:4b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:4b}] run data merge entity @s {ItemRotation:4b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:5b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:5b}] run data merge entity @s {ItemRotation:5b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:6b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:6b}] run data merge entity @s {ItemRotation:6b}
execute if entity @e[tag=G10BStairFrame2,nbt={ItemRotation:7b}] as @e[tag=G10BStairFrame1,nbt=!{ItemRotation:7b}] run data merge entity @s {ItemRotation:7b}


execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:0b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:1b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:7b}] run data merge entity @s {ItemRotation:7b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:2b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:6b}] run data merge entity @s {ItemRotation:6b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:3b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:5b}] run data merge entity @s {ItemRotation:5b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:4b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:4b}] run data merge entity @s {ItemRotation:4b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:5b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:3b}] run data merge entity @s {ItemRotation:3b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:6b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:2b}] run data merge entity @s {ItemRotation:2b}
execute if entity @e[tag=G10BClockFrame2,nbt={ItemRotation:7b}] as @e[tag=G10BClockFrame1,nbt=!{ItemRotation:1b}] run data merge entity @s {ItemRotation:1b}








# FOR THE WIN
execute if entity @e[scores={Incorrect_G10B=5..}] if block 1228 57 1055 flower_pot if block 1227 55 1047 air run setblock 1227 55 1047 redstone_torch
execute if entity @e[scores={Incorrect_G10B=5..}] if block 1229 57 1040 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1075 67 1000 0 0
execute if block 1229 57 1040 stone_button[powered=true] run setblock 1229 57 1040 stone_button[face=floor,facing=north,powered=false]



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add G10B_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove G10B_End
execute align x align y align z unless entity @a[x=1215,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G10B_End 1

execute if entity @e[scores={G10B_End=25..}] run kill @e[tag=G10ABedroomEntity]
execute if entity @e[scores={G10B_End=25..}] run clear @a
execute if entity @e[scores={G10B_End=25..}] run scoreboard objectives remove Incorrect_G10B
execute if entity @e[scores={G10B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G10B_End=25..}] run scoreboard objectives remove G10B_End