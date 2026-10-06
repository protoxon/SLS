####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 3 2018 / AUGUST 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OreAttack

scoreboard players add @e[tag=MainBossAEC,scores={OreAttack=0..}] OreAttack 1
scoreboard players set @e[tag=MainBossAEC,scores={OreAttack=2}] OreAttack 48
#scoreboard players set @e[tag=MainBossAEC,scores={OreAttack=180}] OreAttack 199
scoreboard players set @e[tag=MainBossAEC,scores={OreAttack=205}] OreAttack 370
scoreboard players set @e[tag=MainBossAEC,scores={OreAttack=461..}] OreAttack 0


# PROTECT BLOCKS DURING ORE ATTACK
execute if block -994 63 -992 air run setblock -994 63 -992 andesite
execute if block -992 63 -992 air run setblock -992 63 -992 andesite
execute if block -992 63 -991 air run setblock -992 63 -991 diorite
execute if block -992 63 -990 air run setblock -992 63 -990 diorite
execute if block -992 63 -988 air run setblock -992 63 -988 andesite
execute if block -992 63 -987 air run setblock -992 63 -987 andesite

execute if block -1000 63 -981 chest unless blocks -1000 63 -981 -1000 63 -981 -1000 2 -981 masked run clone -1000 63 -981 -1000 63 -981 -1000 2 -981 masked
execute if block -1000 63 -981 emerald_ore run clone -1000 2 -981 -1000 2 -981 -1000 63 -981 masked
execute if block -1000 63 -981 gold_ore run clone -1000 2 -981 -1000 2 -981 -1000 63 -981 masked
execute if block -1000 63 -981 lapis_ore run clone -1000 2 -981 -1000 2 -981 -1000 63 -981 masked
execute if block -1000 63 -981 nether_quartz_ore run clone -1000 2 -981 -1000 2 -981 -1000 63 -981 masked
execute if block -1000 63 -981 redstone_ore run clone -1000 2 -981 -1000 2 -981 -1000 63 -981 masked

execute unless blocks -1034 63 -996 -1027 70 -992 -1034 36 -996 all run clone -1034 36 -996 -1027 43 -992 -1034 63 -996
execute unless blocks -1042 63 -990 -1038 71 -981 -1042 36 -990 all run clone -1042 36 -990 -1038 44 -981 -1042 63 -990


tag @a remove PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ black_concrete run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ light_blue_concrete run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ red_concrete run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ grass_block run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ stone run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ coal_ore run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ gravel run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ granite run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ andesite run tag @s add PillarZone
execute align x align y align z as @a[x=-1039,y=63,z=-1002,dx=48,dy=0,dz=24] at @s if block ~ ~-1 ~ diorite run tag @s add PillarZone
execute align x align y align z run tag @e[x=-1002,y=64,z=-1000,dx=6,dy=0,dz=5] remove PillarZone
execute align x align y align z run tag @e[x=-999,y=63,z=-1001,dx=0,dy=0,dz=0] remove PillarZone
execute align x align y align z run tag @e[x=-1001,y=63,z=-995,dx=2,dy=2,dz=2] remove PillarZone


#execute as @e[tag=PillarZone] run say YES


# TAG UP TO 3 RANDOM PLAYERS
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie1] unless entity @a[tag=SummonPillarZombie1] run tag @a[tag=!SummonPillarZombie1,tag=!SummonPillarZombie2,tag=!SummonPillarZombie3,limit=1,sort=random]
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie2] unless entity @a[tag=SummonPillarZombie2] run tag @a[tag=!SummonPillarZombie1,tag=!SummonPillarZombie2,tag=!SummonPillarZombie3,limit=1,sort=random]
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie3] unless entity @a[tag=SummonPillarZombie3] run tag @a[tag=!SummonPillarZombie1,tag=!SummonPillarZombie2,tag=!SummonPillarZombie3,limit=1,sort=random]


# SUMMON SOURCE ZOMBIES
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie1] at @a[tag=SummonPillarZombie1] run summon zombie ~ ~ ~
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie2] at @a[tag=SummonPillarZombie2] run 
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] unless entity @e[tag=PillarZombie3] at @a[tag=SummonPillarZombie3] run 


