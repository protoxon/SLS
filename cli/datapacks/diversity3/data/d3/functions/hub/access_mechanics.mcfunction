####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 29 2018 / OCTOBER 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar PhantomAge

# FIX FOR GETTING LOCKED UNDER SHULKER MONUMENT
execute align x align y align z as @a[x=-3,y=86,z=1033,dx=23,dy=4,dz=10] at @s unless entity @s[x=3,y=90,z=1033,dx=3,dy=1,dz=4] unless entity @s[x=17,y=90,z=1033,dx=3,dy=1,dz=4] unless entity @s[x=0,y=90,z=1041,dx=2,dy=1,dz=2] run teleport @s[gamemode=adventure] ~ 91.2 ~


# REMOVE WHITE WOOL SEGMENT
fill 8 87 998 8 87 998 air replace end_rod
fill 8 86 998 8 86 998 chiseled_stone_bricks replace observer
execute if block 8 87 998 air run scoreboard objectives remove WhiteFailSafe


# BLOCKS TOP CHEST WHEN PIECE GETS SUMMONED
execute if entity @e[tag=MonumentPiece] if block 8 92 1032 air run setblock 8 92 1032 barrier
execute if entity @e[tag=MonumentPiece] if block 8 94 1032 air run setblock 8 94 1032 barrier

execute unless entity @e[tag=MonumentPiece] if block 8 92 1032 barrier run setblock 8 92 1032 air
execute unless entity @e[tag=MonumentPiece] if block 8 94 1032 barrier run setblock 8 94 1032 air


# ROTATE PLAYER ON MONUMENT WOOL -> GLICTHED IN MULTIPLAYER?
#execute as @a at @s if entity @e[tag=MonumentShulker,dx=0,dy=-0.1,dz=0] if block ~ ~-1 ~ iron_bars run teleport @s ~ ~ ~ ~1 ~



# FIX TO PREVENT ON TOP OF BOSS BRIDGE
execute align x align y align z as @a[x=43,y=90,z=1040,dx=4,dy=0,dz=0] at @s run teleport @s ~ ~ ~-1


# ORANGE ACCESS
execute unless block 11 6 14 orange_wool run function d3:hub/access_orange/orange_block_update
execute if entity @a[x=-26,y=0,z=1036,dx=20,dy=88,dz=45] run function d3:hub/access_orange/orange_mechanics


# YELLOW ACCESS
execute unless block 10 6 14 yellow_wool run function d3:hub/access_yellow/yellow_block_update
function d3:hub/access_yellow/yellow_mechanics


# LIME ACCESS
execute unless block 9 6 14 lime_wool run function d3:hub/access_lime/lime_block_update
execute if entity @a[x=-24,y=87,z=985,distance=..10] run function d3:hub/access_lime/lime_piston
execute unless entity @a[x=-24,y=87,z=985,distance=..10] if entity @e[tag=TriviaBoneFrame] run kill @e[tag=TriviaBoneFrame]
execute unless entity @a[x=-24,y=87,z=985,distance=..10] unless block -24 84 986 stone run setblock -24 84 986 stone
execute unless block -24 87 986 bone_block if entity @e[tag=TriviaBoneFrame] run kill @e[tag=TriviaBoneFrame]

execute if entity @e[tag=TriviaBoneFrame,nbt={Item:{Count:1b}}] run scoreboard objectives add TriviaAccess dummy
execute if block -24 86 986 hopper{Items:[{Count:1b}]} run scoreboard objectives add TriviaAccess dummy
scoreboard players set @e[tag=MainHubAEC] TriviaAccess 0
execute if entity @e[scores={TriviaAccess=0..}] run function d3:hub/access_lime/lime_mechanics

# FIX FOR BROKEN PHANTOM
execute as @e[tag=Phantom] run data merge entity @s {Fire:0s}
execute if entity @e[tag=Phantom,type=phantom] run scoreboard objectives add PhantomAge dummy
execute unless entity @e[tag=Phantom,type=phantom] run scoreboard objectives remove PhantomAge
execute if entity @e[tag=Phantom,type=phantom] run scoreboard players add @e[tag=Phantom] PhantomAge 1
execute if entity @e[tag=Phantom,type=phantom,scores={PhantomAge=650..}] run kill @e[tag=PhantomBoat]
execute if entity @e[tag=Phantom,type=phantom,scores={PhantomAge=650..}] run kill @e[tag=Phantom]


# PINK ACCESS
execute unless block 8 6 14 pink_wool run function d3:hub/access_pink/pink_block_update
execute if block -1 86 969 lever[powered=true] run function d3:hub/access_pink/pink_mechanics
execute if block -1 86 969 lever[powered=false] run function d3:hub/access_pink/pink_mechanics_reset


# CYAN ACCESS
execute unless block 7 6 14 cyan_wool run function d3:hub/access_cyan/cyan_block_update
execute if block 16 82 964 oak_button[powered=true] run scoreboard objectives add EscapeAccess dummy
scoreboard players add @e[tag=MainHubAEC] EscapeAccess 1
execute if entity @e[scores={EscapeAccess=0..}] run function d3:hub/access_cyan/cyan_mechanics
execute if entity @e[tag=HubCart,type=armor_stand] align xyz as @e[tag=HubCart,type=armor_stand,x=13,y=67,z=902,dx=2,dy=0,dz=4,nbt={OnGround:1b}] run kill @s
effect give @a[nbt={RootVehicle:{Entity:{id:"minecraft:armor_stand",Tags:["HubCart"]}}}] resistance 1 255 true


