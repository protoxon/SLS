####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 11 2019 / JANUARY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanEvoker

scoreboard objectives add SpawnEvoker dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnEvoker 1
scoreboard players set @e[scores={SpawnEvoker=250..}] SpawnEvoker 0

execute if entity @e[scores={SpawnEvoker=20}] run scoreboard objectives add ScanEvoker dummy
execute if entity @e[scores={SpawnEvoker=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanEvoker 0
execute if entity @e[scores={SpawnEvoker=20}] as @e[tag=ArenaEvoker] run scoreboard players add @e[tag=MainArenaAEC] ScanEvoker 1

execute if entity @e[scores={SpawnEvoker=20}] run kill @e[tag=ArenaEvokerAEC]
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2006 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2006 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2006 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2006 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2006 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2007 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2007 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2007 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2007 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2007 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2008 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2008 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2008 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2008 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2008 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2009 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2009 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2009 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2009 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2009 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2010 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2010 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2010 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2010 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2010 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2011 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2011 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2011 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2011 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2011 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2012 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2012 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2012 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2012 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2012 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -35 66 2013 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -36 66 2013 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -37 66 2013 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -38 66 2013 {Tags:["ArenaEvokerAEC"],Duration:20}
execute if entity @e[scores={SpawnEvoker=20}] run summon area_effect_cloud -39 66 2013 {Tags:["ArenaEvokerAEC"],Duration:20}

execute if entity @e[scores={SpawnEvoker=20}] run kill @e[tag=ArenaEvokerAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnEvoker=20,ScanEvoker=..7}] at @e[tag=ArenaEvokerAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnEvoker=20,ScanEvoker=..7}] at @e[tag=ArenaEvokerAEC] run summon evoker ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:30.0},{Name:"generic.attackDamage",Base:2.0},{Name:"generic.movementSpeed",Base:0.5}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaEvoker","ArenaAlcoveMob","ArenaAlcove3Mob"]}

tag @e[type=vex,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
tag @e[type=vex,tag=!ArenaVex,tag=!ArenaStatue] add ArenaVex
tag @e[type=vex,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
tag @e[type=vex,tag=!ArenaAlcove3Mob,tag=!ArenaStatue] add ArenaAlcove3Mob

execute if entity @e[scores={SpawnEvoker=20}] run scoreboard objectives remove ScanEvoker