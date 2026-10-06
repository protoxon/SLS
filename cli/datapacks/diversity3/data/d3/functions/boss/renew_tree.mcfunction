####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 25 2018 / NOVEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# TREE DIES
execute if entity @e[scores={KillTree=100}] run fill -996 66 -982 -994 68 -980 air replace oak_leaves
execute if entity @e[scores={KillTree=100}] run fill -997 66 -983 -993 69 -979 air destroy
execute if entity @e[scores={KillTree=100}] run summon item -995 68 -981 {Item:{id:"minecraft:oak_sapling",Count:1b}}
execute as @e[type=item,nbt={Item:{id:"minecraft:oak_sapling"}},nbt=!{Item:{tag:{CanPlaceOn:["minecraft:dirt"]}}}] run data merge entity @s {Item:{tag:{CanPlaceOn:["minecraft:dirt"]}}}


execute if block -995 63 -981 oak_sapling run scoreboard players set @e[scores={KillTree=101}] KillTree 200
scoreboard players add @e[scores={KillTree=200..}] KillTree 1

# REGROW TREE
execute if entity @e[scores={KillTree=300}] run setblock -995 63 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run setblock -995 64 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run setblock -995 65 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run setblock -995 66 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run setblock -995 67 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run setblock -995 68 -981 oak_log[axis=y]
execute if entity @e[scores={KillTree=300}] run fill -997 66 -982 -997 67 -980 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -996 66 -983 -994 67 -979 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -993 66 -983 -993 66 -979 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -993 67 -982 -993 67 -980 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -995 68 -982 -994 68 -980 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -996 68 -981 -994 69 -981 oak_leaves[persistent=true] replace air
execute if entity @e[scores={KillTree=300}] run fill -995 68 -982 -995 69 -980 oak_leaves[persistent=true] replace air

execute unless block -995 68 -981 air run scoreboard objectives remove KillTree