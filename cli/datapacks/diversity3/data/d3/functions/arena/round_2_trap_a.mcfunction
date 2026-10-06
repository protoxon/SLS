####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / FEBRUARY 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives setdisplay sidebar R2TrapA

scoreboard objectives add R2TrapA dummy
scoreboard players add @e[tag=MainArenaAEC] R2TrapA 1
scoreboard players set @e[scores={R2TrapA=20..}] R2TrapA 0

execute if entity @e[scores={R2TrapA=1}] run fill -17 58 1997 -15 58 1999 sandstone
execute if entity @e[scores={R2TrapA=2}] run fill -17 59 1997 -15 59 1999 dropper[facing=up]
execute if entity @e[scores={R2TrapA=2}] run fill -17 59 1997 -15 59 1999 dispenser[facing=up]{Items:[{Slot:4b,id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:harming"}}],Lock:"Arena"}
execute if entity @e[scores={R2TrapA=3}] run fill -17 58 1997 -15 58 1999 redstone_block

execute if entity @e[scores={R2TrapA=5}] run fill -17 58 1997 -15 58 1999 sandstone