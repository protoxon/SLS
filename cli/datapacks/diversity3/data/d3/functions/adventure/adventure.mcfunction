####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / SEPTEMBER 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AdventureDeath
#scoreboard objectives setdisplay sidebar AdventureLevel
#scoreboard objectives setdisplay sidebar AdventureTimer
#scoreboard objectives setdisplay sidebar AdventureToilet
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
#scoreboard objectives setdisplay sidebar PullPlayer
#scoreboard objectives setdisplay sidebar GravityASAge
#scoreboard objectives setdisplay sidebar SuitReturns
#scoreboard objectives setdisplay sidebar LowGravityItem
#scoreboard objectives setdisplay sidebar SuitOff
#scoreboard objectives setdisplay sidebar EndWoolMotion


# BRING STRAGGLERS
execute if block 1 4 2 orange_wool run gamemode adventure @a[tag=!InAdventureBranch,tag=!D3Admin]
execute if block 1 4 2 orange_wool run spawnpoint @a[tag=!InAdventureBranch] 1000 106 2024
execute if block 1 4 2 orange_wool run teleport @a[tag=!InAdventureBranch] 1000 106 2024 0 0
execute if block 1 4 2 orange_wool run clear @a[tag=!InAdventureBranch]
execute if block 1 4 2 orange_wool run tag @a add InAdventureBranch


# UNNECCESSARY SPAWNPOINTS
scoreboard objectives add AdventureDeath deathCount

