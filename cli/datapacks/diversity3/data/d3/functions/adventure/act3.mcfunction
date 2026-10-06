####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / SEPTEMBER 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


#scoreboard objectives setdisplay sidebar ZomboTimer
#scoreboard objectives setdisplay sidebar IntoCavern
#scoreboard objectives setdisplay sidebar Act3Sleeping
#scoreboard objectives setdisplay sidebar ObjectReturns
#scoreboard objectives setdisplay sidebar SpaceZombies1
#scoreboard objectives setdisplay sidebar SpaceZombies2

########## ACT 3 #############

execute if entity @e[scores={AdventureLevel=100}] run scoreboard objectives remove Act3Sleeping
execute if entity @e[scores={AdventureLevel=100}] as @e[tag=AdventureVillager,tag=!TrappedVillager,nbt=!{Silent:true}] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=AdventureCEO]
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=DrZombo]
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=AdventureFuglesang]
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=Zombocron]

execute if entity @e[scores={AdventureLevel=75}] run scoreboard objectives remove ReceptionTimer
execute if entity @e[scores={AdventureLevel=100..105}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=13] run scoreboard objectives add ReceptionTimer dummy
execute if entity @e[scores={AdventureLevel=100..105,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=100..105,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Remek> ","color":"dark_green","bold":false},{"text":"He's gone. He left while you were asleep. Seemed to be in a rush.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=106}] run scoreboard objectives remove ReceptionTimer

execute if entity @e[scores={AdventureLevel=100..}] unless block 970 95 2006 air run setblock 970 95 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 94 2006 air run setblock 970 94 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2006 air run setblock 970 93 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2005 quartz_pillar[axis=z] run setblock 970 93 2005 quartz_pillar[axis=z]
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2004 orange_stained_glass run setblock 970 93 2004 orange_stained_glass
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2003 iron_trapdoor run setblock 970 93 2003 iron_trapdoor[facing=north,half=bottom,open=false]

execute if entity @e[scores={AdventureLevel=100}] run difficulty easy
execute if entity @e[scores={AdventureLevel=100..}] run effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true


# ZOMBO RADIOS FOR HELP - 105
execute if entity @e[scores={AdventureLevel=100..104}] if entity @a[x=967,y=93,z=2000,distance=..5] run scoreboard players set @e[scores={AdventureLevel=100..104}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=100..104}] if entity @a[x=967,y=93,z=2000,distance=..5] run scoreboard players set @e[scores={AdventureLevel=100..104,AdventureTimer=-1}] AdventureLevel 105

execute if entity @e[scores={AdventureLevel=100..104}] if entity @a[x=1006,y=106,z=1948,distance=..5] run scoreboard players set @e[scores={AdventureLevel=100..104}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=100..104}] if entity @a[x=1006,y=106,z=1948,distance=..5] run scoreboard players set @e[scores={AdventureLevel=100..104,AdventureTimer=-1}] AdventureLevel 105


execute if entity @e[scores={AdventureLevel=105,AdventureTimer=300}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=305}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.9 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=305}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Apprentice! I need your help! Come to the ","color":"none","bold":false,"underlined":false},{"text":"Launch Bay","color":"gray","bold":true,"underlined":false},{"text":" immediately!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=105,AdventureTimer=390}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=395}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.8 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=395}] run tellraw @a ["",{"text":"<Mr. Gagarin (on com)> ","color":"yellow","bold":false},{"text":"No! Stay at Base! That is an order!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=105,AdventureTimer=460}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=465}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.9 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=465}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"No, don't listen to him! Come quickly!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=105,AdventureTimer=540}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=545}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.8 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=545}] run tellraw @a ["",{"text":"<Mr. Gagarin (on com)> ","color":"yellow","bold":false},{"text":"Do not come here! If you do, you","color":"none","bold":false,"underlined":false},{"text":"radio becomes broken","color":"none","obfuscated":true,"underlined":false}]



# SETUP ZOMBIE SEIGE
execute if entity @e[scores={AdventureLevel=100..105}] run kill @e[tag=ZombieZombo]
execute if entity @e[scores={AdventureLevel=100..105}] run team add Zombo

execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureShepard] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureMendez] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureTuan] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureJahn] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureHermaszewski] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureRamon] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureIvanov] at @s run teleport @s ~ ~-100 ~

