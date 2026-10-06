####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / SEPTEMBER 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BeginAdventure
#scoreboard objectives setdisplay sidebar AdventureLevel
#scoreboard objectives setdisplay sidebar AdventureTimer
#scoreboard objectives setdisplay sidebar LowerO2Door
#scoreboard objectives setdisplay sidebar LabBedroomOpen
#scoreboard objectives setdisplay sidebar LabBedroomClose
#scoreboard objectives setdisplay sidebar HoldUpBook
#scoreboard objectives setdisplay sidebar Airlock1FailSafe
#scoreboard objectives setdisplay sidebar Airlock2FailSafe
#scoreboard objectives setdisplay sidebar Airlock3FailSafe
#scoreboard objectives setdisplay sidebar Airlock4FailSafe
#scoreboard objectives setdisplay sidebar Airlock5FailSafe
#scoreboard objectives setdisplay sidebar ReceptionTimer
#scoreboard objectives setdisplay sidebar ZomboTimer
#scoreboard objectives setdisplay sidebar IntoCavern
#scoreboard objectives setdisplay sidebar Act3Sleeping
#scoreboard objectives setdisplay sidebar ObjectReturns


execute if entity @e[tag=AdventureMapMaker] run kill @e[tag=AdventureMapMaker]

# TOILET -> CHRISTER FUGLESANG {SWEDEN)
execute if entity @e[scores={AdventureLevel=..4}] if block 986 108 2059 air unless entity @e[tag=AdventureFuglesang] run summon villager 986 106 2059.0 {CustomName:"{\"text\":\"Fuglesang\",\"color\":\"dark_green\"}",CustomNameVisible:false,NoAI:true,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Silent:true,Rotation:[180f,40f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventureFuglesang","AdventureToilet","DoorLevel1"]}

# CEO -> YURI GAGARIN (RUSSIA)
execute if entity @e[scores={AdventureLevel=..1}] if block 973 106 2000 air unless entity @e[tag=AdventureCEO] run summon villager 973 106 2000 {CustomName:"{\"text\":\"Mr. Gagarin\",\"color\":\"yellow\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:none",type:"minecraft:taiga",level:6},Offers:{},Tags:["AdventureVillager","AdventureCEO","DoorLevel1","DoorLevel2","DoorLevel3","DoorLevel4","DoorLevel5"]}
execute if entity @e[scores={AdventureLevel=1..2}] align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] as @e[tag=AdventureCEO] at @s run teleport @s ^ ^ ^ facing entity @p

# RECEPTIONIST -> VLADIMIR REMEK (CZECH)
execute if entity @e[scores={AdventureLevel=..1}] if block 971 106 2005 air unless entity @e[tag=AdventureReceptionist] run summon villager 971 106 2005 {CustomName:"{\"text\":\"Remek\",\"color\":\"dark_green\"}",CustomNameVisible:false,Rotation:[180f,0f],Invulnerable:true,NoAI:false,Silent:false,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Offers:{},Tags:["AdventureVillager","AdventureReceptionist","DoorLevel1"]}
execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureReceptionist] at @s run teleport @s 971 106 2005
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureReceptionist,nbt=!{NoAI:true}] run data merge entity @s {NoAI:true}
execute align x align y align z if entity @a[x=957,y=106,z=1993,dx=17,dy=4,dz=14] as @e[tag=AdventureReceptionist,nbt=!{Silent:true}] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=..44}] align x align y align z unless entity @a[x=957,y=106,z=1993,dx=17,dy=4,dz=14] as @e[tag=AdventureReceptionist,nbt={Silent:true}] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=45..}] as @e[tag=AdventureReceptionist,nbt=!{Silent:true}] run data merge entity @s {Silent:true}

# DR ZOMBO
execute if entity @e[scores={AdventureLevel=..3}] if block 971 106 2005 air unless entity @e[tag=DrZombo] run summon villager 1000 93 2027 {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:librarian",type:"minecraft:taiga",level:6},Offers:{},Tags:["AdventureVillager","DrZombo","DoorLevel1","DoorLevel2","DoorLevel3","DoorLevel4"]}
execute if entity @e[scores={AdventureLevel=1..12}] align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=1..12}] align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

# MARCOS PONTES (BRAZIL)
execute if entity @e[scores={AdventureLevel=..4}] if block 1006 93 2032 air unless entity @e[tag=AdventurePontes] run summon villager 1006 93 2032 {CustomName:"{\"text\":\"Pontes\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventurePontes","DoorLevel1","TrappedVillager"]}

# MARK SHUTTLEWORTH (SOUTH AFRICA)
execute if entity @e[scores={AdventureLevel=..4}] if block 995 93 2031 air unless entity @e[tag=AdventureShuttleworth] run summon villager 995 93 2031 {CustomName:"{\"text\":\"Shuttleworth\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Rotation:[0f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventureShuttleworth","DoorLevel1","TrappedVillager"]}

# MARC GARNEAU (CANADA)
execute if entity @e[scores={AdventureLevel=..4}] if block 995 93 2033 air unless entity @e[tag=AdventureGarneau] run summon villager 995 93 2033 {CustomName:"{\"text\":\"Garneau\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Rotation:[180f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventureGarneau","DoorLevel1","TrappedVillager"]}

# YANG LIWEI (CHINA)
execute if entity @e[scores={AdventureLevel=..4}] if block 1000 93 2033 air unless entity @e[tag=AdventureLiwei] run summon villager 1000 93 2033 {CustomName:"{\"text\":\"Liwei\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Rotation:[180f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventureLiwei","DoorLevel1","TrappedVillager"]}

