####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 9 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BrownRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add BrownRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] BrownRingTotal 0
execute if block -26 4 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 5 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 6 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 7 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 8 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 9 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 10 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1
execute if block -26 11 78 brown_terracotta run scoreboard players add @e[tag=MainElytraAEC] BrownRingTotal 1

execute if entity @e[scores={BrownRingTotal=1..}] run title @a[tag=BrownRing] times 5 60 5
execute if entity @e[scores={BrownRingTotal=1..}] run title @a[tag=BrownRing] title {"text":"   ","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=1}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=2}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=3}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=4}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=5}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=6}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=7}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=8}] run title @a[tag=BrownRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"dark_red"}
execute if entity @e[scores={BrownRingTotal=1..}] at @a[tag=BrownRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={BrownRingTotal=8}] at @a[tag=BrownRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove BrownRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -26 4 78 brown_terracotta if block -26 5 78 brown_terracotta if block -26 6 78 brown_terracotta if block -26 7 78 brown_terracotta if block -26 8 78 brown_terracotta if block -26 9 78 brown_terracotta if block -26 10 78 brown_terracotta if block -26 11 78 brown_terracotta if block -26 13 78 clay run setblock -26 13 78 brown_terracotta
