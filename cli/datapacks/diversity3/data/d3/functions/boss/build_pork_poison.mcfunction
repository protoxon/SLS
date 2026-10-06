####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# DECEMBER 1 2018 / DECEMBER 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#OLD -> summon firework_rocket -1025 68 -957 {FireworksItem:{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Colors:[I;16711918],FadeColors:[I;14483711]}]}}}}

summon firework_rocket -1024.0 68.5 -957 {LifeTime:-3,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:0b,Explosions:[{Type:0b,Colors:[I;3887386]}]}}},Life:-3}

tag @e[tag=ZombieFood] add ZombieFoodDies
tag @e[tag=ZombieFoodDies] remove ZombieFood

execute as @e[tag=ZombieFoodDies] run data merge entity @s {NoGravity:false,Invulnerable:false,Silent:true,NoAI:false}
execute as @e[tag=ZombieFoodDies] at @s run teleport @s ~ ~-100 ~

playsound entity.squid.death master @a -1025 68 -957 10 1 0
clone -1005 73 -1011 -998 79 -1011 -1028 65 -956 masked

#clone -1033 105 -1012 -1026 111 -1012 -1028 65 -956 masked
#fill -1028 65 -956 -1021 71 -956 lime_terracotta replace pink_terracotta
#fill -1028 65 -956 -1021 71 -956 lime_concrete replace pink_concrete
#fill -1028 65 -956 -1021 71 -956 lime_concrete_powder replace pink_concrete_powder

tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Chew on that!","color":"none","bold":false,"underlined":false}]
playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

scoreboard players set @e[scores={BossLevel=..119}] BossTimer 0
scoreboard players set @e[scores={BossLevel=..119}] BossLevel 120