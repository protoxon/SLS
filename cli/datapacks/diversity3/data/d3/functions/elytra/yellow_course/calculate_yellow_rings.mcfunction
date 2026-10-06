####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 10 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar YellowRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add YellowRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] YellowRingTotal 0
execute if block -23 4 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 5 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 6 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 7 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 8 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 9 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 10 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1
execute if block -23 11 78 yellow_terracotta run scoreboard players add @e[tag=MainElytraAEC] YellowRingTotal 1

execute if entity @e[scores={YellowRingTotal=1..}] run title @a[tag=YellowRing] times 5 60 5
execute if entity @e[scores={YellowRingTotal=1..}] run title @a[tag=YellowRing] title {"text":"   ","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=1}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=2}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=3}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=4}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=5}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=6}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=7}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=8}] run title @a[tag=YellowRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"yellow"}
execute if entity @e[scores={YellowRingTotal=1..}] at @a[tag=YellowRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={YellowRingTotal=8}] at @a[tag=YellowRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove YellowRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -23 4 78 yellow_terracotta if block -23 5 78 yellow_terracotta if block -23 6 78 yellow_terracotta if block -23 7 78 yellow_terracotta if block -23 8 78 yellow_terracotta if block -23 9 78 yellow_terracotta if block -23 10 78 yellow_terracotta if block -23 11 78 yellow_terracotta if block -23 13 78 clay run setblock -23 13 78 yellow_terracotta
