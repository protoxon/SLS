####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# NOVEMBER 29 2018 / MARCH 27 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives add BossDeaths deathCount {"text":"Battle Scars","color":"gray","bold":"true","underlined":"true"}
scoreboard objectives setdisplay sidebar BossDeaths


#scoreboard objectives setdisplay sidebar PlayerHealth

scoreboard objectives add PlayerHealth dummy
scoreboard players add @e[tag=MainBossAEC] PlayerHealth 1
scoreboard players set @e[scores={PlayerHealth=25..}] PlayerHealth 0

effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

tag @a add GetHealth
execute at @e[tag=BossMob] run tag @a[distance=..2] remove GetHealth
tag @a[nbt=!{Fire:-20s}] remove GetHealth

execute if entity @e[scores={PlayerHealth=1}] run effect give @a[tag=GetHealth,nbt=!{Health:20.0f}] regeneration 1 2 true


execute align x align y align z if entity @a[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] run gamerule showDeathMessages false
execute align x align y align z run tag @a[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] add FallenOff
execute align x align y align z if entity @a[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] run kill @a[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79,gamemode=!spectator]
execute align x align y align z unless entity @a[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] run gamerule showDeathMessages true

execute align x align y align z if entity @e[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] run kill @e[type=item,x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79]
execute align x align y align z if entity @e[x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79] run kill @e[tag=BossMob,x=-1054,y=47,z=-1009,dx=77,dy=0,dz=79]