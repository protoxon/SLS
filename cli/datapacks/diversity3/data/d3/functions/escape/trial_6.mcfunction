####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 7 2018 / JUNE 22 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar NoEscapeShield
#scoreboard objectives setdisplay sidebar ArrowTimer
#scoreboard objectives setdisplay sidebar AnvilTimer
#scoreboard objectives setdisplay sidebar RainbowTimer
#scoreboard objectives setdisplay sidebar FangTimer
#scoreboard objectives setdisplay sidebar LavaTimer


# ADDS TIMERS FOR ARROWS AND ANVILS
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run scoreboard objectives add ArrowTimer dummy
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run scoreboard objectives add AnvilTimer dummy

kill @e[type=arrow,x=-1041,y=119,z=956,dx=10,dy=1,dz=60,nbt={inGround:1b}]

teleport @a[x=-1041,y=117,z=942,dx=10,dy=-2,dz=70] -1036 120 949 0 0


# NO SHIELD ADVANCEMENT
execute align x align y align z if entity @a[x=-1038,y=120,z=946,dx=4,dy=2,dz=1] run scoreboard objectives add NoEscapeShield dummy
execute align x align y align z run scoreboard players set @a[x=-1038,y=120,z=946,dx=4,dy=2,dz=9] NoEscapeShield 0
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:shield"}]}] NoEscapeShield 1
execute align x align y align z run advancement grant @a[x=-988,y=143,z=1008,dx=1,dy=2,dz=2,scores={NoEscapeShield=0}] only d3:folder_b/pin_cushion


