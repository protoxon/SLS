####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 25 2018 / MARCH 27 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar BossLevel
#scoreboard objectives setdisplay sidebar BossTimer
#scoreboard objectives setdisplay sidebar KillTree
#scoreboard objectives setdisplay sidebar LaunchItem
#scoreboard objectives setdisplay sidebar DropPigGrass
#scoreboard objectives setdisplay sidebar BossPig
#scoreboard objectives setdisplay sidebar DropCowGrass
#scoreboard objectives setdisplay sidebar BossCow
#scoreboard objectives setdisplay sidebar ChickenHeight
#scoreboard objectives setdisplay sidebar MooshroomDeaths
#scoreboard objectives setdisplay sidebar MobSuicide
#scoreboard objectives setdisplay sidebar SwapShears
#scoreboard objectives setdisplay sidebar ConvertShears


effect give @a night_vision 12 255 true
kill @e[type=experience_orb]
function d3:boss/health_system


# BRING STRAGGLERS
execute if block 1 4 2 black_wool run gamemode adventure @a[tag=!InBossBranch,tag=!D3Admin]
execute if block 1 4 2 black_wool run spawnpoint @a[tag=!InBossBranch] -999 64 -998
execute if block 1 4 2 black_wool run teleport @a[tag=!InBossBranch] -999 64 -998 0 0
execute if block 1 4 2 black_wool run clear @a[tag=!InBossBranch]
execute if block 1 4 2 black_wool run tag @a add InBossBranch


# BRANCH EXIT
tag @a remove LeaveBoss
execute if block -999 65 -999 stone_button[powered=true] run tag @a add LeaveBoss
execute if block -999 65 -999 stone_button[powered=true] run setblock -999 65 -999 stone_button[powered=false,face=wall,facing=south]
execute if entity @a[tag=LeaveBoss] run teleport @a -18 4 -31 0 -90


# FIX RESET
execute if entity @e[scores={BossLevel=1,BossTimer=..5}] run function d3:boss/setup_boss


# PLATFORM ADVANCEMENT
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] run advancement grant @a[tag=!FallenOff] only d3:folder_b/grounded

# ORE ADVANCEMENT
advancement grant @a[nbt={Inventory:[{id:"minecraft:coal"},{id:"minecraft:diamond"},{id:"minecraft:emerald"},{id:"minecraft:gold_ore"},{id:"minecraft:iron_ore"},{id:"minecraft:lapis_lazuli"},{id:"minecraft:quartz"},{id:"minecraft:redstone"}]}] only d3:folder_b/collector

# FIRE ADVANCEMENT
execute if block -995 63 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 64 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 65 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 66 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 67 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 68 -981 fire run advancement grant @a only d3:folder_c/fire_starter

execute if block -994 64 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 64 -980 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 64 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 64 -982 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -996 64 -981 fire run advancement grant @a only d3:folder_c/fire_starter

execute if block -994 65 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 65 -980 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 65 -981 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -995 65 -982 fire run advancement grant @a only d3:folder_c/fire_starter
execute if block -996 65 -981 fire run advancement grant @a only d3:folder_c/fire_starter


# MOOSHROOM ADVANCEMENT
execute if entity @e[tag=BossMooshroom] run scoreboard objectives add MooshroomDeaths deathCount
scoreboard players add @a MooshroomDeaths 0
execute if entity @e[scores={BossCow=602}] run advancement grant @a[scores={MooshroomDeaths=0}] only d3:folder_c/cow_tipper
execute if entity @e[scores={BossLevel=150}] run scoreboard objectives remove MooshroomDeaths


# FIX BOOT
execute if entity @e[scores={BossLevel=..1}] if block -1026 55 -948 gray_concrete run fill -1025 55 -947 -1025 56 -947 redstone_block replace air


# MINI BOSSES
scoreboard players add @e[tag=MainBossAEC] BossPig 0
execute if entity @e[scores={BossPig=0..}] run function d3:boss/boss_pig

scoreboard players add @e[tag=MainBossAEC] BossPigAttack 0
execute if entity @e[scores={BossPigAttack=0..}] run function d3:boss/boss_pig_attack

scoreboard players add @e[tag=MainBossAEC] BossCow 0
execute if entity @e[scores={BossCow=0..}] run function d3:boss/boss_cow

scoreboard players add @e[tag=MainBossAEC] BossCowAttack 0
execute if entity @e[scores={BossCowAttack=0..}] run function d3:boss/boss_cow_attack



# RENEW BLOCKS MECHANIC
function d3:boss/renew_stone
function d3:boss/renew_coal
fill -993 65 -992 -993 100 -992 air replace stone
fill -992 66 -991 -992 100 -991 air replace stone
fill -992 65 -990 -992 100 -988 air replace coal_ore
fill -995 63 -988 -992 100 -985 air replace stone

execute if block -995 63 -981 air if block -995 64 -981 air if block -995 65 -981 air if block -995 66 -981 air if block -995 67 -981 air if block -995 68 -981 air run scoreboard objectives add KillTree dummy
execute if block -995 63 -981 oak_sapling if block -995 64 -981 air if block -995 65 -981 air if block -995 66 -981 air if block -995 67 -981 air if block -995 68 -981 air run scoreboard objectives add KillTree dummy
scoreboard players add @e[tag=MainBossAEC] KillTree 0
scoreboard players add @e[scores={KillTree=0..100}] KillTree 1
execute if entity @e[scores={KillTree=0..}] run function d3:boss/renew_tree
execute unless block -995 68 -981 air run scoreboard objectives remove KillTree
execute if entity @e[scores={BossLevel=2..}] if block -1000 63 -981 air run function d3:boss/drop_chest


# REPLACEITEM BLOCK
execute as @e[type=item,nbt={Item:{id:"minecraft:oak_sapling"},Age:10s}] run data merge entity @s {Age:-1000s}
execute if entity @a[nbt={SelectedItem:{id:"minecraft:chest"}},nbt=!{SelectedItem:{id:"minecraft:chest",tag:{CanPlaceOn:["minecraft:oak_planks"]}}}] run function d3:boss/replace_chest
execute if entity @a[nbt={SelectedItem:{id:"minecraft:crafting_table"}},nbt=!{SelectedItem:{id:"minecraft:crafting_table",tag:{CanPlaceOn:["minecraft:cobblestone","minecraft:oak_planks"]}}}] run function d3:boss/replace_crafting_table
execute if entity @a[nbt={SelectedItem:{id:"minecraft:furnace"}},nbt=!{SelectedItem:{id:"minecraft:furnace",tag:{CanPlaceOn:["minecraft:cobblestone","minecraft:oak_planks"]}}}] run function d3:boss/replace_furnace


# REPLACEITEM WOOD TOOL
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:wooden_sword",tag:{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]}}}] weapon.mainhand wooden_sword{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_axe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:wooden_axe",tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]}}}] weapon.mainhand wooden_axe{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]} 1

execute if entity @e[scores={BossLevel=..84}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:wooden_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:stone"]}}}] weapon.mainhand wooden_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:stone"]} 1

execute if entity @e[scores={BossLevel=85..}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:wooden_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:spawner","minecraft:stone"]}}}] weapon.mainhand wooden_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:spawner","minecraft:stone"]} 1



# REPLACEITEM STONE TOOL
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:stone_sword",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:stone_sword",tag:{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]}}}] weapon.mainhand stone_sword{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:stone_axe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:stone_axe",tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]}}}] weapon.mainhand stone_axe{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]} 1

execute if entity @e[scores={BossLevel=..84}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:stone_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:stone_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:stone"]}}}] weapon.mainhand stone_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:stone"]} 1

execute if entity @e[scores={BossLevel=85..}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:stone_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:stone_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:spawner","minecraft:stone"]}}}] weapon.mainhand stone_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:furnace","minecraft:spawner","minecraft:stone"]} 1



# REPLACEITEM IRON TOOL
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:iron_sword",tag:{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]}}}] weapon.mainhand iron_sword{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:iron_axe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:iron_axe",tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]}}}] weapon.mainhand iron_axe{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:iron_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:iron_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:diamond_ore","minecraft:emerald_ore","minecraft:furnace","minecraft:gold_ore","minecraft:lapis_ore","minecraft:nether_quartz_ore","minecraft:redstone_ore","minecraft:spawner","minecraft:stone"]}}}] weapon.mainhand iron_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:diamond_ore","minecraft:emerald_ore","minecraft:furnace","minecraft:gold_ore","minecraft:lapis_ore","minecraft:nether_quartz_ore","minecraft:redstone_ore","minecraft:spawner","minecraft:stone"]} 1



# ADD SHEARS CHANGE BACK INTO IRON
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:shears"}},nbt=!{SelectedItem:{id:"minecraft:shears",tag:{CanPlaceOn:["minecraft:water"]}}}] weapon.mainhand shears{Shears:1b,HideFlags:16,CanPlaceOn:["minecraft:water"],display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Unstable Shears\"}"}} 1
replaceitem entity @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:shears"}]},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:shears",tag:{CanPlaceOn:["minecraft:water"]}}]}] weapon.offhand shears{Shears:1b,HideFlags:16,CanPlaceOn:["minecraft:water"],display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Unstable Shears\"}"}} 1

tag @a remove HasShears
tag @a[nbt={Inventory:[{id:"minecraft:shears"}]}] add HasShears

execute if entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] run scoreboard objectives add SwapShears dummy
execute unless entity @a[nbt={Inventory:[{id:"minecraft:shears"}]}] run scoreboard objectives remove SwapShears
scoreboard players add @a[nbt={Inventory:[{id:"minecraft:shears"}]}] SwapShears 0
scoreboard players add @a[scores={SwapShears=0..}] SwapShears 1

execute as @a[tag=HasShears,nbt={SelectedItem:{id:"minecraft:shears"}},scores={SwapShears=50..}] at @s run playsound entity.item.break master @s
execute as @a[tag=HasShears,nbt={SelectedItem:{id:"minecraft:shears"}},scores={SwapShears=50..}] run replaceitem entity @s weapon.mainhand iron_ingot 2
execute as @a[tag=HasShears,nbt={Inventory:[{Slot:-106b,id:"minecraft:shears"}]},scores={SwapShears=50..}] at @s run playsound entity.item.break master @s
execute as @a[tag=HasShears,nbt={Inventory:[{Slot:-106b,id:"minecraft:shears"}]},scores={SwapShears=50..}] run replaceitem entity @s weapon.offhand iron_ingot 2