#execute if entity @e[scores={AdventureLevel=100..199}] if entity @a[x=952,y=122,z=1989,distance=..30] if block 952 121 1989 cyan_terracotta run scoreboard objectives add SpaceZombies1 dummy
#execute if entity @e[scores={AdventureLevel=100..199}] if entity @a[x=872,y=101,z=2041,distance=..100] if block 872 100 2041 light_gray_concrete run scoreboard objectives add SpaceZombies2 dummy

execute if entity @e[scores={AdventureLevel=100..}] if block 44 2 78 air unless entity @e[tag=ZombieRamon] run summon zombie_villager 936 118 2003 {CustomName:"{\"text\":\"Ramon\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieRamon","AntiGravity"]}
execute as @e[tag=ZombieRamon] at @s if entity @a[distance=..10] if block 44 2 78 air run setblock 44 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=100..}] if block 43 2 78 air unless entity @e[tag=ZombieMendez] run summon zombie_villager 908 111 2032 {CustomName:"{\"text\":\"Méndez\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieMendez","AntiGravity"]}
execute as @e[tag=ZombieMendez] at @s if entity @a[distance=..10] if block 43 2 78 air run setblock 43 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=100..}] if block 42 2 78 air unless entity @e[tag=ZombieHermaszewski] run summon zombie_villager 894 101 2014 {CustomName:"{\"text\":\"Hermaszewski\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieHermaszewski","AntiGravity"]}
execute as @e[tag=ZombieHermaszewski] at @s if entity @a[distance=..10] if block 42 2 78 air run setblock 42 2 78 green_terracotta


