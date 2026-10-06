####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 10 2017 / SEPTEMBER 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

gamerule doEntityDrops true

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

experience set @a 0 levels
experience set @a 0

execute align x align y align z run advancement grant @a[x=1008,y=1,z=15,dx=2,dy=1,dz=1] only d3:folder_c/puzzle_trap

# ❤ TROLL STAND #####
#scoreboard objectives setdisplay sidebar LoveButton
#scoreboard objectives setdisplay sidebar LoveQ
#scoreboard objectives setdisplay sidebar PuzzleComplete
#scoreboard objectives setdisplay sidebar RenewCart

scoreboard objectives add LoveButton dummy
execute if block 1000 46 22 oak_button[powered=false] run scoreboard players set @e[tag=MainPuzzleAEC] LoveButton 0
execute if block 1000 46 22 oak_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] LoveButton 1

execute if entity @e[scores={LoveButton=1}] run summon experience_bottle 1000 46 19

scoreboard objectives add LoveQ dummy
execute if entity @e[scores={LoveButton=1}] run scoreboard players reset LoveQ
execute if entity @e[scores={LoveButton=1}] run scoreboard players set @p[x=1000,y=46,z=22] LoveQ 1
scoreboard players add @a[scores={LoveQ=1..}] LoveQ 1

execute as @a[scores={LoveQ=2}] run kill @e[tag=LoveQStand]
execute as @a[scores={LoveQ=2}] at @s run summon armor_stand ~ ~1.59 ~ {Tags:["LoveQStand"],CustomNameVisible:true,CustomName:"{\"text\":\"❤'s qmagnet!\"}",Marker:true,Invisible:true,NoGravity:true}
execute at @a[scores={LoveQ=1..}] run teleport @e[tag=LoveQStand] ~ ~1.59 ~
execute as @a[scores={LoveQ=1000..}] run kill @e[tag=LoveQStand]
scoreboard players reset @a[scores={LoveQ=1000..}] LoveQ

execute if entity @p[scores={LoveQ=1..150}] run scoreboard players add @e[type=armor_stand,tag=FakeOrangeBlock] LoveQ 1
scoreboard players set @e[type=armor_stand,scores={LoveQ=20..}] LoveQ 0

execute as @e[tag=BottomFakeOrangeBlock,type=armor_stand,scores={LoveQ=2}] at @s run teleport @s 1000 46 21
execute as @e[tag=TopFakeOrangeBlock,type=armor_stand,scores={LoveQ=2}] at @s run teleport @s 1000 47 21
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=4}] at @s run teleport @s ~-0.01 ~0.02 ~0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=6}] at @s run teleport @s ~0.01 ~-0.02 ~-0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=7}] at @s run teleport @s ~-0.01 ~0.02 ~-0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=10}] at @s run teleport @s ~0.01 ~-0.02 ~0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=12}] at @s run teleport @s ~0.01 ~0.02 ~-0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=14}] at @s run teleport @s ~-0.01 ~-0.02 ~0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=16}] at @s run teleport @s ~0.01 ~0.02 ~0.01
execute as @e[tag=FakeOrangeBlock,type=armor_stand,scores={LoveQ=18}] at @s run teleport @s ~-0.01 ~-0.02 ~-0.01

execute if entity @a[scores={LoveQ=150..}] run scoreboard players reset @e[type=!player] LoveQ
scoreboard players reset @a[scores={LoveQ=1000..}] LoveQ

execute if entity @e[tag=FakeOrangeBlock,scores={LoveQ=0..}] run particle smoke 1000 45.6 22.0 0.2 0.1 0 0 1 force @a


# SILENCES ITEM FRAMES FROM CONSTANT UP ROTATION
execute as @e[tag=DoorFrame,nbt=!{Item:{Count:1b}}] run data merge entity @s {Silent:false}
execute as @e[tag=DoorFrame,nbt={Item:{Count:1b}}] run data merge entity @s {ItemRotation:0b,Silent:true}


