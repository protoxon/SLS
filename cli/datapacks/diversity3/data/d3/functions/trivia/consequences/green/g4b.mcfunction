####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 29 2018 / APRIL 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1036 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G4B
#scoreboard objectives setdisplay sidebar G4BMusicDisc
#scoreboard objectives setdisplay sidebar G4BFinish

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G4B dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G4B 1

execute if entity @e[scores={Incorrect_G4B=1}] run stopsound @a
execute if entity @e[scores={Incorrect_G4B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G4B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G4B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G4B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G4B=1}] run title @a subtitle {"text":"Blue is not true", "color":"white"}
execute if entity @e[scores={Incorrect_G4B=100}] run tellraw @a ["",{"text":" [X] INCORRECT: The blue disc is titled \"wait\". Wait till you hear this one!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G4B=1}] run fill 1127 55 1039 1147 65 1059 air replace jukebox
execute if entity @e[scores={Incorrect_G4B=1}] run setblock 1144 61 1058 oak_fence
execute if entity @e[scores={Incorrect_G4B=1}] run setblock 1137 56 1049 packed_ice
execute if entity @e[scores={Incorrect_G4B=1}] run setblock 1137 57 1049 jukebox
execute if entity @e[scores={Incorrect_G4B=1}] run scoreboard objectives remove G4BFinish
execute if entity @e[scores={Incorrect_G4B=..15}] run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_wait"}}]

scoreboard objectives add G4BMusicDisc dummy
scoreboard players add @e[tag=MainTriviaAEC] G4BMusicDisc 1

execute if entity @e[nbt={Item:{id:"minecraft:music_disc_wait"}}] run scoreboard objectives remove G4BMusicDisc
execute if entity @e[scores={G4BFinish=1..}] run scoreboard objectives remove G4BMusicDisc
execute if entity @a[nbt={Inventory:[{id:"minecraft:music_disc_wait"}]}] run scoreboard objectives remove G4BMusicDisc
execute if entity @e[scores={Incorrect_G4B=120..,G4BMusicDisc=30..}] run give @p music_disc_wait{HideFlags:16, CanPlaceOn: ["minecraft:bedrock"]}


tag @a remove HasWaitDisc
tag @a[nbt={Inventory:[{id:"minecraft:music_disc_wait"}]}] add HasWaitDisc


execute if block 1137 57 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=57,z=1049,distance=..4] at @s run particle portal 1137 57.3 1049 0.1 0.1 0.1 0.5 20 force @a
execute if block 1137 57 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=57,z=1049,distance=..4] at @s run playsound entity.enderman.teleport master @a 1137 57 1049 0.5 1 0
execute if block 1137 57 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=57,z=1049,distance=..4] at @s run setblock 1146 56 1047 jukebox
execute if block 1137 57 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=57,z=1049,distance=..4] at @s run setblock 1137 57 1049 air

execute if block 1146 56 1047 jukebox as @a[tag=HasWaitDisc,x=1146,y=56,z=1047,distance=..4] at @s run particle portal 1146 56.3 1047 0.1 0.1 0.1 0.5 20 force @a
execute if block 1146 56 1047 jukebox as @a[tag=HasWaitDisc,x=1146,y=56,z=1047,distance=..4] at @s run playsound entity.enderman.teleport master @a 1146 56 1047 0.5 1 0
execute if block 1146 56 1047 jukebox as @a[tag=HasWaitDisc,x=1146,y=56,z=1047,distance=..4] at @s run setblock 1130 57 1056 jukebox
execute if block 1146 56 1047 jukebox as @a[tag=HasWaitDisc,x=1146,y=56,z=1047,distance=..4] at @s run setblock 1146 56 1047 air

execute if block 1130 57 1056 jukebox as @a[tag=HasWaitDisc,x=1130,y=57,z=1056,distance=..4] at @s run particle portal 1130 57.3 1056 0.1 0.1 0.1 0.5 20 force @a
execute if block 1130 57 1056 jukebox as @a[tag=HasWaitDisc,x=1130,y=57,z=1056,distance=..4] at @s run playsound entity.enderman.teleport master @a 1130 57 1056 0.5 1 0
execute if block 1130 57 1056 jukebox as @a[tag=HasWaitDisc,x=1130,y=57,z=1056,distance=..4] at @s run setblock 1133 56 1041 jukebox
execute if block 1130 57 1056 jukebox as @a[tag=HasWaitDisc,x=1130,y=57,z=1056,distance=..4] at @s run setblock 1130 57 1056 air

