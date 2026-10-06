####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 2 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BossCow
#scoreboard objectives setdisplay sidebar BossCowFailSafe

scoreboard players add @e[scores={BossCow=0..49}] BossCow 1
scoreboard players set @e[scores={BossCow=50}] BossCow 2
scoreboard players add @e[scores={BossCow=50..369}] BossCow 1
scoreboard players add @e[scores={BossCow=371..599}] BossCow 1
scoreboard players add @e[scores={BossCow=601..}] BossCow 1

execute if entity @e[scores={BossCow=1}] as @e[tag=BossCow] run data merge entity @s {Invulnerable:false}
execute if entity @e[scores={BossCow=1}] at @e[tag=BossCow] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossCow=3}] run summon fireball -1009 69 -960 {direction:[-2.9,-0.45,-2.4],ExplosionPower:1,Tags:["StoneFireball","StoneFireball3"]}


execute if entity @e[scores={BossCow=..49}] if entity @e[tag=BossCow,nbt={HurtTime:10s}] run scoreboard players set @e[scores={BossCow=..49}] BossCow 51

execute if entity @e[tag=StoneFireball3] as @e[tag=BossCow,nbt=!{NoAI:1b}] run data merge entity @s {NoAI:true}
execute if entity @e[scores={BossCow=0..49}] unless entity @e[tag=StoneFireball3] as @e[tag=BossCow,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}

execute if entity @e[scores={BossCow=52}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossCow=52}] run function d3:boss/steve_animations/sign_exclamation
execute if entity @e[scores={BossCow=52}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossCow=52}] at @e[tag=BossCow] run playsound ambient.cave master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossCow=52}] at @e[tag=BossCow] run playsound entity.cow.death master @a ~ ~ ~ 3 1 1
execute if entity @e[scores={BossCow=52}] as @e[tag=BossCow] run data merge entity @s {Invulnerable:true}
execute if entity @e[scores={BossCow=52..}] at @e[tag=BossCow] run particle flame ~ ~0.4 ~ 0.3 0.2 0.3 0.01 2

execute if entity @e[scores={BossCow=60}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossCow=60}] run function d3:boss/steve_animations/sign_exclamtion
#execute if entity @e[scores={BossCow=60}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0

execute if entity @e[scores={BossCow=75}] as @e[tag=BossCow] run data merge entity @s {NoAI:true}
execute if entity @e[scores={BossCow=75}] as @e[tag=BossCow] run data merge entity @s {Silent:true}
execute if entity @e[scores={BossCow=75..339}] as @e[tag=BossCow] at @s run teleport @s -1039.5 ~0.005 -985.0 ~ ~
execute if entity @e[scores={BossCow=75..340}] as @e[tag=BossCow] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossCow=340..360}] as @e[tag=BossCow] at @s run teleport @s -1039.5 ~0.005 -985.0 270 0

execute as @e[tag=BossCow] run data merge entity @s {Fire:-20s}
execute as @e[tag=BossMooshroom] run data merge entity @s {Fire:-20s}

