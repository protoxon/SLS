####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=0..750}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=1000..1099}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=1101..1999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=2001..2999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=3001..3499}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=2,ArenaTimer=3501..3599}] ArenaTimer 1

difficulty easy

# SETUP
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1..750}] run function d3:arena/round_setup
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1..750}] run function d3:arena/gates_closed


# TRAPS
#tag @e remove R2TrapA
#execute align x align y align z run tag @a[x=-17,y=60,z=1997,dx=2,dy=2,dz=2] add R2TrapA
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=-17,y=60,z=1997,dx=2,dy=2,dz=2] add R2TrapA
#execute if entity @e[tag=R2TrapA] run function d3:arena/round_2_trap_a
#execute unless entity @e[tag=R2TrapA] run scoreboard objectives remove R2TrapA

#tag @e remove R2TrapB
#execute align x align y align z run tag @a[x=-11,y=60,z=2008,dx=2,dy=2,dz=2] add R2TrapB
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=-11,y=60,z=2008,dx=2,dy=2,dz=2] add R2TrapB
#execute if entity @e[tag=R2TrapB] run function d3:arena/round_2_trap_b
#execute unless entity @e[tag=R2TrapB] run scoreboard objectives remove R2TrapB

#tag @e remove R2TrapC
#execute align x align y align z run tag @a[x=16,y=60,z=1997,dx=2,dy=2,dz=2] add R2TrapC
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=16,y=60,z=1997,dx=2,dy=2,dz=2] add R2TrapC
#execute if entity @e[tag=R2TrapC] run function d3:arena/round_2_trap_c
#execute unless entity @e[tag=R2TrapC] run scoreboard objectives remove R2TrapC

#tag @e remove R2TrapD
#execute align x align y align z run tag @a[x=13,y=61,z=2010,dx=2,dy=2,dz=2] add R2TrapD
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=13,y=61,z=2010,dx=2,dy=2,dz=2] add R2TrapD
#execute if entity @e[tag=R2TrapD] run function d3:arena/round_2_trap_d
#execute unless entity @e[tag=R2TrapD] run scoreboard objectives remove R2TrapD



# DIALOGUE
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1}] run function d3:arena/adam_sits

execute if entity @e[scores={ArenaRound=2,ArenaTimer=10}] run function d3:arena/adam_stands

execute if entity @e[scores={ArenaRound=2,ArenaTimer=30}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=2,ArenaTimer=30}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Ready for the next round?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=100}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=2,ArenaTimer=100..1029}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=2,ArenaTimer=130}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"We've added a bit more challenge this time.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=220}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=2,ArenaTimer=230}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Now you must kill 20 of each foe before you can get to the spawners!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=350}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=2,ArenaTimer=360}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Good luck!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=410}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=2,ArenaTimer=420}] run kill @e[tag=Round2Squid]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=420}] run summon squid 0 150 2000 {Invulnerable:true,Air:32767s,Health:5f,PersistenceRequired:1b,Attributes:[{Name:"generic.maxHealth",Base:5.0d}],Tags:["ArenaMob","RoundSquid","Round2Squid"]}


# ROUND BEGINS
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run function d3:arena/adam_sits
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run teleport @e[tag=ArenaAdam] 0 72.6 2024.5 180 0

execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run title @a times 20 210 20
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run title @a title {"text":"ROUND 2","bold":false,"color":"yellow"}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run title @a subtitle {"text":"- The Advanced -", "color":"white"}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1030}] run scoreboard objectives add GatesDown dummy


# ACCESS SPAWNERS
execute if entity @e[scores={ArenaRound=2,MagmaCubeTotal=20..}] unless block 36 64 1988 redstone_block run setblock 36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=2,MagmaCubeTotal=20..}] unless block 36 64 1989 redstone_block run setblock 36 64 1989 redstone_block
execute if entity @e[scores={ArenaRound=2,WitchTotal=20..}] unless block 36 64 2011 redstone_block run setblock 36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=2,WitchTotal=20..}] unless block 36 64 2012 redstone_block run setblock 36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=2,StrayTotal=20..}] unless block -36 64 2011 redstone_block run setblock -36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=2,StrayTotal=20..}] unless block -36 64 2012 redstone_block run setblock -36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=2,BabyZombieTotal=20..}] unless block -36 64 1988 redstone_block run setblock -36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=2,BabyZombieTotal=20..}] unless block -36 64 1989 redstone_block run setblock -36 64 1989 redstone_block