# RAKESH SHARMA (INDIA)
execute if entity @e[scores={AdventureLevel=..4}] if block 997 93 2036 air unless entity @e[tag=AdventureSharma] run summon villager 997 93 2036 {CustomName:"{\"text\":\"Sharma\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Rotation:[180f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["AdventureVillager","AdventureSharma","DoorLevel1","TrappedVillager"]}

# DOUG -> WUBBO OCKELS (NETHERLANDS)
execute if entity @e[scores={AdventureLevel=..1}] if block 1035 106 1995 air unless entity @e[tag=AdventureOckels] run summon villager 1035 106 1995 {CustomName:"{\"text\":\"Ockels\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Offers:{},Tags:["AdventureVillager","AdventureOckels"]}

# BOB -> BERTALAN FARKAS (HUNGARY)
execute if entity @e[scores={AdventureLevel=..1}] if block 1034 106 2006 air unless entity @e[tag=AdventureFarkas] run summon villager 1034 106 2006 {CustomName:"{\"text\":\"Farkas\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},Offers:{},Tags:["AdventureVillager","AdventureFarkas"]}

# ALAN SHEPARD (USA)
execute if entity @e[scores={AdventureLevel=..30}] if block 958 144 2092 air unless entity @e[tag=AdventureShepard] run summon villager 958 144 2092 {CustomName:"{\"text\":\"Shepard\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Rotation:[90f,5f],Tags:["AdventureVillager","AdventureShepard"]}
#execute if entity @e[scores={AdventureLevel=..30}] run teleport @e[tag=AdventureShepard] 958 144 2092 90 15

# ARNALDO TAMAYO MENDEZ (CUBA)
execute if entity @e[scores={AdventureLevel=..30}] if block 956 144 2104 air unless entity @e[tag=AdventureMendez] run summon villager 956.2 144 2104 {CustomName:"{\"text\":\"Méndez\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Rotation:[270f,20f],Tags:["AdventureVillager","AdventureMendez"]}
#execute if entity @e[scores={AdventureLevel=..30}] run teleport @e[tag=AdventureMendez] 956 144 2104 270 20

# PHAM TUAN (VIETNAM)
execute if entity @e[scores={AdventureLevel=..30}] if block 946 144 2103 air unless entity @e[tag=AdventureTuan] run summon villager 946 144 2103 {CustomName:"{\"text\":\"Tuân\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Tags:["AdventureVillager","AdventureTuan","AdventureWaterCooler"]}

# SIGMUND JAHN (GERMANY)
execute if entity @e[scores={AdventureLevel=..30}] if block 944 144 2103 air unless entity @e[tag=AdventureJahn] run summon villager 944 144 2103 {CustomName:"{\"text\":\"Jähn\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Tags:["AdventureVillager","AdventureJahn","AdventureWaterCooler"]}

# MIROSLAW HERMASZEWSKI (POLAND)
execute if entity @e[scores={AdventureLevel=..30}] if block 947 144 2092 air unless entity @e[tag=AdventureHermaszewski] run summon villager 947 144 2092 {CustomName:"{\"text\":\"Hermaszewski\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Rotation:[0f,10f],Tags:["AdventureVillager","AdventureHermaszewski"]}

# ILAD RAMON (ISRAEL)
execute if entity @e[scores={AdventureLevel=..30}] if block 939 144 2096 air unless entity @e[tag=AdventureRamon] run summon villager 939 144 2096 {CustomName:"{\"text\":\"Ramon\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:false,Silent:true,VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga",level:6},Offers:{},Rotation:[180f,10f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Tags:["AdventureVillager","AdventureRamon"]}

# GEORGI IVANOV (BULGARIA)
execute if entity @e[scores={AdventureLevel=..30}] if block 940 136 2084 air unless entity @e[tag=AdventureIvanov] run summon villager 940 136 2084 {CustomName:"{\"text\":\"Ivanov\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,VillagerData:{profession:"minecraft:cleric",type:"minecraft:snow",level:6},Offers:{},Tags:["AdventureVillager","AdventureIvanov"]}


# FISH
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish1] run summon tropical_fish 951 108 2000 {Variant:16777217,Tags:["AdventureFish1","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish2] run summon tropical_fish 951 108 2000 {Variant:16843009,Tags:["AdventureFish2","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish3] run summon tropical_fish 951 108 2000 {Variant:66049,Tags:["AdventureFish3","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish4] run summon tropical_fish 951 108 2000 {Variant:66305,Tags:["AdventureFish4","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish5] run summon tropical_fish 951 108 2000 {Variant:16778241,Tags:["AdventureFish5","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish6] run summon tropical_fish 951 108 2000 {Variant:16778497,Tags:["AdventureFish6","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish7] run summon tropical_fish 951 108 2000 {Variant:16844032,Tags:["AdventureFish7","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish8] run summon tropical_fish 951 108 2000 {Variant:16843264,Tags:["AdventureFish8","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish9] run summon tropical_fish 951 108 2000 {Variant:16777984,Tags:["AdventureFish9","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish10] run summon tropical_fish 951 108 2000 {Variant:16778240,Tags:["AdventureFish10","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish11] run summon pufferfish 951 108 2000 {Tags:["AdventureFish11","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish12] run summon salmon 951 108 2000 {Tags:["AdventureFish12","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish13] run summon salmon 951 108 2000 {Tags:["AdventureFish13","AdventureFish"]}
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureFish14] run summon turtle 951 108 2000 {Tags:["AdventureFish14","AdventureFish"]}



# LOWER POWER SET
execute if entity @e[scores={AdventureLevel=..10}] if block 1033 94 1995 lever[powered=true] run fill 46 5 78 46 5 78 glowstone replace magma_block
execute if entity @e[scores={AdventureLevel=..10}] if block 46 5 78 glowstone run function d3:adventure/lights_on_lower

execute if entity @e[scores={AdventureLevel=..10}] if block 1033 94 1995 lever[powered=false] run fill 46 5 78 46 5 78 magma_block replace glowstone
execute if entity @e[scores={AdventureLevel=..10}] if block 46 5 78 magma_block run function d3:adventure/lights_off_lower


# UPPER POWER SET
execute if entity @e[scores={AdventureLevel=..10}] if block 1033 94 1999 lever[powered=true] run fill 46 7 78 46 7 78 glowstone replace magma_block
execute if entity @e[scores={AdventureLevel=..10}] if block 46 7 78 glowstone run function d3:adventure/lights_on_upper

execute if entity @e[scores={AdventureLevel=..10}] if block 1033 94 1999 lever[powered=false] run fill 46 7 78 46 7 78 magma_block replace glowstone
execute if entity @e[scores={AdventureLevel=..10}] if block 46 7 78 magma_block run function d3:adventure/lights_off_upper


# SHOWER CURTAINS
execute if entity @e[scores={AdventureLevel=0}] if block 976 107 2058 air run setblock 976 107 2058 orange_wall_banner[facing=south]{Patterns:[{Pattern:"ss",Color:0},{Pattern:"ss",Color:0}]}
execute if entity @e[scores={AdventureLevel=0}] if block 978 107 2058 air run setblock 978 107 2058 white_wall_banner[facing=south]{Patterns:[{Pattern:"ss",Color:1},{Pattern:"ss",Color:1}]}
execute if entity @e[scores={AdventureLevel=0}] if block 980 107 2058 air run setblock 980 107 2058 orange_wall_banner[facing=south]{Patterns:[{Pattern:"ss",Color:0},{Pattern:"ss",Color:0}]}

execute if entity @e[scores={AdventureLevel=0}] if block 976 107 2052 air run setblock 976 107 2052 white_wall_banner[facing=north]{Patterns:[{Pattern:"ss",Color:1},{Pattern:"ss",Color:1}]}
execute if entity @e[scores={AdventureLevel=0}] if block 978 107 2052 air run setblock 978 107 2052 orange_wall_banner[facing=north]{Patterns:[{Pattern:"ss",Color:0},{Pattern:"ss",Color:0}]}
execute if entity @e[scores={AdventureLevel=0}] if block 980 107 2052 air run setblock 980 107 2052 white_wall_banner[facing=north]{Patterns:[{Pattern:"ss",Color:1},{Pattern:"ss",Color:1}]}


# REMOVE SPACE ZOMBIES
execute if entity @e[scores={AdventureLevel=0}] run fill 33 2 78 44 2 78 air replace zombie_head


########## ACT 1 #############

execute if entity @e[scores={AdventureLevel=0}] run team add Adventure
execute if entity @e[scores={AdventureLevel=0}] run team modify Adventure color blue
execute if entity @e[scores={AdventureLevel=0}] run team modify Adventure friendlyFire false

execute if entity @e[scores={AdventureLevel=0,AdventureTimer=1}] run kill @e[type=villager]
#execute if entity @e[scores={AdventureLevel=0,AdventureTimer=2}] run fill 993 106 2034 1007 106 2042 air replace orange_shulker_box
#execute if entity @e[scores={AdventureLevel=0,AdventureTimer=3}] run setblock 993 106 2034 orange_shulker_box[facing=up]
#execute if entity @e[scores={AdventureLevel=0,AdventureTimer=3}] run setblock 1007 106 2034 orange_shulker_box[facing=up]
#execute if entity @e[scores={AdventureLevel=0,AdventureTimer=3}] run setblock 993 106 2042 orange_shulker_box[facing=up]
#execute if entity @e[scores={AdventureLevel=0,AdventureTimer=3}] run setblock 1007 106 2042 orange_shulker_box[facing=up]


# ENTER BRANCH -> GET MAINTENANCE KEY
execute if entity @e[scores={AdventureLevel=0,AdventureTimer=10}] run replaceitem entity @a inventory.16 tripwire_hook{Key1:1b,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Maintenance Key\"}",Lore:['{"text":"In hand, this opens manual","italic":"true","color":"gold"}','{"text":"locks for Mechanical Access","italic":"true","color":"gold"}']}}


# DRILL OPERATING
execute if entity @e[scores={AdventureLevel=0}] run playsound entity.guardian.attack master @a 1000 54 2000 5 1 0
execute if entity @e[scores={AdventureLevel=0}] run particle cloud 1000 54 2000 10 10 10 0 100 force
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=..17}] run playsound entity.guardian.attack master @a 1000 54 2000 5 1 0

# LIGHTS OUT WHEN ENTER HALLWAY
execute if entity @e[scores={AdventureLevel=0}] unless block 1033 94 1995 lever[powered=false] run setblock 1033 94 1995 lever[face=wall,facing=west,powered=false]


# FAILSAFE FOR PLAYERS LOGGING OUT
tag @a remove AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=975,y=106,z=2050,dx=38,dy=5,dz=17] add AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=993,y=106,z=2027,dx=59,dy=5,dz=25] add AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=999,y=106,z=2024,dx=2,dy=5,dz=2] add AdventureBeginner

execute if entity @e[scores={AdventureLevel=0}] run scoreboard objectives add BeginAdventure dummy
scoreboard players add @e[tag=MainAdventureAEC] BeginAdventure 1
execute if entity @a[tag=AdventureBeginner] run scoreboard players set @e[tag=MainAdventureAEC] BeginAdventure 0

execute if entity @e[scores={AdventureLevel=0,BeginAdventure=17}] run scoreboard players set @e[scores={AdventureTimer=0..}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=0,BeginAdventure=17}] run scoreboard players set @e[scores={AdventureLevel=0}] AdventureLevel 1
execute if entity @e[scores={AdventureLevel=1}] run scoreboard objectives remove BeginAdventure

execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run setblock 1033 94 1999 lever[powered=false,face=wall,facing=west]
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=7}] run playsound block.beacon.deactivate master @a 1032 94 2006 100 0.5 1
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=7}] run playsound entity.iron_golem.hurt master @a 1032 94 2006 100 0.5 1

execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 999 106 2026 1001 108 2026 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 974 106 1999 974 108 2001 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 999 93 2026 1001 95 2026 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run scoreboard objectives remove UpperDoor1
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run kill @e[tag=AdventureDoor]



# FAILSAFE FOR IMPATIENT PLAYERS (I HATE THIS "FIX")
execute if entity @e[scores={AdventureLevel=0}] run fill 984 106 2012 984 111 2020 barrier replace air
execute if entity @e[scores={AdventureLevel=0}] run fill 1013 106 2015 1013 111 2022 barrier replace air
execute if entity @e[scores={AdventureLevel=1}] run fill 984 106 2012 984 111 2020 air replace barrier
execute if entity @e[scores={AdventureLevel=1}] run fill 1013 106 2015 1013 111 2022 air replace barrier


# FAILSAFE FOR IDIOTS
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=18..25}] run replaceitem entity @a[nbt=!{Inventory:[{id:"minecraft:tripwire_hook"}]}] inventory.16 tripwire_hook{Key1:1b,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Maintenance Key\"}",Lore:['{"text":"In hand, this opens manual","italic":"true","color":"gold"}','{"text":"locks for Mechanical Access","italic":"true","color":"gold"}']}}