execute if entity @e[scores={AdventureLevel=100..}] if block 40 2 78 air unless entity @e[tag=ZombieTuan] run summon zombie_villager 872 101 2041 {CustomName:"{\"text\":\"Tuân\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieTuan","AntiGravity"]}
execute as @e[tag=ZombieTuan] at @s if entity @a[distance=..10] if block 40 2 78 air run setblock 40 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=100..}] if block 39 2 78 air unless entity @e[tag=ZombieJahn] run summon zombie_villager 872 101 2038 {CustomName:"{\"text\":\"Jähn\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieJahn","AntiGravity"]}
execute as @e[tag=ZombieJahn] at @s if entity @a[distance=..10] if block 39 2 78 air run setblock 39 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=100..}] if block 38 2 78 air unless entity @e[tag=ZombieIvanov] run summon zombie_villager 875 102 2042 {CustomName:"{\"text\":\"Ivanov\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieIvanov","AntiGravity"]}
execute as @e[tag=ZombieIvanov] at @s if entity @a[distance=..10] if block 38 2 78 air run setblock 38 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=100..}] if block 37 2 78 air unless entity @e[tag=ZombieShepard] run summon zombie_villager 875 101 2037 {CustomName:"{\"text\":\"Shepard\",\"color\":\"light_purple\"}",NoAI:false,CustomNameVisible:false,Invulnerable:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieShepard","AntiGravity"]}
execute as @e[tag=ZombieShepard] at @s if entity @a[distance=..10] if block 37 2 78 air run setblock 37 2 78 green_terracotta

execute if entity @e[scores={AdventureLevel=150..}] if block 35 2 78 air unless entity @e[tag=ZombieFuglesang] run summon zombie_villager 1009 106 1954 {CustomName:"{\"text\":\"Fuglesang\",\"color\":\"dark_green\"}",NoAI:true,CustomNameVisible:false,Silent:true,Invulnerable:false,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:2},Rotation:[245f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Team:Zombo,Tags:["AdventureZombie","ZombieFuglesang","AntiGravity"]}
execute align x align y align z if entity @a[x=1006,y=106,z=1949,dx=2,dy=2,dz=2] if entity @e[tag=ZombieFuglesang,nbt={Silent:true}] at @e[tag=ZombieFuglesang] run playsound entity.zombie_villager.ambient master @a
execute as @e[tag=ZombieFuglesang] at @s align x align y align z if entity @a[x=1006,y=106,z=1949,dx=2,dy=2,dz=2] run data merge entity @s {NoAI:false,Silent:false,CustomNameVisible:true}
execute as @e[tag=ZombieFuglesang] at @s if entity @a[distance=..10] if block 35 2 78 air run setblock 35 2 78 green_terracotta


#execute as @e[tag=AdventureZombie,nbt={NoAI:true}] at @s run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=AdventureZombie] at @s unless entity @a[distance=..40] run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=AdventureZombie,tag=!ZombieCEO,tag=!ZombieFuglesang] at @s if entity @a[distance=..40] run data merge entity @s {CustomNameVisible:true}

#effect give @e[tag=AdventureZombie,tag=AntiGravity,nbt={HurtTime:1s}] levitation 1 1 true



# SHUTTLE DOOR CLOSED / OPEN
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 104 2038 air run setblock 844 104 2038 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 104 2037 air run setblock 844 104 2037 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 105 2036 quartz_stairs[facing=north,half=top] run setblock 844 105 2036 quartz_stairs[facing=north,half=top]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 106 2036 quartz_stairs[facing=south,half=bottom] run setblock 844 106 2036 quartz_stairs[facing=south,half=bottom]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 107 2036 quartz_stairs[facing=north,half=bottom] run setblock 844 107 2036 quartz_stairs[facing=north,half=bottom]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 108 2036 air run setblock 844 108 2036 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 108 2037 air run setblock 844 108 2037 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 109 2037 air run setblock 844 109 2037 air


execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 104 2038 iron_trapdoor run setblock 844 104 2038 iron_trapdoor[facing=south,half=bottom,open=false]
execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 104 2037 quartz_stairs run setblock 844 104 2037 quartz_stairs[facing=north,half=bottom]
execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 105 2036 quartz_stairs[facing=north,half=bottom] run setblock 844 105 2036 quartz_stairs[facing=north,half=bottom]
execute if entity @e[scores={AdventureLevel=105..106}] if block 844 106 2036 quartz_stairs run setblock 844 106 2036 air
execute if entity @e[scores={AdventureLevel=105..106}] if block 844 107 2036 quartz_stairs run setblock 844 107 2036 air
execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 108 2036 quartz_stairs run setblock 844 108 2036 quartz_stairs[facing=south,half=bottom]
execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 108 2037 quartz_stairs run setblock 844 108 2037 quartz_stairs[facing=north,half=top]
execute if entity @e[scores={AdventureLevel=105..106}] unless block 844 109 2037 quartz_stairs run setblock 844 109 2037 quartz_stairs[facing=south,half=bottom]





# SETUP LAUNCH ANIMATION
execute if entity @e[scores={AdventureLevel=105}] unless entity @e[tag=ZombieCEO] run summon zombie_villager 854 104 2034 {CustomName:"{\"text\":\"Mr. Gagarin\",\"color\":\"yellow\"}",CustomNameVisible:false,Invulnerable:false,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:none",type:"minecraft:taiga",level:2},Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Tags:["AdventureZombie","ZombieCEO"]}

execute if entity @e[scores={AdventureLevel=105}] run teleport @e[tag=DrZombo] 853 104 2034 90 0
execute if entity @e[scores={AdventureLevel=105}] unless entity @e[tag=DrZombo] run summon villager 853 104 2034 {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:false,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:librarian",type:"minecraft:taiga",level:2},Offers:{},Rotation:[90f,0f],Tags:["AdventureVillager","DrZombo"],Team:Zombo}
execute if entity @e[scores={AdventureLevel=105..106}] run replaceitem entity @e[tag=DrZombo] armor.head orange_stained_glass

execute if entity @e[scores={AdventureLevel=100..105}] align x align y align z if entity @a[x=853,y=104,z=2039,dx=2,dy=4,dz=4] run scoreboard players set @e[scores={AdventureLevel=100..105}] AdventureTimer -50
scoreboard players set @e[scores={AdventureLevel=100..105,AdventureTimer=-50}] AdventureLevel 106

execute if entity @e[scores={AdventureLevel=106}] run effect give @e[tag=DrZombo] resistance 3 255 true
execute if entity @e[scores={AdventureLevel=106}] as @e[tag=DrZombo] run data merge entity @s {Health:20.0f}

execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-49}] as @e[tag=DrZombo] run data merge entity @s {NoAI:false,Silent:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-48}] as @e[tag=ZombieCEO] run data merge entity @s {NoAI:false,Silent:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-49}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-49}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Help me!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=106,AdventureTimer=0..}] unless entity @e[tag=ZombieCEO] run scoreboard players set @e[scores={AdventureLevel=106}] AdventureLevel 107
execute if entity @e[scores={AdventureLevel=107..110}] if entity @e[tag=ZombieCEO] run scoreboard players set @e[scores={AdventureLevel=107..110}] AdventureLevel 106