# DIALOGUE FOR SHUTTING DOWN SPAWNERS
execute if entity @e[scores={MagmaCubeTotal=..18}] run tag @e remove MagmaCubeNear
execute if entity @e[tag=MainArenaAEC,tag=!MagmaCubeNear,scores={MagmaCubeTotal=19}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!MagmaCubeNear,scores={MagmaCubeTotal=19}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more magma cube to get!","color":"none"}]
execute if entity @e[scores={MagmaCubeTotal=19}] run tag @e[tag=MainArenaAEC] add MagmaCubeNear
execute if entity @e[scores={MagmaCubeTotal=20..}] run tag @e remove MagmaCubeNear

execute if entity @e[scores={MagmaCubeTotal=..19}] run tag @e remove MagmaCubeDone
execute if entity @e[tag=MainArenaAEC,tag=!MagmaCubeDone,scores={MagmaCubeTotal=20}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!MagmaCubeDone,scores={MagmaCubeTotal=20}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You did it! ","color":"none"},{"text":"20 magma cubes defeated","color":"gold"},{"text":"! Get that spawner!","color":"none"}]
execute if entity @e[scores={MagmaCubeTotal=20}] run tag @e[tag=MainArenaAEC] add MagmaCubeDone
execute if entity @e[scores={MagmaCubeTotal=21..}] run tag @e remove MagmaCubeDone

execute if entity @e[scores={WitchTotal=..18}] run tag @e remove WitchNear
execute if entity @e[tag=MainArenaAEC,tag=!WitchNear,scores={WitchTotal=19}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!WitchNear,scores={WitchTotal=19}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You got just one more witch left!","color":"none"}]
execute if entity @e[scores={WitchTotal=19}] run tag @e[tag=MainArenaAEC] add WitchNear
execute if entity @e[scores={WitchTotal=20..}] run tag @e remove WitchNear

execute if entity @e[scores={WitchTotal=..19}] run tag @e remove WitchDone
execute if entity @e[tag=MainArenaAEC,tag=!WitchDone,scores={WitchTotal=20}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!WitchDone,scores={WitchTotal=20}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Such skill! ","color":"none"},{"text":"20 witches down","color":"light_purple"},{"text":"! Take out that spawner!","color":"none"}]
execute if entity @e[scores={WitchTotal=20}] run tag @e[tag=MainArenaAEC] add WitchDone
execute if entity @e[scores={WitchTotal=21..}] run tag @e remove WitchDone

execute if entity @e[scores={StrayTotal=..18}] run tag @e remove StrayNear
execute if entity @e[tag=MainArenaAEC,tag=!StrayNear,scores={StrayTotal=19}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!StrayNear,scores={StrayTotal=19}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more strider left!","color":"none"}]
execute if entity @e[scores={StrayTotal=19}] run tag @e[tag=MainArenaAEC] add StrayNear
execute if entity @e[scores={StrayTotal=20..}] run tag @e remove StrayNear

execute if entity @e[scores={StrayTotal=..19}] run tag @e remove StrayDone
execute if entity @e[tag=MainArenaAEC,tag=!StrayDone,scores={StrayTotal=20}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!StrayDone,scores={StrayTotal=20}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Wow! ","color":"none"},{"text":"20 striders done like dinner","color":"gold"},{"text":"! Smash that spawner!","color":"none"}]
execute if entity @e[scores={StrayTotal=20}] run tag @e[tag=MainArenaAEC] add StrayDone
execute if entity @e[scores={StrayTotal=21..}] run tag @e remove StrayDone

#execute if entity @e[scores={CreeperTotal=..18}] run tag @e remove CreeperNear
#execute if entity @e[tag=MainArenaAEC,tag=!CreeperNear,scores={CreeperTotal=19}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
#execute if entity @e[tag=MainArenaAEC,tag=!CreeperNear,scores={CreeperTotal=19}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more creeper to go!","color":"none"}]
#execute if entity @e[scores={CreeperTotal=19}] run tag @e[tag=MainArenaAEC] add CreeperNear
#execute if entity @e[scores={CreeperTotal=20..}] run tag @e remove CreeperNear

#execute if entity @e[scores={CreeperTotal=..19}] run tag @e remove CreeperDone
#execute if entity @e[tag=MainArenaAEC,tag=!CreeperDone,scores={CreeperTotal=20}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
#execute if entity @e[tag=MainArenaAEC,tag=!CreeperDone,scores={CreeperTotal=20}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Boom! ","color":"none"},{"text":"20 creepers eliminated","color":"aqua"},{"text":"! Smash that spawner!","color":"none"}]
#execute if entity @e[scores={CreeperTotal=20}] run tag @e[tag=MainArenaAEC] add CreeperDone
#execute if entity @e[scores={CreeperTotal=21..}] run tag @e remove CreeperDone

execute if entity @e[scores={BabyZombieTotal=..18}] run tag @e remove BabyZombieNear
execute if entity @e[tag=MainArenaAEC,tag=!BabyZombieNear,scores={BabyZombieTotal=19}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!BabyZombieNear,scores={BabyZombieTotal=19}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You only need one more zombie jockey kill!","color":"none"}]
execute if entity @e[scores={BabyZombieTotal=19}] run tag @e[tag=MainArenaAEC] add BabyZombieNear
execute if entity @e[scores={BabyZombieTotal=20..}] run tag @e remove BabyZombieNear

execute if entity @e[scores={BabyZombieTotal=..19}] run tag @e remove BabyZombieDone
execute if entity @e[tag=MainArenaAEC,tag=!BabyZombieDone,scores={BabyZombieTotal=20}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!BabyZombieDone,scores={BabyZombieTotal=20}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You got it! ","color":"none"},{"text":"20 zombie jockeys gone","color":"gold"},{"text":"! Get in there and break that spawner!","color":"none"}]
execute if entity @e[scores={BabyZombieTotal=20}] run tag @e[tag=MainArenaAEC] add BabyZombieDone
execute if entity @e[scores={BabyZombieTotal=21..}] run tag @e remove BabyZombieDone


# SPAWNING CLOCKS
execute if block 37 67 1995 spawner{SpawnData:{id:"minecraft:magma_cube"}} run function d3:arena/spawn_magma_cubes
execute if block 37 67 2005 spawner{SpawnData:{id:"minecraft:witch"}} run function d3:arena/spawn_witches
execute if block -37 67 2005 spawner{SpawnData:{id:"minecraft:stray"}} run function d3:arena/spawn_striders
execute if block -37 67 1995 spawner{SpawnData:{id:"minecraft:zombie_horse"}} run function d3:arena/spawn_baby_zombies


# SPIDER DERP
#execute if block -37 67 2005 spawner run weather rain
#execute unless block -37 67 2005 spawner unless entity @e[tag=ArenaSpider,tag=ArenaAlcoveMob] unless entity @e[tag=ArenaCaveSpider,tag=ArenaAlcoveMob] run weather clear

# STRIDERS
execute if block -37 67 2005 spawner run weather rain
execute unless block -37 67 2005 spawner unless entity @e[tag=ArenaCaveSpider,tag=ArenaAlcoveMob] run weather clear

execute as @e[tag=ArenaCaveSpider] at @s store result entity @s Rotation[0] float 1 run data get entity @e[tag=ArenaStray,limit=1,sort=nearest] Rotation[0]
execute as @e[tag=ArenaCaveSpider] at @s store result entity @s Rotation[1] float 1 run data get entity @e[tag=ArenaStray,limit=1,sort=nearest] Rotation[1]
#tag @e[tag=ArenaSpider] remove Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~ ~ ~ air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~1 ~ ~ air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~-1 ~ ~ air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~ ~ ~1 air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~ ~ ~-1 air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~1 ~ ~1 air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~-1 ~ ~-1 air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~-1 ~ ~1 air run tag @s add Invulnerable
#execute as @e[tag=ArenaSpider] at @s unless block ~1 ~ ~-1 air run tag @s add Invulnerable

#execute as @e[tag=ArenaSpider,tag=Invulnerable] at @s unless entity @e[tag=ArenaStray,distance=..2] run tag @s remove Invulnerable
execute as @e[tag=ArenaCaveSpider] at @s unless entity @e[tag=ArenaStray,distance=..2] run kill @s

#execute as @e[tag=ArenaSpider,tag=Invulnerable,nbt=!{Invulnerable:1b}] run data merge entity @s {Invulnerable:1b}
#execute as @e[tag=ArenaSpider,tag=!Invulnerable,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=ArenaCaveSpider] as @e[tag=ArenaCaveSpider,nbt={OnGround:0b}] run data merge entity @s {Motion:[0.0d,-0.5d,0.0d]}


# ALCOVE 1 - SPAWNER DESTROY MECHANIC
execute if block 37 67 1995 spawner unless block 37 64 1995 redstone_block run setblock 37 64 1995 redstone_block
execute if block 37 67 1995 air run scoreboard objectives remove SpawnMagmaCube
execute if block 37 67 1995 air run playsound entity.puffer_fish.sting master @a 37 67 1995 3 0.5 0
#execute if block 37 67 1995 air run playsound entity.firework_rocket.twinkle master @a 37 67 1995 1 1 0
execute if block 37 67 1995 air run particle lava 37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block 37 67 1995 air run summon item 37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:2b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 1995 air run setblock 37 67 1995 structure_void
execute if block 37 67 1995 structure_void unless block 37 64 1995 clay run setblock 37 64 1995 clay

# ALCOVE 2 - SPAWNER DESTROY MECHANIC
execute if block 37 67 2005 spawner unless block 37 64 2005 redstone_block run setblock 37 64 2005 redstone_block
execute if block 37 67 2005 air run scoreboard objectives remove SpawnWitch
execute if block 37 67 2005 air run playsound entity.puffer_fish.sting master @a 37 67 2005 3 0.5 0
#execute if block 37 67 2005 air run playsound entity.firework_rocket.twinkle master @a 37 67 2005 1 1 0
execute if block 37 67 2005 air run particle lava 37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block 37 67 2005 air run summon item 37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:2b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 2005 air run setblock 37 67 2005 structure_void
execute if block 37 67 2005 structure_void unless block 37 64 2005 clay run setblock 37 64 2005 clay

# ALCOVE 3 - SPAWNER DESTROY MECHANIC
execute if block -37 67 2005 spawner unless block -37 64 2005 redstone_block run setblock -37 64 2005 redstone_block
execute if block -37 67 2005 air run scoreboard objectives remove SpawnStray
execute if block -37 67 2005 air run playsound entity.puffer_fish.sting master @a -37 67 2005 3 0.5 0
#execute if block -37 67 2005 air run playsound entity.firework_rocket.twinkle master @a -37 67 2005 1 1 0
execute if block -37 67 2005 air run particle lava -37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block -37 67 2005 air run summon item -37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:2b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 2005 air run setblock -37 67 2005 structure_void
execute if block -37 67 2005 structure_void unless block -37 64 2005 clay run setblock -37 64 2005 clay

# ALCOVE 4 - SPAWNER DESTROY MECHANIC
execute if block -37 67 1995 spawner unless block -37 64 1995 redstone_block run setblock -37 64 1995 redstone_block
execute if block -37 67 1995 air run scoreboard objectives remove SpawnBabyZombie
execute if block -37 67 1995 air run playsound entity.puffer_fish.sting master @a -37 67 1995 3 0.5 0
#execute if block -37 67 1995 air run playsound entity.firework_rocket.twinkle master @a -37 67 1995 1 1 0
execute if block -37 67 1995 air run particle lava -37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block -37 67 1995 air run summon item -37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:2b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 1995 air run setblock -37 67 1995 structure_void
execute if block -37 67 1995 structure_void unless block -37 64 1995 clay run setblock -37 64 1995 clay


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void if entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=2,ArenaTimer=1100}] ArenaTimer 1101
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1500}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Time to clean up those last remaining enemies!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=1500}] run effect give @e[tag=ArenaAlcoveMob] glowing 1000000 255 true


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void unless entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=2,ArenaTimer=1100..2000}] ArenaTimer 2001
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2021..2049}] if entity @e[type=magma_cube,tag=!ArenaStatue] run effect give @e[tag=ArenaAlcoveMob] glowing 1000000 255 true
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2021..2049}] if entity @e[type=magma_cube,tag=!ArenaStatue] run effect give @e[type=magma_cube,tag=!ArenaStatue] glowing 1000000 255 true
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2021..2049}] if entity @e[type=magma_cube,tag=!ArenaStatue] run scoreboard players set @e[scores={ArenaRound=2,ArenaTimer=2001..2049}] ArenaTimer 2001
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run scoreboard objectives remove SpawnMagmaCube
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run scoreboard objectives remove SpawnWitch
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run scoreboard objectives remove SpawnCreeper
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run scoreboard objectives remove SpawnBabyZombie

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run function d3:arena/adam_stands
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2050}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Another round complete! But you know what comes next!","color":"none","bold":false,"underlined":false}]
#execute if entity @e[scores={ArenaRound=2,ArenaTimer=2120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Not by a long shot!","color":"none","bold":false,"underlined":false}]


