####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# TRACK LIFE TIME STATS
execute unless entity @a[scores={LifeTimeKills=0..}] run scoreboard objectives add LifeTimeKills totalKillCount {"text":"Diversity 3 Kills","color":"light_purple","bold":"true","underlined":"true"}
execute unless entity @a[scores={LifeTimeDeaths=0..}] run scoreboard objectives add LifeTimeDeaths deathCount {"text":"Diversity 3 Deaths","color":"light_purple","bold":"true","underlined":"true"}
#scoreboard players add @a[name=!qmagnet] LifeTimeKills 0
#scoreboard players add @a[name=!qmagnet] LifeTimeDeaths 0


#scoreboard objectives add FinalStatTimer dummy
#execute if entity @e[scores={FinaleChurchDoor=100}] run scoreboard objectives add FinalStatTimer dummy
#scoreboard players add @e[tag=MainHubAEC] FinalStatTimer 1
#scoreboard players set @e[scores={FinalStatTimer=161..}] FinalStatTimer 0
#execute if entity @e[scores={FinalStatTimer=2}] run scoreboard objectives setdisplay sidebar LifeTimeKills
#execute if entity @e[scores={FinalStatTimer=80}] run scoreboard objectives setdisplay sidebar LifeTimeDeaths
#scoreboard players add @a LifeTimeKills 0
#scoreboard players add @a LifeTimeDeaths 0


#/setblock -48 3 -32 -> execute if entity @a run function d3:life_stats