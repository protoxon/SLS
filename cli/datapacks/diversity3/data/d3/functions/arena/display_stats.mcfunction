####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DisplayTimer

scoreboard objectives add DisplayTimer dummy

scoreboard players add @e[tag=MainArenaAEC] DisplayTimer 1
scoreboard players set @e[scores={DisplayTimer=161..}] DisplayTimer 0

execute if entity @e[scores={DisplayTimer=1}] run scoreboard objectives setdisplay sidebar PlayerKillCount
execute if entity @e[scores={DisplayTimer=80}] if entity @a[scores={ArenaDeaths=1..}] run scoreboard objectives setdisplay sidebar ArenaDeaths

