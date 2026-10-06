####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 28 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar BossPig

scoreboard players add @e[scores={BossPig=0..49}] BossPig 1
scoreboard players set @e[scores={BossPig=50}] BossPig 2
scoreboard players add @e[scores={BossPig=50..369}] BossPig 1
scoreboard players add @e[scores={BossPig=371..599}] BossPig 1
scoreboard players add @e[scores={BossPig=601..}] BossPig 1

execute if entity @e[scores={BossPig=3}] run summon fireball -1009 69 -960 {direction:[-1.6,-0.37,-2.5],ExplosionPower:1,Tags:["StoneFireball","StoneFireball1"]}

#execute align x align y align z if entity @e[tag=StoneFireball1,x=-1031,y=64,z=-995,dx=1,dy=0,dz=2] if entity @e[tag=BossPig,nbt={HurtTime:10s}] run scoreboard players set @e[scores={BossPig=..49}] BossPig 51
execute if entity @e[scores={BossPig=..49}] if entity @e[tag=BossPig,nbt={HurtTime:10s}] run scoreboard players set @e[scores={BossPig=..49}] BossPig 51

execute if entity @e[tag=StoneFireball1] as @e[tag=BossPig,nbt=!{NoAI:1b}] run data merge entity @s {NoAI:true}
execute if entity @e[scores={BossPig=0..49}] unless entity @e[tag=StoneFireball1] as @e[tag=BossPig,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}

execute if entity @e[scores={BossPig=52}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I don't think so!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossPig=52}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossPig=52}] at @e[tag=BossPig] run playsound ambient.cave master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossPig=52}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 3 1 1
execute if entity @e[scores={BossPig=52}] as @e[tag=BossPig] run data merge entity @s {Invulnerable:true}
execute if entity @e[scores={BossPig=52}] run fill -1031 63 -994 -1030 63 -994 netherrack
execute if entity @e[scores={BossPig=52}] run fill -1031 64 -994 -1030 64 -994 fire
execute if entity @e[scores={BossPig=52..}] at @e[tag=BossPig] run particle cloud ~ ~ ~ 0.25 0.05 0.25 0.01 2

execute if entity @e[scores={BossPig=60}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossPig=60}] run function d3:boss/steve_animations/sign_question_mark
execute if entity @e[scores={BossPig=60}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0

execute if entity @e[scores={BossPig=75}] as @e[tag=BossPig] run data merge entity @s {NoAI:true}
execute if entity @e[scores={BossPig=75..339}] as @e[tag=BossPig] at @s run teleport @s -1030.0 ~0.005 -993.5 0 ~
execute if entity @e[scores={BossPig=75..340}] as @e[tag=BossPig] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossPig=340..360}] as @e[tag=BossPig] at @s run teleport @s -1030.0 ~0.005 -993.5 0 0

execute if entity @e[scores={BossPig=140}] run summon lightning_bolt -1033.5 64 -993.5
execute if entity @e[scores={BossPig=140}] run setblock -1033 64 -993 air
execute if entity @e[scores={BossPig=140}] run fill -1033 63 -995 -1033 63 -993 netherrack
execute if entity @e[scores={BossPig=140}] run fill -1032 63 -994 -1032 63 -993 netherrack
execute if entity @e[scores={BossPig=140}] run fill -1033 64 -995 -1033 64 -993 fire
execute if entity @e[scores={BossPig=140}] run fill -1032 64 -994 -1032 64 -993 fire
execute if entity @e[scores={BossPig=140}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 3 0.8 1

execute if entity @e[scores={BossPig=160}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossPig=160}] run function d3:boss/steve_animations/sign_sad_face
execute if entity @e[scores={BossPig=160}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0

execute if entity @e[scores={BossPig=230}] run summon lightning_bolt -1026.5 64 -993.5
execute if entity @e[scores={BossPig=230}] run setblock -1031 64 -995 air
execute if entity @e[scores={BossPig=230}] run setblock -1028 64 -994 air
execute if entity @e[scores={BossPig=230}] run fill -1030 63 -995 -1028 63 -995 netherrack
execute if entity @e[scores={BossPig=230}] run fill -1029 63 -994 -1028 63 -993 netherrack
execute if entity @e[scores={BossPig=230}] run fill -1030 64 -995 -1028 64 -995 fire
execute if entity @e[scores={BossPig=230}] run fill -1029 64 -994 -1028 64 -993 fire
execute if entity @e[scores={BossPig=230}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 3 0.6 1

execute if entity @e[scores={BossPig=240}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossPig=350}] run summon fireball -1009 69 -960 {direction:[-1.6,-0.37,-2.5],ExplosionPower:1,Tags:["StoneFireball","StoneFireball2"]}
execute align x align y align z if entity @e[tag=StoneFireball2,x=-1031,y=64,z=-995,dx=1,dy=0,dz=2] run scoreboard players set @e[scores={BossPig=..370}] BossPig 371
scoreboard players set @e[scores={BossPig=370}] BossPig 349

execute if entity @e[scores={BossPig=75}] as @e[tag=BossPig] run data merge entity @s {Silent:true}
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run playsound entity.pig.death master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run particle lava ~ ~ ~ 1 1 1 0 100 force
execute if entity @e[scores={BossPig=372..375}] at @e[tag=BossPig] run particle cloud ~ ~ ~ 1 1 1 0 500 force
execute if entity @e[scores={BossPig=372}] at @e[tag=BossPig] run summon zombie_pigman ~ ~ ~ {CustomName:"{\"text\":\"Aporkalypse\",\"color\":\"yellow\"}",CustomNameVisible:true,Invulnerable:true,ArmorItems:[{id:"minecraft:golden_boots",Count:1b},{id:"minecraft:golden_leggings",Count:1b},{id:"minecraft:golden_chestplate",Count:1b}],HandItems:[{id:"minecraft:golden_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:2}]}},{id:"minecraft:golden_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:2}]}}],Motion:[0.0d,0.5d,0.7d],Rotation:[0f,0f],Health:175f,Attributes:[{Name:generic.maxHealth,Base:175.0},{Name:generic.movementSpeed,Base:0.12},{Name:"generic.knockbackResistance",Base:1.0}],Anger:32000,PersistenceRequired:true,Tags:["BossMob","BossPigman"]}

