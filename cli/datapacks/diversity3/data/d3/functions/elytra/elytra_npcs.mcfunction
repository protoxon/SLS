####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 9 2019 / JULY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ElytraCow

execute as @e[tag=ElytraNPC] at @s run teleport @s ^ ^ ^ facing entity @p

execute as @e[tag=ElytraNPC,tag=!ElytraCow,tag=!ElytraAlien] at @s if entity @a[distance=..10] run data merge entity @s[nbt=!{CustomNameVisible:1b}] {CustomNameVisible:1b}
execute as @e[tag=ElytraNPC] at @s unless entity @a[distance=..10] run data merge entity @s[nbt={CustomNameVisible:1b}] {CustomNameVisible:0b}


# DR ZOMBO
execute if block -1592 71 1884 glass unless entity @e[tag=ElytraZombo] run summon villager -1592 72 1884 {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:1b,NoAI:1b,Silent:1b,VillagerData:{profession:"minecraft:librarian",type:"minecraft:taiga",level:6},Offers:{},ArmorItems:[{},{},{},{id:"minecraft:orange_stained_glass",Count:1b}],Tags:["ElytraZombo","ElytraNPC"]}


# UFO
execute if block -1443 67 1805 redstone_lamp unless entity @e[tag=ElytraAlien] run summon enderman -1443 68 1805 {NoAI:1b,Rotation:[90f,0f],Invulnerable:1b,Tags:["ElytraAlien","ElytraNPC"]}


execute if block -1442 49 1805 air unless block -20 3 78 hay_block unless entity @e[tag=ElytraCow] run summon cow -1442 50.0 1805 {NoGravity:1b,Health:0.1f,Rotation:[90f,0f],Tags:["ElytraCow","ElytraNPC"]}
execute if entity @e[tag=ElytraCow] if block -20 3 78 clay run setblock -20 3 78 hay_block
execute if entity @e[tag=ElytraCow] run scoreboard objectives add ElytraCow minecraft.killed:minecraft.cow
advancement grant @a[scores={ElytraCow=1..}] only d3:folder_c/sacrifice

#-1443 68 1805