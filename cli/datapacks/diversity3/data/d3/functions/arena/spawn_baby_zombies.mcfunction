####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / JULY 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanBabyZombie

scoreboard objectives add SpawnBabyZombie dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnBabyZombie 1
scoreboard players set @e[scores={SpawnBabyZombie=250..}] SpawnBabyZombie 0

execute if entity @e[scores={SpawnBabyZombie=20}] run scoreboard objectives add ScanBabyZombie dummy
execute if entity @e[scores={SpawnBabyZombie=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanBabyZombie 0
execute if entity @e[scores={SpawnBabyZombie=20}] as @e[tag=ArenaBabyZombie] run scoreboard players add @e[tag=MainArenaAEC] ScanBabyZombie 1

execute if entity @e[scores={SpawnBabyZombie=20}] run kill @e[tag=ArenaBabyZombieAEC]
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1987 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1987 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1987 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1987 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1987 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1988 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1988 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1988 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1988 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1988 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1989 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1989 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1989 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1989 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1989 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1990 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1990 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1990 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1990 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1990 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1991 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1991 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1991 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1991 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1991 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1992 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1992 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1992 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1992 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1992 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1993 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1993 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1993 {Tags:["ArenaBabyZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1993 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1993 {Tags:["ArenaBabyZombieAEC"],Duration:20}

#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -35 66 1994 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -36 66 1994 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -37 66 1994 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -38 66 1994 {Tags:["ArenaBabyZombieAEC"],Duration:20}
#execute if entity @e[scores={SpawnBabyZombie=20}] run summon area_effect_cloud -39 66 1994 {Tags:["ArenaBabyZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnBabyZombie=20}] run kill @e[tag=ArenaBabyZombieAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnBabyZombie=20,ScanBabyZombie=..7}] at @e[tag=ArenaBabyZombieAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnBabyZombie=20,ScanBabyZombie=..7}] at @e[tag=ArenaBabyZombieAEC] run summon zombie_horse ~ ~ ~ {Age:-9999999,Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.3}],PersistenceRequired:1b,Tame:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaZombieHorse","ArenaAlcoveMob","ArenaAlcove4Mob"],Passengers:[{id:"minecraft:zombie_villager",IsBaby:true,Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.3}],PersistenceRequired:1b,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Team:ArenaMob,Tags:["ArenaMob","ArenaBabyZombie","ArenaAlcoveMob","ArenaAlcove4Mob"]}]}
execute if entity @e[scores={SpawnBabyZombie=20}] run scoreboard objectives remove ScanBabyZombie