execute if entity @e[scores={BossCow=140}] run summon lightning_bolt -1039.5 64 -986.5
execute if entity @e[scores={BossCow=140}] run summon lightning_bolt -1039.5 64 -983.5
execute if entity @e[scores={BossCow=140}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 3 0.8 1

execute if entity @e[scores={BossCow=140..270}] run fill -1041 64 -988 -1039 64 -983 air replace fire
execute if entity @e[scores={BossCow=143}] run fill -1041 64 -988 -1039 64 -983 air replace grass
execute if entity @e[scores={BossCow=143}] run clone -1041 28 -988 -1039 29 -983 -1041 63 -988


execute if entity @e[scores={BossCow=160}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossCow=160}] run function d3:boss/steve_animations/sign_ellipses
execute if entity @e[scores={BossCow=160}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0

execute if entity @e[scores={BossCow=230}] run summon lightning_bolt -1039.5 64 -986.5
execute if entity @e[scores={BossCow=230}] run summon lightning_bolt -1039.5 64 -983.5
execute if entity @e[scores={BossCow=230}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 3 0.6 1

execute if entity @e[scores={BossCow=233}] run fill -1041 64 -988 -1039 64 -983 air replace dead_bush
execute if entity @e[scores={BossCow=233}] run clone -1041 23 -988 -1039 24 -983 -1041 63 -988

execute if entity @e[scores={BossCow=240}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossCow=350}] run summon fireball -1009 69 -960 {direction:[-2.9,-0.45,-2.4],ExplosionPower:1,Tags:["StoneFireball","StoneFireball4"]}
execute align x align y align z if entity @e[tag=StoneFireball4,x=-1041,y=64,z=-986,dx=2,dy=0,dz=1] run scoreboard players set @e[scores={BossCow=..370}] BossCow 371
scoreboard players set @e[scores={BossCow=370}] BossCow 349

execute if entity @e[scores={BossCow=372}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 10 0.5 1
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run particle lava ~ ~ ~ 1 1 1 0 100 force
execute if entity @e[scores={BossCow=372..375}] at @e[tag=BossCow] run particle cloud ~ ~ ~ 1 1 1 0 500 force
execute if entity @e[scores={BossCow=372}] at @e[tag=BossCow] run summon mooshroom ~ ~ ~ {Type:"red",Invulnerable:true,Rotation:[270f,0f],NoAI:true,Health:150f,Attributes:[{Name:generic.maxHealth,Base:150.0},{Name:"generic.knockbackResistance",Base:1.0}],PersistenceRequired:true,Tags:["BossMob","BossMooshroom"],Passengers:[{id:"minecraft:phantom",CustomName:"{\"text\":\"Armoogeddon\",\"color\":\"red\"}",CustomNameVisible:true,Invulnerable:true,Silent:true,NoAI:true,Rotation:[270f,0f],PersistenceRequired:true,Tags:["BossMob","BossPhantom"]}]}

execute if entity @e[tag=BossMooshroom,nbt={Type:"brown"}] run data merge entity @e[tag=BossMooshroom,limit=1] {Type:"red"}

execute if entity @e[tag=RedirectedMissile] run scoreboard objectives add CowFlicker dummy
execute unless entity @e[tag=RedirectedMissile] run scoreboard objectives remove CowFlicker
execute if entity @e[tag=RedirectedMissile] run scoreboard players add @e[tag=RedirectedMissile] CowFlicker 1
scoreboard players set @e[scores={CowFlicker=2..}] CowFlicker 0
data merge entity @e[scores={CowFlicker=0},limit=1,nbt={Type:"brown"}] {Type:"red"}
data merge entity @e[scores={CowFlicker=1},limit=1,nbt={Type:"red"}] {Type:"brown"}


execute if entity @e[scores={BossCow=372..375}] as @e[tag=BossCow] run data merge entity @s {NoGravity:false,NoAI:false,Invulnerable:false}
execute if entity @e[scores={BossCow=372..375}] as @e[tag=BossCow] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={BossCow=373}] at @e[tag=BossMooshroom] run playsound entity.wither.spawn master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossCow=373}] at @e[tag=BossMooshroom] run playsound block.end_portal.spawn master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossCow=373}] at @e[tag=BossMooshroom] run playsound entity.elder_guardian.curse master @a ~ ~ ~ 5 0.5 1
execute if entity @e[scores={BossCow=372}] run summon lightning_bolt -1039.5 64 -985.0

execute if entity @e[scores={BossCow=375}] run clone -1041 18 -988 -1039 19 -983 -1041 63 -988
execute if entity @e[scores={BossCow=375}] run setblock -1040 65 -987 red_mushroom
execute if entity @e[scores={BossCow=375}] run setblock -1040 65 -984 red_mushroom

execute if entity @e[scores={BossCow=330}] run function d3:boss/steve_animations/face_to_stone
#execute if entity @e[scores={BossCow=330}] run function d3:boss/steve_animations/sign_sad_face

execute if entity @e[scores={BossCow=380..}] unless entity @e[tag=BossMooshroomAS] at @e[tag=BossMooshroom] run summon armor_stand ~ ~ ~ {Invisible:true,Marker:true,Invulnerable:true,NoGravity:true,Silent:true,Small:true,Tags:["BossMob","BossMooshroomAS"],DisabledSlots:2039583}
execute as @e[tag=BossMooshroomAS] at @e[tag=BossMooshroom] run teleport @s ~ ~ ~


