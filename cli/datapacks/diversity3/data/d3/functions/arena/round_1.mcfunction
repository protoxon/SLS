####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=0..750}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=1000..1099}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=1101..1999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=2001..2999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=3001..3499}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=1,ArenaTimer=3501..3599}] ArenaTimer 1

difficulty easy

# SETUP
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1..750}] run function d3:arena/round_setup
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1..750}] run function d3:arena/gates_closed


# SITTING
#{Pose:{Head:[7f,0f,0f],LeftLeg:[280f,350f,0f],RightLeg:[280f,10f,0f],LeftArm:[340f,0f,270f],RightArm:[340f,0f,90f]}}
#teleport @e[tag=AdamSits] 0 72.6 2024.5 180 0

# STANDS
#{Pose:{Head:[0f,0f,0f],LeftLeg:[0f,350f,0f],RightLeg:[0f,10f,0f]}}
#teleport @e[tag=AdamStands] 0 73 2023.7 180 0

# ARMS DOWN
#{Pose:{RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

# ARMS OUT 
#{Pose:{LeftArm:[340f,0f,270f],RightArm:[340f,0f,90f]}}

# POINTS
#{Pose:{RightArm:[280f,10f,0f],LeftArm:[0f,10f,350f]}}

# GESTURE
#{Pose:{RightArm:[300f,320f,50f],LeftArm:[300f,320f,0f]}}


# DIALOGUE
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1}] run function d3:arena/adam_sits

execute if entity @e[scores={ArenaRound=1,ArenaTimer=10}] run function d3:arena/adam_stands

execute if entity @e[scores={ArenaRound=1,ArenaTimer=30}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=1,ArenaTimer=30}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Behold! A new challenger approaches!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=100}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=1,ArenaTimer=100..1029}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=1,ArenaTimer=130}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Welcome to the Arena. Do you have what it takes to be our new champion?","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=220}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=1,ArenaTimer=230}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You must kill 15 of each foe, then you may attempt to destroy their spawners!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=340}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=1,ArenaTimer=350}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Complete this task and you'll advance!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=470}] run function d3:arena/adam_gestures
execute if entity @e[scores={ArenaRound=1,ArenaTimer=480}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You may return to the Trade Shop at any time during the round. You'll need it. Especially for that handy little spawner smashing tool...","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=640}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=1,ArenaTimer=650}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Oh, and you better stay alive! If you die, you will lose your Kill Ca$h!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=740}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=1,ArenaTimer=750}] run kill @e[tag=Round1Squid]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=750}] run summon squid 0 150 2000 {Invulnerable:true,Air:32767s,Health:5f,PersistenceRequired:1b,Attributes:[{Name:"generic.maxHealth",Base:5.0d}],Tags:["ArenaMob","RoundSquid","Round1Squid"]}


# ROUND BEGINS
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1030}] run function d3:arena/adam_sits

execute if entity @e[scores={ArenaRound=1,ArenaTimer=1030}] run title @a times 20 210 20
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1030}] run title @a title {"text":"ROUND 1","color":"yellow"}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1030}] run title @a subtitle {"text":"- The Basics -", "color":"white"}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1030}] run scoreboard objectives add GatesDown dummy


# ACCESS SPAWNERS
execute if entity @e[scores={ArenaRound=1,SlimeTotal=15..}] unless block 36 64 1988 redstone_block run setblock 36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=1,SlimeTotal=15..}] unless block 36 64 1989 redstone_block run setblock 36 64 1989 redstone_block
execute if entity @e[scores={ArenaRound=1,ZombieTotal=15..}] unless block 36 64 2011 redstone_block run setblock 36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=1,ZombieTotal=15..}] unless block 36 64 2012 redstone_block run setblock 36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=1,SkeletonTotal=15..}] unless block -36 64 2011 redstone_block run setblock -36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=1,SkeletonTotal=15..}] unless block -36 64 2012 redstone_block run setblock -36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=1,CreeperTotal=15..}] unless block -36 64 1988 redstone_block run setblock -36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=1,CreeperTotal=15..}] unless block -36 64 1989 redstone_block run setblock -36 64 1989 redstone_block
#execute if entity @e[scores={ArenaRound=1,CaveSpiderTotal=15..}] unless block -36 64 1988 redstone_block run setblock -36 64 1988 redstone_block
#execute if entity @e[scores={ArenaRound=1,CaveSpiderTotal=15..}] unless block -36 64 1989 redstone_block run setblock -36 64 1989 redstone_block


