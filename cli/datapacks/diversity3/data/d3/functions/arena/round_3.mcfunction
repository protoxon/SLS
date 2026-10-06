####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 10 2018 / MARCH 27 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=0..750}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=1000..1099}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=1101..1999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=2001..2999}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=3001..3499}] ArenaTimer 1
scoreboard players add @e[scores={ArenaRound=3,ArenaTimer=3501..3999}] ArenaTimer 1

difficulty easy

# SETUP
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1..750}] run function d3:arena/round_setup
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1..750}] run function d3:arena/gates_closed


# TRAPS
#tag @e remove R3TrapA
#execute align x align y align z run tag @a[x=-16,y=60,z=1993,dx=2,dy=2,dz=2] add R3TrapA
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=-16,y=60,z=1993,dx=2,dy=2,dz=2] add R3TrapA
#execute if entity @e[tag=R3TrapA] run fill -16 60 1993 -14 60 1995 fire replace air
#execute unless entity @e[tag=R3TrapA] run fill -16 60 1993 -14 60 1995 air replace fire

#tag @e remove R3TrapB
#execute align x align y align z run tag @a[x=-12,y=60,z=2009,dx=2,dy=2,dz=2] add R3TrapB
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=-12,y=60,z=2009,dx=2,dy=2,dz=2] add R3TrapB
#execute if entity @e[tag=R3TrapB] run fill -12 60 2009 -10 60 2011 fire replace air
#execute unless entity @e[tag=R3TrapB] run fill -12 60 2009 -10 60 2011 air replace fire

#tag @e remove R3TrapC
#execute align x align y align z run tag @a[x=14,y=60,z=1993,dx=2,dy=2,dz=2] add R3TrapC
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=14,y=60,z=1993,dx=2,dy=2,dz=2] add R3TrapC
#execute if entity @e[tag=R3TrapC] run fill 14 60 1993 16 60 1995 fire replace air
#execute unless entity @e[tag=R3TrapC] run fill 14 60 1993 16 60 1995 air replace fire

#tag @e remove R3TrapD
#execute align x align y align z run tag @a[x=14,y=61,z=2010,dx=2,dy=2,dz=2] add R3TrapD
#execute align x align y align z run tag @e[tag=ArenaAlcoveMob,x=14,y=61,z=2010,dx=2,dy=2,dz=2] add R3TrapD
#execute if entity @e[tag=R3TrapD] run fill 14 61 2010 16 61 2012 fire replace air
#execute unless entity @e[tag=R3TrapD] run fill 14 61 2010 16 61 2012 air replace fire


# DIALOGUE
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1}] run function d3:arena/adam_sits

execute if entity @e[scores={ArenaRound=3,ArenaTimer=10}] run function d3:arena/adam_stands

execute if entity @e[scores={ArenaRound=3,ArenaTimer=30}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=3,ArenaTimer=30}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Are you sure you're ready?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=100}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=3,ArenaTimer=100..1029}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=3,ArenaTimer=130}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"This one is gonna be tough.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=220}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=3,ArenaTimer=230}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"25 kills of each foe will be required to get to the spawners.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=350}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=3,ArenaTimer=360}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Good luck!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=410}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=3,ArenaTimer=420}] run kill @e[tag=Round3Squid]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=420}] run summon squid 0 150 2000 {Invulnerable:true,Air:32767s,Health:5f,PersistenceRequired:1b,Attributes:[{Name:"generic.maxHealth",Base:5.0d}],Tags:["ArenaMob","RoundSquid","Round3Squid"]}


# ROUND BEGINS
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run function d3:arena/adam_sits
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run teleport @e[tag=ArenaAdam] 0 72.6 2024.5 180 0

execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run title @a times 20 210 20
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run title @a title {"text":"ROUND 3","bold":false,"color":"yellow"}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run title @a subtitle {"text":"- The Map Maker's A Jerk -", "color":"white"}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1030}] run scoreboard objectives add GatesDown dummy


