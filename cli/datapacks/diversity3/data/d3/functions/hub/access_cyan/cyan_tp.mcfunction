####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar CyanTP
#scoreboard objectives setdisplay sidebar CyanTPTimer

execute if block 10 67 888 redstone_lamp[lit=true] run scoreboard objectives add CyanTP dummy
scoreboard players set @e[tag=MainHubAEC] CyanTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] CyanTP 1
execute align x align y align z as @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] CyanTP 1

execute if entity @e[scores={CyanTP=1..}] run scoreboard objectives add CyanTPTimer dummy
execute if entity @e[scores={CyanTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={CyanTPTimer=25..}] run particle portal 10 69 888 0.7 1 0.7 0 50 force
execute if entity @e[scores={CyanTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={CyanTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={CyanTPTimer=105}] run setblock 10 68 888 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={CyanTPTimer=105}] run teleport @a -31 4 33 0 -90

execute if entity @e[scores={CyanTPTimer=1..}] align x align y align z unless entity @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={CyanTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={CyanTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"dark_aqua","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"dark_aqua","bold":false}]

scoreboard players set @e[scores={CyanTP=1,CyanTPTimer=..-1}] CyanTPTimer 1
scoreboard players set @e[scores={CyanTP=2,CyanTPTimer=1..}] CyanTPTimer -1
scoreboard players add @e[scores={CyanTP=1}] CyanTPTimer 1
scoreboard players remove @e[scores={CyanTP=2..}] CyanTPTimer 1

execute if block 10 67 888 redstone_lamp[lit=false] run scoreboard objectives remove CyanTP
execute if entity @e[scores={CyanTPTimer=-2}] run stopsound @a[x=10,y=68,z=888,distance=..6]
execute if entity @e[scores={CyanTPTimer=0..}] unless entity @e[scores={CyanTP=1}] run scoreboard objectives remove CyanTPTimer
execute align x align y align z unless entity @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run scoreboard objectives remove CyanTP
execute align x align y align z unless entity @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run scoreboard objectives remove CyanTPTimer