####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2017 / AUGUST 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

difficulty easy

#scoreboard objectives setdisplay sidebar PathfinderRound
#scoreboard objectives setdisplay sidebar PathfinderButton
#scoreboard objectives setdisplay sidebar VillagerExists
#scoreboard objectives setdisplay sidebar PathLoser
#scoreboard objectives setdisplay sidebar PathfinderWin

team add PathVillagers
team modify PathVillagers collisionRule never
team add PathZombies
team modify PathZombies collisionRule never

scoreboard objectives add PathfinderRound dummy
scoreboard players add @e[tag=MainPuzzleAEC] PathfinderRound 0
scoreboard players set @e[scores={PathfinderRound=0}] PathfinderRound 1


# 1.13 BARRIER BUG FIX
#tag @a remove NightVision
#execute align x align y align z run tag @a[x=1008,y=64,z=-12,dx=12,dy=10,dz=12] add NightVision
#effect clear @a[tag=!NightVision] night_vision
#effect give @a[tag=NightVision] night_vision 11 255 true


# MAIN BUTTON RESET / SETUP
scoreboard objectives add PathfinderButton dummy
execute if block 1014 65 -11 stone_button[powered=false] run scoreboard players set @e[tag=MainPuzzleAEC] PathfinderButton 0
execute if block 1014 65 -11 stone_button[powered=true] if block 1014 65 -13 command_block run scoreboard players add @e[tag=MainPuzzleAEC] PathfinderButton 1
execute if entity @e[scores={PathfinderButton=1}] run fill 1010 57 -10 1018 57 -2 black_stained_glass replace diamond_block
execute if entity @e[scores={PathfinderButton=1}] run clear @a emerald
execute if entity @e[scores={PathfinderButton=1}] run kill @e[nbt={Item:{id:"minecraft:emerald"}}]
execute if entity @e[scores={PathfinderButton=1}] run replaceitem entity @p[x=1014,y=65,z=-11] weapon.mainhand emerald
execute if entity @e[scores={PathfinderButton=1}] run teleport @e[tag=TPVillager] 1014 1 -6
execute if entity @e[scores={PathfinderButton=1}] run kill @e[tag=PathMob]
execute if entity @e[scores={PathfinderButton=1}] run summon area_effect_cloud 1014 55 -6 {Tags:["PathVillager","PathMob","PathAEC"],Duration:10}
execute if entity @e[scores={PathfinderButton=1..}] run tag @a[nbt={SelectedItem:{id:"minecraft:emerald"}}] add Pathfinder
execute if entity @e[scores={PathfinderButton=1}] at @a[tag=Pathfinder] run summon villager ~ 58 ~ {Team:"PathVillagers",Tags:["PathMob","PathVillager","PathWalker"],NoAI:true,Profession:5}
execute if entity @e[scores={PathfinderButton=2}] run kill @e[tag=TPVillager]

# LOSE IF REMOVE EMERALD
execute if entity @e[scores={PathfinderButton=0}] if entity @a[tag=Pathfinder,nbt=!{SelectedItem:{id:"minecraft:emerald"}}] as @e[tag=PathWalker] at @s run teleport @s ~ ~-0.5 ~
execute if entity @e[scores={PathfinderButton=0}] run tag @a[nbt=!{SelectedItem:{id:"minecraft:emerald"}}] remove Pathfinder
tag @a[nbt={SelectedItem:{id:"minecraft:emerald"}}] add Pathfinder