# ACCESS SPAWNERS
execute if entity @e[scores={ArenaRound=3,PillagerTotal=25..}] unless block 36 64 1988 redstone_block run setblock 36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=3,PillagerTotal=25..}] unless block 36 64 1989 redstone_block run setblock 36 64 1989 redstone_block
execute if entity @e[scores={ArenaRound=3,VindicatorTotal=25..}] unless block 36 64 2011 redstone_block run setblock 36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=3,VindicatorTotal=25..}] unless block 36 64 2012 redstone_block run setblock 36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=3,EvokerTotal=25..}] unless block -36 64 2011 redstone_block run setblock -36 64 2011 redstone_block
execute if entity @e[scores={ArenaRound=3,EvokerTotal=25..}] unless block -36 64 2012 redstone_block run setblock -36 64 2012 redstone_block
execute if entity @e[scores={ArenaRound=3,WSkeletonTotal=25..}] unless block -36 64 1988 redstone_block run setblock -36 64 1988 redstone_block
execute if entity @e[scores={ArenaRound=3,WSkeletonTotal=25..}] unless block -36 64 1989 redstone_block run setblock -36 64 1989 redstone_block


# DIALOGUE FOR SHUTTING DOWN SPAWNERS
#execute if entity @e[scores={StrayTotal=..23}] run tag @e remove StrayNear
#execute if entity @e[tag=MainArenaAEC,tag=!StrayNear,scores={StrayTotal=24}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
#execute if entity @e[tag=MainArenaAEC,tag=!StrayNear,scores={StrayTotal=24}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more strayder left!","color":"none"}]
#execute if entity @e[scores={StrayTotal=24}] run tag @e[tag=MainArenaAEC] add StrayNear
#execute if entity @e[scores={StrayTotal=25..}] run tag @e remove StrayNear

#execute if entity @e[scores={StrayTotal=..24}] run tag @e remove StrayDone
#execute if entity @e[tag=MainArenaAEC,tag=!StrayDone,scores={StrayTotal=25}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
#execute if entity @e[tag=MainArenaAEC,tag=!StrayDone,scores={StrayTotal=25}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Wow! ","color":"none"},{"text":"25 strayders cut down","color":"gold"},{"text":"! Break that spawner!","color":"none"}]
#execute if entity @e[scores={StrayTotal=25}] run tag @e[tag=MainArenaAEC] add StrayDone
#execute if entity @e[scores={StrayTotal=26..}] run tag @e remove StrayDone

execute if entity @e[scores={PillagerTotal=..23}] run tag @e remove PillagerNear
execute if entity @e[tag=MainArenaAEC,tag=!PillagerNear,scores={PillagerTotal=24}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!PillagerNear,scores={PillagerTotal=24}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"One more pillager left!","color":"none"}]
execute if entity @e[scores={PillagerTotal=24}] run tag @e[tag=MainArenaAEC] add PillagerNear
execute if entity @e[scores={PillagerTotal=25..}] run tag @e remove PillagerNear

