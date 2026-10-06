####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2019 / JULY 17 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BrownIsland

execute if block 3 6 110 clay run scoreboard objectives add BrownIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] BrownIsland 0


# SETS MAIN BLOCKS
execute if entity @e[scores={BrownIsland=..500}] run kill @e[tag=BrownFinaleMob]

execute if entity @e[scores={BrownIsland=0}] run fill -161 155 5041 -159 155 5043 air replace skeleton_wall_skull
execute if entity @e[scores={BrownIsland=0}] run fill -156 155 5041 -154 155 5043 air replace zombie_wall_head
execute if entity @e[scores={BrownIsland=0}] run fill -156 155 5046 -154 155 5048 snow[layers=1] replace wither_skeleton_wall_skull
execute if entity @e[scores={BrownIsland=0}] run fill -161 155 5046 -159 155 5048 air replace creeper_wall_head
execute if entity @e[scores={BrownIsland=0}] run fill -160 156 5042 -155 156 5047 air


execute if entity @e[scores={BrownIsland=0}] unless block -160 155 5042 lapis_block run setblock -160 155 5042 lapis_block
execute if entity @e[scores={BrownIsland=0}] unless block -155 155 5042 emerald_block run setblock -155 155 5042 emerald_block
execute if entity @e[scores={BrownIsland=0}] unless block -155 155 5047 gold_block run setblock -155 155 5047 gold_block
execute if entity @e[scores={BrownIsland=0}] unless block -160 155 5047 redstone_block run setblock -160 155 5047 redstone_block
execute if entity @e[scores={BrownIsland=0}] if block -160 155 5042 lapis_block if block -155 155 5042 emerald_block if block -155 155 5047 gold_block if block -160 155 5047 redstone_block run scoreboard players set @e[scores={BrownIsland=0}] BrownIsland 1


# SETS PULSE TICK
execute if entity @e[scores={BrownIsland=1}] unless block -161 149 5060 air run setblock -161 149 5060 air
execute if entity @e[scores={BrownIsland=1}] unless block -161 149 5061 redstone_lamp run setblock -161 149 5061 redstone_lamp[lit=true]
execute if entity @e[scores={BrownIsland=1}] if block -161 149 5060 air if block -161 149 5061 redstone_lamp run scoreboard players set @e[scores={BrownIsland=1}] BrownIsland 2


