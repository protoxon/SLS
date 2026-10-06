####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 7 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OrangeRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add OrangeRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] OrangeRingTotal 0
execute if block -24 4 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 5 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 6 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 7 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 8 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 9 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 10 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1
execute if block -24 11 78 orange_terracotta run scoreboard players add @e[tag=MainElytraAEC] OrangeRingTotal 1

execute if entity @e[scores={OrangeRingTotal=1..}] run title @a[tag=OrangeRing] times 5 60 5
execute if entity @e[scores={OrangeRingTotal=1..}] run title @a[tag=OrangeRing] title {"text":"   ","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=1}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=2}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=3}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=4}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=5}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=6}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=7}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=8}] run title @a[tag=OrangeRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"gold"}
execute if entity @e[scores={OrangeRingTotal=1..}] at @a[tag=OrangeRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={OrangeRingTotal=8}] at @a[tag=OrangeRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove OrangeRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -24 4 78 orange_terracotta if block -24 5 78 orange_terracotta if block -24 6 78 orange_terracotta if block -24 7 78 orange_terracotta if block -24 8 78 orange_terracotta if block -24 9 78 orange_terracotta if block -24 10 78 orange_terracotta if block -24 11 78 orange_terracotta if block -24 13 78 clay run setblock -24 13 78 orange_terracotta