# DIALOGUE FOR SHUTTING DOWN SPAWNERS
execute if entity @e[scores={SlimeTotal=..13}] run tag @e remove SlimeNear
execute if entity @e[tag=MainArenaAEC,tag=!SlimeNear,scores={SlimeTotal=14}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!SlimeNear,scores={SlimeTotal=14}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more slime kill needed to get to the spawner!","color":"none"}]
execute if entity @e[scores={SlimeTotal=14}] run tag @e[tag=MainArenaAEC] add SlimeNear
execute if entity @e[scores={SlimeTotal=15..}] run tag @e remove SlimeNear

execute if entity @e[scores={SlimeTotal=..14}] run tag @e remove SlimeDone
execute if entity @e[tag=MainArenaAEC,tag=!SlimeDone,scores={SlimeTotal=15}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!SlimeDone,scores={SlimeTotal=15}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"That's ","color":"none"},{"text":"15 slime kills","color":"green"},{"text":"! You can now get to their spawner and destroy it!","color":"none"}]
execute if entity @e[scores={SlimeTotal=15}] run tag @e[tag=MainArenaAEC] add SlimeDone
execute if entity @e[scores={SlimeTotal=16..}] run tag @e remove SlimeDone

execute if entity @e[scores={ZombieTotal=..13}] run tag @e remove ZombieNear
execute if entity @e[tag=MainArenaAEC,tag=!ZombieNear,scores={ZombieTotal=14}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!ZombieNear,scores={ZombieTotal=14}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more dead zombie, and you'll have access to their spawner!","color":"none"}]
execute if entity @e[scores={ZombieTotal=14}] run tag @e[tag=MainArenaAEC] add ZombieNear
execute if entity @e[scores={ZombieTotal=15..}] run tag @e remove ZombieNear

execute if entity @e[scores={ZombieTotal=..14}] run tag @e remove ZombieDone
execute if entity @e[tag=MainArenaAEC,tag=!ZombieDone,scores={ZombieTotal=15}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!ZombieDone,scores={ZombieTotal=15}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You've got ","color":"none"},{"text":"15 zombie kills","color":"dark_green"},{"text":"! Get into their alcove and break that spawner!","color":"none"}]
execute if entity @e[scores={ZombieTotal=15}] run tag @e[tag=MainArenaAEC] add ZombieDone
execute if entity @e[scores={ZombieTotal=16..}] run tag @e remove ZombieDone

execute if entity @e[scores={SkeletonTotal=..13}] run tag @e remove SkeletonNear
execute if entity @e[tag=MainArenaAEC,tag=!SkeletonNear,scores={SkeletonTotal=14}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!SkeletonNear,scores={SkeletonTotal=14}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Only one more skeleton to kill and you'll be able to get to their spawner!","color":"none"}]
execute if entity @e[scores={SkeletonTotal=14}] run tag @e[tag=MainArenaAEC] add SkeletonNear
execute if entity @e[scores={SkeletonTotal=15..}] run tag @e remove SkeletonNear

execute if entity @e[scores={SkeletonTotal=..14}] run tag @e remove SkeletonDone
execute if entity @e[tag=MainArenaAEC,tag=!SkeletonDone,scores={SkeletonTotal=15}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!SkeletonDone,scores={SkeletonTotal=15}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Nice! ","color":"none"},{"text":"15 skeletons are dust","color":"blue"},{"text":"! You can now get to their spawner but don't forget that smasher pick!","color":"none"}]
execute if entity @e[scores={SkeletonTotal=15}] run tag @e[tag=MainArenaAEC] add SkeletonDone
execute if entity @e[scores={SkeletonTotal=16..}] run tag @e remove SkeletonDone

execute if entity @e[scores={CreeperTotal=..13}] run tag @e remove CreeperNear
execute if entity @e[tag=MainArenaAEC,tag=!CreeperNear,scores={CreeperTotal=14}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!CreeperNear,scores={CreeperTotal=14}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Get em! You only need one more creeper kill to access their spawner!","color":"none"}]
execute if entity @e[scores={CreeperTotal=14}] run tag @e[tag=MainArenaAEC] add CreeperNear
execute if entity @e[scores={CreeperTotal=15..}] run tag @e remove CreeperNear

execute if entity @e[scores={CreeperTotal=..14}] run tag @e remove CreeperDone
execute if entity @e[tag=MainArenaAEC,tag=!CreeperDone,scores={CreeperTotal=15}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!CreeperDone,scores={CreeperTotal=15}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Boom! ","color":"none"},{"text":"15 creepers eliminated","color":"aqua"},{"text":"! Smash that spawner!","color":"none"}]
execute if entity @e[scores={CreeperTotal=15}] run tag @e[tag=MainArenaAEC] add CreeperDone
execute if entity @e[scores={CreeperTotal=16..}] run tag @e remove CreeperDone


#execute if entity @e[scores={CaveSpiderTotal=..13}] run tag @e remove CaveSpiderNear
#execute if entity @e[tag=MainArenaAEC,tag=!CaveSpiderNear,scores={CaveSpiderTotal=14}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
#execute if entity @e[tag=MainArenaAEC,tag=!CaveSpiderNear,scores={CaveSpiderTotal=14}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Get em! You only need one more cave spider kill to access their spawner!","color":"none"}]
#execute if entity @e[scores={CaveSpiderTotal=14}] run tag @e[tag=MainArenaAEC] add CaveSpiderNear
#execute if entity @e[scores={CaveSpiderTotal=15..}] run tag @e remove CaveSpiderNear

#execute if entity @e[scores={CaveSpiderTotal=..14}] run tag @e remove CaveSpiderDone
#execute if entity @e[tag=MainArenaAEC,tag=!CaveSpiderDone,scores={CaveSpiderTotal=15}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
#execute if entity @e[tag=MainArenaAEC,tag=!CaveSpiderDone,scores={CaveSpiderTotal=15}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Finally! That's ","color":"none"},{"text":"15 cave spiders squashed","color":"red"},{"text":"! Now enter their lair and pickaxe that spawner!","color":"none"}]
#execute if entity @e[scores={CaveSpiderTotal=15}] run tag @e[tag=MainArenaAEC] add CaveSpiderDone
#execute if entity @e[scores={CaveSpiderTotal=16..}] run tag @e remove CaveSpiderDone



# SPAWNING CLOCKS
execute if block 37 67 1995 spawner{SpawnData:{id:"minecraft:slime"}} run function d3:arena/spawn_slimes
execute if block 37 67 2005 spawner{SpawnData:{id:"minecraft:zombie"}} run function d3:arena/spawn_zombies
execute if block -37 67 2005 spawner{SpawnData:{id:"minecraft:skeleton"}} run function d3:arena/spawn_skeletons
#execute if block -37 67 1995 spawner{SpawnData:{id:"minecraft:cave_spider"}} run function d3:arena/spawn_cave_spiders
execute if block -37 67 1995 spawner{SpawnData:{id:"minecraft:creeper"}} run function d3:arena/spawn_creepers


# CAVE SPIDER DERP
#execute if block -37 67 1995 spawner run weather rain
#execute unless block -37 67 1995 spawner unless entity @e[tag=ArenaCaveSpider,tag=ArenaAlcoveMob] run weather clear


# ALCOVE 1 - SPAWNER DESTROY MECHANIC
execute if block 37 67 1995 spawner unless block 37 64 1995 redstone_block run setblock 37 64 1995 redstone_block
execute if block 37 67 1995 air run scoreboard objectives remove SpawnSlime
execute if block 37 67 1995 air run playsound entity.puffer_fish.sting master @a 37 67 1995 3 0.5 0
#execute if block 37 67 1995 air run playsound entity.firework_rocket.twinkle master @a 37 67 1995 1 1 0
execute if block 37 67 1995 air run particle lava 37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block 37 67 1995 air run summon item 37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:1b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 1995 air run setblock 37 67 1995 structure_void
execute if block 37 67 1995 structure_void unless block 37 64 1995 clay run setblock 37 64 1995 clay

# ALCOVE 2 - SPAWNER DESTROY MECHANIC
execute if block 37 67 2005 spawner unless block 37 64 2005 redstone_block run setblock 37 64 2005 redstone_block
execute if block 37 67 2005 air run scoreboard objectives remove SpawnZombie
execute if block 37 67 2005 air run playsound entity.puffer_fish.sting master @a 37 67 2005 3 0.5 0
#execute if block 37 67 2005 air run playsound entity.firework_rocket.twinkle master @a 37 67 2005 1 1 0
execute if block 37 67 2005 air run particle lava 37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block 37 67 2005 air run summon item 37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:1b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 2005 air run setblock 37 67 2005 structure_void
execute if block 37 67 2005 structure_void unless block 37 64 2005 clay run setblock 37 64 2005 clay

# ALCOVE 3 - SPAWNER DESTROY MECHANIC
execute if block -37 67 2005 spawner unless block -37 64 2005 redstone_block run setblock -37 64 2005 redstone_block
execute if block -37 67 2005 air run scoreboard objectives remove SpawnSkeleton
execute if block -37 67 2005 air run playsound entity.puffer_fish.sting master @a -37 67 2005 3 0.5 0
#execute if block -37 67 2005 air run playsound entity.firework_rocket.twinkle master @a -37 67 2005 1 1 0
execute if block -37 67 2005 air run particle lava -37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block -37 67 2005 air run summon item -37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:1b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 2005 air run setblock -37 67 2005 structure_void
execute if block -37 67 2005 structure_void unless block -37 64 2005 clay run setblock -37 64 2005 clay

# ALCOVE 4 - SPAWNER DESTROY MECHANIC
execute if block -37 67 1995 spawner unless block -37 64 1995 redstone_block run setblock -37 64 1995 redstone_block
#execute if block -37 67 1995 air run scoreboard objectives remove SpawnCaveSpider
execute if block -37 67 1995 air run scoreboard objectives remove SpawnCreeper
execute if block -37 67 1995 air run playsound entity.puffer_fish.sting master @a -37 67 1995 3 0.5 0
#execute if block -37 67 1995 air run playsound entity.firework_rocket.twinkle master @a -37 67 1995 1 1 0
execute if block -37 67 1995 air run particle lava -37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block -37 67 1995 air run summon item -37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:1b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 1995 air run setblock -37 67 1995 structure_void
execute if block -37 67 1995 structure_void unless block -37 64 1995 clay run setblock -37 64 1995 clay


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void if entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=1,ArenaTimer=1100}] ArenaTimer 1101
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1500}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Time to clean up those last remaining enemies!","color":"none"}]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=1500}] run effect give @e[tag=ArenaAlcoveMob] glowing 1000000 255 true


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void unless entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=1,ArenaTimer=1100..2000}] ArenaTimer 2001
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2021..2049}] if entity @e[type=slime,tag=!ArenaStatue] run effect give @e[tag=ArenaAlcoveMob] glowing 1000000 255 true
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2021..2049}] if entity @e[type=slime,tag=!ArenaStatue] run effect give @e[type=slime,tag=!ArenaStatue] glowing 1000000 255 true
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2021..2049}] if entity @e[type=slime,tag=!ArenaStatue] run scoreboard players set @e[scores={ArenaRound=1,ArenaTimer=2001..2049}] ArenaTimer 2001
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run scoreboard objectives remove SpawnSlime
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run scoreboard objectives remove SpawnZombie
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run scoreboard objectives remove SpawnSkeleton
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run scoreboard objectives remove SpawnSpider

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run function d3:arena/adam_stands
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2050}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Well done! But it isn't over yet!","color":"none"}]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Not by a long shot!","color":"none"}]


