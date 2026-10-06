####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 7 2019 / FEBRUARY 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanMagmaCube

scoreboard objectives add SpawnMagmaCube dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnMagmaCube 1
scoreboard players set @e[scores={SpawnMagmaCube=250..}] SpawnMagmaCube 0

execute if entity @e[scores={SpawnMagmaCube=20}] run scoreboard objectives add ScanMagmaCube dummy
execute if entity @e[scores={SpawnMagmaCube=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanMagmaCube 0
execute if entity @e[scores={SpawnMagmaCube=20}] as @e[tag=ArenaMagmaCube] run scoreboard players add @e[tag=MainArenaAEC] ScanMagmaCube 1

execute if entity @e[scores={SpawnMagmaCube=20}] run kill @e[tag=ArenaMagmaCubeAEC]
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1987 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1987 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1987 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1987 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1987 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1988 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1988 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1988 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1988 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1988 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1989 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1989 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1989 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1989 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1989 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1990 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1990 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1990 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1990 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1990 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1991 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1991 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1991 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1991 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1991 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1992 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1992 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1992 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1992 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1992 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1993 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1993 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1993 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1993 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1993 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 35 66 1994 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 36 66 1994 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 37 66 1994 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 38 66 1994 {Tags:["ArenaMagmaCubeAEC"],Duration:20}
#execute if entity @e[scores={SpawnMagmaCube=20}] run summon area_effect_cloud 39 66 1994 {Tags:["ArenaMagmaCubeAEC"],Duration:20}

execute if entity @e[scores={SpawnMagmaCube=20}] run kill @e[tag=ArenaMagmaCubeAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnMagmaCube=20,ScanMagmaCube=..3}] at @e[tag=ArenaMagmaCubeAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnMagmaCube=20,ScanMagmaCube=..3}] at @e[tag=ArenaMagmaCubeAEC] run summon magma_cube ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.movementSpeed",Base:0.27}],Size:3,PersistenceRequired:1b,PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaMagmaCube","ArenaAlcoveMob","ArenaAlcove1Mob"]}

tag @e[type=magma_cube,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
tag @e[type=magma_cube,tag=!ArenaMagmaCube,tag=!ArenaStatue] add ArenaMagmaCube
tag @e[type=magma_cube,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
tag @e[type=magma_cube,tag=!ArenaAlcove1Mob,tag=!ArenaStatue] add ArenaAlcove1Mob

execute if entity @e[scores={SpawnMagmaCube=20}] run scoreboard objectives remove ScanMagmaCube