# SETUP RANDOM AECS FOR SOURCE
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run kill @e[tag=RandomOrePillarSource]
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1015 34 -988 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1015 34 -984 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1015 34 -980 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1011 34 -988 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1011 34 -984 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1011 34 -980 {Duration:2147483647,Tags:["BossAEC","RandomOrePillarSource"]}


# TAG PILLARS TO CLONE TO ZOMBIE PILLAR SOURCE
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie1] run tag @e[tag=RandomOrePillarSource,limit=1,sort=random] add PillarZombieASource
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie2] run tag @e[tag=RandomOrePillarSource,limit=1,sort=random,tag=!PillarZombieASource] add PillarZombieBSource
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie3] run tag @e[tag=RandomOrePillarSource,limit=1,sort=random,tag=!PillarZombieASource,tag=!PillarZombieBSource] add PillarZombieCSource


# CLONE TO ZOMBIE PILLAR LOCATIONS
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=PillarZombieASource] run clone ~ ~ ~ ~2 ~4 ~2 -1019 34 -980 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=PillarZombieBSource] run clone ~ ~ ~ ~2 ~4 ~2 -1019 34 -984 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=PillarZombieCSource] run clone ~ ~ ~ ~2 ~4 ~2 -1019 34 -988 masked


# CLONE TO NON ZOMBIE PILLAR LOCATIONS
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1023 34 -980 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1023 34 -984 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1023 34 -988 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1027 34 -980 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1027 34 -984 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] at @e[tag=RandomOrePillarSource,tag=!PillarZombieASource,tag=!PillarZombieBSource,tag=!PillarZombieCSource,limit=1,sort=random] run clone ~ ~ ~ ~2 ~4 ~2 -1027 34 -988 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run fill -1027 34 -988 -1017 38 -978 air replace barrier


# SUMMON TAGGED ZOMBIE PILLAR SOURCES
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run kill @e[tag=OrePillarSource]
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie1] run summon area_effect_cloud -1019 34 -980 {Duration:2147483647,Tags:["BossAEC","PillarZombie1Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie2] run summon area_effect_cloud -1019 34 -984 {Duration:2147483647,Tags:["BossAEC","PillarZombie2Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] if entity @e[tag=PillarZombie3] run summon area_effect_cloud -1019 34 -988 {Duration:2147483647,Tags:["BossAEC","PillarZombie3Source","OrePillarSource"]}


# SUMMON TAGGED PILLAR SOURCES
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1023 34 -980 {Duration:2147483647,Tags:["BossAEC","OrePillar1Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1023 34 -984 {Duration:2147483647,Tags:["BossAEC","OrePillar2Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1023 34 -988 {Duration:2147483647,Tags:["BossAEC","OrePillar3Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1027 34 -980 {Duration:2147483647,Tags:["BossAEC","OrePillar4Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1027 34 -984 {Duration:2147483647,Tags:["BossAEC","OrePillar5Source","OrePillarSource"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run summon area_effect_cloud -1027 34 -988 {Duration:2147483647,Tags:["BossAEC","OrePillar6Source","OrePillarSource"]}

#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run tag @e[tag=RandomPillarSource,limit=1,sort=random] add PillarZombie1Source
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run tag @e[tag=RandomPillarSource,tag=!PillarZombie1Source,limit=1,sort=random] add PillarZombie2Source
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=1}] run tag @e[tag=RandomPillarSource,tag=!PillarZombie1Source,tag=!PillarZombie2Source,limit=1,sort=random] add PillarZombie3Source

execute if entity @e[tag=MainBossAEC,scores={OreAttack=50}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar1","OrePillar"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=75}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar2","OrePillar"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=100}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar3","OrePillar"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=125}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar4","OrePillar"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=150}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar5","OrePillar"]}
execute if entity @e[tag=MainBossAEC,scores={OreAttack=175}] at @a[tag=PillarZone,limit=1,sort=random] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["BossAEC","OrePillar6","OrePillar"]}


# WARNS PLAYERS OF PILLAR
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=50..200}] at @e[tag=OrePillar] run particle smoke ~ 63 ~ 0.5 0.2 0.5 0 5 force
execute if entity @e[tag=MainBossAEC,scores={OreAttack=50..200}] at @e[tag=OrePillar] run particle block stone ~ 63 ~ 0.5 0.2 0.5 0 2 force
#execute if entity @e[tag=MainBossAEC,scores={OreAttack=50..199}] at @e[tag=OrePillar1] run playsound entity.zombie.destroy_egg master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=50..70}] at @e[tag=OrePillar1] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=75..90}] at @e[tag=OrePillar2] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=100..120}] at @e[tag=OrePillar3] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=125..140}] at @e[tag=OrePillar4] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=150..170}] at @e[tag=OrePillar5] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[tag=MainBossAEC,scores={OreAttack=175..180}] at @e[tag=OrePillar6] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0


# PILLAR APPEARS
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar1] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar1] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar1] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar1] run clone -1023 38 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar1] run clone -1023 37 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar1] run clone -1023 36 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar1] run clone -1023 35 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar1] run clone -1023 34 -980 -1021 38 -978 ~-1 ~ ~-1 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar2] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar2] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar2] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar2] run clone -1023 38 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar2] run clone -1023 37 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar2] run clone -1023 36 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar2] run clone -1023 35 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar2] run clone -1023 34 -984 -1021 38 -982 ~-1 ~ ~-1 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar3] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar3] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar3] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar3] run clone -1023 38 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar3] run clone -1023 37 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar3] run clone -1023 36 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar3] run clone -1023 35 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar3] run clone -1023 34 -988 -1021 38 -986 ~-1 ~ ~-1 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar4] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar4] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar4] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar4] run clone -1027 38 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar4] run clone -1027 37 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar4] run clone -1027 36 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar4] run clone -1027 35 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar4] run clone -1027 34 -980 -1025 38 -978 ~-1 ~ ~-1 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar5] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar5] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar5] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar5] run clone -1027 38 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar5] run clone -1027 37 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar5] run clone -1027 36 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar5] run clone -1027 35 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar5] run clone -1027 34 -984 -1025 38 -982 ~-1 ~ ~-1 masked

execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar6] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar6] run playsound entity.zombie.attack_iron_door master @a ~ ~ ~ 0.5 0.5 0.5
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar6] run playsound item.shield.break master @a ~ ~ ~ 1 0.5 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=200}] at @e[tag=OrePillar6] run clone -1027 38 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=201}] at @e[tag=OrePillar6] run clone -1027 37 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=202}] at @e[tag=OrePillar6] run clone -1027 36 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=203}] at @e[tag=OrePillar6] run clone -1027 35 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=204}] at @e[tag=OrePillar6] run clone -1027 34 -988 -1025 38 -986 ~-1 ~ ~-1 masked


# PILLAR SHRINKS
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar1] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar1] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar1] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar1] run clone -1023 35 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar1] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar1] run clone -1023 36 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar1] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar1] run clone -1023 37 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar1] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar1] run clone -1023 38 -980 -1021 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar1] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar2] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar2] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar2] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar2] run clone -1023 35 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar2] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar2] run clone -1023 36 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar2] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar2] run clone -1023 37 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar2] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar2] run clone -1023 38 -984 -1021 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar2] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar3] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar3] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar3] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar3] run clone -1023 35 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar3] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar3] run clone -1023 36 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar3] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar3] run clone -1023 37 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar3] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar3] run clone -1023 38 -988 -1021 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar3] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar4] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar4] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar4] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar4] run clone -1027 35 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar4] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar4] run clone -1027 36 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar4] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar4] run clone -1027 37 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar4] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar4] run clone -1027 38 -980 -1025 38 -978 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar4] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar5] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar5] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar5] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar5] run clone -1027 35 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar5] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar5] run clone -1027 36 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar5] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar5] run clone -1027 37 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar5] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar5] run clone -1027 38 -984 -1025 38 -982 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar5] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar6] run playsound entity.ender_dragon.shoot master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar6] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.6 1
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar6] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=450}] at @e[tag=OrePillar6] run clone -1027 35 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar6] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=452}] at @e[tag=OrePillar6] run clone -1027 36 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar6] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=454}] at @e[tag=OrePillar6] run clone -1027 37 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar6] run function d3:boss/remove_ores
execute if entity @e[tag=MainBossAEC,scores={OreAttack=456}] at @e[tag=OrePillar6] run clone -1027 38 -988 -1025 38 -986 ~-1 ~ ~-1 masked
execute if entity @e[tag=MainBossAEC,scores={OreAttack=458}] at @e[tag=OrePillar6] run function d3:boss/remove_ores

