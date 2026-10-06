####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 14 2019 / JULY 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SentryTimer
#scoreboard objectives setdisplay sidebar SentryScan

execute if entity @e[scores={SentryTimer=1..10}] align xyz at @e[type=dolphin,tag=!Sentry] unless entity @e[tag=SentryMarkerAEC] run summon area_effect_cloud ~ ~ ~ {Tags:["SentryMarkerAEC"],Duration:2147483647}
execute if entity @e[scores={SentryTimer=1..100}] as @e[type=dolphin,tag=!Sentry] at @s run teleport ~ ~-100 ~
execute if entity @e[scores={SentryTimer=1}] at @e[tag=SentryMarkerAEC] run playsound entity.villager.work_shepherd master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={SentryTimer=1}] at @e[tag=SentryMarkerAEC] if block ~ ~ ~ air run setblock ~ ~ ~ grindstone[face=floor,facing=south]
execute if entity @e[scores={SentryTimer=1}] at @e[tag=SentryMarkerAEC] if block ~ ~1 ~ air run setblock ~ ~1 ~ iron_bars[east=false,west=false,north=false,south=false]
execute if entity @e[scores={SentryTimer=1}] at @e[tag=SentryMarkerAEC] if block ~ ~2 ~ air run setblock ~ ~2 ~ iron_bars[east=false,west=false,north=false,south=false]
execute if entity @e[scores={SentryTimer=1}] at @e[tag=SentryMarkerAEC] if block ~ ~3 ~ air run setblock ~ ~3 ~ iron_bars[east=false,west=false,north=false,south=false]
execute if entity @e[scores={SentryTimer=1}] align xyz at @e[tag=SentryMarkerAEC] run summon dolphin ~ ~3.6 ~ {Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,ArmorItems:[{},{},{},{id:"minecraft:end_rod",Count:1b}],Team:ArenaMob,Tags:["ArenaMob","ArenaDolphin","Sentry"]}
execute if entity @e[scores={SentryTimer=50}] if entity @e[type=dolphin,tag=Sentry] run scoreboard objectives add SentryTimer dummy
execute if entity @e[scores={SentryTimer=60..}] run scoreboard objectives add SentryScan dummy
execute if entity @a[tag=BattleZone] run scoreboard players add @e[tag=Sentry,type=dolphin] SentryScan 1
execute if entity @e[tag=Sentry] unless entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={SentryScan=0..}] SentryScan 0

execute if entity @e[tag=Sentry] unless entity @e[tag=ArenaAlcoveMob] as @e[tag=Sentry] at @s run teleport @s ~ ~ ~ ~ 90
execute if entity @e[tag=Sentry] unless entity @a[tag=BattleZone] as @e[tag=Sentry] at @s run teleport @s ~ ~ ~ ~ 90

execute if entity @e[tag=Sentry] unless entity @a[tag=BattleZone] run scoreboard players set @e[scores={SentryScan=0..}] SentryScan 0
execute if entity @e[tag=Sentry] if entity @e[scores={ArenaTimer=..1000}] run scoreboard players set @e[scores={SentryScan=0..}] SentryScan 0

scoreboard players set @e[scores={SentryScan=250..}] SentryScan 0
scoreboard players set @e[scores={SentryScan=10}] SentryScan 90
execute if entity @e[scores={SentryScan=..100}] unless entity @e[tag=SentryTargetMob] run tag @e[tag=ArenaAlcoveMob,type=!stray,type=!cave_spider,type=!zombie_horse,limit=1,sort=random] add SentryTargetMob
scoreboard players set @e[scores={SentryScan=100}] SentryScan 150
execute if entity @e[scores={SentryScan=165}] unless entity @e[tag=SentryChargeAEC] at @e[tag=Sentry] run summon area_effect_cloud ~ ~-3 ~ {Tags:["SentryChargeAEC","SentryAEC"],Duration:34}
execute as @e[tag=SentryChargeAEC] at @s run teleport @s ~ ~0.1 ~
execute at @e[tag=SentryChargeAEC] run particle dust 1 0 0 1 ~ ~ ~ 0 0 0 0 1 force
execute if entity @e[scores={SentryScan=170}] at @e[tag=Sentry] if entity @a[tag=BattleZone] run playsound block.beacon.activate master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={SentryScan=195..}] run kill @e[tag=SentryChargeAEC]

