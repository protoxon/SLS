####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 6 2019 / JANUARY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BossGateDown

scoreboard players add @e[scores={BossGateDown=0..}] BossGateDown 1


# ALCOVE 1
execute if entity @e[scores={BossGateDown=1}] run playsound block.ender_chest.close master @a 0 67 2021 1 0.5 0.5


execute if entity @e[scores={BossGateDown=2}] run fill -2 67 2021 2 67 2021 air
execute if entity @e[scores={BossGateDown=2}] run fill -2 62 2021 2 62 2021 polished_andesite
execute if entity @e[scores={BossGateDown=2}] run fill -2 63 2021 2 66 2021 iron_bars[east=true,west=true]

execute if entity @e[scores={BossGateDown=4}] run fill -2 66 2021 2 66 2021 air
execute if entity @e[scores={BossGateDown=4}] run fill -2 61 2021 2 61 2021 polished_andesite
execute if entity @e[scores={BossGateDown=4}] run fill -2 62 2021 2 65 2021 iron_bars[east=true,west=true]

execute if entity @e[scores={BossGateDown=6}] run fill -2 65 2021 2 65 2021 air
execute if entity @e[scores={BossGateDown=6}] run fill -2 60 2021 2 60 2021 polished_andesite
execute if entity @e[scores={BossGateDown=6}] run fill -2 61 2021 2 64 2021 iron_bars[east=true,west=true]

execute if entity @e[scores={BossGateDown=8}] run fill -2 64 2021 2 64 2021 air
execute if entity @e[scores={BossGateDown=8}] run fill -2 59 2021 2 59 2021 polished_andesite
execute if entity @e[scores={BossGateDown=8}] run fill -2 60 2021 2 63 2021 iron_bars[east=true,west=true]

execute if entity @e[scores={BossGateDown=8}] run playsound entity.blaze.hurt master @a 0 63 2021 1 0.5 0.5


execute if entity @e[scores={BossGateDown=9..}] run scoreboard objectives remove BossGateDown