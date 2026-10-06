####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / NOVEMBER 11 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

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


# LOWER POWER SET
execute if entity @e[scores={AdventureLevel=..8}] if block 1033 94 1995 lever[powered=true] run fill 46 5 78 46 5 78 glowstone replace magma_block
execute if block 46 5 78 glowstone run function d3:adventure/lights_on_lower
execute if block 46 5 78 glowstone run function d3:adventure/lower_doors

execute if entity @e[scores={AdventureLevel=..5}] if block 1033 94 1995 lever[powered=false] run fill 46 5 78 46 5 78 magma_block replace glowstone
execute if block 46 5 78 magma_block run function d3:adventure/lights_off_lower


# UPPER POWER SET
execute if entity @e[scores={AdventureLevel=..8}] if block 1033 94 1999 lever[powered=true] run fill 46 7 78 46 7 78 glowstone replace magma_block
execute if block 46 7 78 glowstone run function d3:adventure/lights_on_upper
execute if block 46 7 78 glowstone run function d3:adventure/upper_doors

execute if entity @e[scores={AdventureLevel=..5}] if block 1033 94 1999 lever[powered=false] run fill 46 7 78 46 7 78 magma_block replace glowstone
execute if block 46 7 78 magma_block run function d3:adventure/lights_off_upper


tag @a remove HasSuit
tag @a[nbt={Inventory:[{Slot:100b,id:"minecraft:leather_boots",tag:{display:{color:16777215}}},{Slot:101b,id:"minecraft:leather_leggings",tag:{display:{color:16777215}}},{Slot:102b,id:"minecraft:leather_chestplate",tag:{display:{color:16777215}}},{Slot:103b,id:"minecraft:player_head"}]}] add HasSuit


# MONITORS
function d3:adventure/monitor_screens


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


# ANTI GRAVITY EFFECT
effect clear @a[tag=!AntiGravity] slow_falling
effect clear @a[tag=!AntiGravity] jump_boost
effect clear @a[tag=!AntiGravity] slowness
effect give @a[tag=AntiGravity] slow_falling 1 1 true
effect give @a[tag=AntiGravity] jump_boost 1 1 true
effect give @a[tag=AntiGravity] slowness 1 1 true

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

execute if entity @e[scores={AdventureLevel=75..99}] unless entity @e[tag=AdventureDisplay2] run summon armor_stand 970 92.68 2006  {Invisible:true,Invulnerable:true,NoGravity:true,DisabledSlots:2039583,Tags:["AdventureDisplay2"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:orange_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["Zombocron"]}]}

#execute if entity @e[scores={AdventureLevel=52..,AdventureTimer=1}] unless entity @e[tag=AdventureDisplay3] run summon armor_stand 968.15 92.65 2007.05 {Invisible:true,Invulnerable:true,NoGravity:true,ShowArms:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:sea_pickle",Count:1b}],Pose:{RightArm:[270f,0f,0f]},DisabledSlots:2039583,Tags:["AdventureDisplay3"]}

execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=AdventureDisplay3AS] run kill @e[tag=AdventureDisplay3FB]
execute if entity @e[scores={AdventureLevel=..100}] unless entity @e[tag=AdventureDisplay3FB] run kill @e[tag=AdventureDisplay3AS]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1..}] unless entity @e[tag=AdventureDisplay3] run summon armor_stand 968 92.55 2006 {Invisible:true,Invulnerable:true,NoGravity:true,Rotation:[180f,0f],Tags:["AdventureDisplay3AS","AdventureDisplay3"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:sea_pickle"},Tags:["AdventureDisplay3","AdventureDisplay3Block"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}



# DONKEY KONG ADVANCEMENT
execute if block 46 5 78 glowstone if block 1004 94 2036 stone_button[powered=true] unless entity @e[tag=AdvDKGame] run summon painting 1005 95 2036 {Motive:"minecraft:donkey_kong",Facing:2b,Invulnerable:true,Tags:["AdvDKGame"]}
execute if block 46 5 78 glowstone if block 1003 94 2036 stone_button[powered=true] unless entity @e[tag=AdvDKGame] run summon painting 1005 95 2036 {Motive:"minecraft:donkey_kong",Facing:2b,Invulnerable:true,Tags:["AdvDKGame"]}
execute if entity @e[tag=AdvDKGame] if block 1003 94 2036 stone_button[powered=true] align x align y align z run advancement grant @a[x=1002,y=93,z=2033,dx=5,dy=2,dz=4] only d3:folder_c/hardcore_gamer
execute if entity @e[tag=AdvDKGame] if block 1004 94 2036 stone_button[powered=true] align x align y align z run advancement grant @a[x=1002,y=93,z=2033,dx=5,dy=2,dz=4] only d3:folder_c/hardcore_gamer
execute if block 1003 94 2036 stone_button[powered=true] run setblock 1003 94 2036 stone_button[face=floor,facing=north,powered=false]
execute if block 1004 94 2036 stone_button[powered=true] run setblock 1004 94 2036 stone_button[face=floor,facing=north,powered=false]

execute unless entity @e[tag=NintendoPlug] run summon item_frame 1007 93 2036 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: 1b, Item: {id: "minecraft:iron_trapdoor", Count: 1b}, Tags:["NintendoPlug"]}
execute as @e[tag=NintendoPlug] run data merge entity @s[nbt=!{ItemRotation:0b}] {ItemRotation:0b}


scoreboard objectives add AdventureLevel dummy
scoreboard players add @e[tag=MainAdventureAEC] AdventureLevel 0

scoreboard objectives add AdventureTimer dummy
scoreboard players add @e[tag=MainAdventureAEC] AdventureTimer 1


# ELEVATOR
execute if block 46 5 78 glowstone if block 46 7 78 glowstone run function d3:adventure/elevator


# ENTER BRANCH -> GET MAINTENANCE KEY
execute if entity @e[scores={AdventureLevel=0,AdventureTimer=10}] run replaceitem entity @a inventory.16 tripwire_hook{Key1:1b,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Maintenance Key\"}",Lore:["In hand, this opens manual locks around the station"]}}


tag @a add DoorLevel1
tag @a add DoorLevel2


# NPCs
execute if entity @e[scores={AdventureLevel=..99}] as @e[tag=AdventureVillager,nbt=!{CustomNameVisible:true}] at @s if entity @a[distance=..9] run data merge entity @s {CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=..99}] as @e[tag=AdventureVillager,nbt={CustomNameVisible:true}] at @s unless entity @a[distance=..9] run data merge entity @s {CustomNameVisible:false}

# CEO
execute if entity @e[scores={AdventureLevel=..1}] unless entity @e[tag=AdventureCEO] run summon villager 973 106 2000 {CustomName:"{\"text\":\"Mr. Seeioh\",\"color\":\"yellow\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,Profession:3,Offers:{},Tags:["AdventureVillager","AdventureCEO","DoorLevel1","DoorLevel2","DoorLevel3","DoorLevel4","DoorLevel5"]}
execute if entity @e[scores={AdventureLevel=1..2}] align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] as @e[tag=AdventureCEO] at @s run teleport @s ^ ^ ^ facing entity @p

# RECEPTIONIST
execute if entity @e[scores={AdventureLevel=..1}] unless entity @e[tag=AdventureReceptionist] run summon villager 971 106 2005 {CustomName:"{\"text\":\"Rico\",\"color\":\"dark_green\"}",CustomNameVisible:false,Rotation:[180f,0f],Invulnerable:true,NoAI:false,Silent:false,Profession:5,Offers:{},Tags:["AdventureVillager","AdventureReceptionist","DoorLevel1"]}
execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureReceptionist] at @s run teleport @s 971 106 2005
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureReceptionist,nbt=!{NoAI:true}] run data merge entity @s {NoAI:true}
execute align x align y align z if entity @a[x=957,y=106,z=1993,dx=17,dy=4,dz=14] as @e[tag=AdventureReceptionist,nbt=!{Silent:true}] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=..44}] align x align y align z unless entity @a[x=957,y=106,z=1993,dx=17,dy=4,dz=14] as @e[tag=AdventureReceptionist,nbt={Silent:true}] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=45..}] as @e[tag=AdventureReceptionist,nbt=!{Silent:true}] run data merge entity @s {Silent:true}

execute if entity @e[scores={AdventureLevel=5..}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=14] as @e[tag=AdventureReceptionist] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=5..}] align x align y align z unless entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=14] as @e[tag=AdventureReceptionist] at @s run teleport @s ~ ~ ~ 180 10

# DR ZOMBO
execute if entity @e[scores={AdventureLevel=..3}] unless entity @e[tag=DrZombo] run summon villager 1000 93 2027 {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,Profession:1,Offers:{},Tags:["AdventureVillager","DrZombo","DoorLevel1","DoorLevel2","DoorLevel3","DoorLevel4"]}
execute if entity @e[scores={AdventureLevel=1..12}] align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=1..12}] align x align y align z if entity @a[x=996,y=93,z=2020,dx=8,dy=3,dz=5] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

# ASTROSUIT
execute unless entity @e[tag=AstroSuit] run summon armor_stand 1036 108 2000 {NoGravity:true,NoBasePlate:true,Invulnerable:true,ShowArms:true,Pose:{RightArm:[0.0f,0.0f,140.0f],LeftLeg:[0.0f,0.0f,320.0f],LeftArm:[0.0f,0.0f,220.0f],RightLeg:[0.0f,0.0f,40.0f]},Rotation:[90.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],DisabledSlots:2039583,Tags:["AstroSuit"]}