# CLOSES GATES AFTER ALL MOBS AND SPAWNERS DESTROYED
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2120..}] if block 27 67 1988 air if block 27 67 2012 air if block -27 67 2012 air if block -27 67 1988 air unless entity @a[tag=InAlcove] run scoreboard objectives add GatesUp dummy

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2200}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2200}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Ladies and Gentlemen! We're upping the ante!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2200}] run kill @e[tag=ArenaBoss2]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2200}] run summon husk 0 64 2029 {CustomName:"{\"text\":\"Gabe the Cyclops\",\"color\":\"yellow\"}",CustomNameVisible:false,Health:130f,Attributes:[{Name:generic.maxHealth,Base:130.0},{Name:"generic.followRange",Base:40.0d},{Name:"generic.movementSpeed",Base:0.27d}],NoAI:1b,HandItems:[{id:"minecraft:golden_hoe",Count:1b},{id:"minecraft:golden_hoe",Count:1b}],Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[180f,0f],Team:ArenaBoss,Tags:["ArenaMob","ArenaBoss","ArenaBoss2"],Passengers:[{id:"minecraft:armor_stand",Marker:1b,Small:1b,Invisible:1b,Tags:["ArenaBoss2","ArenaBoss2AS"],Passengers:[{id:"minecraft:guardian",CustomName:"{\"text\":\"Gabe the Cyclops\",\"color\":\"yellow\"}",CustomNameVisible:false,Health:130f,Attributes:[{Name:generic.maxHealth,Base:130.0},{Name:"generic.followRange",Base:40.0d},{Name:"generic.attackDamage",Base:3.0d},{Name:"generic.movementSpeed",Base:0.3d}],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[180f,0f],Team:ArenaBoss,Tags:["ArenaMob","ArenaBoss","ArenaBoss2"]}]}]}



