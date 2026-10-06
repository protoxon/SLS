####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 8 2018 / JULY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BossCowAttack
#scoreboard objectives setdisplay sidebar RepairCowFight
#scoreboard objectives setdisplay sidebar CalfExplode
#scoreboard objectives setdisplay sidebar ManureBomb

scoreboard players add @e[scores={BossCowAttack=1..1000}] BossCowAttack 1
scoreboard players set @e[scores={BossCowAttack=5}] BossCowAttack 70
execute if entity @e[tag=FlyToTarget] run scoreboard players set @e[scores={BossCowAttack=0..}] BossCowAttack 0

execute if entity @e[tag=FlyToTarget] as @e[tag=BossMooshroom] at @s run teleport @s ^ ^ ^0.5 facing entity @e[tag=FlyToTarget,limit=1]
execute as @e[tag=FlyToTarget,type=armor_stand] at @a[tag=SwoopAttackRange,limit=1,sort=random] run teleport @s[distance=..2] ~ ~ ~
execute unless entity @e[tag=FlyToTarget] as @e[tag=BossMooshroom] at @s run teleport @s ^ ^ ^0.00009 facing entity @p


# FIXES BROKEN MECHANIC IF SCORE GETS STUCK ON ZERO
execute if entity @e[scores={BossCowAttack=0}] run scoreboard objectives add RepairCowFight dummy
execute unless entity @e[scores={BossCowAttack=0}] run scoreboard objectives remove RepairCowFight
scoreboard players add @e[tag=BossMooshroom] RepairCowFight 1
execute if entity @e[scores={RepairCowFight=100}] run function d3:boss/boss_cow_randomize_target
execute if entity @e[scores={RepairCowFight=280}] run function d3:boss/boss_cow_randomize_target


# RESETS COUNTER
execute as @e[tag=FlyToTarget,type=area_effect_cloud] at @s if entity @e[tag=BossMooshroom,distance=..1] run scoreboard players set @e[scores={BossCowAttack=0}] BossCowAttack 1
execute as @e[tag=FlyToTarget,type=area_effect_cloud] at @s if entity @e[tag=BossMooshroom,distance=..1] run function d3:boss/boss_cow_dialogue
execute as @e[tag=FlyToTarget,type=area_effect_cloud] at @s if entity @e[tag=BossMooshroom,distance=..1] run kill @s
execute if entity @e[scores={BossCowAttack=270..}] run function d3:boss/boss_cow_randomize_target


# MOVES MOOSHROOM IF HIT
execute at @a as @e[tag=BossMooshroom,nbt={HurtTime:10s},distance=..2] run tag @s add MooshroomInjured
execute as @a at @s if entity @e[tag=BossMooshroom,tag=!MooshroomInjured,distance=..1] run effect give @s instant_damage 1 1 true
execute as @a at @s if entity @e[tag=BossMooshroom,tag=!MooshroomInjured,distance=..1] run effect give @e[tag=BossMooshroom] regeneration 1 135 true
execute at @e[tag=BossMooshroom,nbt={HurtTime:10s}] run playsound block.note_block.basedrum master @a ~ ~ ~ 1 0.5 0
#execute at @e[tag=BossMooshroom,nbt={HurtTime:10s}] run playsound block.note_block.snare master @a ~ ~ ~ 1 1.5 0
execute at @e[tag=BossMooshroom,nbt={HurtTime:10s}] run playsound entity.puffer_fish.sting master @a ~ ~ ~ 1 0.9 0
execute if entity @e[tag=BossMooshroom,nbt={HurtTime:10s}] run scoreboard players set @e[scores={BossCowAttack=0..}] BossCowAttack 0
execute if entity @e[tag=BossMooshroom,nbt={HurtTime:10s}] run function d3:boss/boss_cow_randomize_target