# DOUG
execute if entity @e[scores={AdventureLevel=..1}] unless entity @e[tag=AdventureDoug] run summon villager 1035 106 1995 {CustomName:"{\"text\":\"Doug\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,Profession:5,Offers:{},Tags:["AdventureVillager","AdventureDoug"]}

# BOB
execute if entity @e[scores={AdventureLevel=..1}] unless entity @e[tag=AdventureBob] run summon villager 1034 106 2006 {CustomName:"{\"text\":\"Bob\",\"color\":\"dark_green\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,Profession:5,Offers:{},Tags:["AdventureVillager","AdventureBob"]}

# THOMAS
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureThomas] run summon villager 958 144 2092 {CustomName:"{\"text\":\"Thomas\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,Profession:2,Offers:{},Tags:["AdventureVillager","AdventureThomas"]}
execute if entity @e[scores={AdventureLevel=..29}] run teleport @e[tag=AdventureThomas] 958 144 2092 90 15

# STAN
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureStan] run summon villager 946 144 2103 {CustomName:"{\"text\":\"Stan\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,Profession:2,Offers:{},Tags:["AdventureVillager","AdventureStan","AdventureWaterCooler"]}

# VIC
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureVic] run summon villager 944 144 2103 {CustomName:"{\"text\":\"Vic\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:false,Profession:2,Offers:{},Tags:["AdventureVillager","AdventureVic","AdventureWaterCooler"]}

execute as @e[tag=AdventureWaterCooler] at @s if entity @a[x=945,y=144,z=2103,distance=..3] run teleport @s ^ ^ ^ facing entity @p[x=945,y=144,z=2103,distance=..5]
execute unless entity @a[x=945,y=144,z=2103,distance=..3] run teleport @e[tag=AdventureStan] 946 144 2103 90 0
execute unless entity @a[x=945,y=144,z=2103,distance=..3] run teleport @e[tag=AdventureVic] 944 144 2103 270 0
execute as @e[tag=AdventureWaterCooler,nbt=!{Silent:true}] align x align y align z unless entity @a[x=935,y=144,z=2089,dx=16,dy=4,dz=15] run data merge entity @s[nbt=!{Silent:true}] {Silent:true}
execute as @e[tag=AdventureWaterCooler,nbt=!{Silent:true}] at @s if entity @a[x=945,y=144,z=2103,distance=..3] run playsound entity.villager.trade master @a ~ ~ ~ 0.5 1 0
execute as @e[tag=AdventureWaterCooler] if entity @a[x=945,y=144,z=2103,distance=..3] run data merge entity @s[nbt=!{Silent:true}] {Silent:true}
execute as @e[tag=AdventureWaterCooler] align x align y align z if entity @a[x=935,y=144,z=2089,dx=16,dy=4,dz=15] unless entity @a[x=945,y=144,z=2103,distance=..3] run data merge entity @s[nbt={Silent:true}] {Silent:false}



# MCKENZIE
execute if entity @e[scores={AdventureLevel=..30}] unless entity @e[tag=AdventureMcKenzie] run summon villager 940 136 2084 {CustomName:"{\"text\":\"McKenzie\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,Profession:2,Offers:{},Tags:["AdventureVillager","AdventureMcKenzie"]}
execute align x align y align z unless entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=22] as @e[tag=AdventureMcKenzie] run teleport @s 940 136 2084 0 5
execute align x align y align z if entity @a[x=938,y=135,z=2087,dx=14,dy=5,dz=17] as @e[tag=AdventureMcKenzie] at @s run teleport @s ^ ^ ^ facing entity @p[x=941,y=135,z=2087,dx=14,dy=5,dz=17]
execute align x align y align z unless entity @a[x=941,y=135,z=2087,dx=14,dy=5,dz=17] as @e[tag=AdventureMcKenzie] at @s run teleport @s ^ ^ ^ facing entity @p[x=938,y=135,z=2082,dx=14,dy=5,dz=4]


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




########## ACT 1 #############

# DRILL OPERATING
execute if entity @e[scores={AdventureLevel=0}] run playsound entity.guardian.attack master @a 1000 54 2000 100 1 0
execute if entity @e[scores={AdventureLevel=0}] run particle cloud 1000 54 2000 10 10 10 0 100 force
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=..15}] run playsound entity.guardian.attack master @a 1000 54 2000 100 1 0

# LIGHTS OUT WHEN ENTER HALLWAY
execute if entity @e[scores={AdventureLevel=0}] unless block 1033 94 1995 lever[powered=false] run setblock 1033 94 1995 lever[face=wall,facing=west,powered=false]

tag @a remove AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=975,y=106,z=2050,dx=38,dy=5,dz=17] add AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=993,y=106,z=2027,dx=59,dy=5,dz=25] add AdventureBeginner
execute if entity @e[scores={AdventureLevel=0}] align x align y align z run tag @a[x=999,y=106,z=2024,dx=2,dy=5,dz=2] add AdventureBeginner

execute if entity @e[scores={AdventureLevel=0}] unless entity @a[tag=AdventureBeginner] run scoreboard players set @e[scores={AdventureTimer=0..}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=0}] unless entity @a[tag=AdventureBeginner] run scoreboard players set @e[scores={AdventureLevel=0}] AdventureLevel 1

execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run setblock 1033 94 1999 lever[powered=false,face=wall,facing=west]
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=7}] run playsound block.beacon.deactivate master @a 1032 94 2006 100 0.5 1
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=7}] run playsound entity.iron_golem.hurt master @a 1032 94 2006 100 0.5 1

execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 999 106 2026 1001 108 2026 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 974 106 1999 974 108 2001 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=6}] run fill 999 93 2026 1001 95 2026 white_stained_glass
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run scoreboard objectives remove UpperDoor1
execute if entity @e[scores={AdventureLevel=1,AdventureTimer=1}] run kill @e[tag=AdventureDoor]


# MEET BOSS FIRST TIME
execute align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] run scoreboard players set @e[scores={AdventureLevel=..1}] AdventureTimer 0
execute align x align y align z if entity @a[x=975,y=106,z=1995,dx=4,dy=3,dz=10] run scoreboard players set @e[scores={AdventureLevel=..1}] AdventureLevel 2

execute if entity @e[scores={AdventureLevel=2,AdventureTimer=1}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=1}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Wait! You're not locked in?! Thank goodness!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=100}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=100}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Now we don't have to wait 3 hours for the system to reboot.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=250}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=250}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Do you think you could get to the generators in the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Room","color":"blue","bold":true,"underlined":false},{"text":" on the lower floor? You could probably access it from the ","color":"none","bold":false,"underlined":false},{"text":"Oxygen Shaft","color":"gray","bold":true,"underlined":false},{"text":" down the hall.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=450}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=2,AdventureTimer=450}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"It's usually locked so I hope to God you have your ","color":"none","bold":false,"underlined":false},{"text":"key","color":"gray","bold":true,"underlined":false},{"text":" on you. I told you not to lose it! Check your pockets.","color":"none","bold":false,"underlined":false}]


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



# TURN ON GENERATORS
execute if entity @e[scores={AdventureLevel=3..6}] if block 46 5 78 glowstone if block 46 7 78 glowstone run scoreboard players set @e[scores={AdventureLevel=..6}] AdventureLevel 7

# GENERATORS STAY ON
execute if entity @e[scores={AdventureLevel=7..}] if block 1033 94 1995 lever[powered=false] run setblock 1033 94 1995 lever[face=wall,facing=west,powered=true]
execute if entity @e[scores={AdventureLevel=7..}] if block 1033 94 1999 lever[powered=false] run setblock 1033 94 1999 lever[face=wall,facing=west,powered=true]


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
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=670}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You know what? You look trustworthy enough. Go into my ","color":"none","bold":false,"underlined":false},{"text":"Lab","color":"red","bold":true,"underlined":false},{"text":" from the ","color":"none","bold":false,"underlined":false},{"text":"Mechanical Hallway","color":"gray","bold":true,"underlined":false},{"text":". Then you'll need to get my ","color":"none","bold":false,"underlined":false},{"text":"Reprogramming Manual","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=900}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=8,AdventureTimer=900}] run tellraw @a ["",{"text":"Dr. Zombo whispers: ","color":"red","bold":false},{"text":"I trust you. Just remember \"F.A.T.P.O.D.\" - Fern, Allium, Tulip, Poppy, Orchid, Dandelion.","color":"none","bold":false,"italic":true}]


# LAB PUZZLE - FERN ALLIUM TULIP POPPY ORCHID DANDELION
execute if entity @e[scores={AdventureLevel=..4}] unless block 962 94 2007 potted_poppy run setblock 962 94 2007 potted_poppy
execute if entity @e[scores={AdventureLevel=..4}] unless block 961 94 2007 potted_dandelion run setblock 961 94 2007 potted_dandelion
execute if entity @e[scores={AdventureLevel=..4}] unless block 960 94 2007 potted_fern run setblock 960 94 2007 potted_fern
execute if entity @e[scores={AdventureLevel=..4}] unless block 959 94 2007 potted_white_tulip run setblock 959 94 2007 potted_white_tulip
execute if entity @e[scores={AdventureLevel=..4}] unless block 958 94 2007 potted_allium run setblock 958 94 2007 potted_allium
execute if entity @e[scores={AdventureLevel=..4}] unless block 957 94 2007 potted_blue_orchid run setblock 957 94 2007 potted_blue_orchid

#execute unless block 962 94 2007 potted_fern if block 954 92 2005 clay run setblock 954 92 2005 redstone_block
#execute unless block 961 94 2007 potted_allium if block 954 92 2005 clay run setblock 954 92 2005 redstone_block
#execute unless block 960 94 2007 potted_white_tulip if block 954 92 2005 clay run setblock 954 92 2005 redstone_block
#execute unless block 959 94 2007 potted_poppy if block 954 92 2005 clay run setblock 954 92 2005 redstone_block
#execute unless block 958 94 2007 potted_blue_orchid if block 954 92 2005 clay run setblock 954 92 2005 redstone_block
#execute unless block 957 94 2007 potted_dandelion if block 954 92 2005 clay run setblock 954 92 2005 redstone_block

#execute if entity @e[scores={AdventureLevel=7..}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion if block 954 92 2005 redstone_block run setblock 954 92 2005 clay


# OPENS LAB BEDROOM DOOR FOR MANUAL
execute if entity @e[scores={AdventureLevel=..22}] if block 46 5 78 magma_block if block 961 95 1992 air unless entity @e[scores={LabBedroomOpen=0..}] run scoreboard objectives add LabBedroomClose dummy

execute if entity @e[scores={AdventureLevel=..22}] if block 46 5 78 glowstone if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion unless block 963 93 1992 air unless entity @e[scores={LabBedroomClose=0..}] run scoreboard objectives add LabBedroomOpen dummy

execute unless block 962 94 2007 potted_fern if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy
execute unless block 961 94 2007 potted_allium if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy
execute unless block 960 94 2007 potted_white_tulip if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy
execute unless block 959 94 2007 potted_poppy if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy
execute unless block 958 94 2007 potted_blue_orchid if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy
execute unless block 957 94 2007 potted_dandelion if block 961 95 1992 air run scoreboard objectives add LabBedroomClose dummy

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


execute if entity @e[scores={AdventureLevel=7}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=7}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..7}] AdventureLevel 9


execute if entity @e[scores={AdventureLevel=8}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..8}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=8}] if block 962 94 2007 potted_fern if block 961 94 2007 potted_allium if block 960 94 2007 potted_white_tulip if block 959 94 2007 potted_poppy if block 958 94 2007 potted_blue_orchid if block 957 94 2007 potted_dandelion run scoreboard players set @e[scores={AdventureLevel=..8}] AdventureLevel 11



# IF PLAYER SOLVES PUZZLE WITHOUT TALKING TO ZOMBO - 8
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

# SWITCH to 12
scoreboard players set @e[scores={AdventureLevel=12,AdventureTimer=130}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=12,AdventureTimer=-1}] AdventureLevel 13


