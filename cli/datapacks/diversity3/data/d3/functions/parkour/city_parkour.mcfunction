####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JUNE 1 2018 / JULY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


execute as @a at @s if block ~ ~ ~ rail run effect give @s levitation 1
execute as @a at @s if block ~ ~-1 ~ rail run effect give @s levitation 1
execute if block 854 132 -1121 oak_trapdoor run setblock 854 132 -1121 spruce_trapdoor[half=bottom,open=false]
execute if block 855 132 -1121 oak_trapdoor run setblock 855 132 -1121 spruce_trapdoor[half=bottom,open=false]

# TOO LAZY TO FIX ON MASTER
execute unless block 854 130 -1113 cobblestone_stairs run setblock 854 130 -1113 cobblestone_stairs[facing=north,half=top]
execute unless block 852 130 -1114 cobblestone_stairs run setblock 852 130 -1114 cobblestone_stairs[facing=east,half=top]
execute unless block 852 130 -1121 cobblestone_stairs run setblock 852 130 -1121 cobblestone_stairs[facing=east,half=top]
execute unless block 855 130 -1124 cobblestone_stairs run setblock 855 130 -1124 cobblestone_stairs[facing=south,half=top]

execute unless block 860 173 -1132 cobweb run setblock 860 173 -1132 cobweb
execute unless block 862 139 -1130 cobweb run setblock 862 139 -1130 cobweb
execute unless block 860 153 -1132 cobweb run setblock 860 153 -1132 cobweb


execute unless entity @e[tag=RooftopSWinxy] run summon armor_stand 855 131 -1122 {NoGravity:1b,Invulnerable:1b,ShowArms:1b,DisabledSlots:2039583,Pose:{Head:[0.0f,0.0f,0.0f],RightArm:[0.0f,0.0f,10.0f],LeftArm:[0.0f,0.0f,350.0f],RightLeg:[0.0f,5.0f,1.0f],LeftLeg:[0.0f,355.0f,359.0f]},Rotation:[180.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:player_head",Count:1b}],NoBasePlate:1b,Tags:["RooftopSWinxy"]}

execute align xyz if entity @a[x=851,y=131,z=-1140,dx=6,dy=4,dz=20] as @e[tag=RooftopSWinxy] at @s run teleport @s ^ ^ ^ facing entity @p
execute align xyz unless entity @a[x=851,y=131,z=-1140,dx=6,dy=4,dz=20] as @e[tag=RooftopSWinxy,nbt=!{Rotation:[180.0f,0.0f]}] run data merge entity @s {Rotation:[180.0f,0.0f]}
execute at @e[tag=RooftopSWinxy] if entity @a[distance=..3] unless entity @e[tag=MetSWinxy] run tellraw @a [{"text":"<SWinxy> ","color":"aqua","bold":false},{"text":"Two things...","color":"white","bold":false,"underlined":false}]
execute at @e[tag=RooftopSWinxy] if entity @a[distance=..3] unless entity @e[tag=MetSWinxy] run tellraw @a [{"text":" #1. No! I\'m not Steve! I\'m just too lazy to pick a skin.","color":"white","bold":false}]
execute at @e[tag=RooftopSWinxy] if entity @a[distance=..3] unless entity @e[tag=MetSWinxy] run tellraw @a [{"text":" And #2. Stop using my apartment for your little running game! Find another way up.","color":"white"}]
execute at @e[tag=RooftopSWinxy] if entity @a[distance=..3] unless entity @e[tag=MetSWinxy] run tellraw @a [{"text":" Light blue line duh...","color":"white","bold":false,"italic":true}]
execute at @e[tag=RooftopSWinxy] if entity @a[distance=..3] run tag @e[tag=MainParkourAEC] add MetSWinxy


execute unless entity @e[tag=RooftopKeen] run summon armor_stand 898 181.4 -1118 {Small:false,Invulnerable:true,Rotation:[300.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16735097}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3440385}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8659328}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"8cd168b9-e6b4-4e71-ae94-e2d49aab8fac",Properties:{textures:[{Signature:"iebcJI9ZjVZIOZ2lb3EDycYm/d+O8Y8BBR4QtQ0LhOoBdSJ718aQ0xlSB76Ew+ehbcMz94gE3f0v6A8lwNM+hPIUrZuW6UYx/Z7v2U5IY8j4GUxpnnDZEhDs7Gy/1EqvpHLhbMXHPnM5Th8Ete4zyoYF2koR31w5rzO2nnGnvcpjO4xJ0yT50yWcpI4JNfJnkQP4auGgGRil/TXTHJ2v28pYjSPkp72lYW0NJXBGe3mV075zBAaS+XCMDDdPSi2fV3uq1SxzmEZzA70TxZMZT+NiL+8D6FmDaiXHg/k73qNqknbalNi+85lx1G7rG+DZIWHtbGN8HZnKjjL9wxJ2c3s3m2O9Nswmw44jgc/SY/LQPP0slKo944mheMSTA/o69wQgNQJLkXRCVUD4pJyM6WE625wdKHArcjfuSGc/3XSIy5Lo46ip3xB6PUMq8K8gGN2Rwzk+m9rdoELCjuAU8gHHblz3BrtoELLl/YGK3Q8CJDn5+BsvIwC4g/Vkv+K3ABzyEtOHDf6S0/AQJePPSSNEtrTISZWC9Q2bgQzfChqHcgSUVax29/BT1oYKmqwtEoYs9iR4OR4q5zl3uWirlc6lOnvdcsynFULNUsxiDv0sL82lVxd4rdgIesWrofnag1khlZ6WRVPRUeuHVc457LqKHdx0Ep9DO7BCRYDWh9Q=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg1MzcxMDMsInByb2ZpbGVJZCI6IjhjZDE2OGI5ZTZiNDRlNzFhZTk0ZTJkNDlhYWI4ZmFjIiwicHJvZmlsZU5hbWUiOiJXaXphcmRfS2VlbiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZThkM2UxYTJkMTEwZWQ3Mjc2NjUxZjUxOGQ1MjBhZWEyMGQ1MTFjODBhYTM4ODI5MzcxYmJiMjlmZmU0MzIwNCJ9fX0="}]},Name:"Wizard_Keen"}},Count:1b}],DisabledSlots:2039583,Tags:["RooftopStand","RooftopKeen"],Pose:{Body:[352f,0f,0f],Head:[0f,340f,10f],LeftLeg:[269f,350f,0f],RightLeg:[268f,14f,0f],LeftArm:[300f,20f,20f],RightArm:[300f,50f,0f]}}