# OUTSIDE ROOM
execute align x align y align z run spawnpoint @a[x=999,y=106,z=2023,dx=2,dy=2,dz=2] 1000 106 2024
execute align x align y align z run teleport @a[x=1000,y=106,z=2024,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1000 106 2024 180 0
execute align x align y align z run scoreboard players reset @a[x=1000,y=106,z=2024,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath


# BASE AIRLOCK
execute align x align y align z run spawnpoint @a[x=1009,y=106,z=1965,dx=2,dy=2,dz=2] 1010 106 1970
execute align x align y align z run teleport @a[x=1010,y=106,z=1970,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1010 106 1970 90 0
execute align x align y align z run scoreboard players reset @a[x=1010,y=106,z=1970,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

execute align x align y align z run spawnpoint @a[x=1009,y=106,z=1953,dx=2,dy=2,dz=2] 1010 106 1950
execute align x align y align z run teleport @a[x=1010,y=106,z=1950,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1010 106 1950 90 0
execute align x align y align z run scoreboard players reset @a[x=1010,y=106,z=1950,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath


# COM STATION AIRLOCK
execute align x align y align z run spawnpoint @a[x=943,y=144,z=2111,dx=2,dy=2,dz=2] 941 144 2112
execute align x align y align z run teleport @a[x=941,y=144,z=2112,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 941 144 2112 90 0
execute align x align y align z run scoreboard players reset @a[x=941,y=144,z=2112,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

execute align x align y align z run spawnpoint @a[x=955,y=144,z=2111,dx=2,dy=2,dz=2] 960 144 2112
execute align x align y align z run teleport @a[x=960,y=144,z=2112,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 960 144 2112 180 0
execute align x align y align z run scoreboard players reset @a[x=960,y=144,z=2112,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath


# LAUNCH BAY AIRLOCK
execute align x align y align z run spawnpoint @a[x=862,y=104,z=2040,dx=2,dy=2,dz=2] 866 104 2041
execute align x align y align z run teleport @a[x=866,y=104,z=2041,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 866 104 2041 270 0
execute align x align y align z run scoreboard players reset @a[x=866,y=104,z=2041,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

execute align x align y align z run spawnpoint @a[x=850,y=104,z=2040,dx=2,dy=2,dz=2] 848 104 2041
execute align x align y align z run teleport @a[x=848,y=104,z=2041,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 848 104 2041 90 0
execute align x align y align z run scoreboard players reset @a[x=848,y=104,z=2041,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath


# DIG SITE AIRLOCK
execute align x align y align z run spawnpoint @a[x=926,y=95,z=2084,dx=2,dy=2,dz=2] 927 95 2083
#execute align x align y align z run teleport @a[x=927,y=95,z=2083,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1010 106 1970 0 0
execute align x align y align z run scoreboard players reset @a[x=927,y=95,z=2083,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

execute align x align y align z run spawnpoint @a[x=926,y=93,z=2096,dx=2,dy=3,dz=2] 927 94 2101
#execute align x align y align z run teleport @a[x=927,y=94,z=2101,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 927 94 2101 0 0
execute align x align y align z run scoreboard players reset @a[x=927,y=94,z=2101,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath


# CRATER AIRLOCK
execute align x align y align z run spawnpoint @a[x=1026,y=79,z=1977,dx=2,dy=4,dz=2] 1027 81 1975
execute align x align y align z run teleport @a[x=1027,y=81,z=1975,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1027 81 1975 180 0
execute align x align y align z run scoreboard players reset @a[x=1027,y=81,z=1975,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

execute align x align y align z run spawnpoint @a[x=1026,y=79,z=1989,dx=2,dy=2,dz=2] 1024 79 1994
execute align x align y align z run teleport @a[x=1024,y=79,z=1994,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] 1024 79 1994 90 0
execute align x align y align z run scoreboard players reset @a[x=1024,y=79,z=1994,dx=0,dy=0,dz=0,scores={AdventureDeath=1..}] AdventureDeath

#1008 106 1965


#scoreboard players reset @a[scores={AdventureDeath=10..}] AdventureDeath


# GENERATORS STAY ON AFTER 7
execute if entity @e[scores={AdventureLevel=7..}] if block 1033 94 1995 lever[powered=false] run setblock 1033 94 1995 lever[face=wall,facing=west,powered=true]
execute if entity @e[scores={AdventureLevel=7..}] if block 1033 94 1999 lever[powered=false] run setblock 1033 94 1999 lever[face=wall,facing=west,powered=true]


# FUNCTION ACTS
execute if entity @e[scores={AdventureLevel=0..39}] run function d3:adventure/act1
execute if entity @e[scores={AdventureLevel=40..99}] run function d3:adventure/act2
execute if entity @e[scores={AdventureLevel=100..199}] run function d3:adventure/act3
execute if entity @e[scores={AdventureLevel=200..}] run function d3:adventure/epilogue


execute if entity @e[scores={AdventureLevel=0}] run tag @a remove AntiGravity

execute if entity @e[scores={AdventureLevel=..199}] run team join Adventure @a

tag @a remove HasSuit
tag @a[nbt={Inventory:[{Slot:100b,id:"minecraft:leather_boots",tag:{display:{color:16777215}}},{Slot:101b,id:"minecraft:leather_leggings",tag:{display:{color:16777215}}},{Slot:102b,id:"minecraft:leather_chestplate",tag:{display:{color:16777215}}},{Slot:103b,id:"minecraft:player_head"}]}] add HasSuit


# ANTI GRAVITY EFFECT
effect clear @a[tag=!AntiGravity] slow_falling
effect clear @a[tag=!AntiGravity] jump_boost
effect clear @a[tag=!AntiGravity] slowness
effect give @e[tag=AntiGravity] slow_falling 1 1 true
effect give @e[tag=AntiGravity] jump_boost 1 1 true
effect give @a[tag=AntiGravity] slowness 1 1 true


# PLANET RING GRAVITY PULL
tag @a remove GravityPull
execute as @a at @s if block ~ ~ ~ structure_void run tag @s[gamemode=adventure] add GravityPull

execute if entity @a[tag=GravityPull] run scoreboard objectives add PullPlayer dummy
execute unless entity @a[tag=GravityPull] run scoreboard objectives remove PullPlayer
execute as @a at @s if block ~ ~ ~ structure_void run scoreboard players add @s PullPlayer 1
effect give @a[tag=GravityPull,scores={PullPlayer=15..}] levitation 1 1 true
#execute as @a[tag=AntiGravity,tag=!GravityPull] run effect clear @s levitation
execute at @a[scores={PullPlayer=150}] run summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,Marker:true,DisabledSlots:2039583,Tags:["GravityAS"]}
execute as @e[tag=GravityAS] at @s run teleport @s ^ ^ ^0.15 facing 930 180 2042

execute if entity @e[tag=GravityAS] run scoreboard objectives add GravityASAge dummy
execute unless entity @e[tag=GravityAS] run scoreboard objectives remove GravityASAge
scoreboard players add @e[tag=GravityAS] GravityASAge 0
execute as @e[tag=GravityAS] at @s if block ~ ~ ~ air run scoreboard players set @s[scores={GravityASAge=0}] GravityASAge 1
scoreboard players add @e[tag=GravityAS,scores={GravityASAge=1..}] GravityASAge 1

tag @e remove ClearGravityAS
execute as @e[tag=GravityAS] at @s if block ~1 ~ ~ air if block ~-1 ~ ~ air if block ~ ~ ~1 air if block ~ ~ ~-1 air if block ~ ~ ~ air run tag @s add ClearGravityAS
execute as @e[tag=GravityAS] at @s if block ~ ~ ~ structure_void run tag @s add ClearGravityAS

execute at @e[tag=GravityAS] as @a[tag=GravityPull,distance=..2] run teleport @s ~ ~ ~
execute at @e[tag=ClearGravityAS] as @a[distance=..2] run teleport @s ~ ~ ~
execute at @e[tag=GravityAS,scores={GravityASAge=..40}] run effect give @a[distance=..2] levitation 1 1 true
kill @e[tag=GravityAS,scores={GravityASAge=60..}]

#execute at @e[tag=GravityAS] as @a[tag=GravityPull,sort=nearest,scores={PullPlayer=150..}] run teleport @s ~ ~ ~
#execute unless entity @a[tag=GravityPull] if entity @e[tag=GravityAS] run kill @e[tag=GravityAS]



# SUIT RETURNS
execute at @a[tag=AntiGravity] as @e[type=item,distance=..2,nbt={Item:{id:"minecraft:leather_boots"}}] run tag @s add ReturnSuit
execute at @a[tag=AntiGravity] as @e[type=item,distance=..2,nbt={Item:{id:"minecraft:leather_leggings"}}] run tag @s add ReturnSuit
execute at @a[tag=AntiGravity] as @e[type=item,distance=..2,nbt={Item:{id:"minecraft:leather_chestplate"}}] run tag @s add ReturnSuit
execute at @a[tag=AntiGravity] as @e[type=item,distance=..2,nbt={Item:{id:"minecraft:player_head"}}] run tag @s add ReturnSuit
execute if entity @e[tag=ReturnSuit] run scoreboard objectives add SuitReturns dummy
execute unless entity @e[tag=ReturnSuit] run scoreboard objectives remove SuitReturns
scoreboard players add @e[tag=ReturnSuit] SuitReturns 1
execute as @e[scores={SuitReturns=0..49}] run data merge entity @s[nbt=!{NoGravity:true}] {NoGravity:true}
execute if entity @a[tag=AntiGravity,tag=!HasSuit] as @e[scores={SuitReturns=50..}] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute unless entity @a[tag=AntiGravity,tag=!HasSuit] as @e[scores={SuitReturns=50..}] run data merge entity @s {Motion:[0.0d,-0.1d,0.0d]}
execute as @e[scores={SuitReturns=50..}] at @s run teleport @s ^ ^ ^0.2 facing entity @p[tag=AntiGravity,tag=!HasSuit] eyes


# OBJECT / WOOL EFFECTS
execute if entity @e[scores={AdventureLevel=..64}] run scoreboard objectives remove CreepyWool
execute if entity @e[scores={AdventureLevel=66..}] run scoreboard objectives remove CreepyWool

tag @e[type=item,nbt={Item:{id:"minecraft:orange_wool"}}] add OrangeWool
execute if entity @e[scores={AdventureLevel=60..67}] as @e[tag=OrangeWool,nbt=!{Item:{display:{Name:"{\"italic\":\"false\",\"color\":\"gold\",\"text\":\"The Object\"}"}}}] run data merge entity @s {Item:{tag:{display:{Name:"{\"italic\":\"false\",\"color\":\"gold\",\"text\":\"The Object\"}"}}}}

execute if entity @e[scores={AdventureLevel=110..}] as @e[tag=OrangeWool,nbt=!{Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"bold\":\"true\",\"text\":\"The Zombocron\"}",Lore:['{"text":"Destroy it in the Crater?","italic":"true","color":"white"}','{"text":"Or leave with it in the Shuttle?","italic":"true","color":"white"}']}}}}] run data merge entity @s {Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"bold\":\"true\",\"text\":\"The Zombocron\"}",Lore:['{"text":"Destroy it in the Crater?","italic":"true","color":"white"}','{"text":"Or leave with it in the Shuttle?","italic":"true","color":"white"}']}}}}



#summon item ~ ~1 ~ {Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"bold\":\"true\",\"text\":\"The Zombocron\"}",Lore:['{"text":"Destroy it in the Crater?","italic":"true","color":"white"}','{"text":"Or leave with it in the Shuttle?","italic":"true","color":"white"}']}}}}



execute if entity @e[scores={AdventureLevel=61}] if entity @e[tag=OrangeWool] run scoreboard objectives add ObjectReturns dummy
execute if entity @e[scores={AdventureLevel=65..67}] at @a[tag=AntiGravity] if entity @e[tag=OrangeWool,distance=..2] run scoreboard objectives add ObjectReturns dummy
execute unless entity @e[tag=OrangeWool] run scoreboard objectives remove ObjectReturns
scoreboard players add @e[tag=OrangeWool] ObjectReturns 1

execute if entity @e[scores={AdventureLevel=61}] as @e[scores={ObjectReturns=1}] run data merge entity @s {NoGravity:true}
execute if entity @e[scores={AdventureLevel=61}] as @e[scores={ObjectReturns=1..49}] run data merge entity @s {Motion:[0.0d,0.02d,0.0d]}
execute if entity @e[scores={AdventureLevel=61}] run scoreboard players set @e[scores={ObjectReturns=49}] ObjectReturns 2
execute if entity @e[scores={AdventureLevel=61}] as @e[scores={ObjectReturns=1..}] at @s unless block ~ ~1 ~ air run scoreboard players set @e[scores={ObjectReturns=40..49}] ObjectReturns 50
execute if entity @e[scores={AdventureLevel=61}] as @e[scores={ObjectReturns=50..}] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}

execute if entity @e[scores={AdventureLevel=65..67}] as @e[scores={ObjectReturns=1}] run data merge entity @s {NoGravity:true}
execute if entity @e[scores={AdventureLevel=65..67}] as @e[scores={ObjectReturns=50..}] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute if entity @e[scores={AdventureLevel=65..67}] as @e[scores={ObjectReturns=50..}] at @s run teleport @s ^ ^ ^0.3 facing entity @p[tag=AntiGravity] eyes


# DOESN'T WORK ON ITEMS? -> effect give @e[nbt={Item:{id:"orange_wool"}}] glowing 1 1
#effect give @e[nbt={Item:{id:"orange_wool"}}] glowing 1 1



# LOW GRAVITY ITEMS
execute at @a[tag=AntiGravity] as @e[type=item,tag=!ReturnSuit,tag=!Zombocron,tag=!OrangeWool,distance=..2] run tag @s add LowGravityItem
execute if entity @e[scores={AdventureLevel=150..199}] at @a[tag=AntiGravity] as @e[type=item,tag=!ReturnSuit,distance=..2] run tag @s add LowGravityItem
execute if entity @e[tag=LowGravityItem] run scoreboard objectives add LowGravityItem dummy
execute unless entity @e[tag=LowGravityItem] run scoreboard objectives remove LowGravityItem
scoreboard players add @e[tag=LowGravityItem] LowGravityItem 1
execute as @e[scores={LowGravityItem=0..49}] run data merge entity @s[nbt=!{NoGravity:true}] {NoGravity:true}
execute as @e[scores={LowGravityItem=50..}] run data merge entity @s {Motion:[0.0d,-0.1d,0.0d]}

execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=OrangeWool] at @s if block ~ ~ ~ structure_void run scoreboard objectives add EndWoolMotion dummy
execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=OrangeWool] at @s unless block ~ ~ ~ structure_void run scoreboard objectives add EndWoolMotion dummy
execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=OrangeWool] at @s if block ~ ~ ~ structure_void run scoreboard players add @s EndWoolMotion 1
execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=OrangeWool,scores={EndWoolMotion=120..}] run tag @s remove LowGravityItem
execute if entity @e[scores={AdventureLevel=150..160}] as @e[tag=OrangeWool,scores={EndWoolMotion=120..}] run data merge entity @s {NoGravity:false}

execute as @e[type=item,nbt={Age:10s}] run data merge entity @s {Age:-32768s}



# SUIT OFF IN SPACE
execute if entity @e[scores={AdventureLevel=..199}] if entity @a[tag=AntiGravity,tag=!HasSuit] run scoreboard objectives add SuitOff dummy
execute as @a[tag=AntiGravity,tag=!HasSuit] run scoreboard players add @s SuitOff 1
execute at @a[scores={SuitOff=1}] run playsound entity.generic.burn master @a[scores={SuitOff=1}] ~ ~ ~ 1 0.7 0
execute at @a[scores={SuitOff=1..4}] run particle cloud ~ ~1 ~ 0.1 0.1 0.1 0 1 force
execute at @a[scores={SuitOff=1..}] run playsound item.elytra.flying master @a[scores={SuitOff=8}] ~ ~ ~ 10 0.5 0
#execute at @a[scores={SuitOff=1..}] run playsound item.elytra.flying master @a[scores={SuitOff=28}] ~ ~ ~ 10 0.5 0
effect give @a[tag=AntiGravity,tag=!HasSuit] slowness 2 255 true
effect clear @a[tag=AntiGravity,tag=!HasSuit] jump_boost
effect give @a[tag=AntiGravity,tag=!HasSuit] jump_boost 4 128 true
effect give @a[tag=AntiGravity,tag=!HasSuit] blindness 4 255 true
effect give @a[tag=AntiGravity,tag=!HasSuit] night_vision 1 255 true
effect give @a[tag=AntiGravity,tag=!HasSuit] nausea 6 10 true
effect give @a[scores={SuitOff=6}] wither 1 1 true
execute as @a[tag=HasSuit,scores={SuitOff=1..}] run stopsound @s
execute at @a[tag=HasSuit,scores={SuitOff=1..}] run playsound entity.item.pickup master @a[scores={SuitOff=1..}] ~ ~ ~ 1 0.5 0
execute at @a[tag=HasSuit,scores={SuitOff=1..}] run playsound entity.generic.burn master @a[scores={SuitOff=1..}] ~ ~ ~ 1 0.8 0
execute at @a[tag=HasSuit,scores={SuitOff=1..}] run playsound entity.spider.death master @a[scores={SuitOff=1..}] ~ ~ ~ 1 0.5 0
execute at @a[tag=HasSuit,scores={SuitOff=1..}] run playsound entity.elder_guardian.death master @a[scores={SuitOff=1..}] ~ ~ ~ 1 0.5 0
scoreboard players set @a[scores={SuitOff=40..}] SuitOff 5
execute unless entity @a[tag=AntiGravity,tag=!HasSuit] run scoreboard objectives remove SuitOff


# MONITORS
function d3:adventure/monitor_screens


# DOORS
execute if block 46 5 78 glowstone run function d3:adventure/lower_doors
execute if block 46 7 78 glowstone run function d3:adventure/upper_doors


# AIR LOCK 1 -> MAIN BAY
tag @a remove Airlock1
execute if entity @e[scores={AdventureLevel=28..}] align x align y align z run tag @a[x=1007,y=106,z=1953,dx=6,dy=4,dz=14] add Airlock1
execute if entity @a[tag=Airlock1,tag=HasSuit] run scoreboard objectives add Airlock1FailSafe dummy
scoreboard players add @e[tag=MainAdventureAEC] Airlock1FailSafe 0
execute if entity @a[tag=Airlock1] unless entity @a[tag=Airlock1,tag=!HasSuit] run scoreboard players add @e[tag=MainAdventureAEC] Airlock1FailSafe 1
execute unless entity @a[tag=Airlock1] run scoreboard players remove @e[tag=MainAdventureAEC] Airlock1FailSafe 1
execute if entity @a[tag=Airlock1] run scoreboard players set @e[scores={Airlock1FailSafe=..-1}] Airlock1FailSafe 0
execute unless entity @a[tag=Airlock1] run scoreboard players set @e[scores={Airlock1FailSafe=1..}] Airlock1FailSafe -1
execute if entity @e[scores={Airlock1FailSafe=-1000..}] run function d3:adventure/airlock1
execute if entity @e[scores={Airlock1FailSafe=..-10}] run scoreboard objectives remove Airlock1FailSafe
execute if entity @e[scores={Airlock1FailSafe=..-1}] if block 1010 106 1963 air run scoreboard objectives add AL1SDoorCloses dummy
execute if entity @e[scores={Airlock1FailSafe=..-1}] if block 1010 106 1957 air run scoreboard objectives add AL1NDoorCloses dummy
execute if entity @e[scores={Airlock1FailSafe=..-1}] run scoreboard objectives remove AL1SouthtoNorth
execute if entity @e[scores={Airlock1FailSafe=..-1}] run scoreboard objectives remove AL1NorthtoSouth


# AIR LOCK 2 -> COMMUNICATIONS
tag @a remove Airlock2
execute if entity @e[scores={AdventureLevel=28..}] align x align y align z run tag @a[x=943,y=144,z=2109,dx=14,dy=4,dz=6] add Airlock2
execute if entity @a[tag=Airlock2,tag=HasSuit] run scoreboard objectives add Airlock2FailSafe dummy
scoreboard players add @e[tag=MainAdventureAEC] Airlock2FailSafe 0
execute if entity @a[tag=Airlock2] run scoreboard players add @e[tag=MainAdventureAEC] Airlock2FailSafe 1
execute unless entity @a[tag=Airlock2] run scoreboard players remove @e[tag=MainAdventureAEC] Airlock2FailSafe 1
execute if entity @a[tag=Airlock2] run scoreboard players set @e[scores={Airlock2FailSafe=..-1}] Airlock2FailSafe 0
execute unless entity @a[tag=Airlock2] run scoreboard players set @e[scores={Airlock2FailSafe=1..}] Airlock2FailSafe -1
execute if entity @e[scores={Airlock2FailSafe=-1000..}] run function d3:adventure/airlock2
execute if entity @e[scores={Airlock2FailSafe=..-10}] run scoreboard objectives remove Airlock2FailSafe
execute if entity @e[scores={Airlock2FailSafe=..-1}] if block 953 144 2112 air run scoreboard objectives add AL2EDoorCloses dummy
execute if entity @e[scores={Airlock2FailSafe=..-1}] if block 947 144 2112 air run scoreboard objectives add AL2WDoorCloses dummy
execute if entity @e[scores={Airlock2FailSafe=..-1}] run scoreboard objectives remove AL2EasttoWest
execute if entity @e[scores={Airlock2FailSafe=..-1}] run scoreboard objectives remove AL2WesttoEast


# AIR LOCK 3 -> MAIN BAY DRILL CHAMBER
tag @a remove Airlock3
execute if entity @e[scores={AdventureLevel=28..}] align x align y align z run tag @a[x=1024,y=79,z=1977,dx=6,dy=4,dz=14] add Airlock3
execute if entity @a[tag=Airlock3,tag=HasSuit] run scoreboard objectives add Airlock3FailSafe dummy
scoreboard players add @e[tag=MainAdventureAEC] Airlock3FailSafe 0
execute if entity @a[tag=Airlock3,tag=HasSuit] run scoreboard players add @e[tag=MainAdventureAEC] Airlock3FailSafe 1
execute unless entity @a[tag=Airlock3] run scoreboard players remove @e[tag=MainAdventureAEC] Airlock3FailSafe 1
execute if entity @a[tag=Airlock3] run scoreboard players set @e[scores={Airlock3FailSafe=..-1}] Airlock3FailSafe 0
execute unless entity @a[tag=Airlock3] run scoreboard players set @e[scores={Airlock3FailSafe=1..}] Airlock3FailSafe -1
execute if entity @e[scores={Airlock3FailSafe=-1000..}] run function d3:adventure/airlock3
execute if entity @e[scores={Airlock3FailSafe=..-10}] run scoreboard objectives remove Airlock3FailSafe
execute if entity @e[scores={Airlock3FailSafe=..-1}] if block 1027 79 1987 air run scoreboard objectives add AL3SDoorCloses dummy
execute if entity @e[scores={Airlock3FailSafe=..-1}] if block 1027 79 1981 air run scoreboard objectives add AL3NDoorCloses dummy
execute if entity @e[scores={Airlock3FailSafe=..-1}] run scoreboard objectives remove AL3SouthtoNorth
execute if entity @e[scores={Airlock3FailSafe=..-1}] run scoreboard objectives remove AL3NorthtoSouth


# AIR LOCK 4 -> LAUNCH BAY
tag @a remove Airlock4
execute if entity @e[scores={AdventureLevel=28..}] align x align y align z run tag @a[x=850,y=104,z=2038,dx=14,dy=4,dz=6] add Airlock4
execute if entity @a[tag=Airlock4,tag=HasSuit] run scoreboard objectives add Airlock4FailSafe dummy
scoreboard players add @e[tag=MainAdventureAEC] Airlock4FailSafe 0
execute if entity @a[tag=Airlock4] run scoreboard players add @e[tag=MainAdventureAEC] Airlock4FailSafe 1
execute unless entity @a[tag=Airlock4] run scoreboard players remove @e[tag=MainAdventureAEC] Airlock4FailSafe 1
execute if entity @a[tag=Airlock4] run scoreboard players set @e[scores={Airlock4FailSafe=..-1}] Airlock4FailSafe 0
execute unless entity @a[tag=Airlock4] run scoreboard players set @e[scores={Airlock4FailSafe=1..}] Airlock4FailSafe -1
execute if entity @e[scores={Airlock4FailSafe=-1000..}] run function d3:adventure/airlock4
execute if entity @e[scores={Airlock4FailSafe=..-10}] run scoreboard objectives remove Airlock4FailSafe
execute if entity @e[scores={Airlock4FailSafe=..-1}] if block 860 104 2041 air run scoreboard objectives add AL4EDoorCloses dummy
execute if entity @e[scores={Airlock4FailSafe=..-1}] if block 854 104 2041 air run scoreboard objectives add AL4WDoorCloses dummy
execute if entity @e[scores={Airlock4FailSafe=..-1}] run scoreboard objectives remove AL4EasttoWest
execute if entity @e[scores={Airlock4FailSafe=..-1}] run scoreboard objectives remove AL4WesttoEast


# AIR LOCK 5 -> CAVE
tag @a remove Airlock5
execute if entity @e[scores={AdventureLevel=28..}] align x align y align z run tag @a[x=924,y=95,z=2084,dx=6,dy=4,dz=14] add Airlock5
execute if entity @a[tag=Airlock5,tag=HasSuit] run scoreboard objectives add Airlock5FailSafe dummy
scoreboard players add @e[tag=MainAdventureAEC] Airlock5FailSafe 0
execute if entity @a[tag=Airlock5,tag=HasSuit] run scoreboard players add @e[tag=MainAdventureAEC] Airlock5FailSafe 1
execute unless entity @a[tag=Airlock5] run scoreboard players remove @e[tag=MainAdventureAEC] Airlock5FailSafe 1
execute if entity @a[tag=Airlock5] run scoreboard players set @e[scores={Airlock5FailSafe=..-1}] Airlock5FailSafe 0
execute unless entity @a[tag=Airlock5] run scoreboard players set @e[scores={Airlock5FailSafe=1..}] Airlock5FailSafe -1
execute if entity @e[scores={Airlock5FailSafe=-1000..}] run function d3:adventure/airlock5
execute if entity @e[scores={Airlock5FailSafe=..-10}] run scoreboard objectives remove Airlock5FailSafe
execute if entity @e[scores={Airlock5FailSafe=..-1}] if block 927 95 2094 air run scoreboard objectives add AL5SDoorCloses dummy
execute if entity @e[scores={Airlock5FailSafe=..-1}] if block 927 95 2088 air run scoreboard objectives add AL5NDoorCloses dummy
execute if entity @e[scores={Airlock5FailSafe=..-1}] run scoreboard objectives remove AL5SouthtoNorth
execute if entity @e[scores={Airlock5FailSafe=..-1}] run scoreboard objectives remove AL5NorthtoSouth



# INSIDE DEPRESSURE MAIN
execute if entity @e[scores={AL1SouthtoNorth=0..}] if block 1010 106 1957 air align x align y align z run tag @a[x=1007,y=106,z=1958,dx=6,dy=4,dz=4] add AntiGravity
execute if entity @e[scores={AL1NorthtoSouth=105..}] unless block 1010 106 1957 air align x align y align z run tag @a[x=1007,y=106,z=1958,dx=6,dy=4,dz=4] remove AntiGravity

# INSIDE DEPRESSURE COMMUNICATIONS
execute if entity @e[scores={AL2EasttoWest=0..}] if block 947 144 2112 air align x align y align z run tag @a[x=948,y=144,z=2109,dx=4,dy=4,dz=6] add AntiGravity
execute if entity @e[scores={AL2WesttoEast=105..}] unless block 947 144 2112 air align x align y align z run tag @a[x=948,y=144,z=2109,dx=4,dy=4,dz=6] remove AntiGravity

# INSIDE DEPRESSURE DRILLING
execute if entity @e[scores={AL3NorthtoSouth=0..}] if block 1027 79 1987 air align x align y align z run tag @a[x=1024,y=79,z=1982,dx=6,dy=4,dz=4] add AntiGravity
execute if entity @e[scores={AL3SouthtoNorth=105..}] unless block 1027 79 1987 air align x align y align z run tag @a[x=1024,y=79,z=1982,dx=6,dy=4,dz=4] remove AntiGravity

# INSIDE DEPRESSURE LAUNCH BAY
execute if entity @e[scores={AL4WesttoEast=0..}] if block 860 104 2041 air align x align y align z run tag @a[x=855,y=104,z=2038,dx=4,dy=4,dz=6] add AntiGravity
execute if entity @e[scores={AL4EasttoWest=105..}] unless block 860 104 2041 air align x align y align z run tag @a[x=855,y=104,z=2038,dx=4,dy=4,dz=6] remove AntiGravity

# INSIDE DEPRESSURE CAVE
execute if entity @e[scores={AL5NorthtoSouth=0..}] if block 927 95 2094 air align x align y align z run tag @a[x=924,y=95,z=2089,dx=6,dy=4,dz=4] add AntiGravity
execute if entity @e[scores={AL5SouthtoNorth=105..}] unless block 927 95 2094 air align x align y align z run tag @a[x=924,y=95,z=2089,dx=6,dy=4,dz=4] remove AntiGravity


effect give @e[tag=ShulkerVatorMob] invisibility 1000000 255 true



# OPENS UPPER OXYGEN SHAFT
execute if entity @e[scores={AdventureLevel=..2}] run fill 999 108 1968 1000 109 1968 air replace iron_trapdoor
execute if entity @e[scores={AdventureLevel=..2}] run fill 1000 108 1967 1000 109 1967 iron_trapdoor[facing=north,half=bottom,open=true] replace air

execute align x align y align z if entity @a[x=1000,y=106,z=1967,dx=0,dy=4,dz=1,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] if block 999 108 1968 air run scoreboard objectives add UpperO2Door dummy
execute align x align y align z if entity @a[x=1000,y=106,z=1967,dx=0,dy=4,dz=1,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] run scoreboard players set @e[scores={AdventureLevel=..2}] AdventureTimer 0
execute align x align y align z if entity @a[x=1000,y=106,z=1967,dx=0,dy=4,dz=1,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] run scoreboard players set @e[scores={AdventureLevel=..2}] AdventureLevel 3
scoreboard players add @e[tag=MainAdventureAEC] UpperO2Door 1

execute if entity @e[scores={UpperO2Door=1}] run fill 1000 108 1967 1000 109 1967 air replace iron_trapdoor
execute if entity @e[scores={UpperO2Door=1}] run playsound block.iron_trapdoor.open master @a 1000 108 1967 1 1 0
execute if entity @e[scores={UpperO2Door=1}] run fill 1000 108 1968 1000 109 1968 iron_trapdoor[facing=east,half=bottom,open=true]

execute if entity @e[scores={UpperO2Door=3}] run fill 1000 108 1968 1000 109 1968 air replace iron_trapdoor
execute if entity @e[scores={UpperO2Door=3}] run playsound block.iron_trapdoor.open master @a 1000 108 1967 1 1.2 0
execute if entity @e[scores={UpperO2Door=3}] run fill 999 108 1968 999 109 1968 iron_trapdoor[facing=south,half=bottom,open=true]
execute if entity @e[scores={UpperO2Door=3..}] run scoreboard objectives remove UpperO2Door

# OPENS LOWER OXYGEN SHAFT
execute if entity @e[scores={AdventureLevel=..2}] run fill 999 95 1968 1000 96 1968 air replace iron_trapdoor
execute if entity @e[scores={AdventureLevel=..2}] run fill 1000 95 1967 1000 96 1967 iron_trapdoor[facing=north,half=bottom,open=true] replace air

execute align x align y align z if entity @a[x=1000,y=93,z=1967,dx=0,dy=4,dz=1,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] if block 999 95 1968 air run scoreboard objectives add LowerO2Door dummy
scoreboard players add @e[tag=MainAdventureAEC] LowerO2Door 1

execute if entity @e[scores={LowerO2Door=1}] run fill 1000 95 1967 1000 96 1967 air replace iron_trapdoor
execute if entity @e[scores={LowerO2Door=1}] run playsound block.iron_trapdoor.open master @a 1000 95 1967 1 1 0
execute if entity @e[scores={LowerO2Door=1}] run fill 1000 95 1968 1000 96 1968 iron_trapdoor[facing=east,half=bottom,open=true]

execute if entity @e[scores={LowerO2Door=3}] run fill 1000 95 1968 1000 96 1968 air replace iron_trapdoor
execute if entity @e[scores={LowerO2Door=3}] run playsound block.iron_trapdoor.open master @a 1000 95 1967 1 1.2 0
execute if entity @e[scores={LowerO2Door=3}] run fill 999 95 1968 999 96 1968 iron_trapdoor[facing=south,half=bottom,open=true]
execute if entity @e[scores={LowerO2Door=3..}] run scoreboard objectives remove LowerO2Door


# MECHANICAL DOORS
execute align x align y align z if entity @a[x=1031,y=93,z=1991,dx=0,dy=1,dz=2,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] unless block 1031 91 1992 redstone_torch run setblock 1031 91 1992 redstone_torch
execute align x align y align z unless entity @a[x=1031,y=93,z=1991,dx=0,dy=1,dz=2,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] unless block 1031 91 1992 air run setblock 1031 91 1992 air

#execute align x align y align z if entity @a[x=999,y=93,z=2037,dx=0,dy=1,dz=2] unless block 999 91 2038 redstone_torch run setblock 999 91 2038 redstone_torch
#execute align x align y align z unless entity @a[x=999,y=93,z=2037,dx=0,dy=1,dz=2] unless block 999 91 2038 air run setblock 999 91 2038 air

execute align x align y align z if entity @a[x=965,y=93,z=2007,dx=0,dy=1,dz=2,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] unless block 965 91 2008 redstone_torch run setblock 965 91 2008 redstone_torch
execute align x align y align z unless entity @a[x=965,y=93,z=2007,dx=0,dy=1,dz=2,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key1:1b}}}] unless block 965 91 2008 air run setblock 965 91 2008 air


# TOILET
execute if entity @e[tag=AdventureToilet] if block 986 106 2058 birch_door[open=true] run scoreboard objectives add AdventureToilet dummy
execute unless block 986 106 2058 birch_door[open=true] run scoreboard objectives remove AdventureToilet
scoreboard players add @e[tag=MainAdventureAEC] AdventureToilet 1
execute unless entity @e[scores={AdventureToilet=1..}] as @e[tag=AdventureToilet] at @s run teleport @s ~ ~ ~ ~ 40
execute if entity @e[scores={AdventureToilet=2..}] as @e[tag=AdventureToilet] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureToilet=5}] at @e[tag=AdventureToilet] run playsound entity.villager.trade master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureToilet=37}] if block 986 106 2058 birch_door[open=true] run setblock 986 104 2058 redstone_torch
execute if entity @e[scores={AdventureToilet=39}] run setblock 986 104 2058 air