# HORIZONTAL ARROW SECTION FOR GAUNTLET
scoreboard players add @e[tag=MainEscapeAEC] ArrowTimer 1
scoreboard players set @e[scores={ArrowTimer=8..10}] ArrowTimer 0

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1040 120.5 956 {Motion:[1.0,0.15,0.0],damage:5.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=5}] run summon arrow -1032 120.5 962 {Motion:[-1.0,0.15,0.0],damage:5.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1035 123.5 977 {Motion:[0.0,0.0,-1.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1036 123.5 977 {Motion:[0.0,0.0,-1.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1037 123.5 977 {Motion:[0.0,0.0,-1.0],damage:5.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1035 126 979 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1036 126 979 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1037 126 979 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1035 126 980 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1036 126 980 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1037 126 980 {Motion:[0.0,0.0,0.0],damage:5.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1035 123.5 982 {Motion:[0.0,0.0,1.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1036 123.5 982 {Motion:[0.0,0.0,1.0],damage:5.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21..,ArrowTimer=1}] run summon arrow -1037 123.5 982 {Motion:[0.0,0.0,1.0],damage:5.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=1}] run summon arrow -1039 120.5 1009 {Motion:[1.0,0.15,0.0],damage:40.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=1}] run summon arrow -1039 120.5 1010 {Motion:[1.0,0.15,0.0],damage:40.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=1}] run summon arrow -1039 120.5 1011 {Motion:[1.0,0.15,0.0],damage:40.0,Color:-1}

execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=5}] run summon arrow -1033 120.5 1009 {Motion:[-1.0,0.15,0.0],damage:40.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=5}] run summon arrow -1033 120.5 1010 {Motion:[-1.0,0.15,0.0],damage:40.0,Color:-1}
execute if entity @a[x=-1039,y=120,z=948,dx=6,dy=3,dz=60] if entity @e[scores={EscapeLevel=21,ArrowTimer=5}] run summon arrow -1033 120.5 1011 {Motion:[-1.0,0.15,0.0],damage:40.0,Color:-1}



# ANVIL POWER OFF SECTION
scoreboard players add @e[tag=MainEscapeAEC] AnvilTimer 1
scoreboard players set @e[scores={AnvilTimer=30}] AnvilTimer 0

execute if entity @e[scores={EscapeLevel=21,AnvilTimer=1}] align x align y align z at @a[x=-1029,y=120,z=996,dx=8,dy=2,dz=8] run fill ~ 118 ~ ~ 118 ~ anvil replace air

fill -1029 108 996 -1021 108 1004 anvil replace chipped_anvil
fill -1029 108 996 -1021 108 1004 anvil replace damaged_anvil

execute if block -1022 108 1000 anvil run setblock -1022 107 1000 yellow_concrete
execute if block -1023 108 1000 anvil run setblock -1023 107 1000 yellow_concrete
execute if block -1023 108 1002 anvil run setblock -1023 107 1002 yellow_concrete
execute if block -1024 108 1003 anvil run setblock -1024 107 1003 yellow_concrete
execute if block -1025 108 1003 anvil run setblock -1025 107 1003 yellow_concrete
execute if block -1026 108 1003 anvil run setblock -1026 107 1003 yellow_concrete
execute if block -1027 108 1002 anvil run setblock -1027 107 1002 yellow_concrete
execute if block -1028 108 1001 anvil run setblock -1028 107 1001 yellow_concrete
execute if block -1028 108 1000 anvil run setblock -1028 107 1000 yellow_concrete
execute if block -1028 108 999 anvil run setblock -1028 107 999 yellow_concrete
execute if block -1027 108 998 anvil run setblock -1027 107 998 yellow_concrete
execute if block -1026 108 997 anvil run setblock -1026 107 997 yellow_concrete
execute if block -1025 108 997 anvil run setblock -1025 107 997 yellow_concrete
execute if block -1024 108 997 anvil run setblock -1024 107 997 yellow_concrete
execute if block -1023 108 998 anvil run setblock -1023 107 998 yellow_concrete

fill -1029 108 996 -1021 108 1004 air replace anvil
fill -1029 108 996 -1021 108 1004 air replace chipped_anvil
fill -1029 108 996 -1021 108 1004 air replace damaged_anvil



# TRIAL 6 - GAUNTLET ARROWS POWER OFF -> LEVEL 22
execute if block -1022 107 1000 yellow_concrete if block -1023 107 1000 yellow_concrete if block -1023 107 1002 yellow_concrete if block -1024 107 1003 yellow_concrete if block -1025 107 1003 yellow_concrete if block -1026 107 1003 yellow_concrete if block -1027 107 1002 yellow_concrete if block -1028 107 1001 yellow_concrete if block -1028 107 1000 yellow_concrete if block -1028 107 999 yellow_concrete if block -1027 107 998 yellow_concrete if block -1026 107 997 yellow_concrete if block -1025 107 997 yellow_concrete if block -1024 107 997 yellow_concrete if block -1023 107 998 yellow_concrete run scoreboard players set @e[scores={EscapeLevel=..21}] EscapeTimer 0
execute if block -1022 107 1000 yellow_concrete if block -1023 107 1000 yellow_concrete if block -1023 107 1002 yellow_concrete if block -1024 107 1003 yellow_concrete if block -1025 107 1003 yellow_concrete if block -1026 107 1003 yellow_concrete if block -1027 107 1002 yellow_concrete if block -1028 107 1001 yellow_concrete if block -1028 107 1000 yellow_concrete if block -1028 107 999 yellow_concrete if block -1027 107 998 yellow_concrete if block -1026 107 997 yellow_concrete if block -1025 107 997 yellow_concrete if block -1024 107 997 yellow_concrete if block -1023 107 998 yellow_concrete run scoreboard players set @e[scores={EscapeLevel=..21}] EscapeLevel 22

execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run playsound entity.wither.hurt master @a -1025 120 1000 0.2 0.5 0.2
execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run fill -1029 107 996 -1021 107 1004 red_concrete replace yellow_concrete
execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run setblock -1025 123 1003 red_wall_banner[facing=north]
execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run setblock -1028 123 1000 red_wall_banner[facing=east]
execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run setblock -1025 123 997 red_wall_banner[facing=south]
execute if entity @e[scores={EscapeLevel=22,EscapeTimer=1}] run setblock -1022 123 1000 red_wall_banner[facing=west]



# ANVILS - LEVEL 21 & 22
kill @e[type=item,nbt={Item:{id:"minecraft:anvil"}}]

teleport @a[x=-1041,y=117,z=1013,dx=64,dy=-2,dz=12] -1030 120 1019 270 0

fill -1023 120 1018 -1023 120 1020 air
fill -1005 120 1018 -1005 120 1020 air
fill -999 120 1018 -999 120 1020 air

execute align x align y align z unless entity @a[x=-1029,y=120,z=996,dx=8,dy=2,dz=8] unless entity @a[x=-1038,y=120,z=1000,dx=51,dy=10,dz=24] run scoreboard players set @e[tag=MainEscapeAEC] AnvilTimer -1

execute if entity @e[scores={AnvilTimer=1}] run summon falling_block -1023 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=1}] run summon falling_block -1023 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=1}] run summon falling_block -1023 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -1023 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -1023 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -1023 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=7}] run summon falling_block -1005 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=7}] run summon falling_block -1005 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=7}] run summon falling_block -1005 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -1005 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -1005 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -1005 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=0}] run summon falling_block -999 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=0}] run summon falling_block -999 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=0}] run summon falling_block -999 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -999 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -999 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=15}] run summon falling_block -999 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}

execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -999 127 1018 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -999 127 1019 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}
execute if entity @e[scores={AnvilTimer=22}] run summon falling_block -999 127 1020 {BlockState:{Name:"minecraft:anvil"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false}



# INSIDE ARROW LEVITATION POLE
execute align x align y align z run effect give @a[x=-991,y=120,z=1009,dx=0,dy=22,dz=0] levitation 3 3 true
execute if entity @e[scores={ArrowTimer=1}] align x align y align z at @a[x=-992,y=121,z=1008,dx=2,dy=18,dz=2] run summon arrow ~ 147 ~
execute align x align y align z run kill @e[type=arrow,x=-993,y=119,z=1007,dx=4,dy=24,dz=4,nbt={inGround:1b}]


# RAINBOW RUN -> LEVEL 23
execute if entity @e[scores={EscapeLevel=23,EscapeTimer=1}] run scoreboard objectives add RainbowTimer dummy
scoreboard players add @e[tag=MainEscapeAEC] RainbowTimer 1
scoreboard players set @e[scores={RainbowTimer=30..}] RainbowTimer 0

execute if entity @e[scores={RainbowTimer=1}] run kill @e[tag=RainbowCloud]
execute if entity @a[x=-960,y=143,z=986,dx=6,dy=3,dz=25] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -959 141 986 {Tags:["RainbowCloud","RainbowCloud1"],Duration:1}
execute if entity @a[x=-960,y=143,z=986,dx=6,dy=3,dz=25] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -958 141 986 {Tags:["RainbowCloud","RainbowCloud1"],Duration:1}
execute if entity @a[x=-960,y=143,z=986,dx=6,dy=3,dz=25] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -957 141 986 {Tags:["RainbowCloud","RainbowCloud1"],Duration:1}
execute if entity @a[x=-960,y=143,z=986,dx=6,dy=3,dz=25] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -956 141 986 {Tags:["RainbowCloud","RainbowCloud1"],Duration:1}
execute if entity @a[x=-960,y=143,z=986,dx=6,dy=3,dz=25] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -955 141 986 {Tags:["RainbowCloud","RainbowCloud1"],Duration:1}

execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud1,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud1,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud1,sort=random,limit=1] run setblock ~ ~ ~ redstone_block


execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -980 141 985 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -980 141 984 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -980 141 983 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -980 141 982 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=1}] run summon area_effect_cloud -980 141 981 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}

execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=16}] run summon area_effect_cloud -980 141 985 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=16}] run summon area_effect_cloud -980 141 984 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=16}] run summon area_effect_cloud -980 141 983 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=16}] run summon area_effect_cloud -980 141 982 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}
execute if entity @a[x=-980,y=143,z=980,dx=25,dy=3,dz=6] if entity @e[scores={RainbowTimer=16}] run summon area_effect_cloud -980 141 981 {Tags:["RainbowCloud","RainbowCloud2"],Duration:1}

execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block

execute if entity @e[scores={RainbowTimer=16}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=16}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block
execute if entity @e[scores={RainbowTimer=16}] at @e[tag=RainbowCloud2,sort=random,limit=1] run setblock ~ ~ ~ redstone_block


