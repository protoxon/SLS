####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 27 2018 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute if block 8 49 1944 redstone_lamp[lit=true] run scoreboard objectives remove ParkDeaths
execute if block 8 49 1944 redstone_lamp[lit=true] unless entity @e[scores={ArenaRound=3,ArenaTimer=3380..}] run scoreboard objectives setdisplay sidebar ArenaCash

execute if block 8 49 1944 redstone_lamp[lit=true] align x align y align z run give @a[scores={ArenaCash=1..},x=8,y=50,z=1944,dx=0,dy=0,dz=0] gold_nugget
execute if block 8 49 1944 redstone_lamp[lit=true] align x align y align z run scoreboard players remove @a[scores={ArenaCash=1..},x=8,y=50,z=1944,dx=0,dy=0,dz=0] ArenaCash 1