# BAR FRIDGE
execute unless block 961 106 2006 iron_door[facing=west,half=upper,hinge=left,open=true] run setblock 961 106 2006 iron_door[facing=west,half=upper,hinge=left,open=true]

# ASTROSUIT LAMP
execute unless block 1027 109 2007 iron_trapdoor[half=bottom,open=false] run setblock 1027 109 2007 iron_trapdoor[half=bottom,open=false]
execute unless block 1027 108 2006 iron_trapdoor[facing=north,half=top,open=true] run setblock 1027 108 2006 iron_trapdoor[facing=north,half=top,open=true]
execute unless block 1028 108 2007 iron_trapdoor[facing=east,half=top,open=true] run setblock 1028 108 2007 iron_trapdoor[facing=east,half=top,open=true]

# DISPLAY CASES
execute if entity @e[scores={AdventureLevel=..22}] unless entity @e[tag=AdventureDisplay1] run summon armor_stand 972.15 92.65 2007.05 {Invisible:true,Invulnerable:true,NoGravity:true,ShowArms:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:fire_coral",Count:1b}],Pose:{RightArm:[270f,0f,0f]},DisabledSlots:2039583,Tags:["AdventureDisplay1"]}

#execute if entity @e[scores={AdventureLevel=..22}] unless entity @e[tag=AdventureDisplay2] run summon armor_stand 970.15 92.65 2007.05 {Invisible:true,Invulnerable:true,NoGravity:true,ShowArms:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:orange_wool",Count:1b}],Pose:{RightArm:[270f,0f,0f]},DisabledSlots:2039583,Tags:["AdventureDisplay2"]}

execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=AdventureDisplay2] run kill @e[tag=Zombocron]
execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=Zombocron] run kill @e[tag=AdventureDisplay2]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=2..}] unless entity @e[tag=AdventureDisplay2] run summon armor_stand 970 92.68 2006  {Invisible:true,Invulnerable:true,NoGravity:true,DisabledSlots:2039583,Tags:["AdventureDisplay2"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:orange_wool",Count:1b},Age:-32768s,PickupDelay:32767,NoGravity:true,Tags:["Zombocron"]}]}

#execute if entity @e[scores={AdventureLevel=52..,AdventureTimer=1}] unless entity @e[tag=AdventureDisplay3] run summon armor_stand 968.15 92.65 2007.05 {Invisible:true,Invulnerable:true,NoGravity:true,ShowArms:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:sea_pickle",Count:1b}],Pose:{RightArm:[270f,0f,0f]},DisabledSlots:2039583,Tags:["AdventureDisplay3"]}

execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=AdventureDisplay3AS] run kill @e[tag=AdventureDisplay3FB]
execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=AdventureDisplay3FB] run kill @e[tag=AdventureDisplay3AS]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1..}] unless entity @e[tag=AdventureDisplay3] run summon armor_stand 968 92.55 2006 {Invisible:true,Invulnerable:true,NoGravity:true,Rotation:[180f,0f],Tags:["AdventureDisplay3AS","AdventureDisplay3"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:sea_pickle"},Tags:["AdventureDisplay3","AdventureDisplay3Block"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


# TOWER ADVANCEMENT
execute align x align y align z run advancement grant @a[gamemode=adventure,x=937,y=203,z=2112,dx=0,dy=1,dz=0] only d3:folder_b/scalable

# COMPARATOR ADVANCEMENT
execute if entity @e[scores={AdventureLevel=..39}] if block 938 137 2087 structure_void run setblock 938 137 2087 air
execute if entity @e[scores={AdventureLevel=41}] if block 938 137 2087 air run advancement grant @a only d3:folder_b/engineer

# DONKEY KONG ADVANCEMENT
execute if block 46 5 78 glowstone if block 1004 94 2036 stone_button[powered=true] unless entity @e[tag=AdvDKGame] run summon painting 1005 95 2036 {Motive:"minecraft:donkey_kong",Facing:2b,Invulnerable:true,Tags:["AdvDKGame"]}
execute if block 46 5 78 glowstone if block 1003 94 2036 stone_button[powered=true] unless entity @e[tag=AdvDKGame] run summon painting 1005 95 2036 {Motive:"minecraft:donkey_kong",Facing:2b,Invulnerable:true,Tags:["AdvDKGame"]}
execute if entity @e[tag=AdvDKGame] if block 1003 94 2036 stone_button[powered=true] align x align y align z run advancement grant @a[x=999,y=93,z=2031,dx=8,dy=4,dz=6] only d3:folder_c/hardcore_gamer
execute if entity @e[tag=AdvDKGame] if block 1004 94 2036 stone_button[powered=true] align x align y align z run advancement grant @a[x=999,y=93,z=2031,dx=8,dy=4,dz=6] only d3:folder_c/hardcore_gamer
execute if block 1003 94 2036 stone_button[powered=true] run setblock 1003 94 2036 stone_button[face=floor,facing=north,powered=false]
execute if block 1004 94 2036 stone_button[powered=true] run setblock 1004 94 2036 stone_button[face=floor,facing=north,powered=false]

execute unless entity @e[tag=NintendoPlug] run summon item_frame 1007 93 2036 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: 1b, Item: {id: "minecraft:iron_trapdoor", Count: 1b}, Tags:["NintendoPlug"]}
execute as @e[tag=NintendoPlug] run data merge entity @s[nbt=!{ItemRotation:0b}] {ItemRotation:0b}

# SUITLESS ADVANCEMENT
execute if entity @e[scores={AdventureLevel=..199}] run advancement grant @a[tag=AntiGravity,tag=!HasSuit] only d3:folder_c/suitless



scoreboard objectives add AdventureLevel dummy
scoreboard players add @e[tag=MainAdventureAEC] AdventureLevel 0

scoreboard objectives add AdventureTimer dummy
scoreboard players add @e[tag=MainAdventureAEC] AdventureTimer 1


# ELEVATOR
execute if block 46 5 78 glowstone if block 46 7 78 glowstone run function d3:adventure/elevator


tag @a add DoorLevel1
tag @a add DoorLevel2


# NPCs
execute if entity @e[scores={AdventureLevel=..99}] as @e[tag=AdventureVillager,tag=!AdventureFuglesang,nbt=!{CustomNameVisible:true}] at @s if entity @a[distance=..9] run data merge entity @s {CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=..99}] as @e[tag=AdventureVillager,tag=!AdventureFuglesang,nbt={CustomNameVisible:true}] at @s unless entity @a[distance=..9] run data merge entity @s {CustomNameVisible:false}