execute if entity @e[scores={RainbowTimer=1}] at @e[tag=RainbowCloud] run setblock ~ ~ ~ clay
execute if entity @e[scores={RainbowTimer=16}] at @e[tag=RainbowCloud] run setblock ~ ~ ~ clay

execute as @e[tag=RainbowStand1] at @s run teleport @s ~ ~ ~0.6
execute as @e[tag=RainbowStand2] at @s run teleport @s ~0.6 ~ ~

execute at @e[tag=RainbowStand1] run playsound block.chorus_flower.grow master @a
execute at @e[tag=RainbowStand2] run playsound block.chorus_flower.grow master @a

execute at @e[tag=WhiteRainbowStand] run summon falling_block ~ ~2 ~ {CustomName:"{\"text\":\"YoU\",\"color\":\"white\"}",BlockState:{Name:"minecraft:white_concrete"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false,CustomNameVisible:1b}
execute at @e[tag=OrangeRainbowStand] run summon falling_block ~ ~2 ~ {CustomName:"{\"text\":\"aRe\",\"color\":\"gold\"}",BlockState:{Name:"minecraft:orange_concrete"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false,CustomNameVisible:1b}
execute at @e[tag=LimeRainbowStand] run summon falling_block ~ ~2 ~ {CustomName:"{\"text\":\"gOiNg\",\"color\":\"green\"}",BlockState:{Name:"minecraft:lime_concrete"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false,CustomNameVisible:1b}
execute at @e[tag=BlueRainbowStand] run summon falling_block ~ ~2 ~ {CustomName:"{\"text\":\"tO\",\"color\":\"aqua\"}",BlockState:{Name:"minecraft:light_blue_concrete"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false,CustomNameVisible:1b}
execute at @e[tag=PurpleRainbowStand] run summon falling_block ~ ~2 ~ {CustomName:"{\"text\":\"DiE\",\"color\":\"light_purple\"}",BlockState:{Name:"minecraft:purple_concrete"},HurtEntities:1,FallHurtMax:100,FallHurtAmount:100,Time:1b,DropItem:false,CustomNameVisible:1b}

fill -959 143 986 -955 146 1006 air
fill -980 143 981 -959 146 985 air
execute align x align y align z run kill @e[type=armor_stand,tag=RainbowStand1,x=-959,y=140,z=1005,dx=4,dy=6,dz=5]
execute align x align y align z run kill @e[type=armor_stand,tag=RainbowStand2,x=-960,y=140,z=981,dx=5,dy=6,dz=4]



# RAINBOW IRON GATE
execute if block -983 143 985 lever[powered=false] run fill -984 143 986 -982 145 986 iron_bars[west=true,east=true] replace air
execute if block -983 143 985 lever[powered=true] if block -983 144 986 iron_bars run playsound entity.experience_orb.pickup master @a -983 144 986
execute if block -983 143 985 lever[powered=true] if block -983 144 986 iron_bars run playsound item.chorus_fruit.teleport master @a -983 144 986 1 0.7 0
execute if block -983 143 985 lever[powered=true] if block -983 144 986 iron_bars run particle cloud -983 144 986 1 1 0 0 100
execute if block -983 143 985 lever[powered=true] run fill -984 143 986 -982 145 986 air destroy



# EVOKER FANGS SETUP -> LEVEL 24
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1}] run scoreboard objectives remove AnvilTimer
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1}] run scoreboard objectives remove ArrowTimer
execute if entity @e[scores={EscapeLevel=24,EscapeTimer=1}] run scoreboard objectives add FangTimer dummy


# EVOKER FANGS MECHANIC
scoreboard players add @e[tag=MainEscapeAEC] FangTimer 1
scoreboard players set @e[scores={FangTimer=40..}] FangTimer 0

tag @e remove FangTrap1
execute if entity @a[x=-985,y=143,z=974,dx=4,dy=5,dz=4] run tag @e[tag=MainEscapeAEC] add FangTrap1

tag @e remove FangTrap2
execute if entity @a[x=-985,y=143,z=962,dx=4,dy=5,dz=11] run tag @e[tag=MainEscapeAEC] add FangTrap2

