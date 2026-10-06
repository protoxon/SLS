####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019 / SEPTEMBER 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ConcreteAge

execute if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"}},x=-26,y=0,z=1044,dx=20,dy=88,dz=36] run scoreboard objectives add ConcreteAge dummy
execute unless entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"}},x=-26,y=0,z=1044,dx=20,dy=88,dz=36] run scoreboard objectives remove ConcreteAge

scoreboard players add @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"}},x=-26,y=0,z=1044,dx=88,dy=88,dz=36] ConcreteAge 1
execute align xyz at @e[scores={ConcreteAge=1..}] run fill ~ 85 ~ ~ 86 ~ structure_void replace air


tag @a remove OnBridge
execute align xyz run tag @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] add OnBridge

# BRIDGE AECS
execute at @e[tag=OBridgeAEC] run fill ~ ~-1 ~ ~ ~-1 ~ acacia_button[face=ceiling] replace structure_void
execute at @e[tag=OBridgeAEC] run fill ~ ~ ~ ~ ~1 ~ orange_concrete_powder replace structure_void

execute as @e[tag=OBridgeAEC] at @s unless entity @a[distance=..3,tag=OnBridge] run fill ~ ~-1 ~ ~ ~-1 ~ air replace acacia_button
execute as @e[tag=OBridgeAEC] at @s unless entity @a[distance=..3,tag=OnBridge] run kill @s





# THIS IS ON EXACT BLOCK ALIGN XYZ -> ~0.5 86 ~0.5


# ADVENTURE ACCESS -> INVISIBLE BRIDGE
execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~ 86 ~ structure_void run summon area_effect_cloud ~0.5 86 ~0.5 {Tags:["OBridgeAEC"],Duration:100000}


execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~1 86 ~1 structure_void run summon area_effect_cloud ~1.5 86 ~1.5 {Tags:["OBridgeAEC"],Duration:100000}
execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~ 86 ~1 structure_void run summon area_effect_cloud ~0.5 86 ~1.5 {Tags:["OBridgeAEC"],Duration:100000}
execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~-1 86 ~1 structure_void run summon area_effect_cloud ~-0.5 86 ~1.5 {Tags:["OBridgeAEC"],Duration:100000}

execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~1 86 ~-1 structure_void run summon area_effect_cloud ~1.5 86 ~0.5 {Tags:["OBridgeAEC"],Duration:100000}

execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~1 86 ~-1 structure_void run summon area_effect_cloud ~1.5 86 ~-0.5 {Tags:["OBridgeAEC"],Duration:100000}
execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~ 86 ~-1 structure_void run summon area_effect_cloud ~0.5 86 ~-0.5 {Tags:["OBridgeAEC"],Duration:100000}
execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~-1 86 ~-1 structure_void run summon area_effect_cloud ~-0.5 86 ~-0.5 {Tags:["OBridgeAEC"],Duration:100000}

execute align xyz at @a[x=-26,y=87,z=1044,dx=20,dy=1,dz=36] align xyz if block ~1 86 ~-1 structure_void run summon area_effect_cloud ~-0.5 86 ~0.5 {Tags:["OBridgeAEC"],Duration:100000}









#execute at @e[tag=OBridgeAEC] unless entity @a[distance=..3] run fill ~-2 85 ~ ~2 85 ~ air replace acacia_button

#execute at @e[tag=OBridgeAEC] if entity @a[distance=..3] run fill ~-2 85 ~ ~2 85 ~ acacia_button[face=ceiling,facing=east] replace structure_void
#execute at @e[tag=OBridgeAEC] if entity @a[distance=..3] run fill ~-2 86 ~ ~2 86 ~ orange_concrete_powder replace structure_void


#execute align xyz as @a[x=-26,y=0,z=1039,dx=20,dy=88,dz=41] at @s run fill ~-8 85 ~3 ~8 85 ~6 air replace acacia_button[face=ceiling]
#execute align xyz as @a[x=-26,y=0,z=1039,dx=20,dy=88,dz=41] at @s run fill ~-8 85 ~-6 ~8 85 ~-3 air replace acacia_button[face=ceiling]


#execute align xyz as @a[x=-26,y=0,z=1039,dx=20,dy=87,dz=41] at @s run fill ~-2 85 ~-2 ~2 85 ~2 acacia_button[face=ceiling,facing=east] replace structure_void
#execute align xyz as @a[x=-26,y=0,z=1039,dx=20,dy=87,dz=41] at @s run fill ~-2 86 ~-2 ~2 86 ~2 orange_concrete_powder replace structure_void

#execute as @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"},Time:1},x=-26,y=80,z=1044,dx=20,dy=6,dz=36] at @s run fill ~ 85 ~ ~ 85 ~ structure_void replace air
#execute as @e[type=falling_block,nbt={BlockState:{Name:"minecraft:orange_concrete_powder"},Time:1},x=-26,y=80,z=1044,dx=20,dy=6,dz=36] at @s run fill ~ 86 ~ ~ 86 ~ structure_void replace air