execute if entity @e[scores={PillagerTotal=..24}] run tag @e remove PillagerDone
execute if entity @e[tag=MainArenaAEC,tag=!PillagerDone,scores={PillagerTotal=25}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!PillagerDone,scores={PillagerTotal=25}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Wow! ","color":"none"},{"text":"25 pillagers cut down","color":"gold"},{"text":"! Break that spawner!","color":"none"}]
execute if entity @e[scores={PillagerTotal=25}] run tag @e[tag=MainArenaAEC] add PillagerDone
execute if entity @e[scores={PillagerTotal=26..}] run tag @e remove PillagerDone

execute if entity @e[scores={VindicatorTotal=..23}] run tag @e remove VindicatorNear
execute if entity @e[tag=MainArenaAEC,tag=!VindicatorNear,scores={VindicatorTotal=24}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!VindicatorNear,scores={VindicatorTotal=24}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You only need one more vindicator kill!","color":"none"}]
execute if entity @e[scores={VindicatorTotal=24}] run tag @e[tag=MainArenaAEC] add VindicatorNear
execute if entity @e[scores={VindicatorTotal=25..}] run tag @e remove VindicatorNear

execute if entity @e[scores={VindicatorTotal=..24}] run tag @e remove VindicatorDone
execute if entity @e[tag=MainArenaAEC,tag=!VindicatorDone,scores={VindicatorTotal=25}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!VindicatorDone,scores={VindicatorTotal=25}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Got it! ","color":"none"},{"text":"25 vindicators put to rest","color":"light_purple"},{"text":"! Now bust that spawner and stop em for good!","color":"none"}]
execute if entity @e[scores={VindicatorTotal=25}] run tag @e[tag=MainArenaAEC] add VindicatorDone
execute if entity @e[scores={VindicatorTotal=26..}] run tag @e remove VindicatorDone

execute if entity @e[scores={EvokerTotal=..23}] run tag @e remove EvokerNear
execute if entity @e[tag=MainArenaAEC,tag=!EvokerNear,scores={EvokerTotal=24}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!EvokerNear,scores={EvokerTotal=24}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Come on! Get that last evoker!","color":"none"}]
execute if entity @e[scores={EvokerTotal=24}] run tag @e[tag=MainArenaAEC] add EvokerNear
execute if entity @e[scores={EvokerTotal=25..}] run tag @e remove EvokerNear

execute if entity @e[scores={EvokerTotal=..24}] run tag @e remove EvokerDone
execute if entity @e[tag=MainArenaAEC,tag=!EvokerDone,scores={EvokerTotal=25}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!EvokerDone,scores={EvokerTotal=25}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"25 evokers crushed","color":"aqua"},{"text":"! Now get to that spawner!","color":"none"}]
execute if entity @e[scores={EvokerTotal=25}] run tag @e[tag=MainArenaAEC] add EvokerDone
execute if entity @e[scores={EvokerTotal=26..}] run tag @e remove EvokerDone

execute if entity @e[scores={WSkeletonTotal=..23}] run tag @e remove WSkeletonNear
execute if entity @e[tag=MainArenaAEC,tag=!WSkeletonNear,scores={WSkeletonTotal=24}] at @a run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1 1
execute if entity @e[tag=MainArenaAEC,tag=!WSkeletonNear,scores={WSkeletonTotal=24}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"You only need one more wither skragon kill!","color":"none"}]
execute if entity @e[scores={WSkeletonTotal=24}] run tag @e[tag=MainArenaAEC] add WSkeletonNear
execute if entity @e[scores={WSkeletonTotal=25..}] run tag @e remove WSkeletonNear

execute if entity @e[scores={WSkeletonTotal=..24}] run tag @e remove WSkeletonDone
execute if entity @e[tag=MainArenaAEC,tag=!WSkeletonDone,scores={WSkeletonTotal=25}] at @a run playsound block.beacon.power_select master @a ~ ~ ~ 1 1.3 1
execute if entity @e[tag=MainArenaAEC,tag=!WSkeletonDone,scores={WSkeletonTotal=25}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow"},{"text":"Finally! ","color":"none"},{"text":"25 wither skragons are dust","color":"gold"},{"text":"! Get rid of that spawner!","color":"none"}]
execute if entity @e[scores={WSkeletonTotal=25}] run tag @e[tag=MainArenaAEC] add WSkeletonDone
execute if entity @e[scores={WSkeletonTotal=26..}] run tag @e remove WSkeletonDone


# SPAWNING CLOCKS
execute if block 37 67 1995 spawner{SpawnData:{id:"minecraft:pillager"}} run function d3:arena/spawn_pillagers
execute if block 37 67 2005 spawner{SpawnData:{id:"minecraft:vindicator"}} run function d3:arena/spawn_vindicators
execute if block -37 67 2005 spawner{SpawnData:{id:"minecraft:evoker"}} run function d3:arena/spawn_evokers
execute if block -37 67 1995 spawner{SpawnData:{id:"minecraft:wither_skeleton"}} run function d3:arena/spawn_wither_skeletons



# ALCOVE 1 - SPAWNER DESTROY MECHANIC
execute if block 37 67 1995 spawner unless block 37 64 1995 redstone_block run setblock 37 64 1995 redstone_block
execute if block 37 67 1995 air run scoreboard objectives remove SpawnStray
execute if block 37 67 1995 air run playsound entity.puffer_fish.sting master @a 37 67 1995 3 0.5 0
#execute if block 37 67 1995 air run playsound entity.firework_rocket.twinkle master @a 37 67 1995 1 1 0
execute if block 37 67 1995 air run particle lava 37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block 37 67 1995 air run summon item 37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:3b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 1995 air run setblock 37 67 1995 structure_void
execute if block 37 67 1995 structure_void unless block 37 64 1995 clay run setblock 37 64 1995 clay

# ALCOVE 2 - SPAWNER DESTROY MECHANIC
execute if block 37 67 2005 spawner unless block 37 64 2005 redstone_block run setblock 37 64 2005 redstone_block
execute if block 37 67 2005 air run scoreboard objectives remove SpawnVindicator
execute if block 37 67 2005 air run playsound entity.puffer_fish.sting master @a 37 67 2005 3 0.5 0
#execute if block 37 67 2005 air run playsound entity.firework_rocket.twinkle master @a 37 67 2005 1 1 0
execute if block 37 67 2005 air run particle lava 37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block 37 67 2005 air run summon item 37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:3b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block 37 67 2005 air run setblock 37 67 2005 structure_void
execute if block 37 67 2005 structure_void unless block 37 64 2005 clay run setblock 37 64 2005 clay

# ALCOVE 3 - SPAWNER DESTROY MECHANIC
execute if block -37 67 2005 spawner unless block -37 64 2005 redstone_block run setblock -37 64 2005 redstone_block
execute if block -37 67 2005 air run scoreboard objectives remove SpawnEvoker
execute if block -37 67 2005 structure_void run kill @e[type=vex]
execute if block -37 67 2005 structure_void run kill @e[type=chicken]
execute if block -37 67 2005 air run playsound entity.puffer_fish.sting master @a -37 67 2005 3 0.5 0
#execute if block -37 67 2005 air run playsound entity.firework_rocket.twinkle master @a -37 67 2005 1 1 0
execute if block -37 67 2005 air run particle lava -37 67.5 2005 0.1 0.1 0.1 1 50 force
execute if block -37 67 2005 air run summon item -37 67 2005 {Item:{id:"minecraft:gold_ingot",Count:3b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 2005 air run setblock -37 67 2005 structure_void
execute if block -37 67 2005 structure_void unless block -37 64 2005 clay run setblock -37 64 2005 clay

# ALCOVE 4 - SPAWNER DESTROY MECHANIC
execute if block -37 67 1995 spawner unless block -37 64 1995 redstone_block run setblock -37 64 1995 redstone_block
execute if block -37 67 1995 air run scoreboard objectives remove SpawnWSkeleton
execute if block -37 67 1995 air run playsound entity.puffer_fish.sting master @a -37 67 1995 3 0.5 0
#execute if block -37 67 1995 air run playsound entity.firework_rocket.twinkle master @a -37 67 1995 1 1 0
execute if block -37 67 1995 air run particle lava -37 67.5 1995 0.1 0.1 0.1 1 50 force
execute if block -37 67 1995 air run summon item -37 67 1995 {Item:{id:"minecraft:gold_ingot",Count:3b},Motion:[0.0d,0.4d,0.0d],PickupDelay:20,Age:-32768}
execute if block -37 67 1995 air run setblock -37 67 1995 structure_void
execute if block -37 67 1995 structure_void unless block -37 64 1995 clay run setblock -37 64 1995 clay


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void if entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=3,ArenaTimer=1100}] ArenaTimer 1101
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1500}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Time to clean up those last remaining enemies!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=1500}] run effect give @e[tag=ArenaAlcoveMob] glowing 1000000 255 true


