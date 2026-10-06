####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar YellowTP
#scoreboard objectives setdisplay sidebar YellowTPTimer

execute if block -62 73 1057 redstone_lamp[lit=true] run scoreboard objectives add YellowTP dummy
scoreboard players set @e[tag=MainHubAEC] YellowTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] YellowTP 1
execute align x align y align z as @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] YellowTP 1

execute if entity @e[scores={YellowTP=1..}] run scoreboard objectives add YellowTPTimer dummy
execute if entity @e[scores={YellowTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={YellowTPTimer=25..}] run particle portal -62 75 1057 0.7 1 0.7 0 50 force
execute if entity @e[scores={YellowTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={YellowTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={YellowTPTimer=105}] run setblock -62 74 1057 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={YellowTPTimer=105}] run teleport @a 1 4 65 0 -90

execute if entity @e[scores={YellowTPTimer=1..}] align x align y align z unless entity @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={YellowTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={YellowTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"yellow","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"yellow","bold":false}]


scoreboard players set @e[scores={YellowTP=1,YellowTPTimer=..-1}] YellowTPTimer 1
scoreboard players set @e[scores={YellowTP=2,YellowTPTimer=1..}] YellowTPTimer -1
scoreboard players add @e[scores={YellowTP=1}] YellowTPTimer 1
scoreboard players remove @e[scores={YellowTP=2..}] YellowTPTimer 1

execute if block -62 73 1057 redstone_lamp[lit=false] run scoreboard objectives remove YellowTP
execute if entity @e[scores={YellowTPTimer=-2}] run stopsound @a[x=-62,y=74,z=1057,distance=..6]
execute if entity @e[scores={YellowTPTimer=0..}] unless entity @e[scores={YellowTP=1}] run scoreboard objectives remove YellowTPTimer
execute align x align y align z unless entity @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run scoreboard objectives remove YellowTP
execute align x align y align z unless entity @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run scoreboard objectives remove YellowTPTimer