####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2018 / JANUARY 28 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlackIsland
#scoreboard objectives setdisplay sidebar FinaleSkull

execute if block 1 6 110 clay run scoreboard objectives add BlackIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] BlackIsland 0


# SETUP
execute if entity @e[scores={BlackIsland=0}] run kill @e[tag=FinaleBoss]
execute if entity @e[scores={BlackIsland=0}] unless block -32 194 4935 soul_sand run setblock -32 194 4935 soul_sand
execute if entity @e[scores={BlackIsland=0}] unless block -32 194 4936 soul_sand run setblock -32 194 4936 soul_sand
execute if entity @e[scores={BlackIsland=0}] unless block -32 194 4937 soul_sand run setblock -32 194 4937 soul_sand
execute if entity @e[scores={BlackIsland=0}] unless entity @e[tag=FinaleSoulSand] run summon falling_block -32 193 4936 {BlockState:{Name:"minecraft:soul_sand"},Tags:["FinaleSoulSand"],DropItem:false,Time:-2147483648,NoGravity:1b}

execute if entity @e[scores={BlackIsland=0}] unless block -32 195 4935 wither_skeleton_skull run setblock -32 195 4935 wither_skeleton_skull[rotation=4]
execute if entity @e[scores={BlackIsland=0}] unless block -32 195 4937 wither_skeleton_skull run setblock -32 195 4937 wither_skeleton_skull[rotation=4]
execute if entity @e[scores={BlackIsland=0}] unless block -32 193 4936 barrier run setblock -32 193 4936 barrier

execute unless entity @e[tag=FinaleSteve] run summon armor_stand -50 182 4936 {NoGravity:1b,Invulnerable:1b,ShowArms:1b,DisabledSlots:2039583,Pose:{Head:[310.0f,0.0f,0.0f],RightArm:[0.0f,0.0f,10.0f],LeftArm:[0.0f,0.0f,350.0f],RightLeg:[0.0f,5.0f,1.0f],LeftLeg:[0.0f,355.0f,359.0f]},Rotation:[270.0f,0.0f],HandItems:[{id:"minecraft:diamond_sword",Count:1b},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:player_head",Count:1b}],NoBasePlate:1b,Tags:["FinaleSteve"]}

# SPAWNS SKULL
execute if entity @e[scores={BlackIsland=0}] run scoreboard objectives add FinaleSkull dummy
execute if entity @e[type=item,nbt={Item:{id:"minecraft:wither_skeleton_skull",tag:{FinaleSkull:1b}}}] run scoreboard objectives remove FinaleSkull
execute if entity @a[nbt={Inventory:[{id:"minecraft:wither_skeleton_skull",tag:{FinaleSkull:1b}}]}] run scoreboard objectives remove FinaleSkull
scoreboard players add @e[tag=MainFinaleAEC] FinaleSkull 1
execute if entity @e[scores={FinaleSkull=100}] run playsound entity.item.pickup master @a -30 193 4936 0.5 1 0
execute if entity @e[scores={FinaleSkull=100..}] run summon item -30 193 4936 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}}}


# ADD MECHANIC FOR AUTO POPPING OFF WRONGLY PLACED SKULLS
execute if entity @e[scores={BlackIsland=0}] if block -31 194 4937 wither_skeleton_wall_skull run summon item -31 194 4937 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -31 194 4937 wither_skeleton_wall_skull run setblock -31 194 4937 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -31 194 4936 wither_skeleton_wall_skull run summon item -31 194 4936 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -31 194 4936 wither_skeleton_wall_skull run setblock -31 194 4936 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -31 194 4935 wither_skeleton_wall_skull run summon item -31 194 4935 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -31 194 4935 wither_skeleton_wall_skull run setblock -31 194 4935 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -31 193 4936 wither_skeleton_wall_skull run summon item -31 193 4936 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -31 193 4936 wither_skeleton_wall_skull run setblock -31 193 4936 air destroy


