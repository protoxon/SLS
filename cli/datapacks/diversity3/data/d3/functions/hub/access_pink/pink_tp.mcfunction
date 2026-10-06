####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PinkTP
#scoreboard objectives setdisplay sidebar PinkTPTimer

execute if block -33 81 930 redstone_lamp[lit=true] run scoreboard objectives add PinkTP dummy
scoreboard players set @e[tag=MainHubAEC] PinkTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] PinkTP 1
execute align x align y align z as @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] PinkTP 1

execute if entity @e[scores={PinkTP=1..}] run scoreboard objectives add PinkTPTimer dummy
execute if entity @e[scores={PinkTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={PinkTPTimer=25..}] run particle portal -33 83 930 0.7 1 0.7 0 50 force
execute if entity @e[scores={PinkTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={PinkTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={PinkTPTimer=105}] run setblock -33 82 930 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={PinkTPTimer=105}] run teleport @a 33 4 -31 0 -90

execute if entity @e[scores={PinkTPTimer=1..}] align x align y align z unless entity @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={PinkTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={PinkTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"light_purple","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"light_purple","bold":false}]

scoreboard players set @e[scores={PinkTP=1,PinkTPTimer=..-1}] PinkTPTimer 1
scoreboard players set @e[scores={PinkTP=2,PinkTPTimer=1..}] PinkTPTimer -1
scoreboard players add @e[scores={PinkTP=1}] PinkTPTimer 1
scoreboard players remove @e[scores={PinkTP=2..}] PinkTPTimer 1

execute if block -33 81 930 redstone_lamp[lit=false] run scoreboard objectives remove PinkTP
execute if entity @e[scores={PinkTPTimer=-2}] run stopsound @a[x=-33,y=82,z=930,distance=..6]
execute if entity @e[scores={PinkTPTimer=0..}] unless entity @e[scores={PinkTP=1}] run scoreboard objectives remove PinkTPTimer
execute align x align y align z unless entity @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run scoreboard objectives remove PinkTP
execute align x align y align z unless entity @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run scoreboard objectives remove PinkTPTimer