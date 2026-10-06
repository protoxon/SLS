####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 7 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar GreenRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add GreenRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] GreenRingTotal 0
execute if block -28 4 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 5 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 6 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 7 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 8 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 9 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 10 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1
execute if block -28 11 78 green_terracotta run scoreboard players add @e[tag=MainElytraAEC] GreenRingTotal 1

execute if entity @e[scores={GreenRingTotal=1..}] run title @a[tag=GreenRing] times 5 60 5
execute if entity @e[scores={GreenRingTotal=1..}] run title @a[tag=GreenRing] title {"text":"   ","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=1}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=2}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=3}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=4}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=5}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=6}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=7}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=8}] run title @a[tag=GreenRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"dark_green"}
execute if entity @e[scores={GreenRingTotal=1..}] at @a[tag=GreenRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={GreenRingTotal=8}] at @a[tag=GreenRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove GreenRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -28 4 78 green_terracotta if block -28 5 78 green_terracotta if block -28 6 78 green_terracotta if block -28 7 78 green_terracotta if block -28 8 78 green_terracotta if block -28 9 78 green_terracotta if block -28 10 78 green_terracotta if block -28 11 78 green_terracotta if block -28 13 78 clay run setblock -28 13 78 green_terracotta