execute if block 1133 56 1041 jukebox as @a[tag=HasWaitDisc,x=1133,y=56,z=1041,distance=..4] at @s run particle portal 1133 56.3 1041 0.1 0.1 0.1 0.5 20 force @a
execute if block 1133 56 1041 jukebox as @a[tag=HasWaitDisc,x=1133,y=56,z=1041,distance=..4] at @s run playsound entity.enderman.teleport master @a 1133 56 1041 0.5 1 0
execute if block 1133 56 1041 jukebox as @a[tag=HasWaitDisc,x=1133,y=56,z=1041,distance=..4] at @s run setblock 1144 61 1058 jukebox
execute if block 1133 56 1041 jukebox as @a[tag=HasWaitDisc,x=1133,y=56,z=1041,distance=..4] at @s run setblock 1133 56 1041 air

execute if block 1144 61 1058 jukebox as @a[tag=HasWaitDisc,x=1144,y=61,z=1058,distance=..6] at @s run particle portal 1144 61.3 1058 0.1 0.1 0.1 0.5 20 force @a
execute if block 1144 61 1058 jukebox as @a[tag=HasWaitDisc,x=1144,y=61,z=1058,distance=..6] at @s run playsound entity.enderman.teleport master @a 1144 61 1058 0.5 1 0
execute if block 1144 61 1058 jukebox as @a[tag=HasWaitDisc,x=1144,y=61,z=1058,distance=..6] at @s run setblock 1137 64 1049 jukebox
execute if block 1144 61 1058 jukebox as @a[tag=HasWaitDisc,x=1144,y=61,z=1058,distance=..6] at @s run setblock 1144 61 1058 oak_fence

execute if block 1137 64 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=64,z=1049,distance=..6] at @s run particle portal 1137 64.3 1049 0.1 0.1 0.1 0.5 20 force @a
execute if block 1137 64 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=64,z=1049,distance=..6] at @s run playsound entity.enderman.teleport master @a 1137 64 1049 0.5 1 0
execute if block 1137 64 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=64,z=1049,distance=..6] at @s run setblock 1137 56 1049 jukebox
execute if block 1137 64 1049 jukebox as @a[tag=HasWaitDisc,x=1137,y=64,z=1049,distance=..6] at @s run setblock 1137 64 1049 air

execute if block 1137 56 1049 jukebox run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:music_disc_wait"}},nbt=!{SelectedItem:{id:"minecraft:music_disc_wait",tag:{CanPlaceOn:["minecraft:jukebox"]}}}] weapon.mainhand music_disc_wait{HideFlags:16, CanPlaceOn: ["minecraft:jukebox"]}

execute if block 1137 56 1049 jukebox{RecordItem: {id: "minecraft:music_disc_wait"}} run scoreboard objectives add G4BFinish dummy
scoreboard players add @e[tag=MainTriviaAEC] G4BFinish 1

execute if entity @e[scores={G4BFinish=1}] run setblock 1137 56 1049 jukebox
execute if entity @e[scores={G4BFinish=1..}] run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_wait"}}]

execute if entity @e[scores={G4BFinish=370}] run stopsound @a
execute if entity @e[scores={G4BFinish=370..372}] at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"a wicked awesome tune\",\"color\":\"white\"}"}
#execute if entity @e[scores={G4BFinish=380..382}] at @a[tag=WrongAnswer] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"a wicked awesome tune\",\"color\":\"white\"}"}



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add G4B_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove G4B_End
execute align x align y align z unless entity @a[x=1125,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G4B_End 1

execute if entity @e[scores={G4B_End=25..}] run kill @e[tag=G4BParrot]
execute if entity @e[scores={G4B_End=25..}] run kill @e[type=item,x=1125,y=54,z=1007,dx=24,dy=24,dz=24]
execute if entity @e[scores={G4B_End=25..}] run clear @a
execute if entity @e[scores={G4B_End=25..}] run scoreboard objectives remove G4BFinish
execute if entity @e[scores={G4B_End=25..}] run scoreboard objectives remove G4BMusicDisc
execute if entity @e[scores={G4B_End=25..}] run scoreboard objectives remove Incorrect_G4B
execute if entity @e[scores={G4B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G4B_End=25..}] run scoreboard objectives remove G4B_End