# REPLACES BROKEN ITEM FRAMES
scoreboard objectives add YellowFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] YellowFrame 0
execute if entity @e[tag=YellowDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] YellowFrame 1
execute if entity @e[scores={YellowFrame=0,PuzzleComplete=0}] run summon item_frame 1001 67 28 {Facing:2b,Tags:["YellowDoorFrame","DoorFrame"]}

scoreboard objectives add OrangeFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] OrangeFrame 0
execute if entity @e[tag=OrangeDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] OrangeFrame 1
execute if entity @e[scores={OrangeFrame=0,PuzzleComplete=0}] run summon item_frame 1000 67 28 {Facing:2b,Tags:["OrangeDoorFrame","DoorFrame"]}

scoreboard objectives add PurpleFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] PurpleFrame 0
execute if entity @e[tag=PurpleDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] PurpleFrame 1
execute if entity @e[scores={PurpleFrame=0,PuzzleComplete=0}] run summon item_frame 999 67 28 {Facing:2b,Tags:["PurpleDoorFrame","DoorFrame"]}

scoreboard objectives add BrownFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] BrownFrame 0
execute if entity @e[tag=BrownDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] BrownFrame 1
execute if entity @e[scores={BrownFrame=0,PuzzleComplete=0}] run summon item_frame 1001 66 28 {Facing:2b,Tags:["BrownDoorFrame","DoorFrame"]}

scoreboard objectives add WhiteFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] WhiteFrame 0
execute if entity @e[tag=WhiteDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] WhiteFrame 1
execute if entity @e[scores={WhiteFrame=0,PuzzleComplete=0}] run summon item_frame 1000 66 28 {Facing:2b,Tags:["WhiteDoorFrame","DoorFrame"]}

scoreboard objectives add GreenFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] GreenFrame 0
execute if entity @e[tag=GreenDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] GreenFrame 1
execute if entity @e[scores={GreenFrame=0,PuzzleComplete=0}] run summon item_frame 999 66 28 {Facing:2b,Tags:["GreenDoorFrame","DoorFrame"]}

scoreboard objectives add BlackFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] BlackFrame 0
execute if entity @e[tag=BlackDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] BlackFrame 1
execute if entity @e[scores={BlackFrame=0,PuzzleComplete=0}] run summon item_frame 1001 65 28 {Facing:2b,Tags:["BlackDoorFrame","DoorFrame"]}

scoreboard objectives add LimeFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] LimeFrame 0
execute if entity @e[tag=LimeDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] LimeFrame 1
execute if entity @e[scores={LimeFrame=0,PuzzleComplete=0}] run summon item_frame 1000 65 28 {Facing:2b,Tags:["LimeDoorFrame","DoorFrame"]}

scoreboard objectives add LightBlueFrame dummy
scoreboard players set @e[tag=MainPuzzleAEC] LightBlueFrame 0
execute if entity @e[tag=LightBlueDoorFrame] run scoreboard players set @e[tag=MainPuzzleAEC] LightBlueFrame 1
execute if entity @e[scores={LightBlueFrame=0,PuzzleComplete=0}] run summon item_frame 999 65 28 {Facing:2b,Tags:["LightBlueDoorFrame","DoorFrame"]}

kill @e[nbt={Item:{id:"minecraft:item_frame"}}]