execute if entity @e[type=item,nbt={Item:{id:"minecraft:shears"}}] run scoreboard objectives add ConvertShears dummy
execute unless entity @e[nbt={Item:{id:"minecraft:shears"}}] run scoreboard objectives remove ConvertShears
scoreboard players add @e[nbt={Item:{id:"minecraft:shears"},OnGround:1b}] ConvertShears 1
execute as @e[scores={ConvertShears=50..}] at @s run playsound entity.item.break master @a
execute as @e[scores={ConvertShears=50..}] run data merge entity @s {Item:{id:"minecraft:iron_ingot",Count:2b}}




# REPLACEITEM DIAMOND TOOL
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:diamond_sword",tag:{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]}}}] weapon.mainhand diamond_sword{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:oak_leaves"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:diamond_axe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:diamond_axe",tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]}}}] weapon.mainhand diamond_axe{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_leaves","minecraft:oak_log"]} 1

replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe",Count:1b}},nbt=!{SelectedItem:{id:"minecraft:diamond_pickaxe",tag:{CanDestroy:["minecraft:coal_ore","minecraft:diamond_ore","minecraft:emerald_ore","minecraft:furnace","minecraft:gold_ore","minecraft:lapis_ore","minecraft:nether_quartz_ore","minecraft:obsidian","minecraft:redstone_ore","minecraft:spawner","minecraft:stone"]}}}] weapon.mainhand diamond_pickaxe{CanDestroy:["minecraft:coal_ore","minecraft:diamond_ore","minecraft:emerald_ore","minecraft:furnace","minecraft:gold_ore","minecraft:lapis_ore","minecraft:nether_quartz_ore","minecraft:obsidian","minecraft:redstone_ore","minecraft:spawner","minecraft:stone"]} 1



# LAUNCHER MECHANIC
tag @e remove RunLauncher
execute if entity @e[tag=LaunchItem] run tag @e[tag=MainBossAEC] add RunLauncher
execute align x align y align z if entity @e[type=item,nbt={OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2] run tag @e[tag=MainBossAEC] add RunLauncher
execute if entity @e[tag=RunLauncher] run function d3:boss/launcher_check

execute if entity @e[tag=LaunchItem] run function d3:boss/launcher
execute unless entity @e[tag=LaunchItem] run scoreboard objectives remove LaunchItem
execute unless entity @e[scores={LaunchItem=..10}] run fill -1016 62 -987 -1014 62 -985 red_concrete replace orange_concrete


# HOSTILE BLOCKS
execute if entity @e[tag=Level1Mob] run function d3:boss/fake_blocks_1
execute if entity @e[tag=Level2Mob] run function d3:boss/fake_blocks_2
execute if entity @e[tag=Level3Mob] run function d3:boss/fake_blocks_3
execute if entity @e[tag=Level4Mob] run function d3:boss/fake_blocks_4

scoreboard players add @e[tag=MainBossAEC] IronAttack 0
execute if entity @e[scores={IronAttack=0..}] run function d3:boss/launch_iron_mobs_1
execute if entity @e[tag=IronOreMob] at @e[tag=IronOreMob] run particle cloud ~ ~1.3 ~ 0.25 0.05 0.25 0.01 2

scoreboard players add @e[tag=MainBossAEC] OreAttack 0
execute if entity @e[scores={OreAttack=0..}] run function d3:boss/launch_ore_pillars


# DISABLE MONUMENT BLOCKS THAT HAVE FALLEN
execute if entity @e[scores={BossLevel=1}] run fill -1034 47 -996 -1028 61 -994 air
execute if entity @e[scores={BossLevel=1}] run fill -1042 47 -989 -1040 61 -982 air


# PREVENT MOBS FROM GETTING STUCK ON MONUMENT - UNSURE WHY??
execute align x align y align z as @e[type=zombie,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] at @s run teleport @s ~ ~ ~0.1
execute align x align y align z as @e[type=rabbit,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] at @s run teleport @s ~ ~ ~0.1
execute align x align y align z as @e[type=armor_stand,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] at @s run teleport @s ~ ~ ~0.1

execute align x align y align z if entity @e[type=zombie,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] run scoreboard objectives add MobSuicide dummy
execute align x align y align z if entity @e[type=rabbit,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] run scoreboard objectives add MobSuicide dummy
execute align x align y align z unless entity @e[tag=BossMob,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] run scoreboard objectives remove MobSuicide

execute align x align y align z run scoreboard players add @e[type=zombie,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] MobSuicide 1
execute align x align y align z run scoreboard players add @e[type=rabbit,x=-1034,y=70,z=-996,dx=7,dy=5,dz=4] MobSuicide 1

execute if entity @e[scores={MobSuicide=140..}] run kill @e[scores={MobSuicide=140..}]



# HUNGER
scoreboard players add @e[tag=MainBossAEC] GoHungry 0
execute if entity @e[scores={GoHungry=0..}] run function d3:boss/steve_animations/food_hungry

scoreboard players add @e[tag=MainBossAEC] EatPork 0
execute if entity @e[scores={EatPork=0..}] run function d3:boss/eat_pork


# POISON SPAWNER
scoreboard players add @e[tag=MainBossAEC] LaunchPoison 0
execute if entity @e[scores={LaunchPoison=0..}] run function d3:boss/launch_poison


# GRASS BLOCKS
scoreboard players add @e[tag=MainBossAEC] DropPigGrass 0
execute if entity @e[scores={DropPigGrass=0..}] run function d3:boss/drop_pig_grass

scoreboard players add @e[tag=MainBossAEC] DropCowGrass 0
execute if entity @e[scores={DropCowGrass=0..}] run function d3:boss/drop_cow_grass


# DIFFICULTY LOCK
execute if entity @e[scores={BossLevel=20..}] run difficulty easy


scoreboard objectives add BossLevel dummy
scoreboard players add @e[tag=MainBossAEC] BossLevel 0

scoreboard objectives add BossTimer dummy
scoreboard players add @e[scores={BossLevel=1..}] BossTimer 1

execute if entity @e[scores={BossLevel=0}] run difficulty peaceful
execute if entity @e[scores={BossLevel=0}] align x align y align z if entity @a[x=-1006,y=63,z=-992,dx=14,dy=2,dz=14] run scoreboard players set @e[scores={BossLevel=0}] BossLevel 1


# DIALOGUE
execute if entity @e[scores={BossLevel=1,BossTimer=70}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=70}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=70}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=1,BossTimer=150}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=150}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=150}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=150}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=1,BossTimer=220}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=220}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=220}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=1,BossTimer=220}] run function d3:boss/steve_animations/sign_happy_face

execute if entity @e[scores={BossLevel=1,BossTimer=300}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NEED PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=300}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=300}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=300}] run function d3:boss/steve_animations/sign_stone_pickaxe

execute if entity @e[scores={BossLevel=1,BossTimer=400}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME BREAK BIG DUMB STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=400}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=400}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=1,BossTimer=400}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=1,BossTimer=400}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=1,BossTimer=500}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU GIVE PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=500}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=500}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=500}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=500}] run function d3:boss/steve_animations/sign_stone_pickaxe

execute if entity @e[scores={BossLevel=1,BossTimer=650}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=650}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=1,BossTimer=650}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=1,BossTimer=650}] run function d3:boss/steve_animations/sign_ellipses

execute if entity @e[scores={BossLevel=1,BossTimer=750}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"WHAT YOU WAIT FOR?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=1,BossTimer=750}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=750}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=1,BossTimer=750}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=1,BossTimer=750}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=1,BossTimer=850}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=1,BossTimer=850}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=1,BossTimer=850}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=1,BossTimer=850}] run function d3:boss/steve_animations/sign_ellipses


scoreboard players set @e[scores={BossLevel=1,BossTimer=900}] BossTimer -10
scoreboard players set @e[scores={BossLevel=1,BossTimer=-10}] BossLevel 5

execute if entity @e[scores={BossLevel=5,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"CHEST?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=5,BossTimer=50}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=5,BossTimer=50}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=5,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=5,BossTimer=50}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=5,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"OPEN CHEST!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=5,BossTimer=100}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=5,BossTimer=100}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=5,BossTimer=100}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=5,BossTimer=200}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=5,BossTimer=200}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossLevel=5,BossTimer=200}] run function d3:boss/steve_animations/face_to_player

scoreboard players set @e[scores={BossLevel=5,BossTimer=200..}] BossLevel 6

execute if entity @e[scores={BossLevel=6}] if entity @a[nbt={Inventory:[{id:"minecraft:wooden_axe"}]}] run scoreboard players set @e[scores={BossLevel=6}] BossTimer 0
execute if entity @e[scores={BossLevel=6}] if entity @a[nbt={Inventory:[{id:"minecraft:wooden_axe"}]}] run scoreboard players set @e[scores={BossLevel=6}] BossLevel 10

execute if entity @e[scores={BossLevel=10,BossTimer=20}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU GET AXE?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=20}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=20}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=10,BossTimer=20}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=10,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YAY!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=100}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=100}] run function d3:boss/steve_animations/arm_up
execute if entity @e[scores={BossLevel=10,BossTimer=100}] run function d3:boss/steve_animations/arm_up_right
execute if entity @e[scores={BossLevel=10,BossTimer=100}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=10,BossTimer=100}] run function d3:boss/steve_animations/sign_happy_face

execute if entity @e[scores={BossLevel=10,BossTimer=200}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"BREAK TREE! GET WOOD!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=200}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=200}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=10,BossTimer=200}] run function d3:boss/steve_animations/arm_down_right
execute if entity @e[scores={BossLevel=10,BossTimer=200}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=10,BossTimer=200}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=10,BossTimer=300}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU MAKE PICK! ME NEED PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=300}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=300}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=10,BossTimer=300}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=10,BossTimer=300}] run function d3:boss/steve_animations/sign_stone_pickaxe

execute if entity @e[scores={BossLevel=10,BossTimer=400}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"STONE PICK BREAK DUMB STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=400}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=400}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=10,BossTimer=400}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=10,BossTimer=400}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=10,BossTimer=500}] run function d3:boss/steve_animations/arm_down

execute if entity @e[scores={BossLevel=10,BossTimer=600}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME WAIT!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=10,BossTimer=600}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=10,BossTimer=600}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=10,BossTimer=600}] run function d3:boss/steve_animations/sign_stone_pickaxe

#execute if entity @e[scores={BossLevel=10,BossTimer=700}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossLevel=10,BossTimer=700}] run function d3:boss/steve_animations/face_to_stone

execute if entity @e[scores={BossLevel=10}] if entity @a[nbt={Inventory:[{id:"minecraft:stone_pickaxe"}]}] run scoreboard players set @e[scores={BossLevel=10}] BossTimer 0
execute if entity @e[scores={BossLevel=10}] if entity @a[nbt={Inventory:[{id:"minecraft:stone_pickaxe"}]}] run scoreboard players set @e[scores={BossLevel=10}] BossLevel 15

