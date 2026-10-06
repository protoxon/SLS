####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PurpleTP
#scoreboard objectives setdisplay sidebar PurpleTPTimer

execute if block 89 38 824 redstone_lamp[lit=true] run scoreboard objectives add PurpleTP dummy
scoreboard players set @e[tag=MainHubAEC] PurpleTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] PurpleTP 1
execute align x align y align z as @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] PurpleTP 1

execute if entity @e[scores={PurpleTP=1..}] run scoreboard objectives add PurpleTPTimer dummy
execute if entity @e[scores={PurpleTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={PurpleTPTimer=25..}] run particle portal 89 40 824 0.7 1 0.7 0 50 force
execute if entity @e[scores={PurpleTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={PurpleTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={PurpleTPTimer=105}] run setblock 89 39 824 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={PurpleTPTimer=105}] run teleport @a -31 4 65 0 -90

execute if entity @e[scores={PurpleTPTimer=1..}] align x align y align z unless entity @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={PurpleTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={PurpleTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"dark_purple","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"dark_purple","bold":false}]

scoreboard players set @e[scores={PurpleTP=1,PurpleTPTimer=..-1}] PurpleTPTimer 1
scoreboard players set @e[scores={PurpleTP=2,PurpleTPTimer=1..}] PurpleTPTimer -1
scoreboard players add @e[scores={PurpleTP=1}] PurpleTPTimer 1
scoreboard players remove @e[scores={PurpleTP=2..}] PurpleTPTimer 1

execute if block 89 38 824 redstone_lamp[lit=false] run scoreboard objectives remove PurpleTP
execute if entity @e[scores={PurpleTPTimer=-2}] run stopsound @a[x=89,y=39,z=824,distance=..6]
execute if entity @e[scores={PurpleTPTimer=0..}] unless entity @e[scores={PurpleTP=1}] run scoreboard objectives remove PurpleTPTimer
execute align x align y align z unless entity @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run scoreboard objectives remove PurpleTP
execute align x align y align z unless entity @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run scoreboard objectives remove PurpleTPTimer