execute if entity @e[scores={ArenaRound=2,ArenaTimer=..2529}] run fill -1 63 2027 1 63 2027 sandstone
execute if entity @e[scores={ArenaRound=2,ArenaTimer=..2529}] run fill -1 64 2027 1 66 2027 sand

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2310}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2310}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"You all remember him as the speedy, pizza-eatin', video game-lovin' son of qmagnet...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2430}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2440}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"But we've turned him into...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2350}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"GABE THE CYYYYCLOPS!!!!!!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run fill -1 61 2027 1 63 2027 air


# ARENA BOSS 2
#execute if entity @e[tag=ArenaBoss2] unless entity @e[tag=ArenaBoss2AS] at @e[tag=ArenaBoss2,type=husk] run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerble:1b,NoGravity:true,Small:1b,Tags:["ArenaBoss2AS"]}
#execute if entity @e[tag=ArenaBoss2] as @e[tag=ArenaBoss2AS] at @e[tag=ArenaBoss2,type=husk] run teleport @s ~ ~ ~

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540}] as @e[tag=ArenaBoss2] run data merge entity @s {NoAI:0b,Silent:0b}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540}] as @e[tag=ArenaBoss2,type=husk] run data merge entity @s {Motion:[0.0d,0.0d,-1.0d]}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540}] at @e[tag=ArenaBoss2,type=husk] run playsound entity.husk.converted_to_zombie hostile @a ~ ~ ~ 2 1 0
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540}] at @e[tag=ArenaBoss2,type=husk] run playsound entity.guardian.ambient_land hostile @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540}] at @e[tag=ArenaBoss2,type=husk] run playsound entity.elder_guardian.curse hostile @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2580}] as @e[tag=ArenaBoss2] run data merge entity @s {Invulnerable:0b}


execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run title @a times 20 160 20
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run title @a title {"text":"Gabe the Cyclops","bold":false,"color":"yellow"}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run title @a subtitle {"text":"✸ He Loves Pizza, Video Games, and Killing You ✸", "color":"white"}

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run bossbar add arenaboss2 {"text":"Gabe the Cyclops","color":"yellow","bold":"true"}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run bossbar set arenaboss2 color yellow
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run bossbar set arenaboss2 style progress
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530}] run bossbar set arenaboss2 max 130
execute if entity @e[scores={ArenaRound=2,ArenaTimer=2530..3019}] run bossbar set arenaboss2 players @a
#execute store result bossbar arenaboss2 value run data get entity @e[tag=ArenaBoss2,limit=1,type=husk] Health

scoreboard objectives add Boss2Health dummy
execute store result score @e[tag=ArenaBoss2,type=husk] Boss2Health run data get entity @e[tag=ArenaBoss2,type=husk,limit=1] Health 1
execute store result score @e[tag=ArenaBoss2,type=guardian] Boss2Health run data get entity @e[tag=ArenaBoss2,type=guardian,limit=1] Health 1
scoreboard players operation @e[tag=ArenaBoss2,type=husk] Boss2Health < @e[tag=ArenaBoss2,type=guardian] Boss2Health
scoreboard players operation @e[tag=ArenaBoss2,type=guardian] Boss2Health < @e[tag=ArenaBoss2,type=husk] Boss2Health
execute store result entity @e[tag=ArenaBoss2,type=husk,limit=1] Health float 1 run scoreboard players get @e[tag=ArenaBoss2,type=husk,limit=1] Boss2Health
execute store result entity @e[tag=ArenaBoss2,type=guardian,limit=1] Health float 1 run scoreboard players get @e[tag=ArenaBoss2,type=guardian,limit=1] Boss2Health
execute store result bossbar arenaboss2 value run scoreboard players get @e[tag=ArenaBoss2,type=guardian,limit=1] Boss2Health




