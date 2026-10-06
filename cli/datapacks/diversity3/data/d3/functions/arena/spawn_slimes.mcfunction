####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 5 2019 / JANUARY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanSlime

scoreboard objectives add SpawnSlime dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnSlime 1
scoreboard players set @e[scores={SpawnSlime=250..}] SpawnSlime 0

execute if entity @e[scores={SpawnSlime=20}] run scoreboard objectives add ScanSlime dummy
execute if entity @e[scores={SpawnSlime=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanSlime 0
execute if entity @e[scores={SpawnSlime=20}] as @e[tag=ArenaSlime] run scoreboard players add @e[tag=MainArenaAEC] ScanSlime 1

execute if entity @e[scores={SpawnSlime=20}] run kill @e[tag=ArenaSlimeAEC]
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1987 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1987 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1987 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1987 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1987 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1988 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1988 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1988 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1988 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1988 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1989 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1989 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1989 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1989 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1989 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1990 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1990 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1990 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1990 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1990 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1991 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1991 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1991 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1991 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1991 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1992 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1992 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1992 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1992 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1992 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1993 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1993 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1993 {Tags:["ArenaSlimeAEC"],Duration:20}
execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1993 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1993 {Tags:["ArenaSlimeAEC"],Duration:20}

#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 35 66 1994 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 36 66 1994 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 37 66 1994 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 38 66 1994 {Tags:["ArenaSlimeAEC"],Duration:20}
#execute if entity @e[scores={SpawnSlime=20}] run summon area_effect_cloud 39 66 1994 {Tags:["ArenaSlimeAEC"],Duration:20}

execute if entity @e[scores={SpawnSlime=20}] run kill @e[tag=ArenaSlimeAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnSlime=20,ScanSlime=..3}] at @e[tag=ArenaSlimeAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnSlime=20,ScanSlime=..3}] at @e[tag=ArenaSlimeAEC] run summon slime ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.movementSpeed",Base:0.25}],Size:3,PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaSlime","ArenaAlcoveMob","ArenaAlcove1Mob"]}

tag @e[type=slime,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
tag @e[type=slime,tag=!ArenaSlime,tag=!ArenaStatue] add ArenaSlime
tag @e[type=slime,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
tag @e[type=slime,tag=!ArenaAlcove1Mob,tag=!ArenaStatue] add ArenaAlcove1Mob

execute if entity @e[scores={SpawnSlime=20}] run scoreboard objectives remove ScanSlime