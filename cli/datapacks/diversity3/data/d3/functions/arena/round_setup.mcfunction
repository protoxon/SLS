####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / JULY 13 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# ALCOVE 1 SETUP
execute unless block 33 64 1988 air run setblock 33 64 1988 air
execute unless block 33 64 1989 air run setblock 33 64 1989 air
fill 36 64 1988 36 64 1989 clay replace air
fill 36 64 1988 36 64 1989 clay replace redstone_block
fill 35 64 1988 35 64 1989 air replace sticky_piston[extended=true]
fill 35 64 1988 35 64 1989 sticky_piston[extended=false,facing=west] replace air


# ALCOVE 2 SETUP
execute unless block 33 64 2011 air run setblock 33 64 2011 air
execute unless block 33 64 2012 air run setblock 33 64 2012 air
fill 36 64 2011 36 64 2012 clay replace air
fill 36 64 2011 36 64 2012 clay replace redstone_block
fill 35 64 2011 35 64 2012 air replace sticky_piston[extended=true]
fill 35 64 2011 35 64 2012 sticky_piston[extended=false,facing=west] replace air


# ALCOVE 3 SETUP
execute unless block -33 64 2011 air run setblock -33 64 2011 air
execute unless block -33 64 2012 air run setblock -33 64 2012 air
fill -36 64 2011 -36 64 2012 clay replace air
fill -36 64 2011 -36 64 2012 clay replace redstone_block
fill -35 64 2011 -35 64 2012 air replace sticky_piston[extended=true]
fill -35 64 2011 -35 64 2012 sticky_piston[extended=false,facing=east] replace air


# ALCOVE 4 SETUP
execute unless block -33 64 1988 air run setblock -33 64 1988 air
execute unless block -33 64 1989 air run setblock -33 64 1989 air
fill -36 64 1988 -36 64 1989 clay replace air
fill -36 64 1988 -36 64 1989 clay replace redstone_block
fill -35 64 1988 -35 64 1989 air replace sticky_piston[extended=true]
fill -35 64 1988 -35 64 1989 sticky_piston[extended=false,facing=east] replace air



# SETUP FOR ROUND -> ALCOVE 1
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 65 1988 lime_glazed_terracotta[facing=south] run setblock 34 65 1988 lime_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 65 1989 lime_glazed_terracotta[facing=east] run setblock 34 65 1989 lime_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 64 1988 lime_glazed_terracotta[facing=west] run setblock 34 64 1988 lime_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 64 1989 lime_glazed_terracotta[facing=north] run setblock 34 64 1989 lime_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=0..1}] unless block 37 67 1995 spawner{SpawnData:{id:"minecraft:slime"}} run setblock 37 67 1995 barrier
execute if entity @e[scores={ArenaRound=0..1}] if block 37 67 1995 barrier run setblock 37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:slime",Size:0,Rotation:[180f,0f],Tags:["ArenaMob","Alcove1Mob","ArenaSlime"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=2}] unless block 34 65 1988 orange_glazed_terracotta[facing=north] run setblock 34 65 1988 orange_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=2}] unless block 34 65 1989 orange_glazed_terracotta[facing=west] run setblock 34 65 1989 orange_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=2}] unless block 34 64 1988 orange_glazed_terracotta[facing=east] run setblock 34 64 1988 orange_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=2}] unless block 34 64 1989 orange_glazed_terracotta[facing=south] run setblock 34 64 1989 orange_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=2}] unless block 37 67 1995 spawner{SpawnData:{id:"minecraft:magma_cube"}} run setblock 37 67 1995 barrier
execute if entity @e[scores={ArenaRound=2}] if block 37 67 1995 barrier run setblock 37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:magma_cube",Size:0,Rotation:[180f,0f],Tags:["ArenaMob","Alcove1Mob","ArenaMagmaCube"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=3}] unless block 34 65 1988 pink_glazed_terracotta[facing=west] run setblock 34 65 1988 pink_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=3}] unless block 34 65 1989 pink_glazed_terracotta[facing=south] run setblock 34 65 1989 pink_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=3}] unless block 34 64 1988 pink_glazed_terracotta[facing=north] run setblock 34 64 1988 pink_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=3}] unless block 34 64 1989 pink_glazed_terracotta[facing=east] run setblock 34 64 1989 pink_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=3}] unless block 37 67 1995 spawner{SpawnData:{id:"minecraft:stray"}} run setblock 37 67 1995 barrier
execute if entity @e[scores={ArenaRound=3}] if block 37 67 1995 barrier run setblock 37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:pillager",Rotation:[90f,0f],Tags:["ArenaMob","Alcove1Mob","ArenaPillager"],Passengers:[{id:"minecraft:spider"}]},RequiredPlayerRange:9s}