# MECHANIC FOR HOLDING BOOK TO ZOMBO - 13
execute if entity @e[scores={AdventureLevel=..12}] run teleport @e[tag=DrZombo] 1000 93 2027
execute if entity @e[scores={AdventureLevel=..4}] unless block 951 93 1984 orange_shulker_box run setblock 951 93 1984 orange_shulker_box
execute if entity @e[scores={AdventureLevel=..4}] run data merge block 951 93 1984 {Items: [{Slot: 10b, id: "minecraft:book", Count: 1b, tag: {DoorBook:1b, display: {Name: "{\"text\":\"Door Reprogramming Manual\",\"italic\":\"true\"}"}}}]}

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

execute if entity @e[scores={AdventureLevel=16,AdventureTimer=10}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=16,AdventureTimer=10}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Come with me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=16,AdventureTimer=70..}] at @e[tag=DrZombo] if entity @a[distance=..3] run tag @e[tag=Rec2Lab4] add Rec2Lab5

execute if entity @e[scores={AdventureLevel=16}] align x align y align z if entity @e[tag=DrZombo,x=976,y=93,z=2000,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=16}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=16}] align x align y align z if entity @e[tag=DrZombo,x=976,y=93,z=2000,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={AdventureLevel=16}] AdventureLevel 20

execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run tag @e[tag=Rec2Lab5] add Rec2Lab6
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=20,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I'll leave my ","color":"none","bold":false,"underlined":false},{"text":"Lab door","color":"red","bold":true,"underlined":false},{"text":" open for you.","color":"none","bold":false,"underlined":false}] 


# OPENS LAB DOOR
execute if entity @e[scores={AdventureLevel=..20}] run fill 974 93 1999 974 95 2001 white_stained_glass replace air
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
execute if entity @e[scores={AdventureLevel=21..51}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p


# ZOMBO THANKS PLAYER
execute if entity @e[scores={AdventureLevel=21,AdventureTimer=50..}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=21}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=21,AdventureTimer=-1}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=21}] AdventureLevel 22

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=20}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=20}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you very much. I'm not sure what happened to the power, but you should go check with ","color":"none","bold":false,"underlined":false},{"text":"Mr. Seeioh","color":"yellow","bold":true,"underlined":false},{"text":" to see if everything is okay up there.","color":"none","bold":false,"underlined":false}] 

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The Lift","color":"gray","bold":true,"underlined":false},{"text":" should be online again. I'll look over the other systems to see what happened.","color":"none","bold":false,"underlined":false}] 

execute if entity @e[scores={AdventureLevel=22,AdventureTimer=330}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,AdventureTimer=330}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You impressed me. I may have some special work for you later.","color":"none","bold":false,"underlined":false}]


# RECEPTION SAYS GO IN
execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=5,dy=4,dz=14] run scoreboard objectives add ReceptionTimer dummy
scoreboard players add @e[tag=MainAdventureAEC] ReceptionTimer 1
execute if entity @e[scores={AdventureLevel=22,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=22,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Rico> ","color":"dark_green","bold":false},{"text":"Go on in. ","color":"none","bold":false,"underlined":false},{"text":"Mr. Seeioh","color":"yellow","bold":true,"underlined":false},{"text":" has been waiting to see you.","color":"none","bold":false,"underlined":false}] 
execute if entity @e[scores={AdventureLevel=23}] run scoreboard objectives remove ReceptionTimer


# PLAYER SEES CEO AFTER LIGHTS COME ON
execute if entity @e[scores={AdventureLevel=..4}] run teleport @e[tag=AdventureCEO] 973 106 2000
execute if entity @e[scores={AdventureLevel=22}] run fill 966 106 1996 966 108 1998 air replace white_stained_glass
execute if entity @e[scores={AdventureLevel=22}] run teleport @e[tag=AdventureCEO] 958 106 2000
execute if entity @e[scores={AdventureLevel=22..23}] as @e[tag=AdventureCEO] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=965,y=106,z=1996,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=22}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=22}] align x align y align z if entity @a[x=965,y=106,z=1996,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=22}] AdventureLevel 23

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Come in! Come in!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=100}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=100}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Excellent excellent work! The power's back on, and I know it had to have been you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=230}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=230}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Due to your competence, I think you may be cut out for something a little more capable than ","color":"none","bold":false,"underlined":false},{"text":"Maintenance","color":"blue","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=370}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=370}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"I'm promoting you to ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=470}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=470}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"You'll have immediate access through ","color":"none","bold":false,"underlined":false},{"text":"orange level","color":"gold","bold":true,"underlined":false},{"text":" doors. You'll report directly to ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":" with any of your findings here.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=650}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=650}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Now, I haven't been able to make any contact with the ","color":"none","bold":false,"underlined":false},{"text":"Communication Station","color":"gray","bold":true,"underlined":false},{"text":" yet. So that may be offline.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=830}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=830}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"So for your first task with this new position, I need you to go ","color":"none","bold":false,"underlined":false},{"text":"suit up","color":"gold","bold":true,"underlined":false},{"text":" and head outside to see what's going on over there. The system may need resetting.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1060}] at @e[tag=AdventureCEO] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.8 0
execute if entity @e[scores={AdventureLevel=23,AdventureTimer=1060}] run tellraw @a ["",{"text":"<Mr. Seeioh> ","color":"yellow","bold":false},{"text":"Oh, and you can keep that ","color":"none","bold":false,"underlined":false},{"text":"Maintenance Key","color":"gray","bold":true,"underlined":false},{"text":". Just in case, the power goes out again. Haha.","color":"none","bold":false,"underlined":false}]



# ACCESS TO ASTROSUIT
scoreboard players set @e[scores={AdventureLevel=23,AdventureTimer=1060..}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=23,AdventureTimer=-1}] AdventureLevel 24
execute if entity @e[scores={AdventureLevel=24..}] run tag @a add DoorLevel3

execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureDoug] run data merge entity @s {NoAI:false}
execute if entity @e[scores={AdventureLevel=..26}] as @e[tag=AdventureDoug] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=7..}] run teleport @e[tag=AdventureDoug] 1035 106 1995
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureDoug] run data merge entity @s {NoAI:true}
execute if entity @e[scores={AdventureLevel=27}] as @e[tag=AdventureDoug] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=7..26}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing 1037 106 1994

execute if entity @e[scores={AdventureLevel=..6}] as @e[tag=AdventureBob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={AdventureLevel=..26}] as @e[tag=AdventureBob] run data merge entity @s {Silent:false}
execute if entity @e[scores={AdventureLevel=7..}] run teleport @e[tag=AdventureBob] 1034 106 2006
execute if entity @e[scores={AdventureLevel=7..}] as @e[tag=AdventureBob] run data merge entity @s {NoAI:true}
execute if entity @e[scores={AdventureLevel=27}] as @e[tag=AdventureBob] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=7..26}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing 1037 106 2006

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


# RECEPTION SAYS GO IN
execute if entity @e[scores={AdventureLevel=25..28}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=5,dy=4,dz=14] run scoreboard objectives add ReceptionTimer dummy
execute if entity @e[scores={AdventureLevel=25..28,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=25..28,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Rico> ","color":"dark_green","bold":false},{"text":"Best come back later. He's busy obsessing over the fish again.","color":"none","bold":false,"underlined":false}] 
execute if entity @e[scores={AdventureLevel=40}] run scoreboard objectives remove ReceptionTimer



# GETTING ASTROSUIT
execute if entity @e[scores={AdventureLevel=24..26}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run scoreboard players set @e[scores={AdventureLevel=24..26}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=24..26}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run scoreboard players set @e[scores={AdventureLevel=24..26}] AdventureLevel 27

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=1..239}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=5}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=5}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Hey Bob. Looks like we've got ourselves some fresh blood for the ","color":"none","bold":false,"underlined":false},{"text":"Research Team","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=110..379}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=120}] at @e[tag=AdventureBob] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=120}] run tellraw @a ["",{"text":"<Bob> ","color":"dark_green","bold":false},{"text":"Oh really? Didn't know we were doing new research on how to scrub toilets. Hahahaha!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=240}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureBob,limit=1]
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=250}] at @e[tag=AdventureDoug] run playsound entity.villager.no master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=250}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Shut up Bob. Or do you want me tell the whole place how you peed your pants because you didn't have a nightlight during the power outage?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=380}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=380}] at @e[tag=AdventureBob] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=440..}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=450}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=450}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"And this is him on a ","color":"none","bold":false,"underlined":false},{"text":"good","color":"none","bold":false,"italic":true},{"text":" day. Just try to ignore him. Step into the glass box.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run fill 1030 107 1995 1030 109 1995 air
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 107 1996 orange_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 108 1996 white_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run setblock 1029 109 1996 orange_stained_glass_pane
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run fill 1029 107 1997 1029 109 1997 iron_bars[north=true]
execute if entity @e[scores={AdventureLevel=27,AdventureTimer=550}] run playsound block.iron_trapdoor.open master @a 1030 108 1995 1 1 0

execute if entity @e[scores={AdventureLevel=27..}] align x align y align z if entity @a[tag=DoorLevel3,x=1027,y=106,z=1993,dx=10,dy=2,dz=14] run function d3:adventure/suit_up


# AFTER GETTING SUIT
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=..129}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=..129}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=1}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=1}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Pretty cool eh?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50..149}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50..149}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50}] at @e[tag=AdventureBob] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=50}] run tellraw @a ["",{"text":"<Bob> ","color":"dark_green","bold":false},{"text":"Oh yeah. Real cool. Not like, we've seen it a hundred times before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=130}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureBob,limit=1]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=140}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=140}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Shut up, Bob.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=170}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=170}] at @e[tag=AdventureBob] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=190..579}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=190..579}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=200}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=200}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Anyway, it's all automatic. And as part of ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":", you can access it anytime you need.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=340}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=340}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"So now that you have your ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":" on, the ","color":"none","bold":false,"underlined":false},{"text":"Airlocks","color":"gray","bold":true,"underlined":false},{"text":" will open for you. Then you can head outside and record your findings for ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=500..599}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=500..599}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=505}] at @e[tag=AdventureBob] run playsound entity.villager.ambient master @a ~ ~ ~ 1 0.9 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=505}] run tellraw @a ["",{"text":"<Bob> ","color":"dark_green","bold":false},{"text":"Yeah. Just don't do anything stupid, like die!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureBob,limit=1]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=580}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Shut up, Bob!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=600}] as @e[tag=AdventureBob] at @s run teleport @s ^ ^ ^ facing 1037 106 2006
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=600}] at @e[tag=AdventureBob] run playsound entity.villager.no master @a ~ ~ ~ 1 0.9 0

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=620..}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=620..}] as @e[tag=AdventureDoug] at @s run teleport @s ^ ^ ^ facing entity @p[tag=HasSuit]
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=650}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=650}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Actually, yeah. Don't die. That would not be good for you. ","color":"none","bold":false,"underlined":false},{"text":"Airlock","color":"gray","bold":true,"underlined":false},{"text":" down the hall, opposite the ","color":"none","bold":false,"underlined":false},{"text":"Lift","color":"gray","bold":true,"underlined":false},{"text":", should also be working again.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=28,AdventureTimer=800}] at @e[tag=AdventureDoug] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=28,AdventureTimer=800}] run tellraw @a ["",{"text":"<Doug> ","color":"dark_green","bold":false},{"text":"Just make sure you've got the gear on. ","color":"none","bold":false,"underlined":false},{"text":"Airlock","color":"gray","bold":true,"underlined":false},{"text":" only opens when we're wearing the ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]



execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run scoreboard objectives add UpperDoor3 dummy
execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run playsound entity.generic.burn master @a 961 107 1992 0.2 1.5 0
execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] run playsound entity.evoker.cast_spell master @a 961 107 1992 0.2 1.3 0

execute if entity @e[scores={AdventureLevel=25..30}] if block 966 106 1996 air align x align y align z unless entity @a[x=957,y=106,z=1993,dx=9,dy=4,dz=14] align x align y align z run tag @e[tag=AdventureCEO,x=958,y=106,z=2000,dx=0,dy=0,dz=0] add WalkFromChair

execute if entity @e[scores={AdventureLevel=25..30}] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor3 0

execute align x align y align z run tag @e[x=957,y=106,z=2004,dx=0,dy=0,dz=0] remove WalkFromChair

execute as @e[tag=WalkFromChair] at @s run teleport @s ^ ^ ^0.15 facing 957 106 2004
execute if entity @e[scores={AdventureLevel=25..30}] as @e[tag=AdventureCEO,tag=!WalkFromChair] at @s unless entity @e[tag=AdventureFish] run teleport @s ~ ~ ~ 90 0
execute if entity @e[scores={AdventureLevel=25..30}] as @e[tag=AdventureCEO,tag=!WalkFromChair] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureFish,sort=furthest,limit=1] feet


# IF SEEING ZOMBO BEFORE ASTROSUIT
execute if entity @e[scores={AdventureLevel=28}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=28}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=28}] align x align y align z if entity @a[x=968,y=93,z=1993,dx=5,dy=4,dz=14] run scoreboard players set @e[scores={AdventureLevel=28}] AdventureLevel 29

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] align x align y align z if entity @a[tag=HasSuit,x=968,y=93,z=1993,dx=5,dy=4,dz=14] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, I see you got a promotion. The ","color":"none","bold":false,"underlined":false},{"text":"suit","color":"gold","bold":true,"underlined":false},{"text":" looks good on you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=1}] align x align y align z unless entity @a[tag=HasSuit,x=968,y=93,z=1993,dx=5,dy=4,dz=14] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Sounds like Bob and Doug fired off the ","color":"none","bold":false,"underlined":false},{"text":"A.S.T.R.O. Suit","color":"gold","bold":true,"underlined":false},{"text":" chamber again. You got a promotion didn't you?","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=29,AdventureTimer=150}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=150}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I guess that means, you report to me now. And you can freely head outside!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=320}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=320}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hey, when you were talking to ","color":"none","bold":false,"underlined":false},{"text":"Mr. Seeioh","color":"yellow","bold":true,"underlined":false},{"text":", did he mention anything about the ","color":"none","bold":false,"underlined":false},{"text":"Communication Station","color":"gray","bold":true,"underlined":false},{"text":"?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=29,AdventureTimer=500}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=29,AdventureTimer=500}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It's odd, but I'm not getting any response from them. Perhaps you could head over there and find out why.","color":"none","bold":false,"underlined":false}]




########## ACT 2 #############

execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureLevel 40

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"They sent ","color":"none","bold":false,"underlined":false},{"text":"Maintenance","color":"blue","bold":true,"underlined":false},{"text":" here to check on this?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=100}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=100}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"Oh sorry. You're obviously with ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":" now. Congrats with that.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=270}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=270}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"Anyway, something over from Main Base must have knocked out the ","color":"none","bold":false,"underlined":false},{"text":"Communications Grid","color":"gray","bold":true,"underlined":false},{"text":" here. Until, we get it back online, I can't send anything back there.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=450}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=450}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"I gave up trying to configure the comparators a while ago, but if you wanna give it a shot, be my guest.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=550}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=550}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"I put all the parts back in the box inside the ","color":"none","bold":false,"underlined":false},{"text":"Grid Room","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=700}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=700}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"All the nodes have to be lit up, for the system to reboot. You can pull up any of the ones you messed up with that removal tool from the box too.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1100}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.no master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1100}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"What a stupid system! I could have designed it way better, rather than using limited comparators.","color":"none","bold":false,"underlined":false}]


# SET UP SHULKER BOX WITH COMPARTORS
execute if entity @e[scores={AdventureLevel=20..42}] run fill 930 136 2083 930 136 2083 air replace redstone_torch
execute if entity @e[scores={AdventureLevel=20..39}] run fill 940 135 2088 950 135 2102 air replace comparator
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run fill 940 135 2089 950 135 2101 air replace comparator
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run gamerule doTileDrops true
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run setblock 938 136 2087 air
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run setblock 938 136 2087 orange_shulker_box[facing=up]{Items:[{Slot:11b,id:"minecraft:comparator",Count:37b,tag:{CanPlaceOn:["minecraft:red_sand"]}},{Slot:15b,id:"minecraft:diamond_hoe",Count:1b,tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Comparator Removal Tool\"}",Lore:["Why would anyone make a crowbar out of diamonds?"]},HideFlags:14,Unbreakable:true,CanDestroy:["minecraft:comparator"]}}]}

execute as @e[nbt={Item:{id:"minecraft:comparator"}},nbt=!{Item:{tag:{CanPlaceOn:["minecraft:red_sand"]}}}] run data merge entity @s {Item:{tag:{CanPlaceOn:["minecraft:red_sand"]}}}

# LAMP PUZZLE
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


execute if entity @e[scores={AdventureLevel=40}] if block 944 135 2087 redstone_lamp[lit=true] if block 940 135 2089 redstone_lamp[lit=true] if block 942 135 2089 redstone_lamp[lit=true] if block 944 135 2089 redstone_lamp[lit=true] if block 946 135 2089 redstone_lamp[lit=true] if block 948 135 2089 redstone_lamp[lit=true] if block 950 135 2089 redstone_lamp[lit=true] if block 940 135 2091 redstone_lamp[lit=true] if block 942 135 2091 redstone_lamp[lit=true] if block 944 135 2091 redstone_lamp[lit=true] if block 946 135 2091 redstone_lamp[lit=true] if block 948 135 2091 redstone_lamp[lit=true] if block 950 135 2091 redstone_lamp[lit=true] if block 940 135 2093 redstone_lamp[lit=true] if block 942 135 2093 redstone_lamp[lit=true] if block 944 135 2093 redstone_lamp[lit=true] if block 946 135 2093 redstone_lamp[lit=true] if block 948 135 2093 redstone_lamp[lit=true] if block 950 135 2093 redstone_lamp[lit=true] if block 940 135 2095 redstone_lamp[lit=true] if block 942 135 2095 redstone_lamp[lit=true] if block 944 135 2095 redstone_lamp[lit=true] if block 946 135 2095 redstone_lamp[lit=true] if block 948 135 2095 redstone_lamp[lit=true] if block 950 135 2095 redstone_lamp[lit=true] if block 940 135 2097 redstone_lamp[lit=true] if block 942 135 2097 redstone_lamp[lit=true] if block 944 135 2097 redstone_lamp[lit=true] if block 946 135 2097 redstone_lamp[lit=true] if block 948 135 2097 redstone_lamp[lit=true] if block 950 135 2097 redstone_lamp[lit=true] if block 940 135 2099 redstone_lamp[lit=true] if block 942 135 2099 redstone_lamp[lit=true] if block 944 135 2099 redstone_lamp[lit=true] if block 946 135 2099 redstone_lamp[lit=true] if block 948 135 2099 redstone_lamp[lit=true] if block 950 135 2099 redstone_lamp[lit=true] if block 940 135 2101 redstone_lamp[lit=true] if block 942 135 2101 redstone_lamp[lit=true] if block 944 135 2101 redstone_lamp[lit=true] if block 946 135 2101 redstone_lamp[lit=true] if block 948 135 2101 redstone_lamp[lit=true] if block 950 135 2101 redstone_lamp[lit=true] if block 946 135 2103 redstone_lamp[lit=true] run scoreboard players set @e[scores={AdventureLevel=40}] AdventureTimer 0

execute if entity @e[scores={AdventureLevel=40}] if block 944 135 2087 redstone_lamp[lit=true] if block 940 135 2089 redstone_lamp[lit=true] if block 942 135 2089 redstone_lamp[lit=true] if block 944 135 2089 redstone_lamp[lit=true] if block 946 135 2089 redstone_lamp[lit=true] if block 948 135 2089 redstone_lamp[lit=true] if block 950 135 2089 redstone_lamp[lit=true] if block 940 135 2091 redstone_lamp[lit=true] if block 942 135 2091 redstone_lamp[lit=true] if block 944 135 2091 redstone_lamp[lit=true] if block 946 135 2091 redstone_lamp[lit=true] if block 948 135 2091 redstone_lamp[lit=true] if block 950 135 2091 redstone_lamp[lit=true] if block 940 135 2093 redstone_lamp[lit=true] if block 942 135 2093 redstone_lamp[lit=true] if block 944 135 2093 redstone_lamp[lit=true] if block 946 135 2093 redstone_lamp[lit=true] if block 948 135 2093 redstone_lamp[lit=true] if block 950 135 2093 redstone_lamp[lit=true] if block 940 135 2095 redstone_lamp[lit=true] if block 942 135 2095 redstone_lamp[lit=true] if block 944 135 2095 redstone_lamp[lit=true] if block 946 135 2095 redstone_lamp[lit=true] if block 948 135 2095 redstone_lamp[lit=true] if block 950 135 2095 redstone_lamp[lit=true] if block 940 135 2097 redstone_lamp[lit=true] if block 942 135 2097 redstone_lamp[lit=true] if block 944 135 2097 redstone_lamp[lit=true] if block 946 135 2097 redstone_lamp[lit=true] if block 948 135 2097 redstone_lamp[lit=true] if block 950 135 2097 redstone_lamp[lit=true] if block 940 135 2099 redstone_lamp[lit=true] if block 942 135 2099 redstone_lamp[lit=true] if block 944 135 2099 redstone_lamp[lit=true] if block 946 135 2099 redstone_lamp[lit=true] if block 948 135 2099 redstone_lamp[lit=true] if block 950 135 2099 redstone_lamp[lit=true] if block 940 135 2101 redstone_lamp[lit=true] if block 942 135 2101 redstone_lamp[lit=true] if block 944 135 2101 redstone_lamp[lit=true] if block 946 135 2101 redstone_lamp[lit=true] if block 948 135 2101 redstone_lamp[lit=true] if block 950 135 2101 redstone_lamp[lit=true] if block 946 135 2103 redstone_lamp[lit=true] run scoreboard players set @e[scores={AdventureLevel=40}] AdventureLevel 41