execute if entity @e[scores={BossLevel=15,BossTimer=20}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU MAKE STONE PICK?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=15,BossTimer=20}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=15,BossTimer=20}] run function d3:boss/steve_animations/arm_down_right
execute if entity @e[scores={BossLevel=15,BossTimer=20}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=15,BossTimer=20}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=15,BossTimer=20}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=15,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"YOU PUT ON MAGIC RED BOX! ME GET!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=15,BossTimer=100}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=15,BossTimer=100}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=15,BossTimer=100}] run function d3:boss/steve_animations/sign_stone_pickaxe


# GET STONE PICK
execute if entity @e[scores={BossLevel=20,BossTimer=1}] run kill @e[tag=LaunchItem,nbt={Item:{id:"minecraft:stone_pickaxe"}}]
execute if entity @e[scores={BossLevel=20,BossTimer=1}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=20,BossTimer=1}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=20,BossTimer=1}] run function d3:boss/steve_animations/stone_pickaxe_obtained
execute if entity @e[scores={BossLevel=20,BossTimer=1}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=20,BossTimer=30}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=20,BossTimer=30}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=20,BossTimer=30}] run function d3:boss/steve_animations/stone_pickaxe_raised
execute if entity @e[scores={BossLevel=20,BossTimer=30}] run function d3:boss/steve_animations/sign_happy_face

execute if entity @e[scores={BossLevel=20,BossTimer=30}] run scoreboard objectives add GoHungry dummy

execute if entity @e[scores={BossLevel=20,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"HYAH!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=20,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=20,BossTimer=50}] run function d3:boss/steve_animations/stone_pickaxe_swung
execute if entity @e[scores={BossLevel=20,BossTimer=52}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=20,BossTimer=52}] run function d3:boss/stone_crack_1
execute if entity @e[scores={BossLevel=20,BossTimer=65}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1
execute if entity @e[scores={BossLevel=20,BossTimer=65}] run function d3:boss/launch_stone_mobs_1
execute if entity @e[scores={BossLevel=20,BossTimer=65}] run function d3:boss/steve_animations/sign_question_mark
execute if entity @e[scores={BossLevel=20,BossTimer=65}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"OUCH!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=20,BossTimer=95}] run function d3:boss/steve_animations/pickaxe_breaks
execute if entity @e[scores={BossLevel=20,BossTimer=95}] run function d3:boss/steve_animations/sign_sad_face

execute if entity @e[scores={BossLevel=20,BossTimer=200}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossLevel=20,BossTimer=200}] run function d3:boss/steve_animations/face_to_stone

execute if entity @e[scores={BossLevel=20,BossTimer=120..}] unless entity @e[tag=Level1Mob] run scoreboard players set @e[scores={BossLevel=20,BossTimer=120..}] BossTimer -10
execute if entity @e[scores={BossLevel=20,BossTimer=..-1}] unless entity @e[tag=Level1Mob] run scoreboard players set @e[scores={BossLevel=20,BossTimer=..-1}] BossLevel 25

execute if entity @e[scores={BossLevel=25,BossTimer=1}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME HUNGRY!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=1}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=25,BossTimer=1}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=25,BossTimer=1}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=25,BossTimer=65}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Well, that was uncalled for!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=65}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=25,BossTimer=85}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=25,BossTimer=85}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=25,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"DUMB STONE TALK?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=100}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0

execute if entity @e[scores={BossLevel=25,BossTimer=200}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Of course I talk. I'm a character in a Diversity map! What is wrong with you?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=200}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=25,BossTimer=200}] run function d3:boss/steve_animations/sign_ellipses

execute if entity @e[scores={BossLevel=25,BossTimer=300}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NO LIKE DUMB STONE! STONE BREAK PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=300}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=25,BossTimer=300}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=25,BossTimer=300}] run function d3:boss/steve_animations/sign_sad_face

# DROP PIG GRASS
execute if entity @e[scores={BossLevel=25,BossTimer=300}] run scoreboard objectives add DropPigGrass dummy

execute if entity @e[scores={BossLevel=25,BossTimer=400}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Leave here or you'll be sorry! And take your troublemaker friend with you!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=400}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=25,BossTimer=400}] run function d3:boss/steve_animations/arm_down

execute if entity @e[scores={BossLevel=25,BossTimer=500}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME HUNGRY NOW!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=500}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=25,BossTimer=500}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=25,BossTimer=500}] run function d3:boss/steve_animations/sign_exclamation

# SUMMON PIG
execute if entity @e[scores={BossLevel=25,BossTimer=580}] run summon pig -1030.0 64 -993.5 {Rotation:[0f,0f],Health:500.0f,Attributes:[{Name:generic.maxHealth,Base:500.0},{Name:generic.movementSpeed,Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Silent:true,Tags:["BossMob","BossPig"]}

execute if entity @e[scores={BossLevel=25,BossTimer=590}] at @e[tag=BossPig] run playsound entity.pig.ambient master @a ~ ~ ~ 3 1 1

execute if entity @e[scores={BossLevel=25,BossTimer=600}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PIG?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=600}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=25,BossTimer=600}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=25,BossTimer=600}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=25,BossTimer=600}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=25,BossTimer=650}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME HUNGRY! ME EAT PIG!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=25,BossTimer=650}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=25,BossTimer=650}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=25,BossTimer=650}] run function d3:boss/steve_animations/sign_porkchop

execute if entity @e[scores={BossLevel=25,BossTimer=650}] as @e[tag=BossPig] run data merge entity @s {Silent:false}
execute if entity @e[scores={BossLevel=25,BossTimer=650..}] align x align y align z if entity @a[x=-1039,y=63,z=-996,dx=20,dy=1,dz=18] run scoreboard players set @e[scores={BossLevel=25,BossTimer=650..}] BossLevel 30
execute if entity @e[scores={BossLevel=30}] run scoreboard objectives add BossPig dummy
scoreboard players set @e[scores={BossLevel=30}] BossTimer 0

execute unless entity @e[tag=BossPigman] if entity @e[scores={BossPig=602..}] run bossbar remove bosspigman

execute if entity @e[scores={BossLevel=35}] run scoreboard objectives remove BossPig
execute if entity @e[scores={BossLevel=35}] run scoreboard objectives remove BossPigman
execute if entity @e[scores={BossLevel=35}] run bossbar remove bosspigman

execute if entity @e[scores={BossLevel=35,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"BAD PIG DEAD! ME STILL HUNGRY!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=35,BossTimer=50}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=35,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=35,BossTimer=50}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=35,BossTimer=50}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=35,BossTimer=150}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Just leave me alone you big oaf!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=35,BossTimer=150}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=35,BossTimer=200}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER GIVE FOOD!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=35,BossTimer=200}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=35,BossTimer=200}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=35,BossTimer=200}] run function d3:boss/steve_animations/sign_porkchop


# PORK BUILDS
execute if entity @e[scores={BossLevel=40,BossTimer=1}] run function d3:boss/build_pork_1
execute if entity @e[scores={BossLevel=45,BossTimer=1}] run function d3:boss/build_pork_2
execute if entity @e[scores={BossLevel=50,BossTimer=1}] run function d3:boss/build_pork_3
execute if entity @e[scores={BossLevel=55,BossTimer=1}] run function d3:boss/build_pork_4
execute if entity @e[scores={BossLevel=60,BossTimer=1}] run function d3:boss/build_pork_5
execute if entity @e[scores={BossLevel=60,BossTimer=1}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=60,BossTimer=1}] run function d3:boss/steve_animations/sign_happy_face


# EATS PORK
execute if entity @e[scores={BossLevel=60,BossTimer=50}] run scoreboard objectives add EatPork dummy
execute if entity @e[scores={BossLevel=61}] unless entity @e[tag=Level2Mob] run scoreboard players set @e[scores={BossLevel=61}] BossTimer 0
execute if entity @e[scores={BossLevel=61}] unless entity @e[tag=Level2Mob] run scoreboard players set @e[scores={BossLevel=61}] BossLevel 65



execute if entity @e[scores={BossLevel=65,BossTimer=1}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1
execute if entity @e[scores={BossLevel=65,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NO LIKE DUMB STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=65,BossTimer=50}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=65,BossTimer=50}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=65,BossTimer=50}] run function d3:boss/steve_animations/sign_sad_face

execute if entity @e[scores={BossLevel=65,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME WANT TO SMASH!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=65,BossTimer=100}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=65,BossTimer=100}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=65,BossTimer=100}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=65,BossTimer=200}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NEED STRONG PICK! ME NEED IRON PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=65,BossTimer=200}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=65,BossTimer=200}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=65,BossTimer=200}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=65,BossTimer=200}] run function d3:boss/steve_animations/sign_iron_pickaxe

execute if entity @e[scores={BossLevel=65,BossTimer=280}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Iron, you say?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=65,BossTimer=280}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=65,BossTimer=350}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I've got your iron right here!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=65,BossTimer=350}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=65,BossTimer=350}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=65,BossTimer=350}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=65,BossTimer=350}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=65,BossTimer=450}] run function d3:boss/steve_animations/sign_exclamation
execute if entity @e[scores={BossLevel=65,BossTimer=450}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=65,BossTimer=450}] run scoreboard players set @e[scores={BossLevel=65}] BossLevel 70

scoreboard players set @e[scores={BossLevel=70}] BossTimer 0

execute if entity @e[scores={BossLevel=70}] run scoreboard objectives add IronAttack dummy

execute if entity @e[scores={BossLevel=70,IronAttack=1500}] run function d3:boss/steve_animations/sign_ellipses


execute if entity @e[scores={BossLevel=70,IronAttack=250}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER MAKE PICK! ME SMASH DUMB STONE AGAIN! WE TEAM!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=70,IronAttack=250}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=70,IronAttack=250}] run function d3:boss/steve_animations/sign_iron_pickaxe



execute if entity @e[scores={BossLevel=70}] if entity @a[nbt={Inventory:[{id:"minecraft:iron_pickaxe"}]}] run scoreboard players set @e[scores={BossLevel=70}] BossTimer 0
execute if entity @e[scores={BossLevel=70}] if entity @a[nbt={Inventory:[{id:"minecraft:iron_pickaxe"}]}] run scoreboard players set @e[scores={BossLevel=70}] BossLevel 75

