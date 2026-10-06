####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 26 2018 / JUNE 29 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives add LaunchItem dummy


# STONE PICKAXE -> LEVEL 15
execute if entity @e[scores={BossLevel=..15}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:stone_pickaxe"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=..15}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 77 -962
execute if entity @e[scores={BossLevel=..15}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..15}] BossTimer 0
execute if entity @e[scores={BossLevel=..15}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..15}] BossLevel 20



# FOOD -> LEVEL 40 - 60
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=35}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=35}] BossTimer 0
execute if entity @e[scores={BossLevel=35}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=35}] BossLevel 40

execute if entity @e[scores={BossLevel=40,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=40}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=40}] BossTimer 0
execute if entity @e[scores={BossLevel=40}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=40}] BossLevel 45

execute if entity @e[scores={BossLevel=45,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=45}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=45}] BossTimer 0
execute if entity @e[scores={BossLevel=45}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=45}] BossLevel 50

execute if entity @e[scores={BossLevel=50,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=50}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=50}] BossTimer 0
execute if entity @e[scores={BossLevel=50}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=50}] BossLevel 55

execute if entity @e[scores={BossLevel=55,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=55}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=55}] BossTimer 0
execute if entity @e[scores={BossLevel=55}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=55}] BossLevel 60

execute if entity @e[scores={BossLevel=60,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]



# IRON PICKAXE -> LEVEL 70
execute if entity @e[scores={BossLevel=75}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:iron_pickaxe"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=75}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 77 -962
execute if entity @e[scores={BossLevel=75}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..75}] BossTimer 0
execute if entity @e[scores={BossLevel=75}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..75}] BossLevel 80



# FOOD 2 (OPTIONAL) -> LEVEL 85 - 110
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=85}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=85}] BossTimer 0
execute if entity @e[scores={BossLevel=85}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=85}] BossLevel 90

execute if entity @e[scores={BossLevel=90,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=90}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=90}] BossTimer 0
execute if entity @e[scores={BossLevel=90}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=90}] BossLevel 95

execute if entity @e[scores={BossLevel=95,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=95}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=95}] BossTimer 0
execute if entity @e[scores={BossLevel=95}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=95}] BossLevel 100

execute if entity @e[scores={BossLevel=100,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=100}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=100}] BossTimer 0
execute if entity @e[scores={BossLevel=100}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=100}] BossLevel 105

execute if entity @e[scores={BossLevel=105,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:cooked_porkchop"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:apple"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=105}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=105}] BossTimer 0
execute if entity @e[scores={BossLevel=105}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=105}] BossLevel 110

execute if entity @e[scores={BossLevel=110,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]


# MILK BUCKET
execute if entity @e[scores={BossLevel=130}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:milk_bucket"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=130}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={BossLevel=130}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=130}] BossTimer 0
execute if entity @e[scores={BossLevel=130}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=130}] BossLevel 135

execute if entity @e[scores={BossLevel=135,BossTimer=0}] align x align y align z run kill @e[scores={LaunchItem=1..},x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]


# DIAMOND PICKAXE -> LEVEL 140
execute if entity @e[scores={BossLevel=140}] run scoreboard players add @e[tag=LaunchItem,nbt={Item:{id:"minecraft:diamond_pickaxe"}}] LaunchItem 1
execute if entity @e[scores={BossLevel=140}] as @e[scores={LaunchItem=3..},limit=1,sort=nearest] at @s run teleport @s ^ ^ ^3 facing -1025 77 -962
execute if entity @e[scores={BossLevel=140}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..140}] BossTimer 0
execute if entity @e[scores={BossLevel=140}] align x align y align z if entity @e[scores={LaunchItem=1..},x=-1026,y=76,z=-963,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..140}] BossLevel 150









# UNIVERSAL LAUNCH COMMANDS
execute at @e[scores={LaunchItem=1}] run playsound enchant.thorns.hit master @a ~ ~ ~ 1 0.5 0
execute as @e[scores={LaunchItem=1}] run data merge entity @s {NoGravity:true}
execute as @e[scores={LaunchItem=1..}] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute as @e[scores={LaunchItem=3..}] run particle dust 1 0 0.3 1 ~ ~ ~ 0 0 0 0 0 force

execute if entity @e[scores={LaunchItem=3}] run fill -1016 62 -987 -1014 62 -985 orange_concrete replace red_concrete
execute unless entity @e[scores={LaunchItem=..10}] run fill -1016 62 -987 -1014 62 -985 red_concrete replace orange_concrete