scoreboard players set @e[scores={AdventureLevel=107}] AdventureTimer 0
scoreboard players set @e[scores={AdventureLevel=107,AdventureTimer=0}] AdventureLevel 110

execute if entity @e[tag=ZombieCEO] run fill 844 106 2036 844 107 2036 barrier replace air
execute unless entity @e[tag=ZombieCEO] run fill 844 106 2036 844 107 2036 air replace barrier
execute if entity @e[tag=ZombieCEO] run fill 844 106 2026 844 107 2026 barrier replace air
execute unless entity @e[tag=ZombieCEO] run fill 844 106 2026 844 107 2026 air replace barrier

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1}] as @e[tag=DrZombo] run data merge entity @s {NoAI:true,Silent:true,Invulnerable:true}
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1}] as @e[tag=DrZombo] at @s run teleport @s ~ ~ ~ ~ 60
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=60..729}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=70}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=70}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=150}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=150}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"He took ","color":"none","bold":false,"underlined":false},{"text":"The Zombocron","color":"gold","bold":true,"underlined":false},{"text":" from the Lab.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"He said it was the real reason we had been drilling. He said it was a missing artifact for some distant ","color":"none","bold":false,"underlined":false},{"text":"Monument","color":"aqua","bold":true,"underlined":false},{"text":" that needed to be completed.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=450}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=450}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"He was going to leave with it. He said you were standing in his way.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=550}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=550}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But it's evil. It's turned everyone who came near it into those... things.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=670}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=670}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Everyone but you and me... How is that possible?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=720}] run playsound block.end_portal.spawn master @a 1000 94 2000 100 0.5 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=720}] run playsound entity.wither.spawn master @a 1000 94 2000 100 0.5 0

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=722..729}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing 1000 100 2000
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=735}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=735}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh no! No! No! No! No! No!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=800..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=775}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=775}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"He had the self-destruct activated?! We don't have much time!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=840}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=840}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"We need to get back there and bring anyone left to these ","color":"none","bold":false,"underlined":false},{"text":"Escape Shuttles","color":"gray","bold":true,"underlined":false},{"text":"!","color":"none","bold":false,"underlined":false}]