# BEACON STARTS UP
execute if entity @e[scores={AdventureLevel=..40}] if block 937 141 2112 iron_block run setblock 937 141 2112 clay
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1..}] unless block 937 141 2112 iron_block run setblock 937 141 2112 iron_block
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1}] run playsound block.ender_chest.open ambient @a 937 134 2112 1 0.7 1
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=20}] run playsound block.beacon.activate master @a 937 134 2112 100 0.5 1
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=20}] run playsound block.beacon.power_select master @a 937 134 2112 100 0.5 1

execute if entity @e[scores={AdventureLevel=41..}] if entity @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe",tag:{CanDestroy:["minecraft:comparator"]}}}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe",tag:{CanDestroy:["minecraft:comparator"]}}}] weapon.mainhand diamond_hoe{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Comparator Removal Tool\"}",Lore:["Why would anyone make a crowbar out of diamonds?"]},HideFlags:6,Unbreakable:true}


execute if entity @e[scores={AdventureLevel=41,AdventureTimer=100}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=100}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"Wow! You did it! We're back online.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=250}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=250}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"I'll just lock these ","color":"none","bold":false,"underlined":false},{"text":"power nodes","color":"gray","bold":true,"underlined":false},{"text":" in place and hopefully they won't get knocked out again.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=400}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=405}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=405}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Hello? Hello?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=470}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=475}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.9 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=475}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Great! We're back online. I was informed of your mission by ","color":"none","bold":false,"underlined":false},{"text":"Mr. Seeioh","color":"yellow","bold":true,"underlined":false},{"text":". Great work getting the coms back up.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=650}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=655}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=655}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Listen. While, you're over there, I need you to head down to the ","color":"none","bold":false,"underlined":false},{"text":"Dig Site","color":"gray","bold":true,"underlined":false},{"text":" and grab some samples for me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=810}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=815}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=815}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Check on the rest of the ","color":"none","bold":false,"underlined":false},{"text":"Research Team","color":"gold","bold":true,"underlined":false},{"text":" while you're down there and see if they need anything. Their coms must be off right now.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=980}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=985}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=985}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"McKenzie","color":"light_purple","bold":true,"underlined":false},{"text":" can give you your own key for the ","color":"none","bold":false,"underlined":false},{"text":"Dig Site door","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1060}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1060}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"Will do, Sir.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1140}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1145}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1145}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Thank you, McKenzie.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1200}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1205}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1205}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Gather any ","color":"none","bold":false,"underlined":false},{"text":"plant-like specimens","color":"gray","bold":true,"underlined":false},{"text":" down there you find. I could use about 15 or so. And I'll see you when you get back.","color":"none","bold":false,"underlined":false}]


scoreboard players set @e[scores={AdventureLevel=41,AdventureTimer=1250..}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=41,AdventureTimer=-1}] AdventureLevel 42

execute if entity @e[scores={AdventureLevel=42,AdventureTimer=100..}] at @e[tag=AdventureMcKenzie] if entity @a[distance=..4] run scoreboard players set @e[scores={AdventureLevel=42,AdventureTimer=100..}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=42,AdventureTimer=..-2}] AdventureLevel 43

execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] at @e[tag=AdventureMcKenzie] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] as @e[tag=AdventureMcKenzie] at @s run give @a[distance=..3] tripwire_hook{Key2:1b,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Dig Site Access Key\"}",Lore:["Best not get this one mixed up with the other"]}}
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run tellraw @a ["",{"text":"<McKenzie> ","color":"light_purple","bold":false},{"text":"Here. This opens the door on the stairs. Then you can take a ","color":"none","bold":false,"underlined":false},{"text":"Lift","color":"gray","bold":true,"underlined":false},{"text":" down, check on the team, and grab those samples for ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=43..}] align x align y align z if entity @a[x=929,y=138,z=2083,dx=2,dy=1,dz=0,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key2:1b}}}] unless block 930 136 2083 redstone_torch run setblock 930 136 2083 redstone_torch

execute if entity @e[scores={AdventureLevel=43..}] run function d3:adventure/dig_site_lifts

execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run setblock 927 95 2080 air
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run setblock 927 95 2080 orange_shulker_box[facing=up]{Items: [{Slot: 1b, id: "minecraft:player_head", Count: 1b, tag: {HideFlags: 6, SkullOwner: {Id: "fc6f2ea4-543e-477f-98db-02c0f51f32d8", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}}, display: {Lore: ["This equipment allows you to venture outside the station"], Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Helmet\"}"}}}, {Slot: 3b, id: "minecraft:player_head", Count: 1b, tag: {HideFlags: 6, SkullOwner: {Id: "fc6f2ea4-543e-477f-98db-02c0f51f32d8", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}}, display: {Lore: ["This equipment allows you to venture outside the station"], Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Helmet\"}"}}}, {Slot: 8b, id: "minecraft:tripwire_hook", Count: 1b, tag: {Key2: 1b, HideFlags: 63, display: {Lore: ["Someone else's spare key?"], Name: "{\"italic\":false,\"color\":\"white\",\"text\":\"Dig Site Access Key\"}"}}}, {Slot: 10b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Boots\"}"}}}, {Slot: 15b, id: "minecraft:leather_leggings", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Slacks\"}"}}}, {Slot: 18b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Boots\"}"}}}, {Slot: 21b, id: "minecraft:leather_chestplate", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Chest\"}"}}}, {Slot: 22b, id: "minecraft:leather_chestplate", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Chest\"}"}}}, {Slot: 24b, id: "minecraft:leather_leggings", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to venture outside the station"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Slacks\"}"}}}]}


execute if entity @e[scores={AdventureLevel=43}] align x align y align z if entity @a[x=923,y=125,z=2078,dx=8,dy=0,dz=0] run scoreboard objectives add IntoCavern dummy
execute if entity @e[scores={AdventureLevel=43}] align x align y align z run scoreboard players add @a[x=923,y=125,z=2078,dx=8,dy=0,dz=0] IntoCavern 1
execute if entity @a[scores={IntoCavern=1}] at @a[scores={IntoCavern=1}] run playsound ambient.cave master @a[scores={IntoCavern=1}] ~ ~ ~ 10 0.6 0
execute if entity @e[scores={AdventureLevel=60}] run scoreboard objectives remove IntoCavern

# INTO CAVERN - 44
execute if entity @e[scores={AdventureLevel=..43}] align x align y align z if entity @a[x=926,y=95,z=2084,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={AdventureLevel=..43}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=..43}] align x align y align z if entity @a[x=926,y=95,z=2084,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={AdventureLevel=..43}] AdventureLevel 44

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 919 76 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 915 80 2115 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 924 78 2118 sea_pickle[waterlogged=false,pickles=4]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 912 81 2112 sea_pickle[waterlogged=false,pickles=3]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 923 78 2113 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 82 2111 sea_pickle[waterlogged=false,pickles=4]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 916 77 2116 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 911 85 2109 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 917 83 2108 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 919 81 2121 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 902 93 2102 air
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 902 93 2102 orange_shulker_box[facing=west]{Items: [{Slot: 0b, id: "minecraft:coal", Count: 10b}, {Slot: 4b, id: "minecraft:redstone_lamp", Count: 64b}, {Slot: 6b, id: "minecraft:cobblestone_wall", Count: 14b}, {Slot: 7b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ["Cuts plant specimens for collection"], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 10b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ["Cuts plant specimens for collection"], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 12b, id: "minecraft:coal", Count: 27b}, {Slot: 17b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ["Cuts plant specimens for collection"], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 20b, id: "minecraft:redstone_torch", Count: 52b}, {Slot: 22b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ["Cuts plant specimens for collection"], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 24b, id: "minecraft:redstone_lamp", Count: 16b}]}

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run kill @e[tag=AdventureBladeAS]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 901.5 91.70 2103.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:["Cuts plant specimens for collection"]}}}],Pose:{RightArm:[0f,0f,270f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[0f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 901.8 91.70 2104.0 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:["Cuts plant specimens for collection"]}}}],Pose:{RightArm:[0f,0f,0f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[90f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 900.5 91.8 2107.18 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:["Cuts plant specimens for collection"]}}}],Pose:{RightArm:[0f,90f,320f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[270f,0f]}

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 906.5 91.70 2106.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:["Cuts plant specimens for collection"]}}}],Pose:{RightArm:[0f,0f,270f]},Tags:["AdventureBladeAS3","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[90f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 906.1 91.70 2106.8 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:["Cuts plant specimens for collection"]}}}],Pose:{RightArm:[0f,0f,0f]},Tags:["AdventureBladeAS3","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[180f,0f]}

execute if entity @e[tag=AdventureBladeAS1,nbt=!{HandItems:[{Count:1b}]}] run kill @e[tag=AdventureBladeAS1]
execute if entity @e[tag=AdventureBladeAS3,nbt=!{HandItems:[{Count:1b}]}] run kill @e[tag=AdventureBladeAS3]
execute as @e[tag=AdventureBladeAS,nbt=!{HandItems:[{Count:1b}]}] run kill @s


# OBTAIN SWORD - 45
execute if entity @e[scores={AdventureLevel=..44}] if entity @a[nbt={Inventory:[{id:"minecraft:iron_sword"}]}] run scoreboard players set @e[scores={AdventureLevel=..44}] AdventureLevel 45


# OBTAIN PLANT SAMPLES CAVERN - 47
execute as @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"}},nbt=!{Item:{tag:{display:{Name:"{\"italic\":\"false\",\"color\":\"none\",\"text\":\"Mysterious Space Plant\"}"}}}}] run data merge entity @s {Item:{tag:{display:{Name:"{\"italic\":\"false\",\"color\":\"none\",\"text\":\"Mysterious Space Plant\"}"}}}}
execute if entity @e[scores={AdventureLevel=..45}] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]}] run scoreboard players set @e[scores={AdventureLevel=..45}] AdventureLevel 47


# SEEING ZOMBO WITHOUT SWORD
execute if entity @e[scores={AdventureLevel=42..44}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard objectives add ZomboTimer dummy
execute if entity @e[scores={AdventureLevel=45}] run scoreboard objectives remove ZomboTimer
scoreboard players add @e[tag=MainAdventureAEC] ZomboTimer 1

execute if entity @e[scores={AdventureLevel=42..44,ZomboTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=42..44,ZomboTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Did you not get the ","color":"none","bold":false,"underlined":false},{"text":"samples","color":"gray","bold":true,"underlined":false},{"text":"? Could you grab some from the old ","color":"none","bold":false,"underlined":false},{"text":"Dig Site","color":"gray","bold":true,"underlined":false},{"text":"?","color":"none","bold":false,"underlined":false}] 


# SEEING ZOMBO WITH SWORD BUT NO PLANTS - 46
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] run replaceitem block 965 93 2002 container.10 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"Zombo Pincers\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:["Designed to handle the object"]}}

execute if entity @e[scores={AdventureLevel=45}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=45}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=45}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=45}] AdventureLevel 46

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You're back!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=50}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=50}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But I see you have no samples?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=150}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=150}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"McKenzie","color":"dark_green","bold":true,"underlined":false},{"text":" contacted me after you left there and told me the site was ruined and none of the team was there?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Where in heavens did they go?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=420}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=420}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, I'm certainly happy you're safe. In light of this, I've been meaning take you on as my ","color":"none","bold":false,"underlined":false},{"text":"helper","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=540}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=540}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"They better turn up. I'll keep trying their coms. But first, I have another pressing issue.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=650..}] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=-1}] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureLevel 60