# ASTROSUIT
execute unless entity @e[tag=AstroSuit] run summon armor_stand 1036 108 2000 {NoGravity:true,NoBasePlate:true,Invulnerable:true,ShowArms:true,Pose:{RightArm:[0.0f,0.0f,140.0f],LeftLeg:[0.0f,0.0f,320.0f],LeftArm:[0.0f,0.0f,220.0f],RightLeg:[0.0f,0.0f,40.0f]},Rotation:[90.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],DisabledSlots:2039583,Tags:["AstroSuit"]}


# OPENS LAB BEDROOM DOOR FOR MANUAL
execute if entity @e[scores={AdventureLevel=..4}] run fill 961 93 1992 963 95 1992 white_stained_glass replace air

execute if entity @e[scores={AdventureLevel=..22}] if block 46 5 78 magma_block if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy

execute if entity @e[scores={AdventureLevel=..22}] if block 46 5 78 glowstone if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion unless block 963 93 1992 air unless entity @e[scores={LabBedroomClose=0..}] run scoreboard objectives add LabBedroomOpen dummy

execute unless block 962 94 2007 potted_fern if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy
execute unless block 961 94 2007 potted_allium if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy
execute unless block 960 94 2007 potted_white_tulip if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy
execute unless block 959 94 2007 potted_poppy if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy
execute unless block 958 94 2007 potted_blue_orchid if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy
execute unless block 957 94 2007 potted_dandelion if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy

scoreboard players add @e[tag=MainAdventureAEC] LabBedroomOpen 1
execute if entity @e[scores={LabBedroomOpen=2}] run playsound entity.generic.burn master @a 962 94 1992 0.2 1.5 0
execute if entity @e[scores={LabBedroomOpen=2}] run playsound entity.evoker.cast_spell master @a 962 94 1992 0.2 1.3 0
execute if entity @e[scores={LabBedroomOpen=2}] run setblock 961 95 1992 air
execute if entity @e[scores={LabBedroomOpen=3}] run setblock 962 95 1992 air
execute if entity @e[scores={LabBedroomOpen=4}] run setblock 963 95 1992 air
execute if entity @e[scores={LabBedroomOpen=5}] run setblock 963 94 1992 air
execute if entity @e[scores={LabBedroomOpen=6}] run setblock 962 94 1992 air
execute if entity @e[scores={LabBedroomOpen=7}] run setblock 961 94 1992 air
execute if entity @e[scores={LabBedroomOpen=8}] run setblock 961 93 1992 air
execute if entity @e[scores={LabBedroomOpen=9}] run setblock 962 93 1992 air
execute if entity @e[scores={LabBedroomOpen=10}] run setblock 963 93 1992 air
execute if entity @e[scores={LabBedroomOpen=10..}] run scoreboard objectives remove LabBedroomOpen