#execute if entity @e[scores={ArenaRound=3}] unless block 34 65 1988 light_blue_glazed_terracotta[facing=west] run setblock 34 65 1988 light_blue_glazed_terracotta[facing=west]
#execute if entity @e[scores={ArenaRound=3}] unless block 34 65 1989 light_blue_glazed_terracotta[facing=south] run setblock 34 65 1989 light_blue_glazed_terracotta[facing=south]
#execute if entity @e[scores={ArenaRound=3}] unless block 34 64 1988 light_blue_glazed_terracotta[facing=north] run setblock 34 64 1988 light_blue_glazed_terracotta[facing=north]
#execute if entity @e[scores={ArenaRound=3}] unless block 34 64 1989 light_blue_glazed_terracotta[facing=east] run setblock 34 64 1989 light_blue_glazed_terracotta[facing=east]
#execute if entity @e[scores={ArenaRound=3}] unless block 37 67 1995 spawner{SpawnData:{id:"minecraft:stray"}} run setblock 37 67 1995 barrier
#execute if entity @e[scores={ArenaRound=3}] if block 37 67 1995 barrier run setblock 37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:stray",Rotation:[180f,0f],Tags:["ArenaMob","Alcove1Mob","ArenaStray"],Passengers:[{id:"minecraft:spider"}]},RequiredPlayerRange:9s}



# SETUP FOR ROUND -> ALCOVE 2
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 65 2011 green_glazed_terracotta[facing=south] run setblock 34 65 2011 green_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 65 2012 green_glazed_terracotta[facing=east] run setblock 34 65 2012 green_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 64 2011 green_glazed_terracotta[facing=west] run setblock 34 64 2011 green_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=0..1}] unless block 34 64 2012 green_glazed_terracotta[facing=north] run setblock 34 64 2012 green_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=0..1}] unless block 37 67 2005 spawner{SpawnData:{id:"minecraft:zombie"}} run setblock 37 67 2005 barrier
execute if entity @e[scores={ArenaRound=0..1}] if block 37 67 2005 barrier run setblock 37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:zombie",Rotation:[0f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["ArenaMob","Alcove2Mob","ArenaZombie"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=2}] unless block 34 65 2011 purple_glazed_terracotta[facing=north] run setblock 34 65 2011 purple_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=2}] unless block 34 65 2012 purple_glazed_terracotta[facing=west] run setblock 34 65 2012 purple_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=2}] unless block 34 64 2011 purple_glazed_terracotta[facing=east] run setblock 34 64 2011 purple_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=2}] unless block 34 64 2012 purple_glazed_terracotta[facing=south] run setblock 34 64 2012 purple_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=2}] unless block 37 67 2005 spawner{SpawnData:{id:"minecraft:witch"}} run setblock 37 67 2005 barrier
execute if entity @e[scores={ArenaRound=2}] if block 37 67 2005 barrier run setblock 37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:witch",Rotation:[0f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["ArenaMob","Alcove2Mob","ArenaWitch"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=3}] unless block 34 65 2011 light_gray_glazed_terracotta[facing=west] run setblock 34 65 2011 light_gray_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=3}] unless block 34 65 2012 light_gray_glazed_terracotta[facing=south] run setblock 34 65 2012 light_gray_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=3}] unless block 34 64 2011 light_gray_glazed_terracotta[facing=north] run setblock 34 64 2011 light_gray_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=3}] unless block 34 64 2012 light_gray_glazed_terracotta[facing=east] run setblock 34 64 2012 light_gray_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=3}] unless block 37 67 2005 spawner{SpawnData:{id:"minecraft:vindicator"}} run setblock 37 67 2005 barrier
execute if entity @e[scores={ArenaRound=3}] if block 37 67 2005 barrier run setblock 37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:vindicator",Rotation:[0f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["ArenaMob","Alcove2Mob","ArenaVindicator"]},RequiredPlayerRange:9s}