# REMOVES CUSTOM NAME WHEN DISPLAYED IN ITEM FRAME
tag @e[type=item_frame] remove YellowKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:spawner",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add YellowKey
data merge entity @e[tag=YellowKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=YellowKey,limit=1] {Item:{id:"minecraft:spawner",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove OrangeKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:jack_o_lantern",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add OrangeKey
data merge entity @e[tag=OrangeKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=OrangeKey,limit=1] {Item:{id:"minecraft:jack_o_lantern",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove PurpleKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:nether_star",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add PurpleKey
data merge entity @e[tag=PurpleKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=PurpleKey,limit=1] {Item:{id:"minecraft:nether_star",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove BrownKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:note_block",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add BrownKey
data merge entity @e[tag=BrownKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=BrownKey,limit=1] {Item:{id:"minecraft:note_block",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove WhiteKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:iron_axe",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add WhiteKey
data merge entity @e[tag=WhiteKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=WhiteKey,limit=1] {Item:{id:"minecraft:iron_axe",Count:1b,tag:{Unbreakable:true,CanDestroy:["minecraft:pumpkin"],HideFlags:6,PuzzleKey:1b}}}

tag @e[type=item_frame] remove GreenKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:green_concrete_powder",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add GreenKey
data merge entity @e[tag=GreenKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=GreenKey,limit=1] {Item:{id:"minecraft:green_concrete_powder",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove BlackKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:emerald",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add BlackKey
data merge entity @e[tag=BlackKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=BlackKey,limit=1] {Item:{id:"minecraft:emerald",Count:1b,tag:{PuzzleKey:1b}}}

tag @e[type=item_frame] remove LimeKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:black_banner",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add LimeKey
data merge entity @e[tag=LimeKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=LimeKey,limit=1] {Item:{id:"minecraft:black_banner",Count:1b,tag:{HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:"cr",Color:5},{Pattern:"vh",Color:15},{Pattern:"hh",Color:15},{Pattern:"ms",Color:15},{Pattern:"ts",Color:5},{Pattern:"bs",Color:5},{Pattern:"ls",Color:5},{Pattern:"rs",Color:5},{Pattern:"bo",Color:15}]},PuzzleKey:1b}}}

tag @e[type=item_frame] remove LightBlueKey
tag @e[type=item_frame,nbt={Item:{id:"minecraft:potion",tag:{PuzzleKey:1b,display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}] add LightBlueKey
data merge entity @e[tag=LightBlueKey,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=LightBlueKey,limit=1] {Item:{id:"minecraft:potion",Count:1b,tag:{CustomPotionColor:7512056,HideFlags:32,PuzzleKey:1b}}}


# PUTS NAME BACK ON PUZZLE KEY ITEM
data merge entity @e[type=item,nbt={Item:{tag:{PuzzleKey:1b}}},limit=1] {Item:{tag:{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"}}}}



# CHECKS FOR CORRECT KEYS
execute if entity @e[tag=YellowDoorFrame,nbt={Item:{id:"minecraft:spawner",tag:{PuzzleKey:1b}}}] if entity @e[tag=OrangeDoorFrame,nbt={Item:{id:"minecraft:jack_o_lantern",tag:{PuzzleKey:1b}}}] if entity @e[tag=PurpleDoorFrame,nbt={Item:{id:"minecraft:nether_star",tag:{PuzzleKey:1b}}}] if entity @e[tag=BrownDoorFrame,nbt={Item:{id:"minecraft:note_block",tag:{PuzzleKey:1b}}}] if entity @e[tag=WhiteDoorFrame,nbt={Item:{id:"minecraft:iron_axe",tag:{PuzzleKey:1b}}}] if entity @e[tag=GreenDoorFrame,nbt={Item:{id:"minecraft:green_concrete_powder",tag:{PuzzleKey:1b}}}] if entity @e[tag=BlackDoorFrame,nbt={Item:{id:"minecraft:emerald",tag:{PuzzleKey:1b}}}] if entity @e[tag=LimeDoorFrame,nbt={Item:{id:"minecraft:black_banner",tag:{PuzzleKey:1b}}}] if entity @e[tag=LightBlueDoorFrame,nbt={Item:{id:"minecraft:potion",tag:{PuzzleKey:1b}}}] run scoreboard players set @e[scores={PuzzleComplete=0}] PuzzleComplete 1


# ACTIVATES FINAL DOOR ON ITEM FRAMES CORRECT
#execute if entity @e[scores={PuzzleComplete=1}] run kill @e[tag=DoorFrame]
scoreboard players add @e[scores={PuzzleComplete=1..150}] PuzzleComplete 1


# LAUNCH DOOR ANIMATION
execute if entity @e[scores={PuzzleComplete=2}] as @e[tag=DoorFrame] run data merge entity @s {Invulnerable:true}
execute if entity @e[scores={PuzzleComplete=2}] run fill 999 65 30 1001 67 32 air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1001 67 29 1001 67 29 yellow_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1000 67 29 1000 67 29 orange_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 999 67 29 999 67 29 purple_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1001 66 29 1001 66 29 brown_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1000 66 29 1000 66 29 white_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 999 66 29 999 66 29 green_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1001 65 29 1001 65 29 black_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 1000 65 29 1000 65 29 lime_concrete replace air
execute if entity @e[scores={PuzzleComplete=2}] run fill 999 65 29 999 65 29 light_blue_concrete replace air

execute if entity @e[scores={PuzzleComplete=10}] run fill 997 65 30 998 67 30 air
execute if entity @e[scores={PuzzleComplete=10}] run fill 1002 65 30 1003 67 30 air
execute if entity @e[scores={PuzzleComplete=10}] run fill 1000 63 30 1000 64 30 air
execute if entity @e[scores={PuzzleComplete=10}] run fill 1002 68 32 1002 68 32 air

execute if entity @e[scores={PuzzleComplete=52}] run kill @e[tag=DoorFrame]
execute if entity @e[scores={PuzzleComplete=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={PuzzleComplete=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1

execute if entity @e[scores={PuzzleComplete=70}] run clear @a
execute if entity @e[scores={PuzzleComplete=70}] run fill 999 65 31 1001 67 31 sticky_piston[facing=north,extended=true] replace air
execute if entity @e[scores={PuzzleComplete=70}] run fill 999 65 30 1001 67 30 piston_head[facing=north,type=sticky] replace air
execute if entity @e[scores={PuzzleComplete=75}] run fill 999 65 31 1001 67 31 air

execute if entity @e[scores={PuzzleComplete=105}] run fill 1000 66 32 1000 66 32 sticky_piston[extended=true,facing=north] replace air
execute if entity @e[scores={PuzzleComplete=105}] run fill 1000 66 31 1000 66 31 piston_head[type=sticky,facing=north] replace air
execute if entity @e[scores={PuzzleComplete=110}] run setblock 1000 66 32 air

execute if entity @e[scores={PuzzleComplete=110}] run fill 1000 64 31 1000 64 31 sticky_piston[extended=true,facing=up] replace lime_concrete
execute if entity @e[scores={PuzzleComplete=110}] run fill 1000 65 31 1000 65 31 piston_head[type=sticky,facing=up] replace air
execute if entity @e[scores={PuzzleComplete=115}] run fill 1000 64 31 1000 64 31 air replace sticky_piston

execute if entity @e[scores={PuzzleComplete=115}] run fill 1000 63 31 1000 63 31 sticky_piston[extended=true,facing=up] replace air
execute if entity @e[scores={PuzzleComplete=115}] run fill 1000 64 31 1000 64 31 piston_head[type=sticky,facing=up] replace air
execute if entity @e[scores={PuzzleComplete=120}] run fill 1000 63 31 1000 63 31 air replace sticky_piston
execute if entity @e[scores={PuzzleComplete=120}] run fill 1000 64 31 1000 64 31 lime_concrete replace white_concrete

execute if entity @e[scores={PuzzleComplete=115}] run fill 1003 67 30 1003 67 30 sticky_piston[extended=true,facing=west] replace air
execute if entity @e[scores={PuzzleComplete=115}] run fill 1002 67 30 1002 67 30 piston_head[type=sticky,facing=west] replace air

# FAKE ORANGE DOOR BLOCK HERE ####
execute if entity @e[scores={PuzzleComplete=120}] run setblock 1000 67 30 air
execute if entity @e[scores={PuzzleComplete=120}] run kill @e[tag=FinalDoorBlock]
execute if entity @e[scores={PuzzleComplete=120}] run summon armor_stand 1000 67 30 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FinalDoorBlock"]}],Tags:["FinalDoorBlock"]}
execute if entity @e[scores={PuzzleComplete=120}] run setblock 1002 68 31 sticky_piston[extended=true,facing=south]
execute if entity @e[scores={PuzzleComplete=120}] run setblock 1002 68 32 piston_head[type=sticky,facing=south]
execute if entity @e[scores={PuzzleComplete=124}] run teleport @e[tag=FinalDoorBlock] 1000 68 30
execute if entity @e[scores={PuzzleComplete=125}] run kill @e[tag=FinalDoorBlock]
##############################

execute if entity @e[scores={PuzzleComplete=125}] run fill 997 67 30 997 67 30 sticky_piston[extended=true,facing=east] replace air
execute if entity @e[scores={PuzzleComplete=125}] run fill 998 67 30 998 67 30 piston_head[type=sticky,facing=east] replace air

execute if entity @e[scores={PuzzleComplete=130}] run fill 997 66 30 997 66 30 sticky_piston[extended=true,facing=east] replace air
execute if entity @e[scores={PuzzleComplete=130}] run fill 998 66 30 998 66 30 piston_head[type=sticky,facing=east] replace air

execute if entity @e[scores={PuzzleComplete=135}] run fill 997 65 30 997 65 30 sticky_piston[extended=true,facing=east] replace air
execute if entity @e[scores={PuzzleComplete=135}] run fill 998 65 30 998 65 30 piston_head[type=sticky,facing=east] replace air

execute if entity @e[scores={PuzzleComplete=140}] run fill 1000 63 30 1000 63 30 sticky_piston[extended=true,facing=up] replace air
execute if entity @e[scores={PuzzleComplete=140}] run fill 1000 64 30 1000 64 30 piston_head[type=sticky,facing=up] replace air

execute if entity @e[scores={PuzzleComplete=140}] run fill 1003 65 30 1003 65 30 sticky_piston[extended=true,facing=west] replace air
execute if entity @e[scores={PuzzleComplete=140}] run fill 1002 65 30 1002 65 30 piston_head[type=sticky,facing=west] replace air

execute if entity @e[scores={PuzzleComplete=145}] run fill 1003 66 30 1003 66 30 sticky_piston[extended=true,facing=west] replace air
execute if entity @e[scores={PuzzleComplete=145}] run fill 1002 66 30 1002 66 30 piston_head[type=sticky,facing=west] replace air

execute if entity @e[scores={PuzzleComplete=150}] run fill 997 63 30 1003 68 31 air replace sticky_piston


# SUMMON QMAGNET (PUZZLE)
execute align x align y align z if entity @a[x=1000,y=65,z=86,dx=0,dy=1,dz=0] run scoreboard players set @e[tag=MainPuzzleAEC,scores={PuzzleComplete=..199}] PuzzleComplete 200

execute if entity @e[scores={PuzzleComplete=200}] run kill @e[tag=Puzzleqmagnet]

# HEAD
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 64.1 88 {Tags:["Puzzleqmagnet","PuzzleQHead"],Invisible:true,Invulnerable:true,Rotation:[260.0f,0.0f],NoBasePlate:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}},Count:1b}],Pose:{Head:[170f,0f,0f]},DisabledSlots:2039583}

# CHEST
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 64.13 88 {Tags:["Puzzleqmagnet","PuzzleQBody","PuzzleQBody2"],Invisible:true,Invulnerable:true,Rotation:[260.0f,0.0f],NoBasePlate:true,NoGravity:true,ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{}],Pose:{Head:[180f,0f],RightArm:[180f,0f,355f],LeftArm:[180f,0f,5f],RightLeg:[180f,0f,0f],LeftLeg:[180f,0f,0f],Body:[180f,0f,0f]},DisabledSlots:2039583,ShowArms:false}

# LEGS
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 65.9 88 {Tags:["Puzzleqmagnet","PuzzleQLegs"],Invisible:true,Invulnerable:true,Rotation:[260.0f,0.0f],NoBasePlate:true,NoGravity:true,ArmorItems:[{},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{},{}],Pose:{Head:[0f,0f,0f],RightArm:[170f,0f,0f],LeftArm:[0f,0f,0f],RightLeg:[0f,0f,0f],LeftLeg:[0f,0f,0f],Body:[0f,0f,0f]},DisabledSlots:2039583,Marker:true}

# FEET
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 66.6 88 {Tags:["Puzzleqmagnet","PuzzleQFeet"],Invisible:true,Invulnerable:true,Rotation:[260.0f,0.0f],NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{},{},{}],DisabledSlots:2039583,Marker:true}

# STICK ARMS
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 64.26 88 {Tags:["Puzzleqmagnet","PuzzleQBody","PuzzleQBody1"],Invisible:false,Invulnerable:true,Rotation:[260.0f,0.0f],NoBasePlate:true,NoGravity:true,ArmorItems:[{},{},{},{}],Pose:{Head:[180f,0f],RightArm:[180f,0f,355f],LeftArm:[180f,0f,5f],RightLeg:[180f,0f,0f],LeftLeg:[180f,0f,0f],Body:[180f,0f,0f]},DisabledSlots:2039583,ShowArms:true}

# HELD ITEM
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1002.8 64.7 89.0 {Tags:["Puzzleqmagnet","PuzzleQItem"],Invisible:true,Invulnerable:true,Rotation:[90.0f,0.0f],NoBasePlate:true,NoGravity:true,DisabledSlots:2039583,ShowArms:true,HandItems:[{id:"minecraft:nothing",Count:0b,Damage:14s}],Pose:{RightArm:[50f,90f,0f]}}

# 1973790 -> hands
# 2039583 -> none


# CRAZY FAKE BLOCK MAGIC
execute if entity @e[scores={PuzzleComplete=200}] run kill @e[tag=FinalRoomBlock]

execute if entity @e[scores={PuzzleComplete=200}] run summon item_frame 1003 65 89 {Facing: 4b,ItemRotation:4b,Invulnerable:true,Rotation:[90.0f,0.0f],Item:{id:"minecraft:spruce_sapling",Count:1b},Silent:true,Tags:["FinalRoomBlock","FinalFrame"]}
execute if entity @e[scores={PuzzleComplete=201..}] as @e[tag=FinalFrame,nbt=!{ItemRotation:4b}] run data merge entity @s {ItemRotation:4b}

execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 67 89 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_wool"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FinalRoomBlock"]}],Tags:["FinalRoomBlock"]}
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1003 67 90 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_wool"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FinalRoomBlock"]}],Tags:["FinalRoomBlock"]}
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1004 66 89 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_terracotta"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FinalRoomBlock"]}],Tags:["FinalRoomBlock"]}
execute if entity @e[scores={PuzzleComplete=200}] run summon armor_stand 1004 66 90 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_terracotta"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FinalRoomBlock"]}],Tags:["FinalRoomBlock"]}