execute if entity @e[tag=SentryTargetMob] if entity @a[tag=BattleZone] unless entity @e[tag=SentryTargetAEC] as @e[tag=Sentry] at @s run teleport @s ^ ^ ^ facing entity @e[tag=SentryTargetMob,limit=1]
execute if entity @e[tag=SentryTargetAEC] if entity @a[tag=BattleZone] as @e[tag=Sentry] at @s run teleport @s ^ ^ ^ facing entity @e[tag=SentryTargetAEC,limit=1]
execute if entity @e[scores={SentryScan=200}] at @e[tag=SentryTargetMob] if entity @a[tag=BattleZone] run summon area_effect_cloud ~ ~0.3 ~ {NoGravity:1b,Tags:["SentryTargetAEC","SentryAEC"],Duration:500}
execute if entity @e[scores={SentryScan=200}] at @e[tag=Sentry] if entity @a[tag=BattleZone] run summon area_effect_cloud ~ ~0.3 ~-2 {NoGravity:1b,Tags:["SentryLaserAEC","SentryAEC"],Duration:500}
execute if entity @e[scores={SentryScan=200}] at @e[tag=Sentry] if entity @a[tag=BattleZone] run playsound entity.zombie.infect master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={SentryScan=200}] at @e[tag=Sentry] if entity @a[tag=BattleZone] run playsound ui.stonecutter.take_result master @a ~ ~ ~ 1.5 1 0
execute if entity @e[scores={SentryScan=200}] at @e[tag=Sentry] if entity @a[tag=BattleZone] run playsound entity.dolphin.hurt ambient @a ~ ~ ~ 2 0.5 0
execute as @e[tag=SentryLaserAEC] at @s run teleport @s ^ ^ ^2 facing entity @e[tag=SentryTargetAEC,limit=1]
execute if entity @e[tag=SentryLaserAEC] at @e[tag=SentryLaserAEC] run playsound block.redstone_torch.burnout master @a ~ ~ ~ 0.5 1.5 0
execute if entity @e[tag=SentryLaserAEC] at @e[tag=SentryLaserAEC] run summon area_effect_cloud ~ ~ ~ {Tags:["SentryParticleAEC","SentryAEC"],Duration:2}
execute at @e[tag=SentryParticleAEC] run particle dust 1 0 0 1 ~ ~ ~ 0 0 0 0 1 force
execute if entity @e[tag=SentryLaserAEC] unless entity @e[tag=SentryTargetAEC] run kill @e[tag=SentryParticleAEC]
execute if entity @e[tag=SentryLaserAEC] unless entity @e[tag=SentryTargetAEC] run kill @e[tag=SentryLaserAEC]

execute at @e[tag=SentryLaserAEC] if entity @e[tag=SentryTargetAEC,distance=..1] run summon area_effect_cloud ~ ~ ~ {Tags:["SentryKillAEC","SentryAEC"],Duration:10}
execute at @e[tag=SentryKillAEC] run particle poof ~ ~0.5 ~ 0.5 0.5 0.5 0 10 force
execute at @e[tag=SentryKillAEC] if entity @e[tag=ArenaAlcoveMob,distance=..1.5] run playsound entity.shulker.death master @a ~ ~ ~ 2 1 0
execute at @e[tag=SentryKillAEC] if entity @e[tag=ArenaAlcoveMob,distance=..1.5] run playsound entity.zombie.infect master @a ~ ~ ~ 2 0.7 0
execute at @e[tag=SentryKillAEC] if entity @e[tag=ArenaAlcoveMob,distance=..1.5] run particle damage_indicator ~ ~0.5 ~ 0.5 0.5 0.5 0 15 force
execute at @e[tag=SentryKillAEC] if entity @e[tag=ArenaAlcoveMob,distance=..1.5] run particle end_rod ~ ~0.5 ~ 0.5 0.5 0.5 0 150 force

execute at @e[tag=SentryKillAEC] as @e[tag=ArenaSlime,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] SlimeTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaZombie,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] ZombieTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaSkeleton,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] SkeletonTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaCreeper,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] CreeperTotal 1

execute at @e[tag=SentryKillAEC] as @e[tag=ArenaMagmaCube,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] MagmaCubeTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaWitch,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] WitchTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaStray,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
#execute at @e[tag=SentryKillAEC] as @e[tag=ArenaSpider,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaBabyZombie,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] BabyZombieTotal 1

execute at @e[tag=SentryKillAEC] as @e[tag=ArenaPillager,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] PillagerTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaVindicator,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] VindicatorTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaEvoker,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] EvokerTotal 1
execute at @e[tag=SentryKillAEC] as @e[tag=ArenaWitherSkeleton,distance=..1.5] run scoreboard players add @e[tag=MainArenaAEC] WSkeletonTotal 1

execute at @e[tag=SentryKillAEC] if entity @e[tag=ArenaAlcoveMob,distance=..1.5] run kill @e[tag=ArenaAlcoveMob,distance=..1.5]
execute if entity @e[tag=SentryKillAEC] run kill @e[tag=SentryAEC]

