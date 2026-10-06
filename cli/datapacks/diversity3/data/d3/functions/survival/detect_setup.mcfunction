####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute align x align y align z if entity @a[x=8,y=48,z=-1000,dx=0,dy=1,dz=0] run setblock 12 6 -18 redstone_block
execute align x align y align z if entity @e[type=!player,x=8,y=48,z=-1000,dx=0,dy=1,dz=0] align x align y align z run kill @e[type=!player,x=8,y=48,z=-1000,dx=0,dy=1,dz=0]