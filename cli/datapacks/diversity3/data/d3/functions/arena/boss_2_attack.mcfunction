####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 9 2018 / MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar Boss2Defense

difficulty normal

execute if entity @e[tag=ArenaBoss2,type=husk,nbt={HurtTime:10s}] run scoreboard objectives add Boss2Defense dummy
scoreboard players add @e[tag=ArenaBoss2,type=husk] Boss2Defense 1


execute if entity @e[scores={Boss2Defense=1}] at @e[tag=ArenaBoss2,type=guardian] run summon pufferfish ~ ~ ~ {Motion:[0.3d,0.2d,0.0d],Team:ArenaBoss,Tags:["ArenaMob","BossFish"]}
execute if entity @e[scores={Boss2Defense=1}] at @e[tag=ArenaBoss2,type=guardian] run summon pufferfish ~ ~ ~ {Motion:[-0.3d,0.2d,0.0d],Team:ArenaBoss,Tags:["ArenaMob","BossFish"]}
execute if entity @e[scores={Boss2Defense=1}] at @e[tag=ArenaBoss2,type=guardian] run summon pufferfish ~ ~ ~ {Motion:[0.0d,0.2d,0.3d],Team:ArenaBoss,Tags:["ArenaMob","BossFish"]}
execute if entity @e[scores={Boss2Defense=1}] at @e[tag=ArenaBoss2,type=guardian] run summon pufferfish ~ ~ ~ {Motion:[0.0d,0.2d,-0.3d],Team:ArenaBoss,Tags:["ArenaMob","BossFish"]}

execute if entity @e[scores={Boss2Defense=0..}] as @e[tag=ArenaBoss2,type=husk] run data merge entity @s {Invulnerable:1b}
execute unless entity @e[scores={Boss2Defense=0..60}] as @e[tag=ArenaBoss2,type=husk] run data merge entity @s[nbt={Invulnerable:1b}] {Invulnerable:0b}

execute if entity @e[type=pufferfish] run scoreboard players set @e[scores={Boss2Defense=0..}] Boss2Defense 3
execute if entity @e[scores={Boss2Defense=180..}] run scoreboard objectives remove Boss2Defense


execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~1 ~ ~ air unless block ~1 ~ ~ grass run data merge entity @e[tag=ArenaBoss2,type=husk,limit=1] {Motion:[-0.3d,0.0d,0.0d]}
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~-1 ~ ~ air unless block ~-1 ~ ~ grass run data merge entity @e[tag=ArenaBoss2,type=husk,limit=1] {Motion:[0.3d,0.0d,0.0d]}
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~ ~ ~1 air unless block ~ ~ ~1 grass run data merge entity @e[tag=ArenaBoss2,type=husk,limit=1] {Motion:[0.0d,0.0d,-0.3d]}
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~ ~ ~-1 air unless block ~ ~ ~-1 grass run data merge entity @e[tag=ArenaBoss2,type=husk,limit=1] {Motion:[0.0d,0.0d,0.3d]}

#effect give @e[tag=ArenaBoss2] jump_boost 1 1 true
effect give @e[tag=ArenaBoss2,type=husk] resistance 1 2 true
effect give @e[tag=ArenaBoss2,type=guardian] resistance 1 2 true


# PREVENT SUICIDE
tag @e[tag=ArenaBoss2] remove Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~ ~ ~ air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~1 ~ ~ air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~-1 ~ ~ air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~ ~ ~1 air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~ ~ ~-1 air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~1 ~ ~1 air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~-1 ~ ~-1 air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~-1 ~ ~1 air run tag @s add Invulnerable
execute as @e[tag=ArenaBoss2,type=guardian] at @s unless block ~1 ~ ~-1 air run tag @s add Invulnerable

execute as @e[tag=ArenaBoss2,type=guardian,tag=Invulnerable,nbt=!{Invulnerable:1b}] run data merge entity @s {Invulnerable:1b}
execute as @e[tag=ArenaBoss2,type=guardian,tag=!Invulnerable,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}


# HEALTH REGEN
scoreboard objectives add ArenaBoss2Regen deathCount
execute if entity @a[scores={ArenaBoss2Regen=1..}] run effect give @e[tag=ArenaBoss2,type=husk] instant_damage 4 1 false
execute if entity @a[scores={ArenaBoss2Regen=1..}] run effect give @e[tag=ArenaBoss2,type=guardian] instant_health 4 1 false
scoreboard players reset @a[scores={ArenaBoss2Regen=1..}] ArenaBoss2Regen