execute if entity @e[scores={BossLevel=75,BossTimer=20}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"QUICK! GIVE IRON PICK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=75,BossTimer=20}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=75,BossTimer=20}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=75,BossTimer=20}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=75,BossTimer=20}] run function d3:boss/steve_animations/sign_iron_pickaxe

execute if entity @e[scores={BossLevel=80}] run scoreboard objectives remove IronAttack
execute if entity @e[scores={BossLevel=80}] run kill @e[tag=IronOreAS]


# GET IRON PICK
execute if entity @e[scores={BossLevel=80,BossTimer=1}] run kill @e[tag=LaunchItem,nbt={Item:{id:"minecraft:iron_pickaxe"}}]
execute if entity @e[scores={BossLevel=80,BossTimer=1}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=80,BossTimer=1}] run function d3:boss/steve_animations/iron_pickaxe_obtained
execute if entity @e[scores={BossLevel=80,BossTimer=1}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=80,BossTimer=30}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=80,BossTimer=30}] run function d3:boss/steve_animations/iron_pickaxe_raised
execute if entity @e[scores={BossLevel=80,BossTimer=30}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=80,BossTimer=30}] run function d3:boss/steve_animations/sign_happy_face

execute if entity @e[scores={BossLevel=80,BossTimer=30}] run scoreboard objectives add GoHungry dummy

execute if entity @e[scores={BossLevel=80,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"KAPOW!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=80,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=80,BossTimer=50}] run function d3:boss/steve_animations/iron_pickaxe_swung
execute if entity @e[scores={BossLevel=80,BossTimer=52}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=80,BossTimer=52}] run function d3:boss/stone_crack_2
execute if entity @e[scores={BossLevel=80,BossTimer=65}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1
execute if entity @e[scores={BossLevel=80,BossTimer=65}] run function d3:boss/launch_stone_mobs_2
execute if entity @e[scores={BossLevel=80,BossTimer=65}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Aaaaaaahhhgggg!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=80,BossTimer=95}] run function d3:boss/steve_animations/pickaxe_breaks
execute if entity @e[scores={BossLevel=80,BossTimer=95}] run function d3:boss/steve_animations/sign_sad_face


execute if entity @e[scores={BossLevel=80,BossTimer=200}] run fill -1045 85 -945 -1026 100 -945 air
execute if entity @e[scores={BossLevel=80,BossTimer=200}] run function d3:boss/steve_animations/face_to_stone

execute if entity @e[scores={BossLevel=80,BossTimer=120..}] unless entity @e[tag=Level3Mob] unless entity @e[tag=Level4Mob] run scoreboard players set @e[scores={BossLevel=80,BossTimer=120..}] BossTimer -10
execute if entity @e[scores={BossLevel=80,BossTimer=..-1}] unless entity @e[tag=Level3Mob] unless entity @e[tag=Level4Mob] run scoreboard players set @e[scores={BossLevel=80,BossTimer=..-1}] BossLevel 85

execute if entity @e[scores={BossLevel=85,BossTimer=1}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME HUNGRY AGAIN!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=85,BossTimer=1}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=85,BossTimer=1}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=85,BossTimer=1}] run function d3:boss/steve_animations/sign_porkchop

execute if entity @e[scores={BossLevel=85,BossTimer=100}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Oh well why don't you taste this then!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=85,BossTimer=100}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=85,BossTimer=150}] run scoreboard objectives add LaunchPoison dummy

execute if entity @e[scores={BossLevel=85,BossTimer=199}] run function d3:boss/steve_animations/arm_to_player

execute if entity @e[scores={BossLevel=90,BossTimer=1}] run function d3:boss/build_pork_1
execute if entity @e[scores={BossLevel=95,BossTimer=1}] run function d3:boss/build_pork_2
execute if entity @e[scores={BossLevel=100,BossTimer=1}] run function d3:boss/build_pork_3
execute if entity @e[scores={BossLevel=105,BossTimer=1}] run function d3:boss/build_pork_4
execute if entity @e[scores={BossLevel=110,BossTimer=1}] run function d3:boss/build_pork_5
execute if entity @e[scores={BossLevel=110,BossTimer=1}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=110,BossTimer=1}] run function d3:boss/steve_animations/sign_happy_face
execute if entity @e[scores={BossLevel=110,BossTimer=50}] run scoreboard objectives add EatPork dummy


# WHEN SICK HAPPENS
execute if entity @e[scores={BossLevel=120,BossTimer=1}] run function d3:boss/build_pork_poison
execute if entity @e[scores={BossLevel=120,BossTimer=1}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=120,BossTimer=1}] run function d3:boss/steve_animations/sign_question_mark
execute if entity @e[scores={BossLevel=120,BossTimer=50}] run scoreboard objectives remove EatPork
execute if entity @e[scores={BossLevel=120,BossTimer=50}] run scoreboard objectives add EatPork dummy
execute if entity @e[scores={BossLevel=120..130}] as @e[tag=SickZombie] at @s align xyz run teleport @s[x=-1038,y=57,z=-992,dx=46,dy=2,dz=13] ~ 63.5 ~


execute if entity @e[scores={BossLevel=125,BossTimer=1}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=125,BossTimer=1}] run function d3:boss/steve_animations/face_sick
execute if entity @e[scores={BossLevel=125,BossTimer=1}] run playsound entity.elder_guardian.curse master @a -1025 68 -957 10 1 0
execute if entity @e[scores={BossLevel=125,BossTimer=1}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=125,BossTimer=70}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"UGH! ME NO FEEL GOOD!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=125,BossTimer=70}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=125,BossTimer=70}] run function d3:boss/steve_animations/sign_sad_face


# POSSIBLE BUG -> SICK FLOATING ZOMBIES LEFT OVER?
##execute if entity @e[tag=SickZombie] unless entity @e[scores={LaunchPoison=0..}] as @e[tag=SickZombie] align x align y align z unless entity @s[x=-1039,y=63,z=-993,dx=48,dy=4,dz=15] run kill @s


#execute if entity @e[scores={BossLevel=125,BossTimer=70..}] align xyz unless entity @e[tag=SickZombie] unless block -1002 63 -988 spawner unless block -1026 63 -982 spawner run scoreboard players set @e[scores={BossLevel=125}] BossTimer -10
execute if entity @e[scores={BossLevel=125,BossTimer=70..}] align xyz unless entity @e[tag=SickZombie,x=-1043,y=62,z=-1002,dx=52,dy=4,dz=24] unless block -1002 63 -988 spawner unless block -1026 63 -982 spawner run scoreboard players set @e[scores={BossLevel=125}] BossTimer -10
scoreboard players set @e[scores={BossLevel=125,BossTimer=..-1}] BossLevel 130

execute if entity @e[scores={BossLevel=130,BossTimer=1}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I warned you. You gave me no choice.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=1}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

# DROP COW GRASS
execute if entity @e[scores={BossLevel=130,BossTimer=50}] run scoreboard objectives add DropCowGrass dummy

execute if entity @e[scores={BossLevel=130,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"DUMB STONE! BAD STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=100}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=130,BossTimer=100}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=130,BossTimer=170}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Get lost! All of you!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=170}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=130,BossTimer=260}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NOT LOST! ME SMASH BUT ME FEEL BAD!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=260}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=130,BossTimer=260}] run function d3:boss/steve_animations/sign_sad_face
execute if entity @e[scores={BossLevel=130,BossTimer=260}] run function d3:boss/steve_animations/arm_to_stone

execute if entity @e[scores={BossLevel=130,BossTimer=370}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"You're an idiot! Do you even understand what I'm saying?!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=370}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=130,BossTimer=370}] run function d3:boss/steve_animations/arm_down

execute if entity @e[scores={BossLevel=130,BossTimer=460}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME SICK! ME NEED FEEL BETTER!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=460}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=130,BossTimer=460}] run function d3:boss/steve_animations/sign_sad_face

# SUMMON COW
execute if entity @e[scores={BossLevel=130,BossTimer=490}] run team add NoPush
team modify NoPush collisionRule never

execute if entity @e[scores={BossLevel=130,BossTimer=500..}] unless entity @e[tag=BossCow] run summon cow -1039.5 64 -985.0 {Rotation:[270f,0f],Invulnerable:true,Health:500.0f,Attributes:[{Name:generic.maxHealth,Base:500},{Name:generic.movementSpeed,Base:0},{Name:generic.knockbackResistance,Base:1}],ActiveEffects:[{Id:12,Amplifier:0,Duration:1999980,ShowParticles:0b}],Silent:false,Team:NoPush,Tags:["BossMob","BossCow"]}
execute if entity @e[scores={BossLevel=130,BossTimer=550}] at @e[tag=BossCow] run playsound entity.cow.hurt master @a ~ ~ ~ 3 1 1

execute if entity @e[scores={BossLevel=130,BossTimer=560}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"COW?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=560}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=130,BossTimer=560}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=130,BossTimer=560}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=130,BossTimer=560}] run function d3:boss/steve_animations/face_sick
execute if entity @e[scores={BossLevel=130,BossTimer=560}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=130,BossTimer=600}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER GET BUCKET! ME NEED MILK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=600}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=130,BossTimer=600}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=130,BossTimer=600}] run function d3:boss/steve_animations/sign_milk

execute if entity @e[scores={BossLevel=130,BossTimer=700}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Well isn't that convenient! I get you sick, and a cure just ","color":"none","bold":false,"underlined":false},{"text":"happens","color":"none","bold":false,"italic":true},{"text":" to appear the moment you need it...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=700}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=130,BossTimer=830}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"What's next? A bucket will just ","color":"none","bold":false,"underlined":false},{"text":"magically","color":"none","bold":false,"italic":true},{"text":" spawn because you need one?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=830}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=130,BossTimer=900}] run particle cloud -1015 64.5 -986 0.3 0.3 0.3 0 20 force
execute if entity @e[scores={BossLevel=130,BossTimer=900}] run playsound entity.item.pickup master @a -1015 64 -986 3 1 1
execute if entity @e[scores={BossLevel=130,BossTimer=900}] run summon item -1015 64 -986 {Item:{id:"minecraft:bucket",Count:1b,tag:{HideFlags:1,display:{Name:"{\"text\":\"Progression Reward\",\"color\":\"white\",\"italic\":\"false\"}",Lore:['{"text":"A game object that is","italic":"true","color":"dark_purple"}','{"text":"initially unreachable","italic":"true","color":"dark_purple"}','{"text":"until it\'s neccessary","italic":"true","color":"dark_purple"}','{"text":"to progress gameplay","italic":"true","color":"dark_purple"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:2}]}},Age:-32768s,PickupDelay:30s,NoGravity:true,Tags:["MagicBucket"]}
execute if entity @e[scores={BossLevel=130,BossTimer=900}] at @a run playsound ui.toast.challenge_complete master @a ~ ~ ~ 0.5 1 0

execute if entity @e[scores={BossLevel=130,BossTimer=1000}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"What!?! That isn't fair!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=130,BossTimer=1000}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1


# GET MILK
execute if entity @e[scores={BossLevel=135,BossTimer=1}] run function d3:boss/build_milk_bucket
execute if entity @e[scores={BossLevel=135,BossTimer=50}] run playsound entity.generic.drink master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=135,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=135,BossTimer=50}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossLevel=135,BossTimer=60}] run fill -1028 65 -956 -1021 72 -956 air
execute if entity @e[scores={BossLevel=135,BossTimer=60}] run clone -1006 54 -1011 -998 62 -1011 -1029 55 -956 masked

execute if entity @e[scores={BossLevel=135,BossTimer=70}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Nooooooooo!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=135,BossTimer=70}] run playsound entity.chicken.hurt master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=135,BossTimer=70}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=135,BossTimer=70}] run function d3:boss/steve_animations/sign_happy_face