# ADD BOSS BAR
#execute if entity @e[scores={BossCow=372}] run bossbar add bossmooshroom "Armoogeddon"
execute if entity @e[scores={BossCow=372}] run bossbar add bossmooshroom {"text":"Armoogeddon","color":"red","bold":"true"}
execute if entity @e[scores={BossCow=372}] run bossbar set bossmooshroom color red
execute if entity @e[scores={BossCow=372}] run bossbar set bossmooshroom style progress
execute if entity @e[scores={BossCow=372}] run bossbar set bossmooshroom max 150
execute if entity @e[scores={BossCow=372..}] run bossbar set bossmooshroom players @a

execute if entity @e[scores={BossCow=372..420}] as @e[tag=BossMooshroom] at @s run teleport @s ~ ~0.1 ~ 

execute store result bossbar bossmooshroom value run data get entity @e[tag=BossMooshroom,limit=1] Health

execute unless entity @e[tag=BossMooshroom] if entity @e[scores={BossCow=602..}] run bossbar remove bossmooshroom

execute if entity @e[scores={BossCow=430}] as @e[tag=BossMooshroom] run data merge entity @s {Invulnerable:false}


execute if entity @e[scores={BossCow=374}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossCow=374}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossCow=375}] run gamerule doTileDrops true


execute if entity @e[scores={BossCow=460}] run tellraw @a ["",{"text":"<Armoogeddon> ","color":"red","bold":false},{"text":"You got a BEEF with me?!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossCow=460..}] if entity @e[tag=BossMooshroom] run scoreboard objectives add BossCowAttack dummy
execute if entity @e[scores={BossCow=480}] run scoreboard players set @e[tag=MainBossAEC] BossCowAttack 295

execute if entity @e[scores={BossCow=550}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossCow=550}] run function d3:boss/steve_animations/face_to_player


# MOOSHROOM ATTACK COMMANDS
#execute if entity @e[tag=BossMooshroom] run scoreboard objectives add BossCowAttack dummy
execute as @e[type=phantom] run data merge entity @s {Fire:-20s}
execute as @e[type=mooshroom] run data merge entity @s {Fire:-20s}
execute unless entity @e[tag=BossMooshroom] run scoreboard objectives remove BossCowAttack
execute unless entity @e[scores={BossCowAttack=0}] run scoreboard objectives remove RepairCowFight
execute unless entity @e[tag=BossMooshroom] run kill @e[tag=BossPhantom]


# FAILSAFE FOR RELOG
execute if entity @e[tag=BossMooshroom] run scoreboard objectives add BossCowFailSafe dummy
scoreboard players add @e[tag=MainBossAEC] BossCowFailSafe 1
execute if entity @e[tag=BossMooshroom] run scoreboard players set @e[tag=MainBossAEC] BossCowFailSafe 0
execute if entity @e[scores={BossCow=602..}] run scoreboard objectives remove BossCowFailSafe


# FINISH MOOSHROOM BOSS
#execute if entity @e[scores={BossCow=400..600}] unless entity @e[tag=BossMooshroom] run scoreboard players set @e[scores={BossCow=..600}] BossCow 601
execute if entity @e[scores={BossCow=400..600}] if entity @e[scores={BossCowFailSafe=6..}] if entity @e[tag=BossMooshroomAS] unless entity @e[tag=BossMooshroom] run scoreboard players set @e[scores={BossCow=..600}] BossCow 601
execute if entity @e[scores={BossCow=602}] at @e[tag=BossMooshroomAS] run playsound entity.cow.death master @a ~ ~ ~ 3 1 1
execute if entity @e[scores={BossCow=602}] run tellraw @a ["",{"text":"<Armoogeddon> ","color":"red","bold":false},{"text":"...That's the second time this week...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossCow=602}] at @e[tag=BossMooshroomAS] run kill @e[tag=BossMooshroomAEC]
execute if entity @e[scores={BossCow=602}] at @e[tag=BossMooshroomAS] run summon area_effect_cloud ~ ~ ~ {Tags:["BossMooshroomAEC"],Duration:100}
execute if entity @e[scores={BossCow=602}] run kill @e[tag=BossMooshroomAS]
execute if entity @e[scores={BossCow=602}] at @e[tag=BossMooshroomAEC] run playsound entity.wither.death master @a ~ ~ ~ 3 0.5 1
execute at @e[tag=BossMooshroomAEC] run particle lava ~ ~ ~ 1 1 1 0 2 force
execute at @e[tag=BossMooshroomAEC] run particle cloud ~ ~ ~ 1 1 1 0 5 force

execute if entity @e[tag=BossMooshroomAEC] run scoreboard objectives add SpawnMushrooms dummy
execute unless entity @e[tag=BossMooshroomAEC] run scoreboard objectives remove SpawnMushrooms
scoreboard players add @e[tag=BossMooshroomAEC] SpawnMushrooms 1
scoreboard players set @e[scores={SpawnMushrooms=17}] SpawnMushrooms 0
execute if entity @e[scores={SpawnMushrooms=2}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:1b}},Motion:[0.0d,0.2d,0.15d]}
execute if entity @e[scores={SpawnMushrooms=4}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:2b}},Motion:[0.0d,0.2d,-0.15d]}
execute if entity @e[scores={SpawnMushrooms=6}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:3b}},Motion:[0.15d,0.2d,0.0d]}
execute if entity @e[scores={SpawnMushrooms=8}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:4b}},Motion:[-0.15d,0.2d,0.0d]}

