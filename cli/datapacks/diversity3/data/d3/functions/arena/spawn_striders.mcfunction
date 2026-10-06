####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 5 2019 / SEPTEMBER 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanStray

scoreboard objectives add SpawnStray dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnStray 1
scoreboard players set @e[scores={SpawnStray=250..}] SpawnStray 0

execute if entity @e[scores={SpawnStray=20}] run scoreboard objectives add ScanStray dummy
execute if entity @e[scores={SpawnStray=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanStray 0
execute if entity @e[scores={SpawnStray=20}] as @e[tag=ArenaStray] run scoreboard players add @e[tag=MainArenaAEC] ScanStray 1

execute if entity @e[scores={SpawnStray=20}] run kill @e[tag=ArenaStrayAEC]
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2006 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2006 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2006 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2006 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2006 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2007 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2007 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2007 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2007 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2007 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2008 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2008 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2008 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2008 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2008 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2009 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2009 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2009 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2009 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2009 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2010 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2010 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2010 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2010 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2010 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2011 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2011 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2011 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2011 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2011 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2012 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2012 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2012 {Tags:["ArenaStrayAEC"],Duration:20}
execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2012 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2012 {Tags:["ArenaStrayAEC"],Duration:20}

#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -35 66 2013 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -36 66 2013 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -37 66 2013 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -38 66 2013 {Tags:["ArenaStrayAEC"],Duration:20}
#execute if entity @e[scores={SpawnStray=20}] run summon area_effect_cloud -39 66 2013 {Tags:["ArenaStrayAEC"],Duration:20}

execute if entity @e[scores={SpawnStray=20}] run kill @e[tag=ArenaStrayAEC,sort=random,limit=16]
execute if entity @e[scores={SpawnStray=20,ScanStray=..6}] at @e[tag=ArenaStrayAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
#execute if entity @e[scores={SpawnStray=20,ScanStray=..6}] at @e[tag=ArenaStrayAEC] run summon spider ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Health:30.0f,Attributes:[{Name:"generic.maxHealth",Base:30.0}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaSpider","ArenaAlcoveMob","ArenaAlcove3Mob"],Passengers:[{id:"minecraft:stray",Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:2.0},{Name:"generic.movementSpeed",Base:0.25}],PersistenceRequired:1b,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],HandItems:[{id:"minecraft:bow",Count:1b}],Team:ArenaMob,Tags:["ArenaMob","ArenaStray","ArenaAlcoveMob","ArenaAlcove3Mob"],Passengers:[{id:"minecraft:cave_spider",Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Health:30.0f,Attributes:[{Name:"generic.maxHealth",Base:30.0}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaCaveSpider","ArenaAlcoveMob","ArenaAlcove3Mob"]}]}]}


#Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],


execute if entity @e[scores={SpawnStray=20,ScanStray=..6}] at @e[tag=ArenaStrayAEC] run summon stray ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:40.0},{Name:"generic.attackDamage",Base:2.0},{Name:"generic.movementSpeed",Base:0.25}],PersistenceRequired:1b,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:smoker",Count:1b}],HandItems:[{id:"minecraft:bow",Count:1b}],Team:ArenaMob,Tags:["ArenaMob","ArenaStray","ArenaAlcoveMob","ArenaAlcove1Mob"],Passengers:[{id:"minecraft:cave_spider",Health:30.0f,Attributes:[{Name:"generic.maxHealth",Base:30.0}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaCaveSpider","ArenaAlcoveMob","ArenaAlcove1Mob"]}]}

execute if entity @e[scores={SpawnStray=20}] run scoreboard objectives remove ScanStray