####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 26 2018 / NOVEMBER 28 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives add LaunchItem dummy


# STONE PICKAXE -> LEVEL 15
execute unless entity @e[tag=LaunchItem] align 



execute if entity @e[scores={BossLevel=..15}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:stone_pickaxe"}}] LaunchItem 1


execute at @e[scores={LaunchItem=1}] run playsound enchant.thorns.hit master @a ~ ~ ~ 1 0.5 0

execute if entity @e[scores={LaunchItem=3}] run fill -1016 62 -987 -1014 62 -985 orange_concrete replace red_concrete
execute unless entity @e[scores={LaunchItem=..10}] run fill -1016 62 -987 -1014 62 -985 red_concrete replace orange_concrete

execute as @e[scores={LaunchItem=1}] run data merge entity @s {NoGravity:true}
execute as @e[scores={LaunchItem=1..}] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute as @e[scores={LaunchItem=3..}] at @s run teleport @s ^ ^ ^3 facing -1025 77 -962

execute align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..15}] BossTimer 0
execute align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..15}] BossLevel 20



# FOOD -> LEVEL 35
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1