#execute if entity @e[scores={AdventureLevel=110,AdventureTimer=940}] at @e[tag=DrZombo] run summon item ~ ~1 ~ {NoGravity:true,Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"The Zombocron\"}",Lore:["Destroy it in the Crater?","Or leave with it in the Shuttle?"]}}}}

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=940}] at @e[tag=DrZombo] run summon item ~ ~1 ~ {NoGravity:true,Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"bold\":\"true\",\"text\":\"The Zombocron\"}",Lore:['{"text":"Destroy it in the Crater?","italic":"true","color":"white"}','{"text":"Or leave with it in the Shuttle?","italic":"true","color":"white"}']}}}}









#execute if entity @e[scores={AdventureLevel=110,AdventureTimer=941}] at @e[tag=DrZombo] run playsound entity.item.pickup master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=941}] at @e[tag=DrZombo] run playsound block.wool.hit master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=941..959}] as @e[type=item,nbt={Item:{tag:{Zombocron:1b}}}] at @s run teleport @s ^ ^ ^0.2 facing entity @p eyes

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=940}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=940}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Here. Take it, and throw it back into the ","color":"none","bold":false,"underlined":false},{"text":"Crater","color":"gray","bold":true,"underlined":false},{"text":". Leave it there to be destroyed!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Wait. Is it true what he said about you?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"No. You can't leave with ","color":"none","bold":false,"underlined":false},{"text":"that thing","color":"gold","bold":true,"underlined":false},{"text":". I don't care what ","color":"none","bold":false,"underlined":false},{"text":"Monument","color":"aqua","bold":true,"underlined":false},{"text":" it's for. You'll have to destroy it!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Do not get on ","color":"none","bold":false,"underlined":false},{"text":"that shuttle","color":"gray","bold":true,"underlined":false},{"text":" with it! You need to...","color":"none","bold":false,"underlined":false}]


# ZOMBO TURNS
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320}] run kill @e[tag=ZombieZombo]
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320}] at @e[tag=DrZombo] unless entity @e[tag=ZombieZombo] run summon zombie_villager ~ ~-10 ~ {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:librarian",type:"minecraft:taiga",level:2},Tags:["ZombieZombo"],Team:Zombo}
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320..1389}] run effect give @e[tag=ZombieZombo] invisibility 100 255 true
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320..1350}] at @e[tag=DrZombo] run teleport @e[tag=ZombieZombo] ~ ~-5 ~ ~ ~
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie_villager.ambient master @a 1 1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run particle falling_dust orange_wool ~ ~1.4 ~ 0.3 0.6 0.3 0 500 force
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1380..1390}] at @e[tag=DrZombo] run teleport @e[tag=ZombieZombo] ~ ~ ~ ~ ~
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1390}] run effect clear @e[tag=ZombieZombo] invisibility
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1391..}] run effect give @e[tag=DrZombo] invisibility 100 255 true
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1390}] as @e[tag=ZombieZombo] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:orange_stained_glass",Count:1b}],Silent:false,NoAI:false,Invulnerable:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1391..}] as @e[tag=DrZombo] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1395..}] run team remove Zombo
scoreboard players set @e[scores={AdventureLevel=110,AdventureTimer=1395..}] AdventureLevel 150