# CLOSES GATES AFTER ALL MOBS AND SPAWNERS DESTROYED
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2120..}] if block 27 67 1988 air if block 27 67 2012 air if block -27 67 2012 air if block -27 67 1988 air unless entity @a[tag=InAlcove] run scoreboard objectives add GatesUp dummy


execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Ladies and gentlemen! It's time for the showdown!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run kill @e[tag=ArenaBoss1]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon ocelot 0 59 2024 {Health:100f,Attributes:[{Name:generic.maxHealth,Base:100.0}],NoAI:1b,Age:-999999,Invulnerable:1b,PersistenceRequired:1b,Rotation:[180f,0f],Tags:["ArenaMob","ArenaBoss","ArenaBoss1"],Passengers:[{id:"minecraft:silverfish",CustomName:"{\"text\":\"Catfish Cayleigh\",\"color\":\"yellow\"}",CustomNameVisible:false,Health:100f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.followRange",Base:40.0d},{Name:"generic.attackDamage",Base:3.5d}],NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Rotation:[180f,0f],Tags:["ArenaMob","ArenaBoss","ArenaBoss1"]}]}


execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run kill @e[tag=ArenaBossPlatform]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand -1 58 2023 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform1","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:oak_planks"},Tags:["ArenaBossPlatform1","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 0 58 2023 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform2","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:oak_planks"},Tags:["ArenaBossPlatform2","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 1 58 2023 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform3","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:birch_planks"},Tags:["ArenaBossPlatform3","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand -1 58 2024 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform4","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:oak_planks"},Tags:["ArenaBossPlatform4","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 0 58 2024 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform5","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:birch_planks"},Tags:["ArenaBossPlatform5","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 1 58 2024 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform6","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:birch_planks"},Tags:["ArenaBossPlatform6","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand -1 58 2025 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform7","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:birch_planks"},Tags:["ArenaBossPlatform7","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 0 58 2025 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform8","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:oak_planks"},Tags:["ArenaBossPlatform8","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run summon armor_stand 1 58 2025 {Invisible:1b,NoGravity:1b,Small:1b,Marker:1b,Tags:["ArenaBossPlatform9","ArenaBossPlatform"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:oak_planks"},Tags:["ArenaBossPlatform9","ArenaBossPlatform"],NoGravity:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


# PLATFORM RISES
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run fill -2 63 2021 2 63 2021 polished_andesite
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run fill -2 64 2021 2 67 2021 iron_bars[east=true,west=true]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200}] run fill -1 58 2023 1 63 2025 air

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBoss1,type=ocelot] at @s[x=0,y=59,z=2024,dx=0,dy=3.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform1,type=armor_stand] at @s[x=-1,y=57,z=2023,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform2,type=armor_stand] at @s[x=0,y=57,z=2023,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform3,type=armor_stand] at @s[x=1,y=57,z=2023,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform4,type=armor_stand] at @s[x=-1,y=57,z=2024,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform5,type=armor_stand] at @s[x=0,y=57,z=2024,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform6,type=armor_stand] at @s[x=1,y=57,z=2024,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform7,type=armor_stand] at @s[x=-1,y=57,z=2025,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform8,type=armor_stand] at @s[x=0,y=57,z=2025,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2200..2310}] as @e[tag=ArenaBossPlatform9,type=armor_stand] at @s[x=1,y=57,z=2025,dx=0,dy=4.95,dz=0] run teleport @s ~ ~0.05 ~

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2225}] run playsound entity.minecart.riding block @a 0 63 2024 1 0.5 0

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock -1 63 2023 oak_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 0 63 2023 oak_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 1 63 2023 birch_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock -1 63 2024 oak_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 0 63 2024 birch_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 1 63 2024 birch_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock -1 63 2025 birch_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 0 63 2025 oak_planks
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run setblock 1 63 2025 oak_planks

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2310}] run kill @e[tag=ArenaBossPlatform]
##execute align x align y align z if entity @e[tag=ArenaBossPlatform,type=falling_block,x=-1,y=63,z=2023,dx=2,dy=0,dz=2] run kill @e[tag=ArenaBossPlatform]


