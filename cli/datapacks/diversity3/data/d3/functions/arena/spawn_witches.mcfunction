####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 7 2019 / JULY 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanWitch

scoreboard objectives add SpawnWitch dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnWitch 1
scoreboard players set @e[scores={SpawnWitch=250..}] SpawnWitch 0

execute if entity @e[scores={SpawnWitch=20}] run scoreboard objectives add ScanWitch dummy
execute if entity @e[scores={SpawnWitch=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanWitch 0
execute if entity @e[scores={SpawnWitch=20}] as @e[tag=ArenaWitch] run scoreboard players add @e[tag=MainArenaAEC] ScanWitch 1

execute if entity @e[scores={SpawnWitch=20}] run kill @e[tag=ArenaWitchAEC]
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2006 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2006 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2006 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2006 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2006 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2007 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2007 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2007 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2007 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2007 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2008 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2008 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2008 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2008 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2008 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2009 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2009 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2009 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2009 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2009 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2010 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2010 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2010 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2010 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2010 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2011 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2011 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2011 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2011 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2011 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2012 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2012 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2012 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2012 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2012 {Tags:["ArenaWitchAEC"],Duration:20}

execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 35 66 2013 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 36 66 2013 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 37 66 2013 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 38 66 2013 {Tags:["ArenaWitchAEC"],Duration:20}
execute if entity @e[scores={SpawnWitch=20}] run summon area_effect_cloud 39 66 2013 {Tags:["ArenaWitchAEC"],Duration:20}




execute if entity @e[scores={SpawnWitch=20}] run kill @e[tag=ArenaWitchAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnWitch=20,ScanWitch=..7}] at @e[tag=ArenaWitchAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnWitch=20,ScanWitch=..7}] at @e[tag=ArenaWitchAEC] run summon witch ~ ~ ~ {Patrolling:1b,Attributes:[{Name:"generic.maxHealth",Base:15.0},{Name:"generic.followRange",Base:35.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.20}],PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaWitch","ArenaAlcoveMob","ArenaAlcove2Mob"]}
execute if entity @e[scores={SpawnWitch=20}] run scoreboard objectives remove ScanWitch