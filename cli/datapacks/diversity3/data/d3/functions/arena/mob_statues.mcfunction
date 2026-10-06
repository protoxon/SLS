####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 27 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute unless entity @e[team=ArenaStatues] run team add ArenaStatues
team modify ArenaStatues collisionRule never


# SILVERFISH - WHITE
#execute unless entity @e[scores={SilverfishTotal=1..}] unless block -22 43 1958 air run setblock -22 43 1958 air
#execute unless entity @e[scores={SilverfishTotal=1..}] if entity @e[tag=ArenaSilverfishStatue] run kill @e[tag=ArenaSilverfishStatue]
#execute if entity @e[scores={SilverfishTotal=1..}] unless block -22 43 1958 redstone_torch run setblock -22 43 1958 redstone_torch
#execute if entity @e[scores={SilverfishTotal=1..}] unless entity @e[tag=ArenaSilverfishStatue] run summon silverfish -21.3 47 1958.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaSilverfishStatue"]}

# SLIME - LIME
execute unless entity @e[scores={SlimeTotal=1..}] unless block -22 43 1958 air run setblock -22 43 1958 air
execute unless entity @e[scores={SlimeTotal=1..}] if entity @e[tag=ArenaSlimeStatue] run kill @e[tag=ArenaSlimeStatue]
execute if entity @e[scores={SlimeTotal=1..}] unless block -22 43 1958 redstone_torch run setblock -22 43 1958 redstone_torch
execute if entity @e[scores={SlimeTotal=1..}] unless entity @e[tag=ArenaSlimeStatue] run summon slime -22 47 1958 {Size:1,NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaSlimeStatue"]}

# ZOMBIE - GREEN
execute unless entity @e[scores={ZombieTotal=1..}] unless block -22 43 1954 air run setblock -22 43 1954 air
execute unless entity @e[scores={ZombieTotal=1..}] if entity @e[tag=ArenaZombieStatue] run kill @e[tag=ArenaZombieStatue]
execute if entity @e[scores={ZombieTotal=1..}] unless block -22 43 1954 redstone_torch run setblock -22 43 1954 redstone_torch
execute if entity @e[scores={ZombieTotal=1..}] unless entity @e[tag=ArenaZombieStatue] run summon zombie -21.5 47 1954.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaZombieStatue"]}

# SKELETON - BLUE
execute unless entity @e[scores={SkeletonTotal=1..}] unless block -22 43 1950 air run setblock -22 43 1950 air
execute unless entity @e[scores={SkeletonTotal=1..}] if entity @e[tag=ArenaSkeletonStatue] run kill @e[tag=ArenaSkeletonStatue]
execute if entity @e[scores={SkeletonTotal=1..}] unless block -22 43 1950 redstone_torch run setblock -22 43 1950 redstone_torch
execute if entity @e[scores={SkeletonTotal=1..}] unless entity @e[tag=ArenaSkeletonStatue] run summon skeleton -21.5 47 1950.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaSkeletonStatue"]}

# CREEPER - CYAN
execute unless entity @e[scores={CreeperTotal=1..}] unless block -22 43 1946 air run setblock -22 43 1946 air
execute unless entity @e[scores={CreeperTotal=1..}] if entity @e[tag=ArenaCreeperStatue] run kill @e[tag=ArenaCreeperStatue]
execute if entity @e[scores={CreeperTotal=1..}] unless block -22 43 1946 redstone_torch run setblock -22 43 1946 redstone_torch
execute if entity @e[scores={CreeperTotal=1..}] unless entity @e[tag=ArenaCreeperStatue] run summon creeper -21.5 47 1946.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaCreeperStatue"]}

# CAVE SPIDER - PINK
#execute unless entity @e[scores={CaveSpiderTotal=1..}] unless block -22 43 1946 air run setblock -22 43 1946 air
#execute unless entity @e[scores={CaveSpiderTotal=1..}] if entity @e[tag=ArenaCaveSpiderStatue] run kill @e[tag=ArenaCaveSpiderStatue]
#execute if entity @e[scores={CaveSpiderTotal=1..}] unless block -22 43 1946 redstone_torch run setblock -22 43 1946 redstone_torch
#execute if entity @e[scores={CaveSpiderTotal=1..}] unless entity @e[tag=ArenaCaveSpiderStatue] run summon cave_spider -21.5 47 1946.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaCaveSpiderStatue"]}

#execute if entity @e[tag=ArenaSpiderStatue] run teleport @e[tag=ArenaSpiderStatue] -21.5 46.8 1946.5





# MAGMA CUBE - ORANGE
execute unless entity @e[scores={MagmaCubeTotal=1..}] unless block -26 43 1958 air run setblock -26 43 1958 air
execute unless entity @e[scores={MagmaCubeTotal=1..}] if entity @e[tag=ArenaMagmaCubeStatue] run kill @e[tag=ArenaMagmaCubeStatue]
execute if entity @e[scores={MagmaCubeTotal=1..}] unless block -26 43 1958 redstone_torch run setblock -26 43 1958 redstone_torch
execute if entity @e[scores={MagmaCubeTotal=1..}] unless entity @e[tag=ArenaMagmaCubeStatue] run summon magma_cube -25.5 47 1958.5 {Size:1,NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaMagmaCubeStatue"]}

# WITCHES - PURPLE
execute unless entity @e[scores={WitchTotal=1..}] unless block -26 43 1954 air run setblock -26 43 1954 air
execute unless entity @e[scores={WitchTotal=1..}] if entity @e[tag=ArenaWitchStatue] run kill @e[tag=ArenaWitchStatue]
execute if entity @e[scores={WitchTotal=1..}] unless block -26 43 1954 redstone_torch run setblock -26 43 1954 redstone_torch
execute if entity @e[scores={WitchTotal=1..}] unless entity @e[tag=ArenaWitchStatue] run summon witch -25.5 47 1954.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaWitchStatue"]}

# STRIDER - LIGHT BLUE
execute unless entity @e[tag=ArenaSpiderStatue] run kill @e[tag=ArenaStrayStatue]
execute unless entity @e[tag=ArenaStrayStatue] run kill @e[tag=ArenaSpiderStatue]
#execute unless entity @e[tag=ArenaCaveSpiderStatue] run kill @e[tag=ArenaStrayStatue]

execute unless entity @e[scores={StrayTotal=1..}] unless block -26 43 1950 air run setblock -26 43 1950 air
execute unless entity @e[scores={StrayTotal=1..}] if entity @e[tag=ArenaStrayStatue] run kill @e[tag=ArenaStrayStatue]
execute if entity @e[scores={StrayTotal=1..}] unless block -26 43 1950 redstone_torch run setblock -26 43 1950 redstone_torch
execute if entity @e[scores={StrayTotal=1..}] unless entity @e[tag=ArenaStrayStatue] run summon stray -25.5 47 1950.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,ArmorItems:[{},{},{},{id:"minecraft:smoker",Count:1b}],Tags:["ArenaMob","ArenaStatue","ArenaStrayStatue"],Passengers:[{id:"minecraft:cave_spider",NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaSpiderStatue"]}]}

#execute if entity @e[scores={StrayTotal=1..}] unless entity @e[tag=ArenaStrayStatue] run summon spider -25.5 47 1950.5 {NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaSpiderStatue"],Passengers:[{id:"minecraft:stray",NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaStrayStatue"],Passengers:[{id:"minecraft:cave_spider",NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaCaveSpiderStatue"]}]}]}

# BABY ZOMBIE VILLAGER JOCKEYS - BROWN
execute unless entity @e[tag=ArenaZombieHorseStatue] run kill @e[tag=ArenaBabyZombieStatue]
execute unless entity @e[tag=ArenaBabyZombieStatue] run kill @e[tag=ArenaBabyZombieASStatue]
execute unless entity @e[tag=ArenaBabyZombieStatue] run kill @e[tag=ArenaZombieHorseStatue]
execute unless entity @e[tag=ArenaBabyZombieASStatue] run kill @e[tag=ArenaBabyZombieStatue]

execute unless entity @e[scores={BabyZombieTotal=1..}] unless block -26 43 1946 air run setblock -26 43 1946 air
execute unless entity @e[scores={BabyZombieTotal=1..}] if entity @e[tag=ArenaBabyZombieStatue] run kill @e[tag=ArenaBabyZombieStatue]
execute if entity @e[scores={BabyZombieTotal=1..}] unless block -26 43 1946 redstone_torch run setblock -26 43 1946 redstone_torch
execute if entity @e[scores={BabyZombieTotal=1..}] unless entity @e[tag=ArenaZombieHorseStatue] run summon zombie_horse -25.5 47 1946.5 {NoAI:true,Age:-99999999,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaZombieHorseStatue"]}
execute if entity @e[scores={BabyZombieTotal=1..}] unless entity @e[tag=ArenaBabyZombieStatue] run summon armor_stand -25.5 46.8 1946.5 {NoGravity:true,Small:true,Invulnerable:true,Invisible:true,PersistenceRequired:1b,Rotation:[270f,0f],Tags:["ArenaMob","ArenaStatue","ArenaBabyZombieASStatue"],DisabledSlots:1973790,Passengers:[{id:"minecraft:zombie_villager",IsBaby:true,Profession:0,NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaBabyZombieStatue"]}]}

execute if entity @e[tag=ArenaBabyZombieASStatue] run teleport @e[tag=ArenaBabyZombieASStatue] -25.5 46.8 1946.5
execute as @e[type=zombie_horse,tag=ArenaZombieHorseStatue] run data merge entity @s {Age:-9999999}


#summon zombie_horse ~ ~0.5 ~ {Age:-99999,Tame:1b,NoAI:true,PersistenceRequired:1b,Rotation:[270f,0f],Passengers:[{id:"minecraft:zombie_villager",IsBaby:true,NoAI:true,Rotation:[270f,0f],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}]}]}

#summon zombie_horse ~ ~0.5 ~ {Age:-99999,Passengers:[{id:"minecraft:zombie_villager",IsBaby:true}]}




# PILLAGER - PINK
execute unless entity @e[scores={PillagerTotal=1..}] unless block -30 43 1958 air run setblock -30 43 1958 air
execute unless entity @e[scores={PillagerTotal=1..}] if entity @e[tag=ArenaPillagerStatue] run kill @e[tag=ArenaPillagerStatue]
execute if entity @e[scores={PillagerTotal=1..}] unless block -30 43 1958 redstone_torch run setblock -30 43 1958 redstone_torch
execute if entity @e[scores={PillagerTotal=1..}] unless entity @e[tag=ArenaPillagerStatue] run summon pillager -29.5 47 1958.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,HandItem:[{id:"minecraft:crossbow",Count:1b}],ArmorItems:[{},{},{id:"minecraft:elytra",Count:0b},{id:"minecraft:dragon_head",Count:0b}],Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaPillagerStatue"]}

# VINDICATOR - LIGHT GRAY
execute unless entity @e[scores={VindicatorTotal=1..}] unless block -30 43 1954 air run setblock -30 43 1954 air
execute unless entity @e[scores={VindicatorTotal=1..}] if entity @e[tag=ArenaVindicatorStatue] run kill @e[tag=ArenaVindicatorStatue]
execute if entity @e[scores={VindicatorTotal=1..}] unless block -30 43 1954 redstone_torch run setblock -30 43 1954 redstone_torch
execute if entity @e[scores={VindicatorTotal=1..}] unless entity @e[tag=ArenaVindicatorStatue] run summon vindicator -29.5 47 1954.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaVindicatorStatue"]}

# EVOKER - GRAY
execute unless entity @e[scores={EvokerTotal=1..}] unless block -30 43 1950 air run setblock -30 43 1950 air
execute unless entity @e[scores={EvokerTotal=1..}] if entity @e[tag=ArenaEvokerStatue] run kill @e[tag=ArenaEvokerStatue]
execute if entity @e[scores={EvokerTotal=1..}] unless block -30 43 1950 redstone_torch run setblock -30 43 1950 redstone_torch
execute if entity @e[scores={EvokerTotal=1..}] unless entity @e[tag=ArenaEvokerStatue] run summon evoker -29.5 47 1950.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaEvokerStatue"]}

# WITHER SKELETONS - BLACK
execute unless entity @e[scores={WSkeletonTotal=1..}] unless block -30 43 1946 air run setblock -30 43 1946 air
execute unless entity @e[scores={WSkeletonTotal=1..}] if entity @e[tag=ArenaWitherSkeletonStatue] run kill @e[tag=ArenaWitherSkeletonStatue]
execute if entity @e[scores={WSkeletonTotal=1..}] unless block -30 43 1946 redstone_torch run setblock -30 43 1946 redstone_torch
execute if entity @e[scores={WSkeletonTotal=1..}] unless entity @e[tag=ArenaWitherSkeletonStatue] run summon wither_skeleton -29.5 47 1946.5 {NoAI:true,Invulnerable:true,Silent:true,PersistenceRequired:1b,ArmorItems:[{},{},{id:"minecraft:elytra",Count:1b},{id:"minecraft:dragon_head",Count:1b}],Rotation:[270f,0f],Team:ArenaStatues,Tags:["ArenaMob","ArenaStatue","ArenaWitherSkeletonStatue"]}



# KILL SIGNS
function d3:arena/kill_signs





# BOSS STATUES
execute if block 11 1 78 gold_block if block -42 47 1952 air if block -42 47 1951 air unless entity @e[tag=ArenaBoss1Statue] run summon ocelot -42 47 1955 {Age:-9999999,NoAI:0b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[270f,0f],Tags:["ArenaMob","ArenaBossStatue","ArenaBoss1Statue"],Passengers:[{id:"minecraft:silverfish",NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[270f,0f],Tags:["ArenaMob","ArenaBossStatue","ArenaBoss1Statue"],CustomName:"{\"text\":\"Catfish Cayleigh\",\"color\":\"gold\"}",CustomNameVisible:true}]}
execute unless entity @e[tag=ArenaBoss1Statue,type=silverfish] run kill @e[tag=ArenaBoss1Statue,type=ocelot]
execute unless entity @e[tag=ArenaBoss1Statue,type=ocelot] run kill @e[tag=ArenaBoss1Statue,type=silverfish]
execute store result entity @e[tag=ArenaBoss1Statue,type=silverfish,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss1Statue,type=ocelot,limit=1] Rotation[0]


execute if block 11 3 78 gold_block if block -42 47 1952 air if block -42 47 1951 air unless entity @e[tag=ArenaBoss2Statue] run summon husk -42 47 1952 {NoAI:0b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[270f,0f],HandItems:[{id:"minecraft:golden_hoe",Count:1b},{id:"minecraft:golden_hoe",Count:1b}],Tags:["ArenaMob","ArenaBossStatue","ArenaBoss2Statue"],Passengers:[{id:"minecraft:guardian",NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[270f,0f],Tags:["ArenaMob","ArenaBossStatue","ArenaBoss2Statue"],CustomName:"{\"text\":\"Gabe the Cyclops\",\"color\":\"gold\"}",CustomNameVisible:true}]}
execute unless entity @e[tag=ArenaBoss2Statue,type=guardian] run kill @e[tag=ArenaBoss2Statue,type=husk]
execute unless entity @e[tag=ArenaBoss2Statue,type=husk] run kill @e[tag=ArenaBoss2Statue,type=guardian]
execute store result entity @e[tag=ArenaBoss2Statue,type=guardian,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss2Statue,type=husk,limit=1] Rotation[0]


execute if block 11 5 78 gold_block if block -42 47 1952 air if block -42 47 1951 air unless entity @e[tag=ArenaBoss3Statue] run summon illusioner -42 47 1949 {NoAI:0b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[270f,0f],Tags:["ArenaMob","ArenaBossStatue","ArenaBoss3Statue"],CustomName:"{\"text\":\"IllusioNeige\",\"color\":\"gold\"}",CustomNameVisible:true}



#



# BOSS ILLUSIONER
# BOSS GOLEM
# RIDING BOSS POLAR BEAR


