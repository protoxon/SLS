####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# FEBRUARY 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar WinGateDown

scoreboard players add @e[scores={WinGateDown=0..}] WinGateDown 1


# WIN GATE
execute if entity @e[scores={WinGateDown=1}] run playsound block.ender_chest.close master @a 0 72 1961 1 0.5 0.5


execute if entity @e[scores={WinGateDown=2}] run fill -2 75 1961 2 75 1961 air
execute if entity @e[scores={WinGateDown=2}] run fill -2 70 1961 2 70 1961 polished_andesite
execute if entity @e[scores={WinGateDown=2}] run fill -2 71 1961 2 74 1961 iron_bars[east=true,west=true]

execute if entity @e[scores={WinGateDown=4}] run fill -2 74 1961 2 73 1961 air
execute if entity @e[scores={WinGateDown=4}] run fill -2 69 1961 2 69 1961 polished_andesite
execute if entity @e[scores={WinGateDown=4}] run fill -2 70 1961 2 73 1961 iron_bars[east=true,west=true]

execute if entity @e[scores={WinGateDown=6}] run fill -2 73 1961 2 73 1961 air
execute if entity @e[scores={WinGateDown=6}] run fill -2 68 1961 2 68 1961 polished_andesite
execute if entity @e[scores={WinGateDown=6}] run fill -2 69 1961 2 72 1961 iron_bars[east=true,west=true]

execute if entity @e[scores={WinGateDown=8}] run fill -2 72 1961 2 72 1961 air
execute if entity @e[scores={WinGateDown=8}] run fill -2 67 1961 2 67 1961 polished_andesite
execute if entity @e[scores={WinGateDown=8}] run fill -2 68 1961 2 71 1961 iron_bars[east=true,west=true]

execute if entity @e[scores={WinGateDown=8}] run playsound entity.blaze.hurt master @a 0 72 1961 1 0.5 0.5


execute if entity @e[scores={WinGateDown=9..}] run scoreboard objectives remove WinGateDown