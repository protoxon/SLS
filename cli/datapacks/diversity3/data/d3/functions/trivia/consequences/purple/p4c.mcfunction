####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 27 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 72 994

#scoreboard objectives setdisplay sidebar Incorrect_P4C
#scoreboard objectives setdisplay sidebar P4CWither

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=846,y=54,z=899,dx=28,dy=24,dz=34] add WrongAnswer

scoreboard objectives add Incorrect_P4C dummy
execute align x align y align z if entity @a[x=846,y=54,z=899,dx=28,dy=24,dz=34] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P4C 1

execute if entity @e[scores={Incorrect_P4C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P4C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P4C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P4C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P4C=1}] run title @a subtitle {"text":"Wither's Challenge is a Hypixel map", "color":"white"}
execute if entity @e[scores={Incorrect_P4C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Wither's Challenge is a 2013 Arena map by Hypixel. Now the Wither has challenged you to find its three skulls.","color":"red"}]

execute if entity @e[scores={Incorrect_P4C=1..100}] run effect give @a[tag=WrongAnswer] night_vision 1000000 255 true
effect clear @a[tag=!WrongAnswer] night_vision

execute if entity @e[scores={Incorrect_P4C=1}] run kill @e[tag=P4CAS]
execute if entity @e[scores={Incorrect_P4C=1}] run kill @e[tag=P4CWither]
execute if entity @e[scores={Incorrect_P4C=1}] run scoreboard objectives remove P4CWither

#execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 852.5 62.2 900.7 {Invisible:true,ShowArms:true,NoGravity:true,Rotation:[270f,0f],Small:true,Pose:{RightArm:[135f,270f,180f]},Tags:["P4CAS","P4CAS1"],HandItems:[{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true,DisabledSlots:1973790}

#execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 854 65.8 906 {Invisible:1b,NoGravity:true,Rotation:[180f,0f],Small:true,Tags:["P4CAS","P4CAS1"],ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:["1 of 3"]}}}],Invulnerable:true}

execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 856.5 62.3 908.1 {Invisible:1b,NoGravity:true,Rotation:[180f,0f],Small:true,Tags:["P4CAS","P4CAS1"],ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true}

#execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 870.8 66.3 914.7 {Invisible:true,ShowArms:true,NoGravity:true,Rotation:[90f,0f],Small:true,Pose:{RightArm:[190f,212f,45f]},Tags:["P4CAS","P4CAS2"],HandItems:[{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:["1 of 3"]}}}],Invulnerable:true,DisabledSlots:1973790}

execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 868.5 62.0 923.5 {Invisible:true,NoGravity:true,Rotation:[90f,0f],Small:true,Tags:["P4CAS","P4CAS3"],ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true}

#execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 852.1 62.6 918.9 {Invisible:true,ShowArms:true,NoGravity:true,Rotation:[70f,0f],Small:true,Pose:{RightArm:[135f,270f,180f]},Tags:["P4CAS","P4CAS3"],HandItems:[{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:["1 of 3"]}}}],Invulnerable:true,DisabledSlots:1973790}

execute if entity @e[scores={Incorrect_P4C=5}] run summon armor_stand 852.2 62.51 918.7 {Invisible:true,NoGravity:true,Rotation:[90f,0f],Small:true,Tags:["P4CAS","P4CAS3"],ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true}


execute if entity @e[scores={Incorrect_P4C=80..}] unless entity @e[tag=P4CAS] run scoreboard objectives add P4CWither dummy
scoreboard players add @e[tag=MainTriviaAEC] P4CWither 1
execute if entity @e[scores={P4CWither=1}] run playsound entity.wither.spawn master @a 851 63 916 1 1 1
execute if entity @e[scores={P4CWither=1}] run summon wither 851 63 916 {Rotation:[270f,0f],Tags:["P4CWither"]}



teleport @e[tag=P4CWither] 851 63 916

kill @e[tag=P4CAS1,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull"}]}]
kill @e[tag=P4CAS2,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull"}]}]
kill @e[tag=P4CAS3,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull"}]}]

execute if entity @e[tag=P4CWither,nbt={HurtTime:10s}] run scoreboard players set @e[tag=MainTriviaAEC] P4CWither -1000

kill @e[tag=P4CWither,nbt={HurtTime:10s}]

execute if entity @e[scores={P4CWither=-929}] run teleport @a[tag=WrongAnswer] 964 67 1000 180 0

execute if entity @e[scores={P4CWither=1..}] run effect give @a[tag=WrongAnswer] resistance 3 255 true

#execute as @e[tag=P4CAS] run data merge entity @s {Pose:{RightArm:[45f,180f,135f]}}






# END SAFEGUARD
execute align x align y align z unless entity @a[x=846,y=54,z=899,dx=28,dy=24,dz=34] run scoreboard objectives add P4C_End dummy
execute align x align y align z if entity @a[x=846,y=54,z=899,dx=28,dy=24,dz=34] run scoreboard objectives remove P4C_End
execute align x align y align z unless entity @a[x=846,y=54,z=899,dx=28,dy=24,dz=34] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P4C_End 1

execute if entity @e[scores={P4C_End=25..}] run clear @a
execute if entity @e[scores={P4C_End=25..}] run kill @e[tag=P4CWither]
execute if entity @e[scores={P4C_End=25..}] run scoreboard objectives remove P4CWither
execute if entity @e[scores={P4C_End=25..}] run scoreboard objectives remove Incorrect_P4C
execute if entity @e[scores={P4C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P4C_End=25..}] run scoreboard objectives remove P4C_End