#execute if entity @e[tag=ArenaBoss2,type=husk,nbt={HurtTime:10s}] store result entity @e[tag=ArenaBoss2,type=guardian,limit=1] Health float 1 run data get entity @e[tag=ArenaBoss2,type=husk,limit=1] Health 1
#execute if entity @e[tag=ArenaBoss2,type=guardian,nbt={HurtTime:10s}] store result entity @e[tag=ArenaBoss2,type=husk,limit=1] Health float 1 run data get entity @e[tag=ArenaBoss2,type=guardian,limit=1] Health 1
#execute if entity @e[tag=ArenaBoss2,type=husk] as @e[tag=ArenaBoss2,type=guardian] at @e[tag=ArenaBoss2,type=husk] run teleport @s ~ ~ ~ ~ 0
execute if entity @e[tag=ArenaBoss2,type=husk] store result entity @e[tag=ArenaBoss2AS,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss2,type=husk,limit=1] Rotation[0]
execute if entity @e[tag=ArenaBoss2,type=husk] store result entity @e[tag=ArenaBoss2,type=guardian,limit=1] Rotation[0] float 1 run data get entity @e[tag=ArenaBoss2AS,limit=1] Rotation[0]
execute if entity @e[tag=ArenaBoss2,type=husk] store result entity @e[tag=ArenaBoss2,type=guardian,limit=1] Rotation[1] float 1 run data get entity @e[tag=ArenaBoss2AS,limit=1] Rotation[1]

execute unless entity @e[tag=ArenaBoss2,type=husk] run kill @e[tag=ArenaBoss2,type=!armor_stand]
execute unless entity @e[tag=ArenaBoss2,type=guardian] run kill @e[tag=ArenaBoss2,type=!armor_stand]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2540..}] if entity @e[tag=ArenaBoss2] run function d3:arena/boss_2_attack