execute if entity @e[scores={BossPig=372}] run kill @e[tag=BossPig]
execute if entity @e[scores={BossPig=373}] at @e[tag=BossPigman] run playsound entity.wither.spawn master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossPig=373}] at @e[tag=BossPigman] run playsound block.end_portal.spawn master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossPig=373}] at @e[tag=BossPigman] run playsound entity.elder_guardian.curse master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossPig=372}] run summon lightning_bolt -1030.0 64 -993.5
execute if entity @e[scores={BossPig=373}] run fill -1032 63 -995 -1028 63 -993 netherrack
execute if entity @e[scores={BossPig=373}] run fill -1032 64 -995 -1028 64 -993 fire
execute if entity @e[scores={BossPig=373..380}] as @e[type=zombie_pigman,tag=!BossPigman] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={BossPig=373..380}] as @e[type=zombie_pigman,tag=!BossPigman] run data merge entity @s {NoAI:false}

execute if entity @e[scores={BossPig=330}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossPig=330}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossPig=380..}] unless entity @e[tag=BossPigmanAS] at @e[tag=BossPigman] run summon armor_stand ~ ~ ~ {Invisible:true,Marker:true,Invulnerable:true,NoGravity:true,Silent:true,Small:true,Tags:["BossMob","BossPigmanAS"],DisabledSlots:2039583}
execute as @e[tag=BossPigmanAS] at @e[tag=BossPigman] run teleport @s ~ ~ ~



# ADD BOSS BAR
#execute if entity @e[scores={BossPig=372}] run bossbar add bosspigman "Aporkalypse"
execute if entity @e[scores={BossPig=372}] run bossbar add bosspigman {"text":"Aporkalypse","color":"yellow","bold":"true"}
execute if entity @e[scores={BossPig=372}] run bossbar set bosspigman color yellow
execute if entity @e[scores={BossPig=372}] run bossbar set bosspigman style progress
execute if entity @e[scores={BossPig=372}] run bossbar set bosspigman max 170
execute if entity @e[scores={BossPig=372..}] run bossbar set bosspigman players @a

execute store result bossbar bosspigman value run data get entity @e[tag=BossPigman,limit=1] Health

execute unless entity @e[tag=BossPigman] if entity @e[scores={BossPig=602..}] run bossbar remove bosspigman

#execute if entity @e[scores={BossPig=430}] as @e[tag=BossPigman] run data merge entity @s {Invulnerable:false}