scoreboard players add @e[tag=MainAdventureAEC] LabBedroomClose 1
execute if entity @e[scores={LabBedroomClose=2}] run playsound entity.generic.burn master @a 962 94 1992 0.2 1.5 0
execute if entity @e[scores={LabBedroomClose=2}] run playsound entity.evoker.cast_spell master @a 962 94 1992 0.2 1.3 0
execute if entity @e[scores={LabBedroomClose=2}] run setblock 963 93 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=3}] run setblock 962 93 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=4}] run setblock 961 93 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=5}] run setblock 961 94 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=6}] run setblock 962 94 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=7}] run setblock 963 94 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=8}] run setblock 963 95 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=9}] run setblock 962 95 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=10}] run setblock 961 95 1992 white_stained_glass
execute if entity @e[scores={LabBedroomClose=10..}] run scoreboard objectives remove LabBedroomClose

execute if entity @e[scores={AdventureLevel=23..25}] if block 961 95 1992 air align x align y align z unless entity @a[x=951,y=93,z=1984,dx=12,dy=4,dz=8] run scoreboard objectives add LabBedroomClose dummy



# ONGOING MECHANICS
execute if entity @e[scores={AdventureLevel=5..}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=14] as @e[tag=AdventureReceptionist] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=5..}] align x align y align z unless entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=14] as @e[tag=AdventureReceptionist] at @s run teleport @s ~ ~ ~ 180 10

