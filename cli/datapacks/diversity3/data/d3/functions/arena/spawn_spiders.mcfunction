####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / JANUARY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanSpider

scoreboard objectives add SpawnSpider dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnSpider 1
scoreboard players set @e[scores={SpawnSpider=250..}] SpawnSpider 0

execute if entity @e[scores={SpawnSpider=20}] run scoreboard objectives add ScanSpider dummy
execute if entity @e[scores={SpawnSpider=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanSpider 0
execute if entity @e[scores={SpawnSpider=20}] as @e[tag=ArenaSpider] run scoreboard players add @e[tag=MainArenaAEC] ScanSpider 1

execute if entity @e[scores={SpawnSpider=20}] run kill @e[tag=ArenaSpiderAEC]
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1987 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1987 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1987 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1987 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1987 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1988 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1988 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1988 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1988 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1988 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1989 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1989 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1989 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1989 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1989 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1990 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1990 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1990 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1990 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1990 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1991 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1991 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1991 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1991 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1991 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1992 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1992 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1992 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1992 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1992 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1993 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1993 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1993 {Tags:["ArenaSpiderAEC"],Duration:20}
execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1993 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1993 {Tags:["ArenaSpiderAEC"],Duration:20}

#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -35 66 1994 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -36 66 1994 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -37 66 1994 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -38 66 1994 {Tags:["ArenaSpiderAEC"],Duration:20}
#execute if entity @e[scores={SpawnSpider=20}] run summon area_effect_cloud -39 66 1994 {Tags:["ArenaSpiderAEC"],Duration:20}

execute if entity @e[scores={SpawnSpider=20}] run kill @e[tag=ArenaSpiderAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnSpider=20,ScanSpider=..7}] at @e[tag=ArenaSpiderAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnSpider=20,ScanSpider=..7}] at @e[tag=ArenaSpiderAEC] run summon spider ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:60.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.3}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaSpider","ArenaAlcoveMob","ArenaAlcove4Mob"]}
execute if entity @e[scores={SpawnSpider=20}] run scoreboard objectives remove ScanSpider