# SEEING ZOMBO AFTER LOSING PLANTS - 48
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] run replaceitem block 965 93 2002 container.10 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"Zombo Pincers\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:["Designed to handle the object"]}}

execute if entity @e[scores={AdventureLevel=46..48}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]},distance=..5] run scoreboard players set @e[scores={AdventureLevel=46..48}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=46..48}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]},distance=..5] run scoreboard players set @e[scores={AdventureLevel=46..48}] AdventureLevel 49

execute if entity @e[scores={AdventureLevel=47}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=47}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=47}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=47}] AdventureLevel 48

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You're back! But where are the samples?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=130}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=130}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I don't understand. Did you lose them?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=320}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=320}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Alright, well. I'm not sure what happened over there.","color":"none","bold":false,"underlined":false}]

# LOOP BACK TO DIALOGUE
scoreboard players set @e[scores={AdventureLevel=48,AdventureTimer=321}] AdventureTimer -100
scoreboard players set @e[scores={AdventureLevel=48,AdventureTimer=..-90}] AdventureLevel 46
scoreboard players set @e[scores={AdventureLevel=46,AdventureTimer=..-80}] AdventureTimer 51



# SEEING ZOMBO WITH PLANTS - 49
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] run replaceitem block 965 93 2002 container.16 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"Zombo Pincers\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:["Designed to handle the object"]}}

execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Ah! You have a sample.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49,AdventureTimer=80}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=80}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hand it to me please.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=49}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureLevel 50

execute if entity @e[scores={AdventureLevel=50,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=50,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Be careful with that. Just hand it to me please.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49..50}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=49..50}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=49..50}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=49..50}] AdventureLevel 52
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] at @e[tag=DrZombo] run playsound block.slime_block.break master @a ~ ~ ~ 0.5 1.4 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] at @e[tag=DrZombo] run tag @p[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] add AdventurePlantSwapper


# ZOMBO PLANT SWAP
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] run function d3:adventure/item_swap
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] run tag @a remove AdventurePlantSwapper



############

execute if entity @e[scores={AdventureLevel=..51}] run kill @e[tag=AdventureDisplay3]
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=10}] at @e[tag=DrZombo] run summon armor_stand ~0.45 ~-0.6 ~ {Invisible:true,Invulnerable:true,Markler:true,NoGravity:true,Rotation:[180f,0f],Tags:["AdventureDisplay3AS","AdventureDisplay3"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:sea_pickle"},Tags:["AdventureDisplay3","AdventureDisplay3Block"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1..219}] as @e[tag=DrZombo] run data merge entity @s {Rotation:[270f,20f]}

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=15}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=15}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=105}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=105}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"What is this? I haven't seen this specimen here before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220..280}] as @e[tag=DrZombo] run data merge entity @s {Rotation:[270f,0f]}
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Very peculiar...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280}] at @e[tag=DrZombo] run playsound block.slime_block.break master @a ~ ~ ~ 0.5 1.4 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280}] run kill @e[tag=AdventureDisplay3]
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280..339}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Let's place this for better examination, shall we?","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=52,AdventureTimer=380}] run tag @e[tag=DrZombo] add Deskto3Case1


# MOVE ZOMBO TO DISPLAY CASE 3
execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case1
execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case2
execute if entity @e[scores={AdventureLevel=..51}] run tag @e remove Deskto3Case3

execute as @e[tag=Deskto3Case1] at @s run teleport @s ^ ^ ^0.15 facing 969 93 1998
execute as @e[tag=Deskto3Case2] at @s run teleport @s ^ ^ ^0.15 facing 968 93 2005

execute if entity @e[scores={AdventureLevel=25..47}] run teleport @e[tag=DrZombo] 967.3 93 1998.6
execute if entity @e[scores={AdventureLevel=52}] align x align y align z as @e[tag=DrZombo,x=969,y=93,z=1998,dx=0,dy=0,dz=0] run tag @s add Deskto3Case2
execute align x align y align z run tag @e[tag=Deskto3Case2,x=968,y=93,z=2005,dx=0,dy=0,dz=0] add Deskto3Case3

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=410}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=410}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"If you have any more, just place them in that box beside my desk.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Deskto3Case3] run scoreboard players set @e[scores={AdventureLevel=52}] AdventureTimer 0
execute if entity @e[tag=Deskto3Case3] run scoreboard players set @e[scores={AdventureLevel=52}] AdventureLevel 53

tag @e[tag=Deskto3Case2] remove Deskto3Case1
tag @e[tag=Deskto3Case3] remove Deskto3Case2

execute if entity @e[scores={AdventureLevel=..52}] unless block 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=..53,AdventureTimer=..29}] unless block 68 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=1}] run tag @e remove Deskto3Case3

execute if entity @e[scores={AdventureLevel=53,AdventureTimer=1}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 0
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=25}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=30}] run playsound block.iron_trapdoor.open master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=30}] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=true]
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=40}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=53,AdventureTimer=45}] run tag @e[tag=DrZombo] add Deskto3Case4

execute if entity @e[scores={AdventureLevel=53}] if entity @e[tag=Deskto3Case4] run scoreboard players set @e[scores={AdventureLevel=53}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=53,AdventureTimer=-20..-1}] AdventureLevel 54


# PLANT IN CASE - 54
execute if entity @e[scores={AdventureLevel=54}] run tag @e remove Deskto3Case4
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1}] run playsound block.slime_block.break master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=10}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=20}] run playsound block.iron_trapdoor.close master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=20}] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=30}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Interesting. I'm not even sure this specimen existed before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"This is incredible. Because of this, I'm definitely making you my ","color":"none","bold":false,"underlined":false},{"text":"personal apprentice","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh! I almost forgot.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=450..}] run scoreboard players set @e[scores={AdventureLevel=54}] AdventureTimer -30
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=..-25}] run scoreboard players set @e[scores={AdventureLevel=54}] AdventureLevel 60


# ZOMBO TELLS YOU TO GET ZOMBOCRON - 60
execute if entity @e[scores={AdventureLevel=60..}] run tag @a add DoorLevel4
execute if entity @e[scores={AdventureLevel=60..70}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I've figured out what caused the power outage.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=80}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=80}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The drill uncovered a very mysterious, and apparently powerful ","color":"none","bold":false,"underlined":false},{"text":"orange object","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It must have caused the generators to go offline.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"As my ","color":"none","bold":false,"underlined":false},{"text":"apprentice","color":"red","bold":true,"underlined":false},{"text":", you now have unsupervised access through all ","color":"none","bold":false,"underlined":false},{"text":"red level doors","color":"red","bold":true,"underlined":false},{"text":", just like myself.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=490}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=490}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Go down into the ","color":"none","bold":false,"underlined":false},{"text":"Drilling Crater","color":"red","bold":true,"underlined":false},{"text":", and bring back that ","color":"none","bold":false,"underlined":false},{"text":"object","color":"gold","bold":true,"underlined":false},{"text":". We will do some tests.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=650}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=650}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Based on my readings, I manufactured a ","color":"none","bold":false,"underlined":false},{"text":"tool","color":"gray","bold":true,"underlined":false},{"text":", that should counter its elemental composition and let you pull it out of the crater. I left it in the box beside my desk.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But please be careful. We don't yet know what this ","color":"none","bold":false,"underlined":false},{"text":"object","color":"gold","bold":true,"underlined":false},{"text":" is.","color":"none","bold":false,"underlined":false}]


# INTO CRATER - 61
execute if entity @e[scores={AdventureLevel=60}] align x align y align z if entity @a[x=1023,y=79,z=1993,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=..60}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=60}] align x align y align z if entity @a[x=1023,y=79,z=1993,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=..60}] AdventureLevel 61

execute if entity @e[scores={AdventureLevel=..60}] unless block 1000 52 2000 orange_wool run setblock 1000 52 2000 orange_wool
execute if entity @e[scores={AdventureLevel=61,AdventureTimer=1}] run playsound ambient.cave master @a 1000 52 2000 5 0.5 0
execute if block 1000 52 2000 air run playsound entity.phantom.swoop ambient @a 1000 52 2000 0.5 0.5 0
execute if block 1000 52 2000 air run setblock 1000 52 2000 structure_void

execute if entity @e[scores={AdventureLevel=60..67}] as @e[type=item,nbt={Item:{id:"minecraft:orange_wool"}},nbt=!{Item:{tag:{Object:1b,display:{Name:"{\"italic\":\"false\",\"color\":\"gold\",\"text\":\"The Object\"}"}}}}] run data merge entity @s {Item:{tag:{Object:1b,display:{Name:"{\"italic\":\"false\",\"color\":\"gold\",\"text\":\"The Object\"}"}}}}
execute if entity @e[scores={AdventureLevel=60..61}] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=..62}] AdventureLevel 65

execute if entity @e[scores={AdventureLevel=65..67}] if entity @e[nbt={Item:{tag:{Object:1b}}}] run scoreboard objectives add ObjectReturns dummy
execute unless entity @e[nbt={Item:{tag:{Object:1b}}}] run scoreboard objectives remove ObjectReturns
scoreboard players add @e[nbt={Item:{tag:{Object:1b}}}] ObjectReturns 1
execute if entity @e[scores={ObjectReturns=0..}] as @e[nbt={Item:{tag:{Object:1b}}}] run data merge entity @s {NoGravity:true}
execute if entity @e[scores={ObjectReturns=50}] as @e[nbt={Item:{tag:{Object:1b}}}] run data merge entity @s {NoGravity:true,Motion:[0.0d,0.0d,0.0d]}
#execute if entity @e[scores={AdventureLevel=65..67}] as @e[type=item,nbt={Item:{tag:{Object:1b}}}] at @s run teleport @s ^ ^ ^0.5 facing entity @p eyes
execute if entity @e[scores={AdventureLevel=65..67}] as @e[scores={ObjectReturns=51..}] at @s run teleport @s ^ ^ ^0.25 facing entity @p eyes

# DOESN'T WORK ON ITEMS? -> effect give @e[tag=Zombocron] glowing 1 1

# GIVE ZOMBO OBJECT - 66
execute if entity @e[scores={AdventureLevel=65}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]},distance=..7] run scoreboard players set @e[scores={AdventureLevel=..65}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=65}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]},distance=..7] run scoreboard players set @e[scores={AdventureLevel=..65}] AdventureLevel 66
execute if entity @e[scores={AdventureLevel=66,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=66,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Excellent. Thank you. Now carefully hand it to me.","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=66}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:orange_wool"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..66}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=66}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:orange_wool"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..66}] AdventureLevel 67

