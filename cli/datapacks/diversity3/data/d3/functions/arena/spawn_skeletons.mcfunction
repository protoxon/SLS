####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / JANUARY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanSkeleton

scoreboard objectives add SpawnSkeleton dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnSkeleton 1
scoreboard players set @e[scores={SpawnSkeleton=250..}] SpawnSkeleton 0

execute if entity @e[scores={SpawnSkeleton=20}] run scoreboard objectives add ScanSkeleton dummy
execute if entity @e[scores={SpawnSkeleton=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanSkeleton 0
execute if entity @e[scores={SpawnSkeleton=20}] as @e[tag=ArenaSkeleton] run scoreboard players add @e[tag=MainArenaAEC] ScanSkeleton 1

execute if entity @e[scores={SpawnSkeleton=20}] run kill @e[tag=ArenaSkeletonAEC]
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2006 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2006 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2006 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2006 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2006 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2007 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2007 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2007 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2007 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2007 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2008 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2008 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2008 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2008 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2008 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2009 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2009 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2009 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2009 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2009 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2010 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2010 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2010 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2010 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2010 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2011 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2011 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2011 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2011 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2011 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2012 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2012 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2012 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2012 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2012 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -35 66 2013 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -36 66 2013 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -37 66 2013 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -38 66 2013 {Tags:["ArenaSkeletonAEC"],Duration:20}
execute if entity @e[scores={SpawnSkeleton=20}] run summon area_effect_cloud -39 66 2013 {Tags:["ArenaSkeletonAEC"],Duration:20}

execute if entity @e[scores={SpawnSkeleton=20}] run kill @e[tag=ArenaSkeletonAEC,sort=random,limit=38]
execute if entity @e[scores={SpawnSkeleton=20,ScanSkeleton=..7}] at @e[tag=ArenaSkeletonAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnSkeleton=20,ScanSkeleton=..7}] at @e[tag=ArenaSkeletonAEC] run summon skeleton ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:20.0},{Name:"generic.attackDamage",Base:1.5}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],HandItems:[{id:"minecraft:bow",Count:1b}],PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaSkeleton","ArenaAlcoveMob","ArenaAlcove3Mob"]}
execute if entity @e[scores={SpawnSkeleton=20}] run scoreboard objectives remove ScanSkeleton