# ARMOR STANDS ROUNDS
execute if entity @e[scores={PathfinderButton=1,PathfinderRound=1..5}] run summon armor_stand 1020 64 -10 {Invulnerable:true,NoGravity:true,ShowArms:true,NoBasePlate:true,Rotation:[90.0f,0.0f],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:["PathArmorStand","PathMob"],ArmorItems:[{id:"minecraft:diamond_boots",Count:1b}],DisabledSlots:2039583}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=2..5}] run summon armor_stand 1020 64 -8 {Invulnerable:true,NoGravity:true,ShowArms:true,NoBasePlate:true,Rotation:[90.0f,0.0f],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:["PathArmorStand","PathMob"],ArmorItems:[{},{},{},{id:"minecraft:diamond_helmet",Count:1b}],DisabledSlots:2039583}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=3..5}] run summon armor_stand 1020 64 -6 {Invulnerable:true,NoGravity:true,ShowArms:true,NoBasePlate:true,Rotation:[90.0f,0.0f],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:["PathArmorStand","PathMob"],ArmorItems:[{},{id:"minecraft:diamond_leggings",Count:1b}],DisabledSlots:2039583}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=4..5}] run summon armor_stand 1020 64 -4 {Invulnerable:true,NoGravity:true,ShowArms:true,NoBasePlate:true,Rotation:[90.0f,0.0f],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:["PathArmorStand","PathMob"],ArmorItems:[{},{},{id:"minecraft:diamond_chestplate",Count:1b}],DisabledSlots:2039583}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=5}] run summon armor_stand 1020 63.4 -2 {Invulnerable:true,Invisible:true,NoGravity:true,ShowArms:true,NoBasePlate:true,Rotation:[90.0f,0.0f],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:["PathArmorStand","PathMob"],ArmorItems:[{},{},{},{id:"minecraft:diamond_block",Count:1b}],DisabledSlots:2039583}


# ZOMBIE ROUNDS
execute if entity @e[scores={PathfinderButton=1,PathfinderRound=1}] run summon zombie_villager 1018 58 -2 {Team:"PathZombies",VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:2},Rotation:[155f,0f],Tags:["PathMob","PathZombie"],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Attributes:[{Name:"generic.movementSpeed",Base:0.11},{Name:"generic.attackDamage",Base:2048.0}]}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=2}] run summon zombie_villager 1014 58 -2 {Team:"PathZombies",VillagerData:{profession:"minecraft:none",type:"minecraft:jungle",level:2},Rotation:[180f,0f],Tags:["PathMob","PathZombie"],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Attributes:[{Name:"generic.movementSpeed",Base:0.11},{Name:"generic.attackDamage",Base:2048.0}]}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=3}] run summon zombie_villager 1010 58 -2 {Team:"PathZombies",VillagerData:{profession:"minecraft:armorer",type:"minecraft:desert",level:2},Rotation:[215f,0f],Tags:["PathMob","PathZombie"],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Attributes:[{Name:"generic.movementSpeed",Base:0.11},{Name:"generic.attackDamage",Base:2048.0}]}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=4}] run summon zombie_villager 1014 58 -2 {Team:"PathZombies",VillagerData:{profession:"minecraft:nitwit",type:"minecraft:savanna",level:2},Rotation:[180f,0f],Tags:["PathMob","PathZombie"],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Attributes:[{Name:"generic.movementSpeed",Base:0.11},{Name:"generic.attackDamage",Base:2048.0}]}

execute if entity @e[scores={PathfinderButton=1,PathfinderRound=5}] run summon zombie_villager 1014 58 -6 {Team:"PathZombies",VillagerData:{profession:"minecraft:butcher",type:"minecraft:swamp",level:2},Rotation:[180f,0f],Tags:["PathMob","PathZombie"],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Attributes:[{Name:"generic.movementSpeed",Base:0.11},{Name:"generic.attackDamage",Base:2048.0}]}


# TELEPORT COMMAND AND WIN RESET
execute as @a[tag=Pathfinder] at @s run teleport @e[tag=PathWalker] ~ 58 ~ ~ 0
execute if block 1010 57 -6 black_stained_glass run scoreboard objectives remove PathfinderWin


# CHANGE BLOCKS
execute at @e[tag=PathWalker] if block ~ ~-1 ~ black_stained_glass at @e[tag=PathWalker] run playsound entity.puffer_fish.blow_up master @a ~ ~ ~ 1 1 0.5
execute at @e[tag=PathWalker] if block ~ ~-1 ~ black_stained_glass run fill ~ ~-1 ~ ~ ~-1 ~ diamond_block replace black_stained_glass
execute at @e[tag=PathZombie] if block ~ ~-1 ~ diamond_block at @e[tag=PathZombie] run playsound entity.puffer_fish.blow_out master @a ~ ~ ~ 1 1 1
execute at @e[tag=PathZombie] if block ~ ~-1 ~ diamond_block run fill ~ ~-1 ~ ~ ~-1 ~ black_stained_glass replace diamond_block

