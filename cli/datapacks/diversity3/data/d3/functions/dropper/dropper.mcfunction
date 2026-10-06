####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 13 2017 / MARCH 25 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect give @a night_vision 12 255 true
effect clear @a[x=-1162,y=0,z=-147,dx=341,dy=-100,dz=341] night_vision

advancement grant @a[nbt={Inventory:[{Slot:103b,id:"minecraft:player_head",tag:{SkullOwner:{Id:"6e3cb648-09bb-4a3d-a1f8-b8a017078e34"}}}]}] only d3:folder_c/adam_west

scoreboard objectives add DropDeaths deathCount {"text":"Broken Bones","color":"blue","bold":"true","underlined":"true"}
scoreboard objectives setdisplay sidebar DropDeaths

#scoreboard objectives setdisplay sidebar TravelTime
#scoreboard objectives setdisplay sidebar YellowTravel
#scoreboard objectives setdisplay sidebar OrangeTravel
#scoreboard objectives setdisplay sidebar PurpleTravel
#scoreboard objectives setdisplay sidebar DropSpeech
#scoreboard objectives setdisplay sidebar GolemExists
#scoreboard objectives setdisplay sidebar BatExists
#scoreboard objectives setdisplay sidebar DropperTicket
#scoreboard objectives setdisplay sidebar Barrel1
#scoreboard objectives setdisplay sidebar Barrel2
#scoreboard objectives setdisplay sidebar Barrel3
#scoreboard objectives setdisplay sidebar Barrel4

execute unless entity @a[team=Dropper] run team add Dropper
team modify Dropper collisionRule never
team modify Dropper friendlyFire true
team join Dropper @a[team=!Dropper]

#kill @e[type=tnt]


# WHY DO I HAVE THIS?
difficulty peaceful
#effect give @a[nbt=!{Health:20.0f}] instant_health 1 255 true


# BRING STRAGGLERS
execute if block 1 4 2 blue_wool run gamemode adventure @a[tag=!InDropperBranch,tag=!D3Admin]
execute if block 1 4 2 blue_wool if entity @a[tag=!InDropperBranch] run function d3:dropper/dropper_stragglers
execute if block 1 4 2 blue_wool run clear @a[tag=!InDropperBranch]
execute if block 1 4 2 blue_wool run tag @a add InDropperBranch


# JUMP BOOST PADS IN THE DROPPER SLOT ROOM
execute align x align y align z run effect give @a[x=-1001,y=235,z=15,dx=0,dy=2,dz=0] jump_boost 1 2
execute align x align y align z run effect give @a[x=-993,y=235,z=16,dx=0,dy=2,dz=0] jump_boost 1 6
execute align x align y align z run effect give @a[x=-993,y=235,z=16,dx=0,dy=2,dz=0] resistance 2 255 true
execute align x align y align z run effect give @a[x=-1009,y=235,z=16,dx=0,dy=2,dz=0] jump_boost 1 9
execute align x align y align z run effect give @a[x=-1009,y=235,z=16,dx=0,dy=2,dz=0] resistance 2 255 true

scoreboard objectives add TravelTime dummy
scoreboard objectives add YellowTravel dummy
scoreboard objectives add OrangeTravel dummy
scoreboard objectives add PurpleTravel dummy
scoreboard objectives add BrownTravel dummy
scoreboard objectives add WhiteTravel dummy
scoreboard objectives add GreenTravel dummy
scoreboard objectives add BlackTravel dummy
scoreboard objectives add LimeTravel dummy
scoreboard objectives add LightBlueTravel dummy

scoreboard players add @a YellowTravel 0
scoreboard players add @a OrangeTravel 0
scoreboard players add @a PurpleTravel 0
scoreboard players add @a BrownTravel 0
scoreboard players add @a WhiteTravel 0
scoreboard players add @a GreenTravel 0
scoreboard players add @a BlackTravel 0
scoreboard players add @a LimeTravel 0
scoreboard players add @a LightBlueTravel 0

scoreboard objectives add Barrel1 dummy
scoreboard objectives add Barrel2 dummy
scoreboard objectives add Barrel3 dummy
scoreboard objectives add Barrel4 dummy

scoreboard objectives add DropSpeech dummy

# SETS TRAVEL SCORE TO ZERO WHEN ON GROUND
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={YellowTravel=..3}] YellowTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={OrangeTravel=..3}] OrangeTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={PurpleTravel=..3}] PurpleTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={BrownTravel=..3}] BrownTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={WhiteTravel=..3}] WhiteTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={GreenTravel=..3}] GreenTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={BlackTravel=..3}] BlackTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={LimeTravel=..3}] LimeTravel 0
execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=2,scores={LightBlueTravel=..3}] LightBlueTravel 0


