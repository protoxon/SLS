####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019 / JUNE 29 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#say snow details not changed


# SETS BED
execute if block 6 11 -18 snow_block if block 10 62 -934 snow_block unless block 10 63 -934 red_bed[facing=south,part=foot] run setblock 10 63 -934 red_bed[facing=south,part=foot]
execute if block 6 11 -18 snow_block if block 10 62 -934 snow_block unless block 10 63 -933 red_bed[facing=south,part=head] run setblock 10 63 -933 red_bed[facing=south,part=head]


# SETS VILLAGER CONVERSION
execute if block 6 11 -18 snow_block if block 8 48 -938 mossy_stone_bricks unless entity @e[tag=SurvivalVillager] run summon villager 7 48 -939 {PersistenceRequired:1b,Tags:["SurvivalVillager","SurvivalMob"],Rotation:[270.0f,0.0f],VillagerData:{profession:"minecraft:none",type:"minecraft:snow",level:2}}
execute if block 6 11 -18 snow_block if block 8 48 -938 mossy_stone_bricks unless entity @e[tag=SurvivalZombie] run summon zombie_villager 9 48 -939 {IsBaby:false,PersistenceRequired:1b,Tags:["SurvivalZombie","SurvivalMob"],Rotation:[90.0f,0.0f],VillagerData:{profession:"minecraft:none",type:"minecraft:snow",level:2}}


# SETS MOBS
execute if block 6 11 -18 snow_block if block 7 63 -927 grass_block unless entity @e[tag=SurvivalSnowGolem] run summon snow_golem 7 65 -927 {PersistenceRequired:1b,Tags:["SurvivalSnowGolem","SurvivalMob"],Pumpkin:false,Rotation:[180.0f,0.0f]}


execute if block 6 11 -18 snow_block if block 21 64 -934 grass_block unless entity @e[tag=SurvivalBear1] run summon polar_bear 21 65 -934 {PersistenceRequired:1b,Tags:["SurvivalBear1","SurvivalMob"],Rotation:[180.0f,0.0f]}
execute if block 6 11 -18 snow_block if block 17 64 -934 grass_block unless entity @e[tag=SurvivalCub1] run summon polar_bear 17 65 -934 {PersistenceRequired:1b,Tags:["SurvivalCub1","SurvivalMob"],Age:-32768,Rotation:[180.0f,0.0f]}
execute if block 6 11 -18 snow_block if block 1 62 -940 grass_block unless entity @e[tag=SurvivalBear2] run summon polar_bear 1 63 -940 {PersistenceRequired:1b,Tags:["SurvivalBear2","SurvivalMob"],Rotation:[180.0f,0.0f]}
execute if block 6 11 -18 snow_block if block -3 62 -940 grass_block unless entity @e[tag=SurvivalCub2] run summon polar_bear -3 63 -940 {PersistenceRequired:1b,Tags:["SurvivalCub2","SurvivalMob"],Age:-32768,Rotation:[180.0f,0.0f]}

execute if block 10 63 -934 red_bed[facing=south,part=foot] if block 10 63 -933 red_bed[facing=south,part=head] if entity @e[tag=SurvivalVillager] if entity @e[tag=SurvivalZombie] if entity @e[tag=SurvivalSnowGolem] if entity @e[tag=SurvivalBear1] if entity @e[tag=SurvivalCub1] if entity @e[tag=SurvivalBear2] if entity @e[tag=SurvivalCub2] run setblock 6 13 -18 snow_block

# FOR TESTING
#execute if block 10 63 -934 red_bed[facing=south,part=foot] if block 10 63 -933 red_bed[facing=south,part=head] if entity @e[tag=SurvivalVillager] if entity @e[tag=SurvivalZombie] if entity @e[tag=SurvivalSnowGolem] if entity @e[tag=SurvivalBear1] if entity @e[tag=SurvivalCub1] if entity @e[tag=SurvivalBear2] if entity @e[tag=SurvivalCub2] run say snow details changed