####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MAY 31 2018 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute align x align y align z run teleport @a[x=1121,y=127,z=-1088,dx=0,dy=1,dz=0] 1120 117 -1087 90 0
execute align x align y align z as @a[x=1052,y=8,z=-1150,dx=98,dy=240,dz=98] at @s run execute if block ~ ~5 ~ water run teleport @s 1116 69 -1104 90 0

# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=1087,y=69,z=-1101,dx=0,dy=1,dz=6] 1081 69 -1102
execute align x align y align z run spawnpoint @a[x=1080,y=117,z=-1115,dx=2,dy=1,dz=2] 1081 117 -1113
execute align x align y align z run spawnpoint @a[x=1080,y=109,z=-1114,dx=2,dy=1,dz=2] 1081 106 -1110
execute align x align y align z run spawnpoint @a[x=1080,y=105,z=-1098,dx=2,dy=4,dz=2] 1081 100 -1093
execute align x align y align z run spawnpoint @a[x=1080,y=113,z=-1099,dx=2,dy=4,dz=2] 1081 113 -1097

execute as @e[tag=ParkourNinja] at @s run execute if block ~ ~ ~ water run advancement grant @a only d3:folder_c/man_overboard
execute as @e[tag=ParkourPirate] at @s run execute if block ~ ~ ~ water run advancement grant @a only d3:folder_c/man_overboard


# COMPLETE BLACK
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run scoreboard players set @e[scores={BlackParkour=0}] BlackParkour 1
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run setblock 37 1 -18 black_concrete

execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=1073,y=97,z=-1083,dx=0,dy=4,dz=2] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0


# QUIT BLACK
execute align x align y align z if entity @a[x=1121,y=72,z=-1076,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1121,y=72,z=-1076,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1121,y=72,z=-1076,dx=0,dy=0,dz=0] run teleport @a 1002 66 -1003 200 0