# MARKS PLAYER FOR SHOT
tag @a remove SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ black_concrete run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ light_blue_concrete run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ red_concrete run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ grass_block run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ stone run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ coal_ore run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ gravel run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ granite run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ andesite run tag @s add SwoopZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ diorite run tag @s add SwoopZone
execute align x align y align z run tag @e[x=-1002,y=64,z=-1000,dx=6,dy=0,dz=5] remove SwoopZone
execute align x align y align z run tag @e[x=-999,y=63,z=-1001,dx=0,dy=0,dz=0] remove SwoopZone
execute align x align y align z run tag @e[x=-1001,y=63,z=-995,dx=2,dy=2,dz=2] remove SwoopZone

execute if entity @e[scores={BossCowAttack=210}] run kill @e[tag=SwoopAS]
execute if entity @e[scores={BossCowAttack=210}] at @a[tag=SwoopZone,limit=1,sort=random] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,Small:true,Marker:true,Tags:["BossMob","SwoopAS","FlyToTarget"],DisabledSlots:2039583}
execute as @e[tag=SwoopAS] at @a[tag=SwoopZone,limit=1] run teleport @s[distance=..2] ~ ~ ~
execute as @e[tag=FlyToTarget,type=armor_stand] at @s if entity @e[tag=BossMooshroom,distance=..0.5] run function d3:boss/boss_cow_randomize_target


# LAUNCH MISSILES
execute if entity @e[scores={BossCowAttack=100}] run tag @a remove CalfTarget1
execute if entity @e[scores={BossCowAttack=100}] run kill @e[tag=CalfMissile1]
execute if entity @e[scores={BossCowAttack=100}] run tag @a[limit=1,sort=random] add CalfTarget1
execute if entity @e[scores={BossCowAttack=100}] at @e[tag=BossMooshroom] run summon mooshroom ~ ~ ~ {Type:"red",Age:-999999,NoAI:true,Tags:["BossMob","CalfMissile","CalfMissile1"]}
execute if entity @e[scores={BossCowAttack=100}] at @e[tag=BossMooshroom] if entity @e[tag=CalfMissile1] run playsound entity.wither.shoot master @a ~ ~ ~ 2 0.7 0
execute if entity @e[scores={BossCowAttack=100}] at @e[tag=BossMooshroom] if entity @e[tag=CalfMissile1] run playsound entity.blaze.shoot master @a ~ ~ ~ 3 0.5 0

execute if entity @e[scores={BossCowAttack=150}] run tag @a remove CalfTarget2
execute if entity @e[scores={BossCowAttack=150}] run kill @e[tag=CalfMissile2]
execute if entity @e[scores={BossCowAttack=150}] run tag @a[limit=1,sort=random] add CalfTarget2
execute if entity @e[scores={BossCowAttack=150}] at @e[tag=BossMooshroom] run summon mooshroom ~ ~ ~ {Type:"red",Age:-999999,NoAI:true,Tags:["BossMob","CalfMissile","CalfMissile2"]}
execute if entity @e[scores={BossCowAttack=150}] at @e[tag=BossMooshroom] if entity @e[tag=CalfMissile2] run playsound entity.wither.shoot master @a ~ ~ ~ 2 0.6 0
execute if entity @e[scores={BossCowAttack=150}] at @e[tag=BossMooshroom] if entity @e[tag=CalfMissile2] run playsound entity.blaze.shoot master @a ~ ~ ~ 3 0.5 0


# IF SHEARS
#execute if entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] if entity @e[tag=BossMooshroom] if entity @e[scores={BossCowAttack=200}] run tellraw @a ["",{"text":"<Armoogeddon> ","color":"red","bold":false},{"text":"Put down the shears, you sad cheateer!!","color":"none","bold":false,"underlined":false}]
execute if entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] if entity @e[tag=BossMooshroom] if entity @e[tag=SwoopAS] run tellraw @a ["",{"text":"<Armoogeddon> ","color":"red","bold":false},{"text":"Put down the shears, you sad cheateer!!","color":"none","bold":false,"underlined":false}]
execute if entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] if entity @e[tag=BossMooshroom] if entity @e[tag=SwoopAS] run function d3:boss/boss_cow_randomize_target
#execute if entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] if entity @e[tag=BossMooshroom] run scoreboard players set @e[scores={BossCowAttack=210..}] BossCowAttack 0


