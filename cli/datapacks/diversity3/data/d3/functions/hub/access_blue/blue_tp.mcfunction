####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlueTP
#scoreboard objectives setdisplay sidebar BlueTPTimer

execute if block 60 93 940 redstone_lamp[lit=true] run scoreboard objectives add BlueTP dummy
scoreboard players set @e[tag=MainHubAEC] BlueTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] BlueTP 1
execute align x align y align z as @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] BlueTP 1

execute if entity @e[scores={BlueTP=1..}] run scoreboard objectives add BlueTPTimer dummy
execute if entity @e[scores={BlueTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={BlueTPTimer=25..}] run particle portal 60 95 940 0.7 1 0.7 0 50 force
execute if entity @e[scores={BlueTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={BlueTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={BlueTPTimer=105}] run setblock 60 94 940 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={BlueTPTimer=105}] run teleport @a -31 4 1 0 -90

execute if entity @e[scores={BlueTPTimer=1..}] align x align y align z unless entity @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={BlueTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={BlueTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"blue","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"blue","bold":false}]

scoreboard players set @e[scores={BlueTP=1,BlueTPTimer=..-1}] BlueTPTimer 1
scoreboard players set @e[scores={BlueTP=2,BlueTPTimer=1..}] BlueTPTimer -1
scoreboard players add @e[scores={BlueTP=1}] BlueTPTimer 1
scoreboard players remove @e[scores={BlueTP=2..}] BlueTPTimer 1

execute if block 60 93 940 redstone_lamp[lit=false] run scoreboard objectives remove BlueTP
execute if entity @e[scores={BlueTPTimer=-2}] run stopsound @a[x=60,y=94,z=940,distance=..6]
execute if entity @e[scores={BlueTPTimer=0..}] unless entity @e[scores={BlueTP=1}] run scoreboard objectives remove BlueTPTimer
execute align x align y align z unless entity @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run scoreboard objectives remove BlueTP
execute align x align y align z unless entity @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run scoreboard objectives remove BlueTPTimer