execute if entity @e[scores={BossLevel=135,BossTimer=110}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"That's enough!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=135,BossTimer=110}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1


# COW BOSS
execute if entity @e[scores={BossLevel=135,BossTimer=110}] run scoreboard objectives add BossCow dummy

execute unless entity @e[tag=BossMooshroom] if entity @e[scores={BossCow=602..}] run bossbar remove bossmooshroom

execute if entity @e[scores={BossLevel=140}] run team remove NoPush
execute if entity @e[scores={BossLevel=140}] run scoreboard objectives remove BossCow
execute if entity @e[scores={BossLevel=140}] run scoreboard objectives remove BossMooshroom
execute if entity @e[scores={BossLevel=140}] run bossbar remove bossmooshroom


execute if entity @e[scores={BossLevel=140,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"STONE NO STOP PLAYER!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=50}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=140,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=140,BossTimer=50}] run function d3:boss/steve_animations/sign_happy_face
execute if entity @e[scores={BossLevel=140,BossTimer=50}] run function d3:boss/steve_animations/face_to_stone

execute if entity @e[scores={BossLevel=140,BossTimer=100}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Arrrrgh!!!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=100}] run playsound entity.chicken.hurt master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=140,BossTimer=200}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"SMASH TIME! BREAK DUMB STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=200}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=140,BossTimer=200}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=140,BossTimer=200}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=140,BossTimer=250}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I'll SMASH you!!!!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=250}] run playsound entity.chicken.hurt master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=140,BossTimer=300}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"HEY! THAT MY LINE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=300}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=140,BossTimer=300}] run function d3:boss/steve_animations/sign_questions_mark
execute if entity @e[scores={BossLevel=140,BossTimer=300}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=140,BossTimer=300}] run function d3:boss/steve_animations/arm_to_stone

execute if entity @e[scores={BossLevel=140,BossTimer=380}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I've got a surprise for you!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=380}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=140,BossTimer=380}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=140,BossTimer=380}] run function d3:boss/steve_animations/sign_ellipses

execute if entity @e[scores={BossLevel=140,BossTimer=450}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I brought ","color":"none","bold":false,"underlined":false},{"text":"ALL","color":"none","bold":false,"italic":true},{"text":" my cousins.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=450}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=140,BossTimer=450}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=140,BossTimer=550}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Meet the power of the Ores!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=550}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
execute if entity @e[scores={BossLevel=140,BossTimer=550}] run function d3:boss/steve_animations/sign_exclamation
execute if entity @e[scores={BossLevel=140,BossTimer=550}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossLevel=140,BossTimer=460}] run scoreboard objectives add OreAttack dummy

execute if entity @e[scores={BossLevel=140,BossTimer=650}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"Enjoy your death!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=650}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={BossLevel=140,BossTimer=750}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER GIVE DIAMOND PICK! ME SMASH BIG!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=750}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=140,BossTimer=750}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=140,BossTimer=750}] run function d3:boss/steve_animations/sign_diamond_pickaxe
execute if entity @e[scores={BossLevel=140,BossTimer=750}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=140,BossTimer=750}] run function d3:boss/steve_animations/arm_to_player

execute if entity @e[scores={BossLevel=140,BossTimer=810}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"No! Leave me alone!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=140,BossTimer=810}] run playsound entity.chicken.hurt master @a -1008 61 -951 10 0.5 1

# DIAMOND PICKAXE OBTAINED
execute if entity @e[scores={BossLevel=150,BossTimer=1}] run kill @e[tag=LaunchItem,nbt={Item:{id:"minecraft:diamond_pickaxe"}}]
execute if entity @e[scores={BossLevel=150,BossTimer=1}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=150,BossTimer=1}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=150,BossTimer=1}] run function d3:boss/steve_animations/diamond_pickaxe_obtained
execute if entity @e[scores={BossLevel=150,BossTimer=1}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=150,BossTimer=30}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=150,BossTimer=30}] run function d3:boss/steve_animations/diamond_pickaxe_raised
execute if entity @e[scores={BossLevel=150,BossTimer=30}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=150,BossTimer=30}] run function d3:boss/steve_animations/sign_happy_face

#execute if entity @e[scores={BossLevel=150,BossTimer=30}] run scoreboard objectives add GoHungry dummy

execute if entity @e[scores={BossLevel=150,BossTimer=50}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"STEVE SMASH!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=50}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=150,BossTimer=50}] run function d3:boss/steve_animations/diamond_pickaxe_swung
execute if entity @e[scores={BossLevel=150,BossTimer=52}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=150,BossTimer=52}] run function d3:boss/stone_crack_3
execute if entity @e[scores={BossLevel=150,BossTimer=65}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1

execute if entity @e[scores={BossLevel=150,BossTimer=100}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PICK NO BREAK?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=100}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=150,BossTimer=100}] run function d3:boss/steve_animations/sign_question_mark
execute if entity @e[scores={BossLevel=150,BossTimer=110}] run function d3:boss/steve_animations/face_to_player

execute if entity @e[scores={BossLevel=150,BossTimer=120}] run function d3:boss/steve_animations/sign_happy_face


execute if entity @e[scores={BossLevel=150,BossTimer=31}] at @e[tag=OrePillar] run function d3:boss/remove_ores
execute if entity @e[scores={BossLevel=150,BossTimer=31}] run kill @e[tag=OrePillar]
execute if entity @e[scores={BossLevel=150,BossTimer=31}] run scoreboard objectives remove OreAttack
execute if entity @e[scores={BossLevel=150,BossTimer=50}] at @e[tag=Level5Mob] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[scores={BossLevel=150,BossTimer=50}] at @e[tag=Level5Mob] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[scores={BossLevel=150,BossTimer=50}] run kill @e[tag=BossMob]



# FINAL SWINGS
execute if entity @e[scores={BossLevel=150,BossTimer=140}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=150,BossTimer=140}] run function d3:boss/steve_animations/diamond_pickaxe_raised
execute if entity @e[scores={BossLevel=150,BossTimer=140}] run function d3:boss/steve_animations/arm_to_stone

execute if entity @e[scores={BossLevel=150,BossTimer=155}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"STONE!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=155}] run function d3:boss/steve_animations/diamond_pickaxe_swung
execute if entity @e[scores={BossLevel=150,BossTimer=155}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=150,BossTimer=157}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=150,BossTimer=157}] run function d3:boss/stone_crack_4
execute if entity @e[scores={BossLevel=150,BossTimer=160}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1

execute if entity @e[scores={BossLevel=150,BossTimer=170}] run function d3:boss/steve_animations/diamond_pickaxe_raised
execute if entity @e[scores={BossLevel=150,BossTimer=170}] run function d3:boss/steve_animations/arm_to_stone

execute if entity @e[scores={BossLevel=150,BossTimer=185}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"BREAK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=185}] run function d3:boss/steve_animations/diamond_pickaxe_swung
execute if entity @e[scores={BossLevel=150,BossTimer=185}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=150,BossTimer=187}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=150,BossTimer=187}] run function d3:boss/stone_crack_5
execute if entity @e[scores={BossLevel=150,BossTimer=190}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1

execute if entity @e[scores={BossLevel=150,BossTimer=200}] run function d3:boss/steve_animations/diamond_pickaxe_raised
execute if entity @e[scores={BossLevel=150,BossTimer=200}] run function d3:boss/steve_animations/arm_to_stone
execute if entity @e[scores={BossLevel=150,BossTimer=215}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"NOW!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=215}] run function d3:boss/steve_animations/diamond_pickaxe_swung
execute if entity @e[scores={BossLevel=150,BossTimer=215}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run playsound block.lava.pop master @a -1013 71 -952 10 0.7 1
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run scoreboard objectives add GoHungry dummy

execute if entity @e[scores={BossLevel=150,BossTimer=217}] run playsound entity.chicken.hurt master @a -1008 61 -951 9 0.5 1
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"NOOOOoooo...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run clone -1007 26 -989 -992 40 -974 -1016 56 -959 masked
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run fill -1016 56 -959 -1001 70 -944 air replace cobblestone
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run gamerule doTileDrops false
execute if entity @e[scores={BossLevel=150,BossTimer=219}] run function d3:boss/stone_explodes
execute if entity @e[scores={BossLevel=150,BossTimer=235..300}] run fill -1010 65 -953 -1006 69 -949 air replace stone
execute if entity @e[scores={BossLevel=150,BossTimer=217}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=150,BossTimer=222}] run function d3:boss/final_platform_0
execute if entity @e[scores={BossLevel=150,BossTimer=225}] run function d3:boss/final_platform_1
execute if entity @e[scores={BossLevel=150,BossTimer=227}] run function d3:boss/final_platform_2
execute if entity @e[scores={BossLevel=150,BossTimer=229}] run function d3:boss/final_platform_3
#execute if entity @e[scores={BossLevel=150,BossTimer=231}] run function d3:boss/final_platform_4
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] unless block -1011 58 -957 air run setblock -1011 58 -957 air


# SUMMON CHICKEN
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] unless entity @e[tag=BossChicken] run summon chicken -1008 61 -951 {Health:1f,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0},{Name:generic.maxHealth,Base:1.0}],NoAI:true,Invulnerable:true,Silent:true,Rotation:[90f,-10f],Tags:["BossMob","BossChicken"]}

execute if entity @e[tag=BossChicken] unless entity @e[tag=BossChickenAS] run summon armor_stand -1008 60.6 -951 {Invulnerable:0b,Small:0b,NoGravity:1b,Invisible:1b,Marker:1b,ShowArms:true,Pose:{RightArm:[330f,0f,305f]},DisabledSlots:2039583,Tags:["BossMob","BossChickenAS"]}

execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1009 61 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1008 61 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1007 61 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1009 62 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1008 62 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1007 62 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1009 63 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1008 63 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1007 63 -953 air run fill -1009 61 -953 -1007 63 -953 air destroy
execute if entity @e[scores={BossLevel=150,BossTimer=231..}] if block -1008 62 -953 air run scoreboard players set @e[tag=MainBossAEC] BossLevel 155