# SETUP FOR ROUND -> ALCOVE 3
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 2011 blue_glazed_terracotta[facing=north] run setblock -34 65 2011 blue_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 2012 blue_glazed_terracotta[facing=east] run setblock -34 65 2012 blue_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 2011 blue_glazed_terracotta[facing=west] run setblock -34 64 2011 blue_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 2012 blue_glazed_terracotta[facing=south] run setblock -34 64 2012 blue_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=0..1}] unless block -37 67 2005 spawner{SpawnData:{id:"minecraft:skeleton"}} run setblock -37 67 2005 barrier
execute if entity @e[scores={ArenaRound=0..1}] if block -37 67 2005 barrier run setblock -37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:skeleton",Rotation:[0f,0f],HandItems:[{id:"minecraft:bow",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["ArenaMob","Alcove2Mob","ArenaZombie"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=2}] unless block -34 65 2011 light_blue_glazed_terracotta[facing=north] run setblock -34 65 2011 light_blue_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=2}] unless block -34 65 2012 light_blue_glazed_terracotta[facing=east] run setblock -34 65 2012 light_blue_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=2}] unless block -34 64 2011 light_blue_glazed_terracotta[facing=west] run setblock -34 64 2011 light_blue_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=2}] unless block -34 64 2012 light_blue_glazed_terracotta[facing=south] run setblock -34 64 2012 light_blue_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=2}] unless block -37 67 2005 spawner{SpawnData:{id:"minecraft:stray"}} run setblock -37 67 2005 barrier
execute if entity @e[scores={ArenaRound=2}] if block -37 67 2005 barrier run setblock -37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:stray",Rotation:[180f,0f],Tags:["ArenaMob","Alcove3Mob","ArenaStray"],Passengers:[{id:"minecraft:stray"}]},RequiredPlayerRange:9s}

#execute if entity @e[scores={ArenaRound=2}] unless block -34 65 2011 cyan_glazed_terracotta[facing=south] run setblock -34 65 2011 cyan_glazed_terracotta[facing=south]
#execute if entity @e[scores={ArenaRound=2}] unless block -34 65 2012 cyan_glazed_terracotta[facing=west] run setblock -34 65 2012 cyan_glazed_terracotta[facing=west]
#execute if entity @e[scores={ArenaRound=2}] unless block -34 64 2011 cyan_glazed_terracotta[facing=east] run setblock -34 64 2011 cyan_glazed_terracotta[facing=east]
#execute if entity @e[scores={ArenaRound=2}] unless block -34 64 2012 cyan_glazed_terracotta[facing=north] run setblock -34 64 2012 cyan_glazed_terracotta[facing=north]
#execute if entity @e[scores={ArenaRound=2}] unless block -37 67 2005 spawner{SpawnData:{id:"minecraft:creeper"}} run setblock -37 67 2005 barrier
#execute if entity @e[scores={ArenaRound=2}] if block -37 67 2005 barrier run setblock -37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:creeper",Rotation:[0f,0f],Tags:["ArenaMob","Alcove2Mob","ArenaCreeper"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=3}] unless block -34 65 2011 gray_glazed_terracotta[facing=west] run setblock -34 65 2011 gray_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=3}] unless block -34 65 2012 gray_glazed_terracotta[facing=north] run setblock -34 65 2012 gray_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=3}] unless block -34 64 2011 gray_glazed_terracotta[facing=south] run setblock -34 64 2011 gray_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=3}] unless block -34 64 2012 gray_glazed_terracotta[facing=east] run setblock -34 64 2012 gray_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=3}] unless block -37 67 2005 spawner{SpawnData:{id:"minecraft:evoker"}} run setblock -37 67 2005 barrier
execute if entity @e[scores={ArenaRound=3}] if block -37 67 2005 barrier run setblock -37 67 2005 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:evoker",Rotation:[0f,0f],Tags:["ArenaMob","Alcove2Mob","ArenaEvoker"]},RequiredPlayerRange:9s}


