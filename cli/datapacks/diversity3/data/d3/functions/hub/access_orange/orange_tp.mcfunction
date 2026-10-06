####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OrangeTP
#scoreboard objectives setdisplay sidebar OrangeTPTimer

execute if block -23 87 1091 redstone_lamp[lit=true] run scoreboard objectives add OrangeTP dummy
scoreboard players set @e[tag=MainHubAEC] OrangeTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] OrangeTP 1
execute align x align y align z as @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] OrangeTP 1

execute if entity @e[scores={OrangeTP=1..}] run scoreboard objectives add OrangeTPTimer dummy
execute if entity @e[scores={OrangeTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={OrangeTPTimer=25..}] run particle portal -23 89 1091 0.7 1 0.7 0 50 force
execute if entity @e[scores={OrangeTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={OrangeTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={OrangeTPTimer=105}] run setblock -23 88 1091 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={OrangeTPTimer=105}] run teleport @a 33 4 65 0 -90

execute if entity @e[scores={OrangeTPTimer=1..}] align x align y align z unless entity @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={OrangeTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}

execute if entity @e[scores={OrangeTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"gold","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"gold","bold":false}]
scoreboard players set @e[scores={OrangeTP=1,OrangeTPTimer=..-1}] OrangeTPTimer 1
scoreboard players set @e[scores={OrangeTP=2,OrangeTPTimer=1..}] OrangeTPTimer -1
scoreboard players add @e[scores={OrangeTP=1}] OrangeTPTimer 1
scoreboard players remove @e[scores={OrangeTP=2..}] OrangeTPTimer 1

execute if block -23 87 1091 redstone_lamp[lit=false] run scoreboard objectives remove OrangeTP
execute if entity @e[scores={OrangeTPTimer=-2}] run stopsound @a[x=-23,y=88,z=1091,distance=..6]
execute if entity @e[scores={OrangeTPTimer=0..}] unless entity @e[scores={OrangeTP=1}] run scoreboard objectives remove OrangeTPTimer
execute align x align y align z unless entity @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run scoreboard objectives remove OrangeTP
execute align x align y align z unless entity @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run scoreboard objectives remove OrangeTPTimer