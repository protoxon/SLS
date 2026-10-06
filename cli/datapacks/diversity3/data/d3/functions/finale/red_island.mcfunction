####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2018 / SEPTEMBER 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar RedIsland
#scoreboard objectives setdisplay sidebar YellowPiston



# CLEANS UP SKULLS FROM BROWN ISLAND
execute if entity @a[nbt={Inventory:[{id:"minecraft:skeleton_skull"}]}] run clear @a skeleton_skull
execute if entity @a[nbt={Inventory:[{id:"minecraft:zombie_head"}]}] run clear @a zombie_head
execute if entity @a[nbt={Inventory:[{id:"minecraft:creeper_head"}]}] run clear @a creeper_head
execute if entity @a[nbt={Inventory:[{id:"minecraft:wither_skeleton_skull"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:wither_skeleton_skull"}]},nbt=!{Inventory:[{id:"minecraft:wither_skeleton_skull",tag:{FinaleSkull:1b}}]}] wither_skeleton_skull


execute if block 2 6 110 clay run scoreboard objectives add RedIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] RedIsland 0

execute if entity @e[scores={RedIsland=0}] if block -121 169 4988 air if block -121 169 4974 air if block -121 169 4960 air if block -107 169 4988 air if block -107 169 4974 air if block -107 169 4960 air if block -93 169 4988 air if block -93 169 4974 air if block -93 169 4960 air run scoreboard players set @e[scores={RedIsland=0}] RedIsland 1




# YELLOW BUTTON
tag @e remove InYellow
execute align xyz as @e[x=-121,y=167,z=4988,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InYellow
execute if block -116 170 4991 stone_button[powered=true] unless entity @e[scores={YellowPiston=0..}] unless block -121 164 4988 redstone_block run setblock -121 164 4988 redstone_block
execute if block -116 170 4991 stone_button[powered=false] unless entity @e[scores={YellowPiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -121 164 4988 redstone_block run setblock -121 164 4988 stone
execute if entity @a[tag=InYellow] run scoreboard objectives add YellowPiston dummy
scoreboard players add @e[tag=MainFinaleAEC] YellowPiston 1
execute if entity @e[scores={YellowPiston=39..}] unless block -121 164 4988 redstone_block run setblock -121 164 4988 redstone_block
execute if entity @e[scores={YellowPiston=59..}] if block -121 164 4988 redstone_block run setblock -121 164 4988 stone
execute if entity @e[scores={YellowPiston=59..}] run scoreboard objectives remove YellowPiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-121,y=174,z=4988,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-122,y=167,z=4987,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -121 168 4988


# ORANGE BUTTON
tag @e remove InOrange
execute align xyz as @e[x=-121,y=167,z=4974,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InOrange
execute if block -116 170 4974 stone_button[powered=true] unless entity @e[scores={OrangePiston=0..}] unless block -121 164 4974 redstone_block run setblock -121 164 4974 redstone_block
execute if block -116 170 4974 stone_button[powered=false] unless entity @e[scores={OrangePiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -121 164 4974 redstone_block run setblock -121 164 4974 stone
execute if entity @a[tag=InOrange] run scoreboard objectives add OrangePiston dummy
scoreboard players add @e[tag=MainFinaleAEC] OrangePiston 1
execute if entity @e[scores={OrangePiston=39..}] unless block -121 164 4974 redstone_block run setblock -121 164 4974 redstone_block
execute if entity @e[scores={OrangePiston=59..}] if block -121 164 4974 redstone_block run setblock -121 164 4974 stone
execute if entity @e[scores={OrangePiston=59..}] run scoreboard objectives remove OrangePiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-121,y=174,z=4974,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-122,y=167,z=4973,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -121 168 4974


# PURPLE BUTTON
tag @e remove InPurple
execute align xyz as @e[x=-121,y=167,z=4960,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InPurple
execute if block -126 170 4960 stone_button[powered=true] unless entity @e[scores={PurplePiston=0..}] unless block -121 164 4960 redstone_block run setblock -121 164 4960 redstone_block
execute if block -126 170 4960 stone_button[powered=false] unless entity @e[scores={PurplePiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -121 164 4960 redstone_block run setblock -121 164 4960 stone
execute if entity @a[tag=InPurple] run scoreboard objectives add PurplePiston dummy
scoreboard players add @e[tag=MainFinaleAEC] PurplePiston 1
execute if entity @e[scores={PurplePiston=39..}] unless block -121 164 4960 redstone_block run setblock -121 164 4960 redstone_block
execute if entity @e[scores={PurplePiston=59..}] if block -121 164 4960 redstone_block run setblock -121 164 4960 stone
execute if entity @e[scores={PurplePiston=59..}] run scoreboard objectives remove PurplePiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-121,y=174,z=4960,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-122,y=167,z=4959,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -121 168 4960


# BROWN BUTTON
tag @e remove InBrown
execute align xyz as @e[x=-107,y=167,z=4988,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InBrown
execute if block -107 170 4993 stone_button[powered=true] unless entity @e[scores={BrownPiston=0..}] unless block -107 164 4988 redstone_block run setblock -107 164 4988 redstone_block
execute if block -107 170 4993 stone_button[powered=false] unless entity @e[scores={BrownPiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -107 164 4988 redstone_block run setblock -107 164 4988 stone
execute if entity @a[tag=InBrown] run scoreboard objectives add BrownPiston dummy
scoreboard players add @e[tag=MainFinaleAEC] BrownPiston 1
execute if entity @e[scores={BrownPiston=39..}] unless block -107 164 4988 redstone_block run setblock -107 164 4988 redstone_block
execute if entity @e[scores={BrownPiston=59..}] if block -107 164 4988 redstone_block run setblock -107 164 4988 stone
execute if entity @e[scores={BrownPiston=59..}] run scoreboard objectives remove BrownPiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-107,y=174,z=4988,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-108,y=167,z=4987,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -107 168 4988


# WHITE BUTTON
tag @e remove InWhite
execute align xyz as @e[x=-107,y=167,z=4974,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InWhite
execute if block -105 169 4974 stone_button[powered=true] unless entity @e[scores={WhitePiston=0..}] unless block -107 164 4974 redstone_block run setblock -107 164 4974 redstone_block
execute if block -105 169 4974 stone_button[powered=false] unless entity @e[scores={WhitePiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -107 164 4974 redstone_block run setblock -107 164 4974 stone
execute if entity @a[tag=InWhite] run scoreboard objectives add WhitePiston dummy
scoreboard players add @e[tag=MainFinaleAEC] WhitePiston 1
execute if entity @e[scores={WhitePiston=39..}] unless block -107 164 4974 redstone_block run setblock -107 164 4974 redstone_block
execute if entity @e[scores={WhitePiston=59..}] if block -107 164 4974 redstone_block run setblock -107 164 4974 stone
execute if entity @e[scores={WhitePiston=59..}] run scoreboard objectives remove WhitePiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-107,y=174,z=4974,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-108,y=167,z=4973,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -107 168 4974


# GREEN BUTTON
tag @e remove InGreen
execute align xyz as @e[x=-107,y=167,z=4960,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InGreen
execute if block -107 170 4955 stone_button[powered=true] unless entity @e[scores={GreenPiston=0..}] unless block -107 164 4960 redstone_block run setblock -107 164 4960 redstone_block
execute if block -107 170 4955 stone_button[powered=false] unless entity @e[scores={GreenPiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -107 164 4960 redstone_block run setblock -107 164 4960 stone
execute if entity @a[tag=InGreen] run scoreboard objectives add GreenPiston dummy
scoreboard players add @e[tag=MainFinaleAEC] GreenPiston 1
execute if entity @e[scores={GreenPiston=39..}] unless block -107 164 4960 redstone_block run setblock -107 164 4960 redstone_block
execute if entity @e[scores={GreenPiston=59..}] if block -107 164 4960 redstone_block run setblock -107 164 4960 stone
execute if entity @e[scores={GreenPiston=59..}] run scoreboard objectives remove GreenPiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-107,y=174,z=4960,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-108,y=167,z=4959,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -107 168 4960


# BLACK BUTTON
tag @e remove InBlack
execute align xyz as @e[x=-93,y=167,z=4988,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InBlack
execute if block -88 170 4988 stone_button[powered=true] unless entity @e[scores={BlackPiston=0..}] unless block -93 164 4988 redstone_block run setblock -93 164 4988 redstone_block
execute if block -88 170 4988 stone_button[powered=false] unless entity @e[scores={BlackPiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -93 164 4988 redstone_block run setblock -93 164 4988 stone
execute if entity @a[tag=InBlack] run scoreboard objectives add BlackPiston dummy
scoreboard players add @e[tag=MainFinaleAEC] BlackPiston 1
execute if entity @e[scores={BlackPiston=39..}] unless block -93 164 4988 redstone_block run setblock -93 164 4988 redstone_block
execute if entity @e[scores={BlackPiston=59..}] if block -93 164 4988 redstone_block run setblock -93 164 4988 stone
execute if entity @e[scores={BlackPiston=59..}] run scoreboard objectives remove BlackPiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-93,y=174,z=4988,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-94,y=167,z=4987,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -93 168 4988


# LIME BUTTON
tag @e remove InLime
execute align xyz as @e[x=-93,y=167,z=4974,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InLime
execute if block -90 170 4969 stone_button[powered=true] unless entity @e[scores={LimePiston=0..}] unless block -93 164 4974 redstone_block run setblock -93 164 4974 redstone_block
execute if block -90 170 4969 stone_button[powered=false] unless entity @e[scores={LimePiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -93 164 4974 redstone_block run setblock -93 164 4974 stone
execute if entity @a[tag=InLime] run scoreboard objectives add LimePiston dummy
scoreboard players add @e[tag=MainFinaleAEC] LimePiston 1
execute if entity @e[scores={LimePiston=39..}] unless block -93 164 4974 redstone_block run setblock -93 164 4974 redstone_block
execute if entity @e[scores={LimePiston=59..}] if block -93 164 4974 redstone_block run setblock -93 164 4974 stone
execute if entity @e[scores={LimePiston=59..}] run scoreboard objectives remove LimePiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-93,y=174,z=4974,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-94,y=167,z=4973,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -93 168 4974


# BLUE BUTTON
tag @e remove InBlue
execute align xyz as @e[x=-93,y=167,z=4960,dx=0,dy=0,dz=0,nbt={OnGround:1b}] run tag @s add InBlue
execute if block -94 170 4955 stone_button[powered=true] unless entity @e[scores={BluePiston=0..}] unless block -93 164 4960 redstone_block run setblock -93 164 4960 redstone_block
execute if block -94 170 4955 stone_button[powered=false] unless entity @e[scores={BluePiston=0..}] unless entity @e[scores={RedIsland=900..}] if block -93 164 4960 redstone_block run setblock -93 164 4960 stone
execute if entity @a[tag=InBlue] run scoreboard objectives add BluePiston dummy
scoreboard players add @e[tag=MainFinaleAEC] BluePiston 1
execute if entity @e[scores={BluePiston=39..}] unless block -93 164 4960 redstone_block run setblock -93 164 4960 redstone_block
execute if entity @e[scores={BluePiston=59..}] if block -93 164 4960 redstone_block run setblock -93 164 4960 stone
execute if entity @e[scores={BluePiston=59..}] run scoreboard objectives remove BluePiston
execute unless entity @e[scores={RedIsland=900..}] align xyz as @e[tag=FinalePistonZombie] at @s[x=-93,y=174,z=4960,dx=0,dy=0,dz=0] run teleport @s ^ ^0.5 ^1.3
execute align xyz as @e[tag=FinalePistonZombie] at @s[x=-94,y=167,z=4959,dx=2,dy=1,dz=2] if block ~ ~ ~ quartz_stairs run teleport @s -93 168 4960


#execute unless entity @e[scores={RedIsland=1}] run tag @e[tag=MainFinaleAEC] remove SpawnFinaleSheep

# RANDOMIZE ZOMBIE LAYOUT
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=YellowPistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=OrangePistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=PurplePistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=BrownPistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=WhitePistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=GreenPistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=BlackPistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=LimePistonZombie] run kill @e[tag=RandomRedFinaleAEC]
execute unless entity @e[scores={RedIsland=1042..}] unless entity @e[tag=BluePistonZombie] run kill @e[tag=RandomRedFinaleAEC]

execute unless entity @e[tag=RandomRedFinaleAEC1] run summon area_effect_cloud -117 169 4984 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC1"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC2] run summon area_effect_cloud -125 169 4978 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC2"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC9] run summon area_effect_cloud -119 170 4955 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC9"],Duration:2147483647}

execute unless entity @e[tag=RandomRedFinaleAEC3] run summon area_effect_cloud -106 170 4982 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC3"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC6] run summon area_effect_cloud -112 169 4979 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC6"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC7] run summon area_effect_cloud -103 169 4964 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC7"],Duration:2147483647}

execute unless entity @e[tag=RandomRedFinaleAEC4] run summon area_effect_cloud -96 169 4993 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC4"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC5] run summon area_effect_cloud -88 170 4978 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC5"],Duration:2147483647}
execute unless entity @e[tag=RandomRedFinaleAEC8] run summon area_effect_cloud -89 170 4962 {Tags:["RandomRedFinaleAEC","RandomRedFinaleAEC8"],Duration:2147483647}

execute unless entity @e[tag=SpawnYellowZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!RandomRedFinaleAEC1,tag=!TaggedAEC] add SpawnYellowZombie
tag @e[tag=SpawnYellowZombie] add TaggedAEC

execute unless entity @e[tag=SpawnOrangeZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!RandomRedFinaleAEC2,tag=!TaggedAEC] add SpawnOrangeZombie
tag @e[tag=SpawnOrangeZombie] add TaggedAEC

execute unless entity @e[tag=SpawnPurpleZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,tag=!RandomRedFinaleAEC3,sort=random,tag=!TaggedAEC] add SpawnPurpleZombie
tag @e[tag=SpawnPurpleZombie] add TaggedAEC

execute unless entity @e[tag=SpawnBrownZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnBrownZombie
tag @e[tag=SpawnBrownZombie] add TaggedAEC

execute unless entity @e[tag=SpawnWhiteZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnWhiteZombie
tag @e[tag=SpawnWhiteZombie] add TaggedAEC

execute unless entity @e[tag=SpawnGreenZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnGreenZombie
tag @e[tag=SpawnGreenZombie] add TaggedAEC

execute unless entity @e[tag=SpawnBlackZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnBlackZombie
tag @e[tag=SpawnBlackZombie] add TaggedAEC

execute unless entity @e[tag=SpawnLimeZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnLimeZombie
tag @e[tag=SpawnLimeZombie] add TaggedAEC

execute unless entity @e[tag=SpawnBlueZombie] run tag @e[tag=RandomRedFinaleAEC,limit=1,sort=random,tag=!TaggedAEC] add SpawnBlueZombie
tag @e[tag=SpawnBlueZombie] add TaggedAEC



# SUMMON ZOMBIES
execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=YellowPistonZombie] at @e[tag=SpawnYellowZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:dandelion",Count:1b,tag:{display:{color:16701501}}}],Tags:["YellowPistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=OrangePistonZombie] at @e[tag=SpawnOrangeZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:orange_tulip",Count:1b,tag:{display:{color:16351261}}}],Tags:["OrangePistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=PurplePistonZombie] at @e[tag=SpawnPurpleZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:allium",Count:1b,tag:{display:{color:8991416}}}],Tags:["PurplePistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=BrownPistonZombie] at @e[tag=SpawnBrownZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:brown_mushroom",Count:1b,tag:{display:{color:8606770}}}],Tags:["BrownPistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=WhitePistonZombie] at @e[tag=SpawnWhiteZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:lily_of_the_valley",Count:1b,tag:{display:{color:16383998}}}],Tags:["WhitePistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=GreenPistonZombie] at @e[tag=SpawnGreenZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:fern",Count:1b,tag:{display:{color:6192150}}}],Tags:["GreenPistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=BlackPistonZombie] at @e[tag=SpawnBlackZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:wither_rose",Count:1b,tag:{display:{color:1908001}}}],Tags:["BlackPistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=LimePistonZombie] at @e[tag=SpawnLimeZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:seagrass",Count:1b,tag:{display:{color:8439583}}}],Tags:["LimePistonZombie","FinalePistonZombie"]}

execute unless entity @e[scores={RedIsland=900..}] unless entity @e[tag=BluePistonZombie] at @e[tag=SpawnBlueZombie] run summon zombie ~ ~ ~ {Health:100.0f,Attributes:[{Name:generic.maxHealth,Base:100.0},{Name:"generic.movementSpeed",Base:0.28},{Name:"generic.attackDamage",Base:0.1}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:blue_orchid",Count:1b,tag:{display:{color:3847130}}}],Tags:["BluePistonZombie","FinalePistonZombie"]}



# ZOMBIES DIE
#execute if entity @e[scores={RedIsland=1}] if block -121 169 4988 yellow_carpet if block -121 169 4974 orange_carpet if block -121 169 4960 purple_carpet if block -107 169 4988 brown_carpet if block -107 169 4974 white_carpet if block -107 169 4960 green_carpet if block -93 169 4988 black_carpet if block -93 169 4974 lime_carpet if block -93 169 4960 light_blue_carpet run kill @e[tag=FinaleCarpetZombie]

# TO WIN
#execute if entity @e[scores={RedIsland=1}] if entity @e[tag=YellowPistonZombie,tag=InYellow] run say YES

# COMPLETE THIS COMMAND!!!!
execute if entity @e[scores={RedIsland=1}] if entity @e[tag=YellowPistonZombie,tag=InYellow] if entity @e[tag=OrangePistonZombie,tag=InOrange] if entity @e[tag=PurplePistonZombie,tag=InPurple] if entity @e[tag=BrownPistonZombie,tag=InBrown] if entity @e[tag=WhitePistonZombie,tag=InWhite] if entity @e[tag=GreenPistonZombie,tag=InGreen] if entity @e[tag=BlackPistonZombie,tag=InBlack] if entity @e[tag=LimePistonZombie,tag=InLime] if entity @e[tag=BluePistonZombie,tag=InBlue] run scoreboard players set @e[scores={RedIsland=1}] RedIsland 900

#execute if entity @e[scores={RedIsland=1}] if entity @e[tag=YellowPistonZombie,tag=InYellow] if entity @e[tag=OrangePistonZombie,tag=InOrange] if entity @e[tag=PurplePistonZombie,tag=InPurple] if entity @e[tag=BrownPistonZombie,tag=InBrown] if entity @e[tag=WhitePistonZombie,tag=InWhite] if entity @e[tag=GreenPistonZombie,tag=InGreen] if entity @e[tag=BlackPistonZombie,tag=InBlack] if entity @e[tag=LimePistonZombie,tag=InLime] if entity @e[tag=BluePistonZombie,tag=InBlue] run say GOOD


# FILL HOLES AFTER BEATING PUZZLE
execute if entity @e[scores={RedIsland=1020..}] unless block -121 164 4988 redstone_block run setblock -121 164 4988 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -121 164 4974 redstone_block run setblock -121 164 4974 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -121 164 4960 redstone_block run setblock -121 164 4960 redstone_block

execute if entity @e[scores={RedIsland=1020..}] unless block -107 164 4988 redstone_block run setblock -107 164 4988 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -107 164 4974 redstone_block run setblock -107 164 4974 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -107 164 4960 redstone_block run setblock -107 164 4960 redstone_block

execute if entity @e[scores={RedIsland=1020..}] unless block -93 164 4988 redstone_block run setblock -93 164 4988 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -93 164 4974 redstone_block run setblock -93 164 4974 redstone_block
execute if entity @e[scores={RedIsland=1020..}] unless block -93 164 4960 redstone_block run setblock -93 164 4960 redstone_block

execute if entity @e[scores={RedIsland=1030}] run kill @e[tag=FinalePistonZombie]


# SET UP FOR WOOL DROP
scoreboard players add @e[scores={RedIsland=900..}] RedIsland 1
scoreboard players set @e[scores={RedIsland=905}] RedIsland 970

# WOOL DROPS
execute if entity @e[scores={RedIsland=1002}] run setblock 2 6 110 red_wool

execute if entity @e[scores={RedIsland=1002}] run playsound entity.evoker.cast_spell master @a -82 171 4971 2 1 1
execute if entity @e[scores={RedIsland=1002}] run playsound entity.ender_eye.death master @a -82 171 4971 2 0.5 1
execute if entity @e[scores={RedIsland=1002}] run playsound entity.player.levelup master @a -82 171 4971 3 1 1

execute if entity @e[scores={RedIsland=1002}] run kill @e[tag=RandomRedWoolAEC]
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}

execute if entity @e[scores={RedIsland=1002}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1007}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1012}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1017}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1022}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1027}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1032}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1037}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1042}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1042..}] run kill @e[tag=RandomRedFinaleAEC]

execute if entity @e[scores={RedIsland=1002..}] at @e[tag=ChosenRedWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:red_wool"},Tags:["FinaleWoolFB","RedWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenRedWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={RedIsland=1002..}] if block -83 171 4970 red_wool if block -82 171 4970 red_wool if block -81 171 4970 red_wool if block -83 171 4971 red_wool if block -82 171 4971 red_wool if block -81 171 4971 red_wool if block -83 171 4972 red_wool if block -82 171 4972 red_wool if block -81 171 4972 red_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={RedIsland=1002..}] if block -83 171 4970 red_wool if block -82 171 4970 red_wool if block -81 171 4970 red_wool if block -83 171 4971 red_wool if block -82 171 4971 red_wool if block -81 171 4971 red_wool if block -83 171 4972 red_wool if block -82 171 4972 red_wool if block -81 171 4972 red_wool run scoreboard objectives remove RedIsland