# MEET BOSS FIRST TIME
execute align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] run scoreboard players set @e[scores={AdventureLevel=1}] AdventureTimer 0
execute align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] run scoreboard players set @e[scores={AdventureLevel=1}] AdventureLevel 2

execute if entity @e[scores={AdventureLevel=2,AdventureTimer=1}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=1}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Wait! You're not locked in?! Thank goodness!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=100}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=100}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Now we don't have to wait 3 hours for the system to reboot.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=250}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=250}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Do you think you could get to the generators in the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Room","color":"blue","bold":true,"underlined":false},{"text":" on the lower floor? You could probably access it from the ","color":"none","bold":false,"underlined":false},{"text":"Oxygen Shaft","color":"gray","bold":true,"underlined":false},{"text":" down the hall.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=450}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=450}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Those ","color":"none","bold":false,"underlined":false},{"text":"grates","color":"gray","bold":true,"underlined":false},{"text":" are usually locked so I hope to God you have your ","color":"none","bold":false,"underlined":false},{"text":"key","color":"gray","bold":true,"underlined":false},{"text":" on you. I told you not to lose it! Check your pockets.","color":"none","bold":false,"underlined":false}]


# IF MEETING DR ZOMBO BEFORE GENERATOR
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] run scoreboard players set @e[scores={AdventureLevel=..3}] AdventureTimer 0
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] run scoreboard players set @e[scores={AdventureLevel=..3}] AdventureLevel 4



execute if entity @e[scores={AdventureLevel=4,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh someone's not locked in!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Can you get to the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Room","color":"blue","bold":true,"underlined":false},{"text":" and turn on the generators so we don't have to wait for the reboot?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Since the power is out for the door, you'll have to get into there from the ","color":"none","bold":false,"underlined":false},{"text":"Oxygen Shaft","color":"gray","bold":true,"underlined":false},{"text":". The one you clean every week on your schedule.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=4,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"We'd all appreciate getting out of here earlier. Thanks.","color":"none","bold":false,"underlined":false}]


# EXIT SHAFT - INTO HALLWAY
execute if entity @e[scores={AdventureLevel=..4}] run fill 1041 93 2000 1041 94 2001 air replace iron_trapdoor
execute if entity @e[scores={AdventureLevel=..4}] run fill 1040 93 2000 1040 94 2000 iron_trapdoor[facing=west,half=bottom,open=true] replace air

execute align x align y align z if entity @a[x=1040,y=93,z=2000,dx=2,dy=3,dz=0,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] run scoreboard players set @e[scores={AdventureLevel=..4}] AdventureTimer 0
execute align x align y align z if entity @a[x=1040,y=93,z=2000,dx=2,dy=3,dz=0,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] run scoreboard players set @e[scores={AdventureLevel=..4}] AdventureLevel 5



execute if entity @e[scores={AdventureLevel=5,AdventureTimer=1}] run fill 1040 93 2000 1040 94 2000 air replace iron_trapdoor
execute if entity @e[scores={AdventureLevel=5,AdventureTimer=1}] run playsound block.iron_trapdoor.open master @a 1040 93 2000 1 1 0
execute if entity @e[scores={AdventureLevel=5,AdventureTimer=1}] run fill 1041 93 2000 1041 94 2000 iron_trapdoor[facing=north,half=bottom,open=true]

execute if entity @e[scores={AdventureLevel=5,AdventureTimer=3}] run fill 1041 93 2000 1041 94 2000 air replace iron_trapdoor
execute if entity @e[scores={AdventureLevel=5,AdventureTimer=3}] run playsound block.iron_trapdoor.open master @a 1040 93 2000 1 1.2 0
execute if entity @e[scores={AdventureLevel=5,AdventureTimer=3}] run fill 1041 93 2001 1041 94 2001 iron_trapdoor[facing=east,half=bottom,open=true]


# TALKING TO ZOMBO IF ONLY LOWER GENERATOR IS ON
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] if block 46 5 78 glowstone if block 46 7 78 magma_block run scoreboard players set @e[scores={AdventureLevel=..5}] AdventureTimer 0
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] if block 46 5 78 glowstone if block 46 7 78 magma_block run scoreboard players set @e[scores={AdventureLevel=..5}] AdventureLevel 6

