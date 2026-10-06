####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 9 2019 / SEPTEMBER 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard players add @e[scores={ElytraEnd=0..99}] ElytraEnd 1
scoreboard players add @e[scores={ElytraEnd=101..399}] ElytraEnd 1
execute if entity @e[scores={ElytraEnd=1..}] at @e[tag=ElytraAndesite] run particle block andesite ~ ~0.5 ~ 0.1 1 0.1 1 1 force
execute if entity @e[scores={ElytraEnd=1..}] at @e[tag=ElytraAndesite] run particle cloud ~ ~0.5 ~ 0.1 1 0.1 0 1 force
execute if entity @e[scores={ElytraEnd=1..50}] at @e[tag=ElytraAndesite] run playsound block.chorus_flower.grow master @a ~ ~ ~ 0.7 0.5 0
execute if entity @e[scores={ElytraEnd=99}] run setblock -1800 222 2002 air
execute if entity @e[scores={ElytraEnd=99}] run playsound entity.shulker.shoot master @a -1800 222 2002 3 1 1
execute if entity @e[scores={ElytraEnd=99}] run playsound block.stone.break block @a -1800 222 2002 3 1 1
execute if entity @e[scores={ElytraEnd=99}] as @e[tag=ElytraAndesite] run data merge entity @s {NoGravity:0b,Motion:[0.0d,0.9d,0.0d]}
execute if entity @e[scores={ElytraEnd=99}] run spawnpoint @a -1800 223 2000

execute if entity @e[scores={ElytraEnd=99}] run tag @a remove WhiteRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove YellowRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove PurpleRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove PurpleRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove GreenRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove BlueRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove LimeRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove BlackRing
execute if entity @e[scores={ElytraEnd=99}] run tag @a remove BrownRing


execute unless block -1800 27 2002 air run setblock -1800 27 2002 air


execute align x align y align z if entity @a[x=-1793,y=92,z=2043,dx=0,dy=0,dz=0] unless entity @e[tag=ElytraTV] run summon painting -1800 91 2048 {Facing:2b,Invulnerable:1b,Motive:"minecraft:skeleton",Tags:["ElytraTV"]}

execute if entity @e[scores={ElytraEnd=..100}] run kill @e[tag=ElytraRender]

execute align x align y align z if entity @a[x=-1807,y=90,z=2044,dx=2,dy=2,dz=2] unless entity @e[tag=ElytraRender] run summon armor_stand -1804.5 90.35 2046.7 {Tags:["ElytraRender"],Invulnerable:true,Rotation:[180.0f,0.0f],CustomName:"{\"text\":\"renderXR\",\"color\":\"dark_purple\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6929734}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6044718}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4415092}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1c361569-6b3e-4ab0-b27f-b9f0df43f336",Properties:{textures:[{Signature:"JLxMr+0q/SVVJOwnNZf8NHOeeHXJ7CFPAS46QG5nHGL6t9qXxAThGVi5hVFILC/ZacuN1CFnkMU4pmv66echLDqfEk6qOEoI33p5o3+w9DFj9yv7Gc/D7UrS08FiWUAkMnSoBaT1eLU7MrawnBpaUqc8727fh63TX+3kjGjSGmwPb9XU5RoEEPUvRkaOq1csimujkU5Bpj4oyb3AeQBsZUe8V4G6lus2jL15w3nYPbG737XQm4LHPo2r6/4kIB6YdDSxc4dgI16CG9HXiV5SAKEbHmJtx9W/o+uVZCQsvY68gexZhgq3oU9Gy6R6dJz/C7Y+7hDkzQXiTnM5XxmVGyHzQzWzR5jwSYmPScqnOCRqo5C5xTVWHTHVRmVbpbUmc9pe2fMBkCXUF/Hmm//U3b5TIjjPRaMbI2zM9I4vNquAXlPSx44vY9Yn3A/XjGPngSh94Xgu9tiNTilZz0fdJS7rtUdxM/ZpfxK8L8q0kiNhlnNnK53e6ld2zRZxjhy7kF0f/Lz1nbVdLm1lmMnCVk2e08Kmd2HGglROXhBb+qvx539MdoE8byCj4/rrQGI/bdiVzaGnSD2i4rTQ06VBYhoz5UVnj4F+4oqk6gDzARwXKBU9TwsX2eKSnrMyEPY4eNGy61OZn0dmSM/ymnN9uB9o4h2vXpL2DkK4Pl/Lh+I=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkxMDAyMjEsInByb2ZpbGVJZCI6IjFjMzYxNTY5NmIzZTRhYjBiMjdmYjlmMGRmNDNmMzM2IiwicHJvZmlsZU5hbWUiOiJyZW5kZXJYUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmMyNzZhZTZiMGY3YjQxMGI0NjZmNmIyZTk2MmU1MWNlMzk2ODRhYTM0YjUyOTQ0MDE4MWM1MjYyY2RmMWM4ZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"renderXR"}},Count:1b}],Pose:{RightArm:[340f,10f,0f],LeftArm:[340f,350f,0f],RightLeg:[270f,10f,0f],LeftLeg:[270f,345f,0f],Body:[0f,0f,0f]},DisabledSlots:2039583}

execute align x align y align z if entity @a[x=-1807,y=90,z=2044,dx=2,dy=2,dz=2] as @e[tag=ElytraRender] at @s run teleport @s ^ ^ ^ facing entity @p[x=-1807,y=90,z=2044,dx=2,dy=2,dz=2]

execute align x align y align z if entity @a[x=-1807,y=90,z=2044,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={ElytraEnd=100}] ElytraEnd 101

execute if entity @e[scores={ElytraEnd=101}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"Oh!","color":"none","bold":false,"italic":false}]
execute if entity @e[scores={ElytraEnd=151}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"Um...","color":"none","bold":false,"italic":false}]
execute if entity @e[scores={ElytraEnd=201}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"I didn't expect you yet...","color":"none","bold":false,"italic":false}]
execute if entity @e[scores={ElytraEnd=321}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"Um, here.","color":"none","bold":false,"italic":false}]
execute if entity @e[scores={ElytraEnd=391}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"You can go now.","color":"none","bold":false,"italic":false}]


# COMPLETE BRANCH
execute if entity @e[scores={ElytraEnd=341}] at @e[tag=ElytraRender] run playsound block.wool.step master @a ~ ~ ~ 1 1.3 0
execute if entity @e[scores={ElytraEnd=341..}] as @e[tag=ElytraRender] run data merge entity @s {HandItems:[{id:"minecraft:purple_wool",Count:1b}],DisabledSlots:1973790,Pose:{RightArm:[300f,-20f,10f]}}

tag @a remove HasPurpleWool
execute if entity @e[scores={ElytraEnd=341..}] run tag @p[nbt={Inventory:[{id:"minecraft:purple_wool"}]}] add HasPurpleWool
execute if entity @p[tag=HasPurpleWool] run clear @a
replaceitem entity @p[tag=HasPurpleWool] weapon.mainhand purple_wool
execute if entity @p[tag=HasPurpleWool] run setblock -20 1 78 purple_concrete_powder
execute if entity @p[tag=HasPurpleWool] run setblock -18 2 78 clay
execute if entity @p[tag=HasPurpleWool] run teleport @a -24 4 65 0 -90
