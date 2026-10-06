####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / JANUARY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanZombie

scoreboard objectives add SpawnZombie dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnZombie 1
scoreboard players set @e[scores={SpawnZombie=250..}] SpawnZombie 0

execute if entity @e[scores={SpawnZombie=20}] run scoreboard objectives add ScanZombie dummy
execute if entity @e[scores={SpawnZombie=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanZombie 0
execute if entity @e[scores={SpawnZombie=20}] as @e[tag=ArenaZombie] run scoreboard players add @e[tag=MainArenaAEC] ScanZombie 1

execute if entity @e[scores={SpawnZombie=20}] run kill @e[tag=ArenaZombieAEC]
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2006 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2006 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2006 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2006 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2006 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2007 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2007 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2007 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2007 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2007 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2008 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2008 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2008 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2008 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2008 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2009 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2009 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2009 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2009 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2009 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2010 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2010 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2010 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2010 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2010 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2011 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2011 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2011 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2011 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2011 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2012 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2012 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2012 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2012 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2012 {Tags:["ArenaZombieAEC"],Duration:20}

execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 35 66 2013 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 36 66 2013 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 37 66 2013 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 38 66 2013 {Tags:["ArenaZombieAEC"],Duration:20}
execute if entity @e[scores={SpawnZombie=20}] run summon area_effect_cloud 39 66 2013 {Tags:["ArenaZombieAEC"],Duration:20}




execute if entity @e[scores={SpawnZombie=20}] run kill @e[tag=ArenaZombieAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnZombie=20,ScanZombie=..7}] at @e[tag=ArenaZombieAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnZombie=20,ScanZombie=..7}] at @e[tag=ArenaZombieAEC] run summon zombie ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:1.5},{Name:"generic.movementSpeed",Base:0.23}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaZombie","ArenaAlcoveMob","ArenaAlcove2Mob"]}
execute if entity @e[scores={SpawnZombie=20}] run scoreboard objectives remove ScanZombie