execute if entity @e[scores={ArenaRound=1,ArenaTimer=2350}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2350}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You know her as the cute and lovable youngest daughter of qmagnet...","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2410}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2420}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"But we've transformed her into...","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2520}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"CAAAATFIIIIISH CAAAAAYLEEEIGH!","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run scoreboard objectives add BossGateDown dummy
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530..2542}] run scoreboard players add @e[tag=MainArenaAEC] BossGateDown 0
execute if entity @e[scores={BossGateDown=0..}] run function d3:arena/gate_down_boss


# ARENA BOSS 1
execute if entity @e[tag=ArenaBoss1] unless entity @e[tag=ArenaBoss1AS] at @e[tag=ArenaBoss1,type=ocelot] run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerble:1b,NoGravity:true,Small:1b,Tags:["ArenaBoss1AS"]}
execute if entity @e[tag=ArenaBoss1] as @e[tag=ArenaBoss1AS] at @e[tag=ArenaBoss1,type=ocelot] run teleport @s ~ ~ ~

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2540}] as @e[tag=ArenaBoss1] run data merge entity @s {NoAI:0b,Invulnerable:0b}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2540}] as @e[tag=ArenaBoss1,type=ocelot] run data merge entity @s {Motion:[0.0d,0.5d,-1.5d]}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2540}] at @e[tag=ArenaBoss1,type=ocelot] run playsound entity.cat.hiss hostile @a ~ ~ ~ 1 1 0

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run title @a times 20 160 20
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run title @a title {"text":"Catfish Cayleigh","color":"yellow"}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run title @a subtitle {"text":"✸ Cute But Deadly ✸", "color":"white"}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run bossbar add arenaboss1 {"text":"Catfish Cayleigh","color":"yellow","bold":"true"}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run bossbar set arenaboss1 color yellow
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run bossbar set arenaboss1 style progress
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530}] run bossbar set arenaboss1 max 100
execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530..3019}] run bossbar set arenaboss1 players @a
#execute store result bossbar arenaboss1 value run data get entity @e[tag=ArenaBoss1,limit=1,type=ocelot] Health