execute if entity @e[scores={PuzzleComplete=200}] run teleport @e[tag=GrummPig] 1007 1 96
execute if entity @e[scores={PuzzleComplete=200}] run summon pig 1007 66 96 {Rotation:[90f,0f],CustomName: "{\"text\":\"Grumm\"}",Tags:["GrummPig"]}

execute if entity @e[scores={PuzzleComplete=200}] run scoreboard objectives add RenewCart dummy
execute if entity @e[scores={PuzzleComplete=200}] run scoreboard players set @e[tag=MainPuzzleAEC] RenewCart 0

scoreboard players set @e[scores={PuzzleComplete=200}] PuzzleComplete 201


# KEEPS MINECARTS UPSIDE DOWN
scoreboard players add @e[tag=MainPuzzleAEC] RenewCart 1

execute if entity @e[scores={RenewCart=1}] run kill @e[tag=ChestCart]
execute if entity @e[scores={RenewCart=1}] run kill @e[tag=BedCart]
execute if entity @e[scores={RenewCart=1}] run fill 1000 66 90 1003 66 90 air 
execute if entity @e[scores={RenewCart=1}] unless block 1003 67 89 hopper[facing=down] run setblock 1003 67 89 hopper[facing=down]{CustomName:"{\"text\":\"Chest\"}",Lock:"locked"}