execute if entity @e[scores={AdventureLevel=67,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=67,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"No. Hand it to me, please. Don't throw it on the ground.","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=..74}] if entity @e[tag=AdventureDisplay2] run kill @e[tag=AdventureDisplay2]

execute if entity @e[scores={AdventureLevel=66..67}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=..67}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=66..67}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=..67}] AdventureLevel 70
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=1}] at @e[tag=DrZombo] run playsound block.wool.hit master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=1}] at @e[tag=DrZombo] run clear @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] orange_wool
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=15}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=15}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Good. Good.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=105}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=105}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I'll place this in the case. Then we can better examine its properties.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=70,AdventureTimer=175}] if entity @e[tag=AdventureDisplay3] run scoreboard players set @e[scores={AdventureLevel=70,AdventureTimer=175}] AdventureLevel 73
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=175}] unless entity @e[tag=AdventureDisplay3] run scoreboard players set @e[scores={AdventureLevel=70,AdventureTimer=175}] AdventureLevel 71


execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case1
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case2
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case3
execute if entity @e[scores={AdventureLevel=..70}] run tag @e remove Deskto2Case4

# IF DISPLAY CASE 3 DOESN'T EXIST - 71
execute if entity @e[scores={AdventureLevel=71,AdventureTimer=200}] run tag @e[tag=DrZombo] add Deskto2Case1

execute as @e[tag=Deskto2Case1] at @s run teleport @s ^ ^ ^0.15 facing 970 93 1998
execute as @e[tag=Deskto2Case2] at @s run teleport @s ^ ^ ^0.15 facing 970 93 2005

execute if entity @e[scores={AdventureLevel=71}] align x align y align z as @e[tag=DrZombo,x=970,y=93,z=1998,dx=0,dy=0,dz=0] run tag @s add Deskto2Case2
execute align x align y align z run tag @e[tag=Deskto2Case2,x=970,y=93,z=2005,dx=0,dy=0,dz=0] add Deskto2Case3

execute if entity @e[tag=Deskto2Case3] run scoreboard players set @e[scores={AdventureLevel=71}] AdventureTimer 0
execute if entity @e[tag=Deskto2Case3] run scoreboard players set @e[scores={AdventureLevel=71}] AdventureLevel 72

tag @e[tag=Deskto2Case2] remove Deskto2Case1
tag @e[tag=Deskto2Case3] remove Deskto2Case2

execute if entity @e[scores={AdventureLevel=..70}] unless block 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=1}] run tag @e remove Deskto2Case3

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=1}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 0
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=25}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=30}] run playsound block.iron_trapdoor.open master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=30}] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=true]
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=40}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=45}] run tag @e[tag=DrZombo] add Deskto2Case4

execute if entity @e[scores={AdventureLevel=72}] if entity @e[tag=Deskto2Case4] run scoreboard players set @e[scores={AdventureLevel=72}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=72,AdventureTimer=..-1}] AdventureLevel 75


# IF DISPLAY CASE 3 DOES EXIST - 73
execute if entity @e[scores={AdventureLevel=73,AdventureTimer=200}] run tag @e[tag=DrZombo] add 3Caseto2Case1

execute as @e[tag=3Caseto2Case1] at @s run teleport @s ^ ^ ^0.15 facing 971 93 2005.2

execute if entity @e[scores={AdventureLevel=73}] align x align y align z as @e[tag=DrZombo,x=971,y=93,z=2005,dx=-.5,dy=0,dz=0] run tag @s add 3Caseto2Case2

teleport @e[tag=3Caseto2Case2] 970 93 2006.2
execute if entity @e[tag=3Caseto2Case2] run scoreboard players set @e[scores={AdventureLevel=73}] AdventureTimer 0
execute if entity @e[tag=3Caseto2Case2] run scoreboard players set @e[scores={AdventureLevel=73}] AdventureLevel 72

tag @e[tag=3Caseto2Case2] remove 3Caseto2Case1
tag @e[tag=3Caseto2Case2] remove 3Caseto2Case2



# ZOMBOCRON REVEALED - 75
execute if entity @e[scores={AdventureLevel=75}] run tag @e remove Deskto2Case4
execute if entity @e[scores={AdventureLevel=75}] run tag @e remove 3Caseto2Case2
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1}] run playsound entity.item.pickup master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=10}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=20}] run playsound block.iron_trapdoor.close master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=20}] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=30}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 15
#execute if entity @e[scores={AdventureLevel=75,AdventureTimer=30..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @e[tag=Zombocron,limit=1]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Remarkable.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It floats inside this containment as if gravity does not affect it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I should give it a name.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"This is a momentous scientific discovery. I'm calling it...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] at @e[tag=DrZombo] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 0.7 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] at @e[tag=DrZombo] run playsound ambient.cave master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=525}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The Zombocron","color":"gold","bold":true,"underlined":false},{"text":"!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=510..680}] as @e[tag=DrZombo] at @s run teleport @s ~ ~ ~ ~ -70

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=690}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=690}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"After myself, y'know. Sure, you technically were the one who grabbed it for me, but you can name the next discovery, okay?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=820}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=820}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Alright, it's been a long day. You look exhausted. Why don't head back to your room. Get some rest.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"After you sleep, we'll do some experiments and see what ","color":"none","bold":false,"underlined":false},{"text":"The Zombocron","color":"gold","bold":true,"underlined":false},{"text":" is capable of.","color":"none","bold":false,"underlined":false}]






########## ACT 3 #############

execute if entity @e[scores={AdventureLevel=75}] if entity @a[nbt={Sleeping:1b}] run scoreboard objectives add Act3Sleeping dummy
execute if entity @e[scores={AdventureLevel=75}] if entity @a[nbt={Sleeping:1b}] run scoreboard players add @e[tag=MainAdventureAEC] Act3Sleeping 1
execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=100}] run scoreboard players set @e[scores={AdventureLevel=75,Act3Sleeping=100}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=100}] run scoreboard players set @e[scores={AdventureLevel=75,Act3Sleeping=100}] AdventureLevel 100
execute if entity @e[scores={AdventureLevel=75}] if entity @a[nbt=!{Sleeping:1b}] run scoreboard players set @e[tag=MainAdventureAEC] Act3Sleeping 0

execute if entity @e[scores={AdventureLevel=100}] run scoreboard objectives remove Act3Sleeping
execute if entity @e[scores={AdventureLevel=100}] as @e[tag=AdventureVillager,nbt=!{Silent:true}] run data merge entity @s {Silent:true}
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=AdventureCEO]
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=DrZombo]
execute if entity @e[scores={AdventureLevel=100}] run kill @e[tag=Zombocron]

execute if entity @e[scores={AdventureLevel=75}] run scoreboard objectives remove ReceptionTimer
execute if entity @e[scores={AdventureLevel=100..105}] align x align y align z if entity @a[x=967,y=106,z=1993,dx=6,dy=4,dz=13] run scoreboard objectives add ReceptionTimer dummy
execute if entity @e[scores={AdventureLevel=100..105,ReceptionTimer=1}] at @e[tag=AdventureReceptionist] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=100..105,ReceptionTimer=1}] run tellraw @a ["",{"text":"<Rico> ","color":"dark_green","bold":false},{"text":"He's gone. He left while you were asleep. Seemed to be in a rush.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=106}] run scoreboard objectives remove ReceptionTimer

execute if entity @e[scores={AdventureLevel=..99}] if block 970 95 2006 air run setblock 970 95 2006 iron_trapdoor[facing=north,half=bottom,open=false]
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 94 2006 orange_stained_glass run setblock 970 94 2006 orange_stained_glass
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2006 quartz_pillar[axis=y] run setblock 970 93 2006 quartz_pillar[axis=y]
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2005 air run setblock 970 93 2005 air
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2004 air run setblock 970 93 2004 air
execute if entity @e[scores={AdventureLevel=..99}] unless block 970 93 2003 air run setblock 970 93 2003 air

execute if entity @e[scores={AdventureLevel=100..}] unless block 970 95 2006 air run setblock 970 95 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 94 2006 air run setblock 970 94 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2006 air run setblock 970 93 2006 air
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2005 quartz_pillar[axis=z] run setblock 970 93 2005 quartz_pillar[axis=z]
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2004 orange_stained_glass run setblock 970 93 2004 orange_stained_glass
execute if entity @e[scores={AdventureLevel=100..}] unless block 970 93 2003 iron_trapdoor run setblock 970 93 2003 iron_trapdoor[facing=north,half=bottom,open=false]

execute if entity @e[scores={AdventureLevel=100}] run difficulty easy
execute if entity @e[scores={AdventureLevel=100..}] run effect give @a saturation 1 255 true


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
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=395}] run tellraw @a ["",{"text":"<Mr. Seeioh (on com)> ","color":"yellow","bold":false},{"text":"No! Stay at Base! That is an order!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=105,AdventureTimer=460}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=465}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.9 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=465}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"No, don't listen to him! Come quickly!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=105,AdventureTimer=540}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=545}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.8 0
execute if entity @e[scores={AdventureLevel=105,AdventureTimer=545}] run tellraw @a ["",{"text":"<Mr. Seeioh (on com)> ","color":"yellow","bold":false},{"text":"Do not come here! If you do, you","color":"none","bold":false,"underlined":false},{"text":"radio becomes broken","color":"none","obfuscated":true,"underlined":false}]


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
execute if entity @e[scores={AdventureLevel=105}] run kill @e[tag=ZombieZombo]
execute if entity @e[scores={AdventureLevel=105}] run team add Zombo

execute if entity @e[scores={AdventureLevel=105}] unless entity @e[tag=ZombieCEO] run summon zombie_villager 854 104 2034 {CustomName:"{\"text\":\"Mr. Seeioh\",\"color\":\"yellow\"}",CustomNameVisible:false,Invulnerable:false,NoAI:true,Silent:true,Profession:3,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"Space Helmet"}}}],Tags:["AdventureZombie","ZombieCEO"]}

execute if entity @e[scores={AdventureLevel=105}] run teleport @e[tag=DrZombo] 853 104 2034 90 0
execute if entity @e[scores={AdventureLevel=105}] unless entity @e[tag=DrZombo] run summon villager 853 104 2034 {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:false,NoAI:true,Silent:true,Profession:1,Offers:{},Rotation:[90f,0f],Tags:["AdventureVillager","DrZombo"],Team:Zombo}
execute if entity @e[scores={AdventureLevel=105..106}] run replaceitem entity @e[tag=DrZombo] armor.head orange_stained_glass

execute if entity @e[scores={AdventureLevel=100..105}] align x align y align z if entity @a[x=853,y=104,z=2039,dx=2,dy=4,dz=4] run scoreboard players set @e[scores={AdventureLevel=100..105}] AdventureTimer -50
scoreboard players set @e[scores={AdventureLevel=100..105,AdventureTimer=-50}] AdventureLevel 106

