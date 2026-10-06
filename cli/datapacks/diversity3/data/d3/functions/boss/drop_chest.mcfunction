####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 25 2018 / DECEMEBER 13 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# CHEST GETS REMOVED
execute unless entity @e[tag=FallingChest1] run summon armor_stand -1000 94 -981 {Invisible:true,Tags:["FallingBossStand","FallingChest","FallingChest1"]}
#execute at @e[tag=FallingChest1] run fill ~ ~0.3 ~ ~ ~0.3 ~ chest[facing=north]{Items:[{Slot:13b,id:"minecraft:wooden_axe",Count:1b,tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_log","minecraft:oak_leaves"]}}]} replace air

execute at @e[tag=FallingChest1] run fill ~ ~0.3 ~ ~ ~0.3 ~ chest[facing=north]{Items:[{Slot:4b,id:"minecraft:leather_helmet",Count:1b},{Slot:12b,id:"minecraft:leather_chestplate",Count:1b},{Slot:13b,id:"minecraft:wooden_axe",Count:1b,tag:{CanDestroy:["minecraft:chest","minecraft:crafting_table","minecraft:oak_log","minecraft:oak_leaves"]}},{Slot:14b,id:"minecraft:leather_leggings",Count:1b},{Slot:22b,id:"minecraft:leather_boots",Count:1b}]} replace air

execute at @e[tag=FallingChest1] run fill ~ ~1 ~ ~ ~40 ~ air replace chest
execute as @e[tag=FallingChest1] at @s if block -1000 63 -981 chest run kill @s