tag @e remove FangTrap3
execute if entity @a[x=-985,y=143,z=953,dx=4,dy=5,dz=8] run tag @e[tag=MainEscapeAEC] add FangTrap3

execute if entity @e[tag=FangTrap1,scores={FangTimer=2..19}] at @e[tag=Fangs] align x align y align z run effect give @a[dx=0,dy=1,dz=0] instant_damage 1 1 true

execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -985 143 975 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -984 143 975 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -983 143 975 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -982 143 975 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -981 143 975 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -985 143 974 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -984 143 974 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -983 143 974 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -982 143 974 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap1,scores={FangTimer=1}] run summon evoker_fangs -981 143 974 {Rotation:[90f,0f],Tags:["Fangs"]}

execute if entity @e[tag=FangTrap2,scores={FangTimer=2..19}] at @e[tag=Fangs] align x align y align z run effect give @a[dx=0,dy=1,dz=0] instant_damage 1 1 true

execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 970 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 970 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 970 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 970 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 970 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 969 {Rotation:[90f,0f],Tags:["Fangs"]}
#execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 969 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 969 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 969 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 969 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 968 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 968 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 968 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 968 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 968 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 967 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 967 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 967 {Rotation:[90f,0f],Tags:["Fangs"]}
#execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 967 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 967 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 966 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 966 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 966 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 966 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 966 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 965 {Rotation:[90f,0f],Tags:["Fangs"]}
#execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 965 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 965 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 965 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 965 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 964 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 964 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 964 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 964 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 964 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 963 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 963 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 963 {Rotation:[90f,0f],Tags:["Fangs"]}
#execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 963 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 963 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -985 143 962 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -984 143 962 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -983 143 962 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -982 143 962 {Rotation:[90f,0f],Tags:["Fangs"]}
execute if entity @e[tag=FangTrap2,scores={FangTimer=1}] run summon evoker_fangs -981 143 962 {Rotation:[90f,0f],Tags:["Fangs"]}

execute if entity @e[tag=FangTrap3,scores={FangTimer=2..19}] at @e[tag=OrangeFangs] align x align y align z run effect give @a[dx=0,dy=1,dz=0] instant_damage 1 1 true

# ORANGE FANGS
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -985 143 958 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -984 143 958 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -983 143 957 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -982 143 957 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -983 143 956 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -982 143 956 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -985 143 955 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -984 143 955 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -981 143 954 {Rotation:[90f,0f],Tags:["OrangeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=1}] run summon evoker_fangs -981 143 953 {Rotation:[90f,0f],Tags:["OrangeFangs"]}

execute if entity @e[tag=FangTrap3,scores={FangTimer=12..29}] at @e[tag=LimeFangs] align x align y align z run effect give @a[dx=0,dy=1,dz=0] instant_damage 1 1 true

# LIME FANGS
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -983 143 958 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -982 143 958 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -985 143 957 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -984 143 957 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -981 143 956 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -981 143 955 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -985 143 954 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -984 143 954 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -983 143 953 {Rotation:[90f,0f],Tags:["LimeFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=11}] run summon evoker_fangs -982 143 953 {Rotation:[90f,0f],Tags:["LimeFangs"]}

execute if entity @e[tag=FangTrap3,scores={FangTimer=0..9}] at @e[tag=BlueFangs] align x align y align z run effect give @a[dx=0,dy=1,dz=0] instant_damage 1 1 true

# BLUE FANGS
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -981 143 958 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -981 143 957 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -985 143 956 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -984 143 956 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -983 143 955 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -982 143 955 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -983 143 954 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -982 143 954 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -985 143 953 {Rotation:[90f,0f],Tags:["BlueFangs"]}
execute if entity @e[tag=FangTrap3,scores={FangTimer=21}] run summon evoker_fangs -984 143 953 {Rotation:[90f,0f],Tags:["BlueFangs"]}


# LAVA RISE SETUP
execute if entity @e[scores={EscapeLevel=24..25}] run fill -1018 142 947 -1012 142 953 black_stained_glass replace lava
execute if entity @e[scores={EscapeLevel=24..25}] if block -1015 143 950 lava run playsound block.lava.extinguish master @a -1015 143 950 1 0 0
execute if entity @e[scores={EscapeLevel=24..25}] if block -1015 143 950 lava run clone -48 1 32 -38 35 42 -1020 142 945
execute if entity @e[scores={EscapeLevel=24..25}] run fill -1019 143 945 -1011 176 954 air replace lava
execute if entity @e[scores={EscapeLevel=24..25}] run kill @e[tag=LavaCloud]

teleport @a[x=-1003,y=166,z=952,dx=5,dy=-1,dz=42] -1000 169 950 0 0

# LAVA RISE -> LEVEL 26
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run scoreboard objectives remove FangTimer
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run scoreboard objectives remove RainbowTimer

execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run kill @e[type=hopper_minecart]
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run summon hopper_minecart -1013 150 953
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run summon hopper_minecart -1014 157 953
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=1}] run summon hopper_minecart -1018 157 947

execute if entity @e[scores={EscapeLevel=26,EscapeTimer=10}] run playsound entity.evoker.prepare_summon master @a -1015 143 950 1 1.5 1
execute if entity @e[scores={EscapeTimer=10..}] align x align y align z run effect give @a[x=-1019,y=143,z=946,dx=8,dy=25,dz=8] jump_boost 2 8 true

execute if entity @e[scores={EscapeLevel=26,EscapeTimer=60}] run fill -1018 142 947 -1012 142 953 lava[level=0] destroy
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=60}] run kill @e[tag=LavaCloud]
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=60}] run summon area_effect_cloud -1015 143 950 {Tags:["LavaCloud"],Duration:2147483647}
#execute if entity @e[scores={EscapeLevel=26,EscapeTimer=60}] run summon armor_stand -1015 143 950 {Tags:["LavaCloud"],NoGravity:true,Invulnerable:true,Marker:true}
execute if entity @e[scores={EscapeLevel=26,EscapeTimer=60}] run scoreboard objectives add LavaTimer dummy

