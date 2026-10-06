####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 8 2019 / MARCH 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LimeRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add LimeRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] LimeRingTotal 0
execute if block -30 4 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 5 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 6 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 7 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 8 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 9 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 10 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1
execute if block -30 11 78 lime_terracotta run scoreboard players add @e[tag=MainElytraAEC] LimeRingTotal 1

execute if entity @e[scores={LimeRingTotal=1..}] run title @a[tag=LimeRing] times 5 60 5
execute if entity @e[scores={LimeRingTotal=1..}] run title @a[tag=LimeRing] title {"text":"   ","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=1}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=2}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=3}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=4}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=5}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=6}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=7}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=8}] run title @a[tag=LimeRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"green"}
execute if entity @e[scores={LimeRingTotal=1..}] at @a[tag=LimeRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={LimeRingTotal=8}] at @a[tag=LimeRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove LimeRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -30 4 78 lime_terracotta if block -30 5 78 lime_terracotta if block -30 6 78 lime_terracotta if block -30 7 78 lime_terracotta if block -30 8 78 lime_terracotta if block -30 9 78 lime_terracotta if block -30 10 78 lime_terracotta if block -30 11 78 lime_terracotta if block -30 13 78 clay run setblock -30 13 78 lime_terracotta
