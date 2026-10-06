####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 10 2019 / MARCH 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PurpleRingTotal

# CALCULATE AT SPAWN CHUNK BLOCKS
scoreboard objectives add PurpleRingTotal dummy
scoreboard players set @e[tag=MainElytraAEC] PurpleRingTotal 0
execute if block -25 4 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 5 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 6 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 7 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 8 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 9 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 10 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1
execute if block -25 11 78 purple_terracotta run scoreboard players add @e[tag=MainElytraAEC] PurpleRingTotal 1

execute if entity @e[scores={PurpleRingTotal=1..}] run title @a[tag=PurpleRing] times 5 60 5
execute if entity @e[scores={PurpleRingTotal=1..}] run title @a[tag=PurpleRing] title {"text":"   ","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=1}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 1/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=2}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 2/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=3}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 3/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=4}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 4/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=5}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 5/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=6}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 6/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=7}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 7/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=8}] run title @a[tag=PurpleRing] subtitle {"text":"⦾ 8/8 ⦾","bold":"false","color":"dark_purple"}
execute if entity @e[scores={PurpleRingTotal=1..}] at @a[tag=PurpleRing] run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.6 1
execute if entity @e[scores={PurpleRingTotal=8}] at @a[tag=PurpleRing] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 3 1 1


scoreboard objectives remove PurpleRingTotal


# CHECK FOR ALL RINGS COMPLETED
execute if block -25 4 78 purple_terracotta if block -25 5 78 purple_terracotta if block -25 6 78 purple_terracotta if block -25 7 78 purple_terracotta if block -25 8 78 purple_terracotta if block -25 9 78 purple_terracotta if block -25 10 78 purple_terracotta if block -25 11 78 purple_terracotta if block -25 13 78 clay run setblock -25 13 78 purple_terracotta
