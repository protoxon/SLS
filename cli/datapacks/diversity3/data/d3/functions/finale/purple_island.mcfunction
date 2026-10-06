####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2018 / MARCH 4 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PurpleIsland

execute if block 5 6 110 clay run scoreboard objectives add PurpleIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] PurpleIsland 0

#execute align x align y align z as @a[x=-140,y=105,z=5198,dx=8,dy=0,dz=8] at @s if block ~ ~-1 ~ purple_concrete run scoreboard players set @e[scores={PurpleIsland=0}] PurpleIsland 1000
execute if block -136 106 5199 stone_button[powered=true] run scoreboard players set @e[scores={PurpleIsland=0}] PurpleIsland 1000

# SET UP FOR WOOL DROP
scoreboard players add @e[scores={PurpleIsland=1000..}] PurpleIsland 1


# WOOL DROPS
execute if entity @e[scores={PurpleIsland=1002}] run setblock 5 6 110 purple_wool

execute if entity @e[scores={PurpleIsland=1002}] run playsound entity.evoker.cast_spell master @a -136 107 5188 1 1 1
execute if entity @e[scores={PurpleIsland=1002}] run playsound entity.ender_eye.death master @a -136 107 5188 1 0.5 1
execute if entity @e[scores={PurpleIsland=1002}] run playsound entity.player.levelup master @a -136 107 5188 1 1 1

execute if entity @e[scores={PurpleIsland=1002}] run kill @e[tag=RandomPurpleWoolAEC]
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -137 107 5187 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -136 107 5187 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -135 107 5187 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -137 107 5188 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -136 107 5188 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -135 107 5188 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -137 107 5189 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -136 107 5189 {Tags:["RandomPurpleWoolAEC"],Duration:200}
execute if entity @e[scores={PurpleIsland=1002}] run summon area_effect_cloud -135 107 5189 {Tags:["RandomPurpleWoolAEC"],Duration:200}

execute if entity @e[scores={PurpleIsland=1002}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1007}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1012}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1017}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1022}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1027}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1032}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1037}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC
execute if entity @e[scores={PurpleIsland=1042}] run tag @e[tag=RandomPurpleWoolAEC,limit=1,sort=random] add ChosenPurpleWoolAEC

execute if entity @e[scores={PurpleIsland=1002..}] at @e[tag=ChosenPurpleWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:purple_wool"},Tags:["FinaleWoolFB","PurpleWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenPurpleWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={PurpleIsland=1002..}] if block -137 107 5187 purple_wool if block -136 107 5187 purple_wool if block -135 107 5187 purple_wool if block -137 107 5188 purple_wool if block -136 107 5188 purple_wool if block -135 107 5188 purple_wool if block -137 107 5189 purple_wool if block -136 107 5189 purple_wool if block -135 107 5189 purple_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={PurpleIsland=1002..}] if block -137 107 5187 purple_wool if block -136 107 5187 purple_wool if block -135 107 5187 purple_wool if block -137 107 5188 purple_wool if block -136 107 5188 purple_wool if block -135 107 5188 purple_wool if block -137 107 5189 purple_wool if block -136 107 5189 purple_wool if block -135 107 5189 purple_wool run scoreboard objectives remove PurpleIsland

