####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 29 2018 / SEPTEMBER 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar TPSpawnChunks


# RUNS MAP INTRO CLOCK
execute if block 1 4 2 spruce_log if block 1 2 4 clay run setblock 1 2 4 redstone_block


# 1.3.0 EXPERIMENTAL UPDATE FOR REMOVING OBJECTIVES
execute if block 12 6 14 white_wool align x align y align z if entity @a[x=-87,y=0,z=813,dx=220,dy=182,dz=300] run function d3:remove_objectives_mechanic


# GO TO SPAWN CHUNKS -> DEBUG ONLY
#execute if block 8 91 1032 chest{Items:[{id:"minecraft:command_block"}]} run scoreboard objectives add TPSpawnChunks dummy
#scoreboard players add @p TPSpawnChunks 1
#execute if entity @a[scores={TPSpawnChunks=1}] run setblock 8 91 1032 air
#execute if entity @a[scores={TPSpawnChunks=1}] run setblock 8 91 1032 chest[facing=north]
#execute if entity @a[scores={TPSpawnChunks=1}] run teleport @a 7 1 4
#execute if entity @a[scores={TPSpawnChunks=2..}] run scoreboard objectives remove TPSpawnChunks


# STARTING POINT -> ISLANDS NOT ACCESSIBLE YET
execute if block 12 6 14 gravel align x align y align z if entity @a[x=-87,y=34,z=813,dx=220,dy=72,dz=300] run function d3:hub/island_startup


# RUNS CLOCK AFTER WHITE WOOL GETS INSERTED FOR LAG
#scoreboard objectives setdisplay sidebar LoadAccessPoints
scoreboard players add @e[tag=MainHubAEC] LoadAccessPoints 1
execute if entity @e[scores={LoadAccessPoints=145}] run time set 18000
execute if entity @e[scores={LoadAccessPoints=150}] at @a run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={LoadAccessPoints=230}] run time set 6000
execute if entity @e[scores={LoadAccessPoints=250}] run time set 18000
execute if entity @e[scores={LoadAccessPoints=280}] run setblock 12 6 14 white_wool
execute if entity @e[scores={LoadAccessPoints=282}] run playsound entity.lightning_bolt.impact master @a 8 87 998 4 1 1
execute if entity @e[scores={LoadAccessPoints=282}] run summon lightning_bolt 8 87 998
execute if entity @e[scores={LoadAccessPoints=282}] run kill @e[tag=FailSafeStand]
execute if entity @e[scores={LoadAccessPoints=285}] run time set 6000

execute if entity @e[scores={LoadAccessPoints=300..}] run scoreboard objectives remove LoadAccessPoints


# CHECK IF WHITE WOOL HAS BEEN COMPLETED (PLAYERS AT HUB ISLAND)


#execute if entity @e[tag=ServerCrashFailSafeAEC] run say CrashAEC Found
execute unless entity @e[tag=ServerCrashFailSafeAEC] if block 12 6 14 white_wool align x align y align z if entity @a[x=-87,y=0,z=813,dx=220,dy=182,dz=300] run function d3:hub/access_mechanics
execute if block 12 6 14 white_wool align x align y align z if entity @a[x=-87,y=0,z=813,dx=220,dy=182,dz=300] run function d3:hub/branch_teleporters
execute if block 12 6 14 white_wool align x align y align z if entity @a[x=-87,y=0,z=813,dx=220,dy=182,dz=300] unless entity @e[tag=ServerCrashFailSafeAEC] run function d3:hub/dead_bushes

execute if block 1 4 2 stone_bricks run gamemode adventure @a[tag=!InKwaIslands,tag=!D3Admin]
execute if block 1 4 2 stone_bricks run spawnpoint @a[tag=!InKwaIslands] 8 88 998
execute if block 1 4 2 stone_bricks as @a[tag=!InKwaIslands] unless entity @s[x=-87,y=0,z=813,dx=220,dy=182,dz=300] run teleport @s 8 87 996 0 0
execute if block 1 4 2 stone_bricks run tag @a add InKwaIslands
execute unless block 1 4 2 stone_bricks run tag @a remove InKwaIslands


