####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PuzzleAccess

# PUZZLE ACCESS -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE
execute at @e[tag=PuzzleHubAS] if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard objectives add PuzzleAccess dummy

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 1
execute as @e[scores={PuzzleAccess=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}
execute as @e[scores={PuzzleAccess=1}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=1}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 2
execute as @e[scores={PuzzleAccess=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}
execute as @e[scores={PuzzleAccess=2}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=2}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 3
execute as @e[scores={PuzzleAccess=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}
execute as @e[scores={PuzzleAccess=3}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=3}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 4
execute as @e[scores={PuzzleAccess=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}
execute as @e[scores={PuzzleAccess=4}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=4}] run scoreboard objectives remove PuzzleAccess

execute as @e[tag=PuzzleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] at @s if block ~ ~1 ~-1 jungle_button[powered=true] run scoreboard players set @s PuzzleAccess 5
execute as @e[scores={PuzzleAccess=5}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}
execute as @e[scores={PuzzleAccess=5}] at @s run setblock ~ ~1 ~-1 jungle_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={PuzzleAccess=5}] run scoreboard objectives remove PuzzleAccess

execute if entity @e[tag=BlackHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] if entity @e[tag=PurpleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] if entity @e[tag=WhiteHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] if entity @e[tag=LightBlueHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] if entity @e[tag=OrangeHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] if block 58 85 1021 jungle_button run scoreboard objectives add PuzzleBridge dummy

execute if entity @e[tag=BlackHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:coal",Count:1b}]}] if entity @e[tag=PurpleHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:popped_chorus_fruit",Count:1b}]}] if entity @e[tag=WhiteHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:snowball",Count:1b}]}] if entity @e[tag=LightBlueHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:tube_coral",Count:1b}]}] if entity @e[tag=OrangeHubAS,nbt={ArmorItems:[{},{},{},{id:"minecraft:carrot",Count:1b}]}] run fill 58 85 1021 62 85 1021 structure_void replace jungle_button

scoreboard players add @e[tag=MainHubAEC] PuzzleBridge 1
execute if entity @e[scores={PuzzleBridge=0..}] run function d3:hub/access_red/build_piston_bridge