# SETUP FOR ROUND -> ALCOVE 4
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 1988 cyan_glazed_terracotta[facing=south] run setblock -34 65 1988 cyan_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 1989 cyan_glazed_terracotta[facing=west] run setblock -34 65 1989 cyan_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 1988 cyan_glazed_terracotta[facing=east] run setblock -34 64 1988 cyan_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 1989 cyan_glazed_terracotta[facing=north] run setblock -34 64 1989 cyan_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=0..1}] unless block -37 67 1995 spawner{SpawnData:{id:"minecraft:cave_spider"}} run setblock -37 67 1995 barrier
execute if entity @e[scores={ArenaRound=0..1}] if block -37 67 1995 barrier run setblock -37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:creeper",Rotation:[0f,0f],Tags:["ArenaMob","Alcove4Mob","ArenaCreeper"]},RequiredPlayerRange:9s}

#execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 1988 pink_glazed_terracotta[facing=north] run setblock -34 65 1988 pink_glazed_terracotta[facing=north]
#execute if entity @e[scores={ArenaRound=0..1}] unless block -34 65 1989 pink_glazed_terracotta[facing=east] run setblock -34 65 1989 pink_glazed_terracotta[facing=east]
#execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 1988 pink_glazed_terracotta[facing=west] run setblock -34 64 1988 pink_glazed_terracotta[facing=west]
#execute if entity @e[scores={ArenaRound=0..1}] unless block -34 64 1989 pink_glazed_terracotta[facing=south] run setblock -34 64 1989 pink_glazed_terracotta[facing=south]
#execute if entity @e[scores={ArenaRound=0..1}] unless block -37 67 1995 spawner{SpawnData:{id:"minecraft:cave_spider"}} run setblock -37 67 1995 barrier
#execute if entity @e[scores={ArenaRound=0..1}] if block -37 67 1995 barrier run setblock -37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:cave_spider",Rotation:[180f,0f],Tags:["ArenaMob","Alcove4Mob","ArenaCaveSpider"]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=2}] unless block -34 65 1988 brown_glazed_terracotta[facing=east] run setblock -34 65 1988 brown_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=2}] unless block -34 65 1989 brown_glazed_terracotta[facing=south] run setblock -34 65 1989 brown_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=2}] unless block -34 64 1988 brown_glazed_terracotta[facing=north] run setblock -34 64 1988 brown_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=2}] unless block -34 64 1989 brown_glazed_terracotta[facing=west] run setblock -34 64 1989 brown_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=2}] unless block -37 67 1995 spawner{SpawnData:{id:"minecraft:zombie_horse"}} run setblock -37 67 1995 barrier
execute if entity @e[scores={ArenaRound=2}] if block -37 67 1995 barrier run setblock -37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:zombie_horse",Rotation:[180f,0f],Tags:["ArenaMob","Alcove4Mob","ArenaBabyZombie"],Passengers:[{id:"minecraft:zombie_villager",IsBaby:1b}]},RequiredPlayerRange:9s}

