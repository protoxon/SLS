####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 3 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1016 73 985

#scoreboard objectives setdisplay sidebar Incorrect_G1A
#scoreboard objectives setdisplay sidebar G1A_End
#scoreboard objectives setdisplay sidebar G1AAppleShot

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G1A dummy
execute align x align y align z if entity @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G1A 1

execute if entity @e[scores={Incorrect_G1A=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_G1A=1}] run execute as @e[tag=G1AAppleZombie] at @s run teleport ~ ~-100 ~

execute if entity @e[scores={Incorrect_G1A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G1A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G1A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G1A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G1A=1}] run title @a subtitle {"text":"Sorry. Apples do exist.", "color":"white"}
execute if entity @e[scores={Incorrect_G1A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Apples do exist in Minecraft. See?","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G1A=..10}] run kill @e[tag=G1AAppleZombie]
execute if entity @e[scores={Incorrect_G1A=95..109}] at @a[tag=WrongAnswer] run summon zombie ~ ~ ~ {CustomName:"{\"text\":\"apples\",\"color\":\"white\"}",IsBaby:true,Silent:true,Tags:["G1AAppleZombie"]}

execute align x align y align z at @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24,scores={G1AAppleDeath=0}] run teleport @e[tag=G1AAppleZombie,sort=nearest,limit=6] ~ ~ ~
execute as @e[tag=G1AAppleZombie] at @s run teleport @s ^ ^ ^ facing entity @p[scores={G1AAppleDeath=0}]

effect give @e[tag=G1AAppleZombie] invisibility 255 255 true
effect give @e[tag=G1AAppleZombie] speed 255 3 true

scoreboard objectives add G1AAppleDeath deathCount
scoreboard players add @a G1AAppleDeath 0

#execute if entity @a[scores={G1AAppleDeath=0}] run scoreboard players set @e[scores={Incorrect_G1A=105..}] Incorrect_G1A 102

execute if entity @e[scores={Incorrect_G1A=100}] run scoreboard objectives add G1AAppleShot dummy
scoreboard players add @e[tag=MainTriviaAEC] G1AAppleShot 1
execute if entity @e[scores={G1AAppleShot=1}] run playsound block.note_block.basedrum master @a 1107 61 981 0.5 1.9 0
execute if entity @a[scores={G1AAppleDeath=0}] run scoreboard players set @e[scores={G1AAppleShot=3..}] G1AAppleShot 0

execute if entity @e[scores={Incorrect_G1A=102}] run gamerule naturalRegeneration true


# NORTH
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107 61 980.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.0,0.0,-0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107.8 61 980.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.3,0.0,-0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1108.2 61 980.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.7,0.0,-0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1108.2 61 981.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.7,0.0,-0.3]}

# EAST
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1108.2 61 981 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.7,0.0,0.0]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1108.2 61 981.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.7,0.0,0.3]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1108.2 61 982.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.7,0.0,0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107.8 61 982.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.3,0.0,0.7]}

# SOUTH
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107 61 982.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[0.0,0.0,0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107.2 61 982.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.3,0.0,0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1106.8 61 982.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.7,0.0,0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1106.8 61 981.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.7,0.0,0.3]}

# WEST
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1106.8 61 981 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.7,0.0,0.0]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1106.8 61 981.2 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.7,0.0,-0.3]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1106.8 61 980.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.7,0.0,-0.7]}
execute if entity @e[scores={G1AAppleShot=1}] run summon item 1107.2 61 980.8 {Item:{id:"minecraft:apple",Count:1b},Tags:["G1ATriviaApple"],Age:5992,PickupDelay:32767,Motion:[-0.3,0.0,-0.7]}



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add G1A_End dummy
execute align x align y align z if entity @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove G1A_End
execute align x align y align z unless entity @a[x=1095,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G1A_End 1

execute if entity @e[scores={G1A_End=25..}] run scoreboard objectives remove G1AAppleDeath
execute if entity @e[scores={G1A_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G1A_End=25..}] run scoreboard objectives remove G1AAppleShot
execute if entity @e[scores={G1A_End=25..}] run execute as @e[tag=AppleZombie] at @s run teleport ~ ~-100 ~
execute if entity @e[scores={G1A_End=25..}] run kill @e[tag=AppleZombie]
execute if entity @e[scores={G1A_End=25..}] run clear @a
execute if entity @e[scores={G1A_End=25..}] run scoreboard objectives remove Incorrect_G1A
execute if entity @e[scores={G1A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G1A_End=25..}] run scoreboard objectives remove G1A_End