# 1.14 ZOMBIE CUTTING CORNERS FIX
execute at @e[tag=PathZombie] if block ~ ~ ~ structure_void if block ~-1 ~-1 ~-1 diamond_block run playsound entity.puffer_fish.blow_out master @a ~ ~ ~ 1 1 1
execute at @e[tag=PathZombie] if block ~ ~ ~ structure_void if block ~1 ~-1 ~1 diamond_block run playsound entity.puffer_fish.blow_out master @a ~ ~ ~ 1 1 1
execute at @e[tag=PathZombie] if block ~ ~ ~ structure_void if block ~1 ~-1 ~-1 diamond_block run playsound entity.puffer_fish.blow_out master @a ~ ~ ~ 1 1 1
execute at @e[tag=PathZombie] if block ~ ~ ~ structure_void if block ~-1 ~-1 ~1 diamond_block run playsound entity.puffer_fish.blow_out master @a ~ ~ ~ 1 1 1

execute at @e[tag=PathZombie] if block ~ ~ ~ structure_void run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 black_stained_glass replace diamond_block





# CHECK IF VILLAGER EXISTS
scoreboard objectives add VillagerExists dummy
scoreboard players set @e[tag=MainPuzzleAEC] VillagerExists 0
execute if entity @e[tag=PathVillager] run scoreboard players set @e[scores={VillagerExists=0}] VillagerExists 1


# CHECK IF VILLAGER FALLS
execute at @e[tag=PathWalker] if block ~ ~-1 ~ air run teleport @e[tag=PathWalker] ~ ~-0.5 ~
execute at @e[tag=PathWalker] if block ~ ~-1 ~ air run data merge entity @e[tag=PathWalker,limit=1] {NoAI:false}
execute at @e[tag=PathWalker] if block ~ ~-1 ~ air run tag @e[tag=PathWalker] remove PathWalker
execute as @e[tag=PathVillager] at @s if block ~ ~-1 ~ air run data merge entity @s {NoAI:false}
execute at @e[tag=PathVillager] if block ~ ~-2 ~ terracotta align x align y align z run playsound entity.villager.death master @a[x=1008,y=64,z=-12,dx=12,dy=10,dz=12] ~ 58 ~ 1 1 0
execute at @e[tag=PathVillager] if block ~ ~-2 ~ terracotta run kill @e[tag=PathVillager]
execute at @e[tag=PathZombie] if block ~ ~-2 ~ terracotta run kill @e[tag=PathZombie]


# WEIRD BUG WHERE VILLAGER BECOME ACTIVE BEFORE WINNING??
execute unless entity @e[scores={PathfinderWin=0..}] as @e[type=villager,tag=PathVillager,tag=!PathWalker] align x align y align z at @s run teleport @s[x=1010,y=58,z=-10,dx=8,dy=0,dz=8] ~ ~-0.5 ~



#execute as @e[type=zombie_villager] run data merge entity @s {NoAI:true}

# SO VILLAGER DOESN'T SAY OUCH THROUGH DIAMOND
execute align x align y align z run data merge entity @e[tag=PathMob,x=1009,y=55,z=-11,dx=10,dy=2,dz=10,limit=1] {Invulnerable:true}


# BLOCK DIAGRAGM
#TOP - 1018 57 -2    |   1014 57 -2    |   1010 57 -2
#MID - 1018 57 -6    |   1014 57 -6    |   1010 57 -6
#BOT - 1018 57 -10   |   1014 57 -10   |   1010 57 -10

#execute if block 1018 57 -2 black_stained_glass run
#execute if block 1014 57 -2 black_stained_glass run
#execute if block 1010 57 -2 black_stained_glass run
#execute if block 1018 57 -6 black_stained_glass run
#execute if block 1014 57 -6 black_stained_glass run
#execute if block 1010 57 -6 black_stained_glass run
#execute if block 1018 57 -10 black_stained_glass run
#execute if block 1014 57 -10 black_stained_glass run
#execute if block 1010 57 -10 black_stained_glass run