# ALL SPAWNERS DESTROYED BUT MOBS LEFT
execute if block 37 67 1995 structure_void if block 37 67 2005 structure_void if block -37 67 2005 structure_void if block -37 67 1995 structure_void unless entity @e[tag=ArenaAlcoveMob] run scoreboard players set @e[scores={ArenaRound=3,ArenaTimer=1100..2000}] ArenaTimer 2001
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run scoreboard objectives remove SpawnStray
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run scoreboard objectives remove SpawnVindicator
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run scoreboard objectives remove SpawnEvoker
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run scoreboard objectives remove SpawnWSkeleton

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run function d3:arena/adam_stands
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2050}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Wow! You've managed to defeat everything we have.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Well almost everything...","color":"none","bold":false,"underlined":false}]


# CLOSES GATES AFTER ALL MOBS AND SPAWNERS DESTROYED
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2120..}] if block 27 67 1988 air if block 27 67 2012 air if block -27 67 2012 air if block -27 67 1988 air unless entity @a[tag=InAlcove] run scoreboard objectives add GatesUp dummy

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2200}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2200}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"It's time for the main event!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2200}] run kill @e[tag=ArenaBoss3]


execute if entity @e[scores={ArenaRound=3,ArenaTimer=2310}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2310}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"You all know her as the highly intelligent, beautiful first born daughter of qmagnet...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2430}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2440}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"But now she's become...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2480}] run playsound entity.lightning_bolt.thunder master @a 0 80 2000 2 1 1

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2530}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"ILLUUUUUUUUSIONEIGE!!!!!!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2520}] run summon lightning_bolt 0 63 2000

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2522}] run setblock 1 3 78 clay
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2522}] run setblock 1 5 78 clay

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2522}] run summon illusioner 0 63 2000 {UUIDLeast:-8179306182053875199L,UUIDMost:7400018596725410671L,CustomName:"{\"text\":\"IllusioNeige\",\"color\":\"yellow\"}",CustomNameVisible:false,Health:100f,HandItems:[{id:"minecraft:bow",Count:1b}],Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.followRange",Base:40.0d},{Name:"generic.movementSpeed",Base:0.7d},{Name:"generic.attackDamage",Base:6.0d}],NoAI:0b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[0f,20f],Team:ArenaBoss,Tags:["ArenaMob","ArenaBoss","ArenaBoss3"]}

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2522..2600}] as @e[tag=ArenaBoss3] run data merge entity @s {Fire:-20s}