# SELECT YELLOW SLOT
execute align x align y align z run scoreboard players set @a[x=-1006,y=246,z=18,dx=2,dy=2,dz=0,scores={YellowTravel=0}] YellowTravel 1
execute align x align y align z if entity @a[x=-1006,y=246,z=21,dx=2,dy=2,dz=0,scores={YellowTravel=1}] run scoreboard players set @a YellowTravel 2
execute if entity @a[scores={YellowTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={YellowTravel=2}] run summon armor_stand -1005 246 21 {NoGravity:true,Invisible:true,Tags:["YellowStand","DropperStand1"]}
scoreboard players set @a[scores={YellowTravel=2}] YellowTravel 3

# SELECT ORANGE SLOT
execute align x align y align z run scoreboard players set @a[x=-1002,y=246,z=18,dx=2,dy=2,dz=0,scores={OrangeTravel=0}] OrangeTravel 1
execute align x align y align z if entity @a[x=-1002,y=246,z=21,dx=2,dy=2,dz=0,scores={OrangeTravel=1}] run scoreboard players set @a OrangeTravel 2
execute if entity @a[scores={OrangeTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={OrangeTravel=2}] run summon armor_stand -1001 246 21 {NoGravity:true,Invisible:true,Tags:["OrangeStand","DropperStand1"]}
scoreboard players set @a[scores={OrangeTravel=2}] OrangeTravel 3

# SELECT PURPLE SLOT
execute align x align y align z run scoreboard players set @a[x=-998,y=246,z=18,dx=2,dy=2,dz=0,scores={PurpleTravel=0}] PurpleTravel 1
execute align x align y align z if entity @a[x=-998,y=246,z=21,dx=2,dy=2,dz=0,scores={PurpleTravel=1}] run scoreboard players set @a PurpleTravel 2
execute if entity @a[scores={PurpleTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={PurpleTravel=2}] run summon armor_stand -997 246 21 {NoGravity:true,Invisible:true,Tags:["PurpleStand","DropperStand1"]}
scoreboard players set @a[scores={PurpleTravel=2}] PurpleTravel 3

# SELECT BROWN SLOT
execute align x align y align z run scoreboard players set @a[x=-1006,y=242,z=18,dx=2,dy=2,dz=0,scores={BrownTravel=0}] BrownTravel 1
execute align x align y align z if entity @a[x=-1006,y=242,z=21,dx=2,dy=2,dz=0,scores={BrownTravel=1}] run scoreboard players set @a BrownTravel 2
execute if entity @a[scores={BrownTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={BrownTravel=2}] run summon armor_stand -1005 242 21 {NoGravity:true,Invisible:true,Tags:["BrownStand","DropperStand1"]}
scoreboard players set @a[scores={BrownTravel=2}] BrownTravel 3

# SELECT WHITE SLOT
execute align x align y align z run scoreboard players set @a[x=-1002,y=242,z=18,dx=2,dy=2,dz=0,scores={WhiteTravel=0}] WhiteTravel 1
execute align x align y align z if entity @a[x=-1002,y=242,z=21,dx=2,dy=2,dz=0,scores={WhiteTravel=1}] run scoreboard players set @a WhiteTravel 2
execute if entity @a[scores={WhiteTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={WhiteTravel=2}] run summon armor_stand -1001 242 21 {NoGravity:true,Invisible:true,Tags:["WhiteStand","DropperStand1"]}
scoreboard players set @a[scores={WhiteTravel=2}] WhiteTravel 3

# SELECT GREEN SLOT
execute align x align y align z run scoreboard players set @a[x=-998,y=242,z=18,dx=2,dy=2,dz=0,scores={GreenTravel=0}] GreenTravel 1
execute align x align y align z if entity @a[x=-998,y=242,z=21,dx=2,dy=2,dz=0,scores={GreenTravel=1}] run scoreboard players set @a GreenTravel 2
execute if entity @a[scores={GreenTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={GreenTravel=2}] run summon armor_stand -997 242 21 {NoGravity:true,Invisible:true,Tags:["GreenStand","DropperStand1"]}
scoreboard players set @a[scores={GreenTravel=2}] GreenTravel 3

# SELECT BLACK SLOT
execute align x align y align z run scoreboard players set @a[x=-1006,y=238,z=18,dx=2,dy=2,dz=0,scores={BlackTravel=0}] BlackTravel 1
execute align x align y align z if entity @a[x=-1006,y=238,z=21,dx=2,dy=2,dz=0,scores={BlackTravel=1}] run scoreboard players set @a BlackTravel 2
execute if entity @a[scores={BlackTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={BlackTravel=2}] run summon armor_stand -1005 238 21 {NoGravity:true,Invisible:true,Tags:["BlackStand","DropperStand1"]}
scoreboard players set @a[scores={BlackTravel=2}] BlackTravel 3

# SELECT LIME SLOT
execute align x align y align z run scoreboard players set @a[x=-1002,y=238,z=18,dx=2,dy=2,dz=0,scores={LimeTravel=0}] LimeTravel 1
execute align x align y align z if entity @a[x=-1002,y=238,z=21,dx=2,dy=2,dz=0,scores={LimeTravel=1}] run scoreboard players set @a LimeTravel 2
execute if entity @a[scores={LimeTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={LimeTravel=2}] run summon armor_stand -1001 238 21 {NoGravity:true,Invisible:true,Tags:["LimeStand","DropperStand1"]}
scoreboard players set @a[scores={LimeTravel=2}] LimeTravel 3

# SELECT LIGHT BLUE SLOT
execute align x align y align z run scoreboard players set @a[x=-998,y=238,z=18,dx=2,dy=2,dz=0,scores={LightBlueTravel=0}] LightBlueTravel 1
execute align x align y align z if entity @a[x=-998,y=238,z=21,dx=2,dy=2,dz=0,scores={LightBlueTravel=1}] run scoreboard players set @a LightBlueTravel 2
execute if entity @a[scores={LightBlueTravel=2}] run kill @e[tag=DropperStand1]
execute if entity @a[scores={LightBlueTravel=2}] run summon armor_stand -997 238 21 {NoGravity:true,Invisible:true,Tags:["LightBlueStand","DropperStand1"]}
scoreboard players set @a[scores={LightBlueTravel=2}] LightBlueTravel 3


# TRAVEL COMMAND
execute as @e[tag=DropperStand1] at @s run teleport @s ^ ^ ^1 facing -1001 239.3 33
execute align x align y align z run kill @e[tag=DropperStand1,x=-1001,y=239,z=33,dx=0,dy=3,dz=0]
execute if entity @a[scores={YellowTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={OrangeTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={PurpleTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={BrownTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={WhiteTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={GreenTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={BlackTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={LimeTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute if entity @a[scores={LightBlueTravel=2..3}] at @e[tag=DropperStand1] run teleport @a ~ ~ ~
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0] run scoreboard players set @e[tag=MainDropperAEC] TravelTime -200
execute align x align y align z run effect give @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0] resistance 1 255 true
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0] run kill @e[tag=DropperStand1]

execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={YellowTravel=3}] run setblock 1 4 1 yellow_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={YellowTravel=3}] run teleport @a -1109 239 -87
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={OrangeTravel=3}] run setblock 1 4 1 orange_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={OrangeTravel=3}] run teleport @a -1001 239 -146
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={PurpleTravel=3}] run setblock 1 4 1 purple_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={PurpleTravel=3}] run teleport @a -893 239 -100
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={BrownTravel=3}] run setblock 1 4 1 brown_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={BrownTravel=3}] run teleport @a -1109 239 14
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={WhiteTravel=3}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={WhiteTravel=3}] run teleport @a -1001 217 15
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={GreenTravel=3}] run setblock 1 4 1 green_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={GreenTravel=3}] run teleport @a -893 239 14
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={BlackTravel=3}] run setblock 1 4 1 black_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={BlackTravel=3}] run teleport @a -1109 239 82
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={LimeTravel=3}] run setblock 1 4 1 lime_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={LimeTravel=3}] run teleport @a -1001 239 128
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={LightBlueTravel=3}] run setblock 1 4 1 light_blue_concrete
execute align x align y align z if entity @a[x=-1001,y=238,z=32,dx=0,dy=3,dz=0,scores={LightBlueTravel=3}] run teleport @a -893 239 128


# UNIVERSAL DROPPER LAUNCH EFFECTS
scoreboard players add @e[scores={TravelTime=100..260}] TravelTime 1
execute if entity @e[scores={TravelTime=-100}] run function d3:dropper/load_dropper_mechanic
execute if entity @e[scores={TravelTime=-100}] run kill @e[tag=DropperStand2]
execute if entity @e[scores={TravelTime=-100}] at @p run summon armor_stand ~ ~ ~ {Motion:[0.0d,0.5d,0.9d],Tags:["DropperStand2"],Invisible:true}
execute if entity @e[scores={TravelTime=-100}] at @p run particle smoke ~ ~ ~ 0.5 0.5 1.5 0 300
execute if entity @e[scores={TravelTime=-100}] at @p run playsound block.dispenser.dispense master @a ~ ~ ~ 1 1.2 1
execute at @e[tag=DropperStand2] run teleport @a ~ ~ ~
scoreboard players set @e[scores={TravelTime=-100}] TravelTime 1
execute if entity @e[scores={TravelTime=101}] run kill @e[tag=DropperCloud]
execute if entity @e[scores={TravelTime=104}] run kill @e[tag=DropperStand2]