# 1 -> TESTS FOR BOOTS
execute if entity @e[scores={PathfinderRound=1}] if block 1018 57 -2 black_stained_glass if block 1014 57 -2 black_stained_glass if block 1010 57 -2 black_stained_glass if block 1018 57 -6 diamond_block if block 1014 57 -6 black_stained_glass if block 1010 57 -6 diamond_block if block 1018 57 -10 diamond_block if block 1014 57 -10 black_stained_glass if block 1010 57 -10 diamond_block run scoreboard objectives add PathfinderWin dummy

# 1 -> TESTS FOR BOOTS
execute if entity @e[scores={PathfinderRound=1}] if block 1018 57 -2 diamond_block if block 1014 57 -2 black_stained_glass if block 1010 57 -2 diamond_block if block 1018 57 -6 diamond_block if block 1014 57 -6 black_stained_glass if block 1010 57 -6 diamond_block if block 1018 57 -10 black_stained_glass if block 1014 57 -10 black_stained_glass if block 1010 57 -10 black_stained_glass run scoreboard objectives add PathfinderWin dummy


# 2 -> TESTS FOR HELMET
execute if entity @e[scores={PathfinderRound=2}] if block 1018 57 -2 black_stained_glass if block 1014 57 -2 black_stained_glass if block 1010 57 -2 black_stained_glass if block 1018 57 -6 diamond_block if block 1014 57 -6 diamond_block if block 1010 57 -6 diamond_block if block 1018 57 -10 diamond_block if block 1014 57 -10 black_stained_glass if block 1010 57 -10 diamond_block run scoreboard objectives add PathfinderWin dummy

# 2 -> TESTS FOR HELMET
execute if entity @e[scores={PathfinderRound=2}] if block 1018 57 -2 diamond_block if block 1014 57 -2 diamond_block if block 1010 57 -2 diamond_block if block 1018 57 -6 diamond_block if block 1014 57 -6 black_stained_glass if block 1010 57 -6 diamond_block if block 1018 57 -10 black_stained_glass if block 1014 57 -10 black_stained_glass if block 1010 57 -10 black_stained_glass run scoreboard objectives add PathfinderWin dummy

# 3 -> TESTS FOR LEGGINGS
execute if entity @e[scores={PathfinderRound=3}] if block 1018 57 -2 diamond_block if block 1014 57 -2 diamond_block if block 1010 57 -2 diamond_block if block 1018 57 -6 diamond_block if block 1014 57 -6 black_stained_glass if block 1010 57 -6 diamond_block if block 1018 57 -10 diamond_block if block 1014 57 -10 black_stained_glass if block 1010 57 -10 diamond_block run scoreboard objectives add PathfinderWin dummy

# 4 -> TESTS FOR CHESTPLATE
execute if entity @e[scores={PathfinderRound=4}] if block 1018 57 -2 diamond_block if block 1014 57 -2 black_stained_glass if block 1010 57 -2 diamond_block if block 1018 57 -6 diamond_block if block 1014 57 -6 diamond_block if block 1010 57 -6 diamond_block if block 1018 57 -10 diamond_block if block 1014 57 -10 diamond_block if block 1010 57 -10 diamond_block run scoreboard objectives add PathfinderWin dummy

# 5 -> TESTS FOR BLOCK
execute if entity @e[scores={PathfinderRound=5}] if block 1018 57 -2 diamond_block if block 1014 57 -2 diamond_block if block 1010 57 -2 diamond_block if block 1018 57 -6 diamond_block if block 1014 57 -6 diamond_block if block 1010 57 -6 diamond_block if block 1018 57 -10 diamond_block if block 1014 57 -10 diamond_block if block 1010 57 -10 diamond_block run scoreboard objectives add PathfinderWin dummy


