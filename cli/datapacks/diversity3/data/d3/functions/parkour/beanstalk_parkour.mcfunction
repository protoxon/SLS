####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 28 2018 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute align x align y align z run effect give @a[x=850,y=3,z=-1048,dx=98,dy=139,dz=98] night_vision 12 255 true
execute align x align y align z run advancement grant @a[x=872,y=252,z=-1007,dx=0,dy=0,dz=0] only d3:folder_c/stalk_top

execute unless block 892 34 -980 spruce_trapdoor[open=false] run setblock 892 34 -980 spruce_trapdoor[open=false]
execute unless block 892 34 -979 spruce_trapdoor[open=false] run setblock 892 34 -979 spruce_trapdoor[open=false]
execute unless block 893 34 -980 spruce_trapdoor[open=false] run setblock 893 34 -980 spruce_trapdoor[open=false]
execute unless block 893 34 -979 spruce_trapdoor[open=false] run setblock 893 34 -979 spruce_trapdoor[open=false]
fill 887 34 -984 891 39 -984 spruce_trapdoor[facing=north,open=true,half=top] replace oak_trapdoor


# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=877,y=139,z=-1007,dx=3,dy=2,dz=3] 881 141 -1022
execute align x align y align z run spawnpoint @a[x=947,y=153,z=-987,dx=0,dy=0,dz=0] 937 153 -1007


# COMPLETE GREEN
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={GreenParkour=0}] GreenParkour 1
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run setblock 34 1 -18 green_concrete

execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run effect clear @a night_vision

execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=928,y=168,z=-995,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0


# QUIT GREEN
execute align x align y align z if entity @a[x=890,y=32,z=-973,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=890,y=32,z=-973,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=890,y=32,z=-973,dx=0,dy=0,dz=0] run effect clear @a night_vision
execute align x align y align z if entity @a[x=890,y=32,z=-973,dx=0,dy=0,dz=0] run teleport @a 997 66 -998 77 5
