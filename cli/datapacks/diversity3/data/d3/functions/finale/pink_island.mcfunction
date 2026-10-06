####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 26 2019 / AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PinkIsland

execute if block 71 88 5297 air run setblock 71 88 5297 sponge



execute if block 7 6 110 clay run scoreboard objectives add PinkIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] PinkIsland 0

execute align x align y align z if entity @a[x=78,y=141,z=5316,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={PinkIsland=0}] PinkIsland 1000


# SET UP FOR WOOL DROP
scoreboard players set @e[scores={PinkIsland=570}] PinkIsland 1000
scoreboard players add @e[scores={PinkIsland=1000..}] PinkIsland 1


# WOOL DROPS
execute if entity @e[scores={PinkIsland=1002}] run setblock 7 6 110 pink_wool
execute if entity @e[scores={PinkIsland=1002}] align x align y align z as @a[x=78,y=141,z=5316,dx=2,dy=4,dz=0] run teleport @s 74 91 5328 90 0

execute if entity @e[scores={PinkIsland=1002}] run playsound entity.evoker.cast_spell master @a 58 89 5330 2 1 1
execute if entity @e[scores={PinkIsland=1002}] run playsound entity.ender_eye.death master @a 58 89 5330 2 0.5 1
execute if entity @e[scores={PinkIsland=1002}] run playsound entity.player.levelup master @a 58 89 5330 3 1 1

execute if entity @e[scores={PinkIsland=1002}] run kill @e[tag=RandomPinkWoolAEC]
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 57 89 5329 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 58 89 5329 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 59 89 5329 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 57 89 5330 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 58 89 5330 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 59 89 5330 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 57 89 5331 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 58 89 5331 {Tags:["RandomPinkWoolAEC"],Duration:200}
execute if entity @e[scores={PinkIsland=1002}] run summon area_effect_cloud 59 89 5331 {Tags:["RandomPinkWoolAEC"],Duration:200}

execute if entity @e[scores={PinkIsland=1002}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1007}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1012}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1017}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1022}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1027}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1032}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1037}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC
execute if entity @e[scores={PinkIsland=1042}] run tag @e[tag=RandomPinkWoolAEC,limit=1,sort=random] add ChosenPinkWoolAEC

execute if entity @e[scores={PinkIsland=1002..}] at @e[tag=ChosenPinkWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:pink_wool"},Tags:["FinaleWoolFB","PinkWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenPinkWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a

execute unless block 74 127 5298 iron_bars[south=true] run setblock 74 127 5298 iron_bars[south=true]

# COMPLETION
execute if entity @e[scores={PinkIsland=1002..}] if block 57 89 5329 pink_wool if block 58 89 5329 pink_wool if block 59 89 5329 pink_wool if block 57 89 5330 pink_wool if block 58 89 5330 pink_wool if block 59 89 5330 pink_wool if block 57 89 5331 pink_wool if block 58 89 5331 pink_wool if block 59 89 5331 pink_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={PinkIsland=1002..}] if block 57 89 5329 pink_wool if block 58 89 5329 pink_wool if block 59 89 5329 pink_wool if block 57 89 5330 pink_wool if block 58 89 5330 pink_wool if block 59 89 5330 pink_wool if block 57 89 5331 pink_wool if block 58 89 5331 pink_wool if block 59 89 5331 pink_wool run scoreboard objectives remove PinkIsland

