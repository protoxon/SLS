####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE AND QMAGNET
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# General 20hz clock for golf branch. Runs when golf branch is active.

# Fix for the LITERALLY UNPLAYABLE jungle slab issue
fill 202 80 3075 204 80 3075 minecraft:jungle_slab[type=bottom]


# QWERTY NPC
execute if block -4 88 3210 acacia_planks unless entity @e[tag=GolfQwerty] run summon armor_stand -4 89 3210 {CustomName:"{\"text\":\"qwertyuiopthepie\",\"color\":\"dark_green\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[202.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,HandItems:[{id:"minecraft:ender_pearl",Count:1b},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"03b07a62-98e6-4fc4-8187-fb276d5a317c",Properties:{textures:[{Signature:"eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]},Name:"qwertyuiopthepie"}},Count:1b}],DisabledSlots:2039583,Tags:["GolfQwerty"]}

execute as @e[tag=GolfQwerty] at @s run teleport @s ^ ^ ^ facing entity @p


# GOLF CARTS
function d3:bonus/golf_carts
function d3:bonus/reminder_signs

# UUID assignment system (relocated to setup_player)
# tag @p[tag=!UUIDed] add UUIDing
# scoreboard players operation @p[tag=UUIDing] UUID = MasterUUID UUID
# execute if entity @p[tag=UUIDing] run scoreboard players add MasterUUID UUID 1
# execute if block 14 2 46 redstone_block run tag @p[tag=UUIDing] add UUIDed
# tag @p[tag=UUIDing] remove UUIDing



# Detect hole start region
execute as @a[tag=!golfing,scores={currentHole=1},x=57.5,y=86,z=3206.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=2},x=156.5,y=79,z=3146.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=3},x=204.5,y=85,z=3070.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=4},x=73.5,y=103,z=3030.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=5},x=113.5,y=143,z=3113.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=6},x=137.5,y=154,z=3248.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=7},x=97.5,y=104,z=3317.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=8},x=12.5,y=132,z=3318.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=9},x=-90.5,y=105,z=3325.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=10},x=-100.5,y=129,z=3207.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=11},x=-11.5,y=179,z=3144.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=12},x=25.5,y=181,z=3177.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=13},x=118.5,y=210,z=3233.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=14},x=175.5,y=208,z=3189.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=15},x=133.5,y=208,z=3055.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=16},x=30.5,y=193,z=3035.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=17},x=-34.5,y=103,z=3058.5,distance=..1] run function d3:bonus/start_hole
execute as @a[tag=!golfing,scores={currentHole=18},x=-17.5,y=102,z=3124.5,distance=..1] run function d3:bonus/start_hole



# Detect hole end (lazy but effective if barriers in place)
# If needed, may need to tie this to currentHole and specific coordinates
# Future Qwerty here, no need. OoB was arranged to prevent going into the wrong hole.
execute as @a[tag=golfing] at @s if block ~ ~-1 ~ black_concrete run function d3:bonus/finish_hole



# This stuff assigns UUIDs to the ender pearls and ender-pearl-tracking AEC, as well as currentHole for OOB tracking
execute at @e[type=ender_pearl,tag=!tagged] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["enderPearlLoc"]}
execute as @e[type=ender_pearl,tag=!tagged] at @s run scoreboard players operation @s UUID = @p UUID
execute as @e[type=ender_pearl,tag=!tagged] at @s run scoreboard players operation @s currentHole = @p currentHole
execute as @e[tag=enderPearlLoc,tag=!tagged] at @s run scoreboard players operation @s UUID = @p UUID
execute as @e[tag=enderPearlLoc,tag=!tagged] at @s run scoreboard players operation @s currentHole = @p currentHole
tag @e[type=ender_pearl,tag=!tagged] add tagged
tag @e[type=area_effect_cloud,tag=!tagged] add tagged

execute as @a at @s run function d3:bonus/anticheat



# Particle effects for AEC tracking
#execute at @e[type=area_effect_cloud] run particle minecraft:angry_villager ~ ~ ~

# Lazy but effective health/hunger management
effect give @a[nbt=!{Health:20.0f}] minecraft:regeneration 10 10 true
effect give @a[nbt=!{foodSaturationLevel:20.0f}] minecraft:saturation 10 10 true
effect give @a minecraft:resistance 10 10 true

# Course exit shortcut
execute as @a[scores={droppedPearl=1..}] run function d3:bonus/cancel_hole
kill @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}}]