execute if entity @e[scores={AdventureLevel=6,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=6,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh. Is the power back on? This door isn't working.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=6,AdventureTimer=140}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=6,AdventureTimer=140}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Can you get to the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Room","color":"blue","bold":true,"underlined":false},{"text":" and check if everything is on?","color":"none","bold":false,"underlined":false}]


# CEO MOVES FROM DOOR TO HIS OFFICE
execute if entity @e[scores={AdventureLevel=5..21}] if block 46 7 78 glowstone align x align y align z run tag @e[x=973,y=106,z=2000,dx=0,dy=1,dz=0,tag=AdventureCEO] add Walk2Chair1
execute as @e[tag=Walk2Chair1] at @s run teleport @s ^ ^ ^0.15 facing 968 106 1996
execute as @e[tag=Walk2Chair2] at @s run teleport @s ^ ^ ^0.15 facing 957 106 1996
execute as @e[tag=Walk2Chair3] at @s run teleport @s ^ ^ ^0.15 facing 958 106 2001
#execute as @e[tag=Walk2Chair4] at @s run teleport @s ^ ^ ^0.15 facing 968 106 1996
#execute as @e[tag=Walk2Chair1] at @s run teleport @s ^ ^ ^0.15 facing 968 106 1996

execute align x align y align z run tag @e[tag=Walk2Chair1,x=968,y=106,z=1996,dx=0,dy=1,dz=0] add Walk2Chair2
execute align x align y align z run tag @e[tag=Walk2Chair2,x=957,y=106,z=1996,dx=0,dy=1,dz=0] add Walk2Chair3
execute align x align y align z run tag @e[tag=Walk2Chair3,x=958,y=106,z=2001,dx=0,dy=1,dz=0] add Walk2Chair4
teleport @e[tag=Walk2Chair4] 958 106 2000 270 20


tag @e[tag=Walk2Chair2] remove Walk2Chair1
tag @e[tag=Walk2Chair3] remove Walk2Chair2
tag @e[tag=Walk2Chair4] remove Walk2Chair3
tag @e[tag=Walk2Chair4] remove Walk2Chair4




# 1.14 BLAST FURNACE UPDATE
fill 1033 96 1994 1033 97 2000 black_stained_glass replace iron_bars
fill 1034 94 1994 1034 97 2000 blast_furnace[facing=west] replace furnace


# TURN ON GENERATORS
execute if entity @e[scores={AdventureLevel=3..6}] if block 46 5 78 glowstone if block 46 7 78 glowstone run scoreboard players set @e[scores={AdventureLevel=..6}] AdventureLevel 7


# DR ZOMBO TALK ABOUT BROKEN DOOR
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] if block 46 5 78 glowstone if block 46 7 78 glowstone run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureTimer 0
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] if block 46 5 78 glowstone if block 46 7 78 glowstone run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureLevel 8



execute if entity @e[scores={AdventureLevel=8,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Good! You got the power back on!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=8,AdventureTimer=80}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=80}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Only problem is this ","color":"none","bold":false,"underlined":false},{"text":"Rec Room door","color":"dark_green","bold":true,"underlined":false},{"text":" is apparently malfunctioning.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=8,AdventureTimer=200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Some idiot blocked the manual door behind me, so we still can't get out of here. And you're the only one around here so...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=8,AdventureTimer=440}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=440}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I know you're a ","color":"none","bold":false,"underlined":false},{"text":"Maintenance Worker","color":"blue","bold":true,"underlined":false},{"text":", and you only have unsupervised access through ","color":"none","bold":false,"underlined":false},{"text":"green","color":"dark_green","bold":true,"underlined":false},{"text":" and ","color":"none","bold":false,"underlined":false},{"text":"blue level","color":"blue","bold":true,"underlined":false},{"text":" doors...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=8,AdventureTimer=670}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=670}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But you know what? You look trustworthy enough. Go into my ","color":"none","bold":false,"underlined":false},{"text":"Lab","color":"red","bold":true,"underlined":false},{"text":" from the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Hallway","color":"gray","bold":true,"underlined":false},{"text":". Then you'll need to get my ","color":"none","bold":false,"underlined":false},{"text":"Reprogramming Manual","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=8,AdventureTimer=900}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=900}] run tellraw @a ["",{"text":"Dr. Zombo whispers: ","color":"red","bold":false},{"text":"I trust you. Just remember \"F.A.T.P.O.D.\" - Fern, Allium, Tulip, Poppy, Orchid, Dandelion.","color":"none","bold":false,"italic":true}]


# LAB PUZZLE - FERN ALLIUM TULIP POPPY ORCHID DANDELION
execute if entity @e[scores={AdventureLevel=..4}] if block 965 93 2002 orange_shulker_box run setblock 965 93 2002 air

execute if entity @e[scores={AdventureLevel=5..8}] if block 965 93 2002 air run setblock 965 93 2002 orange_shulker_box[facing=up]{Items:[{Slot:1b,id:"minecraft:bread",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #26\",\"italic\":\"false\"}",Lore:['{"text":"Attempted bread from cloned wheat","italic":"true","color":"red"}']}}},{Slot:2b,id:"minecraft:scute",Count:10b,tag:{display:{Name:"{\"text\":\"Experiment #47B\",\"italic\":\"false\"}",Lore:['{"text":"Keratin sample","italic":"true","color":"red"}','{"text":"- possible compound?","italic":"true","color":"red"}']}}},{Slot:5b,id:"minecraft:dead_fire_coral",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #127\",\"italic\":\"false\"}",Lore:['{"text":"Mother specimen did not","italic":"true","color":"red"}','{"text":"survive outside containment","italic":"true","color":"red"}']}}},{Slot:6b,id:"minecraft:dead_fire_coral_fan",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #127-d\",\"italic\":\"false\"}",Lore:['{"text":"Daughter specimen did not","italic":"true","color":"red"}','{"text":"survive outside containment","italic":"true","color":"red"}']}}},{Slot:12b,id:"minecraft:large_fern",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #299\",\"italic\":\"false\"}",Lore:['{"text":"Mutated fern plant","italic":"true","color":"red"}']}}},{Slot:19b,id:"minecraft:gray_glazed_terracotta",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #13\",\"italic\":\"false\"}",Lore:['{"text":"Surface Rock","italic":"true","color":"red"}','{"text":"- possible fuel source?","italic":"true","color":"red"}']}}},{Slot:20b,id:"minecraft:orange_glazed_terracotta",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #13-1\",\"italic\":\"false\"}",Lore:['{"text":"Hybrid Surface Rock","italic":"true","color":"red"}','{"text":"- fused with Orange Alloy","italic":"true","color":"red"}']}}},{Slot:22b,id:"minecraft:grass",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #44\",\"italic\":\"false\"}",Lore:['{"text":"Grass","italic":"true","color":"red"}','{"text":"- organic growth","italic":"true","color":"red"}']}}},{Slot:23b,id:"minecraft:tall_grass",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #44-X\",\"italic\":\"false\"}",Lore:['{"text":"Grass","italic":"true","color":"red"}','{"text":"- mutation successful","italic":"true","color":"red"}']}}},{Slot:24b,id:"minecraft:seagrass",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #44-XW\",\"italic\":\"false\"}",Lore:['{"text":"Grass","italic":"true","color":"red"}','{"text":"- submerged mutation successful","italic":"true","color":"red"}']}}},{Slot:26b,id:"minecraft:dried_kelp",Count:1b,tag:{display:{Name:"{\"text\":\"Experiment #200\",\"italic\":\"false\"}",Lore:['{"text":"Specimen dried and flattened","italic":"true","color":"red"}']}}}]}

execute if entity @e[scores={AdventureLevel=..4}] unless block 962 94 2007 potted_poppy run setblock 962 94 2007 potted_poppy
execute if entity @e[scores={AdventureLevel=..4}] unless block 961 94 2007 potted_dandelion run setblock 961 94 2007 potted_dandelion
execute if entity @e[scores={AdventureLevel=..4}] unless block 960 94 2007 potted_fern run setblock 960 94 2007 potted_fern
execute if entity @e[scores={AdventureLevel=..4}] unless block 959 94 2007 potted_white_tulip run setblock 959 94 2007 potted_white_tulip
execute if entity @e[scores={AdventureLevel=..4}] unless block 958 94 2007 potted_allium run setblock 958 94 2007 potted_allium
execute if entity @e[scores={AdventureLevel=..4}] unless block 957 94 2007 potted_blue_orchid run setblock 957 94 2007 potted_blue_orchid

execute if entity @e[scores={AdventureLevel=7}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=7}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureLevel 9

execute if entity @e[scores={AdventureLevel=8}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..8}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=8}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..8}] AdventureLevel 11



