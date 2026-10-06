####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 13 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanPillager

scoreboard objectives add SpawnPillager dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnPillager 1
scoreboard players set @e[scores={SpawnPillager=250..}] SpawnPillager 0

execute if entity @e[scores={SpawnPillager=20}] run scoreboard objectives add ScanPillager dummy
execute if entity @e[scores={SpawnPillager=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanPillager 0
execute if entity @e[scores={SpawnPillager=20}] as @e[tag=ArenaPillager] run scoreboard players add @e[tag=MainArenaAEC] ScanPillager 1

execute if entity @e[scores={SpawnPillager=20}] run kill @e[tag=ArenaPillagerAEC]
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1987 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1987 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1987 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1987 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1987 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1988 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1988 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1988 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1988 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1988 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1989 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1989 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1989 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1989 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1989 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1990 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1990 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1990 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1990 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1990 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1991 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1991 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1991 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1991 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1991 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1992 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1992 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1992 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1992 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1992 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1993 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1993 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1993 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1993 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1993 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 35 66 1994 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 36 66 1994 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 37 66 1994 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 38 66 1994 {Tags:["ArenaPillagerAEC"],Duration:20}
execute if entity @e[scores={SpawnPillager=20}] run summon area_effect_cloud 39 66 1994 {Tags:["ArenaPillagerAEC"],Duration:20}

execute if entity @e[scores={SpawnPillager=20}] run kill @e[tag=ArenaPillagerAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnPillager=20,ScanPillager=..7}] at @e[tag=ArenaPillagerAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnPillager=20,ScanPillager=..7}] at @e[tag=ArenaPillagerAEC] run summon pillager ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:30.0},{Name:"generic.attackDamage",Base:5.0}],HandItems:[{id:"minecraft:crossbow",Count:1b}],PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaPillager","ArenaAlcoveMob","ArenaAlcove3Mob"]}
execute if entity @e[scores={SpawnPillager=20}] run scoreboard objectives remove ScanPillager