# SETUP END BASE
execute if entity @e[scores={AdventureLevel=150}] as @e[tag=AdventureReceptionist] run data merge entity @s {Silent:true,Invulnerable:false}
execute if entity @e[scores={AdventureLevel=150}] at @e[tag=AdventureReceptionist] if entity @a[distance=..20] unless entity @e[tag=ZombieReceptionist] run summon zombie_villager ~ ~ ~ {CustomName:"{\"text\":\"Remek\",\"color\":\"dark_green\"}",CustomNameVisible:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:2},Rotation:[180f,0f],Attributes:[{Name:"generic.followRange",Base:100.0d}],Tags:["AdventureZombie","ZombieReceptionist","DoorLevel1"]}
execute if entity @e[tag=ZombieReceptionist] as @e[tag=AdventureReceptionist] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={AdventureLevel=150}] as @e[tag=AdventureFarkas] run data merge entity @s {Silent:true,Invulnerable:false}
execute if entity @e[scores={AdventureLevel=150}] at @e[tag=AdventureFarkas] if entity @a[distance=..20] unless entity @e[tag=ZombieFarkas] run summon zombie_villager ~ ~ ~ {CustomName:"{\"text\":\"Farkas\",\"color\":\"dark_green\"}",CustomNameVisible:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:2},Rotation:[270f,0f],Attributes:[{Name:"generic.followRange",Base:100.0d}],Tags:["AdventureZombie","ZombieFarkas","DoorLevel1","DoorLevel3"]}
execute if entity @e[tag=ZombieFarkas] as @e[tag=AdventureFarkas] at @s run teleport @s ~ ~-100 ~
execute if entity @e[tag=ZombieFarkas] as @e[tag=AdventureOckels,nbt={NoAI:true}] run data merge entity @s {NoAI:false}
execute if entity @e[tag=ZombieFarkas] run tag @e[tag=AdventureOckels] add DoorLevel3
execute if entity @e[tag=ZombieFarkas] as @e[tag=AdventureVillager,tag=!AdventureReceptionist,tag=!AdventureFarkas,nbt={Silent:true}] run data merge entity @s {Silent:false,Invulnerable:false}

execute if entity @e[tag=ZombieFarkas] run scoreboard objectives add OckelsThanks dummy
execute if entity @e[tag=ZombieFarkas] 
execute if block 1034 106 2007 quartz_stairs if entity @e[tag=AdventureOckels] unless entity @e[tag=ZombieFarkas] run scoreboard players add @e[tag=MainAdventureAEC] OckelsThanks 1

execute if entity @e[scores={OckelsThanks=1}] as @e[tag=AdventureOckels] run data merge entity @s {Silent:true,Invulnerable:true,NoAI:true}
execute if entity @e[scores={OckelsThanks=1..140}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={OckelsThanks=20}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={OckelsThanks=20}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"What is happening!?! Thank you for saving me! I'll be fine. Go get the others out!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={OckelsThanks=141}] as @e[tag=AdventureOckels] run data merge entity @s {Silent:false,NoAI:false}
execute if entity @e[scores={OckelsThanks=150..}] run scoreboard objectives remove OckelsThanks

execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=TrappedVillager] at @s if entity @a[distance=..20] run data merge entity @s {NoAI:false}


# CHOOSE TO KEEP WOOL -> 200
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=843,y=106,z=2033,dx=2,dy=1,dz=1,nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=843,y=106,z=2033,dx=2,dy=1,dz=1,nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 200


# CHOOSE TO DESTROY WOOL -> 250
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=997,y=93,z=1967,dx=6,dy=1,dz=6] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=997,y=93,z=1967,dx=6,dy=1,dz=6] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 250

execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=998,y=93,z=2027,dx=4,dy=2,dz=10] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=998,y=93,z=2027,dx=4,dy=2,dz=10] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 250


# LOWEST POINT INSIDE -> 50
# 1089 2065
# 998 1908
# 772 2061
# 925 2177

# CHOOSE TO TO THROW AWAY WOOL -> 300
#execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @e[tag=OrangeWool,x=772,y=1,z=1908,dx=317,dy=10,dz=269] run say hi
execute if entity @e[scores={AdventureLevel=150..160}] at @e[tag=OrangeWool] if block ~ ~-40 ~ barrier if block ~ ~-39 ~ structure_void run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] at @e[tag=OrangeWool] if block ~ ~-40 ~ barrier if block ~ ~-39 ~ structure_void run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 300

execute if entity @e[scores={AdventureLevel=150..160}] at @e[tag=OrangeWool] if block ~ ~-1 ~ barrier if block ~ ~ ~ structure_void run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] at @e[tag=OrangeWool] if block ~ ~-1 ~ barrier if block ~ ~ ~ structure_void run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 300


