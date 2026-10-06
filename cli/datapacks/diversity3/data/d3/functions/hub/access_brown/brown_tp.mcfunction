####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BrownTP
#scoreboard objectives setdisplay sidebar BrownTPTimer

execute if block 106 77 980 redstone_lamp[lit=true] run scoreboard objectives add BrownTP dummy
scoreboard players set @e[tag=MainHubAEC] BrownTP 1
execute as @a run scoreboard players add @e[tag=MainHubAEC] BrownTP 1
execute align x align y align z as @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run scoreboard players remove @e[tag=MainHubAEC] BrownTP 1

execute if entity @e[scores={BrownTP=1..}] run scoreboard objectives add BrownTPTimer dummy
execute if entity @e[scores={BrownTPTimer=15}] run summon area_effect_cloud 8 2 8 {Tags:["ServerCrashFailSafeAEC"],Duration:160}
execute if entity @e[scores={BrownTPTimer=25..}] run particle portal 106 79 980 0.7 1 0.7 0 50 force
execute if entity @e[scores={BrownTPTimer=25}] at @a run playsound block.portal.trigger master @a
execute if entity @e[scores={BrownTPTimer=104}] run effect give @a blindness 2 255 true
#execute if entity @e[scores={BrownTPTimer=105}] run setblock 106 78 980 heavy_weighted_pressure_plate[power=0]
execute if entity @e[scores={BrownTPTimer=105}] run teleport @a 1 4 -31 0 -90

execute if entity @e[scores={BrownTPTimer=1..}] align x align y align z unless entity @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run stopsound @a

#execute if entity @e[scores={BrownTPTimer=-100}] run tellraw @a {"text":"","extra":[{"text":"۞ All players must be on teleporter for activation ۞","color":"white"}]}
execute if entity @e[scores={BrownTPTimer=-100}] run tellraw @a ["",{"text":"⬛","color":"dark_red","bold":false},{"text":" All players must be on teleporter for activation ","color":"white","bold":false,"underlined":false},{"text":"⬛","color":"dark_red","bold":false}]

scoreboard players set @e[scores={BrownTP=1,BrownTPTimer=..-1}] BrownTPTimer 1
scoreboard players set @e[scores={BrownTP=2,BrownTPTimer=1..}] BrownTPTimer -1
scoreboard players add @e[scores={BrownTP=1}] BrownTPTimer 1
scoreboard players remove @e[scores={BrownTP=2..}] BrownTPTimer 1

execute if block 106 77 980 redstone_lamp[lit=false] run scoreboard objectives remove BrownTP
execute if entity @e[scores={BrownTPTimer=-2}] run stopsound @a[x=106,y=78,z=980,distance=..6]
execute if entity @e[scores={BrownTPTimer=0..}] unless entity @e[scores={BrownTP=1}] run scoreboard objectives remove BrownTPTimer
execute align x align y align z unless entity @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run scoreboard objectives remove BrownTP
execute align x align y align z unless entity @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run scoreboard objectives remove BrownTPTimer