execute if entity @e[scores={BossLevel=150,BossTimer=450}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"WHAT IS SMALL BOX?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=450}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=150,BossTimer=450}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=150,BossTimer=600}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER SMASH! SMASH BOX FUN!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=600}] run playsound entity.villager.yes master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=150,BossTimer=600}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=150,BossTimer=700}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME GIVE PLAYER PICK! PLAYER TURN!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run function d3:boss/steve_animations/sign_happy_face
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run fill -1023 67 -952 -1012 79 -952 air
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run function d3:boss/steve_animations/arm_to_player
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run function d3:boss/steve_animations/face_to_player
execute if entity @e[scores={BossLevel=150,BossTimer=700}] run clone -1024 106 -1013 -1012 117 -1013 -1036 79 -960 masked


# SEND BACK PICKAXE
execute if entity @e[scores={BossLevel=150,BossTimer=750}] run fill -1036 79 -960 -1024 90 -960 air
execute if entity @e[scores={BossLevel=150,BossTimer=750}] run playsound enchant.thorns.hit master @a -1025 77 -962 3 0.5 0
execute if entity @e[scores={BossLevel=150,BossTimer=751}] run summon item -1025 77 -962 {Item:{id:"diamond_pickaxe",Count:1b,tag:{Unbreakable:true,HideFlags:4,CanDestroy:["minecraft:coal_ore","minecraft:diamond_ore","minecraft:emerald_ore","minecraft:furnace","minecraft:gold_ore","minecraft:lapis_ore","minecraft:nether_quartz_ore","minecraft:obsidian","minecraft:redstone_ore","minecraft:spawner","minecraft:stone"]}},Age:-32768s,Tags:["ReturnedPickaxe"]}

execute if entity @e[scores={BossLevel=150,BossTimer=750..}] as @e[tag=ReturnedPickaxe] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute if entity @e[scores={BossLevel=150,BossTimer=750..}] as @e[tag=ReturnedPickaxe] run particle dust 1 0 0.3 1 ~ ~ ~ 0 0 0 0 0 force
execute if entity @e[scores={BossLevel=150,BossTimer=750..}] as @e[tag=ReturnedPickaxe] at @s run teleport @s ^ ^ ^2 facing -1015 63 -986
execute if entity @e[scores={BossLevel=150,BossTimer=750..}] align x align y align z run data merge entity @s[tag=ReturnedPickaxe,x=-1016,y=63,z=-987,dx=2,dy=1,dz=2] {NoGravity:false}
execute if entity @e[scores={BossLevel=150,BossTimer=750..}] align x align y align z run tag @e[tag=ReturnedPickaxe,x=-1016,y=63,z=-987,dx=2,dy=1,dz=2] remove ReturnedPickaxe

execute if entity @e[scores={BossLevel=150,BossTimer=850}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=150,BossTimer=850}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=150,BossTimer=850}] run function d3:boss/steve_animations/sign_remove


# CHICKEN ARMOR STAND POSITION
execute if entity @e[tag=BossChicken] run scoreboard objectives add ChickenHeight dummy
execute unless entity @e[tag=BossChicken] run scoreboard objectives remove ChickenHeight

execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Motion[0] double 0.1 run data get entity @e[tag=BossChicken,limit=1] Motion[0] 10
execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Motion[1] double 0.1 run data get entity @e[tag=BossChicken,limit=1] Motion[1] 10
execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Motion[2] double 0.1 run data get entity @e[tag=BossChicken,limit=1] Motion[2] 10

execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Pos[0] double 0.1 run data get entity @e[tag=BossChicken,limit=1] Pos[0] 10
execute if entity @e[tag=BossChicken] store result score @e[tag=BossChickenAS,limit=1] ChickenHeight run data get entity @e[tag=BossChicken,limit=1] Pos[1] 10
scoreboard players remove @e[tag=BossChickenAS] ChickenHeight 4
execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=BossChickenAS,limit=1] ChickenHeight
execute if entity @e[tag=BossChicken] store result entity @e[tag=BossChickenAS,limit=1] Pos[2] double 0.1 run data get entity @e[tag=BossChicken,limit=1] Pos[2] 10

execute store result entity @e[tag=BossChickenAS,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=BossChicken,limit=1] Rotation[0] 10



# CHICKEN REVEALED
scoreboard players set @e[scores={BossLevel=155}] BossTimer 0
scoreboard players set @e[scores={BossLevel=155}] BossLevel 160

execute if entity @e[scores={BossLevel=160,BossTimer=1}] run function d3:boss/steve_animations/arm_down
execute if entity @e[scores={BossLevel=160,BossTimer=1}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=160,BossTimer=1}] run function d3:boss/steve_animations/sign_remove

execute if entity @e[scores={BossLevel=160,BossTimer=1}] at @e[tag=BossChicken] run playsound entity.chicken.hurt master @a -1008 61 -951 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=1}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Ah! Please don't kill me!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=5}] as @e[tag=BossChicken] run data merge entity @s {Invulnerable:false}
execute if entity @e[scores={BossLevel=160}] as @e[tag=BossChicken] at @s run teleport @s ^ ^ ^ facing entity @p


execute if entity @e[scores={BossLevel=160,BossTimer=50}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=50}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"I hid in here so Steve wouldn't find me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=150}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=150}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Why would you help him? He's the bad guy here, not me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=200}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"WHO THERE?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=200}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=160,BossTimer=200}] run function d3:boss/steve_animations/sign_ellipses

execute if entity @e[scores={BossLevel=160,BossTimer=250}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=250}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Here I was, minding my own business, hiding inside my stone base. Then some jerk starts griefing my hideout!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=370}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=370}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Think about it. Who's the one who started all of this?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=440}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"CHICKEN HIDE IN BOX?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=440}] run playsound entity.villager.trade master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=160,BossTimer=440}] run function d3:boss/steve_animations/sign_question_mark

execute if entity @e[scores={BossLevel=160,BossTimer=520}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=520}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Who kept wanting you to kill the innocent pig and steal milk from the poor cow?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=630}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=630}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"I tried to protect them. Give them powers to defend themselves. But I failed...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=720}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER KILL CHICKEN! ME HUNGRY!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=720}] run playsound entity.villager.ambient master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=160,BossTimer=720}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=160,BossTimer=750}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=750}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"But I learned my lesson. I need your help!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=850}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=850}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Toss me your diamond pickaxe. I will stop Steve once and for all!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=890}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"ME NO LIKE CHICKEN TALK!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=890}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=160,BossTimer=890}] run function d3:boss/steve_animations/sign_sad_face

execute if entity @e[scores={BossLevel=160,BossTimer=960}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=960}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"No more innocent animals have to suffer from the selfish desires of Steve.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=1040}] at @e[tag=BossChicken] run playsound entity.chicken.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={BossLevel=160,BossTimer=1040}] run tellraw @a ["",{"text":"<Chicken> ","color":"gray","bold":false},{"text":"Please. I need you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=160,BossTimer=1090}] run tellraw @a ["",{"text":"<Steve> ","color":"aqua","bold":false},{"text":"PLAYER KILL CHICKEN! CHICKEN BAD!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=160,BossTimer=1090}] run playsound entity.villager.no master @a -1026 79 -949 10 0.5 0
execute if entity @e[scores={BossLevel=160,BossTimer=1090}] run function d3:boss/steve_animations/sign_exclamation

execute if entity @e[scores={BossLevel=160,BossTimer=1090}] as @e[tag=BossChicken] run data merge entity @s {Silent:false}


# CHOOSE CHICKEN
execute if entity @e[scores={BossLevel=160,BossTimer=20..}] if entity @e[type=item,x=-1008,y=61,z=-951,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}}] run tag @e[tag=BossChicken] add HasDiamondPick
execute if entity @e[scores={BossLevel=160,BossTimer=20..}] if entity @e[type=item,x=-1008,y=61,z=-951,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}}] run scoreboard players set @e[tag=MainBossAEC] BossLevel 165


scoreboard players set @e[scores={BossLevel=165}] BossTimer 0
scoreboard players set @e[scores={BossLevel=165}] BossLevel 175

execute if entity @e[scores={BossLevel=175,BossTimer=1}] run function d3:boss/steve_animations/face_to_stone
execute if entity @e[scores={BossLevel=175,BossTimer=1}] run fill -1028 80 -948 -1023 85 -943 air

execute if entity @e[scores={BossLevel=175,BossTimer=1}] align x align y align z run kill @e[type=item,x=-1008,y=61,z=-951,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}}]
execute if entity @e[scores={BossLevel=175,BossTimer=1}] at @e[tag=BossChicken] run playsound entity.item.pickup master @a ~ ~ ~ 1 1.5 0
execute if entity @e[scores={BossLevel=175,BossTimer=1}] as @e[tag=BossChicken] run data merge entity @s {Silent:true,Rotation:[90f,0f],NoGravity:false,NoAI:true,Invulnerable:true}
execute if entity @e[scores={BossLevel=175,BossTimer=50}] as @e[tag=BossChicken] run data merge entity @s {Rotation:[90f,-10f]}
execute if entity @e[scores={BossLevel=175,BossTimer=55}] as @e[tag=BossChickenAS] run data merge entity @s {HandItems:[{id:"minecraft:diamond_pickaxe",Count:1b}]}

#execute if entity @e[scores={BossLevel=175,BossTimer=120}] run gamerule doTileDrops false
#execute if entity @e[scores={BossLevel=175,BossTimer=120}] run fill -1010 60 -952 -1006 64 -949 air
#execute if entity @e[scores={BossLevel=175,BossTimer=120}] run fill -1010 60 -953 -1006 64 -949 air replace obsidian
#execute if entity @e[scores={BossLevel=175,BossTimer=120}] run fill -1010 60 -953 -1006 64 -949 air destroy

execute if entity @e[scores={BossLevel=175,BossTimer=120}] at @e[tag=BossChicken] run playsound entity.chicken.death master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={BossLevel=175,BossTimer=120}] at @e[tag=BossChicken] run playsound entity.wither.shoot ambient @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={BossLevel=175,BossTimer=120}] at @e[tag=BossChicken] run particle block bedrock ~ ~ ~ 0.2 0.2 0.2 1 10 force
execute if entity @e[scores={BossLevel=175,BossTimer=120..}] as @e[tag=BossChicken] at @s run teleport @s ^ ^ ^2 facing -1025 89 -946
execute if entity @e[scores={BossLevel=175,BossTimer=120..}] as @e[tag=BossChicken] run data merge entity @s {OnGround:0b}
execute if entity @e[scores={BossLevel=175,BossTimer=123}] run fill -1010 62 -952 -1008 64 -950 air destroy
execute if entity @e[scores={BossLevel=175,BossTimer=123}] run fill -1010 63 -953 -1007 64 -953 air destroy


execute align x align y align z if entity @e[tag=BossChicken,x=-1029,y=79,z=-949,dx=7,dy=7,dz=7] run scoreboard players set @e[scores={BossLevel=175}] BossLevel 176