# YELLOW DROPPER
execute if entity @a[x=-1109,y=239,z=-87,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1111.4,y=237,z=-80.4,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
#execute if entity @a[scores={YellowTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1112 234 -81 -1106 234 -75 air destroy
#execute if entity @a[scores={YellowTravel=3}] if entity @e[scores={TravelTime=110}] run fill -1112 234 -81 -1106 234 -75 yellow_concrete
#execute align x align y align z at @p[x=-1117,y=235,z=-86,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=YellowDropperCloud] run summon area_effect_cloud -1109 235.5 -78 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"yellow\"}",Tags:["YellowDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-1109,y=1,z=-78,dx=0,dy=5,dz=0] only d3:folder_b/one_drop


# ORANGE DROPPER
execute if entity @a[x=-1001,y=239,z=-146,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1003.4,y=237,z=-139.4,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={OrangeTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1004 234 -140 -998 234 -134 air destroy
execute if entity @a[scores={OrangeTravel=3}] if entity @e[scores={TravelTime=110}] run clone -1004 253 -140 -998 253 -134 -1004 234 -140
execute align x align y align z at @p[x=-1009,y=235,z=-145,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=OrangeDropperCloud] run summon area_effect_cloud -1001 235.5 -137 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"gold\"}",Tags:["OrangeDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-975,y=23,z=-115,dx=3,dy=2,dz=4] only d3:folder_b/one_drop

# HAMMER TIME
#execute align x align y align z run scoreboard players set @a[x=-964,y=24,z=-55,dx=2,dy=2,dz=2] Barrel1 1
#execute align x align y align z run scoreboard players set @a[x=-968,y=24,z=-55,dx=2,dy=2,dz=2] Barrel2 1
#execute align x align y align z run scoreboard players set @a[x=-964,y=24,z=-59,dx=2,dy=2,dz=2] Barrel3 1
#execute align x align y align z run scoreboard players set @a[x=-968,y=24,z=-59,dx=2,dy=2,dz=2] Barrel4 1
#advancement grant @a[scores={Barrel1=1,Barrel2=1,Barrel3=1,Barrel4=1}] only d3:folder_c/barrel_hopper
execute align x align y align z run advancement grant @a[x=-974,y=24,z=-86,dx=2,dy=0,dz=2,nbt={OnGround:1b}] only d3:folder_c/hammer_time
execute align x align y align z run advancement grant @a[x=-974,y=24,z=-65,dx=2,dy=0,dz=2,nbt={OnGround:1b}] only d3:folder_c/hammer_time


# PURPLE DROPPER
execute if entity @a[x=-893,y=239,z=-100,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-895.4,y=237,z=-93.4,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={PurpleTravel=3}] if entity @e[scores={TravelTime=100}] run fill -896 234 -94 -890 234 -88 air destroy
execute if entity @a[scores={PurpleTravel=3}] if entity @e[scores={TravelTime=110}] run clone -896 253 -94 -890 253 -88 -896 234 -94
execute align x align y align z at @p[x=-901,y=235,z=-99,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=PurpleDropperCloud] run summon area_effect_cloud -893 235.5 -91 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"dark_purple\"}",Tags:["PurpleDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-912,y=2,z=-111,dx=18,dy=1,dz=19] only d3:folder_b/one_drop


# BROWN DROPPER
execute if entity @a[x=-1109,y=239,z=14,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1111.4,y=237,z=20.7,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={BrownTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1112 234 20 -1106 234 26 air destroy
execute if entity @a[scores={BrownTravel=3}] if entity @e[scores={TravelTime=110}] run clone -1112 253 20 -1106 253 26 -1112 234 20
execute align x align y align z at @p[x=-1117,y=235,z=15,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=BrownDropperCloud] run summon area_effect_cloud -1109 235.5 23 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"dark_red\"}",Tags:["BrownDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z as @a[x=-1097,y=1,z=34,dx=18,dy=6,dz=18] at @s if block ~ ~ ~ water run advancement grant @s[scores={DeathLevel=0..2},gamemode=adventure] only d3:folder_b/one_drop


# WHITE DROPPER
execute if entity @a[x=-1001,y=217,z=15,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1001.4,y=215,z=23.7,dx=0.7,dy=0,dz=0.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={WhiteTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1002 212 23 -1000 212 25 air destroy
execute if entity @a[scores={WhiteTravel=3}] if entity @e[scores={TravelTime=110}] run fill -1002 212 23 -1000 212 25 blue_concrete
execute align x align y align z at @p[x=-1009,y=213,z=16,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=WhiteDropperCloud] run summon area_effect_cloud -1001 213.5 24 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"white\"}",Tags:["WhiteDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-999,y=4,z=19,dx=2,dy=2,dz=4] only d3:folder_b/one_drop
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-1005,y=4,z=19,dx=2,dy=2,dz=4] only d3:folder_b/one_drop



# GREEN DROPPER
execute if entity @a[x=-893,y=239,z=14,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-895.4,y=237,z=20.7,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={GreenTravel=3}] if entity @e[scores={TravelTime=100}] run fill -896 234 20 -890 234 26 air destroy
execute if entity @a[scores={GreenTravel=3}] if entity @e[scores={TravelTime=110}] run clone -896 253 20 -890 253 26 -896 234 20
execute align x align y align z at @p[x=-901,y=235,z=15,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=GreenDropperCloud] run summon area_effect_cloud -893 235.5 23 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"dark_green\"}",Tags:["GreenDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-885,y=2,z=42,dx=1,dy=0,dz=1] only d3:folder_b/one_drop


# BLACK DROPPER
execute if entity @a[x=-1109,y=239,z=82,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1112.4,y=237,z=90.7,dx=6.7,dy=0,dz=1.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute align x align z at @a[x=-1109,y=237,z=89,dx=0,dy=0,dz=0] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1113 234 90 -1113 234 93 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1109 234 89 -1109 234 93 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1105 234 90 -1105 234 93 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1112 234 91 -1106 234 92 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1112 234 91 -1106 234 92 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1110 234 90 -1108 234 90 air destroy
execute if entity @a[scores={BlackTravel=3}] if entity @e[scores={TravelTime=110}] run fill -1113 234 89 -1105 234 93 yellow_concrete replace air
execute align x align y align z at @p[x=-1117,y=235,z=83,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=BlackDropperCloud] run summon area_effect_cloud -1109 235.5 91 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"yellow\"}",Tags:["BlackDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z as @a[x=-1161,y=1,z=84,dx=103,dy=3,dz=2] at @s if block ~ ~ ~ water run advancement grant @s[scores={DeathLevel=0..2},gamemode=adventure] only d3:folder_b/one_drop


# LIME DROPPER
execute if entity @a[x=-1001,y=239,z=128,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-1003.4,y=237,z=134.7,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={LimeTravel=3}] if entity @e[scores={TravelTime=100}] run fill -1004 234 134 -998 234 140 air destroy
execute if entity @a[scores={LimeTravel=3}] if entity @e[scores={TravelTime=110}] run clone -1004 253 134 -998 253 140 -1004 234 134
execute align x align y align z at @p[x=-1009,y=235,z=129,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=LimeDropperCloud] run summon area_effect_cloud -1001 235.5 137 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"green\"}",Tags:["LimeDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z as @a[x=-1006,y=2,z=132,dx=10,dy=16,dz=10] at @s if block ~ ~ ~ water run advancement grant @s[scores={DeathLevel=0..2},gamemode=adventure] only d3:folder_b/one_drop


# LIGHT BLUE DROPPER
execute if entity @a[x=-893,y=239,z=128,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={TravelTime=-200}] TravelTime -100
execute at @a[x=-895.4,y=237,z=134.7,dx=4.7,dy=0,dz=4.7] run scoreboard players set @e[tag=MainDropperAEC] TravelTime 100
execute if entity @a[scores={LightBlueTravel=3}] if entity @e[scores={TravelTime=100}] run fill -896 234 134 -890 234 140 air destroy
execute if entity @a[scores={LightBlueTravel=3}] if entity @e[scores={TravelTime=110}] run clone -896 253 134 -890 253 140 -896 234 134
execute align x align y align z at @p[x=-901,y=235,z=129,dx=16,dy=16,dz=16] if entity @e[scores={TravelTime=250..}] unless entity @e[tag=LightBlueDropperCloud] run summon area_effect_cloud -893 235.5 137 {CustomNameVisible:true,CustomName:"{\"text\":\"Jump here to drop\",\"color\":\"blue\"}",Tags:["LightBlueDropperCloud","DropperCloud"],Duration:2147483647}
execute align x align y align z run advancement grant @a[scores={DeathLevel=0..2},gamemode=adventure,x=-882,y=15,z=136,dx=0,dy=2,dz=0] only d3:folder_b/one_drop


# SPAWNPOINTS
spawnpoint @a[scores={YellowTravel=3}] -1109 235 -84
spawnpoint @a[scores={OrangeTravel=3}] -1001 235 -143
spawnpoint @a[scores={PurpleTravel=3}] -893 235 -97
spawnpoint @a[scores={BrownTravel=3}] -1109 235 17
spawnpoint @a[scores={WhiteTravel=3}] -1001 213 20
spawnpoint @a[scores={GreenTravel=3}] -893 235 17
spawnpoint @a[scores={BlackTravel=3}] -1109 235 87
spawnpoint @a[scores={LimeTravel=3}] -1001 235 131
spawnpoint @a[scores={LightBlueTravel=3}] -893 235 131

scoreboard players add @a DropSpeech 0
effect give @e[tag=PunchingBag] invisibility 1000000 255 true

# YELLOW SPEECH
execute if entity @e[scores={YellowTravel=3}] if block -1105 28 -104 air unless entity @e[tag=HighFiveBrutec] run summon armor_stand -1105 28 -104 {CustomName:"{\"text\":\"Brutec\",\"color\":\"yellow\"}",CustomNameVisible:false,ShowArms:true,Rotation:[70f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8c6fc76b-46b5-4533-aa39-a3adcba95bc9",Properties:{textures:[{Signature:"GLR9kN2g0Xq9lmGHuupsxPh/dy0kOiyjKxlDNHDp9pKJuf0H6K1anqt9xBccQn29zFPavuZEqjz1WMOndlH8hMMJ4At65W31DSYXFb++gxopnuc8pcS+HJ/hHDj7h2ooGAdq6dMMAna36Ygkg7LlRaYDHyjOYGjp3O+prKG0HWLUSe/BISvmO2sCZTBu76OneFlloJbrzqEFCJidEexJmpL12IHBYT+uEZDcvpG6HpsxqOpo1tDSlQW54WT545FV/FuGWJqWHVE9cLDvmvPBXyLrfGSKF7xjIFKtqDTzN/PSHdLrZ76cHsiIN88iOsScaoYhISsRJjhdhzAOM6Nl1dZrHWU52JosSGnDLjEP4QY2ZJ0++qErWI+RNSWHw28rCnscsY/Nf5kRnxM7QoUUCDiLg2V7W9ot9ZsSAkdEp7EDuUerDEYeB5rWWh09u4/Nh8sbuwbblvST45f718rUEOsnFz3k6C8ybpMij6dSQUBVQI4tWbhp972Rn2tERI3S/lf5bK0vZIk/9lmP4Taz7REJeiXzNznEv3WC37VWiMcPW+Rg5Cau+frBlzjIwnTRCvUfDpVZxud4nm8tvboCPyhXQhJIR2jj6a9DfH6H+Fwg841sZPVUsfn6/BOqGv1pVDfePkAp3s6wzNqOyirCNSN76RRmqPd/us6UK4h8scQ=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjMzOTMzMjQsInByb2ZpbGVJZCI6IjhjNmZjNzZiNDZiNTQ1MzNhYTM5YTNhZGNiYTk1YmM5IiwicHJvZmlsZU5hbWUiOiJCcnV0ZWMiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2Y0OWE1MWE4NzMyNGUxMzI4NmIzM2RjNjRkMzZmY2RlMWYxMzhjMDMyNjVkOTY2NjlhM2Y5N2EzOTM3ZTBlYmMifX19"}]},Name:"Brutec"}}}],HandItems:[{id:"minecraft:horn_coral_block",Count:1b,tag:{display:{Name:"{\"text\":\"Spark\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["{\"text\":\"Totallyarobotpart.\",\"italic\":\"true\",\"color\":\"blue\"}"]}}}],Pose:{Head:[20f,0f,0f],RightArm:[340f,340f,340f],LeftArm:[340f,0f,20f]},Tags:["HighFiveStand","HighFiveBrutec"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}

execute align x align y align z run scoreboard players set @a[x=-1117,y=235,z=-86,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1116,y=27,z=-108,dx=14,dy=5,dz=14,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={YellowTravel=3,DropSpeech=1}] ["",{"text":"<Brutec> ","color":"gold","bold":false},{"text":"Hurry! We need to revive him right away, but I don't know how to do it. It has something to do with this. Take it!","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={YellowTravel=3,DropSpeech=1}] DropSpeech 2
execute if block -1109 24 -102 dropper{Items:[{id:"minecraft:horn_coral_block",Count:1b}]} run function d3:dropper/complete_dropper_level


# ORANGE SPEECH
execute if entity @e[scores={OrangeTravel=3}] if block -1000 31 -146 air unless entity @e[tag=HighFiveBigre] run summon armor_stand -1000 29.9 -146 {CustomName:"{\"text\":\"Bigre\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,Rotation:[0f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5c26d143-f4a8-440e-beae-cc915f5e067b",Properties:{textures:[{Signature:"WS79k8Jz3a5SovzIJOmcb74Zay+EF2x5wdUCqXo2AzEGjY3RAV6khTwsAF9zPZ9EbCFjbN7x4iOPD2ZTGoD3SZx6WeQO9GPGsFgJ2MDvujFHPQI/p85WJ6Ww2unaip7lM2Rpvfozr2PaxLgnv1aBsJAHmXheeZY9vGsHPA4jTMw5k83GWXu+jGmsendsT7quy8TWmAeT1HNeC/4sa3WxU6aFwEzrdKWta6h65MPqGX5ISfEObZllatD/KKC41DndR71uDckzjGecsGzJgfSAz2kqljdEs5pWy0sYKlurR6YfCmpg2p86WZbFQbAH7rMk+HSeiZzS+jW2SolxL5MSyQdKxqOhWiqKZ9g1766Ivlg7uAmezxKQWSXzoUJapSd304uBzxemz7AgD71VRWzHGMVd+Qu49st35MDV5XYOLU0r6klYjUrqGVTrx4+Xvgo3JEqzxSWswc+e57zSo3oIZPzjpYcm7y37oZkMXaMO6LcPx6gqoNuSJt7YD0A1jSjaLhW+8e4ZnjPAm57NqNVi/wmtnoNdlj9rKe9DsKW4VJrKj4dIApOmJ63INf86P7BRNCVDnwsuMPJtNrP9HpLKaoZOmWH1bWpgxa4BpWnTazZxXGa8Pwru4n/h2KgbBm9eJGDdotjjvb17fvrb40sXGS6IDGlEwzfX0sEXiCAT6Xc=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjM0OTA3OTUsInByb2ZpbGVJZCI6IjVjMjZkMTQzZjRhODQ0MGViZWFlY2M5MTVmNWUwNjdiIiwicHJvZmlsZU5hbWUiOiJCaWdyZV8iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmNTc5YjVjZjIwZWY4NGIxNDRmMjI1ODBhOTg5ZGU4ZDUzOTM5MWU5YzBmYWNkNjUxYWM3NWJmMWIyN2JmZTcifX19"}]},Name:"Bigre_"}}}],Pose:{RightArm:[300f,350f,0f],RightLeg:[270f,10f,350f],LeftLeg:[270f,350f,10f]},Tags:["HighFiveStand","HighFiveBigre"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}

execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=-145,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1008,y=30,z=-146,dx=13,dy=5,dz=6,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={OrangeTravel=3,DropSpeech=1}] ["",{"text":"<Bigre> ","color":"gold","bold":false},{"text":"Hey! You're here!! Grab a game and put it in for me, would ya?","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={OrangeTravel=3,DropSpeech=1}] DropSpeech 2
execute if block -1001 30 -141 furnace{Items:[{id:"minecraft:stone_pressure_plate",Count:1b}]} run function d3:dropper/complete_dropper_level


# PURPLE SPEECH
execute if entity @e[scores={PurpleTravel=3}] if block -875 2 -72 air unless entity @e[tag=HighFiveDisco] run summon armor_stand -875 2 -72 {CustomName:"{\"text\":\"FVDisco\",\"color\":\"dark_purple\"}",CustomNameVisible:false,ShowArms:true,Rotation:[135f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"31feb2c6-1394-4de8-b418-e6b217dd2d04",Properties:{textures:[{Signature:"rFwwTW25BPZsox+Du/sKTp74YdJIeY+LMgkaBvgaD9EKfSUJ2lx/kedqF0CbJkCxisoZmJACTTVdtmmqG9clmVi5uWYnHI0WgMTlAo/wIh42NGOVaH9lWKQSq2fIqtrK1LBD3sIAYdjNzhx35XWB2hDhZiQYVKqKPXl73ttkxvEKTdL0ZkoyjVX3ItXGCiqiwemoOcUbsp6unUFj52F8hBN5CLrQmw/4o/dSV7bBWL7CI/qE5H+SHTUvDQRKaNi8ut0NCSGMTLMoNBEC0hm1WdarB+jEFOzaeKu6EBHelCoNtvm9yHCr4m/Pr8GmVuf6vc23RN+rjpucfjx9tSKntsSBPxB9OvW1S38WDeVnjUMOezPWcc/d7FvG0gp2MD4n6FdI6YjZl1qjmEjDOvhh3Qs42YoTgRXXC4Z/qpZ9GW/cpKUsH1/9MPbt5jpY1bUE3zyKTDQf4+TVFujhu98LTpveSjVVV1hMgqHsmAhZFsuGr8ANrIcWIVCuJRd4BufzLDoOBORC5p6qdZpeM9dS5gIdscwJC4XkrozulxZ/FY6FAa89G/3zkx75k22qR/HXdQhJOf6e292Q5Z0X4smSsxrk1ngKsNhd57Ejwq0fH3PXit5a3RzWYyiZtBL6o45OBM73fiZStn7Vu9T7RHrfhLbxukb8vSD4SIIv3A8wLgA=",Value:"eyJ0aW1lc3RhbXAiOjE1MjQ2MTk4MTExOTksInByb2ZpbGVJZCI6IjMxZmViMmM2MTM5NDRkZThiNDE4ZTZiMjE3ZGQyZDA0IiwicHJvZmlsZU5hbWUiOiJGVkRpc2NvIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zNTM0NzhjZjZhOGY1YmUxZjMyNWMxYjNmMWVkZWVkNzFhMjM4OGU4OTE5Y2JhOWRiMTM5MjI1NzJmNTY2OWEifX19"}]},Name:"FVDisco"}}}],HandItems:[{id:"minecraft:blaze_rod",Count:1b},{id:"minecraft:blaze_rod",Count:1b}],Tags:["HighFiveStand","HighFiveDisco"],NoGravity:true,NoBasePlate:true,Invulnerable:true,Pose:{Head:[15f,0f,0f],RightArm:[300f,340f,80f],LeftArm:[310f,330f,310f],RightLeg:[0f,20f,10f],LeftLeg:[0f,345f,340f]},DisabledSlots:2039583}

execute align x align y align z run scoreboard players set @a[x=-901,y=235,z=-99,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-881,y=1,z=-78,dx=7,dy=5,dz=7,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={PurpleTravel=3,DropSpeech=1}] ["",{"text":"<Darth Disco> ","color":"dark_red","bold":false},{"text":"Good. Good. Let the hate flow through you. Use your anger and strike me down, my young apprentice!","color":"none","bold":false,"underlined":false}]
execute if entity @a[scores={PurpleTravel=3,DropSpeech=1}] run summon item -878 3 -75 {Item:{id:"minecraft:blaze_rod",Count:1b,tag:{display:{Name:"{\"text\":\"Illumination Cutlass™\",\"italic\":\"false\",\"color\":\"light_purple\"}",Lore:["{\"text\":\"No need for a lawsuit!\",\"italic\":\"true\",\"color\":\"blue\"}"]},Lightsaber:1b}}}
scoreboard players set @a[scores={PurpleTravel=3,DropSpeech=1}] DropSpeech 2

#execute if entity @a[scores={PurpleTravel=3,DropSpeech=1}] run scoreboard objectives add GolemExists dummy
#scoreboard players add @e[tag=MainDropperAEC] GolemExists 0
#execute if entity @a[scores={PurpleTravel=3}] unless entity @e[tag=PurpleGolem] run summon iron_golem -875 2 -72 {Rotation:[135f,0f],NoAI:true,Silent:true,Tags:["PurpleGolem","PunchingBag"],Attributes:[{Name:"generic.maxHealth",Base:0.0}]}

execute if entity @a[scores={PurpleTravel=3}] unless entity @e[tag=PurpleGolem] run summon iron_golem -875 2 -72 {Rotation:[135f,0f],NoAI:true,Silent:true,Tags:["PurpleGolem","PunchingBag"]}
teleport @e[tag=PurpleGolem] -875 2 -72
execute if entity @e[tag=PurpleGolem,nbt={HurtTime:10s}] run function d3:dropper/complete_dropper_level

#scoreboard players set @e[tag=MainDropperAEC] GolemExists 0
#execute if entity @e[tag=PurpleGolem] run scoreboard players set @e[tag=MainDropperAEC] GolemExists 1
#execute if entity @e[scores={PurpleTravel=3,DropSpeech=5..}] if entity @e[scores={GolemExists=0}] run function d3:dropper/complete_dropper_level
#


# BROWN SPEECH
execute if entity @e[scores={BrownTravel=3}] if block -1086 6 48 air unless entity @e[tag=HighFiveRecabilly] run summon armor_stand -1086 4.40 48 {CustomName:"{\"text\":\"Recabilly\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,Rotation:[155f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"9eed3dbb-4799-48d8-ae0a-11dc38552cf9",Properties:{textures:[{Signature:"Z1q8246F2Tg59lSo56TjWbGfqzB9+zNPhrt+FEBUQ+yZWQolQswfgC5T/ywGTgo6bBIluJuSX5abqqdC7CqEH/xvVTi+LSXpcszX90M92bKWBqapElbPwgRpybt6PUDhCvv/SKG6O5VxaxXNakU6R2IHOJuQZNxNKf1E8Wi4GD+DspR8gfYCysKS3wuY9WAWBehcO4Xyfizb4d3r5Vz1svFhNLwr9q+d9B6JH/g1HLop6Rmq26ESo0xRig0+FG8pHGg+EPdVLLwGWL/Uf4i7qH/Hd4p/u7J6Auh0yokIgC2rUDic3Z/1ywTUnr95SkRt8FLbq5Wt5kgnb4ydDUsP+7fMYFWlA/F5T447g4Ofs7IZISvEjFTmzQq5ycsnq9nXLGZ4VFFzBlr3fukyDdaJgiuyVwUWa2JNN8jK1fTUTvg13MEnzhoZmitgUnjVWfIYseWLYQ6HwFQ39GZ/iZsfMroX/o0EH+60kGSSoW+2rvDbR6PmfSwZoP9stfd6NlCJ+fErko6TATNTeiWcPhCh8IVVSyh8rVV/NBztmwhPgM2WJejOF12LTbrPUkJsAWyHZASRa8KXbzOTyzii7IpBoEtMxCFBr1DmELa+wagGq6H2a6O6UzANHxaQMZgaUf5W5nhAnN4tTdVPtdO11tkq6Bs0GN6TBJjMcRU/+rhUE0k=",Value:"eyJ0aW1lc3RhbXAiOjE1MjQ3MDU5NDU0MDMsInByb2ZpbGVJZCI6IjllZWQzZGJiNDc5OTQ4ZDhhZTBhMTFkYzM4NTUyY2Y5IiwicHJvZmlsZU5hbWUiOiJSZWNhYmlsbHkiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzkyM2NmMWRhYTBhYjc2M2FkMGIwOTZlNmI1YzdkMzUxMjlkYzFkMzVhZGUxNzBmZWNjYmZlMTRjZTkyMTJmYyJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNWMzY2E3ZWUyYTQ5OGYxYjVkMjU4ZDVmYTkyN2U2M2U0MzMxNDNhZGQ1NTM4Y2Y2M2I2YTliNzhhZTczNSJ9fX0="}]},Name:"Recabilly"}},Count:1b}],Tags:["HighFiveStand","TicketStub","HighFiveRecabilly"],Pose:{Head:[10f,0f,0f],RightArm:[280f,0f,0f],RightLeg:[270f,20f,350f],LeftLeg:[270f,340f,10f]},NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}

execute if entity @e[scores={BrownTravel=3}] run scoreboard objectives add DropperTicket dummy
scoreboard players set @e[tag=MainDropperAEC] DropperTicket 0
execute if entity @e[nbt={Item:{id:"minecraft:paper",tag:{DropperTicket:1b}}}] run scoreboard players set @e[tag=MainDropperAEC] DropperTicket 1
execute if entity @a[nbt={Inventory:[{id:"minecraft:paper",tag:{DropperTicket:1b}}]}] run scoreboard players set @e[tag=MainDropperAEC] DropperTicket 1
execute if entity @e[scores={DropperTicket=0}] run summon item -1107.0 1 64.0 {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:"{\"text\":\"Ticket Stub\",\"italic\":\"false\"}",Lore:['{"text":"Jingle All the Way 3","color":"blue"}','{"text":"Screen 14","color":"blue"}','{"text":"$34.99","color":"blue"}']},Enchantments:[{id:"minecraft:knockback",lvl:1}],HideFlags:1,DropperTicket:1b}},Age:-32768s}



execute align x align y align z run scoreboard players set @a[x=-1117,y=235,z=15,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1090,y=3,z=38,dx=5,dy=3,dz=11,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={BrownTravel=3,DropSpeech=1}] ["",{"text":"<Recabilly> ","color":"blue","bold":false},{"text":"I had an accident. I lost my ticket. Can you find it for me? I had it resting on my drink before I tripped.","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={BrownTravel=3,DropSpeech=1}] DropSpeech 2
execute if entity @e[tag=TicketStub,nbt={HandItems:[{id:"minecraft:paper"}]}] run function d3:dropper/complete_dropper_level


# WHITE SPEECH
execute if entity @e[scores={WhiteTravel=3}] if block -1005 5 21 air unless entity @e[tag=HighFiveninjanoah5] run summon armor_stand -1005 5 21 {CustomName:"{\"text\":\"ninjanoah5\",\"color\":\"white\"}",CustomNameVisible:false,ShowArms:true,Rotation:[270f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4781}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:790029}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:137422}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"75ae6535-c1c7-4464-92df-855a997f16a0",Properties:{textures:[{Signature:"pzmBsnk7kHNvIY+/HZ4nIexeXYErY47p8DTAUaX6gxXaanyjiEXZZPAnraH4Br9GIAz6wmtr/crXNEno5082udJ6cpAE7XEBffD6RFlcAadReW6p/hckNl+VvDC8LFMQu/m6ZJ/h7IyqIdd9lo9TSOVB4rHf50kjyqlwzU+YRjU/Pzgk5sMwRFe3iD9mCWm9vkTbuI7szlhrHRYEcA7tkSClEbD505pSpb//AaP8BLLZPzgb0SVA+MPjKJF88IlM9R+jikVA5PSEFOldEmUu0Z1z5us/fhjA1pjotROepWBn4sNDvhC7jd9J0j+3syt7cGWr21oillw8A9Ej1gKg2Sx0QZRi7bqm5sy/I7GidBOoDzDV5nKCBbk9kST8pYZWvPJZqKUBGItSYTF/Mkt1FSLBvnMSYfvKRvQp+P8xilxQ3Ykr8RrpRY2B9ckM0w8fVDGn3pIwDFMz+ufYmUVsSA5G+GsAdu+Hbusur8wkBnMrc39vnl2q42Muj+E9JAjvfmp1/hwW2F1tC/AWEUsJ0coSvaEbjv8cZvPHEK97RTF2R6/P6ZlwaQo1kxIlpdgl1DPPngxqx6f2oyv3q5ME25vpLhxECs1YFsRhEB3rCuXXmSm8hc4MxMLSR+Ed+dleLvWQxkmxU6kVE9ja0GBpNSUkboqs/frqO7pggyNHRMU=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjM5NjQ1MzUsInByb2ZpbGVJZCI6Ijc1YWU2NTM1YzFjNzQ0NjQ5MmRmODU1YTk5N2YxNmEwIiwicHJvZmlsZU5hbWUiOiJuaW5qYW5vYWg1Iiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NjYxNWU5NjVjN2I5OGMxMmQ3NTE0Y2I5YjAxODk5ZDBkY2Y0MDI4ZWY4MWYxYTUzMzIyOWY3YjA0YjBmZWRiIn19fQ=="}]},Name:"ninjanoah5"}}}],Pose:{RightArm:[190f,0f,350f]},Tags:["HighFiveStand","HighFiveninjanoah5"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}

execute align x align y align z run scoreboard players set @a[x=-1009,y=213,z=16,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1005,y=2,z=19,dx=2,dy=5,dz=4,scores={DropSpeech=0..15}] DropSpeech 1
execute align x align y align z run scoreboard players add @a[x=-999,y=2,z=19,dx=2,dy=5,dz=4,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={WhiteTravel=3,DropSpeech=1}] ["",{"text":"<ninjanoah5> ","color":"blue","bold":false},{"text":"You finally made it! I've been waiting so long, I almost fell ","color":"none","bold":false,"underlined":false},{"text":"ASLEEP!","bold":false},{"text":" High five!","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={WhiteTravel=3,DropSpeech=1}] DropSpeech 2
execute if entity @e[tag=TicketStub,nbt={HandItems:[{id:"minecraft:paper"}]}] run function d3:dropper/complete_dropper_level


#execute if entity @a[scores={WhiteTravel=3,DropSpeech=1}] run scoreboard objectives add BatExists dummy
#scoreboard players add @e[tag=MainDropperAEC] BatExists 0
#execute if entity @e[scores={BatExists=0}] run summon bat -1008 6 22 {NoAI:true,Silent:true,Tags:["WhiteBat","PunchingBag"],Attributes:[{Name:"generic.maxHealth",Base:0.0}]}
#teleport @e[tag=WhiteBat] -1004.3 6.4 22.1
#scoreboard players set @e[tag=MainDropperAEC] BatExists 0
#execute if entity @e[tag=WhiteBat] run scoreboard players set @e[tag=MainDropperAEC] BatExists 1
#execute if entity @e[scores={WhiteTravel=3,DropSpeech=5..}] if entity @e[scores={BatExists=0}] run function d3:dropper/complete_dropper_level

execute if entity @a[scores={WhiteTravel=3}] unless entity @e[tag=WhiteBat] run summon bat -1004.3 6.4 22.1 {Rotation:[270f,0f],NoAI:true,Silent:true,Tags:["WhiteBat","PunchingBag"]}
teleport @e[tag=WhiteBat] -1004.3 6.4 22.1
execute if entity @e[tag=WhiteBat,nbt={HurtTime:10s}] run function d3:dropper/complete_dropper_level

#

# SIDEWAYS CART MECHANIC
execute if entity @a[scores={WhiteTravel=3}] run scoreboard objectives add DropperCart dummy
scoreboard players add @e[tag=MainDropperAEC] DropperCart 1
execute if entity @e[scores={DropperCart=1}] run kill @e[tag=DropperCart]
execute if entity @e[scores={DropperCart=1}] run summon minecart -1001 100.1 1 {Tags:["DropperCart","DropperCart1"],NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,270.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:chest"},DisplayOffset:40}
execute if entity @e[scores={DropperCart=1}] run summon minecart -1001 36.1 14 {Tags:["DropperCart","DropperCart1"],NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,270.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:chest"},DisplayOffset:40}
scoreboard players set @e[scores={DropperCart=500}] DropperCart 0


# GREEN SPEECH
execute if entity @e[scores={GreenTravel=3}] if block -921 3 39 air unless entity @e[tag=HighFiveMrGarretto] run summon armor_stand -921 3 39 {CustomName:"{\"text\":\"MrGarretto\",\"color\":\"dark_green\"}",CustomNameVisible:false,ShowArms:true,Rotation:[240f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:0b,tag:{display:{color:5383936}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:46039}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11078144}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"9a046d94-6069-412c-ab81-e1dc7477da63",Properties:{textures:[{Signature:"kJEN5BD2DqZX1mH/UBl0jFeLZ0LcnXvUw/Snn715RVVdswIaQzxB2y3/FbGls3058O01y+eWGk6ZifFxeF+momuutluTjFIeQgIcA7FxLHEE8QJi6bCuTS47f6msTKgst4040Zlc+K1TF3k0jBNee5ojIKzYtwT9cbRZKlK12Ho3UkIoMuzHV3KvAjmoCr31f8e9G3WilYulTX3qZRoQg8ICzWD+nWy4INDT6ZTwQfMFNv5n5MUY29wR7mKNnic7WE1NOBfzjXxtHAoeo0twSSOGJtA1L/RhORrn0/J2asiWau61RSRQCAL0taD5+iMbmfJwJXH0whLIXPAw6qiJxBSBPxRcX5OfL9M41xCGfLucvdqGH9ySRoeY2EKtiwB4Jhb0nKM5I1qHj7bfM4xUWMYdG0VkB611gFsL+LjairJMhv3xt4cI3DJCjEVi6VSiWtc1J0VPwU5/BpGsgae0ccB9GGwMdN/dZfo2rLru/ON04YwvxuntPTZgSULfyRS8PaN/GMhTKJuhX1/mfATkxPtjEh024upsB2MJbz9AeHC9FS23Ys4ai1zaLQR97Sw6HwiEAoDQlQKdd7MoutTz1YWpQp70pDZf8cFcbqwFN4olva7pENl9iSJPhSsjBAxu3JfktE/rZgL599NkfLEzRNLUTbp/9tPuPkWPNXg7z9E=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjQxMDA2ODcsInByb2ZpbGVJZCI6IjlhMDQ2ZDk0NjA2OTQxMmNhYjgxZTFkYzc0NzdkYTYzIiwicHJvZmlsZU5hbWUiOiJNckdhcnJldHRvIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85N2E5NjI5MzlkZTVlODQ5ZTJmNDAxNzI1ODA3YWNjNzFlZGI2MWU4ZjYwMTJmYjc0MTcyNzk2NGE4NDc2NTg3In19fQ=="}]}}}}],Tags:["HighFiveStand","HighFiveMrGarretto"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}

execute align x align y align z run scoreboard players set @a[x=-901,y=235,z=15,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-925,y=3,z=35,dx=15,dy=2,dz=15,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={GreenTravel=3,DropSpeech=1}] ["",{"text":"<MrGarretto> ","color":"gold","bold":false},{"text":"Awesome! You're here! Time for some EXTREME GOLF! Would you mind grabbing the 9 Iron from the back of the cart for me?","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={GreenTravel=3,DropSpeech=1}] DropSpeech 2
execute if blocks -922 0 41 -922 0 41 -922 4 41 all run function d3:dropper/complete_dropper_level



# BLACK SPEECH
execute if entity @e[scores={BlackTravel=3}] if block -1070 1 102 air unless entity @e[tag=HighFiverazlight789] run summon armor_stand -1070 1 102 {CustomName:"{\"text\":\"razlight789\",\"color\":\"dark_gray\"}",CustomNameVisible:false,ShowArms:true,Rotation:[110f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:43288}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1185043}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:115492}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"595655aa-a06f-48b7-a5c6-47d318e2f9d8",Properties:{textures:[{Signature:"yAT9rrlDgjZ7M8ksQq/ekEjIHJ8aZS4u43nAUcZdD+ghWGKD/guS8gpX09lZxbBBMIfdxCHxSHEmeyA6toisl/1uvmU8yFnUdEWChxc7qKExEUEN/AD4eW/hL+YGw506tCIHSsN9G5f8lz5/ZRWQijWEMvcXoEsgR9pwY9Rz3TYGWtUd7N8BSBehGos/mC5Ds5IaXnmgAsCvBqbadIxpMqxpyAc0pOpXKff5PmWulApD2DCJXAd1GZXp4c9R8aY0hxra5FGlelTLM8O13h32fhpUCjYDw6RFlT4AwF8gjhexEriGs+7iRCqFw0xIcAEtY5rABGfAOdTgXBaPotpn0vqBeGELWAEYXDw01QXw1qQyjdru9gWq3KjqhMH0RzUh91ofeL0zgCmhnuaOAhl+6chLBAJkBHsXnPCdFIkHiC8vvlWWZehzWa3Sf6d+WAc6nc0XAi9AwTRReFMaX2Y3uOIL7EiwRbFBqBKKek2wOqEi0dzQsK/TTui3rnhIRPYcQLPVERoZQNz+WWulGw7zmVhi0x9/dYNd1T/WRGNJgeY+DsegClteKJKCNI+hwKrkjp5qtWmUNcQjKmFSAQYMmqgoSOSgHKQp2fu6HD3jbs8froK12KwhO8b/kYoPLsV17ohLtSPLL1g7dVyxdV8+JNTB3aw2kg0TYNtu/OjZMv8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzcxNTI3MDUsInByb2ZpbGVJZCI6IjU5NTY1NWFhYTA2ZjQ4YjdhNWM2NDdkMzE4ZTJmOWQ4IiwicHJvZmlsZU5hbWUiOiJyYXpsaWdodDc4OSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmQyYjI5ZjBlNDVhNDQzZGQ5YTM1ZDUwMjk1ZDU3MTlmNjFiOGUyZDczOTI0MWI0YjgxMWNiNzdmMjQ5MTBlMiJ9fX0="}]},Name:"razlight789"}}}],Pose:{RightArm:[305f,0f,60f],Head:[0f,20f,0f]},Tags:["HighFiveStand","HighFiverazlight789"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}

execute align x align y align z run scoreboard players set @a[x=-1117,y=235,z=83,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1080,y=1,z=98,dx=15,dy=2,dz=15,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={BlackTravel=3,DropSpeech=1}] ["",{"text":"<razlight789> ","color":"dark_green","bold":false},{"text":"Batmobile lost a wheel! We should fix it before Joker gets away! There must be a spare around here somewhere...","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={BlackTravel=3,DropSpeech=1}] DropSpeech 2
execute if block -1075 1 96 melon run function d3:dropper/complete_dropper_level


# LIME SPEECH
execute if entity @e[scores={LimeTravel=3}] if block -999 1 123 air unless entity @e[tag=HighFiveslicedlime] run summon armor_stand -999 1 123 {CustomName:"{\"text\":\"slicedlime\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,Rotation:[30f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5383936}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3957279}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3957279}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"9c2ac958-5de9-45a8-8ca1-4122eb4c0b9e",Properties:{textures:[{Signature:"DJVSsTdekAa2trX1ca+g51YE1j0F6Fnt7VzJU0HG12Ge8augnxVm21DkGiiV2HAkiqT5miDTizWG9hRjhK2A1ePuBEB4hxbd1hMfO5dTv+YiWqWR6KjFAPLGh8nj3kPZhzCQmrJER0+w65S+8fO78Vku8sHlArJbhj9LePOX1nOfOPIP3PpxZLSHLhVcGp7Mq3rfimzBTnXNhRTQWLQqYkx9F1sTCOU26po0H6k7uhsnsdBe7rDN9RHk1ZDZpMMf0xJTLeF3XAS3jWtELcBZcnCqUVQjmo5qQdkLcqtubG7u1bx32I2lldq7PyH6SqOn95f4Shn6/yzYQdE5AQzRoA1rSW7shQOJ6xabs1WFui1ycfwSlv55w5ZVcf/mvOznEImNE30UGSL+dG4c0w6uRZ9C2ZQCcdDAvMdRpjIbFvLT/MUNlKFPABQgCXY7anqiDShmyzlKNomX++Jgbic4kMuP219NeZtKDqChVo3jTxXUI3oRXa4HDc45jFaLOPdylGtbpZKxjRjtLkAY5o1av6VsVC/mweGvAmNiArtyrWEDdSsFHvZP+vfa0qFaUBAae0kdeyVOLbfewkr69BfohsVEoutSkJyQmu0aPcBMxq0pZKWufkJIdeJwJHFXqeoqWjyT2zX3N38MqRigXVJ8dI0egtMMGkFuxBQY+77GaOQ=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzY4NTIzMTUsInByb2ZpbGVJZCI6IjljMmFjOTU4NWRlOTQ1YTg4Y2ExNDEyMmViNGMwYjllIiwicHJvZmlsZU5hbWUiOiJzbGljZWRsaW1lIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85MzEzZWMxNzFlZjNjOWZiODYxNmFkMGQzNGRjMDVjNGFjZGQwMjViYTM3ZTYxNzNiMDJhMjNlZjJmZDM4ZWQxIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81Nzg2ZmU5OWJlMzc3ZGZiNjg1ODg1OWY5MjZjNGRiYzk5NTc1MWU5MWNlZTM3MzQ2OGM1ZmJmNDg2NWU3MTUxIn19fQ=="}]},Name:"slicedlime"}}}],HandItems:[{id:"minecraft:iron_axe",Count:1b,tag:{display:{Name:"{\"text\":\"LimeSlicer\",\"italic\":\"false\",\"color\":\"green\"}",Lore:["It'salittledull.Probablyfromallthelimes","thatwereslicedtomakethisDrop."]},CanDestroy:["minecraft:lime_glazed_terracotta"],HideFlags:63}}],Tags:["HighFiveStand","HighFiveslicedlime"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}

execute align x align y align z run scoreboard players set @a[x=-1009,y=235,z=129,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-1004,y=1,z=122,dx=7,dy=2,dz=4,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={LimeTravel=3,DropSpeech=1}] ["",{"text":"<slicedlime> ","color":"green","bold":false},{"text":"Ladies and gentlemen... could you finish slicing this lime for me? I'm pretty tired.","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={LimeTravel=3,DropSpeech=1}] DropSpeech 2
execute if block -1001 3 120 air run function d3:dropper/complete_dropper_level


# LIGHT BLUE SPEECH
execute if entity @e[scores={LightBlueTravel=3}] if block -883 14 138 air unless entity @e[tag=HighFivetexelelf] run summon armor_stand -883 14 138 {CustomName:"{\"text\":\"texelelf\",\"color\":\"aqua\"}",CustomNameVisible:false,ShowArms:true,Rotation:[155f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"8b32556c-dde4-4652-91c7-1d75df7b420d",Properties:{textures:[{Signature:"bF9xXF0wK4wMjPrMUiY+ksOX4lzmsALEshuahSOLlh9pyVNjTvLgvLqGldBROilsARo8dFjz2qa7oQ+EW0iNwn7azwu6WY8DG5RH0kQ28X0P1EDQagjZYnYVyUtofbLDdgKKFDAoZaW+ARKgJCZ0SKoztxDCzEyv9SRl5pVqUbCanBYDbwvQ7uap7yLWnBl7snl5OeBVjmu23kqrOarOjzLJdPO8VrpdxHVAa7nfa1Ri6XFs+f8th+86Btes8ASYb7AtHlDxQP4/4lP5pvZEwh64Z7qZ5zFtGo8Ts61LT45xYp2tYX6icYJYItEb7VLMtTZmDUBNb6wUiF6AqWIIhjPymH1+7HrLZJmzVVzCk7ywdZNquS9WqLStG/3V7JH6hQ/FI07Z/M4MJx96nIKRFeSUv4SxB8PIA3nun1kZJVS68mlMMOiD5doo7ChzTBhxgE9Ti3t6cVvuq4G4H63hudXkILoHZ+STJtCG1MQqf1EjAChweHV8nIQEx9RwncQ6ozBEd2ZBBIQ0DL7OVkvJmyengrYa3nfyKmFGs+XCKoOQ4PB19fX0qhtH8eVzipgBGC2ag5ZxkFxWEUOuj6rPF9bIcEB0QCMIpBXhPQnNP7pSaX+CcP+eYbqITzu1/IC2812Ao2VQXM4NOVHwb3w6/8XPfbsA91dceaDNd1wLl/U=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzY5NDc2MTMsInByb2ZpbGVJZCI6IjhiMzI1NTZjZGRlNDQ2NTI5MWM3MWQ3NWRmN2I0MjBkIiwicHJvZmlsZU5hbWUiOiJ0ZXhlbGVsZiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTdmNTRmZDk4ZTVlZjdiMTRmYTVjYjQwMTE3MmMxNjIwN2U0ZTgxMTliYjk1OWU5ZDM1ZTdkNzgwZWY5OTNlMyJ9fX0="}]}}},Count:1b}],HandItems:[{id:"minecraft:lever",Count:1b,tag:{CanPlaceOn:["minecraft:tnt"],HideFlags:63}}],Tags:["HighFiveStand","HighFivetexelelf"],Pose:{RightArm:[320f,0f,0f]},NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}


execute align x align y align z run scoreboard players set @a[x=-901,y=235,z=129,dx=16,dy=16,dz=16] DropSpeech 0
execute align x align y align z run scoreboard players add @a[x=-885,y=13,z=136,dx=2,dy=3,dz=2,scores={DropSpeech=0..15}] DropSpeech 1
tellraw @a[scores={LightBlueTravel=3,DropSpeech=1}] ["",{"text":"<texelelf> ","color":"dark_aqua","bold":false},{"text":"Perfect! You managed to infiltrate the enemy aircraft too! I'll let you have the honors!","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={LightBlueTravel=3,DropSpeech=1}] DropSpeech 2
execute if block -885 14 137 barrier run setblock -885 14 137 tnt
execute if block -885 14 137 air run function d3:dropper/complete_dropper_level


# YELLOW COMPLETION EFFECT
execute if entity @a[scores={YellowTravel=4,DropSpeech=29}] run particle firework -1005 247 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={YellowTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={YellowTravel=4,DropSpeech=29}] run fill -1006 246 18 -1004 248 18 yellow_stained_glass
scoreboard players set @a[scores={YellowTravel=4,DropSpeech=30}] YellowTravel 5

# ORANGE COMPLETION EFFECT
execute if entity @a[scores={OrangeTravel=4,DropSpeech=29}] run particle firework -1001 247 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={OrangeTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={OrangeTravel=4,DropSpeech=29}] run fill -1002 246 18 -1000 248 18 orange_stained_glass
scoreboard players set @a[scores={OrangeTravel=4,DropSpeech=30}] OrangeTravel 5

# PURPLE COMPLETION EFFECT
execute at @a[scores={PurpleTravel=4,DropSpeech=0}] run playsound entity.generic.hurt master @a[tag=PunchingBagRange] ~ ~ ~ 1 1.3 1
execute if entity @a[scores={PurpleTravel=4,DropSpeech=29}] run particle firework -998 247 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={PurpleTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={PurpleTravel=4,DropSpeech=29}] run fill -998 246 18 -996 248 18 purple_stained_glass
scoreboard players set @a[scores={PurpleTravel=4,DropSpeech=30}] PurpleTravel 5

# BROWN COMPLETION EFFECT
execute if entity @a[scores={BrownTravel=4,DropSpeech=29}] run particle firework -1005 243 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={BrownTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={BrownTravel=4,DropSpeech=29}] run fill -1006 242 18 -1004 244 18 brown_stained_glass
scoreboard players set @a[scores={BrownTravel=4,DropSpeech=30}] BrownTravel 5

# WHITE COMPLETION EFFECT
execute at @a[scores={WhiteTravel=4,DropSpeech=0}] run playsound entity.generic.hurt master @a[tag=PunchingBagRange] ~ ~ ~ 1 1.3 1
execute if entity @a[scores={WhiteTravel=4,DropSpeech=29}] run particle firework -1001 243 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={WhiteTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={WhiteTravel=4,DropSpeech=29}] run fill -1002 242 18 -1000 244 18 white_stained_glass
scoreboard players set @a[scores={WhiteTravel=4,DropSpeech=30}] WhiteTravel 5

# GREEN COMPLETION EFFECT
execute if entity @a[scores={GreenTravel=4,DropSpeech=29}] run particle firework -997 243 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={GreenTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={GreenTravel=4,DropSpeech=29}] run fill -998 242 18 -996 244 18 green_stained_glass
scoreboard players set @a[scores={GreenTravel=4,DropSpeech=30}] GreenTravel 5

# BLACK COMPLETION EFFECT
execute if entity @a[scores={BlackTravel=4,DropSpeech=29}] run particle firework -1005 239 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={BlackTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={BlackTravel=4,DropSpeech=29}] run fill -1006 238 18 -1004 240 18 black_stained_glass
scoreboard players set @a[scores={BlackTravel=4,DropSpeech=30}] BlackTravel 5

# LIME COMPLETION EFFECT
execute if entity @a[scores={LimeTravel=4,DropSpeech=29}] run particle firework -1001 239 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={LimeTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={LimeTravel=4,DropSpeech=29}] run fill -1002 238 18 -1000 240 18 lime_stained_glass
scoreboard players set @a[scores={LimeTravel=4,DropSpeech=30}] LimeTravel 5

# LIGHT BLUE COMPLETION EFFECT
execute at @a[scores={LightBlueTravel=4,DropSpeech=0}] run playsound entity.generic.explode master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={LightBlueTravel=4,DropSpeech=29}] run particle firework -997 239 18 0.8 0.8 0.1 0.1 100
execute if entity @a[scores={LightBlueTravel=4,DropSpeech=29}] run playsound entity.player.levelup master @a ~ ~ ~ 1 1 1
execute if entity @a[scores={LightBlueTravel=4,DropSpeech=29}] run fill -998 238 18 -996 240 18 light_blue_stained_glass
scoreboard players set @a[scores={LightBlueTravel=4,DropSpeech=30}] LightBlueTravel 5


# WIN TIMER
execute align x align y align z run scoreboard players add @a[x=-1009,y=235,z=15,dx=16,dy=16,dz=16,scores={DropSpeech=0..30}] DropSpeech 1



# END
execute if entity @a[scores={YellowTravel=5,OrangeTravel=5,PurpleTravel=5,BrownTravel=5,WhiteTravel=5,GreenTravel=5,BlackTravel=5,LimeTravel=5,LightBlueTravel=5,DropSpeech=30..}] run scoreboard players set @a WhiteTravel 6

# NEW FIX
execute if block -1006 248 18 yellow_stained_glass if block -1002 248 18 orange_stained_glass if block -998 248 18 purple_stained_glass if block -1006 244 18 brown_stained_glass if block -1002 244 18 white_stained_glass if block -998 244 18 green_stained_glass if block -1006 240 18 black_stained_glass if block -1002 240 18 lime_stained_glass if block -998 240 18 light_blue_stained_glass run scoreboard players set @a WhiteTravel 6

scoreboard players add @a[scores={WhiteTravel=6}] DropSpeech 1

execute if entity @a[scores={WhiteTravel=6,DropSpeech=40}] run summon armor_stand -1001 250 19 {Tags:["Dropperqmagnet"],Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"qmagnet\",\"color\":\"blue\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}},Count:1b}],Pose:{Head:[40f,0f,0f]},DisabledSlots:1973790}

tellraw @a[scores={WhiteTravel=6,DropSpeech=50}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"Hey! I'm up here!","color":"none","bold":false,"underlined":false}]

tellraw @a[scores={WhiteTravel=6,DropSpeech=150}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"Well done! You finished all the Drops. Now all that's left is for me to give you the Blue Wool!","color":"none","bold":false,"underlined":false}]

tellraw @a[scores={WhiteTravel=6,DropSpeech=300}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"Here you go!","color":"none","bold":false,"underlined":false}]

execute if entity @a[scores={WhiteTravel=6,DropSpeech=320}] run data merge entity @e[tag=Dropperqmagnet,limit=1] {HandItems:[{id:"minecraft:blue_wool",Count:1b}],Pose:{RightArm:[-30f,-30f,0f]}}
execute if entity @e[scores={WhiteTravel=6,DropSpeech=320}] at @e[tag=Dropperqmagnet] run playsound block.wool.break master @a ~ ~ ~ 2 1.3 0

tellraw @a[scores={WhiteTravel=6,DropSpeech=450}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"Um... How's this going to work?","color":"none","bold":false,"underlined":false}]