# IF PLAYER SOLVES PUZZLE WITHOUT TALKING TO ZOMBO - 10
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5,nbt={Inventory:[{id:"minecraft:book"}]}] run scoreboard players set @e[scores={AdventureLevel=9}] AdventureTimer 0
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5,nbt={Inventory:[{id:"minecraft:book"}]}] run scoreboard players set @e[scores={AdventureLevel=9}] AdventureLevel 10



execute if entity @e[scores={AdventureLevel=10,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Was it you who turned on the power? Perfect.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=120}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=120}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Unfortunately, this door is malfunctioning, so we're still stuck in here.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=240}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=240}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Wait a sec... Where did you get that Reprogramming Manual?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=10,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh well, hold it right there.","color":"none","bold":false,"underlined":false}]


# SWITCH to 13
scoreboard players set @e[scores={AdventureLevel=10,AdventureTimer=410}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=10,AdventureTimer=-1}] AdventureLevel 13



# IF PLAYER SOLVES PUZZLE AFTER ZOMBO'S INSTRUCTIONS - 12
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5,nbt={Inventory:[{id:"minecraft:book",tag:{DoorBook:1b}}]}] run scoreboard players set @e[scores={AdventureLevel=11}] AdventureTimer 0
execute align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5,nbt={Inventory:[{id:"minecraft:book",tag:{DoorBook:1b}}]}] run scoreboard players set @e[scores={AdventureLevel=11}] AdventureLevel 12



execute if entity @e[scores={AdventureLevel=12,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=12,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You're back! With the ","color":"none","bold":false,"underlined":false},{"text":"Manual","color":"gray","bold":true,"underlined":false},{"text":"!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=12,AdventureTimer=120}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=12,AdventureTimer=120}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hold it up to me so I can see it.","color":"none","bold":false,"underlined":false}]

# SWITCH to 13
scoreboard players set @e[scores={AdventureLevel=12,AdventureTimer=130}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=12,AdventureTimer=-1}] AdventureLevel 13


# MECHANIC FOR HOLDING BOOK TO ZOMBO - 13
execute if entity @e[scores={AdventureLevel=..12}] run teleport @e[tag=DrZombo] 1000 93 2027
execute if entity @e[scores={AdventureLevel=..4}] unless block 951 93 1984 orange_shulker_box run setblock 951 93 1984 orange_shulker_box
#execute if entity @e[scores={AdventureLevel=..4}] run data merge block 951 93 1984 {Items: [{Slot: 10b, id: "minecraft:book", Count: 1b, tag: {DoorBook:1b, display: {Name: "{\"text\":\"Door Reprogramming Manual\",\"italic\":\"true\"}"}}}]}

execute if entity @e[scores={AdventureLevel=..4}] unless block 951 93 1984 orange_shulker_box run setblock 951 93 1984 orange_shulker_box[facing=up]


#['{"text":"Soft Building Material","italic":"true","color":"red"}']

#['{"text":"Hybrid Surface Rock","italic":"true","color":"red"}','{"text":"- fused with Orange Alloy","italic":"true","color":"red"}']

execute if entity @e[scores={AdventureLevel=..4}] run data merge block 951 93 1984 {Items:[{Slot:0b,id:"minecraft:prismarine_crystals",Count:7b,tag:{display:{Name:"{\"text\":\"Prototype Light Shard\",\"italic\":\"false\"}"}}},{Slot:4b,id:"minecraft:stripped_acacia_wood",Count:8b,tag:{display:{Name:"{\"text\":\"Soft Building Material\",\"italic\":\"false\"}"}}},{Slot:6b,id:"minecraft:observer",Count:24b,tag:{display:{Name:"{\"text\":\"Power Conduit\",\"italic\":\"false\"}"}}},{Slot:7b,id:"minecraft:redstone_torch",Count:15b,tag:{display:{Name:"{\"text\":\"Research Marker\",\"italic\":\"false\"}"}}},{Slot:10b,id:"minecraft:book",Count:1b,tag:{DoorBook:1b,display:{Name:"{\"text\":\"Door Reprogramming Manual\",\"italic\":\"false\"}"}}},{Slot:12b,id:"minecraft:emerald",Count:17b,tag:{display:{Name:"{\"text\":\"Ancient Currency\",\"italic\":\"false\"}"}}},{Slot:16b,id:"minecraft:cobblestone_wall",Count:13b,tag:{display:{Name:"{\"text\":\"Marker Post\",\"italic\":\"false\"}"}}},{Slot:18b,id:"minecraft:feather",Count:1b,tag:{display:{Name:"{\"text\":\"ZomboTickler™\",\"italic\":\"false\",\"color\":\"gold\"}"}}},{Slot:20b,id:"minecraft:orange_stained_glass",Count:1b,tag:{display:{Name:"{\"text\":\"Prototype A.S.T.R.O. Helmet II\",\"italic\":\"false\",\"color\":\"gold\"}"}}},{Slot:23b,id:"minecraft:sea_lantern",Count:3b,tag:{display:{Name:"{\"text\":\"Prototype Improved Light Source\",\"italic\":\"false\"}"}}},{Slot:25b,id:"minecraft:redstone_lamp",Count:21b,tag:{display:{Name:"{\"text\":\"Power Node\",\"italic\":\"false\"}"}}},{Slot:26b,id:"minecraft:red_sand",Count:9b,tag:{display:{Name:"{\"text\":\"Comparator Lock\",\"italic\":\"false\"}"}}}]}

tag @a remove HasAdvManual
execute if entity @e[scores={AdventureLevel=13}] align x align y align y align z run tag @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5,x_rotation=-10..15,y_rotation=0..40,nbt={SelectedItem:{id:"minecraft:book",tag:{DoorBook:1b}}}] add HasAdvManual