execute if entity @e[scores={BossPig=374}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossPig=374}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossPig=460}] run tellraw @a ["",{"text":"<Aporkalypse> ","color":"yellow","bold":false},{"text":"Now it's time for YOU to squeal!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossPig=550}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossPig=550}] run function d3:boss/steve_animations/face_to_player


# ADD PIG MINIONS
execute if entity @e[scores={BossPig=372..}] if entity @e[tag=BossPigman] run scoreboard objectives add BossPigAttack dummy
execute as @e[tag=SFMinion] run data merge entity @s {Fire:-20s}
execute as @e[tag=PigMinion] run data merge entity @s {Fire:-20s}
execute unless entity @e[tag=BossPigman] run scoreboard objectives remove BossPigAttack
execute unless entity @e[tag=BossPigman] run kill @e[tag=SFMinion]
execute unless entity @e[tag=BossPigman] run kill @e[tag=PigMinion]


# FAILSAFE FOR RELOG
execute if entity @e[tag=BossPigman] run scoreboard objectives add BossPigFailSafe dummy
scoreboard players add @e[tag=MainBossAEC] BossPigFailSafe 1
execute if entity @e[tag=BossPigman] run scoreboard players set @e[tag=MainBossAEC] BossPigFailSafe 0
execute if entity @e[scores={BossPig=602..}] run scoreboard objectives remove BossPigFailSafe


# FINISH PIGMAN BOSS
#execute if entity @e[scores={BossPig=400..600}] unless entity @e[tag=BossPigman] run scoreboard players set @e[scores={BossPig=..600}] BossPig 601
execute if entity @e[scores={BossPig=400..600}] if entity @e[scores={BossPigFailSafe=8..}] if entity @e[tag=BossPigmanAS] unless entity @e[tag=BossPigman] run scoreboard players set @e[scores={BossPig=..600}] BossPig 601
execute if entity @e[scores={BossPig=602}] at @e[tag=BossPigmanAS] run playsound entity.pig.death master @a ~ ~ ~ 3 1 1
execute if entity @e[scores={BossPig=602}] run tellraw @a ["",{"text":"<Aporkalypse> ","color":"yellow","bold":false},{"text":"You monst... ","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossPig=602}] at @e[tag=BossPigmanAS] run kill @e[tag=BossPigmanAEC]
execute if entity @e[scores={BossPig=602}] at @e[tag=BossPigmanAS] run summon area_effect_cloud ~ ~ ~ {Tags:["BossAEC","BossPigmanAEC"],Duration:100}
execute if entity @e[scores={BossPig=602}] run kill @e[tag=BossPigmanAS]
execute if entity @e[scores={BossPig=602}] at @e[tag=BossPigmanAEC] run playsound entity.wither.death master @a ~ ~ ~ 3 0.5 1
execute at @e[tag=BossPigmanAEC] run fill ~-2 ~ ~-2 ~2 ~1 ~2 air replace fire
execute at @e[tag=BossPigmanAEC] run particle lava ~ ~ ~ 1 1 1 0 2 force
execute at @e[tag=BossPigmanAEC] run particle cloud ~ ~ ~ 1 1 1 0 5 force

execute if entity @e[tag=BossPigmanAEC] run scoreboard objectives add SpawnPork dummy
execute unless entity @e[tag=BossPigmanAEC] run scoreboard objectives remove SpawnPork
scoreboard players add @e[tag=BossPigmanAEC] SpawnPork 1
scoreboard players set @e[scores={SpawnPork=17}] SpawnPork 0
execute if entity @e[scores={SpawnPork=2}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:1b}},Motion:[0.0d,0.2d,0.15d]}
execute if entity @e[scores={SpawnPork=4}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:2b}},Motion:[0.0d,0.2d,-0.15d]}
execute if entity @e[scores={SpawnPork=6}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:3b}},Motion:[0.15d,0.2d,0.0d]}
execute if entity @e[scores={SpawnPork=8}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:4b}},Motion:[-0.15d,0.2d,0.0d]}

execute if entity @e[scores={SpawnPork=10}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:5b}},Motion:[0.1d,0.2d,0.1d]}
execute if entity @e[scores={SpawnPork=12}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:6b}},Motion:[-0.1d,0.2d,0.1d]}
execute if entity @e[scores={SpawnPork=14}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:7b}},Motion:[0.1d,0.2d,-0.1d]}
execute if entity @e[scores={SpawnPork=16}] at @e[tag=BossPigmanAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:porkchop",Count:9b,tag:{Pork:8b}},Motion:[-0.1d,0.2d,-0.1d]}

execute as @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},nbt=!{Item:{tag:{Pork:0b}}}] run data merge entity @s {Item:{tag:{Pork:0b}}}


# BUILD PIG BOSS MONUMENT
execute if entity @e[scores={BossPig=640}] run fill -1034 62 -996 -1028 62 -994 barrier
execute if entity @e[scores={BossPig=640}] run fill -1034 64 -996 -1027 64 -992 air
execute if entity @e[scores={BossPig=640}] run fill -1034 63 -996 -1027 63 -992 air