execute unless entity @e[tag=RooftopDragnoz] run summon armor_stand 900 181.4 -1118 {Small:false,Invulnerable:true,Rotation:[0.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3156761}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3685948}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:7094562}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"b9ee0092-c639-4eb5-b5a6-d19dfcc91053",Properties:{textures:[{Signature:"an5OncoNGQmQg8GSkWa0+INO/HltFKDSFkMwZtWeAybFC3LIKA1l2f7qKoQxXDgSjPXmHdKQI1pSQyvJtY6J419qB6BGra3+s811MEzsjuR+iEVNHPVH2Z9guNPWg0G2ZsFzRQDa1YVRDSy5SlmeIKhgTFczsfCAqShqf4eOhU1XUyeeGtdyJBs59H2THTzUxSzzevLwifuNOZadEVS7B7IehH+0dppSqQ2S1PmrsYZrdBCaHizxApdmDG6fKYfqg1e6I8mT+jt//Df/NnZKlpHjdIwYV/ml7ves+4c05XgXBdjkm3Y9rd7ZwbIOyIiwtWo6MZ45tXLT3xfL2K1x6yiahRIKsFP+HgX+tPM96sw9YJEeYACgtae1PQafCHdIOmYDzBGLMyP+kafv4WattqRsfrTZVCnUmiYnaT9GgArxCdermuVgcHSUUcmdWBLyrrceTq9sH77SR9zYAyTqV8ugdhG15YcfqKghdNaDp5jk7iYa84hX6lPv/AP07rXK+9e+Tgxg93Q0ojbjLnYi6JwzoF3z8lFnW5TOpUY7E5ilj/oSnETfy/TL5A+JCdNrwyua3MQE6kdK9AIZa+TW3iG8MEkRsKb5jqWGEBm+FbePEgdfLjNbcpsUH3v4TiYvtDOHSr87taTLA/Arc8NJMFwCRuNv1+J/5KWEhYrna4E=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg0NjUzMzAsInByb2ZpbGVJZCI6ImI5ZWUwMDkyYzYzOTRlYjViNWE2ZDE5ZGZjYzkxMDUzIiwicHJvZmlsZU5hbWUiOiJkcmFnbm96Iiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zYTk5ZDZmMWE3YTUyOTgzNjgyMDgwMWFjYmY1YjgyODYwYWI4NTk0Yzg0NzNmZjg1MWZhNDU2M2EzMjYzY2MyIn19fQ=="}]},Name:"dragnoz"}},Count:1b}],DisabledSlots:2039583,Tags:["RooftopStand","RooftopDragnoz"],Pose:{Body:[352f,0f,0f],Head:[17f,0f,0f],LeftLeg:[269f,350f,0f],RightLeg:[268f,14f,0f],LeftArm:[300f,0f,0f],RightArm:[325f,30f,0f]}}

execute align x align y align z if entity @a[x=898,y=181,z=-1121,dx=2,dy=3,dz=5] run scoreboard objectives add HelicopterChat dummy
execute align x align y align z run scoreboard players add @a[x=898,y=181,z=-1121,dx=2,dy=3,dz=5] HelicopterChat 1

tellraw @a[scores={HelicopterChat=50}] ["",{"text":"<Wizard_Keen> ","color":"light_purple","bold":false},{"text":"dragnoz! What are you doing?! Pull up! PULL UP!","color":"none","bold":false,"underlined":false}]
tellraw @a[scores={HelicopterChat=170}] ["",{"text":"<dragnoz> ","color":"yellow","bold":false},{"text":"Me?! I thought you were flying this thing...","color":"none","bold":false,"underlined":false}]


#execute unless entity @e[tag=RooftopAdrian] run summon armor_stand 938 200 -1102 {Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:abrightmoore,CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner:abrightmoore},Count:1b}],HandItems:[{id:"minecraft:reeds",Count:0b}],DisabledSlots:2039583,Tags:["RooftopStand","RooftopAdrian"],Pose:{Head:[18f,0f,0f],LeftLeg:[0f,0f,351f],RightLeg:[33f,321f,23f],LeftArm:[335f,360f,250f],RightArm:[10f,290f,40f]}}


# CHECKPOINT
execute align x align y align z run spawnpoint @a[x=859,y=186,z=-1143,dx=23,dy=7,dz=23] 880 188 -1131



######################

# COMPLETE BLUE
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={LightBlueParkour=0}] LightBlueParkour 1
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] run setblock 35 1 -18 light_blue_concrete

execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=929,y=201,z=-1108,dx=2,dy=4,dz=0] if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0



# QUIT BLUE
execute align x align y align z if entity @a[x=877,y=179,z=-1066,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=877,y=179,z=-1066,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=877,y=179,z=-1066,dx=0,dy=0,dz=0] run teleport @p 997 66 -1002 110 0

