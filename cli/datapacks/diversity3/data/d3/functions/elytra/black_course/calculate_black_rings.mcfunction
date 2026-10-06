####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 9 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlackRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add BlackRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] BlackRingTotal 0
execute if block -29 4 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 5 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 6 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 7 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 8 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 9 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 10 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1
execute if block -29 11 78 black_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlackRingTotal 1

execute if entity @e[scores={BlackRingTotal=1..}] run title @a[tag=BlackRing] times 5 60 5
execute if entity @e[scores={BlackRingTotal=1..}] run title @a[tag=BlackRing] title {"text":"   ","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=1}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=2}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=3}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=4}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=5}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=6}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=7}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=8}] run title @a[tag=BlackRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"gray"}
execute if entity @e[scores={BlackRingTotal=1..}] at @a[tag=BlackRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={BlackRingTotal=8}] at @a[tag=BlackRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove BlackRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -29 4 78 black_terracotta if block -29 5 78 black_terracotta if block -29 6 78 black_terracotta if block -29 7 78 black_terracotta if block -29 8 78 black_terracotta if block -29 9 78 black_terracotta if block -29 10 78 black_terracotta if block -29 11 78 black_terracotta if block -29 13 78 clay run setblock -29 13 78 black_terracotta