execute if entity @e[scores={RenewCart=1}] run summon minecart 1003 68 89 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],OnGround:0b,Rotation:[180.0f,180.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:chest"},DisplayOffset:38,DisplayData:0,Tags:["ChestCart","FinalRoomBlock"]}
execute if entity @e[scores={RenewCart=1}] run summon minecart 1003 68 90 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],OnGround:0b,Rotation:[0.0f,180.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:red_bed"},DisplayOffset:38,DisplayData:0,Tags:["BedCart","FinalRoomBlock"]}
execute if entity @e[scores={RenewCart=1}] run summon minecart 999 68.02 90 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],OnGround:0b,Rotation:[180.0f,180.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:flower_pot"},DisplayOffset:59,DisplayData:0,Tags:["ChestCart","FinalRoomBlock"]}
execute if entity @e[scores={RenewCart=1}] run summon minecart 999.47 69 90.49 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],OnGround:0b,Rotation:[180.0f,180.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:poppy"},DisplayOffset:84,DisplayData:0,Tags:["ChestCart","FinalRoomBlock"]}


scoreboard players set @e[scores={RenewCart=800..}] RenewCart 0


# CONVERSATION WITH Q
execute as @p[x=998,y=63,z=87,dx=5,dy=3,dz=5] run scoreboard players set @e[scores={PuzzleComplete=201}] PuzzleComplete 202
scoreboard players add @e[scores={PuzzleComplete=202..}] PuzzleComplete 1

execute if entity @e[scores={PuzzleComplete=220}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Hello?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=260}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"What are you doing up there?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=400}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"You think you can just walk into anyone's room you feel like?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=520}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Wait, did you seriously solve all my puzzles?!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=680}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Alright. Well I guess that deserves the Red Wool then. Here you go!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=980}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Well, aren't you gonna take it?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=1280}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Look. This isn't rocket science. Just grab it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=1580}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Okay. You're not getting it. Here. I'll put it into your inventory.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={PuzzleComplete=1670}] run give @p[x=1003,y=65,z=88] red_wool 1