execute if entity @e[scores={ArenaRound=2,ArenaTimer=2600}] run function d3:arena/adam_sits


# KILL BOSS
execute if block 0 72 2023 quartz_stairs unless entity @e[tag=ArenaBoss2,type=!armor_stand] if entity @e[tag=ArenaBoss2AS] run scoreboard players set @e[scores={ArenaTimer=2600..3000}] ArenaTimer 3001
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3001..}] if entity @e[tag=ArenaBoss2,type=!armor_stand] run scoreboard players set @e[scores={ArenaTimer=3001..}] ArenaTimer 2999

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002}] at @e[tag=ArenaBoss2AS] run summon firework_rocket ~ ~ ~ {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:1b,Explosions:[{Type:2b,Trail:1,Flicker:1,Colors:[I;14602026]}]}}},Life:0}
#execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss2AS] run particle falling_dust yellow_terracotta ~ ~0.5 ~ 0.2 0.2 0.2 1 30 force @a
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss2AS] run particle cloud ~ ~0.5 ~ 0.2 0.2 0.2 0 30 force @a
#execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002}] at @e[tag=ArenaBoss2AS] run playsound entity.husk.converted_to_zombie master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002}] at @e[tag=ArenaBoss2AS] run playsound entity.elder_guardian.death ambient @a ~ ~ ~ 1 1 0
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002}] at @e[tag=ArenaBoss2AS] run playsound entity.iron_golem.death ambient @a ~ ~ ~ 0.5 0.5 0
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002..3020}] at @e[tag=ArenaBoss2AS] run playsound entity.snow_golem.death master @a ~ ~ ~ 0.5 0.5 0.5

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3002}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3003}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3004}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3005}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3006}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3007}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3008}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3009}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3010}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3011}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3012}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3013}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3014}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3015}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3016}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3017}] at @e[tag=ArenaBoss2AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020}] run kill @e[tag=ArenaBoss2AS]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020..}] run scoreboard objectives remove Boss2Attack
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020..}] run scoreboard objectives remove Boss2Defense
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020..}] run scoreboard objectives remove ArenaBoss2Regen
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020..}] run bossbar remove minecraft:arenaboss2

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3020}] run setblock 11 3 78 gold_block

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3040..3299}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3040}] run function d3:arena/adam_stands
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3040}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3040}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"And Gabe the Cyclops has taken a dirt nap!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3120}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Amazing! You've advanced once again!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Go rest and purchase upgrades as we set up for the next round.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3300}] run function d3:arena/adam_sits

# SWITCH TO NEXT ROUND
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220..3500}] unless entity @a[tag=ArenaZone] run scoreboard players set @e[scores={ArenaRound=2,ArenaTimer=3500}] ArenaTimer 3501

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] unless block 0 62 2000 red_nether_bricks run setblock -29 4 1971 redstone_block
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block -29 4 1971 redstone_block run setblock -30 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_3a",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block -30 57 1971 structure_block run setblock -29 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] unless block 1 62 2000 red_nether_bricks run setblock 2 4 1971 redstone_block
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block 2 4 1971 redstone_block run setblock 1 57 1971 structure_block[mode=load]{name:"minecraft:arena_stage_3b",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:30,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block 1 57 1971 structure_block run setblock 2 57 1971 redstone_block

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] unless block 0 62 2001 red_nether_bricks run setblock -29 4 2001 redstone_block
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block -29 4 2001 redstone_block run setblock -30 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_3c",author:"qmagnet",mode:"LOAD",sizeX:31,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block -30 57 2001 structure_block run setblock -29 57 2001 redstone_block

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] unless block 1 62 2001 red_nether_bricks run setblock 2 4 2001 redstone_block
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block 2 4 2001 redstone_block run setblock 1 57 2001 structure_block[mode=load]{name:"minecraft:arena_stage_3d",author:"qmagnet",mode:"LOAD",sizeX:30,sizeY:12,sizeZ:29,mirror:"NONE",rotation:"NONE",posX:0,posY:1,posZ:0,ignoreEntities:1b,powered:0b,showboundingbox:0b}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] if block 1 57 2001 structure_block run setblock 2 57 2001 redstone_block