#execute if entity @e[scores={BossPig=660}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=660}] run clone -1034 36 -996 -1027 36 -992 -1034 63 -996
#execute if entity @e[scores={BossPig=660}] run fill -1034 63 -996 -1027 63 -992 air replace barrier
#execute if entity @e[scores={BossPig=660}] run fill -1034 63 -996 -1027 63 -992 air destroy
execute if entity @e[scores={BossPig=660}] run clone -1034 36 -996 -1027 36 -992 -1034 63 -996
execute if entity @e[scores={BossPig=660}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=660}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=670}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=670}] run clone -1034 37 -996 -1027 37 -992 -1034 64 -996
#execute if entity @e[scores={BossPig=670}] run fill -1034 64 -996 -1027 64 -992 air replace barrier
#execute if entity @e[scores={BossPig=670}] run fill -1034 64 -996 -1027 64 -992 air destroy
execute if entity @e[scores={BossPig=670}] run clone -1034 37 -996 -1027 37 -992 -1034 64 -996
execute if entity @e[scores={BossPig=670}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=670}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=680}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=680}] run clone -1034 38 -996 -1027 38 -992 -1034 65 -996
#execute if entity @e[scores={BossPig=680}] run fill -1034 65 -996 -1027 65 -992 air replace barrier
#execute if entity @e[scores={BossPig=680}] run fill -1034 65 -996 -1027 65 -992 air destroy
execute if entity @e[scores={BossPig=680}] run clone -1034 38 -996 -1027 38 -992 -1034 65 -996
execute if entity @e[scores={BossPig=680}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=680}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=690}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=690}] run clone -1034 39 -996 -1027 39 -992 -1034 66 -996
#execute if entity @e[scores={BossPig=690}] run fill -1034 66 -996 -1027 66 -992 air replace barrier
#execute if entity @e[scores={BossPig=690}] run fill -1034 66 -996 -1027 66 -992 air destroy
execute if entity @e[scores={BossPig=690}] run clone -1034 39 -996 -1027 39 -992 -1034 66 -996
execute if entity @e[scores={BossPig=690}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=690}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=700}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=700}] run clone -1034 40 -996 -1027 40 -992 -1034 67 -996
#execute if entity @e[scores={BossPig=700}] run fill -1034 67 -996 -1027 67 -992 air replace barrier
#execute if entity @e[scores={BossPig=700}] run fill -1034 67 -996 -1027 67 -992 air destroy
execute if entity @e[scores={BossPig=700}] run clone -1034 40 -996 -1027 40 -992 -1034 67 -996
execute if entity @e[scores={BossPig=700}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=700}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=710}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=710}] run clone -1034 41 -996 -1027 41 -992 -1034 68 -996
#xecute if entity @e[scores={BossPig=710}] run fill -1034 68 -996 -1027 68 -992 air replace barrier
#execute if entity @e[scores={BossPig=710}] run fill -1034 68 -996 -1027 68 -992 air destroy
execute if entity @e[scores={BossPig=710}] run clone -1034 41 -996 -1027 41 -992 -1034 68 -996
execute if entity @e[scores={BossPig=710}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=710}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=720}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=720}] run clone -1034 42 -996 -1027 42 -992 -1034 69 -996
#execute if entity @e[scores={BossPig=720}] run fill -1034 69 -996 -1027 69 -992 air replace barrier
#execute if entity @e[scores={BossPig=720}] run fill -1034 69 -996 -1027 69 -992 air destroy
execute if entity @e[scores={BossPig=720}] run clone -1034 42 -996 -1027 42 -992 -1034 69 -996
execute if entity @e[scores={BossPig=720}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=720}] run gamerule doTileDrops true

#execute if entity @e[scores={BossPig=730}] run gamerule doTileDrops false
#execute if entity @e[scores={BossPig=730}] run clone -1034 43 -996 -1027 43 -992 -1034 70 -996
#execute if entity @e[scores={BossPig=730}] run fill -1034 70 -996 -1027 70 -992 air replace barrier
#execute if entity @e[scores={BossPig=730}] run fill -1034 70 -996 -1027 70 -992 air destroy
execute if entity @e[scores={BossPig=730}] run clone -1034 43 -996 -1027 43 -992 -1034 70 -996
execute if entity @e[scores={BossPig=730}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
#execute if entity @e[scores={BossPig=730}] run gamerule doTileDrops true

execute if entity @e[scores={BossPig=750..}] run scoreboard players set @e[tag=MainBossAEC] BossTimer 0
execute if entity @e[scores={BossPig=750..}] run scoreboard players set @e[tag=MainBossAEC] BossLevel 35