# OoB Detection (ohboy) (some of it's in anticheat)
tag @e[tag=golferLoc] add outOfBounds
tag @e[type=ender_pearl] add outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=1},x=54,y=78,z=3170,dx=38,dy=300,dz=45] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=2},x=149,y=72,z=3102,dx=84,dy=300,dz=48] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=3},x=111,y=82,z=3008,dx=103,dy=300,dz=63] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=4},x=18,y=97,z=3015,dx=69,dy=300,dz=78] remove outOfBounds
	tag @e[type=ender_pearl,x=82,y=229,z=3080,distance=..10] add outOfBounds
	tag @e[tag=golferLoc,x=82,y=229,z=3080,distance=..10] add outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=5},x=97,y=128,z=3102,dx=63,dy=300,dz=103] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=6},x=117,y=103,z=3235,dx=54,dy=300,dz=61] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=7},x=47,y=98,z=3291,dx=67,dy=300,dz=50] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=8},x=-48,y=88,z=3308,dx=74,dy=300,dz=41] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=9},x=-114,y=98,z=3241,dx=38,dy=300,dz=100] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=10},x=-122,y=125,z=3140,dx=73,dy=300,dz=72] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=11},x=-26,y=174,z=3112,dx=43,dy=300,dz=52] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=12},x=14,y=174,z=3167,dx=58,dy=300,dz=86] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=13},x=110,y=204,z=3215,dx=49,dy=300,dz=40] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=14},x=165,y=204,z=3095,dx=39,dy=300,dz=101] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=15},x=70,y=204,z=3030,dx=72,dy=300,dz=57] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=16},x=-77,y=151,z=3017,dx=115,dy=300,dz=35] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=17},x=-45,y=100,z=3053,dx=25,dy=300,dz=50] remove outOfBounds
tag @e[tag=outOfBounds,scores={currentHole=18},x=-24,y=100,z=3118,dx=13,dy=126,dz=47] remove outOfBounds
# \/ No longer needed with the "Water hazard" feature.
# execute as @e[type=ender_pearl] at @s if block ~ ~ ~ water run tag @s add outOfBounds



# \/ What was this?
#fill 6 89 3200 12 89 3209 acacia_pressure_plate replace heavy_weighted_pressure_plate
execute as @a at @s run kill @s[y=-40,dy=40,gamemode=!creative]