scoreboard players add @e[tag=LavaCloud] LavaTimer 1
execute as @e[tag=LavaCloud,scores={LavaTimer=0..}] at @s run fill ~-4 ~ ~-4 ~4 ~ ~5 lava[level=6] replace air
execute as @e[tag=LavaCloud,scores={LavaTimer=2..}] at @s run fill ~-4 ~ ~-4 ~4 ~ ~5 lava[level=3] replace lava
execute as @e[tag=LavaCloud,scores={LavaTimer=4..}] at @s run fill ~-4 ~ ~-4 ~4 ~ ~5 lava[level=0] replace lava
execute as @e[scores={LavaTimer=6}] at @s run teleport @s ~ ~1 ~
scoreboard players set @e[scores={LavaTimer=6..}] LavaTimer 0

execute if block -1014 168 949 lava run kill @e[scores={LavaTimer=5..}]


# CHECKPOINT LADDER
execute if block -1009 170 947 lever[powered=false] run fill -1009 143 948 -1009 170 948 air replace ladder
execute if block -1009 170 947 lever[powered=false] run fill -1009 142 948 -1009 142 948 air replace dark_prismarine
execute if block -1009 170 947 lever[powered=true] if block -1009 143 948 air if block -1009 143 948 air run particle cloud -1009 156 948 0.3 10 0.3 0 120
execute if block -1009 170 947 lever[powered=true] if block -1009 143 948 air run playsound entity.experience_orb.pickup master @a -1010 170 947
execute if block -1009 170 947 lever[powered=true] if block -1009 143 948 air run playsound item.chorus_fruit.teleport master @a -1010 170 947 1 0.7 0
execute if block -1009 170 947 lever[powered=true] if block -1009 143 948 air run playsound entity.experience_orb.pickup master @a -1009 142 948
execute if block -1009 170 947 lever[powered=true] if block -1009 143 948 air run playsound item.chorus_fruit.teleport master @a -1009 142 948 1 0.7 0
execute if block -1009 170 947 lever[powered=true] run fill -1009 143 948 -1009 170 948 ladder[facing=east]
execute if block -1009 170 947 lever[powered=true] run fill -1009 142 948 -1009 142 948 dark_prismarine replace air

