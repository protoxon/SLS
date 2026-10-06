####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar RedTP
#scoreboard objectives setdisplay sidebar RedTPTimer

execute if block 105 90 1049 redstone_lamp[lit=true] run scoreboard objectives add RedTP dummy
scoreboard players set @e[tag=MainHubAEC] RedTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] RedTP 1
execute align x align y align z as @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] RedTP 1

execute if entity @e[scores={RedTP=1..}] run scoreboard objectives add RedTPTimer dummy
execute if entity @e[scores={RedTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={RedTPTimer=25..}] run particle portal 105 92 1049 0.7 1 0.7 0 50 force
execute if entity @e[scores={RedTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={RedTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={RedTPTimer=105}] run setblock 105 91 1049 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={RedTPTimer=105}] run teleport @a 33 4 1 0 -90

execute if entity @e[scores={RedTPTimer=1..}] align x align y align z unless entity @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={RedTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={RedTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"red","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"red","bold":false}]


scoreboard players set @e[scores={RedTP=1,RedTPTimer=..-1}] RedTPTimer 1
scoreboard players set @e[scores={RedTP=2,RedTPTimer=1..}] RedTPTimer -1
scoreboard players add @e[scores={RedTP=1}] RedTPTimer 1
scoreboard players remove @e[scores={RedTP=2..}] RedTPTimer 1

execute if block 105 90 1049 redstone_lamp[lit=false] run scoreboard objectives remove RedTP
execute if entity @e[scores={RedTPTimer=-2}] run stopsound @a[x=105,y=91,z=1049,distance=..6]
execute if entity @e[scores={RedTPTimer=0..}] unless entity @e[scores={RedTP=1}] run scoreboard objectives remove RedTPTimer
execute align x align y align z unless entity @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run scoreboard objectives remove RedTP
execute align x align y align z unless entity @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run scoreboard objectives remove RedTPTimer