#run @e[scores={BossCowAttack=150}] run 
#execute if entity @e[scores={BossCowAttack=400..}] run function d3:boss/boss_cow_randomize_target


# MISSILES TARGET PLAYER
execute if entity @e[tag=CalfMissile] run scoreboard objectives add CalfExplode dummy
execute unless entity @e[tag=CalfMissile] run scoreboard objectives remove CalfExplode
execute as @e[tag=CalfMissile1,tag=!RedirectedMissile] at @s run teleport @s ^ ^ ^1.5 facing entity @p[tag=CalfTarget1] eyes
execute as @e[tag=CalfMissile2,tag=!RedirectedMissile] at @s run teleport @s ^ ^ ^1.5 facing entity @p[tag=CalfTarget2] eyes
execute at @e[tag=CalfMissile] run particle cloud ~ ~ ~ 0.1 0.1 0.1 0 1 force
execute as @e[tag=CalfMissile,tag=!RedirectedMissile] at @s align x align y align z if entity @a[distance=..2] run scoreboard players add @s CalfExplode 1
execute as @e[tag=CalfMissile] at @s unless block ~ ~ ~ air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~1 ~ ~ air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~-1 ~ ~ air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~ ~1 ~ air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~ ~-1 ~ air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~ ~ ~1 air run scoreboard players set @s CalfExplode 6
execute as @e[tag=CalfMissile] at @s unless block ~ ~ ~-1 air run scoreboard players set @s CalfExplode 6