scoreboard players set @e[scores={BossLevel=176}] BossTimer 0
scoreboard players set @e[scores={BossLevel=176}] BossLevel 180

execute if entity @e[scores={BossLevel=180,BossTimer=1}] run kill @e[tag=BossChicken]
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run summon chicken -1024 88 -946 {Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Invulnerable:true,Silent:false,Rotation:[90f,-10f],Health:1f,Tags:["BossMob","BossChicken2"]}
execute if entity @e[scores={BossLevel=180,BossTimer=1}] as @e[tag=BossChicken] run data merge entity @s {NoAI:false}
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run gamerule doTileDrops false
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run fill -1029 79 -949 -1022 86 -941 air replace white_concrete_powder
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run fill -1029 79 -949 -1022 86 -941 air replace light_blue_concrete_powder
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run fill -1029 80 -948 -1023 86 -942 air
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run fill -1022 80 -949 -1022 85 -942 air destroy
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run fill -1029 80 -949 -1022 86 -942 air replace
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run clone -1029 27 -949 -1022 34 -942 -1029 79 -949 masked
execute if entity @e[scores={BossLevel=180,BossTimer=1}] run function d3:boss/steve_animations/sign_remove
execute if entity @e[scores={BossLevel=180,BossTimer=2}] run particle explosion -1023 82 -946 3 3 3 1 80 force
execute if entity @e[scores={BossLevel=180,BossTimer=2}] run playsound entity.generic.explode master @a -1022 82 -946 10 1 1
execute if entity @e[scores={BossLevel=180,BossTimer=2}] run fill -1030 79 -945 -1022 86 -941 air replace barrier



execute if entity @e[scores={BossLevel=180,BossTimer=50}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Um...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=180,BossTimer=100}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Told you so!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=180,BossTimer=130}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Come on up.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=180,BossTimer=170..}] run fill -1025 55 -947 -1025 56 -947 air
execute if entity @e[scores={BossLevel=180,BossTimer=170}] run playsound block.piston.contract master @a -1026 55 -947 1 0.7 0.5
execute if entity @e[scores={BossLevel=180,BossTimer=174..}] if block -1026 56 -948 gray_concrete run fill -1026 52 -948 -1026 59 -948 clay replace redstone_block
execute if entity @e[scores={BossLevel=180,BossTimer=174}] run playsound block.piston.contract master @a -1026 55 -947 1 0.7 0.5

execute if entity @e[scores={BossLevel=180,BossTimer=200}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"You can get up here from Steve's boots.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=180..185}] unless entity @e[tag=BossJig] run summon armor_stand -1025 80 -944 {CustomName:"{\"text\":\"Jigarbov\",\"color\":\"blue\"}",CustomNameVisible:false,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8421247}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:44975}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"0e696be4-b798-452e-921e-816330bc97a9",Properties:{textures:[{Signature:"L3/V5fd+uKro8fz+1wmU1QUSy4iWCh+XzDbHp8SnjO+12dX6FjqDOgoqJGnUatD7ufVy0s/ibWPAhlPzPOmEw3h6yNGpAYBs/49nQrewF+0PydEEcjleI+USzwhw/B3Cpslbpjkxy0N0aHsCA1JSd/PFUvJlf9g1l69GN9hN4FreeT9Q4S7Ki7UNWWIXpPtZtxSa6F1CGEGe3zn+jhZcoLULMCFP/mkccJTpnRAWc7CcSLsgSgyluc1ELbGYhAsK4NEx01Vc+waT95OXpV1S+TtK2hG9x5MolMhW/NcoPtRfSa0Ahl4fuAkSrXLxbF3Tc6YE6nQIcOnRPx5UJhByMcCPS2gzWbkB07YRqX0pIB+QsluI8tqLk+Gepy2bDMqcK/zk2xKhaUsDxJjQBkFStfoPZCFUrnpVuzuS7V2iB88GhTX8/VfUZfv41sqS40cwV/DIiCz6JNQveBh0qpsJ9e9aGIvmgVmVltAprTtnb+xirO6soZu/Ewm3O7fNBad7lS3D10UZ+h+WHI8mvZ2Rq12Tb5HL+Wlb2SPovAGk7s1+VFqFzyLhWC7Fb69w1hNoLEHl3pRIKpc/VFHNY341QMzPSJJStlCpWguc9LpdUPxlzhO3lZnxABHBIv+wS217fQ6CK/nPvgCdGQah4JZNdh0q6O4yr5W0n4edaKykMEs=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg5Nzc4MTQsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]},Name:"Jigarbov"}},Count:1b}],DisabledSlots:2039583,Tags:["BossJig","BossNPC"]}

execute if entity @e[scores={BossLevel=180..185}] unless entity @e[tag=BossFeylina] run summon armor_stand -1027 80 -944 {CustomName:"{\"text\":\"Feylina\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1905427}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13789922}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:28638}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"94fa3b51-f70c-48b0-8117-7076ae5ad3ea",Properties:{textures:[{Signature:"v+vckwJNAmJMcrCg38qshvIUQoyoglAw3lqzJlmkB921urbYn78unul9CGoMCh6Bb9NTTffSZeYCqrlFVbz0uODQuBREJRw+nGVa37urdvO85wg+WAUzh6xPBLSneMtQE219QTOvIkPJZzRx4XYxUVQuNaODyYnrviHWZKGGBV//E3MT263PHQVaBDIq6VVEoYlkwQg1RPZ+F3p28UCcxHv+z+UVqd0ocsFWRwBp1ZvpWNXR4sxV1k4NCcdugxucGhUCW0DioZKexhcXioq1VYb2OV2SV6iUT4LWrqK83UhoV9oC0BCDtqD9zX41we9yD+tq7XFLNvAodKbtSK/Ck/XG0FOKhX9qv+B0o2C0b/BqX0mDYHfnPsap4EiBIrb+dUbWa9A9L1lX8tVM5XFVAUQ+v5oQo20v0XL3wYKh6k6RfYiSV5BXbR0VM9rBFQSF30n10Qel+T1v+vjW1pRHDJeH3wuqoH1w/rZ+6Y+yLkiHkN9JYo1sTNwS5EOK0doleDpz7nBXokpzwm3lS+Z7WKDX+hOHQ8gsEQBfOlajXHEUx/0O9FlkBNHLTXEYCbhx4V07A/TrdtujE+tMLNfXJfa5O2yi7vxdYp15kzQTN0WhyhVd/ZxK/W1YmvCYNNLZHH8/TQKvBtuTSf2Yhes3K5iccOQaEsFUmdI74lypZeI=",Value:"eyJ0aW1lc3RhbXAiOjE1NDQ2NjI0NTA3NjQsInByb2ZpbGVJZCI6Ijk0ZmEzYjUxZjcwYzQ4YjA4MTE3NzA3NmFlNWFkM2VhIiwicHJvZmlsZU5hbWUiOiJGZXlsaW5hIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xM2I5OTNmY2ZkMzU3OWQzMDFkNWM3YmY3OThhM2MxZGRlYzFjZmM3MWVlZmFlNmRiMmU2YTI4MGQ5YWE4NjEzIn19fQ=="}]},Name:"Feylina"}},Count:1b}],DisabledSlots:2039583,Tags:["BossFeylina","BossNPC"]}

execute if entity @e[scores={BossLevel=180,BossTimer=200..}] align x align y align z if entity @a[x=-1028,y=80,z=-948,dx=5,dy=5,dz=5] run scoreboard players set @e[tag=MainBossAEC] BossLevel 184
scoreboard players set @e[scores={BossLevel=184}] BossTimer 0
scoreboard players set @e[scores={BossLevel=184}] BossLevel 185

execute if entity @e[scores={BossLevel=185,BossTimer=0..260}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=185,BossTimer=1..150}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=185,BossTimer=50}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"See!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=185,BossTimer=50}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[280f,10f,0f],LeftArm:[0f,10f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=100}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"I knew they'd pick the chicken!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=185,BossTimer=100}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[180f,0f,350f],LeftArm:[180f,0f,10f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=160}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[-20f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=170}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Ah man. It even broke the head... Dang unstable Java...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=180}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=270}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossJig,limit=1]
execute if entity @e[scores={BossLevel=185,BossTimer=270}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"You owe me $100.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=290}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f],RightArm:[300f,10f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=350}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[40f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=350}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=185,BossTimer=350}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"This never would have happened in Bedrock. I could have just used a Behaviour Pack!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=470}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=480}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Either way, time to pay up!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=580}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossFeylina,limit=1]
execute if entity @e[scores={BossLevel=185,BossTimer=590}] as @e[tag=BossJig] run data merge entity @s {HandItems:[{},{id:"minecraft:paper",Count:1b}],Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[300f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=600}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Will you take an I.O.U.?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=660}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=670}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Another one?! You already owe me for like 17 other times!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=770}] run data merge entity @e[tag=BossJig,limit=1] {HandItems:[{},{}],Pose:{Head:[0f,0f,0f,],RightArm:[325f,0f,30f],LeftArm:[320f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=770}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Hey. I'm trying to build a good credit score.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=850}] as @e[tag=BossJig] run data merge entity @s {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=860}] run data merge entity @e[tag=BossFeylina,limit=1] {HandItems:[{},{}],Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=860}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Maybe you just shouldn't make dumb bets against your wife.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=970}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=970}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Maybe...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=1050..1100}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=185,BossTimer=1050}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[300f,40f,30f],LeftArm:[300f,320f,330f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=1050}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Or maybe, we do another! Double or nothing!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=1100}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[300f,0f,50f],LeftArm:[300f,40f,300f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=1100}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"You can't bet on the same battle if the players already know the outcome!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=185,BossTimer=1130}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=185,BossTimer=1200}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=185,BossTimer=1200}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Maybe YOU can't!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=1250}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"What did you just say?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=185,BossTimer=1300}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Um... Nothing. Here. Have the wool. Yay.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=185,BossTimer=1300}] at @e[tag=BossJig] run playsound block.wool.step master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={BossLevel=185,BossTimer=1300}] run data merge entity @e[tag=BossJig,limit=1] {HandItems:[{id:"minecraft:black_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,-20f,10f]},DisabledSlots:1973790}
execute if entity @e[scores={BossLevel=185,BossTimer=1300..}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=185,BossTimer=1350}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=185,BossTimer=1350}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Oh boy...","color":"none","bold":false,"underlined":false}]



# CHOOSE STEVE
execute if entity @e[scores={BossLevel=160}] unless entity @e[tag=BossChicken] run scoreboard players set @e[tag=MainBossAEC] BossLevel 199
execute if entity @e[scores={BossLevel=160..}] unless entity @e[tag=BossChicken] run kill @e[tag=BossChickenAS]
scoreboard players set @e[scores={BossLevel=199}] BossTimer 0
scoreboard players set @e[scores={BossLevel=199}] BossLevel 200
execute if entity @e[scores={BossLevel=200,BossTimer=1}] run playsound entity.chicken.death master @a -1008 61 -951 1 1 0

execute if entity @e[scores={BossLevel=200,BossTimer=10}] run gamerule doTileDrops false
execute if entity @e[scores={BossLevel=200,BossTimer=10}] run fill -1028 80 -948 -1023 85 -943 air
execute if entity @e[scores={BossLevel=200,BossTimer=10}] run clone -1029 16 -949 -1022 23 -942 -1029 79 -949 masked
execute if entity @e[scores={BossLevel=200,BossTimer=1}] run kill @e[tag=BossNPC]
execute if entity @e[scores={BossLevel=200}] unless entity @e[tag=BossJig] run summon armor_stand -1025 80 -944 {CustomName:"{\"text\":\"Jigarbov\",\"color\":\"blue\"}",CustomNameVisible:false,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8421247}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:44975}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"0e696be4-b798-452e-921e-816330bc97a9",Properties:{textures:[{Signature:"L3/V5fd+uKro8fz+1wmU1QUSy4iWCh+XzDbHp8SnjO+12dX6FjqDOgoqJGnUatD7ufVy0s/ibWPAhlPzPOmEw3h6yNGpAYBs/49nQrewF+0PydEEcjleI+USzwhw/B3Cpslbpjkxy0N0aHsCA1JSd/PFUvJlf9g1l69GN9hN4FreeT9Q4S7Ki7UNWWIXpPtZtxSa6F1CGEGe3zn+jhZcoLULMCFP/mkccJTpnRAWc7CcSLsgSgyluc1ELbGYhAsK4NEx01Vc+waT95OXpV1S+TtK2hG9x5MolMhW/NcoPtRfSa0Ahl4fuAkSrXLxbF3Tc6YE6nQIcOnRPx5UJhByMcCPS2gzWbkB07YRqX0pIB+QsluI8tqLk+Gepy2bDMqcK/zk2xKhaUsDxJjQBkFStfoPZCFUrnpVuzuS7V2iB88GhTX8/VfUZfv41sqS40cwV/DIiCz6JNQveBh0qpsJ9e9aGIvmgVmVltAprTtnb+xirO6soZu/Ewm3O7fNBad7lS3D10UZ+h+WHI8mvZ2Rq12Tb5HL+Wlb2SPovAGk7s1+VFqFzyLhWC7Fb69w1hNoLEHl3pRIKpc/VFHNY341QMzPSJJStlCpWguc9LpdUPxlzhO3lZnxABHBIv+wS217fQ6CK/nPvgCdGQah4JZNdh0q6O4yr5W0n4edaKykMEs=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg5Nzc4MTQsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]},Name:"Jigarbov"}},Count:1b}],DisabledSlots:2039583,Tags:["BossJig","BossNPC"]}

execute if entity @e[scores={BossLevel=200}] unless entity @e[tag=BossFeylina] run summon armor_stand -1027 80 -944 {CustomName:"{\"text\":\"Feylina\",\"color\":\"light_purple\"}",CustomNameVisible:false,Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1905427}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13789922}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:28638}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"94fa3b51-f70c-48b0-8117-7076ae5ad3ea",Properties:{textures:[{Signature:"v+vckwJNAmJMcrCg38qshvIUQoyoglAw3lqzJlmkB921urbYn78unul9CGoMCh6Bb9NTTffSZeYCqrlFVbz0uODQuBREJRw+nGVa37urdvO85wg+WAUzh6xPBLSneMtQE219QTOvIkPJZzRx4XYxUVQuNaODyYnrviHWZKGGBV//E3MT263PHQVaBDIq6VVEoYlkwQg1RPZ+F3p28UCcxHv+z+UVqd0ocsFWRwBp1ZvpWNXR4sxV1k4NCcdugxucGhUCW0DioZKexhcXioq1VYb2OV2SV6iUT4LWrqK83UhoV9oC0BCDtqD9zX41we9yD+tq7XFLNvAodKbtSK/Ck/XG0FOKhX9qv+B0o2C0b/BqX0mDYHfnPsap4EiBIrb+dUbWa9A9L1lX8tVM5XFVAUQ+v5oQo20v0XL3wYKh6k6RfYiSV5BXbR0VM9rBFQSF30n10Qel+T1v+vjW1pRHDJeH3wuqoH1w/rZ+6Y+yLkiHkN9JYo1sTNwS5EOK0doleDpz7nBXokpzwm3lS+Z7WKDX+hOHQ8gsEQBfOlajXHEUx/0O9FlkBNHLTXEYCbhx4V07A/TrdtujE+tMLNfXJfa5O2yi7vxdYp15kzQTN0WhyhVd/ZxK/W1YmvCYNNLZHH8/TQKvBtuTSf2Yhes3K5iccOQaEsFUmdI74lypZeI=",Value:"eyJ0aW1lc3RhbXAiOjE1NDQ2NjI0NTA3NjQsInByb2ZpbGVJZCI6Ijk0ZmEzYjUxZjcwYzQ4YjA4MTE3NzA3NmFlNWFkM2VhIiwicHJvZmlsZU5hbWUiOiJGZXlsaW5hIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xM2I5OTNmY2ZkMzU3OWQzMDFkNWM3YmY3OThhM2MxZGRlYzFjZmM3MWVlZmFlNmRiMmU2YTI4MGQ5YWE4NjEzIn19fQ=="}]},Name:"Feylina"}},Count:1b}],DisabledSlots:2039583,Tags:["BossFeylina","BossNPC"]}