# CHECK FOR PLAYERS AT MONUMENT
execute unless blocks 8 91 1032 8 91 1032 8 86 1032 all align x align y align z if entity @a[x=-16,y=88,z=1008,dx=47,dy=14,dz=47] run function d3:hub/chest_detection

execute unless block 8 91 1032 chest align x align y align z if entity @a[x=-16,y=87,z=1008,dx=47,dy=14,dz=47] run setblock 8 91 1032 chest{CustomName:"{\"text\":\"Insert Item\"}"}
execute unless block 8 91 1032 chest{CustomName:"{\"text\":\"Insert Item\"}"} align x align y align z if entity @a[x=-16,y=87,z=1008,dx=47,dy=14,dz=47] run data merge block 8 91 1032 {CustomName:"{\"text\":\"Insert Item\"}"}

execute unless block 8 86 1032 chest align x align y align z if entity @a[x=-16,y=87,z=1008,dx=47,dy=14,dz=47] run setblock 8 86 1032 chest{CustomName:"{\"text\":\"Insert Item\"}"}
execute unless block 8 86 1032 chest{CustomName:"{\"text\":\"Insert Item\"}"} align x align y align z if entity @a[x=-16,y=87,z=1008,dx=47,dy=14,dz=47] run data merge block 8 91 1032 {CustomName:"{\"text\":\"Insert Item\"}"}

execute align x align y align z if entity @a[x=-16,y=88,z=1008,dx=47,dy=14,dz=47] as @e[tag=MonumentCart] at @s run teleport @s ~ ~ ~ ~1 ~
#execute align x align y align z if entity @a[x=-87,y=34,z=813,dx=210,dy=72,dz=300] run effect give @e[tag=MonumentShulker] invisibility 1000000 255 true
execute if entity @e[tag=MonumentShulker] run effect give @e[tag=MonumentShulker] invisibility 1000000 255 true

execute if block 12 6 14 white_wool unless entity @e[scores={OutroTimer=501..}] run advancement grant @a[gamemode=creative] only d3:folder_c/cheater
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_a/root
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_a/line_a1_end
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_a/line_a2_end
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_b/root
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_b/line_b1_end
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_b/line_b2_end
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_b/line_b3_end
execute if block 12 6 14 white_wool run advancement grant @a only d3:folder_b/line_b4_end


# REMOVE STRAGGLING SCOREBOARD DISPLAYS -> REDUNDANT
execute if entity @a[scores={ArenaCash=0..}] unless block 1 4 2 yellow_wool run scoreboard objectives remove ArenaCash
execute if entity @a[scores={ArenaDeaths=0..}] unless block 1 4 2 yellow_wool run scoreboard objectives remove ArenaDeaths
execute if entity @a[scores={PlayerKillCount=0..}] unless block 1 4 2 yellow_wool run scoreboard objectives remove PlayerKillCount
execute unless block 1 4 2 lime_wool run scoreboard objectives remove TriviaTally
execute if entity @a[scores={ParkDeaths=0..}] unless block 1 4 2 pink_wool run scoreboard objectives remove ParkDeaths
execute if entity @a[scores={DropDeaths=0..}] unless block 1 4 2 blue_wool run scoreboard objectives remove DropDeaths
execute if entity @a[scores={BossDeaths=0..}] unless block 1 4 2 black_wool run scoreboard objectives remove BossDeaths


# PROTECTS BRANCH SETUP FUNCTIONS
function d3:protect_branch_setups


# FINALE
execute if block 2 6 14 gravel run fill 7 87 997 9 87 999 air replace stone_slab
execute if block 2 6 14 gravel run fill 8 86 998 8 86 998 chiseled_stone_bricks replace light_blue_stained_glass
execute if block 2 6 14 gravel run fill 8 87 998 8 87 998 air replace light_blue_stained_glass

