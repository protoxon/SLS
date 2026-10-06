####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 6 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar Boss1Attack
#effect give @p regeneration 10 255 true

execute at @e[tag=ArenaBoss1,type=ocelot,nbt={OnGround:1b}] unless block ~ ~ ~ skeleton_skull run scoreboard players add @e[tag=MainArenaAEC,scores={Boss1Attack=0..}] Boss1Attack 1
scoreboard players set @e[tag=MainArenaAEC,scores={Boss1Attack=300..}] Boss1Attack 0


# CAT PEE
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=99}] at @e[tag=ArenaBoss1,type=ocelot] run summon area_effect_cloud ~ ~ ~ {Tags:["ArenaAEC","CatPeeAEC"],Duration:200}

scoreboard players add @e[tag=CatPeeAEC] Boss1Attack 1
execute at @e[tag=CatPeeAEC,scores={Boss1Attack=1}] unless entity @e[tag=ArenaCatPeeBlock1] run summon falling_block ~ ~-0.95 ~ {BlockState:{Name:"minecraft:yellow_terracotta"},NoGravity:1b,DropItem:false,Time:-200,Tags:["ArenaCatPeeBlock","ArenaCatPeeBlock1"]}
execute at @e[tag=CatPeeAEC,scores={Boss1Attack=1}] unless entity @e[tag=ArenaCatPeeBlock2] run summon falling_block ~1 ~-0.95 ~ {BlockState:{Name:"minecraft:yellow_terracotta"},NoGravity:1b,DropItem:false,Time:-200,Tags:["ArenaCatPeeBlock","ArenaCatPeeBlock2"]}
execute at @e[tag=CatPeeAEC,scores={Boss1Attack=1}] unless entity @e[tag=ArenaCatPeeBlock3] run summon falling_block ~1 ~-0.95 ~1 {BlockState:{Name:"minecraft:yellow_terracotta"},NoGravity:1b,DropItem:false,Time:-200,Tags:["ArenaCatPeeBlock","ArenaCatPeeBlock3"]}
execute at @e[tag=CatPeeAEC,scores={Boss1Attack=1}] unless entity @e[tag=ArenaCatPeeBlock4] run summon falling_block ~ ~-0.95 ~1 {BlockState:{Name:"minecraft:yellow_terracotta"},NoGravity:1b,DropItem:false,Time:-200,Tags:["ArenaCatPeeBlock","ArenaCatPeeBlock4"]}

execute at @e[tag=ArenaCatPeeBlock] run particle ambient_entity_effect ~ ~ ~ 0.2 0.1 0.2 0 1 force
#execute as @a at @s if entity @e[tag=CatPeeAEC,distance=..0.5] run effect give @s nausea 30 10



#execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=50}] as @e[tag=ArenaBoss1,type=silverfish] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=50}] run data merge entity @e[tag=ArenaBoss1,type=silverfish,limit=1] {NoAI:0b}
#execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=299}] run data merge entity @e[tag=ArenaBoss1,type=silverfish,limit=1] {NoAI:1b}


# DRIVER ARRIVES
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=50,ArenaTimer=2600..}] unless entity @e[tag=Boss1Helper] at @e[tag=ArenaBoss1,type=ocelot] run summon silverfish ~ ~0.3 ~ {Health:100f,Team:ArenaBoss,ActiveEffects:[{Id:12,Amplifier:0,Duration:1999980,ShowParticles:0b}],Attributes:[{Name:"generic.maxHealth",Base:100.0d},{Name:"generic.attackDamage",Base:3.5d},{Name:"generic.followRange",Base:25.0d}],Tags:["Boss1Helper"]}
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=50}] as @e[tag=Boss1Helper] at @e[tag=ArenaBoss1,type=ocelot] run teleport @s ~ ~ ~ ~ ~
scoreboard players set @e[tag=MainArenaAEC,scores={Boss1Attack=50}] Boss1Attack 51
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=51..}] as @e[tag=Boss1Helper] run data merge entity @s {NoAI:0b}
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=52..}] as @e[tag=ArenaBoss1,type=ocelot] at @e[tag=Boss1Helper] run teleport @s ~ ~ ~ ~ 0
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=..49}] as @e[tag=Boss1Helper] at @s run teleport @s ~ ~-100 ~ ~ ~
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=10..49}] run kill @e[tag=Boss1Helper]
execute if entity @e[tag=Boss1Helper] as @e[tag=ArenaBoss1,nbt=!{NoAI:1b}] run data merge entity @s {NoAI:1b}
execute unless entity @e[tag=Boss1Helper] as @e[tag=ArenaBoss1,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}
effect give @e[tag=Boss1Helper] speed 10 3 true
effect give @e[tag=Boss1Helper] invisibility 10 3 true
execute as @e[type=ocelot] run data merge entity @s {Age:-1000}




#ArenaRound=1,ArenaTimer=2600..

####execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=50..299}] as @e[tag=ArenaBoss1,type=ocelot] run summon silverfish ~ 50 ~ {NoAI:1b,Invulnerable:1b,Tags:["Boss1Helper"]}


execute if entity @e[tag=ArenaBoss1,type=silverfish,nbt=!{NoAI:1b}] store result entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Rotation[0]
execute if entity @e[tag=ArenaBoss1,type=silverfish,nbt={NoAI:1b}] store result entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Rotation[0]


effect give @e[tag=ArenaBoss1,type=ocelot] resistance 1 2 true

# HEALTH REGEN
scoreboard objectives add ArenaBoss1Regen deathCount
execute if entity @a[scores={ArenaBoss1Regen=1..}] run effect give @e[tag=ArenaBoss1] regeneration 2 5 false
scoreboard players reset @a[scores={ArenaBoss1Regen=1..}] ArenaBoss1Regen




















#summon ocelot ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:0.0}],Passengers:{id:"miencraft:silverfish"}}
#{ReapplicationDelay:20,Radius:2.0f,Potion:"minecraft:strong_poison",DurationOnUse:0,RadiusPerTick:-0.005f,Particle:"minecraft:entity_effect",RadiusOnUse:-0.5f,WaitTime:10,Age:46}