# ARENA BOSS 3
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550..}] if entity @e[tag=ArenaBoss3] run function d3:arena/boss_3_attack

execute if entity @e[tag=ArenaBoss3] unless entity @e[tag=ArenaBoss3AS] at @e[tag=ArenaBoss3] run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerble:1b,NoGravity:true,Small:1b,Tags:["ArenaBoss3AS"]}
execute if entity @e[tag=ArenaBoss3] as @e[tag=ArenaBoss3AS] at @e[tag=ArenaBoss3] run teleport @s ~ ~ ~

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2560}] as @e[tag=ArenaBoss3] run data merge entity @s {NoAI:0b,Invulnerable:0b,Silent:0b}
#execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] as @e[tag=ArenaBoss3] run data merge entity @s {Motion:[0.0d,0.0d,-1.0d]}
#execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] at @e[tag=ArenaBoss3] run playsound entity.husk.converted_to_zombie hostile @a ~ ~ ~ 1 1 0
#execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] at @e[tag=ArenaBoss3] run playsound entity.guardian.ambient_land hostile @a ~ ~ ~ 1 0.5 1

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run title @a times 20 160 20
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run title @a title {"text":"IllusioNeige","bold":false,"color":"yellow"}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run title @a subtitle {"text":"✸ Prounounce Her Name Wrong, You Die ✸", "color":"white"}

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run bossbar add arenaboss3 {"text":"IllusioNeige","color":"yellow","bold":"true"}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run bossbar set arenaboss3 color yellow
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run bossbar set arenaboss3 style progress
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550}] run bossbar set arenaboss3 max 100
execute if entity @e[scores={ArenaRound=3,ArenaTimer=2550..3019}] run bossbar set arenaboss3 players @a
execute store result bossbar arenaboss3 value run data get entity @e[tag=ArenaBoss3,limit=1] Health

execute if entity @e[scores={ArenaRound=3,ArenaTimer=2600}] run function d3:arena/adam_sits



