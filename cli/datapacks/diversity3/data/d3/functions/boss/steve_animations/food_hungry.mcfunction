####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 28 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar GoHungry


scoreboard players add @e[tag=MainBossAEC] GoHungry 1

execute if entity @e[scores={GoHungry=1}] run gamerule doTileDrops false
execute if entity @e[scores={GoHungry=1}] run setblock -1024 62 -956 light_gray_concrete destroy
execute if entity @e[scores={GoHungry=1}] run setblock -1023 62 -956 light_gray_concrete_powder destroy
execute if entity @e[scores={GoHungry=1}] run gamerule doTileDrops true

execute if entity @e[scores={GoHungry=20}] run gamerule doTileDrops false
execute if entity @e[scores={GoHungry=20}] run setblock -1025 61 -956 light_gray_concrete destroy
execute if entity @e[scores={GoHungry=20}] run setblock -1024 61 -956 light_gray_concrete_powder destroy
execute if entity @e[scores={GoHungry=20}] run setblock -1023 61 -956 bone_block[axis=z] destroy
execute if entity @e[scores={GoHungry=20}] run setblock -1022 61 -956 light_gray_concrete_powder destroy
execute if entity @e[scores={GoHungry=20}] run gamerule doTileDrops true

execute if entity @e[scores={GoHungry=40}] run gamerule doTileDrops false
execute if entity @e[scores={GoHungry=40}] run setblock -1026 60 -956 light_gray_concrete destroy
execute if entity @e[scores={GoHungry=40}] run setblock -1025 60 -956 cyan_terracotta destroy
execute if entity @e[scores={GoHungry=40}] run setblock -1024 60 -956 light_gray_concrete destroy
execute if entity @e[scores={GoHungry=40}] run setblock -1023 60 -956 light_gray_concrete_powder destroy
execute if entity @e[scores={GoHungry=40}] run setblock -1022 60 -956 light_gray_concrete destroy
execute if entity @e[scores={GoHungry=40}] run gamerule doTileDrops true

execute if entity @e[scores={GoHungry=60}] run gamerule doTileDrops false
execute if entity @e[scores={GoHungry=60}] run fill -1026 59 -956 -1024 59 -956 cyan_terracotta destroy
execute if entity @e[scores={GoHungry=60}] run setblock -1023 59 -956 gray_concrete destroy
execute if entity @e[scores={GoHungry=60}] run gamerule doTileDrops true

execute if entity @e[scores={GoHungry=80}] run gamerule doTileDrops false
execute if entity @e[scores={GoHungry=80}] run fill -1026 58 -956 -1024 58 -956 gray_concrete destroy
execute if entity @e[scores={GoHungry=80}] run gamerule doTileDrops true

execute if entity @e[scores={GoHungry=80..}] run scoreboard objectives remove GoHungry