# COMPLETE A ROUND
scoreboard players add @e[tag=MainPuzzleAEC] PathfinderWin 1
execute if entity @e[scores={PathfinderWin=1}] run setblock 1014 65 -13 clay
execute if entity @e[scores={PathfinderWin=1}] run summon area_effect_cloud 1014 55 -6 {Tags:["PathVillager","PathMob","PathAEC"],Duration:2147483647}
execute if entity @e[scores={PathfinderWin=1}] run data merge entity @e[tag=PathWalker,limit=1] {NoAI:true}
execute if entity @e[scores={PathfinderWin=1}] run tag @e[tag=PathWalker] remove PathMob
execute if entity @e[scores={PathfinderWin=1}] run tag @e[tag=PathWalker] remove PathVillager
execute if entity @e[scores={PathfinderWin=1}] run tag @e[tag=PathWalker] add TPVillager
execute if entity @e[scores={PathfinderWin=1}] run tag @e[tag=PathWalker] remove PathWalker
execute if entity @e[scores={PathfinderWin=6}] at @e[tag=PathZombie] run playsound entity.zombie_villager.converted master @a
execute if entity @e[scores={PathfinderWin=6}] run data merge entity @e[tag=PathZombie,limit=1] {NoAI:true}
execute if entity @e[scores={PathfinderWin=6}] run data merge entity @e[tag=TPVillager,limit=1] {NoAI:false}
execute if entity @e[scores={PathfinderWin=6,PathfinderRound=1}] at @e[tag=PathZombie] run summon villager ~ 30 ~ {Tags:["TPVillager","NewVillager"],VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:2},NoAI:true}
execute if entity @e[scores={PathfinderWin=6,PathfinderRound=2}] at @e[tag=PathZombie] run summon villager ~ 30 ~ {Tags:["TPVillager","NewVillager"],VillagerData:{profession:"minecraft:none",type:"minecraft:jungle",level:2},NoAI:true}
execute if entity @e[scores={PathfinderWin=6,PathfinderRound=3}] at @e[tag=PathZombie] run summon villager ~ 30 ~ {Tags:["TPVillager","NewVillager"],VillagerData:{profession:"minecraft:armorer",type:"minecraft:desert",level:2},NoAI:true}
execute if entity @e[scores={PathfinderWin=6,PathfinderRound=4}] at @e[tag=PathZombie] run summon villager ~ 30 ~ {Tags:["TPVillager","NewVillager"],VillagerData:{profession:"minecraft:nitwit",type:"minecraft:savanna",level:2},NoAI:true}
execute if entity @e[scores={PathfinderWin=6,PathfinderRound=5}] at @e[tag=PathZombie] run summon villager ~ 30 ~ {Tags:["TPVillager","NewVillager"],VillagerData:{profession:"minecraft:butcher",type:"minecraft:swamp",level:2},NoAI:true}
execute if entity @e[scores={PathfinderWin=7}] run effect give @e[tag=NewVillager] invisibility 1000000 255 true
execute if entity @e[scores={PathfinderWin=8..25}] as @e[tag=PathZombie] at @s run teleport @e[tag=NewVillager] ~ ~ ~ ~ ~
execute if entity @e[scores={PathfinderWin=25}] run effect give @e[tag=PathZombie] invisibility 1000000 255 true
execute if entity @e[scores={PathfinderWin=25}] run effect clear @e[tag=NewVillager] invisibility
execute if entity @e[scores={PathfinderWin=26}] run teleport @e[tag=PathZombie] 1014 2 -6
execute if entity @e[scores={PathfinderWin=28}] run kill @e[tag=PathZombie]
execute if entity @e[scores={PathfinderWin=36}] at @e[tag=NewVillager] run playsound entity.villager.yes master @a ~ 64 ~ 1 1 0
execute if entity @e[scores={PathfinderWin=36}] run data merge entity @e[tag=NewVillager,limit=1] {NoAI:false}

execute if entity @e[scores={PathfinderWin=50}] run playsound block.note_block.pling master @a 1020 65 -6 0.7 0.8 0
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=1}] run setblock 1021 66 -10 redstone_block
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=2}] run setblock 1021 66 -8 redstone_block
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=3}] run setblock 1021 66 -6 redstone_block
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=4}] run setblock 1021 66 -4 redstone_block
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=5}] run setblock 1021 66 -2 redstone_block
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=1..4}] run setblock 1014 65 -13 command_block[facing=west]{auto:0b,TrackOutput:false}
execute if entity @e[scores={PathfinderWin=50,PathfinderRound=5}] run setblock 1014 65 -13 command_block[facing=up]{auto:0b,TrackOutput:false}
#execute if entity @e[scores={PathfinderWin=50,PathfinderRound=1..4}] run scoreboard players add @e[tag=MainPuzzleAEC] PathfinderRound 1
scoreboard players set @e[scores={PathfinderWin=50,PathfinderRound=5}] PathfinderRound 6
scoreboard players set @e[scores={PathfinderWin=50,PathfinderRound=4}] PathfinderRound 5
scoreboard players set @e[scores={PathfinderWin=50,PathfinderRound=3}] PathfinderRound 4
scoreboard players set @e[scores={PathfinderWin=50,PathfinderRound=2}] PathfinderRound 3
scoreboard players set @e[scores={PathfinderWin=50,PathfinderRound=1}] PathfinderRound 2