execute if entity @e[tag=MainBossAEC,scores={OreAttack=460}] run kill @e[tag=OrePillar]



# HURT PLAYER IN IN BLOCK
execute as @a at @s if block ~ ~ ~ diamond_ore run effect give @s instant_damage 1 1 true
execute as @a at @s if block ~ ~ ~ emerald_ore run effect give @s instant_damage 1 1 true
execute as @a at @s if block ~ ~ ~ gold_ore run effect give @s instant_damage 1 1 true
execute as @a at @s if block ~ ~ ~ lapis_ore run effect give @s instant_damage 1 1 true
execute as @a at @s if block ~ ~ ~ nether_quartz_ore run effect give @s instant_damage 1 1 true
execute as @a at @s if block ~ ~ ~ redstone_ore run effect give @s instant_damage 1 1 true




# IRON MOBS
execute unless entity @e[tag=IronOreMob21] at @e[tag=IronOreAS21] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute unless entity @e[tag=IronOreMob21] at @e[tag=IronOreAS21] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute unless entity @e[tag=IronOreMob21] run kill @e[tag=IronOreAS21,distance=10..]
execute as @e[tag=IronOreMob21] at @s run kill @e[tag=IronOreAS21,distance=10..]

execute unless entity @e[tag=IronOreMob22] at @e[tag=IronOreAS22] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute unless entity @e[tag=IronOreMob22] at @e[tag=IronOreAS22] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute unless entity @e[tag=IronOreMob22] run kill @e[tag=IronOreAS22]
execute as @e[tag=IronOreMob22] at @s run kill @e[tag=IronOreAS22,distance=10..]

execute unless entity @e[tag=IronOreMob23] at @e[tag=IronOreAS23] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute unless entity @e[tag=IronOreMob23] at @e[tag=IronOreAS23] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute unless entity @e[tag=IronOreMob23] run kill @e[tag=IronOreAS23]
execute as @e[tag=IronOreMob23] at @s run kill @e[tag=IronOreAS23,distance=10..]

execute unless entity @e[tag=IronOreMob24] at @e[tag=IronOreAS24] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute unless entity @e[tag=IronOreMob24] at @e[tag=IronOreAS24] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute unless entity @e[tag=IronOreMob24] run kill @e[tag=IronOreAS24]
execute as @e[tag=IronOreMob24] at @s run kill @e[tag=IronOreAS24,distance=10..]

execute if entity @e[scores={BossLevel=140,BossTimer=500..}] unless entity @e[tag=IronOreMob21] run summon zombie -1005 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-2.0,1.0,-3.0],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob21","Level5Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS21","Level5Mob"]}]}

execute if entity @e[scores={BossLevel=140,BossTimer=500..}] unless entity @e[tag=IronOreMob22] run summon zombie -1006 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-1.0,1.0,-3.3],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob22","Level5Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS22","Level5Mob"]}]}

execute if entity @e[scores={BossLevel=140,BossTimer=500..}] unless entity @e[tag=IronOreMob23] run summon zombie -1007 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.0,1.0,-3.00],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob23","Level5Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS23","Level5Mob"]}]}

#execute if entity @e[scores={BossLevel=140,BossTimer=500..}] unless entity @e[tag=IronOreMob24] run summon zombie -1008 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.6,1.0,-3.1],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob24","Level5Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS24","Level5Mob"]}]}



execute if entity @e[tag=IronOreMob,tag=!LaunchSFX] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1
tag @e[tag=IronOreMob,tag=!LaunchSFX] add LaunchSFX