execute if entity @e[scores={AdventureLevel=106}] run effect give @e[tag=DrZombo] resistance 3 255 true

execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-50}] as @e[tag=DrZombo] run data merge entity @s {NoAI:false,Silent:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-48}] as @e[tag=ZombieCEO] run data merge entity @s {NoAI:false,Silent:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-50}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=106,AdventureTimer=-50}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Help me!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=106,AdventureTimer=0..}] unless entity @e[tag=ZombieCEO] run scoreboard players set @e[scores={AdventureLevel=106}] AdventureLevel 107

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
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"He said it was the real reason we had been drilling. He said it was a missing artefact for some distant ","color":"none","bold":false,"underlined":false},{"text":"Monument","color":"aqua","bold":true,"underlined":false},{"text":" that needed to be completed.","color":"none","bold":false,"underlined":false}]

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

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=940}] at @e[tag=DrZombo] run summon item ~ ~1 ~ {NoGravity:true,Item:{id:"orange_wool",Count:1b,tag:{Zombocron:1b,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"The Zombocron\"}",Lore:["Destroy it in the Crater?","Or leave with it in the Shuttle?"]}}}}
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
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320}] at @e[tag=DrZombo] unless entity @e[tag=ZombieZombo] run summon zombie_villager ~ ~-10 ~ {CustomName:"{\"text\":\"Dr. Zombo\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:true,NoAI:true,Silent:true,Profession:1,ArmorItems:[{},{},{},{id:"minecraft:orange_stained_glass",Count:1b}],Tags:["ZombieZombo"],Team:Zombo}
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320..1389}] run effect give @e[tag=ZombieZombo] invisibility 100 255 true
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1320..1350}] at @e[tag=DrZombo] run teleport @e[tag=ZombieZombo] ~ ~-5 ~ ~ ~
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie_villager.ambient master @a 1 1 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie.infect master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 0.5 0
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1389}] at @e[tag=DrZombo] run particle falling_dust orange_wool ~ ~1.4 ~ 0.3 0.6 0.3 0 500 force
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1350..1390}] at @e[tag=DrZombo] run teleport @e[tag=ZombieZombo] ~ ~ ~ ~ ~
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1390}] run effect clear @e[tag=ZombieZombo] invisibility
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1391..}] run effect give @e[tag=DrZombo] invisibility 100 255 true
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1390}] as @e[tag=ZombieZombo] run data merge entity @s {Silent:false,NoAI:false,Invulnerable:false,CustomNameVisible:true}
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1391..}] as @e[tag=DrZombo] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1395..}] run team remove Zombo
scoreboard players set @e[scores={AdventureLevel=110,AdventureTimer=1395..}] AdventureLevel 150


# SETUP END BASE
execute if entity @e[scores={AdventureLevel=150}] at @e[tag=AdventureReceptionist] unless entity @e[tag=ZombieReceptionist] run summon zombie_villager ~ ~ ~ {CustomName:"{\"text\":\"Rico\",\"color\":\"dark_green\"}",CustomNameVisible:true,Profession:5,Rotation:[180f,0f],Attributes:[{Name:"generic.followRange",Base:1000.0d}],Tags:["AdventureZombie","ZombieReceptionist","DoorLevel1"]}
execute if entity @e[tag=ZombieReceptionist] run kill @e[tag=AdventureReceptionist]

execute if entity @e[scores={AdventureLevel=150}] at @e[tag=AdventureBob] unless entity @e[tag=ZombieBob] run summon zombie_villager ~ ~ ~ {CustomName:"{\"text\":\"Bob\",\"color\":\"dark_green\"}",CustomNameVisible:true,Profession:5,Rotation:[270f,0f],Attributes:[{Name:"generic.followRange",Base:1000.0d}],Tags:["AdventureZombie","ZombieBob"]}
execute if entity @e[tag=ZombieBob] run kill @e[tag=AdventureBob]
execute if entity @e[tag=ZombieBob] as @e[tag=AdventureDoug,nbt={NoAI:true}] run data merge entity @s {NoAI:false}
execute if entity @e[tag=ZombieBob] run tag @e[tag=AdventureDoug] add DoorLevel3
execute if entity @e[tag=ZombieBob] as @e[tag=AdventureVillager,nbt={Silent:true}] run data merge entity @s {Silent:false,Invulnerable:false}



# EPILOGUE NPCS
execute if entity @e[scores={AdventureLevel=200..}] unless entity @e[tag=AdventureAdam] run summon armor_stand 1005 57 1960 {Invulnerable:true,Rotation:[160.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures: [{Signature: "QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]}, Name: "AdamDJM"}},Count:1b}],HandItems:[{}],DisabledSlots:2039583,Tags:["AdventureAdam","AdventureMapMaker"]}

execute if entity @e[scores={AdventureLevel=200..}] unless entity @e[tag=Adventureqmagnet] run summon armor_stand 1001 57 1960 {Invulnerable:true,Rotation:[200.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}},Count:1b}],DisabledSlots:2039583,Tags:["Adventureqmagnet","AdventureMapMaker"]}

execute if entity @e[scores={AdventureLevel=200..499}] as @e[tag=AdventureMapMaker] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=200..}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @p


# CHOOSE TO KEEP WOOL - 200
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=843,y=106,z=2033,dx=2,dy=1,dz=1,nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=150..160}] align x align y align z if entity @a[x=843,y=106,z=2033,dx=2,dy=1,dz=1,nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=150..160}] AdventureLevel 200
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1..240}] run teleport @a 1004 58 1954
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2}] run playsound entity.wither.spawn master @a 1000 94 2000 100 0.5 0
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=4}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=6}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run effect give @a blindness 16 255 true
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run effect give @a night_vision 10 255 true

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run difficulty peaceful
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run clear @a
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=80}] run effect give @a nausea 15 255 true
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=130}] at @a run playsound block.portal.travel master @a ~ ~ ~ 0.5 1 0


execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1}] run kill @e[tag=AdventureMapMaker]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=150}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Hold on, Adam, they're coming to...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=300}] as @e[tag=AdventureAdam] run data merge entity @s {Pose:{RightArm:[280f,0f,0f],LeftArm:[0f,10f,350f]}}
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=300}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Woah. Take it easy there. You need to let your head adjust.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=350..}] as @e[tag=AdventureAdam] run data merge entity @s {Pose:{RightArm:[0f,0f,10f],LeftArm:[0f,10f,350f]}}

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=400}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"It's alright. It's perfectly normal what you're feeling.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=500}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Yeah. Everyone forgets how they got here at first.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=600..740}] as @e[tag=Adventureqmagnet] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureAdam,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=600}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So Adam, how did they do in the Simulation?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=630..660}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=Adventureqmagnet,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=660..820}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=EpilogueMonitor,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=700}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Uh... Looks like...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=730..890}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=EpilogueMonitor,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=780}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"They chose the \"","color":"none","bold":false,"underlined":false},{"text":"Leave everyone to die for a piece of wool","color":"none","bold":false,"italic":true},{"text":"\" ending.","color":"none","bold":false,"italic":false}]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=740..880}] as @e[tag=Adventureqmagnet] at @s run teleport @s ^ ^ ^ facing entity @e[tag=EpilogueMonitor,limit=1]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=950}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Hmmm. That is concerning.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1050}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"So... You just left? All those innocent lives to die?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1150}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Wow...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1200}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"What kind of a person does that?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1298..1850}] as @e[tag=Adventureqmagnet] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureAdam,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1300}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Yeah. I guess you never really know someone, do you?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1360..1840}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=Adventureqmagnet,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1370}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"You said it, Q.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1470}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"What do we do now?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1570}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"I don't know. I just don't know anymore.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1700}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Well, the Branch was technically completed...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1800}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"True. But look at the cost...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=1995..2180}] as @e[tag=Adventureqmagnet] at @s run teleport @s ^ ^ ^ facing entity @e[tag=AdventureAdam,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2000}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Alright. Just give 'em the Orange Wool.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2030..2190}] as @e[tag=AdventureAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=Adventureqmagnet,limit=1]
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2080}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Are you sure?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2200}] run tellraw @a ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"*sigh* Don't make us regret this.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2300}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Okay. Here. Congratulations or something. I guess...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2300..}] as @e[tag=Adventureqmagnet] run data merge entity @s {Pose:{Head:[30f,0f,0f]}}
execute if entity @e[scores={AdventureLevel=200,AdventureTimer=2300..}] at @e[tag=AdventureAdam] run playsound block.wool.step master @a ~ ~ ~ 0.5 1 0
scoreboard players set @e[scores={AdventureLevel=200,AdventureTimer=2300..}] AdventureLevel 500



# CHOOSE TO DESTROY WOOL - 250
execute if entity @e[scores={AdventureLevel=160}] align x align y align z if entity @a[x=997,y=93,z=1967,dx=6,dy=1,dz=6] run scoreboard players set @e[scores={AdventureLevel=160}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=160}] align x align y align z if entity @a[x=997,y=93,z=1967,dx=6,dy=1,dz=6] run scoreboard players set @e[scores={AdventureLevel=160}] AdventureLevel 250
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=1..240}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=2}] run playsound entity.wither.spawn master @a 1000 94 2000 100 0.5 0
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=2}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=4}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=6}] run playsound entity.generic.explode master @a 1000 94 2000 100 1 1
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=1}] run effect give @a blindness 12 255 true
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=1}] run effect give @a night_vision 12 255 true

execute if entity @e[scores={AdventureLevel=250,AdventureTimer=1}] run difficulty peaceful
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=1}] run clear @a
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=80}] run effect give @a nausea 15 255 true
execute if entity @e[scores={AdventureLevel=250,AdventureTimer=130}] at @a run playsound block.portal.travel master @a ~ ~ ~ 0.5 1 0





# CHOOSE TO THROW WOOL OFF PLANET
#execute if entity @e[scores={AdventureLevel=110,AdventureTimer=1391..}] run scoreboard players set @e[tag=MainAdventureAEC] AdventureLevel 150




# COMPLETE BRANCH - 500
execute if entity @e[scores={AdventureLevel=500}] as @e[tag=AdventureAdam] run data merge entity @s {HandItems:[{id:"minecraft:orange_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,10f,10f]}}

tag @a remove HasOrangeWool
execute if entity @e[scores={AdventureLevel=500}] run tag @p[nbt={Inventory:[{id:"minecraft:orange_wool"}]}] add HasOrangeWool
execute if entity @p[tag=HasOrangeWool] run clear @a
replaceitem entity @p[tag=HasOrangeWool] weapon.mainhand orange_wool
execute if entity @p[tag=HasOrangeWool] run setblock 46 2 78 clay
execute if entity @p[tag=HasOrangeWool] run teleport @a 40 4 65 0 -90