execute if entity @e[scores={BlackIsland=0}] if block -33 194 4935 wither_skeleton_wall_skull run summon item -33 194 4935 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[-0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -33 194 4935 wither_skeleton_wall_skull run setblock -33 194 4935 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -33 194 4936 wither_skeleton_wall_skull run summon item -33 194 4936 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[-0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -33 194 4936 wither_skeleton_wall_skull run setblock -33 194 4936 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -33 194 4937 wither_skeleton_wall_skull run summon item -33 194 4937 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[-0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -33 194 4937 wither_skeleton_wall_skull run setblock -33 194 4937 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -33 193 4936 wither_skeleton_wall_skull run summon item -33 193 4936 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[-0.1d,0.2d,0.0d]}
execute if entity @e[scores={BlackIsland=0}] if block -33 193 4936 wither_skeleton_wall_skull run setblock -33 193 4936 air destroy


execute if entity @e[scores={BlackIsland=0}] if block -32 194 4934 wither_skeleton_wall_skull run summon item -32 194 4934 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.0d,0.2d,-0.1d]}
execute if entity @e[scores={BlackIsland=0}] if block -32 194 4934 wither_skeleton_wall_skull run setblock -32 194 4934 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -32 193 4935 wither_skeleton_wall_skull run summon item -32 193 4935 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.0d,0.2d,-0.1d]}
execute if entity @e[scores={BlackIsland=0}] if block -32 193 4935 wither_skeleton_wall_skull run setblock -32 193 4935 air destroy


execute if entity @e[scores={BlackIsland=0}] if block -32 194 4938 wither_skeleton_wall_skull run summon item -32 194 4938 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.0d,0.2d,0.1d]}
execute if entity @e[scores={BlackIsland=0}] if block -32 194 4938 wither_skeleton_wall_skull run setblock -32 194 4938 air destroy

execute if entity @e[scores={BlackIsland=0}] if block -32 193 4937 wither_skeleton_wall_skull run summon item -32 193 4937 {Item:{id:"minecraft:wither_skeleton_skull",Count:1b,tag:{CanPlaceOn:["minecraft:soul_sand","minecraft:barrier"],HideFlags:16,FinaleSkull:1b}},PickupDelay:30,Motion:[0.0d,0.2d,0.1d]}
execute if entity @e[scores={BlackIsland=0}] if block -32 193 4937 wither_skeleton_wall_skull run setblock -32 193 4937 air destroy



# STONE APPEARS
execute if entity @e[scores={BlackIsland=0}] if block -32 195 4936 wither_skeleton_skull run scoreboard players set @e[scores={BlackIsland=0}] BlackIsland 500
execute if entity @e[scores={BlackIsland=501..}] run scoreboard objectives remove FinaleSkull
scoreboard players add @e[scores={BlackIsland=500..599}] BlackIsland 1
execute if entity @e[scores={BlackIsland=501}] run kill @e[tag=FinaleSoulSand]
execute if entity @e[scores={BlackIsland=501}] run fill -31 193 4934 -33 195 4938 air destroy
execute if entity @e[scores={BlackIsland=501}] run playsound entity.wither.spawn hostile @a -32 194 4936
execute if entity @e[scores={BlackIsland=501}] run summon husk -32 194 4936 {IsBaby:1b,Health:1.0f,Silent:1b,Rotation:[270.0f,0.0f],Motion:[0.5d,0.2d,0.0d],Attributes:[{Name:"generic.attackDamage",Base:0.0},{Name:"generic.movementSpeed",Base:0.1}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["FinaleBoss","FinaleBossMob"]}
execute if entity @e[tag=FinaleBossMob] unless entity @e[tag=FinaleBossAS] at @e[tag=FinaleBossMob] run summon armor_stand -32 194 4936 {ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}],Marker:1b,Invisible:1b,NoGravity:1b,Tags:["FinaleBoss","FinaleBossAS"],DisabledSlots:2039583}
execute unless entity @e[tag=FinaleBossMob] run kill @e[tag=FinaleBossAS]
execute as @e[tag=FinaleBossAS] at @e[tag=FinaleBossMob] run teleport @s ~ ~-1.4 ~ ~ ~
execute at @e[tag=FinaleBossMob,nbt={HurtTime:10s}] run playsound entity.wither.death hostile @a ~ ~ ~ 1 0.5 0
execute if entity @e[tag=FinaleBossMob,nbt={HurtTime:10s}] run kill @e[tag=FinaleBossMob]


