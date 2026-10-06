####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018 / MARCH 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1075 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G10A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1215,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

#effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G10A dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G10A 1

execute if entity @e[scores={Incorrect_G10A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G10A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G10A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G10A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G10A=1}] run title @a subtitle {"text":"That's not the first line of the End Poem", "color":"white"}
execute if entity @e[scores={Incorrect_G10A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: That line is in the poem, but it's not the first line. Now let's see if you can read our thoughts and exit. Just press that button on the other side of the door.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G10A=1}] run setblock 1227 57 1009 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={Incorrect_G10A=1}] run fill 1227 55 1015 1227 55 1021 orange_terracotta


execute if block 1227 57 1009 lever[powered=true] unless block 1227 54 1022 redstone_wall_torch run setblock 1227 54 1022 redstone_wall_torch[facing=north,lit=true]
execute if block 1227 57 1009 lever[powered=false] unless block 1227 54 1022 air run setblock 1227 54 1022 air

execute align x align y align z as @a[x=1224,y=56,z=1015,dx=6,dy=5,dz=5.5] unless entity @s[y_rotation=170..190] as @e[tag=G10AWatcher,nbt=!{Item: {id: "minecraft:ender_eye"}}] run data merge entity @s {Item: {id: "minecraft:ender_eye"}}
execute align x align y align z unless entity @a[x=1224,y=56,z=1015,dx=6,dy=5,dz=5.5] as @e[tag=G10AWatcher,nbt=!{Item: {id: "minecraft:heart_of_the_sea"}}] run data merge entity @s {Item: {id: "minecraft:heart_of_the_sea"}}

execute align x align y align z as @a[x=1224,y=56,z=1015,dx=6,dy=5,dz=5.5] unless entity @s[y_rotation=170..190] if block 1227 57 1009 lever[powered=true] run playsound block.lever.click block @a 1227 57 1006 0.5 0.5 0
execute align x align y align z as @a[x=1224,y=56,z=1015,dx=6,dy=5,dz=5.5] unless entity @s[y_rotation=170..190] run setblock 1227 57 1009 lever[face=wall,facing=south,powered=false]

execute unless entity @e[tag=G10AWatcher] run summon item_frame 1227 59 1021 {Silent:true, Facing: 2b, ItemRotation: 0b, Invulnerable: true,Item: {id: "minecraft:ender_eye", Count: 1b}, Tags:["G10AWatcher"]}
execute as @e[tag=G10AWatcher,nbt=!{ItemRotation: 0b}] run data merge entity @s {ItemRotation: 0b}

execute if entity @e[tag=G10AWatcher,nbt={Item: {id: "minecraft:ender_eye"}}] align x align y align z as @a[x=1227,y=56,z=1022,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ 1021


execute if block 1227 57 1026 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 1075 67 1000 0 0
execute if block 1227 57 1026 stone_button[powered=true] run setblock 1227 57 1026 stone_button[face=floor,facing=north,powered=false]



execute if entity @e[scores={Incorrect_G10A=2000}] run tellraw @a ["",{"text":" Okay fine. Here's a hint then.","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_G10A=2000}] run setblock 1227 55 1018 magenta_glazed_terracotta[facing=south] destroy

execute if entity @e[scores={Incorrect_G10A=2500}] run tellraw @a ["",{"text":" You're still here? Wow...","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_G10A=2515}] run setblock 1227 55 1021 magenta_glazed_terracotta[facing=south] destroy
execute if entity @e[scores={Incorrect_G10A=2520}] run setblock 1227 55 1020 magenta_glazed_terracotta[facing=south] destroy
execute if entity @e[scores={Incorrect_G10A=2525}] run setblock 1227 55 1019 magenta_glazed_terracotta[facing=south] destroy
#execute if entity @e[scores={Incorrect_G10A=2500}] run setblock 1227 55 1018 magenta_glazed_terracotta[facing=south] destroy
execute if entity @e[scores={Incorrect_G10A=2530}] run setblock 1227 55 1017 magenta_glazed_terracotta[facing=south] destroy
execute if entity @e[scores={Incorrect_G10A=2535}] run setblock 1227 55 1016 magenta_glazed_terracotta[facing=south] destroy
execute if entity @e[scores={Incorrect_G10A=2540}] run setblock 1227 55 1015 magenta_glazed_terracotta[facing=south] destroy

execute if entity @e[scores={Incorrect_G10A=3000}] run tellraw @a ["",{"text":" Ugh. Just take a dip then. Looks like you're out of ideas...","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_G10A=3020}] run fill 1227 55 1015 1227 55 1021 orange_terracotta destroy
execute if entity @e[scores={Incorrect_G10A=3020}] run setblock 1227 55 1020 lava


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1215,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add G10A_End dummy
execute align x align y align z if entity @a[x=1215,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove G10A_End
execute align x align y align z unless entity @a[x=1215,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G10A_End 1

execute if entity @e[scores={G10A_End=25..}] run clear @a
execute if entity @e[scores={G10A_End=25..}] run scoreboard objectives remove Incorrect_G10A
execute if entity @e[scores={G10A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G10A_End=25..}] run scoreboard objectives remove G10A_End