execute if entity @e[scores={BossLevel=200,BossTimer=50}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"YES!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=200,BossTimer=100}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Bummer...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=200,BossTimer=130}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Come on up!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=200,BossTimer=170..}] run fill -1025 55 -947 -1025 56 -947 air
execute if entity @e[scores={BossLevel=200,BossTimer=170}] run playsound block.piston.contract master @a -1026 55 -947 1 0.7 0.5
execute if entity @e[scores={BossLevel=200,BossTimer=174..}] if block -1026 56 -948 gray_concrete run fill -1026 52 -948 -1026 59 -948 clay replace redstone_block
execute if entity @e[scores={BossLevel=200,BossTimer=174}] run playsound block.piston.contract master @a -1026 55 -947 1 0.7 0.5

execute if entity @e[scores={BossLevel=200,BossTimer=200}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"You can get up here from the boots.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=200,BossTimer=300}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"They're not gonna know what boots you're talking about, you know.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=200,BossTimer=400}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"The big giant boots. The ones Steve is wearing. It's pretty obvious.","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={BossLevel=200,BossTimer=200..}] align x align y align z if entity @a[x=-1028,y=80,z=-948,dx=5,dy=5,dz=5] run scoreboard players set @e[tag=MainBossAEC] BossLevel 204
scoreboard players set @e[scores={BossLevel=204}] BossTimer 0
scoreboard players set @e[scores={BossLevel=204}] BossLevel 205

##{Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=0..260}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=205,BossTimer=1..150}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=205,BossTimer=50}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Thanks!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=205,BossTimer=50}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[280f,10f,0f],LeftArm:[0f,10f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=100}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"You just won me $100!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=205,BossTimer=100}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[180f,0f,350f],LeftArm:[180f,0f,10f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=150}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[40f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=205,BossTimer=170}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Ugh. I really thought you'd side with the chicken.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=180}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=270}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossFeylina,limit=1]
execute if entity @e[scores={BossLevel=205,BossTimer=270}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Doesn't matter! I won the bet. Pay up baby!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=290}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[300f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=350}] run data merge entity @e[tag=BossFeylina,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=370}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossJig,limit=1]
execute if entity @e[scores={BossLevel=205,BossTimer=380}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Fine. But just remember, when you bet against your wife, you always lose.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=400}] run data merge entity @e[tag=BossFeylina,limit=1] {HandItems:[{id:"minecraft:paper",Count:1b}],Pose:{Head:[0f,0f,0f],RightArm:[300f,10f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=480}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=520..544}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=205,BossTimer=545}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossFeylina,limit=1]
execute if entity @e[scores={BossLevel=205,BossTimer=550}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Um...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=600..644}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=205,BossTimer=645}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossFeylina,limit=1]
execute if entity @e[scores={BossLevel=205,BossTimer=650}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"I...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=670..695}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=205,BossTimer=690}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"You what? Choose your words wisely.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=765}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=BossFeylina,limit=1]
execute if entity @e[scores={BossLevel=205,BossTimer=770}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"I... love you?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=760}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[300f,40f,30f],LeftArm:[300f,320f,330f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=830}] run data merge entity @e[tag=BossFeylina,limit=1] {HandItems:[{},{}],Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}
execute if entity @e[scores={BossLevel=205,BossTimer=830}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Just give them the wool, you dork.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={BossLevel=205,BossTimer=870}] run data merge entity @e[tag=BossJig,limit=1] {Pose:{Head:[0f,0f,0f,],RightArm:[345f,0f,10f],LeftArm:[350f,0f,350f]}}

execute if entity @e[scores={BossLevel=205,BossTimer=910}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Yes, of course.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=205,BossTimer=920..}] as @e[tag=BossJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={BossLevel=205,BossTimer=950}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"blue","bold":false},{"text":"Here you go. Good job and stuff.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=205,BossTimer=950}] at @e[tag=BossJig] run playsound block.wool.step master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={BossLevel=205,BossTimer=950}] run data merge entity @e[tag=BossJig,limit=1] {HandItems:[{id:"minecraft:black_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,-20f,10f]},DisabledSlots:1973790}

execute if entity @e[scores={BossLevel=205,BossTimer=1000..}] as @e[tag=BossFeylina] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={BossLevel=205,BossTimer=1000}] run tellraw @a ["",{"text":"<Feylina> ","color":"light_purple","bold":false},{"text":"Congrats, Killer...","color":"none","bold":false,"underlined":false}]




# COMPLETE BRANCH
tag @a remove HasBlackWool
execute if entity @e[scores={BossLevel=185,BossTimer=1300..}] run tag @p[nbt={Inventory:[{id:"minecraft:black_wool"}]}] add HasBlackWool
execute if entity @e[scores={BossLevel=205,BossTimer=950..}] run tag @p[nbt={Inventory:[{id:"minecraft:black_wool"}]}] add HasBlackWool
execute if entity @p[tag=HasBlackWool] run clear @a
replaceitem entity @p[tag=HasBlackWool] weapon.mainhand black_wool
execute if entity @p[tag=HasBlackWool] run setblock -18 2 -18 clay
execute if entity @p[tag=HasBlackWool] run teleport @a -24 4 -31 0 -90

