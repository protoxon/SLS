####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / APRIL 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanCaveSpider

scoreboard objectives add SpawnCaveSpider dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnCaveSpider 1
scoreboard players set @e[scores={SpawnCaveSpider=250..}] SpawnCaveSpider 0

execute if entity @e[scores={SpawnCaveSpider=20}] run scoreboard objectives add ScanCaveSpider dummy
execute if entity @e[scores={SpawnCaveSpider=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanCaveSpider 0
execute if entity @e[scores={SpawnCaveSpider=20}] as @e[tag=ArenaCaveSpider] run scoreboard players add @e[tag=MainArenaAEC] ScanCaveSpider 1

execute if entity @e[scores={SpawnCaveSpider=20}] run kill @e[tag=ArenaCaveSpiderAEC]
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1987 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1987 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1987 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1987 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1987 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1988 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1988 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1988 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1988 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1988 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1989 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1989 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1989 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1989 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1989 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1990 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1990 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1990 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1990 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1990 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1991 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1991 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1991 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1991 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1991 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1992 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1992 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1992 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1992 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1992 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1993 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1993 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1993 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1993 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1993 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -35 66 1994 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -36 66 1994 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -37 66 1994 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -38 66 1994 {Tags:["ArenaCaveSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnCaveSpider=20}] run summon area_effect_cloud -39 66 1994 {Tags:["ArenaCaveSpiderAEC"],Duration:20}

execute if entity @e[scores={SpawnCaveSpider=20}] run kill @e[tag=ArenaCaveSpiderAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnCaveSpider=20,ScanCaveSpider=..7}] at @e[tag=ArenaCaveSpiderAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnCaveSpider=20,ScanCaveSpider=..7}] at @e[tag=ArenaCaveSpiderAEC] run summon cave_spider ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.3}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaCaveSpider","ArenaAlcoveMob","ArenaAlcove4Mob"]}
execute if entity @e[scores={SpawnCaveSpider=20}] run scoreboard objectives remove ScanCaveSpider