execute if entity @e[scores={AdventureLevel=13,AdventureTimer=30}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing 998 93 2026
execute if entity @e[scores={AdventureLevel=13,AdventureTimer=60..75}] as @e[tag=DrZombo] at @s run teleport @s ~-0.1 ~ ~0.02
execute if entity @e[scores={AdventureLevel=13,AdventureTimer=90}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=13,AdventureTimer=90}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasAdvManual]

execute if entity @e[scores={AdventureLevel=..12}] run scoreboard objectives remove HoldUpBook
execute if entity @e[scores={AdventureLevel=13,AdventureTimer=90..}] run scoreboard objectives add HoldUpBook dummy
execute if entity @a[tag=HasAdvManual] run scoreboard players set @e[scores={HoldUpBook=..-1}] HoldUpBook 0
execute if entity @a[tag=HasAdvManual] run scoreboard players add @e[tag=MainAdventureAEC] HoldUpBook 1
execute unless entity @a[tag=HasAdvManual] run scoreboard players set @e[scores={HoldUpBook=1..}] HoldUpBook 0
execute unless entity @a[tag=HasAdvManual] run scoreboard players remove @e[tag=MainAdventureAEC] HoldUpBook 1


tag @e remove DrZomboSeeBook
tag @e remove DrZomboSeeBox
execute if entity @e[scores={HoldUpBook=..-10}] run tag @e[tag=DrZombo] add DrZomboSeeBook

execute if entity @e[scores={HoldUpBook=50}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=70}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=90}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=140}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=160}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=280}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=300}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=430}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=450}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=610}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=620}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=720}] run tag @e[tag=DrZombo] add DrZomboSeeBook
execute if entity @e[scores={HoldUpBook=730}] run tag @e[tag=DrZombo] add DrZomboSeeBox

execute if entity @e[scores={HoldUpBook=800}] run tag @e[tag=DrZombo] add DrZomboSeeBook


execute if entity @e[scores={HoldUpBook=-35}] at @e[tag=DrZombo] run playsound entity.villager.no master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=-35}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hold the ","color":"none","bold":false,"underlined":false},{"text":"Manual","color":"gray","bold":true,"underlined":false},{"text":" where I can see it please.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HoldUpBook=-185}] at @e[tag=DrZombo] run playsound entity.villager.no master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=-185}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Seriously. I need to read the instructions. So I can reprogram this thing.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HoldUpBook=-350}] at @e[tag=DrZombo] run playsound entity.villager.no master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=-350}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Okay then. I guess we'll just die in here.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HoldUpBook=-600}] at @e[tag=DrZombo] run playsound entity.villager.no master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=-600}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, I guess we're not getting out of here then.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=40}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=40}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you. Just keep it there.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=130}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=130}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Okay. Let's see here.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Do this here...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=370}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=370}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Then move this thing out of the way...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=490}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=490}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Punching in... 4 8 15 16 23 42...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=620}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=620}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Two shakes of a turkey's leg...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HoldUpBook=800}] at @e[tag=DrZombo] run playsound entity.villager.yes master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={HoldUpBook=800}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"And there we go! Thanks.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=13}] as @e[tag=DrZomboSeeBook] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=13}] as @e[tag=DrZomboSeeBook] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasAdvManual]
execute if entity @e[scores={AdventureLevel=13}] as @e[tag=DrZomboSeeBox] at @s run teleport @s ~ ~ ~ 180 10

execute if entity @e[scores={HoldUpBook=800}] run scoreboard players set @e[tag=MainAdventureAEC] AdventureTimer 0
execute if entity @e[scores={HoldUpBook=800}] run scoreboard players set @e[tag=MainAdventureAEC] AdventureLevel 15
execute if entity @e[scores={AdventureLevel=15..}] run scoreboard objectives remove HoldUpBook


execute if entity @e[scores={AdventureLevel=15,AdventureTimer=15}] as @e[tag=TrappedVillager] at @s run playsound entity.villager.yes master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=15,AdventureTimer=1..15}] as @e[tag=TrappedVillager] at @s run teleport @s ^ ^ ^ facing 1000 94 2026
execute if entity @e[scores={AdventureLevel=15,AdventureTimer=16..100}] as @e[tag=TrappedVillager] at @s run teleport @s ^ ^ ^ facing entity @p


# MOVE ZOMBO TO LAB - 15
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab1
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab2
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab3
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab4
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab5
execute if entity @e[scores={AdventureLevel=..14}] run tag @e remove Rec2Lab6
execute if entity @e[scores={AdventureLevel=13,AdventureTimer=90..}] run teleport @e[tag=DrZombo] 998.9 93 2027.8
execute if entity @e[scores={AdventureLevel=15,AdventureTimer=100}] run tag @e[tag=DrZombo] add Rec2Lab1

execute as @e[tag=Rec2Lab1] at @s run teleport @s ^ ^ ^0.15 facing 1001 93 2027
execute as @e[tag=Rec2Lab2] at @s run teleport @s ^ ^ ^0.15 facing 1000 93 2023
execute as @e[tag=Rec2Lab3] at @s run teleport @s ^ ^ ^0.15 facing 982 93 2016
execute as @e[tag=Rec2Lab4] at @s run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=Rec2Lab5] at @s run teleport @s ^ ^ ^0.15 facing 976 93 1999
execute as @e[tag=Rec2Lab6] at @s run teleport @s ^ ^ ^0.15 facing 966 93 1998

tag @e[tag=Rec2Lab2] remove Rec2Lab1
tag @e[tag=Rec2Lab3] remove Rec2Lab2
tag @e[tag=Rec2Lab4] remove Rec2Lab3
tag @e[tag=Rec2Lab5] remove Rec2Lab4
tag @e[tag=Rec2Lab6] remove Rec2Lab5

execute if entity @e[scores={AdventureLevel=15}] align x align y align z as @e[tag=DrZombo,x=1001,y=93,z=2027,dx=0,dy=0,dz=0] run tag @s add Rec2Lab2
execute align x align y align z run tag @e[tag=Rec2Lab1,x=1001,y=93,z=2027,dx=0,dy=0,dz=0] add Rec2Lab2
execute align x align y align z run tag @e[tag=Rec2Lab2,x=1000,y=93,z=2023,dx=0,dy=0,dz=0] add Rec2Lab3
execute align x align y align z run tag @e[tag=Rec2Lab3,x=982,y=93,z=2016,dx=0,dy=0,dz=0] add Rec2Lab4
execute if entity @e[tag=DrZombo,tag=Rec2Lab3] run scoreboard players set @e[tag=MainAdventureAEC] AdventureTimer -1
execute if entity @e[tag=DrZombo,tag=Rec2Lab3] run scoreboard players set @e[tag=MainAdventureAEC] AdventureLevel 16

execute if entity @e[scores={AdventureLevel=16,AdventureTimer=10}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 5 1 0
execute if entity @e[scores={AdventureLevel=16,AdventureTimer=10}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Come with me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=16,AdventureTimer=70..}] at @e[tag=DrZombo] if entity @a[distance=..3] run tag @e[tag=Rec2Lab4] add Rec2Lab5

execute if entity @e[scores={AdventureLevel=16}] align x align y align z if entity @e[tag=DrZombo,x=976,y=93,z=2000,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=16}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=16}] align x align y align z if entity @e[tag=DrZombo,x=976,y=93,z=2000,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=16}] AdventureLevel 20

execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run tag @e[tag=Rec2Lab5] add Rec2Lab6
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I'll leave my ","color":"none","bold":false,"underlined":false},{"text":"Lab door","color":"red","bold":true,"underlined":false},{"text":" open for you.","color":"none","bold":false,"underlined":false}] 