execute if block 12 6 14 white_wool if block 11 6 14 orange_wool if block 10 6 14 yellow_wool if block 9 6 14 lime_wool if block 8 6 14 pink_wool if block 7 6 14 cyan_wool if block 6 6 14 purple_wool if block 5 6 14 blue_wool if block 4 6 14 brown_wool if block 3 6 14 red_wool if block 2 6 14 black_wool if block 1 6 14 gravel run setblock 1 6 14 light_gray_wool

execute if block 1 6 14 gravel run scoreboard objectives remove FinaleAccess
execute if block 1 6 14 light_gray_wool run function d3:hub/finale_access
execute if block 1 6 14 light_blue_wool run scoreboard objectives remove FinaleAccess

tag @a remove TPFinale
execute if block 8 87 998 light_blue_stained_glass align x align y align z run tag @a[x=7,y=87,z=997,dx=2,dy=168,dz=2] add TPFinale
execute if block 8 87 998 light_blue_stained_glass align x align y align z run effect clear @a[x=5,y=87,z=995,dx=6,dy=168,dz=6,tag=!TPFinale] levitation
execute if block 8 87 998 light_blue_stained_glass align x align y align z run effect give @a[x=8,y=87,z=998,dx=0,dy=168,dz=0] levitation 2 4
effect give @a[tag=TPFinale] resistance 6 255 true
execute at @a[tag=TPFinale] run particle falling_dust snow ~ ~ ~ 0.2 0.2 0.2 1 3 force @a
execute if block 8 87 998 light_blue_stained_glass align x align y align z run effect clear @a[x=7,y=200,z=997,dx=2,dy=5,dz=2] levitation
execute if block 8 87 998 light_blue_stained_glass align x align y align z run stopsound @a[x=7,y=200,z=997,dx=2,dy=5,dz=2]
execute if block 8 87 998 light_blue_stained_glass align x align y align z if entity @a[x=7,y=200,z=997,dx=2,dy=5,dz=2] run playsound item.chorus_fruit.teleport master @a 7 200 997 1000 1 1
execute if block 8 87 998 light_blue_stained_glass align x align y align z run effect give @a[x=7,y=200,z=997,dx=2,dy=5,dz=2] blindness 5 255 true
execute if block 8 87 998 light_blue_stained_glass align x align y align z run teleport @a[x=7,y=200,z=997,dx=2,dy=5,dz=2] 1 4 97 0 -90


# SOFT ANTI-CHEAT -> SURVIVAL TO ADVENTURE
execute unless block 1 4 2 brown_wool run gamemode adventure @a[tag=!D3Admin,gamemode=survival]
execute if block 1 4 2 brown_wool run gamemode survival @a[tag=!D3Admin,gamemode=adventure]


# STRAGGLERS
execute if block 1 4 2 stone_bricks run spawnpoint @a[tag=NewPlayer] 8 88 998
execute if block 1 4 2 stone_bricks run teleport @a[tag=NewPlayer] 8 87 996 0 0


# TRACK LIFE TIME STATS
#execute unless entity @a[scores={LifeTimeKills=0..}] run scoreboard objectives add LifeTimeKills totalKillCount {"text":"Diversity 3 Kills","color":"light_purple","bold":"true","underlined":"true"}
#execute unless entity @a[scores={LifeTimeDeaths=0..}] run scoreboard objectives add LifeTimeDeaths deathCount {"text":"Diversity 3 Deaths","color":"light_purple","bold":"true","underlined":"true"}
#scoreboard players add @a[name=!qmagnet] LifeTimeKills 0
#scoreboard players add @a[name=!qmagnet] LifeTimeDeaths 0


# SPEED RUNNERS - PRACTICE ONLY / NOT OFFICIAL
execute if entity @a[tag=Speedrunner] run function d3:speedrunner/speedrunner
execute unless entity @a[tag=Speedrunner] if entity @a[scores={Speedrunner=0..}] run scoreboard objectives remove Speedrunner
