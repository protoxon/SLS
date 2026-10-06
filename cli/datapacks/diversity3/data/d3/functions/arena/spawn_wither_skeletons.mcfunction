####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 11 2019 / JANUARY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanWSkeleton

scoreboard objectives add SpawnWSkeleton dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnWSkeleton 1
scoreboard players set @e[scores={SpawnWSkeleton=250..}] SpawnWSkeleton 0

execute if entity @e[scores={SpawnWSkeleton=20}] run scoreboard objectives add ScanWSkeleton dummy
execute if entity @e[scores={SpawnWSkeleton=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanWSkeleton 0
execute if entity @e[scores={SpawnWSkeleton=20}] as @e[tag=ArenaWitherSkeleton] run scoreboard players add @e[tag=MainArenaAEC] ScanWSkeleton 1

execute if entity @e[scores={SpawnWSkeleton=20}] run kill @e[tag=ArenaWSkeletonAEC]
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1987 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1987 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1987 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1987 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1987 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1988 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1988 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1988 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1988 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1988 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1989 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1989 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1989 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1989 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1989 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1990 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1990 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1990 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1990 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1990 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1991 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1991 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1991 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1991 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1991 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1992 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1992 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1992 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1992 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1992 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1993 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1993 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1993 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1993 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1993 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -35 66 1994 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -36 66 1994 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -37 66 1994 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -38 66 1994 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnWSkeleton=20}] run summon area_effect_cloud -39 66 1994 {Tags:["ArenaWitherSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnWSkeleton=20}] run kill @e[tag=ArenaWitherSkeletonAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnWSkeleton=20,ScanWSkeleton=..7}] at @e[tag=ArenaWitherSkeletonAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnWSkeleton=20,ScanWSkeleton=..7}] at @e[tag=ArenaWitherSkeletonAEC] run summon wither_skeleton ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:10.0}],HandItems:[{id:"minecraft:stone_sword",Count:0b},{id:"minecraft:stone_sword",Count:1b}],ArmorItems:[{},{},{id:"minecraft:elytra",Count:1b},{id:"minecraft:dragon_head",Count:1b}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaWitherSkeleton","ArenaAlcoveMob","ArenaAlcove4Mob"]}
execute if entity @e[scores={SpawnWSkeleton=20}] run scoreboard objectives remove ScanWSkeleton