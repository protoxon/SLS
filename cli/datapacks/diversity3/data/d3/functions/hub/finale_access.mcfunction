####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 24 2019 / FEBRUARY 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar FinaleAccess

scoreboard objectives add FinaleAccess dummy

scoreboard players add @e[tag=MainHubAEC] FinaleAccess 1

execute if entity @e[scores={FinaleAccess=145}] run fill 4 247 994 13 254 1003 air
execute if entity @e[scores={FinaleAccess=145}] run time set 18000
execute if entity @e[scores={FinaleAccess=150}] at @a run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={FinaleAccess=230}] run time set 6000
execute if entity @e[scores={FinaleAccess=250}] run time set 18000
execute if entity @e[scores={FinaleAccess=282}] run playsound entity.lightning_bolt.impact master @a 8 87 998 3 1 1
execute if entity @e[scores={FinaleAccess=282}] run summon lightning_bolt 8 87 998
execute if entity @e[scores={FinaleAccess=285}] run time set 6000
execute if entity @e[scores={FinaleAccess=285}] run fill 7 87 997 9 87 999 stone_slab
execute if entity @e[scores={FinaleAccess=285}] run fill 8 86 998 8 87 998 light_blue_stained_glass
execute if entity @e[scores={FinaleAccess=285}] run playsound music.dragon master @a 8 100 998 20 1 1
execute if entity @e[scores={FinaleAccess=285}] run spawnpoint @a 8 87 994
execute if entity @e[scores={FinaleAccess=285}] run fill 1 2 110 10 2 110 clay
execute if entity @e[scores={FinaleAccess=285}] run fill 1 6 110 10 6 110 clay
execute if entity @e[scores={FinaleAccess=285}] run setblock 1 6 14 light_blue_wool



#execute if entity @e[scores={FinaleAccess=300..}] run scoreboard objectives remove FinaleAccess