execute at @e[tag=CalfMissile1,scores={CalfExplode=4}] run teleport @e[tag=CreeperMissile1] -1015 51 -986
execute at @e[tag=CalfMissile1,scores={CalfExplode=5}] run kill @e[tag=CreeperMissile1]
execute at @e[tag=CalfMissile1,scores={CalfExplode=5}] run summon creeper ~ ~-10 ~ {CustomName:"{\"text\":\"Calfinated Missile\",\"color\":\"red\"}",CustomNameVisible:false,Fuse:1,ExplosionRadius:2b,NoAI:true,Attributes:[{Name:"generic.attackDamage",Base:0.0d}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","CreeperMissile1"]}
execute at @e[tag=CalfMissile1,scores={CalfExplode=4}] run teleport @e[tag=CreeperMissile2] -1015 51 -986
execute at @e[tag=CalfMissile1,scores={CalfExplode=5}] run kill @e[tag=CreeperMissile2]
execute at @e[tag=CalfMissile2,scores={CalfExplode=5}] run summon creeper ~ ~-10 ~ {CustomName:"{\"text\":\"Calfinated Missile\",\"color\":\"red\"}",CustomNameVisible:false,Fuse:1,ExplosionRadius:2b,NoAI:true,Attributes:[{Name:"generic.attackDamage",Base:0.0d}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","CreeperMissile2"]}

execute at @e[tag=CalfMissile1,tag=!RedirectedMissile,scores={CalfExplode=6}] unless entity @e[tag=CreeperMissile1] run summon creeper ~ ~-10 ~ {CustomName:"{\"text\":\"Calfinated Missile\",\"color\":\"red\"}",CustomNameVisible:false,Fuse:0,ExplosionRadius:2b,NoAI:true,Attributes:[{Name:"generic.attackDamage",Base:0.0d}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","CreeperMissile1"]}
execute at @e[tag=CalfMissile2,tag=!RedirectedMissile,scores={CalfExplode=6}] unless entity @e[tag=CreeperMissile2] run summon creeper ~ ~-10 ~ {CustomName:"{\"text\":\"Calfinated Missile\",\"color\":\"red\"}",CustomNameVisible:false,Fuse:0,ExplosionRadius:2b,NoAI:true,Attributes:[{Name:"generic.attackDamage",Base:0.0d}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","CreeperMissile2"]}

execute at @e[tag=CalfMissile1,tag=!RedirectedMissile,scores={CalfExplode=6..}] run teleport @e[tag=CreeperMissile1] ~ ~-0.5 ~
execute at @e[tag=CalfMissile1,tag=!RedirectedMissile,scores={CalfExplode=6..}] as @e[tag=CreeperMissile1] run data merge entity @s {Fuse:0}
execute at @e[tag=CalfMissile2,tag=!RedirectedMissile,scores={CalfExplode=6..}] run teleport @e[tag=CreeperMissile2] ~ ~-0.5 ~
execute at @e[tag=CalfMissile2,tag=!RedirectedMissile,scores={CalfExplode=6..}] as @e[tag=CreeperMissile2] run data merge entity @s {Fuse:0}
execute at @e[scores={CalfExplode=6..}] run kill @s

scoreboard players set @e[tag=RedirectedMissile] CalfExplode -100
execute if entity @e[tag=CalfMissile1,scores={CalfExplode=-100}] as @e[tag=CreeperMissile1] at @s run teleport @s ~ ~-100 ~
execute if entity @e[tag=CalfMissile2,scores={CalfExplode=-100}] as @e[tag=CreeperMissile2] at @s run teleport @s ~ ~-100 ~






# MISSILE REDIRECTED
execute at @e[tag=CalfMissile,tag=!RedirectedMissile,nbt={HurtTime:10s}] run playsound entity.blaze.shoot master @a ~ ~ ~ 1 1 0
execute at @e[tag=CalfMissile,tag=!RedirectedMissile,nbt={HurtTime:10s}] run playsound entity.dolphin.death master @a ~ ~ ~ 1 0.8 1
execute at @e[tag=CalfMissile,tag=!RedirectedMissile,nbt={HurtTime:10s}] run playsound block.note_block.basedrum master @a ~ ~ ~ 1 1.5 0
tag @e[tag=CalfMissile,nbt={HurtTime:10s}] add RedirectedMissile
#execute as @e[tag=RedirectedMissile,nbt={Type:"red"}] run data merge entity @s {Type:"brown"}
execute as @e[tag=RedirectedMissile] at @s run teleport @s ^ ^ ^1 facing entity @e[tag=BossMooshroom,limit=1]
#execute as @e[tag=BossMooshroom] at @s if entity @e[tag=RedirectedMissile,distance=..0.5] run effect give @e[tag=BossMooshroom] resistance 1 1 true
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=RedirectedMissile,distance=..0.5] run effect give @e[tag=BossMooshroom] instant_damage 1 1 true
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=RedirectedMissile,distance=..0.5] run playsound entity.generic.explode master @a ~ ~ ~ 3 1 0
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=RedirectedMissile,distance=..0.5] run particle explosion ~ ~ ~ 1 1 1 0 4 force
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=RedirectedMissile,distance=..0.5] run playsound entity.cow.hurt master @a ~ ~ ~ 3 1 0
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=CalfMissile1,tag=RedirectedMissile,distance=..0.5] run kill @e[tag=CalfMissile1,tag=RedirectedMissile]
execute as @e[tag=BossMooshroom] at @s if entity @e[tag=CalfMissile2,tag=RedirectedMissile,distance=..0.5] run kill @e[tag=CalfMissile2,tag=RedirectedMissile]


#execute as @e[tag=BossPhantom] run data merge entity @s {AX:-1015,AY:65,AZ:-986}
#execute as @e[tag=BossMooshroom] at @e[tag=BossPhantomRide] run teleport @s ~ ~ ~ ~ ~
#execute if entity @e[tag=BossMooshroom] store result entity @e[tag=BossPhantom,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=BossMooshroom,limit=1] Rotation[0] 10
#execute if entity @e[tag=BossMooshroom] store result entity @e[tag=BossPhantom,limit=1] Rotation[1] float 0.1 run data get entity @e[tag=BossMooshroom,limit=1] Rotation[1] 10

execute unless entity @e[tag=BossMooshroom] run kill @e[tag=BossPhantom]
execute as @e[tag=BossPhantom] at @e[tag=BossMooshroom] run teleport @s ~ ~ ~ ~ 0

#execute as @e[tag=BossPhantom] at @s if entity @a[distance=..5] run data merge entity @s[nbt={NoAI:1b}] {NoAI:false}
#execute as @e[tag=BossPhantom] at @s unless entity @a[distance=..5] run data merge entity @s[nbt=!{NoAI:1b}] {NoAI:true}


# MANURE BOMBS
scoreboard players add @e[tag=MainBossAEC] ManureBomb 1
execute if entity @e[scores={ManureBomb=100..}] run scoreboard objectives remove ManureBomb

execute if entity @e[scores={ManureBomb=20}] run kill @e[tag=ManureBomb]
execute if entity @e[scores={ManureBomb=20}] at @e[tag=BossMooshroom] run summon item ~ ~ ~ {Item:{id:"minecraft:cocoa_beans",Count:1b},Age:5900s,PickupDelay:32767,Tags:["BossMob","ManureBomb","ManureBomb1"]}
execute if entity @e[scores={ManureBomb=20}] at @e[tag=BossMooshroom] run summon creeper -1015 47 -986 {CustomName:"{\"text\":\"Manure Bomb\",\"color\":\"red\"}",CustomNameVisible:false,ExplosionRadius:2b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["ManureBomb","ManureBombCreeper1"]}
execute as @e[tag=ManureBombCreeper1] at @e[tag=ManureBomb1] run teleport @s ~ ~ ~
execute as @e[tag=ManureBombCreeper1] if entity @e[tag=ManureBomb1,nbt={OnGround:1b}] run data merge entity @s {Fuse:0}

execute if entity @e[scores={ManureBomb=30}] at @e[tag=BossMooshroom] run summon item ~ ~ ~ {Item:{id:"minecraft:cocoa_beans",Count:1b},Age:5900s,PickupDelay:32767,Tags:["BossMob","ManureBomb","ManureBomb2"]}
execute if entity @e[scores={ManureBomb=30}] at @e[tag=BossMooshroom] run summon creeper -1015 47 -986 {CustomName:"{\"text\":\"Manure Bomb\",\"color\":\"red\"}",CustomNameVisible:false,ExplosionRadius:2b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["ManureBomb","ManureBombCreeper2"]}
execute as @e[tag=ManureBombCreeper2] at @e[tag=ManureBomb2] run teleport @s ~ ~ ~
execute as @e[tag=ManureBombCreeper2] if entity @e[tag=ManureBomb2,nbt={OnGround:1b}] run data merge entity @s {Fuse:0}

execute if entity @e[scores={ManureBomb=40}] at @e[tag=BossMooshroom] run summon item ~ ~ ~ {Item:{id:"minecraft:cocoa_beans",Count:1b},Age:5900s,PickupDelay:32767,Tags:["BossMob","ManureBomb","ManureBomb3"]}
execute if entity @e[scores={ManureBomb=40}] at @e[tag=BossMooshroom] run summon creeper -1015 47 -986 {CustomName:"{\"text\":\"Manure Bomb\",\"color\":\"red\"}",CustomNameVisible:false,ExplosionRadius:2b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["ManureBomb","ManureBombCreeper3"]}
execute as @e[tag=ManureBombCreeper3] at @e[tag=ManureBomb3] run teleport @s ~ ~ ~
execute as @e[tag=ManureBombCreeper3] if entity @e[tag=ManureBomb3,nbt={OnGround:1b}] run data merge entity @s {Fuse:0}


# CLEARS OUT ANY AREA EFFECT CLOUDS FROM CREEPER EXPLOSIONS
kill @e[type=area_effect_cloud,tag=!MainHubAEC,tag=!MainBossAEC,tag=!BossAEC]

# FOR TESTING
#effect give @a regeneration 1 255 true