####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LimeTP
#scoreboard objectives setdisplay sidebar LimeTPTimer

execute if block -65 90 981 redstone_lamp[lit=true] run scoreboard objectives add LimeTP dummy
scoreboard players set @e[tag=MainHubAEC] LimeTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] LimeTP 1
execute align x align y align z as @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] LimeTP 1

execute if entity @e[scores={LimeTP=1..}] run scoreboard objectives add LimeTPTimer dummy
execute if entity @e[scores={LimeTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={LimeTPTimer=25..}] run particle portal -65 92 981 0.7 1 0.7 0 50 force
execute if entity @e[scores={LimeTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={LimeTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={LimeTPTimer=105}] run setblock -65 91 981 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={LimeTPTimer=105}] run teleport @a 33 4 33 0 -90

execute if entity @e[scores={LimeTPTimer=1..}] align x align y align z unless entity @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={LimeTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={LimeTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"green","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"green","bold":false}]


scoreboard players set @e[scores={LimeTP=1,LimeTPTimer=..-1}] LimeTPTimer 1
scoreboard players set @e[scores={LimeTP=2,LimeTPTimer=1..}] LimeTPTimer -1
scoreboard players add @e[scores={LimeTP=1}] LimeTPTimer 1
scoreboard players remove @e[scores={LimeTP=2..}] LimeTPTimer 1

execute if block -65 90 981 redstone_lamp[lit=false] run scoreboard objectives remove LimeTP
execute if entity @e[scores={LimeTPTimer=-2}] run stopsound @a[x=-65,y=91,z=981,distance=..6]
execute if entity @e[scores={LimeTPTimer=0..}] unless entity @e[scores={LimeTP=1}] run scoreboard objectives remove LimeTPTimer
execute align x align y align z unless entity @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run scoreboard objectives remove LimeTP
execute align x align y align z unless entity @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run scoreboard objectives remove LimeTPTimer