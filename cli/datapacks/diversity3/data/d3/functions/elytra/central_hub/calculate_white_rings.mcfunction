####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 6 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar WhiteRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add WhiteRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] WhiteRingTotal 0
execute if block -27 4 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 5 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 6 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 7 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 8 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 9 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 10 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1
execute if block -27 11 78 white_terracotta run scoreboard players add @e[tag=MainElytraAEC] WhiteRingTotal 1

execute if entity @e[scores={WhiteRingTotal=1..}] run title @a[tag=WhiteRing] times 5 60 5
execute if entity @e[scores={WhiteRingTotal=1..}] run title @a[tag=WhiteRing] title {"text":"   ","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=1}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=2}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=3}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=4}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=5}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=6}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=7}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=8}] run title @a[tag=WhiteRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"white"}
execute if entity @e[scores={WhiteRingTotal=1..}] at @a[tag=WhiteRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={WhiteRingTotal=8}] at @a[tag=WhiteRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove WhiteRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -27 4 78 white_terracotta if block -27 5 78 white_terracotta if block -27 6 78 white_terracotta if block -27 7 78 white_terracotta if block -27 8 78 white_terracotta if block -27 9 78 white_terracotta if block -27 10 78 white_terracotta if block -27 11 78 white_terracotta if block -27 13 78 clay run setblock -27 13 78 white_terracotta