# Q MOVEMENTS
execute if entity @e[scores={PuzzleComplete=202}] as @e[tag=PuzzleQItem] run data merge entity @s {HandItems:[{}],DisabledSlots:2039583}
execute if entity @e[scores={PuzzleComplete=202}] as @e[tag=PuzzleQBody] run data merge entity @s {Pose:{RightArm:[180f,0f,355f]}}

execute if entity @e[scores={PuzzleComplete=780}] at @e[tag=PuzzleQItem] run playsound block.wool.step master @a ~ ~ ~ 1 1.3 0
execute if entity @e[scores={PuzzleComplete=780}] as @e[tag=PuzzleQItem] run data merge entity @s {HandItems:[{id:"minecraft:red_wool",Count:1b}],DisabledSlots:1973790}
execute if entity @e[scores={PuzzleComplete=780}] as @e[tag=PuzzleQBody] run data merge entity @s {Pose:{RightArm:[90f,350f]}}


# NIGHT VISION
execute if entity @e[scores={PuzzleComplete=1..}] run effect clear @a night_vision
execute align x align y align z run effect give @a[x=999,y=62,z=85,dx=4,dy=5,dz=6,y_rotation=-100..100] night_vision 11 1 true


# COMPLETE BRANCH
tag @a remove HasRedWool
tag @a[nbt={Inventory:[{id:"minecraft:red_wool"}]}] add HasRedWool
execute if entity @a[tag=HasRedWool] run clear @a
replaceitem entity @a[tag=HasRedWool] weapon.mainhand red_wool
execute if entity @a[tag=HasRedWool] run setblock 33 2 14 clay
execute if entity @a[tag=HasRedWool] run kill @e[tag=FinalRoomBlock]
execute if entity @a[tag=HasRedWool] run teleport @a 40 4 1 0 -90