tellraw @a[scores={WhiteTravel=6,DropSpeech=550}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"Oh I know!","color":"none","bold":false,"underlined":false}]

tellraw @a[scores={WhiteTravel=6,DropSpeech=750}] ["",{"text":"<qmagnet> ","color":"blue","bold":false},{"text":"I'm an armor stand, dude... Click my chest.","color":"none","bold":false,"underlined":false}]

execute if entity @a[scores={WhiteTravel=6,DropSpeech=580}] run playsound block.dispenser.dispense master @a -1001 240 32 1 1.2 1
execute if entity @a[scores={WhiteTravel=6,DropSpeech=580}] run particle smoke -1001 240 32 0.5 0.5 1.5 0 300

execute if entity @a[scores={WhiteTravel=6,DropSpeech=580}] run summon armor_stand -1001 240 32 {Invisible:1b,Silent:true,Small:true,Marker:0b,Tags:["FinalDropStand"],Motion:[0.0d,0.5d,-0.8d],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:blue_glazed_terracotta"},Tags:["FinalDropperBlock"],NoGravity:false,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
#execute if entity @a[scores={WhiteTravel=6,DropSpeech=600}] run kill @e[tag=FinalDropStand]
execute if entity @a[scores={WhiteTravel=6,DropSpeech=600..}] align x align y align z as @e[tag=FinalDropStand,nbt={OnGround:1b}] run kill @s


#execute align x align y align z run effect give @a[scores={WhiteTravel=6,DropSpeech=680..},x=-1001,y=236,z=24,dx=0,dy=2,dz=0] jump_boost 1 11
#execute align x align y align z run effect give @a[scores={WhiteTravel=6,DropSpeech=680..},x=-1001,y=236,z=24,dx=0,dy=2,dz=0] resistance 3 255 true

execute align x align y align z as @a[scores={WhiteTravel=6,DropSpeech=680..},x=-1001,y=236,z=23,dx=0,dy=2,dz=2] at @s if block ~ ~-1 ~ blue_glazed_terracotta run effect give @s jump_boost 1 11
execute align x align y align z as @a[scores={WhiteTravel=6,DropSpeech=680..},x=-1001,y=236,z=23,dx=0,dy=2,dz=2] at @s if block ~ ~-1 ~ blue_glazed_terracotta run effect give @s resistance 3 255 true



# COMPLETE BRANCH
tag @a remove HasBlueWool
tag @a[nbt={Inventory:[{id:"minecraft:blue_wool"}]}] add HasBlueWool
execute as @a[tag=HasBlueWool] run advancement grant @a[scores={DropDeaths=..30}] only d3:folder_b/dropper_hero
execute if entity @a[tag=HasBlueWool] run clear @a
replaceitem entity @a[tag=HasBlueWool] weapon.mainhand blue_wool
execute if entity @a[tag=HasBlueWool] run setblock -18 2 14 clay
execute if entity @a[tag=HasBlueWool] run teleport @a -24 4 1 0 -90