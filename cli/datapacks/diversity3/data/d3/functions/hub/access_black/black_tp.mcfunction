####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlackTP
#scoreboard objectives setdisplay sidebar BlackTPTimer

execute if block 47 89 1090 redstone_lamp[lit=true] run scoreboard objectives add BlackTP dummy
scoreboard players set @e[tag=MainHubAEC] BlackTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] BlackTP 1
execute align x align y align z as @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] BlackTP 1

execute if entity @e[scores={BlackTP=1..}] run scoreboard objectives add BlackTPTimer dummy
execute if entity @e[scores={BlackTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={BlackTPTimer=25..}] run particle portal 47 91 1090 0.7 1 0.7 0 50 force
execute if entity @e[scores={BlackTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={BlackTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={BlackTPTimer=105}] run setblock 47 90 1090 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={BlackTPTimer=105}] run teleport @a -31 4 -31 0 -90

execute if entity @e[scores={BlackTPTimer=1..}] align x align y align z unless entity @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={BlackTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={BlackTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"dark_gray","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"dark_gray","bold":false}]


scoreboard players set @e[scores={BlackTP=1,BlackTPTimer=..-1}] BlackTPTimer 1
scoreboard players set @e[scores={BlackTP=2,BlackTPTimer=1..}] BlackTPTimer -1
scoreboard players add @e[scores={BlackTP=1}] BlackTPTimer 1
scoreboard players remove @e[scores={BlackTP=2..}] BlackTPTimer 1

execute if block 47 89 1090 redstone_lamp[lit=false] run scoreboard objectives remove BlackTP
execute if entity @e[scores={BlackTPTimer=-2}] run stopsound @a[x=47,y=90,z=1090,distance=..6]
execute if entity @e[scores={BlackTPTimer=0..}] unless entity @e[scores={BlackTP=1}] run scoreboard objectives remove BlackTPTimer
execute align x align y align z unless entity @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run scoreboard objectives remove BlackTP
execute align x align y align z unless entity @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run scoreboard objectives remove BlackTPTimer