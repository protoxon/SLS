####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 24 2018 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=1130,y=192,z=-929,dx=4,dy=2,dz=4] 1132 192 -930
execute align x align y align z run spawnpoint @a[x=1080,y=192,z=-930,dx=4,dy=2,dz=4] 1077 192 -929


# COMPLETE YELLOW
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={YellowParkour=0}] YellowParkour 1
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run setblock 39 1 -18 yellow_concrete

execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=1076,y=191,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0



# QUIT YELLOW
execute align x align y align z if entity @a[x=1141,y=160,z=-929,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1141,y=160,z=-929,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1141,y=160,z=-929,dx=0,dy=0,dz=0] run teleport @a 1004 66 -998 301 0