execute at @e[tag=DrZombo] if entity @a[distance=..6] as @e[tag=AdventureVillager,nbt=!{Silent:true}] run data merge entity @s {Silent:true}
execute at @e[tag=DrZombo] unless entity @a[distance=..6] as @e[tag=TrappedVillager,nbt={Silent:true}] run data merge entity @s {Silent:false}

execute if entity @e[scores={AdventureLevel=..23}] run tag @a remove DoorLevel3
execute if entity @e[scores={AdventureLevel=24..}] run tag @a add DoorLevel3
execute if entity @e[scores={AdventureLevel=24..26}] run team modify Adventure color gold

execute if entity @e[scores={AdventureLevel=27..}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run function d3:adventure/suit_up

execute if entity @e[scores={AdventureLevel=..59}] run tag @a remove DoorLevel4

execute if entity @e[scores={AdventureLevel=25..100}] as @e[tag=AdventureCEO,tag=!WalkFromChair] at @s unless entity @e[tag=AdventureFish] run teleport @s ~ ~ ~ 90 0
execute if entity @e[scores={AdventureLevel=25..100}] as @e[tag=AdventureCEO,tag=!WalkFromChair] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureFish,sort=furthest,limit=1] feet

execute if entity @e[scores={AdventureLevel=29..149}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=29..149}] as @e[tag=AdventureOckels] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]

