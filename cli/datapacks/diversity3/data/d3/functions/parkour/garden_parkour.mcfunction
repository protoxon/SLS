####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 28 2018 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect give @a night_vision 12 255 true


# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=1141,y=31,z=-995,dx=7,dy=1,dz=7] 1146 32 -996
execute align x align y align z run spawnpoint @a[x=1094,y=52,z=-1031,dx=1,dy=1,dz=2] 1088 60 -1028
execute align x align y align z run spawnpoint @a[x=1060,y=50,z=-986,dx=4,dy=8,dz=4] 1061 58 -985


# COMPLETE BROWN
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={BrownParkour=0}] BrownParkour 1
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run setblock 38 1 -18 brown_concrete
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run effect clear @a night_vision

execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=1104,y=69,z=-973,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0



# QUIT BROWN
execute align x align y align z if entity @a[x=1135,y=31,z=-1003,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1135,y=31,z=-1003,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1135,y=31,z=-1003,dx=0,dy=0,dz=0] run effect clear @a night_vision
execute align x align y align z if entity @a[x=1135,y=31,z=-1003,dx=0,dy=0,dz=0] run teleport @a 1004 66 -1002 272 5