# KILL BOSS
execute if block 0 72 2023 quartz_stairs unless entity @e[tag=ArenaBoss3] if entity @e[tag=ArenaBoss3AS] run scoreboard players set @e[scores={ArenaTimer=2600..3000}] ArenaTimer 3001
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3001..}] if entity @e[tag=ArenaBoss3] run scoreboard players set @e[scores={ArenaTimer=3001..}] ArenaTimer 2999

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002}] at @e[tag=ArenaBoss3AS] run summon firework_rocket ~ ~ ~ {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:1b,Explosions:[{Type:2b,Trail:1,Flicker:1,Colors:[I;14602026]}]}}},Life:0}
#execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss3AS] run particle falling_dust yellow_terracotta ~ ~0.5 ~ 0.2 0.2 0.2 1 30 force @a
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002..3005}] at @e[tag=ArenaBoss3AS] run particle cloud ~ ~0.5 ~ 0.2 0.2 0.2 0 30 force @a
#execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002}] at @e[tag=ArenaBoss3AS] run playsound entity.husk.converted_to_zombie master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002}] at @e[tag=ArenaBoss3AS] run playsound entity.elder_guardian.death ambient @a ~ ~ ~ 1 1 0
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002}] at @e[tag=ArenaBoss3AS] run playsound entity.iron_golem.death ambient @a ~ ~ ~ 0.5 0.5 0
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002..3020}] at @e[tag=ArenaBoss3AS] run playsound entity.snow_golem.death master @a ~ ~ ~ 0.5 0.5 0.5

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3002}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3003}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3004}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3005}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3006}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3007}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3008}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3009}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3010}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3011}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3012}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3013}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3014}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3015}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3016}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3017}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3018}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3019}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3021}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3022}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[0.0d,0.2d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3023}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,-0.1d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3024}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.2d,0.0d],PickupDelay:20,Age:-32768}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3025}] at @e[tag=ArenaBoss3AS] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:2b},Motion:[-0.1d,0.1d,0.1d],PickupDelay:20,Age:-32768}

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020}] run kill @e[tag=ArenaBoss3AS]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020..}] run scoreboard objectives remove Boss3Attack
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020..}] run scoreboard objectives remove Boss3Health
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020..}] run scoreboard objectives remove ArenaBoss3Regen
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020..}] run bossbar remove minecraft:arenaboss3

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020}] run setblock 11 5 78 gold_block
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3020..}] run kill @e[tag=ArenaEndermite]


execute if entity @e[scores={ArenaRound=3,ArenaTimer=3040..}] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3040}] run function d3:arena/adam_stands

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3040}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Unbelievable! IllusioNeige has been defeated!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3120}] run function d3:arena/adam_points
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3120}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"You've done it!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3220}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"You've become our champion!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3320}] run function d3:arena/adam_arms_out
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3320}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Open the upper gate!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3380}] run function d3:arena/adam_arms_down
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3380}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Champion, come see me up here and claim your prize.","color":"none","bold":false,"underlined":false}]



# SWITCH TO WIN
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3260..}] unless block 0 75 1961 air run scoreboard objectives add WinGateDown dummy
scoreboard players add @e[tag=MainArenaAEC] WinGateDown 0
execute if entity @e[scores={WinGateDown=0..}] run function d3:arena/gate_down_win


execute if entity @e[scores={ArenaRound=3,ArenaTimer=3500}] align x align y align z if entity @a[x=-2,y=72,z=2021,dx=4,dy=4,dz=6] run scoreboard players set @e[scores={ArenaRound=3,ArenaTimer=3500}] ArenaTimer 3501



# WIN
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3502}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Congratulations.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3560}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"You've completed the Arena.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3650}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"And become our new champion!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3750}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Here is your prize. Go forth in victory!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,ArenaTimer=3750}] run playsound block.wool.step master @a 0 72 2023 0.5 1 0
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3750..}] as @e[tag=ArenaAdam] run data merge entity @s {HandItems:[{id:"minecraft:yellow_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,-20f,10f]}}



# COMPLETE BRANCH
tag @a remove HasYellowWool
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3750..}] run tag @a[nbt={Inventory:[{id:"minecraft:yellow_wool"}]}] add HasYellowWool
execute if entity @a[tag=HasYellowWool] run clear @a
replaceitem entity @a[tag=HasYellowWool] weapon.mainhand yellow_wool
execute if entity @a[tag=HasYellowWool] run setblock 14 2 78 clay
execute if entity @a[tag=HasYellowWool] run kill @e[tag=ArenaAdam]
execute if entity @a[tag=HasYellowWool] run teleport @a 8 4 65 0 -90
