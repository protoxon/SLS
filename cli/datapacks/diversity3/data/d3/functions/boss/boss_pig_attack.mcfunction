####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 9 2018 / DECEMBER 15 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

difficulty normal

#scoreboard objectives setdisplay sidebar BossPigAttack

scoreboard players add @e[scores={BossPigAttack=0..999}] BossPigAttack 1
execute if entity @e[tag=PigMinion] run scoreboard players set @e[scores={BossPigAttack=20..}] BossPigAttack 20

scoreboard players set @e[scores={BossPigAttack=165..}] BossPigAttack 0

# SUMMONS ROTATION MINIONS
execute if entity @e[scores={BossPigAttack=2}] run kill @e[tag=PigMinion]
execute if entity @e[scores={BossPigAttack=2}] run kill @e[tag=RotatingSF]
execute if entity @e[scores={BossPigAttack=2}] run kill @e[tag=RotatingSFAS]


execute if entity @e[scores={BossPigAttack=5}] at @e[tag=BossPigman] run summon armor_stand ~ ~0.8 ~-0.5 {Invisible:true,Small:true,Marker:true,NoGravity:true,DisabledSlots:2039583,Tags:["BossMob","RotatingSFAS","RotatingSFAS1"],Passengers:[{id:"minecraft:silverfish",CustomName:"{\"text\":\"Bacon Bit\",\"color\":\"yellow\"}",CustomNameVisible:false,Silent:true,NoAI:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","RotatingSF","RotatingSF1","SFMinion","SFMinion1"]}]}
execute if entity @e[scores={BossPigAttack=5}] at @e[tag=BossPigman] run summon pig ~ ~0.8 ~-0.5 {Age:-9999999,NoAI:true,Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","PigMinion","PigMinion1"]}


execute if entity @e[scores={BossPigAttack=10}] at @e[tag=BossPigman] run summon armor_stand ~ ~0.8 ~-0.5 {Invisible:true,Small:true,Marker:true,NoGravity:true,DisabledSlots:2039583,Tags:["BossMob","RotatingSFAS","RotatingSFAS2"],Passengers:[{id:"minecraft:silverfish",CustomName:"{\"text\":\"Bacon Bit\",\"color\":\"yellow\"}",CustomNameVisible:false,Silent:true,NoAI:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","RotatingSF","RotatingSF2","SFMinion","SFMinion2"]}]}
execute if entity @e[scores={BossPigAttack=10}] at @e[tag=BossPigman] run summon pig ~ ~0.8 ~-0.5 {Age:-9999999,NoAI:true,Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","PigMinion","PigMinion2"]}

execute if entity @e[scores={BossPigAttack=15}] at @e[tag=BossPigman] run summon armor_stand ~ ~0.8 ~-0.5 {Invisible:true,Small:true,Marker:true,NoGravity:true,DisabledSlots:2039583,Tags:["BossMob","RotatingSFAS","RotatingSFAS3"],Passengers:[{id:"minecraft:silverfish",CustomName:"{\"text\":\"Bacon Bit\",\"color\":\"yellow\"}",CustomNameVisible:false,Silent:true,NoAI:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","RotatingSF","RotatingSF1","SFMinion","SFMinion3"]}]}
execute if entity @e[scores={BossPigAttack=15}] at @e[tag=BossPigman] run summon pig ~ ~0.8 ~-0.5 {Age:-9999999,NoAI:true,Health:8.0f,Attributes:[{Name:"generic.maxHealth",Base:8.0d}],Tags:["BossMob","PigMinion","PigMinion3"]}

effect give @e[tag=SFMinion] invisibility 1000000 255 true


# KEEP PIGLETS AT SILVERFISH LOCATION
execute if entity @e[tag=SFMinion1] if entity @e[tag=PigMinion1] store result entity @e[tag=PigMinion1,limit=1] Pos[0] double 0.1 run data get entity @e[tag=SFMinion1,limit=1] Pos[0] 10
execute if entity @e[tag=SFMinion1] if entity @e[tag=PigMinion1] store result entity @e[tag=PigMinion1,limit=1] Pos[1] double 0.1 run data get entity @e[tag=SFMinion1,limit=1] Pos[1] 10
execute if entity @e[tag=SFMinion1] if entity @e[tag=PigMinion1] store result entity @e[tag=PigMinion1,limit=1] Pos[2] double 0.1 run data get entity @e[tag=SFMinion1,limit=1] Pos[2] 10

execute if entity @e[tag=SFMinion2] if entity @e[tag=PigMinion2] store result entity @e[tag=PigMinion2,limit=1] Pos[0] double 0.1 run data get entity @e[tag=SFMinion2,limit=1] Pos[0] 10
execute if entity @e[tag=SFMinion2] if entity @e[tag=PigMinion2] store result entity @e[tag=PigMinion2,limit=1] Pos[1] double 0.1 run data get entity @e[tag=SFMinion2,limit=1] Pos[1] 10
execute if entity @e[tag=SFMinion2] if entity @e[tag=PigMinion2] store result entity @e[tag=PigMinion2,limit=1] Pos[2] double 0.1 run data get entity @e[tag=SFMinion2,limit=1] Pos[2] 10

execute if entity @e[tag=SFMinion3] if entity @e[tag=PigMinion3] store result entity @e[tag=PigMinion3,limit=1] Pos[0] double 0.1 run data get entity @e[tag=SFMinion3,limit=1] Pos[0] 10
execute if entity @e[tag=SFMinion3] if entity @e[tag=PigMinion3] store result entity @e[tag=PigMinion3,limit=1] Pos[1] double 0.1 run data get entity @e[tag=SFMinion3,limit=1] Pos[1] 10
execute if entity @e[tag=SFMinion3] if entity @e[tag=PigMinion3] store result entity @e[tag=PigMinion3,limit=1] Pos[2] double 0.1 run data get entity @e[tag=SFMinion3,limit=1] Pos[2] 10



# ROTATES SILVERFISH AROUND PIGMAN
scoreboard objectives add SFASHeight dummy
execute unless entity @e[tag=RotatingSFAS] run scoreboard objectives remove SFASHeight

execute if entity @e[tag=RotatingSFAS1] store result score @e[tag=RotatingSFAS1,limit=1] SFASHeight run data get entity @e[tag=BossPigman,limit=1] Pos[1] 10
scoreboard players add @e[tag=RotatingSFAS1] SFASHeight 6
execute if entity @e[tag=RotatingSFAS1] store result entity @e[tag=RotatingSFAS1,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=RotatingSFAS1,limit=1] SFASHeight
execute if entity @e[tag=RotatingSFAS1] store result entity @e[tag=PigMinion1,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=BossPigman,limit=1] Rotation[0] 10
execute unless entity @e[tag=RotatingSFAS1] store result entity @e[tag=PigMinion1,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=SFMinion1,limit=1] Rotation[0] 10

execute if entity @e[tag=RotatingSFAS2] store result score @e[tag=RotatingSFAS2,limit=1] SFASHeight run data get entity @e[tag=BossPigman,limit=1] Pos[1] 10
scoreboard players add @e[tag=RotatingSFAS2] SFASHeight 6
execute if entity @e[tag=RotatingSFAS2] store result entity @e[tag=RotatingSFAS2,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=RotatingSFAS2,limit=1] SFASHeight
execute if entity @e[tag=RotatingSFAS2] store result entity @e[tag=PigMinion2,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=BossPigman,limit=1] Rotation[0] 10
execute unless entity @e[tag=RotatingSFAS2] store result entity @e[tag=PigMinion2,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=SFMinion2,limit=1] Rotation[0] 10

execute if entity @e[tag=RotatingSFAS3] store result score @e[tag=RotatingSFAS3,limit=1] SFASHeight run data get entity @e[tag=BossPigman,limit=1] Pos[1] 10
scoreboard players add @e[tag=RotatingSFAS3] SFASHeight 6
execute if entity @e[tag=RotatingSFAS3] store result entity @e[tag=RotatingSFAS3,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=RotatingSFAS3,limit=1] SFASHeight
execute if entity @e[tag=RotatingSFAS3] store result entity @e[tag=PigMinion3,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=BossPigman,limit=1] Rotation[0] 10
execute unless entity @e[tag=RotatingSFAS3] store result entity @e[tag=PigMinion3,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=SFMinion3,limit=1] Rotation[0] 10


# STOMP ATTACK
execute if entity @e[scores={BossPigAttack=135}] run tellraw @a ["",{"text":"<Aporkalypse> ","color":"yellow","bold":false},{"text":"Bacon...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossPigAttack=140}] run tag @e[tag=BossPigman] add StompAttack
execute if entity @e[scores={BossPigAttack=140}] as @e[tag=BossPigman] run data merge entity @s {Motion:[0.0d,1.0d,0.0d]}
effect give @e[tag=StompAttack] resistance 1 255 true
execute unless entity @e[scores={BossPigAttack=140}] if entity @e[tag=StompAttack,nbt={OnGround:1b}] at @e[tag=BossPigman] run playsound item.totem.use master @a ~ ~ ~ 0.5 1.5 0.5
execute unless entity @e[scores={BossPigAttack=140}] if entity @e[tag=StompAttack,nbt={OnGround:1b}] at @e[tag=BossPigman] run playsound entity.zombie.attack_wooden_door master @a ~ ~ ~ 1 0.5 1
execute unless entity @e[scores={BossPigAttack=140}] if entity @e[tag=StompAttack,nbt={OnGround:1b}] at @e[tag=BossPigman] run playsound entity.zombie_pigman.angry master @a ~ ~ ~ 1 1 1
execute unless entity @e[scores={BossPigAttack=140}] at @e[tag=StompAttack,nbt={OnGround:1b}] as @a[distance=..5] run effect give @s resistance 1 1 true
execute unless entity @e[scores={BossPigAttack=140}] at @e[tag=StompAttack,nbt={OnGround:1b}] as @a[distance=..5] run effect give @s instant_damage 1 1 true
execute unless entity @e[scores={BossPigAttack=140}] at @e[tag=StompAttack,nbt={OnGround:1b}] run tag @a[distance=..5] add StompRange
execute unless entity @e[scores={BossPigAttack=140}] at @e[tag=StompAttack,nbt={OnGround:1b}] run tellraw @a ["",{"text":"<Aporkalypse> ","color":"yellow","bold":false},{"text":"STOMP!","color":"none","bold":false,"underlined":false}]
execute unless entity @e[scores={BossPigAttack=140}] at @e[tag=StompAttack,nbt={OnGround:1b}] run particle lava ~ ~ ~ 0.2 0.5 0.2 0 70 force
execute as @a[tag=StompRange] at @s run teleport @s ~ ~0.5 ~
effect give @a[tag=StompRange] levitation 1 255 true
execute unless entity @e[tag=BossPigman] run tag @a remove StompRange
execute if entity @e[scores={BossPigAttack=5..135}] run tag @a remove StompRange
execute if entity @e[scores={BossPigAttack=5..135}] run effect clear @a levitation

#execute unless entity @e[scores={BossPigAttack=140}] if entity @e[tag=StompAttack,nbt={OnGround:1b}] at @a[tag=StompRange] run summon armor_stand ~ ~ ~ {OnGround:0b,Motion:[0.0d,1.0d,0.0d],Tags:["StompAS"]}
#execute as @a[tag=StompRange] at @e[tag=StompAS] run teleport @s[distance=..1] ~ ~ ~
#execute as @e[tag=StompAS,nbt={OnGround:1b}] run kill @s

#execute if entity @e[tag=StompAS,nbt={OnGround:1b}] run tag @a remove StompRange
execute unless entity @e[scores={BossPigAttack=140}] run tag @e[tag=StompAttack,nbt={OnGround:1b}] remove StompAttack




execute at @e[tag=BossPigman] if block ~ ~ ~ air run setblock ~ ~ ~ fire


execute as @e[tag=RotatingSFAS] at @s run teleport @s ^0.3 ^ ^0.05 facing entity @e[tag=BossPigman,limit=1]
#execute as @e[tag=PigMinion1] at @e[tag=SFMinio1] run teleport @s ~ ~ ~ ~ ~
#execute as @e[tag=PigMinion2] at @e[tag=SFMinio2] run teleport @s ~ ~ ~ ~ ~
#execute as @e[tag=PigMinion3] at @e[tag=SFMinio3] run teleport @s ~ ~ ~ ~ ~




# LAUNCH PIGS OFF PIGMAN
execute if entity @e[tag=RotatingSFAS1] if entity @e[tag=SFMinion1,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS1]
execute if entity @e[tag=RotatingSFAS1] if entity @e[tag=PigMinion1,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS1]
execute unless entity @e[tag=RotatingSFAS1] as @e[tag=SFMinion1,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}

execute if entity @e[tag=RotatingSFAS2] if entity @e[tag=SFMinion2,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS2]
execute if entity @e[tag=RotatingSFAS2] if entity @e[tag=PigMinion2,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS2]
execute unless entity @e[tag=RotatingSFAS2] as @e[tag=SFMinion2,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}

execute if entity @e[tag=RotatingSFAS3] if entity @e[tag=SFMinion3,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS3]
execute if entity @e[tag=RotatingSFAS3] if entity @e[tag=PigMinion3,nbt={HurtTime:10s}] run kill @e[tag=RotatingSFAS3]
execute unless entity @e[tag=RotatingSFAS3] as @e[tag=SFMinion3,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}


# SOUND FX
execute if entity @e[scores={BossPigAttack=5}] at @e[tag=BossPigman] run playsound block.enchantment_table.use master @a
execute if entity @e[tag=PigMinion] unless entity @e[tag=RotatingSFAS] at @e[tag=BossPigman,nbt={Invulnerable:1b}] run playsound block.conduit.attack.target master @a ~ ~ ~ 1 1 0


execute if entity @e[tag=SFMinion1,nbt={HurtTime:10s}] at @e[tag=PigMinion1] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0
execute if entity @e[tag=SFMinion2,nbt={HurtTime:10s}] at @e[tag=PigMinion2] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0
execute if entity @e[tag=SFMinion3,nbt={HurtTime:10s}] at @e[tag=PigMinion3] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0
execute if entity @e[tag=PigMinion1,nbt={HurtTime:10s}] at @e[tag=PigMinion1] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0
execute if entity @e[tag=PigMinion2,nbt={HurtTime:10s}] at @e[tag=PigMinion2] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0
execute if entity @e[tag=PigMinion3,nbt={HurtTime:10s}] at @e[tag=PigMinion3] run playsound entity.pig.death neutral @a ~ ~ ~ 1 1.5 0

#execute if entity @e[tag=SFMinion1,nbt={HurtTime:10s}] run effect give @e[tag=PigMinion1] poison 1 1 true
#execute if entity @e[tag=SFMinion2,nbt={HurtTime:10s}] run effect give @e[tag=PigMinion2] poison 1 1 true
#execute if entity @e[tag=SFMinion3,nbt={HurtTime:10s}] run effect give @e[tag=PigMinion3] poison 1 1 true
#execute if entity @e[tag=PigMinion1,nbt={HurtTime:10s}] run effect give @e[tag=SFMinion1] poison 1 1 true
#execute if entity @e[tag=PigMinion2,nbt={HurtTime:10s}] run effect give @e[tag=SFMinion2] poison 1 1 true
#execute if entity @e[tag=PigMinion3,nbt={HurtTime:10s}] run effect give @e[tag=SFMinion3] poison 1 1 true


# BOTH MINIONS DIE
execute unless entity @e[tag=PigMinion1] run kill @e[tag=SFMinion1]
execute unless entity @e[tag=PigMinion1] run kill @e[tag=RotatingSFAS1]
execute unless entity @e[tag=SFMinion1] run kill @e[tag=PigMinion1]

execute unless entity @e[tag=PigMinion2] run kill @e[tag=SFMinion2]
execute unless entity @e[tag=PigMinion2] run kill @e[tag=RotatingSFAS2]
execute unless entity @e[tag=SFMinion2] run kill @e[tag=PigMinion2]

execute unless entity @e[tag=PigMinion3] run kill @e[tag=SFMinion3]
execute unless entity @e[tag=PigMinion3] run kill @e[tag=RotatingSFAS3]
execute unless entity @e[tag=SFMinion3] run kill @e[tag=PigMinion3]


# EFFECTS
execute if entity @e[tag=RotatingSFAS] run team add PigmanCollision
execute unless entity @e[tag=RotatingSFAS] run team remove PigmanCollision
team modify PigmanCollision collisionRule never
team join PigmanCollision @e[tag=SFMinion]
team join PigmanCollision @e[tag=PigMinion]

effect give @e[tag=PigMinion] fire_resistance 1 255 true
effect give @e[tag=SFMinion] fire_resistance 1 255 true

execute if entity @e[tag=RotatingSFAS] run effect give @e[tag=BossPigman] glowing 1 1
execute if entity @e[tag=RotatingSFAS] run effect give @e[tag=BossPigman] resistance 1 255
execute if entity @e[tag=RotatingSFAS] as @e[tag=BossPigman] run data merge entity @s[nbt=!{Invulnerable:1b}] {Invulnerable:1b}
execute unless entity @e[tag=RotatingSFAS] as @e[tag=BossPigman] run data merge entity @s[nbt={Invulnerable:1b}] {Invulnerable:0b}