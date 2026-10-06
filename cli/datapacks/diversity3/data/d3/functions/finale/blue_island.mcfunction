####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlueIsland

execute if block 4 6 110 clay run scoreboard objectives add BlueIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] BlueIsland 0

# SETUP BLOCKS
execute if entity @e[scores={BlueIsland=0}] unless blocks -159 137 5127 -159 137 5127 -159 139 5127 all run data merge block -159 139 5127 {Items:[]}
execute if entity @e[scores={BlueIsland=0}] if block -157 143 5124 clay run setblock -157 143 5124 redstone_block
execute if block -157 143 5124 redstone_block if blocks -159 137 5127 -159 137 5127 -159 139 5127 all run scoreboard players set @e[scores={BlueIsland=0}] BlueIsland 1


# BUTTON
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_13","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_cat","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_blocks","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_chirp","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_far","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_mall","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_mellohi","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_stal","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_strad","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_ward","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_11","BlueDiscAEC"],Duration:1}
execute if block -159 139 5121 stone_button[powered=true] run summon area_effect_cloud -160 139 5120 {Tags:["BlueDisc_wait","BlueDiscAEC"],Duration:1}

execute if block -159 139 5121 stone_button[powered=true] run kill @e[tag=BlueDiscAEC,sort=random,limit=11]
execute if entity @e[tag=BlueDisc_13] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_13",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Cod of War\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_cat] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_cat",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Sheep of Thieves\",\"italic\":\"false\",\"color\":\"green\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_blocks] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_blocks",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Dispenser: Become Mooshroom\",\"italic\":\"false\",\"color\":\"gold\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_chirp] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_chirp",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Redstone Redemption\",\"italic\":\"false\",\"color\":\"red\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_far] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_far",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Super Splash Potions Ultimate\",\"italic\":\"false\",\"color\":\"green\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_mall] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_mall",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Darkspiders III\",\"italic\":\"false\",\"color\":\"dark_purple\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_mellohi] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_mellohi",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Shadow of the Spruce Breaker\",\"italic\":\"false\",\"color\":\"light_purple\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_stal] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_stal",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Tripwyr\",\"italic\":\"false\",\"color\":\"dark_gray\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_strad] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_strad",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"FrostwalkerPunk\",\"italic\":\"false\",\"color\":\"white\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_ward] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_ward",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Blocktopath Graveler\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_11] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_11",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Slimeball Out 76\",\"italic\":\"false\",\"color\":\"dark_gray\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if entity @e[tag=BlueDisc_wait] run summon item -159.5 139.5 5120.5 {Item:{id:"minecraft:music_disc_wait",Count:1b,tag:{HideFlags:34,display:{Name:"{\"text\":\"Cave Spider Man\",\"italic\":\"false\",\"color\":\"blue\",\"bold\":\"false\"}"}}},PickupDelay:30,Motion:[-0.1d,0.1d,0.0d]}

execute if block -159 139 5121 stone_button[powered=true] run kill @e[tag=BlueDiscAEC]
execute if block -159 139 5121 stone_button[powered=true] run setblock -159 139 5121 stone_button[face=wall,facing=south,powered=false]





# CHECKS DROPPER
execute if block -159 139 5127 dropper unless blocks -159 137 5127 -159 137 5127 -159 139 5127 all run scoreboard players set @e[scores={BlueIsland=1}] BlueIsland 1000


# SET UP FOR WOOL DROP
scoreboard players add @e[scores={BlueIsland=1000..}] BlueIsland 1


# WOOL DROPS
execute if entity @e[scores={BlueIsland=1002}] run setblock 4 6 110 blue_wool
execute if entity @e[scores={BlueIsland=1002}] run setblock -157 143 5124 clay

execute if entity @e[scores={BlueIsland=1002}] run playsound entity.evoker.cast_spell master @a -154 139 5114 2 1 1
execute if entity @e[scores={BlueIsland=1002}] run playsound entity.ender_eye.death master @a -154 139 5114 2 0.5 1
execute if entity @e[scores={BlueIsland=1002}] run playsound entity.player.levelup master @a -154 139 5114 3 1 1

execute if entity @e[scores={BlueIsland=1002}] run kill @e[tag=RandomBlueWoolAEC]
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -155 139 5113 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -154 139 5113 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -153 139 5113 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -155 139 5114 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -154 139 5114 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -153 139 5114 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -155 139 5115 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -154 139 5115 {Tags:["RandomBlueWoolAEC"],Duration:200}
execute if entity @e[scores={BlueIsland=1002}] run summon area_effect_cloud -153 139 5115 {Tags:["RandomBlueWoolAEC"],Duration:200}

execute if entity @e[scores={BlueIsland=1002}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1007}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1012}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1017}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1022}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1027}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1032}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1037}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC
execute if entity @e[scores={BlueIsland=1042}] run tag @e[tag=RandomBlueWoolAEC,limit=1,sort=random] add ChosenBlueWoolAEC

execute if entity @e[scores={BlueIsland=1002..}] at @e[tag=ChosenBlueWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:blue_wool"},Tags:["FinaleWoolFB","BlueWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenBlueWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={BlueIsland=1002..}] if block -155 139 5113 blue_wool if block -154 139 5113 blue_wool if block -153 139 5113 blue_wool if block -155 139 5114 blue_wool if block -154 139 5114 blue_wool if block -153 139 5114 blue_wool if block -155 139 5115 blue_wool if block -154 139 5115 blue_wool if block -153 139 5115 blue_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={BlueIsland=1002..}] if block -155 139 5113 blue_wool if block -154 139 5113 blue_wool if block -153 139 5113 blue_wool if block -155 139 5114 blue_wool if block -154 139 5114 blue_wool if block -153 139 5114 blue_wool if block -155 139 5115 blue_wool if block -154 139 5115 blue_wool if block -153 139 5115 blue_wool run scoreboard objectives remove BlueIsland