# BOSSBAR
execute if entity @e[scores={BlackIsland=501}] run bossbar add finaleboss {"text":"Stone Jr.","color":"gray","bold":"false"}
execute if entity @e[scores={BlackIsland=501}] run bossbar set finaleboss color purple
execute if entity @e[scores={BlackIsland=501}] run bossbar set finaleboss style progress
execute if entity @e[scores={BlackIsland=501}] run bossbar set finaleboss max 1
execute if entity @e[scores={BlackIsland=501}] run bossbar set finaleboss players @a
execute store result bossbar finaleboss value run data get entity @e[tag=FinaleBossMob,limit=1] Health
execute unless entity @e[tag=FinaleBossMob] run bossbar remove finaleboss

execute align x align y align z run effect give @a[x=-40,y=182,z=4926,dx=20,dy=20,dz=20] night_vision 11 255 true

#playsound entity.wither.death hostile @a



# SET UP FOR WOOL DROP
execute if entity @e[scores={BlackIsland=550..600}] unless entity @e[tag=FinaleBossMob] run scoreboard players set @e[scores={BlackIsland=600}] BlackIsland 800
scoreboard players add @e[scores={BlackIsland=800..}] BlackIsland 1


# WOOL DROPS
execute if entity @e[scores={BlackIsland=1002}] run setblock 1 6 110 black_wool

execute if entity @e[scores={BlackIsland=1002}] run playsound entity.evoker.cast_spell master @a -36 184 4912 2 1 1
execute if entity @e[scores={BlackIsland=1002}] run playsound entity.ender_eye.death master @a -36 184 4912 2 0.5 1
execute if entity @e[scores={BlackIsland=1002}] run playsound entity.player.levelup master @a -36 184 4912 3 1 1

execute if entity @e[scores={BlackIsland=1002}] run kill @e[tag=RandomBlackWoolAEC]
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -37 184 4911 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -36 184 4911 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -35 184 4911 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -37 184 4912 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -36 184 4912 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -35 184 4912 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -37 184 4913 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -36 184 4913 {Tags:["RandomBlackWoolAEC"],Duration:200}
execute if entity @e[scores={BlackIsland=1002}] run summon area_effect_cloud -35 184 4913 {Tags:["RandomBlackWoolAEC"],Duration:200}

execute if entity @e[scores={BlackIsland=1002}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1007}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1012}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1017}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1022}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1027}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1032}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1037}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC
execute if entity @e[scores={BlackIsland=1042}] run tag @e[tag=RandomBlackWoolAEC,limit=1,sort=random] add ChosenBlackWoolAEC

execute if entity @e[scores={BlackIsland=1002..}] at @e[tag=ChosenBlackWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:black_wool"},Tags:["FinaleWoolFB","BlackWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenBlackWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={BlackIsland=1002..}] if block -37 184 4911 black_wool if block -36 184 4911 black_wool if block -35 184 4911 black_wool if block -37 184 4912 black_wool if block -36 184 4912 black_wool if block -35 184 4912 black_wool if block -37 184 4913 black_wool if block -36 184 4913 black_wool if block -35 184 4913 black_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={BlackIsland=1002..}] if block -37 184 4911 black_wool if block -36 184 4911 black_wool if block -35 184 4911 black_wool if block -37 184 4912 black_wool if block -36 184 4912 black_wool if block -35 184 4912 black_wool if block -37 184 4913 black_wool if block -36 184 4913 black_wool if block -35 184 4913 black_wool run scoreboard objectives remove FinaleSkull
execute if entity @e[scores={BlackIsland=1002..}] if block -37 184 4911 black_wool if block -36 184 4911 black_wool if block -35 184 4911 black_wool if block -37 184 4912 black_wool if block -36 184 4912 black_wool if block -35 184 4912 black_wool if block -37 184 4913 black_wool if block -36 184 4913 black_wool if block -35 184 4913 black_wool run scoreboard objectives remove BlackIsland

