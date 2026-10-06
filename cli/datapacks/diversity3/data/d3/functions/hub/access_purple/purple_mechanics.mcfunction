####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ElytraAccess
#scoreboard objectives setdisplay sidebar ElytraDeaths

# ELYTRA ACCESS -> BAT
scoreboard objectives add ElytraAccess dummy
scoreboard players add @e[tag=MainHubAEC] ElytraAccess 1
execute if entity @e[tag=ElytraBat] run scoreboard objectives remove ElytraAccess
execute if entity @e[scores={ElytraAccess=499}] run particle portal 49 57 925 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={ElytraAccess=500}] run playsound entity.enderman.teleport master @a 49 57 925 0.5 1 0
execute if entity @e[scores={ElytraAccess=500..}] run summon bat 49 57 925 {NoAI:true,Tags:["ElytraBat"]}
execute if entity @e[tag=ElytraBat,nbt={HurtTime:10s}] run function d3:hub/access_purple/kill_bat

execute if entity @a[nbt={Inventory:[{id:"minecraft:elytra"}]}] run scoreboard objectives add ElytraDeaths deathCount
execute unless entity @a[nbt={Inventory:[{id:"minecraft:elytra"}]}] run scoreboard objectives remove ElytraDeaths
execute as @a[scores={ElytraDeaths=1..}] run clear @s elytra
scoreboard players reset @a[scores={ElytraDeaths=1..}] ElytraDeaths