# GolfClap (IMPORTANT)
execute as @a[scores={golfClap=1}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.6
execute as @a[scores={golfClap=4}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.6
#execute as @a[scores={golfClap=6}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.6
execute as @a[scores={golfClap=8}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.6
execute as @a[scores={golfClap=10}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.6

execute as @a[scores={golfClap=11..20}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.2 1.6
execute as @a[scores={golfClap=21..30}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.3 1.7
execute as @a[scores={golfClap=31..40}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.4 1.8
execute as @a[scores={golfClap=41..50}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.2 1.8

execute as @a[scores={golfClap=51}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.7
execute as @a[scores={golfClap=53}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.7
execute as @a[scores={golfClap=54}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.7
#execute as @a[scores={golfClap=56}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.7
execute as @a[scores={golfClap=60}] at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 0.1 1.7
scoreboard players add @a[scores={golfClap=..60}] golfClap 1
scoreboard players reset @a[scores={golfClap=60..}] golfClap



# Make sure players keep their clothes on
execute as @a[scores={golfGear=1..}] unless entity @s[nbt={Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run scoreboard players add @s golfGear 50
execute as @a[scores={golfGear=1..}] unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:leather_chestplate"}]}] run scoreboard players add @s golfGear 50
execute as @a[scores={golfGear=1..}] unless entity @s[nbt={Inventory:[{Slot:101b,id:"minecraft:leather_leggings"}]}] run scoreboard players add @s golfGear 50
execute as @a[scores={golfGear=1..}] unless entity @s[nbt={Inventory:[{Slot:100b,id:"minecraft:leather_boots"}]}] run scoreboard players add @s golfGear 50



# Tutorial shulker marker
execute if block 14 2 46 redstone_block if entity @a[x=-13,y=89,z=3193,dx=27,dy=13,dz=18] unless entity @e[tag=tutorialMarker] run summon shulker -10 88 3207 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["tutorialMarker","holeMarker"]}
execute align x align y align z unless entity @a[x=-13,y=89,z=3193,dx=27,dy=13,dz=18] if entity @e[tag=tutorialMarker] as @e[tag=tutorialMarker] at @s run tp @s ~ 0 ~
execute as @e[tag=tutorialMarker] at @s run kill @s[y=0,dy=1]

# Tutorial starting area
##tellraw @a[x=-11,y=90,z=3201,dx=2,dy=3,dz=2,tag=!startTut] {"text":"⬤ This dark green square is the starting area of each hole. Step onto it to start the hole.","color":"dark_green"}

tellraw @a[x=-11,y=90,z=3201,dx=2,dy=3,dz=2,tag=!startTut] ["",{"text":"<qwertyuiopthepie> ","color":"dark_green","bold":false},{"text":"Dark green square pads mark the start for each hole. Step onto them to begin.","color":"none","bold":false,"underlined":false}]

tag @a[x=-11,y=90,z=3201,dx=2,dy=3,dz=2] add startTut
execute as @a[tag=startTut] unless entity @s[x=-11,y=90,z=3201,dx=2,dy=3,dz=2] run tag @s remove startTut

##tellraw @a[x=-11,y=90,z=3206,dx=2,dy=3,dz=2,tag=!startTut2] {"text":"⬤ The holes look like this. The glowing cube will only be present if a player is currently playing that hole. Try to get the ball into it in as few shots as possible.","color":"dark_green"}

tellraw @a[x=-11,y=90,z=3206,dx=2,dy=3,dz=2,tag=!startTut2] ["",{"text":"<qwertyuiopthepie> ","color":"dark_green","bold":false},{"text":"Glowing cubes mark the goal for every hole. Aim for them out on the course.","color":"none","bold":false,"underlined":false}]

tag @a[x=-11,y=90,z=3206,dx=2,dy=3,dz=2] add startTut2
execute as @a[tag=startTut2] unless entity @s[x=-11,y=90,z=3206,dx=2,dy=3,dz=2] run tag @s remove startTut2



# Detect when opening area is complete
execute if entity @a[x=-13,y=89,z=3193,dx=27,dy=13,dz=18] if score openingArea UUID matches 0 unless entity @a[scores={golfGear=0}] run function d3:bonus/open_pro_shop
# Catch if all armor is taken
execute unless entity @e[tag=GolfGearStand] unless entity @e[x=-13,y=89,z=3193,dx=27,dy=13,dz=18,tag=tutorialMarker] if entity @a[x=-13,y=89,z=3193,dx=27,dy=13,dz=18,scores={golfGear=0}] if score openingArea UUID matches 0 run scoreboard players set openingArea UUID 2
execute if score openingArea UUID matches 2 run tellraw @a ["",{"text":"<qwertyuiopthepie> ","color":"dark_green","bold":false},{"text":"Wow. All out of armor? Amazing! For legal reasons, we can't have anyone on the course without appropriate gear, so everyone left can have the ultra-rare green gear.","color":"none","bold":false,"underlined":false}]
#{"text":"● Wow, all out of armor? Amazing! For legal reasons, we can't have anyone on the course without appropriate gear, so everyone left can have the ultra-rare green gear.","color":"dark_green"}
execute if score openingArea UUID matches 2 run scoreboard players set @a[scores={golfGear=0}] golfGear 63
execute if score openingArea UUID matches 2 run function d3:bonus/open_pro_shop



# Seeeeekrit Armor
scoreboard players set @a[scores={golfGear=0},x=0.3,y=89,z=3193.3,distance=..0.001,x_rotation=-90,y_rotation=-.5...5] golfGear 64
scoreboard players set @a[scores={golfGear=0},x=13.7,y=89.5,z=3199.3,distance=..0.001,x_rotation=90,y_rotation=44.5..45.5] golfGear 63

# Reload the golf gear if anyone has a needed scoreboard value (put after any place where that happens)
execute as @a[scores={golfGear=50..}] run function d3:bonus/golf_gear

# Send anyone who tries to leave without gear back to the place from whence they came
tellraw @a[x=-2,y=89,z=3213,dx=4,dy=4,dz=0,scores={golfGear=0}] ["",{"text":"<qwertyuiopthepie> ","color":"dark_green","bold":false},{"text":"Whoa there! We can't have you out on the field without the proper attire. Pick something to wear.","color":"none","bold":false,"underlined":false}]

###{"text":"⬤ Whoa there! You can't head out onto the field until you have some protective equipment!","color":"dark_green"}
tp @a[x=-2,y=89,z=3213,dx=4,dy=4,dz=0,scores={golfGear=0}] 0 91 3200 0 0


# Catch any stragglers (not needed if this method is expanded to other branches)
teleport @a[tag=!inGolfBranch] 0 90 3200 0 0
#execute if entity @a[tag=NewPlayer] run function d3:teleport_to_game
execute align x align y align z as @a[tag=!inGolfBranch,x=0,y=90,z=3200,dx=0,dy=0,dz=0] run function d3:bonus/setup_player


#execute at @a[nbt={OnGround:1b}] as @e[tag=golferLoc,distance=..2] run data merge entity @s {Marker:1b}
#execute at @a[nbt={OnGround:0b}] as @e[tag=golferLoc,distance=..2] run data merge entity @s {Marker:0b}
#execute unless entity @e[tag=golferLoc,nbt=!{Marker:1b}] run scoreboard objectives remove golferLocTimer
#scoreboard players set @e[tag=golferLoc,nbt=!{OnGround:1b}] golferLocTimer
#scoreboard players add @e[tag=golferLoc,nbt={OnGround:1b}] golferLocTimer 1


# If this is expanded, it could either be added to the main loop of each branch, or teleport_to_game could be set to run as a constant loop and it could be moved there.
# If the latter, remember to remove all inBranch tags before setting up the player for the new branch.