execute if entity @e[scores={ArenaRound=3}] unless block -34 65 1988 black_glazed_terracotta[facing=west] run setblock -34 65 1988 black_glazed_terracotta[facing=west]
execute if entity @e[scores={ArenaRound=3}] unless block -34 65 1989 black_glazed_terracotta[facing=north] run setblock -34 65 1989 black_glazed_terracotta[facing=north]
execute if entity @e[scores={ArenaRound=3}] unless block -34 64 1988 black_glazed_terracotta[facing=south] run setblock -34 64 1988 black_glazed_terracotta[facing=south]
execute if entity @e[scores={ArenaRound=3}] unless block -34 64 1989 black_glazed_terracotta[facing=east] run setblock -34 64 1989 black_glazed_terracotta[facing=east]
execute if entity @e[scores={ArenaRound=3}] unless block -37 67 1995 spawner{SpawnData:{id:"minecraft:wither_skeleton"}} run setblock -37 67 1995 barrier
execute if entity @e[scores={ArenaRound=3}] if block -37 67 1995 barrier run setblock -37 67 1995 spawner{MaxNearbyEntities:15s,SpawnCount:0s,Delay:200s,SpawnRange:2s,MinSpawnDelay:32000s,MaxSpawnDelay:34000s,SpawnData:{id:"minecraft:wither_skeleton",Rotation:[180f,0f],Tags:["ArenaMob","Alcove4Mob","ArenaW"],Passengers:[{id:"minecraft:zombie_villager",IsBaby:1b}]},RequiredPlayerRange:9s}



# SETUP FOR BOSS ALCOVE
execute if entity @e[scores={ArenaRound=0}] run fill -2 63 2021 2 63 2021 polished_andesite
execute if entity @e[scores={ArenaRound=0}] run fill -2 64 2021 2 67 2021 iron_bars[east=true,west=true]
execute if entity @e[scores={ArenaRound=0}] run fill -1 58 2023 1 63 2025 air replace oak_planks
execute if entity @e[scores={ArenaRound=0}] run fill -1 58 2023 1 63 2025 air replace birch_planks

execute if entity @e[scores={ArenaRound=0}] run fill -1 63 2027 1 63 2027 sandstone
execute if entity @e[scores={ArenaRound=0}] run fill -1 64 2027 1 66 2027 sand


# TERRAIN SETUP FOR ROUND 1
fill -2 21 2021 2 25 2021 iron_bars[east=true,west=true,north=false,south=false] replace iron_bars[east=true,west=true,north=true,south=true]
fill -2 7 2021 2 10 2021 iron_bars[east=true,west=true,north=false,south=false] replace iron_bars[east=true,west=true,north=true,south=true]

execute if entity @e[scores={ArenaRound=0}] unless block 0 62 2000 sand run setblock -29 34 1971 redstone_block
execute if entity @e[scores={ArenaRound=0}] if block -29 34 1971 redstone_block run setblock -30 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_1a",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=0}] if block -30 57 1971 structure_block run setblock -29 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=0}] unless block 1 62 2000 sand run setblock 2 34 1971 redstone_block
execute if entity @e[scores={ArenaRound=0}] if block 2 34 1971 redstone_block run setblock 1 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_1b",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=0}] if block 1 57 1971 structure_block run setblock 2 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=0}] unless block 0 62 2001 sand run setblock -29 34 2001 redstone_block
execute if entity @e[scores={ArenaRound=0}] if block -29 34 2001 redstone_block run setblock -30 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_1c",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=0}] if block -30 57 2001 structure_block run setblock -29 57 2001 redstone_block

execute if entity @e[scores={ArenaRound=0}] unless block 1 62 2001 sand run setblock 2 34 2001 redstone_block
execute if entity @e[scores={ArenaRound=0}] if block 2 34 2001 redstone_block run setblock 1 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_1d",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=0}] if block 1 57 2001 structure_block run setblock 2 57 2001 redstone_block


# CLOSE WIN GATE
execute if entity @e[scores={ArenaRound=0}] run fill -2 71 1961 2 71 1961 polished_andesite replace iron_bars
execute if entity @e[scores={ArenaRound=0}] run fill -2 72 1961 2 75 1961 iron_bars[east=true,west=true] replace air