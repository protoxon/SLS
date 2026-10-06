####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 7 2019 / JULY 13 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanCreeper

scoreboard objectives add SpawnCreeper dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnCreeper 1
scoreboard players set @e[scores={SpawnCreeper=250..}] SpawnCreeper 0

execute if entity @e[scores={SpawnCreeper=20}] run scoreboard objectives add ScanCreeper dummy
execute if entity @e[scores={SpawnCreeper=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanCreeper 0
execute if entity @e[scores={SpawnCreeper=20}] as @e[tag=ArenaCreeper] run scoreboard players add @e[tag=MainArenaAEC] ScanCreeper 1

execute if entity @e[scores={SpawnCreeper=20}] run kill @e[tag=ArenaCreeperAEC]
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1987 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1987 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1987 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1987 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1987 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1988 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1988 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1988 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1988 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1988 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1989 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1989 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1989 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1989 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1989 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1990 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1990 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1990 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1990 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1990 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1991 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1991 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1991 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1991 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1991 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1992 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1992 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1992 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1992 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1992 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1993 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1993 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1993 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1993 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1993 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -35 66 1994 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -36 66 1994 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -37 66 1994 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -38 66 1994 {Tags:["ArenaCreeperAEC"],Duration:20}
execute if entity @e[scores={SpawnCreeper=20}] run summon area_effect_cloud -39 66 1994 {Tags:["ArenaCreeperAEC"],Duration:20}

execute if entity @e[scores={SpawnCreeper=20}] run kill @e[tag=ArenaCreeperAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnCreeper=20,ScanCreeper=..7}] at @e[tag=ArenaCreeperAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnCreeper=20,ScanCreeper=..7}] at @e[tag=ArenaCreeperAEC] run summon creeper ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:30.0},{Name:"generic.attackDamage",Base:1.5}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaCreeper","ArenaAlcoveMob","ArenaAlcove4Mob"]}
execute if entity @e[scores={SpawnCreeper=20}] run scoreboard objectives remove ScanCreeper