# OPENS LAB DOOR
execute if entity @e[scores={AdventureLevel=..19}] run fill 974 93 1999 974 95 2001 white_stained_glass replace air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run playsound entity.generic.burn master @a 974 94 2000 0.2 1.5 0
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run playsound entity.evoker.cast_spell master @a 974 94 2000 0.2 1.3 0
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run setblock 974 95 2001 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=2}] run setblock 974 95 2000 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=3}] run setblock 974 95 1999 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=4}] run setblock 974 94 1999 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=5}] run setblock 974 94 2000 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=6}] run setblock 974 94 2001 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=7}] run setblock 974 93 2001 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=8}] run setblock 974 93 2000 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=9}] run setblock 974 93 1999 air
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=10..}] run fill 974 93 1999 974 95 2001 air replace white_stained_glass

execute align x align y align z if entity @e[tag=Rec2Lab6,x=966,y=93,z=1998,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=20}] AdventureTimer 0
execute align x align y align z if entity @e[tag=Rec2Lab6,x=966,y=93,z=1998,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=20}] AdventureLevel 21

execute if entity @e[scores={AdventureLevel=21,AdventureTimer=1}] run tag @e remove Rec2Lab6
execute if entity @e[scores={AdventureLevel=21..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p


# ZOMBO THANKS PLAYER
execute if entity @e[scores={AdventureLevel=21,AdventureTimer=50..}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=21}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=21,AdventureTimer=-1}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=21}] AdventureLevel 22

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=20}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=20}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you very much. I'm not sure what happened to the power, but you should go check with ","color":"none","bold":false,"underlined":false},{"text":"Mr. Gagarin","color":"yellow","bold":true,"underlined":false},{"text":" to see if everything is okay up there.","color":"none","bold":false,"underlined":false}] 

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The Lift","color":"gray","bold":true,"underlined":false},{"text":" should be online again. I'll look over the other systems to see what happened.","color":"none","bold":false,"underlined":false}] 

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=330}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=330}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You impressed me. I may have some special work for you later.","color":"none","bold":false,"underlined":false}]




# RECEPTION SAYS GO IN
execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=5,dy=4,dz=14] run scoreboard objectives add ReceptionTimer dummy
execute if entity @e[scores={AdventureLevel=22,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Remek> ","color":"dark_green","bold":false},{"text":"Go on in. ","color":"none","bold":false,"underlined":false},{"text":"Mr. Gagarin","color":"yellow","bold":true,"underlined":false},{"text":" has been waiting to see you.","color":"none","bold":false,"underlined":false}] 
execute if entity @e[scores={AdventureLevel=23}] run scoreboard objectives remove ReceptionTimer


# PLAYER SEES CEO AFTER LIGHTS COME ON
execute if entity @e[scores={AdventureLevel=..4}] run teleport @e[tag=AdventureCEO] 973 106 2000
execute if entity @e[scores={AdventureLevel=22}] run fill 966 106 1996 966 108 1998 air replace white_stained_glass
execute if entity @e[scores={AdventureLevel=22}] run teleport @e[tag=AdventureCEO] 958 106 2000
execute if entity @e[scores={AdventureLevel=22..24}] as @e[tag=AdventureCEO] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=965,y=106,z=1996,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=22}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=965,y=106,z=1996,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=22}] AdventureLevel 23

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Come in! Come in!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=100}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=100}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Excellent excellent work! The power's back on, and I know it had to have been you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=230}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=230}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Due to your competence, I think you may be cut out for something a little more capable than ","color":"none","bold":false,"underlined":false},{"text":"Maintenance","color":"blue","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=370}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=370}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"I'm promoting you to ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=470}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=470}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"You'll have immediate access through ","color":"none","bold":false,"underlined":false},{"text":"orange level","color":"gold","bold":true,"underlined":false},{"text":" doors. You'll report directly to ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":" with any of your findings here.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=650}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=650}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Now, I haven't been able to make any contact with the ","color":"none","bold":false,"underlined":false},{"text":"Communication Station","color":"gray","bold":true,"underlined":false},{"text":" yet. So that may be offline.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=830}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=830}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"So for your first task with this new position, I need you to go ","color":"none","bold":false,"underlined":false},{"text":"suit up","color":"gold","bold":true,"underlined":false},{"text":" and head outside to see what's going on over there. The system may need resetting.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1060}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1060}] run tellraw @a ["",{"text":"<Mr. Gagarin> ","color":"yellow","bold":false},{"text":"Oh, and you can keep that ","color":"none","bold":false,"underlined":false},{"text":"Maintenance Key","color":"gray","bold":true,"underlined":false},{"text":". Just in case the power goes out again. Haha.","color":"none","bold":false,"underlined":false}]



# ACCESS TO ASTROSUIT
scoreboard players set @e[scores={AdventureLevel=23,AdventureTimer=1060..}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=23,AdventureTimer=-1}] AdventureLevel 24


execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureOckels] run data merge entity @s {NoAI:false}
execute if entity @e[scores={AdventureLevel=..26}] as @e[tag=AdventureOckels] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=7..}] run teleport @e[tag=AdventureOckels] 1035 106 1995
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureOckels] run data merge entity @s {NoAI:true}
execute if entity @e[scores={AdventureLevel=27}] as @e[tag=AdventureOckels] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=7..26}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing 1037 106 1994

execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureFarkas] run data merge entity @s {NoAI:false}
execute if entity @e[scores={AdventureLevel=..26}] as @e[tag=AdventureFarkas] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=7..}] run teleport @e[tag=AdventureFarkas] 1034 106 2006
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureFarkas] run data merge entity @s {NoAI:true}
execute if entity @e[scores={AdventureLevel=27}] as @e[tag=AdventureFarkas] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=7..26}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing 1037 106 2006

execute if entity @e[scores={AdventureLevel=..26}] run fill 1029 107 1996 1029 109 1997 air replace iron_bars
execute if entity @e[scores={AdventureLevel=..26}] run fill 1029 107 1996 1029 109 1997 air replace white_stained_glass_pane
execute if entity @e[scores={AdventureLevel=..26}] run fill 1029 107 1996 1029 109 1997 air replace orange_stained_glass_pane
execute if entity @e[scores={AdventureLevel=..26}] run fill 1030 107 1995 1030 107 1995 orange_stained_glass_pane replace air
execute if entity @e[scores={AdventureLevel=..26}] run fill 1030 108 1995 1030 108 1995 white_stained_glass_pane replace air
execute if entity @e[scores={AdventureLevel=..26}] run fill 1030 109 1995 1030 109 1995 orange_stained_glass_pane replace air

execute unless block 1029 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1029 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1030 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1030 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1031 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1031 107 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]

execute unless block 1029 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1029 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1030 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1030 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1031 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1031 108 1993 white_stained_glass_pane[east=true,west=true,north=false,south=false]

execute unless block 1029 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1029 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1030 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1030 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]
execute unless block 1031 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false] run setblock 1031 109 1993 orange_stained_glass_pane[east=true,west=true,north=false,south=false]

execute unless block 1028 107 1993 orange_stained_glass_pane[east=true,west=false,north=false,south=true] run setblock 1028 107 1993 orange_stained_glass_pane[east=true,west=false,north=false,south=true]
execute unless block 1028 108 1993 white_stained_glass_pane[east=true,west=false,north=false,south=true] run setblock 1028 108 1993 white_stained_glass_pane[east=true,west=false,north=false,south=true]
execute unless block 1028 109 1993 orange_stained_glass_pane[east=true,west=false,north=false,south=true] run setblock 1028 109 1993 orange_stained_glass_pane[east=true,west=false,north=false,south=true]

