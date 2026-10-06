####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# (Tweaked by QwertyuiopThePie)
# AUGUST 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# Out with the old
#kill @e[tag=GolfGearStand]
fill 6 89 3200 12 89 3209 air replace acacia_pressure_plate


# In with the new
# WHITE
execute unless entity @a[scores={golfGear=1}] unless entity @e[tag=WhiteGear] run summon armor_stand 7 90 3200 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_helmet",tag:{display:{color:16383998}},Count:1b}],Tags:["GolfGearStand","WhiteGear"]}

# PINK
execute unless entity @a[scores={golfGear=2}] unless entity @e[tag=PinkGear] run summon armor_stand 7 90 3202 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:leather_helmet",tag:{display:{color:15961002}},Count:1b}],Tags:["GolfGearStand","PinkGear"]}

# CYAN
execute unless entity @a[scores={golfGear=3}] unless entity @e[tag=CyanGear] run summon armor_stand 7 90 3207 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:leather_helmet",tag:{display:{color:1481884}},Count:1b}],Tags:["GolfGearStand","CyanGear"]}

# BLACK
execute unless entity @a[scores={golfGear=4}] unless entity @e[tag=BlackGear] run summon armor_stand 7 90 3209 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_helmet",tag:{display:{color:1908001}},Count:1b}],Tags:["GolfGearStand","BlackGear"]}

# ORANGE
execute unless entity @a[scores={golfGear=5}] unless entity @e[tag=OrangeGear] run summon armor_stand 10 90 3200 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_helmet",tag:{display:{color:16351261}},Count:1b}],Tags:["GolfGearStand","OrangeGear"]}

# LIME
execute unless entity @a[scores={golfGear=6}] unless entity @e[tag=LimeGear] run summon armor_stand 10 90 3202 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_helmet",tag:{display:{color:8439583}},Count:1b}],Tags:["GolfGearStand","LimeGear"]}

# PURPLE
execute unless entity @a[scores={golfGear=7}] unless entity @e[tag=PurpleGear] run summon armor_stand 10 90 3207 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_helmet",tag:{display:{color:8991416}},Count:1b}],Tags:["GolfGearStand","PurpleGear"]}

# RED
execute unless entity @a[scores={golfGear=8}] unless entity @e[tag=RedGear] run summon armor_stand 10 90 3209 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:leather_helmet",tag:{display:{color:11546150}},Count:1b}],Tags:["GolfGearStand","RedGear"]}

# MAGENTA
execute unless entity @a[scores={golfGear=9}] unless entity @e[tag=MagentaGear] run summon armor_stand 13 90 3200 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:leather_helmet",tag:{display:{color:13061821}},Count:1b}],Tags:["GolfGearStand","MagentaGear"]}

# LIGHT BLUE
execute unless entity @a[scores={golfGear=10}] unless entity @e[tag=LightBlueGear] run summon armor_stand 13 90 3202 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_helmet",tag:{display:{color:3847130}},Count:1b}],Tags:["GolfGearStand","LightBlueGear"]}

# BLUE
execute unless entity @a[scores={golfGear=11}] unless entity @e[tag=BlueGear] run summon armor_stand 13 90 3207 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_helmet",tag:{display:{color:3949738}},Count:1b}],Tags:["GolfGearStand","BlueGear"]}

# BROWN
execute unless entity @a[scores={golfGear=12}] unless entity @e[tag=BrownGear] run summon armor_stand 13 90 3209 {DisabledSlots:4144959,Invulnerable:true,ShowArms:true,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_helmet",tag:{display:{color:8606770}},Count:1b}],Tags:["GolfGearStand","BrownGear"]}

# Replace pressure plates
execute as @e[tag=GolfGearStand] at @s run setblock ~-1 89 ~ acacia_pressure_plate replace