scoreboard objectives add Boss1Health dummy
execute store result score @e[tag=ArenaBoss1,type=ocelot] Boss1Health run data get entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Health 1
execute store result score @e[tag=ArenaBoss1,type=silverfish] Boss1Health run data get entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Health 1
scoreboard players operation @e[tag=ArenaBoss1,type=ocelot] Boss1Health < @e[tag=ArenaBoss1,type=silverfish] Boss1Health
scoreboard players operation @e[tag=ArenaBoss1,type=silverfish] Boss1Health < @e[tag=ArenaBoss1,type=ocelot] Boss1Health
execute store result entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Health float 1 run scoreboard players get @e[tag=ArenaBoss1,type=ocelot,limit=1] Boss1Health
execute store result entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Health float 1 run scoreboard players get @e[tag=ArenaBoss1,type=silverfish,limit=1] Boss1Health
execute store result bossbar arenaboss1 value run scoreboard players get @e[tag=ArenaBoss1,type=silverfish,limit=1] Boss1Health

#execute store result bossbar arenaboss1 value run data get entity @e[tag=ArenaBoss1,limit=1,type=ocelot] Health

#execute if entity @e[tag=ArenaBoss1,type=ocelot,nbt={HurtTime:10s}] store result entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Health float 1 run data get entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Health 1
#execute if entity @e[tag=ArenaBoss1,type=silverfish,nbt={HurtTime:10s}] store result entity @e[tag=ArenaBoss1,type=ocelot,limit=1] Health float 1 run data get entity @e[tag=ArenaBoss1,type=silverfish,limit=1] Health 1
execute unless entity @e[tag=ArenaBoss1,type=ocelot] run kill @e[tag=ArenaBoss1]
execute unless entity @e[tag=ArenaBoss1,type=silverfish] run kill @e[tag=ArenaBoss1]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2530..}] if entity @e[tag=ArenaBoss1] run scoreboard objectives add Boss1Attack dummy
execute if entity @e[tag=ArenaBoss1] run scoreboard players add @e[tag=MainArenaAEC] Boss1Attack 0
execute if entity @e[tag=MainArenaAEC,scores={Boss1Attack=0..}] run function d3:arena/boss_1_attack