execute if entity @e[scores={SpawnMushrooms=10}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:5b}},Motion:[0.1d,0.2d,0.1d]}
execute if entity @e[scores={SpawnMushrooms=12}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:6b}},Motion:[-0.1d,0.2d,0.1d]}
execute if entity @e[scores={SpawnMushrooms=14}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:7b}},Motion:[0.1d,0.2d,-0.1d]}
execute if entity @e[scores={SpawnMushrooms=16}] at @e[tag=BossMooshroomAEC] run summon item ~ ~ ~ {Item:{id:"minecraft:red_mushroom",Count:9b,tag:{Pork:8b}},Motion:[-0.1d,0.2d,-0.1d]}

execute as @e[nbt={Item:{id:"minecraft:red_mushroom"},OnGround:1b},nbt=!{Item:{tag:{Pork:0b}}}] run data merge entity @s {Item:{tag:{Pork:0b}}}


# BUILD MOOSHROOM BOSS MONUMENT
execute if entity @e[scores={BossCow=640}] run fill -1042 62 -989 -1041 62 -982 barrier
execute if entity @e[scores={BossCow=640}] run fill -1042 65 -989 -1038 65 -982 air
execute if entity @e[scores={BossCow=640}] run fill -1042 63 -989 -1038 64 -982 air

execute if entity @e[scores={BossCow=660}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=660}] run clone -1042 36 -990 -1038 36 -981 -1042 63 -990 masked
execute if entity @e[scores={BossCow=660}] run playsound block.sand.break master @a -1030 63 -993 1 1 0
execute if entity @e[scores={BossCow=660}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=670}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=670}] run clone -1042 37 -990 -1038 37 -981 -1042 64 -990 masked
execute if entity @e[scores={BossCow=670}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=670}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=680}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=680}] run clone -1042 38 -990 -1038 38 -981 -1042 65 -990 masked
execute if entity @e[scores={BossCow=680}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=680}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=690}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=690}] run clone -1042 39 -990 -1038 39 -981 -1042 66 -990 masked
execute if entity @e[scores={BossCow=690}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=690}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=700}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=700}] run clone -1042 40 -990 -1038 40 -981 -1042 67 -990 masked
execute if entity @e[scores={BossCow=700}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=700}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=710}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=710}] run clone -1042 41 -990 -1038 41 -981 -1042 68 -990 masked
execute if entity @e[scores={BossCow=710}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=710}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=720}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=720}] run clone -1042 42 -990 -1038 42 -981 -1042 69 -990 masked
execute if entity @e[scores={BossCow=720}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=720}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=730}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=730}] run clone -1042 43 -990 -1038 43 -981 -1042 70 -990 masked
execute if entity @e[scores={BossCow=730}] run playsound block.sand.break master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=730}] run gamerule doTileDrops true

execute if entity @e[scores={BossCow=740}] run gamerule doTileDrops false
execute if entity @e[scores={BossCow=740}] run clone -1042 44 -990 -1038 44 -981 -1042 71 -990 masked
execute if entity @e[scores={BossCow=740}] run playsound block.stone.place master @a -1039 63 -986 1 1 0
execute if entity @e[scores={BossCow=740}] run gamerule doTileDrops true


execute if entity @e[scores={BossCow=750..}] run scoreboard players set @e[tag=MainBossAEC] BossTimer 0
execute if entity @e[scores={BossCow=750..}] run scoreboard players set @e[tag=MainBossAEC] BossLevel 140