execute unless block 1032 107 1993 orange_stained_glass_pane[east=false,west=true,north=false,south=true] run setblock 1032 107 1993 orange_stained_glass_pane[east=false,west=true,north=false,south=true]
execute unless block 1032 108 1993 white_stained_glass_pane[east=false,west=true,north=false,south=true] run setblock 1032 108 1993 white_stained_glass_pane[east=false,west=true,north=false,south=true]
execute unless block 1032 109 1993 orange_stained_glass_pane[east=false,west=true,north=false,south=true] run setblock 1032 109 1993 orange_stained_glass_pane[east=false,west=true,north=false,south=true]


# IF SEEING ZOMBO BEFORE ASTROSUIT
execute if entity @e[scores={AdventureLevel=24}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=24}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=24}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=24}] AdventureLevel 25

execute if entity @e[scores={AdventureLevel=25,AdventureTimer=10}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=25,AdventureTimer=10}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Did you see ","color":"none","bold":false,"underlined":false},{"text":"the Boss","color":"yellow","bold":true,"underlined":false},{"text":"? By your smile, it looks like he had some good news for you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=25,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=25,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Come see me later. I am still trying to figure out what caused the power failure.","color":"none","bold":false,"underlined":false}]


# GETTING ASTROSUIT
execute if entity @e[scores={AdventureLevel=24..26}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run scoreboard players set @e[scores={AdventureLevel=24..26}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=24..26}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run scoreboard players set @e[scores={AdventureLevel=24..26}] AdventureLevel 27

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=1..239}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=5}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=5}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Hey Farkas. Looks like we've got ourselves some fresh blood for the ","color":"none","bold":false,"underlined":false},{"text":"Research Team","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=110..379}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=120}] at @e[tag=AdventureFarkas] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=120}] run tellraw @a ["",{"text":"<Farkas> ","color":"dark_green","bold":false},{"text":"Oh really? Didn't know we were doing new research on how to scrub toilets. Hahahaha!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=240}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureFarkas,limit=1]
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=250}] at @e[tag=AdventureOckels] run playsound entity.villager.no master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=250}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Shut up Farkas. Or do you want me to tell the whole place how you peed your pants because you didn't have a nightlight during the power outage?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=380}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=380}] at @e[tag=AdventureFarkas] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=440..}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=450}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=450}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"And this is him on a ","color":"none","bold":false,"underlined":false},{"text":"good","color":"none","bold":false,"italic":true},{"text":" day. Just try to ignore him. Step into the glass box.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run fill 1030 107 1995 1030 109 1995 air
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 107 1996 orange_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 108 1996 white_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 109 1996 orange_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run fill 1029 107 1997 1029 109 1997 iron_bars[north=true]
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run playsound block.iron_trapdoor.open master @a 1030 108 1995 1 1 0




# AFTER GETTING SUIT
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=..129}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=..129}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=1}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=1}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Pretty cool eh?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50..149}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50..149}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50}] at @e[tag=AdventureFarkas] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50}] run tellraw @a ["",{"text":"<Farkas> ","color":"dark_green","bold":false},{"text":"Oh yeah. Real cool. Not like, we've seen it a hundred times before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=130}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureFarkas,limit=1]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=140}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=140}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Shut up, Farkas.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=170}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=170}] at @e[tag=AdventureFarkas] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=190..579}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=190..579}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=200}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=200}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Anyway, it's all automatic. And as part of ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":", you can access it anytime you need.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=340}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=340}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"So now that you have your ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":" on, the ","color":"none","bold":false,"underlined":false},{"text":"Airlocks","color":"gray","bold":true,"underlined":false},{"text":" will open for you. Then you can head outside and record your findings for ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=500..599}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=500..599}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=505}] at @e[tag=AdventureFarkas] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=505}] run tellraw @a ["",{"text":"<Farkas> ","color":"dark_green","bold":false},{"text":"Yeah. Just don't do anything stupid, like die!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureFarkas,limit=1]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Shut up, Farkas!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=600}] as @e[tag=AdventureFarkas] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=600}] at @e[tag=AdventureFarkas] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=620..}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=620..}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=650}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=650}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Actually, yeah. Don't die. That would not be good for you. ","color":"none","bold":false,"underlined":false},{"text":"Airlock","color":"gray","bold":true,"underlined":false},{"text":" down the hall, opposite the ","color":"none","bold":false,"underlined":false},{"text":"Lift","color":"gray","bold":true,"underlined":false},{"text":", should also be working again.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=800}] at @e[tag=AdventureOckels] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=800}] run tellraw @a ["",{"text":"<Ockels> ","color":"dark_green","bold":false},{"text":"Just make sure you've got the gear on. ","color":"none","bold":false,"underlined":false},{"text":"Airlock","color":"gray","bold":true,"underlined":false},{"text":" only opens when we're wearing the ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]



execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run scoreboard objectives add UpperDoor3 dummy
execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run playsound entity.generic.burn master @a 961 107 1992 0.2 1.5 0
execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run playsound entity.evoker.cast_spell master @a 961 107 1992 0.2 1.3 0

execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] align x align y align z run tag @e[tag=AdventureCEO,x=958,y=106,z=2000,dx=0,dy=0,dz=0] add WalkFromChair

execute if entity @e[scores={AdventureLevel=25..30}] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor3 0

execute align x align y align z run tag @e[x=957,y=106,z=2004,dx=0,dy=0,dz=0] remove WalkFromChair

execute as @e[tag=WalkFromChair] at @s run teleport @s ^ ^ ^0.15 facing 957 106 2004


# IF SEEING ZOMBO BEFORE ASTROSUIT
execute if entity @e[scores={AdventureLevel=28}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=28}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=28}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=28}] AdventureLevel 29

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] align x align y align z if entity @a[tag=HasSuit,x=968,y=93,z=1993,dx=5,dy=4,dz=14] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, I see you got a promotion. The ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":" looks good on you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] align x align y align z unless entity @a[tag=HasSuit,x=968,y=93,z=1993,dx=5,dy=4,dz=14] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, it sounds like Farkas and Ockels fired off the ","color":"none","bold":false,"underlined":false},{"text":"A.S.T.R.O. Suit","color":"gold","bold":true,"underlined":false},{"text":" chamber again. You got a promotion didn't you?","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=29,AdventureTimer=150}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=150}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I guess that means, you report to me now. And you can freely head outside!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=320}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=320}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hey, when you were talking to ","color":"none","bold":false,"underlined":false},{"text":"Mr. Gagarin","color":"yellow","bold":true,"underlined":false},{"text":", did he mention anything about the ","color":"none","bold":false,"underlined":false},{"text":"Communication Station","color":"gray","bold":true,"underlined":false},{"text":"?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=500}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=500}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It's odd, but I'm not getting any response from them. Perhaps you could head over there and find out why.","color":"none","bold":false,"underlined":false}]



# TO ACT 2
execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureLevel 40

execute if entity @e[scores={AdventureLevel=..40}] if block 937 141 2112 iron_block run setblock 937 141 2112 clay

execute if entity @e[scores={AdventureLevel=20..42}] run fill 930 136 2083 930 136 2083 air replace redstone_torch
execute if entity @e[scores={AdventureLevel=20..39}] run fill 940 135 2088 950 135 2102 air replace comparator
