####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 8 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlueRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add BlueRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] BlueRingTotal 0
execute if block -31 4 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 5 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 6 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 7 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 8 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 9 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 10 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1
execute if block -31 11 78 light_blue_terracotta run scoreboard players add @e[tag=MainElytraAEC] BlueRingTotal 1

execute if entity @e[scores={BlueRingTotal=1..}] run title @a[tag=BlueRing] times 5 60 5
execute if entity @e[scores={BlueRingTotal=1..}] run title @a[tag=BlueRing] title {"text":"   ","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=1}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=2}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=3}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=4}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=5}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=6}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=7}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=8}] run title @a[tag=BlueRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"blue"}
execute if entity @e[scores={BlueRingTotal=1..}] at @a[tag=BlueRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={BlueRingTotal=8}] at @a[tag=BlueRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove BlueRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -31 4 78 light_blue_terracotta if block -31 5 78 light_blue_terracotta if block -31 6 78 light_blue_terracotta if block -31 7 78 light_blue_terracotta if block -31 8 78 light_blue_terracotta if block -31 9 78 light_blue_terracotta if block -31 10 78 light_blue_terracotta if block -31 11 78 light_blue_terracotta if block -31 13 78 clay run setblock -31 13 78 light_blue_terracotta