execute if entity @e[scores={ArenaRound=1,ArenaTimer=2600}] run function d3:arena/adam_sits


#1.14 RIDER FIX




# KILL BOSS
execute if block 0 72 2023 quartz_stairs unless entity @e[tag=ArenaBoss1] if entity @e[tag=ArenaBoss1AS] run scoreboard players set @e[scores={ArenaTimer=2600..3000}] ArenaTimer 3001
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3001..}] if entity @e[tag=ArenaBoss1] run scoreboard players set @e[scores={ArenaTimer=3001..}] ArenaTimer 2999

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002}] at @e[tag=ArenaBoss1AS] run summon firework_rocket ~ ~ ~ {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:1b,Explosions:[{Type:2b,Trail:1,Flicker:1,Colors:[I;14602026]}]}}},Life:0}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002..}] run kill @e[tag=Boss1Helper]
#execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss1AS] run particle falling_dust yellow_terracotta ~ ~0.5 ~ 0.2 0.2 0.2 1 30 force @a
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss1AS] run particle cloud ~ ~0.5 ~ 0.2 0.2 0.2 0 30 force @a
#execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002}] at @e[tag=ArenaBoss1AS] run playsound entity.husk.converted_to_zombie master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002}] at @e[tag=ArenaBoss1AS] run playsound entity.elder_guardian.death ambient @a ~ ~ ~ 1 1 0
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002}] at @e[tag=ArenaBoss1AS] run playsound entity.iron_golem.death ambient @a ~ ~ ~ 0.5 0.5 0
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002..3020}] at @e[tag=ArenaBoss1AS] run playsound entity.snow_golem.death master @a ~ ~ ~ 0.5 0.5 0.5

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3002}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3003}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3004}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3005}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3006}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3007}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3008}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3009}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3010}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3011}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3012}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3013}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3014}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3015}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3016}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3017}] at @e[tag=ArenaBoss1AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3020}] run kill @e[tag=ArenaBoss1AS]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3020..}] run scoreboard objectives remove Boss1Attack
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3020..}] run scoreboard objectives remove ArenaBoss1Regen
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3020..}] run bossbar remove minecraft:arenaboss1

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3020}] run setblock 11 1 78 gold_block

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3040..3299}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3040}] run function d3:arena/adam_stands
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3040}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3040}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Wowee zowee! And Catfish Cayleigh is out for the count.","color":"none"}]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3120}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Well done. You've advanced to the next stage!","color":"none"}]
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Go rest and purchase any needed upgrades as we set up for the next round.","color":"none"}]

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3300}] run function d3:arena/adam_sits

# SWITCH TO NEXT ROUND
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220..3500}] unless entity @a[tag=ArenaZone] run scoreboard players set @e[scores={ArenaRound=1,ArenaTimer=3500}] ArenaTimer 3501

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] unless block 0 62 2000 spruce_planks run setblock -29 19 1971 redstone_block
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block -29 19 1971 redstone_block run setblock -30 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_2a",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block -30 57 1971 structure_block run setblock -29 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] unless block 1 62 2000 spruce_planks run setblock 2 19 1971 redstone_block
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block 2 19 1971 redstone_block run setblock 1 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_2b",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block 1 57 1971 structure_block run setblock 2 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] unless block 0 62 2001 spruce_planks run setblock -29 19 2001 redstone_block
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block -29 19 2001 redstone_block run setblock -30 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_2c",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block -30 57 2001 structure_block run setblock -29 57 2001 redstone_block

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] unless block 1 62 2001 spruce_planks run setblock 2 19 2001 redstone_block
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block 2 19 2001 redstone_block run setblock 1 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_2d",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] if block 1 57 2001 structure_block run setblock 2 57 2001 redstone_block