# PURPLE ACCESS
execute unless block 6 6 14 purple_wool run function d3:hub/access_purple/purple_block_update
function d3:hub/access_purple/purple_mechanics
execute if entity @a[nbt={Inventory:[{id:"minecraft:elytra"}]}] align x align y align z as @a at @s run clear @s[nbt={Inventory:[{id:"minecraft:elytra"}]},x=-87,y=71,z=813,dx=220,dy=20,dz=300] elytra


# BLUE ACCESS
execute unless block 5 6 14 blue_wool run function d3:hub/access_blue/blue_block_update
execute if block 54 86 962 blue_stained_glass_pane align x align y align z run effect give @a[x=54,y=86,z=962,dx=0,dy=85,dz=0] levitation 1 10


# BROWN ACCESS
execute unless block 4 6 14 brown_wool run function d3:hub/access_brown/brown_block_update
function d3:hub/access_brown/brown_mechanics


# RED ACCESS
execute unless block 3 6 14 red_wool run function d3:hub/access_red/red_block_update
execute if block 78 82 1023 air if block 79 82 1023 air run function d3:hub/access_red/red_mechanics
execute if block 78 82 1023 stone if block 79 82 1023 grass_block run scoreboard objectives remove PuzzleBridge


# BLACK ACCESS
execute unless block 2 6 14 black_wool run function d3:hub/access_black/black_block_update

# BOSS BRIDGE ??
execute if block 11 6 14 orange_wool if block 45 86 1040 orange_concrete run fill 45 86 1040 45 87 1040 air destroy
execute if block 10 6 14 yellow_wool if block 45 86 1044 yellow_concrete run fill 45 86 1044 45 87 1044 air destroy
execute if block 9 6 14 lime_wool if block 45 86 1048 lime_concrete run fill 45 86 1048 45 87 1048 air destroy
execute if block 8 6 14 pink_wool if block 45 86 1052 pink_concrete run fill 45 86 1052 45 87 1052 air destroy
execute if block 7 6 14 cyan_wool if block 45 86 1056 cyan_concrete run fill 45 86 1056 45 87 1056 air destroy
execute if block 6 6 14 purple_wool if block 45 86 1060 purple_concrete run fill 45 86 1060 45 87 1060 air destroy
execute if block 5 6 14 blue_wool if block 45 86 1064 blue_concrete run fill 45 86 1064 45 87 1064 air destroy
execute if block 4 6 14 brown_wool if block 45 86 1068 brown_concrete run fill 45 86 1068 45 87 1068 air destroy
execute if block 3 6 14 red_wool if block 45 86 1072 red_concrete run fill 45 86 1072 45 87 1072 air destroy

# BOSS SPEEDRUN PREVENTION SURPRISE HEEHEE!
execute align xyz if entity @a[x=28,y=84,z=1073,dx=44,dy=10,dz=35] unless blocks 45 86 1040 45 86 1072 45 254 1040 all unless entity @e[tag=BossGuard] run summon ravager 47 90 1090 {CustomName:"{\"text\":\"Charcoal\",\"color\":\"dark_gray\"}",Invulnerable:1b,Attributes:[{Name:"generic.attackDamage",Base:25.0d},{Name:"generic.attackKnockback",Base:17.0d}],Rotation:[180f,0f],Tags:["BossGuard"]}
execute align xyz if entity @a[x=28,y=84,z=1073,dx=44,dy=10,dz=35,gamemode=adventure] unless blocks 45 86 1040 45 86 1072 45 254 1040 all run scoreboard objectives add BossCheater dummy
scoreboard players add @a[x=28,y=84,z=1073,dx=44,dy=10,dz=35,gamemode=adventure] BossCheater 1
#scoreboard objectives setdisplay sidebar BossCheater
tellraw @a[scores={BossCheater=1}] ["",{"text":"<Charcoal> ","color":"dark_gray","bold":false},{"text":"Oh! Hello there. Thought you'd try to get to the Boss Battle early, did you?","color":"none"}]
scoreboard players set @a[scores={BossCheater=1}] BossCheater 2
execute align xyz unless entity @a[x=28,y=84,z=1073,dx=44,dy=10,dz=35,gamemode=adventure] run scoreboard objectives remove BossCheater
execute if blocks 45 86 1040 45 86 1072 45 254 1040 all run scoreboard objectives remove BossCheater
execute if entity @e[tag=BossGuard] align xyz if blocks 45 86 1040 45 86 1072 45 254 1040 all run kill @e[tag=BossGuard]
execute if entity @e[tag=BossGuard] align xyz unless entity @a[x=28,y=84,z=1073,dx=44,dy=10,dz=35] run kill @e[tag=BossGuard]

execute unless blocks 45 86 1040 45 86 1072 45 254 1040 all align xyz as @a[x=43,y=89,z=1041,dx=4,dy=1,dz=15] at @s run teleport @s 42 ~ ~




#execute if block 8 87 998 air run scoreboard objectives remove WhiteFailSafe

# MISSING LEAVES
execute unless block -5 144 1040 jungle_leaves run setblock -5 115 1040 jungle_leaves
execute unless block 66 85 1089 jungle_leaves run setblock 66 85 1089 jungle_leaves


# SUMMON BRANCH SIGNS
function d3:hub/branch_signs