# CHEST COMMAND BLOCKS
execute unless block -173 140 5022 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 skeleton_skull{CanPlaceOn:[\"minecraft:lapis_block\"]}",TrackOutput:0b} run setblock -173 140 5022 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 skeleton_skull{CanPlaceOn:[\"minecraft:lapis_block\"]}",TrackOutput:0b}
data merge block -173 140 5022 {Command:"replaceitem block ~ ~2 ~ container.13 skeleton_skull{CanPlaceOn:[\"minecraft:lapis_block\"]}",TrackOutput:0b}

execute unless block -142 186 5027 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 zombie_head{CanPlaceOn:[\"minecraft:emerald_block\"]}",TrackOutput:0b} run setblock -142 186 5027 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 zombie_head{CanPlaceOn:[\"minecraft:emerald_block\"]}",TrackOutput:0b}
data merge block -142 186 5027 {Command:"replaceitem block ~ ~2 ~ container.13 zombie_head{CanPlaceOn:[\"minecraft:emerald_block\"]}",TrackOutput:0b}

execute unless block -142 137 5057 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 wither_skeleton_skull{CanPlaceOn:[\"minecraft:gold_block\"]}",TrackOutput:0b} run setblock -142 137 5057 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 wither_skeleton_skull{CanPlaceOn:[\"minecraft:gold_block\"]}",TrackOutput:0b}
data merge block -142 137 5057 {Command:"replaceitem block ~ ~2 ~ container.13 wither_skeleton_skull{CanPlaceOn:[\"minecraft:gold_block\"]}",TrackOutput:0b}

execute unless block -160 147 5061 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 creeper_head{CanPlaceOn:[\"minecraft:redstone_block\"]}",TrackOutput:0b} run setblock -160 147 5061 command_block[facing=up]{Command:"replaceitem block ~ ~2 ~ container.13 creeper_head{CanPlaceOn:[\"minecraft:redstone_block\"]}",TrackOutput:0b}
data merge block -160 147 5061 {Command:"replaceitem block ~ ~2 ~ container.13 creeper_head{CanPlaceOn:[\"minecraft:redstone_block\"]}",TrackOutput:0b}




# SKULLS ON BLOCKS
tag @e remove SkeletonSkull
execute if block -161 155 5042 skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add SkeletonSkull
execute if block -160 155 5041 skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add SkeletonSkull
execute if block -159 155 5042 skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add SkeletonSkull
execute if block -160 155 5043 skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add SkeletonSkull
execute if entity @e[tag=SkeletonSkull] run fill -161 155 5041 -159 155 5043 air replace skeleton_wall_skull
execute if entity @e[tag=SkeletonSkull] unless block -160 156 5042 skeleton_skull run setblock -160 156 5042 skeleton_skull[rotation=6]


tag @e remove ZombieHead
execute if block -156 155 5042 zombie_wall_head run tag @e[tag=MainFinaleAEC] add ZombieHead
execute if block -155 155 5041 zombie_wall_head run tag @e[tag=MainFinaleAEC] add ZombieHead
execute if block -154 155 5042 zombie_wall_head run tag @e[tag=MainFinaleAEC] add ZombieHead
execute if block -155 155 5043 zombie_wall_head run tag @e[tag=MainFinaleAEC] add ZombieHead
execute if entity @e[tag=ZombieHead] run fill -156 155 5041 -154 155 5043 air replace zombie_wall_head
execute if entity @e[tag=ZombieHead] unless block -155 156 5042 zombie_head run setblock -155 156 5042 zombie_head[rotation=10]


tag @e remove WitherSkeletonSkull
execute if block -156 155 5047 wither_skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add WitherSkeletonSkull
execute if block -155 155 5048 wither_skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add WitherSkeletonSkull
execute if block -154 155 5047 wither_skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add WitherSkeletonSkull
execute if block -155 155 5046 wither_skeleton_wall_skull run tag @e[tag=MainFinaleAEC] add WitherSkeletonSkull
execute if entity @e[tag=WitherSkeletonSkull] run fill -156 155 5046 -154 155 5048 snow[layers=1] replace wither_skeleton_wall_skull
execute if entity @e[tag=WitherSkeletonSkull] unless block -155 156 5047 wither_skeleton_skull run setblock -155 156 5047 wither_skeleton_skull[rotation=14]


tag @e remove CreeperHead
execute if block -161 155 5047 creeper_wall_head run tag @e[tag=MainFinaleAEC] add CreeperHead
execute if block -160 155 5048 creeper_wall_head run tag @e[tag=MainFinaleAEC] add CreeperHead
execute if block -159 155 5047 creeper_wall_head run tag @e[tag=MainFinaleAEC] add CreeperHead
execute if block -160 155 5046 creeper_wall_head run tag @e[tag=MainFinaleAEC] add CreeperHead
execute if entity @e[tag=CreeperHead] run fill -161 155 5046 -159 155 5048 air replace creeper_wall_head
execute if entity @e[tag=CreeperHead] unless block -160 156 5047 creeper_head run setblock -160 156 5047 creeper_head[rotation=2]


# CHECK FOR SKULLS
execute if block -160 156 5042 skeleton_skull if block -155 156 5042 zombie_head if block -155 156 5047 wither_skeleton_skull if block -160 156 5047 creeper_head run scoreboard players set @e[scores={BrownIsland=2}] BrownIsland 500


# MOBS SPAWN
scoreboard players add @e[scores={BrownIsland=500..599}] BrownIsland 1
execute if entity @e[scores={BrownIsland=515}] run playsound ambient.cave master @a -158 155 5044

execute if entity @e[scores={BrownIsland=570}] run playsound entity.illusioner.prepare_blindness master @a -158 155 5044 1 1 1
execute if entity @e[scores={BrownIsland=570}] run playsound entity.dragon_fireball.explode master @a -158 155 5044 0.6 0.5 0.6
execute if entity @e[scores={BrownIsland=570}] run playsound entity.evoker.prepare_summon master @a -158 155 5044 1 0.7 1
execute if entity @e[scores={BrownIsland=570}] run playsound entity.illusioner.prepare_blindness master @a -158 155 5044 1 0.7 1

execute if entity @e[scores={BrownIsland=570}] run fill -160 155 5042 -160 156 5042 air
execute if entity @e[scores={BrownIsland=570}] run fill -155 155 5042 -155 156 5042 air
execute if entity @e[scores={BrownIsland=570}] run setblock -155 156 5047 air
execute if entity @e[scores={BrownIsland=570}] run setblock -155 155 5047 snow[layers=1]
execute if entity @e[scores={BrownIsland=570}] run fill -160 155 5047 -160 156 5047 air

execute if entity @e[scores={BrownIsland=570}] run particle cloud -160 155 5042 0.5 0.5 0.5 0 70
execute if entity @e[scores={BrownIsland=571}] run summon skeleton -160 155 5042 {NoAI:0b,Health:0.5f,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["BrownSkeleton","BrownFinaleMob"],Rotation:[335f,0f]}

execute if entity @e[scores={BrownIsland=570}] run particle cloud -155 155 5042 0.5 0.5 0.5 0 70
execute if entity @e[scores={BrownIsland=571}] run summon zombie -155 155 5042 {NoAI:0b,Health:0.5f,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["BrownZombie","BrownFinaleMob"],Rotation:[45f,0f]}

execute if entity @e[scores={BrownIsland=570}] run particle cloud -155 155 5047 0.5 0.5 0.5 0 70
execute if entity @e[scores={BrownIsland=571}] run summon wither_skeleton -155 155 5047 {NoAI:0b,Health:0.5f,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["BrownWitherSkeleton","BrownFinaleMob"],Rotation:[115f,0f]}

execute if entity @e[scores={BrownIsland=570}] run particle cloud -160 155 5047 0.5 0.5 0.5 0 70
execute if entity @e[scores={BrownIsland=571}] run summon creeper -160 155 5047 {NoAI:0b,Health:0.5f,Tags:["BrownCreeper","BrownFinaleMob"],Rotation:[215f,0f]}





# SET UP FOR WOOL DROP
execute if entity @e[scores={BrownIsland=600}] unless entity @e[tag=BrownFinaleMob] run scoreboard players set @e[scores={BrownIsland=600}] BrownIsland 1000
scoreboard players add @e[scores={BrownIsland=1000..}] BrownIsland 1

execute if entity @e[scores={BrownIsland=1000..}] run effect clear @a wither

# WOOL DROPS
execute if entity @e[scores={BrownIsland=1002}] run setblock 3 6 110 brown_wool

execute if entity @e[scores={BrownIsland=1002}] run playsound entity.evoker.cast_spell master @a -154 156 5011 2 1 1
execute if entity @e[scores={BrownIsland=1002}] run playsound entity.ender_eye.death master @a -154 156 5011 2 0.5 1
execute if entity @e[scores={BrownIsland=1002}] run playsound entity.player.levelup master @a -154 156 5011 3 1 1

execute if entity @e[scores={BrownIsland=1002}] run kill @e[tag=RandomBrownWoolAEC]
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -155 156 5010 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -154 156 5010 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -153 156 5010 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -155 156 5011 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -154 156 5011 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -153 156 5011 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -155 156 5012 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -154 156 5012 {Tags:["RandomBrownWoolAEC"],Duration:200}
execute if entity @e[scores={BrownIsland=1002}] run summon area_effect_cloud -153 156 5012 {Tags:["RandomBrownWoolAEC"],Duration:200}

execute if entity @e[scores={BrownIsland=1002}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1007}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1012}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1017}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1022}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1027}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1032}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1037}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC
execute if entity @e[scores={BrownIsland=1042}] run tag @e[tag=RandomBrownWoolAEC,limit=1,sort=random] add ChosenBrownWoolAEC

execute if entity @e[scores={BrownIsland=1002..}] at @e[tag=ChosenBrownWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:brown_wool"},Tags:["FinaleWoolFB","BrownWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenBrownWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={BrownIsland=1002..}] if block -155 156 5010 brown_wool if block -154 156 5010 brown_wool if block -153 156 5010 brown_wool if block -155 156 5011 brown_wool if block -154 156 5011 brown_wool if block -153 156 5011 brown_wool if block -155 156 5012 brown_wool if block -154 156 5012 brown_wool if block -153 156 5012 brown_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={BrownIsland=1002..}] if block -155 156 5010 brown_wool if block -154 156 5010 brown_wool if block -153 156 5010 brown_wool if block -155 156 5011 brown_wool if block -154 156 5011 brown_wool if block -153 156 5011 brown_wool if block -155 156 5012 brown_wool if block -154 156 5012 brown_wool if block -153 156 5012 brown_wool run scoreboard objectives remove BrownIsland

