####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 11 2019 / JANUARY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanVindicator

scoreboard objectives add SpawnVindicator dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnVindicator 1
scoreboard players set @e[scores={SpawnVindicator=250..}] SpawnVindicator 0

execute if entity @e[scores={SpawnVindicator=20}] run scoreboard objectives add ScanVindicator dummy
execute if entity @e[scores={SpawnVindicator=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanVindicator 0
execute if entity @e[scores={SpawnVindicator=20}] as @e[tag=ArenaVindicator] run scoreboard players add @e[tag=MainArenaAEC] ScanVindicator 1

execute if entity @e[scores={SpawnVindicator=20}] run kill @e[tag=ArenaVindicatorAEC]
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2006 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2006 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2006 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2006 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2006 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2007 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2007 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2007 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2007 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2007 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2008 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2008 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2008 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2008 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2008 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2009 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2009 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2009 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2009 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2009 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2010 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2010 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2010 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2010 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2010 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2011 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2011 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2011 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2011 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2011 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2012 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2012 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2012 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2012 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2012 {Tags:["ArenaVindicatorAEC"],Duration:20}

execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 35 66 2013 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 36 66 2013 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 37 66 2013 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 38 66 2013 {Tags:["ArenaVindicatorAEC"],Duration:20}
execute if entity @e[scores={SpawnVindicator=20}] run summon area_effect_cloud 39 66 2013 {Tags:["ArenaVindicatorAEC"],Duration:20}




execute if entity @e[scores={SpawnVindicator=20}] run kill @e[tag=ArenaVindicatorAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnVindicator=20,ScanVindicator=..7}] at @e[tag=ArenaVindicatorAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnVindicator=20,ScanVindicator=..7}] at @e[tag=ArenaVindicatorAEC] run summon vindicator ~ ~ ~ {Health:25.0f,Attributes:[{Name:"generic.maxHealth",Base:25.0},{Name:"generic.followRange",Base:25.0},{Name:"generic.attackDamage",Base:6.0},{Name:"generic.movementSpeed",Base:0.35}],HandItems:[{id:"minecraft:iron_axe",Count:1b}],PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaVindicator","ArenaAlcoveMob","ArenaAlcove2Mob"]}
execute if entity @e[scores={SpawnVindicator=20}] run scoreboard objectives remove ScanVindicator