# LOSE IF VILLAGER DOES NOT EXIST
execute if entity @e[scores={VillagerExists=0}] run scoreboard objectives add PathLoser dummy
scoreboard players add @e[scores={VillagerExists=0}] PathLoser 1
execute if entity @e[scores={PathLoser=1}] run setblock 1014 65 -13 clay
execute if entity @e[scores={PathLoser=30}] run playsound block.ender_chest.open master @a 1020 64 -6 1 0.8 1
execute if entity @e[scores={PathLoser=30}] run fill 1010 57 -10 1018 57 -2 black_stained_glass replace diamond_block
execute if entity @e[scores={PathLoser=30}] run fill 1021 66 -10 1021 66 -2 clay replace redstone_block
execute if entity @e[scores={PathLoser=30}] run clear @a emerald
execute if entity @e[scores={PathLoser=30}] run scoreboard objectives remove PathfinderRound
execute if entity @e[scores={PathLoser=30}] run scoreboard objectives remove PathfinderButton
execute if entity @e[scores={PathLoser=30}] run scoreboard objectives remove VillagerExists
execute if entity @e[scores={PathLoser=30}] run setblock 1014 65 -13 command_block[facing=west]{auto:0b,TrackOutput:false}
execute if entity @e[scores={PathLoser=30}] run effect clear @a night_vision
execute if entity @e[scores={PathLoser=30}] run kill @e[tag=PathArmorStand]
execute if entity @e[scores={PathLoser=30}] run setblock 35 2 14 clay
execute if entity @e[scores={PathLoser=30}] run team remove PathVillagers
execute if entity @e[scores={PathLoser=30}] run team remove PathZombies
execute if entity @e[scores={PathLoser=30}] run tag @a remove Pathfinder
execute if entity @e[scores={PathLoser=30}] run scoreboard objectives remove PathLoser


# DOORS OPEN
execute if entity @e[scores={PathfinderWin=102,PathfinderRound=6}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={PathfinderWin=105,PathfinderRound=6}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run fill 1007 64 -8 1016 65 1 clay replace redstone_block


# SWITCH TO END KEY
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run setblock 1014 65 -13
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run setblock 1014 65 -13 command_block[facing=up]{auto:0b,TrackOutput:false}


# END
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run clear @a emerald
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run setblock 35 2 14 clay
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run tag @a remove Pathfinder
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run tag @a remove NightVision
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run scoreboard objectives remove VillagerExists
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run scoreboard objectives remove VillagerButton
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run scoreboard objectives remove PathfinderButton
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run scoreboard objectives remove PathLoser
execute if entity @e[scores={PathfinderWin=120,PathfinderRound=6}] run scoreboard players set @e[tag=MainPuzzleAEC] PathfinderRound 100
execute if entity @e[scores={PathfinderRound=100}] run scoreboard objectives remove PathfinderWin
execute if entity @e[scores={PathfinderRound=100}] run effect clear @a night_vision
execute if entity @e[scores={PathfinderRound=100}] as @e[tag=TPVillager] run data merge entity @s {Silent:true}
execute if entity @e[scores={PathfinderRound=100}] run team remove PathVillagers
execute if entity @e[scores={PathfinderRound=100}] run team remove PathZombies
execute if entity @e[scores={PathfinderRound=100}] run tag @a remove Pathfinder
execute if entity @e[scores={PathfinderRound=100}] run scoreboard objectives remove PathfinderRound



#[tag=MainPuzzleAEC]