execute if entity @e[scores={AdventureLevel=25..75}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=5,dy=4,dz=14] run scoreboard objectives add ReceptionTimer dummy
execute if entity @e[scores={AdventureLevel=25..75,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=25..75,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Remek> ","color":"dark_green","bold":false},{"text":"Best come back later. He's busy obsessing over the fish again.","color":"none","bold":false,"underlined":false}] 


execute as @e[tag=AdventureMendez] at @s if entity @a[distance=..2] run teleport @s ~ ~ ~ ~ 0
#execute as @e[tag=AdventureMendez] at @s if entity @a[distance=..2] run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=AdventureMendez] at @s if entity @a[distance=..6] run teleport @s[nbt=!{Rotation:[270f,20f]}] ^ ^ ^ facing entity @p
execute as @e[tag=AdventureMendez] at @s unless entity @a[distance=..6] run data merge entity @s[nbt=!{Rotation:[270f,20f]}] {Rotation:[270f,20f]}

execute unless entity @e[scores={AdventureLevel=100..}] as @e[tag=AdventureWaterCooler] at @s if entity @a[x=945,y=144,z=2103,distance=..3] run teleport @s ^ ^ ^ facing entity @p[x=945,y=144,z=2103,distance=..5]
execute unless entity @e[scores={AdventureLevel=100..}] unless entity @a[x=945,y=144,z=2103,distance=..3] run teleport @e[tag=AdventureTuan] 946 144 2103 90 0
execute unless entity @e[scores={AdventureLevel=100..}] unless entity @a[x=945,y=144,z=2103,distance=..3] run teleport @e[tag=AdventureJahn] 944 144 2103 270 0
execute as @e[tag=AdventureWaterCooler,nbt=!{Silent:true}] align x align y align z unless entity @a[x=935,y=144,z=2089,dx=16,dy=4,dz=15] run data merge entity @s[nbt=!{Silent:true}] {Silent:true}
execute as @e[tag=AdventureWaterCooler,nbt=!{Silent:true}] at @s if entity @a[x=945,y=144,z=2103,distance=..3] run playsound entity.villager.trade master @a ~ ~ ~ 0.5 1 0
execute as @e[tag=AdventureWaterCooler] if entity @a[x=945,y=144,z=2103,distance=..3] run data merge entity @s[nbt=!{Silent:true}] {Silent:true}
execute as @e[tag=AdventureWaterCooler] align x align y align z if entity @a[x=935,y=144,z=2089,dx=16,dy=4,dz=15] unless entity @a[x=945,y=144,z=2103,distance=..3] run data merge entity @s[nbt={Silent:true}] {Silent:false}

execute align x align y align z unless entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=22] as @e[tag=AdventureIvanov] run teleport @s 940 136 2084 0 5
execute align x align y align z if entity @a[x=938,y=135,z=2087,dx=14,dy=5,dz=17] as @e[tag=AdventureIvanov] at @s run teleport @s ^ ^ ^ facing entity @p[x=941,y=135,z=2087,dx=14,dy=5,dz=17]
execute align x align y align z unless entity @a[x=941,y=135,z=2087,dx=14,dy=5,dz=17] as @e[tag=AdventureIvanov] at @s run teleport @s ^ ^ ^ facing entity @p[x=938,y=135,z=2082,dx=14,dy=5,dz=4]


# ACT 2 LAMP PUZZLE
execute if entity @e[type=item,nbt={Item:{id:"minecraft:comparator"}},nbt=!{Item:{tag:{CanPlaceOn:["minecraft:red_sand"]}}}] if block 938 137 2087 air run setblock 938 137 2087 structure_void
execute as @e[nbt={Item:{id:"minecraft:comparator"}},nbt=!{Item:{tag:{CanPlaceOn:["minecraft:red_sand"]}}}] run data merge entity @s {Item:{tag:{CanPlaceOn:["minecraft:red_sand"]}}}

execute if block 946 135 2091 redstone_lamp[lit=true] if block 948 134 2091 clay run setblock 948 134 2091 lever[face=ceiling,powered=true]
execute if block 946 135 2091 redstone_lamp[lit=false] if block 948 134 2091 lever run setblock 948 134 2091 clay
execute if block 948 135 2095 redstone_lamp[lit=true] if block 948 134 2093 clay run setblock 948 134 2093 lever[face=ceiling,powered=true]
execute if block 948 135 2095 redstone_lamp[lit=false] if block 948 134 2093 lever run setblock 948 134 2093 clay
execute if block 944 135 2093 redstone_lamp[lit=true] if block 944 134 2091 clay run setblock 944 134 2091 lever[face=ceiling,powered=true]
execute if block 944 135 2093 redstone_lamp[lit=false] if block 944 134 2091 lever run setblock 944 134 2091 clay
execute if block 942 135 2095 redstone_lamp[lit=true] if block 940 134 2095 clay run setblock 940 134 2095 lever[face=ceiling,powered=true]
execute if block 942 135 2095 redstone_lamp[lit=false] if block 940 134 2095 lever run setblock 940 134 2095 clay
execute if block 948 135 2097 redstone_lamp[lit=true] if block 950 134 2097 clay run setblock 950 134 2097 lever[face=ceiling,powered=true]
execute if block 948 135 2097 redstone_lamp[lit=false] if block 950 134 2097 lever run setblock 950 134 2097 clay
execute if block 946 135 2099 redstone_lamp[lit=true] if block 944 134 2099 clay run setblock 944 134 2099 lever[face=ceiling,powered=true]
execute if block 946 135 2099 redstone_lamp[lit=false] if block 944 134 2099 lever run setblock 944 134 2099 clay

execute if entity @e[scores={AdventureLevel=41..}] if entity @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe",tag:{CanDestroy:["minecraft:comparator"]}}}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe",tag:{CanDestroy:["minecraft:comparator"]}}}] weapon.mainhand diamond_hoe{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Comparator Removal Tool\"}",Lore:['{"text":"Why would anyone make a","italic":"true","color":"gold"}','{"text":"crowbar out of diamonds?","italic":"true","color":"gold"}']},HideFlags:6,Unbreakable:true}




# DIG SITE LIFTS
execute if entity @e[scores={AdventureLevel=43..}] run function d3:adventure/dig_site_lifts


execute if entity @e[tag=AdventureBladeAS1,nbt=!{HandItems:[{Count:1b}]}] run kill @e[tag=AdventureBladeAS1]
execute if entity @e[tag=AdventureBladeAS3,nbt=!{HandItems:[{Count:1b}]}] run kill @e[tag=AdventureBladeAS3]
execute as @e[tag=AdventureBladeAS,nbt=!{HandItems:[{Count:1b}]}] run kill @s

# SPACE PLANT
execute as @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"}},nbt=!{Item:{tag:{display:{Name:"{\"italic\":\"false\",\"color\":\"none\",\"text\":\"Mysterious Space Plant\"}"}}}}] run data merge entity @s {Item:{tag:{display:{Name:"{\"italic\":\"false\",\"color\":\"none\",\"text\":\"Mysterious Space Plant\"}"}}}}


# ONGOING SCOREBOARDS
scoreboard players add @e[tag=MainAdventureAEC] ReceptionTimer 1
scoreboard players add @e[tag=MainAdventureAEC] ZomboTimer 1


# TAG REMOVALS
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case1
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case2
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case3
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case4

execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case1
execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case2
execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case3


# FAILSAFES FOR BRANCH RESET
execute if entity @e[scores={AdventureLevel=..51}] if entity @e[tag=AdventureDisplay3] run kill @e[tag=AdventureDisplay3]
execute if entity @e[scores={AdventureLevel=..70}] unless block 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=..74}] if entity @e[tag=AdventureDisplay2] run kill @e[tag=AdventureDisplay2]


# SHUTTLE DOOR CLOSED
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 104 2038 air run setblock 844 104 2038 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 104 2037 air run setblock 844 104 2037 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 105 2036 quartz_stairs[facing=north,half=top] run setblock 844 105 2036 quartz_stairs[facing=north,half=top]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 106 2036 quartz_stairs[facing=south,half=bottom] run setblock 844 106 2036 quartz_stairs[facing=south,half=bottom]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 107 2036 quartz_stairs[facing=north,half=bottom] run setblock 844 107 2036 quartz_stairs[facing=north,half=bottom]
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 108 2036 air run setblock 844 108 2036 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 108 2037 air run setblock 844 108 2037 air
execute if entity @e[scores={AdventureLevel=..104}] unless block 844 109 2037 air run setblock 844 109 2037 air


# DISPLAY BOX 2
execute if entity @e[scores={AdventureLevel=..99}] if block 970 95 2006 air run setblock 970 95 2006 iron_trapdoor[facing=north,half=bottom,open=false]
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 94 2006 orange_stained_glass run setblock 970 94 2006 orange_stained_glass
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2006 quartz_pillar[axis=y] run setblock 970 93 2006 quartz_pillar[axis=y]
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2005 air run setblock 970 93 2005 air
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2004 air run setblock 970 93 2004 air
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2003 air run setblock 970 93 2003 air
