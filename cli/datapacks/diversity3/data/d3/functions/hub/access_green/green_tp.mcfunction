####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar GreenTP
#scoreboard objectives setdisplay sidebar GreenTPTimer

execute if block 15 70 1033 redstone_lamp[lit=true] run scoreboard objectives add GreenTP dummy
scoreboard players set @e[tag=MainHubAEC] GreenTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] GreenTP 1
execute align x align y align z as @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] GreenTP 1

execute if entity @e[scores={GreenTP=1..}] run scoreboard objectives add GreenTPTimer dummy
execute if entity @e[scores={GreenTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={GreenTPTimer=25..}] run particle portal 15 72 1033 0.7 1 0.7 0 50 force
execute if entity @e[scores={GreenTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={GreenTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={GreenTPTimer=105}] run setblock 15 71 1033 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={GreenTPTimer=105}] run teleport @a 1 4 33 0 -90

execute if entity @e[scores={GreenTPTimer=1..}] align x align y align z unless entity @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={GreenTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={GreenTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"dark_green","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"dark_green","bold":false}]


scoreboard players set @e[scores={GreenTP=1,GreenTPTimer=..-1}] GreenTPTimer 1
scoreboard players set @e[scores={GreenTP=2,GreenTPTimer=1..}] GreenTPTimer -1
scoreboard players add @e[scores={GreenTP=1}] GreenTPTimer 1
scoreboard players remove @e[scores={GreenTP=2..}] GreenTPTimer 1

execute if block 15 70 1033 redstone_lamp[lit=false] run scoreboard objectives remove GreenTP
execute if entity @e[scores={GreenTPTimer=-2}] run stopsound @a[x=15,y=71,z=1033,distance=..6]
execute if entity @e[scores={GreenTPTimer=0..}] unless entity @e[scores={GreenTP=1}] run scoreboard objectives remove GreenTPTimer
execute align x align y align z unless entity @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run scoreboard objectives remove GreenTP
execute align x align y align z unless entity @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run scoreboard objectives remove GreenTPTimer