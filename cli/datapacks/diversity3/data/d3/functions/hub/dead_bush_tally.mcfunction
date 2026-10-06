####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar TallyBushes
#scoreboard objectives setdisplay sidebar BushTotal

execute if entity @e[scores={TallyBushes=50}] run setblock 12 11 14 redstone_block
execute if entity @e[scores={TallyBushes=100}] run setblock 12 11 14 clay
execute if entity @e[scores={TallyBushes=100}] run scoreboard objectives add BushTotal dummy
execute if block 12 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 11 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 10 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 9 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 8 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 7 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 6 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 5 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 4 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 3 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 2 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1
execute if block 1 3 46 potted_dead_bush run scoreboard players add @e[tag=MainHubAEC] BushTotal 1

#execute if entity @e[scores={BushTotal=1..}] run advancement grant @a only d3:folder_c/secret_branch_item
execute if entity @e[scores={BushTotal=1}] run tellraw @a {"text":"","extra":[{"text":">> 1/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=2}] run tellraw @a {"text":"","extra":[{"text":">> 2/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=3}] run tellraw @a {"text":"","extra":[{"text":">> 3/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=4}] run tellraw @a {"text":"","extra":[{"text":">> 4/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=5}] run tellraw @a {"text":"","extra":[{"text":">> 5/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=6}] run tellraw @a {"text":"","extra":[{"text":">> 6/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=7}] run tellraw @a {"text":"","extra":[{"text":">> 7/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=8}] run tellraw @a {"text":"","extra":[{"text":">> 8/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=9}] run tellraw @a {"text":"","extra":[{"text":">> 9/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=10}] run tellraw @a {"text":"","extra":[{"text":">> 10/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=11}] run tellraw @a {"text":"","extra":[{"text":">> 11/12 Shecret Weapons Collected! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=12}] run tellraw @a {"text":"","extra":[{"text":">> All 12 Shecret Weapons Collected! You've unlocked the fountain grate! <<","color":"dark_green","bold":"true"}]}
execute if entity @e[scores={BushTotal=12}] run fill -5 90 1031 -5 90 1031 iron_trapdoor[facing=north,open=true,waterlogged=true] replace iron_trapdoor[open=false]
execute if entity @e[scores={BushTotal=12}] run fill -5 90 1035 -5 90 1035 iron_trapdoor[facing=south,open=true,waterlogged=true] replace iron_trapdoor[open=false]
execute if entity @e[scores={BushTotal=12}] run playsound entity.player.splash.highspeed ambient @a -5 90 1033 1 1 0
execute if entity @e[scores={BushTotal=12}] run playsound block.iron_trapdoor.open master @a -5 90 1033 2 1 1
execute if entity @e[scores={BushTotal=12}] run kill @e[tag=Birdie]
execute if entity @e[scores={BushTotal=12}] run summon chicken -5 91 1033 {CustomName:"{\"text\":\"Birdie\",\"color\":\"dark_green\"}",Age:-2147483648,Tags:["Birdie"],Rotation:[270f,0f]}
execute if entity @e[scores={BushTotal=12}] run particle dolphin -5 91.8 1033 0.3 0.3 1 1 1500 force
execute if entity @e[scores={TallyBushes=100..}] run scoreboard objectives remove BushTotal
execute if entity @e[scores={TallyBushes=100..}] run scoreboard objectives remove TallyBushes