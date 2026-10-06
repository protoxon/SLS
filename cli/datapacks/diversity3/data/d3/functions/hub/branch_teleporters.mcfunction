####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MAY 12 2018 / AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# ORANGE TP
execute if block -23 88 1091 heavy_weighted_pressure_plate if entity @a[x=-23,y=88,z=1091,distance=..6] run function d3:hub/access_orange/orange_tp
execute align x align y align z unless entity @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run scoreboard objectives remove OrangeTP
execute align x align y align z unless entity @a[x=-24,y=88,z=1090,dx=2,dy=2,dz=2] run scoreboard objectives remove OrangeTPTimer

# YELLOW TP
execute if block -62 74 1057 heavy_weighted_pressure_plate if entity @a[x=-62,y=74,z=1057,distance=..6] run function d3:hub/access_yellow/yellow_tp
execute align x align y align z unless entity @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run scoreboard objectives remove YellowTP
execute align x align y align z unless entity @a[x=-63,y=74,z=1056,dx=2,dy=2,dz=2] run scoreboard objectives remove YellowTPTimer

# LIME TP
execute if block -65 91 981 heavy_weighted_pressure_plate if entity @a[x=-65,y=91,z=981,distance=..6] run function d3:hub/access_lime/lime_tp
execute align x align y align z unless entity @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run scoreboard objectives remove LimeTP
execute align x align y align z unless entity @a[x=-66,y=91,z=980,dx=2,dy=2,dz=2] run scoreboard objectives remove LimeTPTimer

# PINK TP
execute if block -33 82 930 heavy_weighted_pressure_plate if entity @a[x=-33,y=82,z=930,distance=..6] run function d3:hub/access_pink/pink_tp
execute align x align y align z unless entity @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run scoreboard objectives remove PinkTP
execute align x align y align z unless entity @a[x=-34,y=82,z=929,dx=2,dy=2,dz=2] run scoreboard objectives remove PinkTPTimer

# CYAN TP
execute if block 10 68 888 heavy_weighted_pressure_plate if entity @a[x=10,y=68,z=888,distance=..6] run function d3:hub/access_cyan/cyan_tp
execute align x align y align z unless entity @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run scoreboard objectives remove CyanTP
execute align x align y align z unless entity @a[x=9,y=68,z=887,dx=2,dy=2,dz=2] run scoreboard objectives remove CyanTPTimer

# PURPLE TP
execute if block 89 39 824 heavy_weighted_pressure_plate if entity @a[x=89,y=39,z=824,distance=..6] run function d3:hub/access_purple/purple_tp
execute align x align y align z unless entity @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run scoreboard objectives remove PurpleTP
execute align x align y align z unless entity @a[x=88,y=39,z=823,dx=2,dy=2,dz=2] run scoreboard objectives remove PurpleTPTimer

# BLUE TP
execute if block 60 94 940 heavy_weighted_pressure_plate if entity @a[x=60,y=94,z=940,distance=..6] run function d3:hub/access_blue/blue_tp
execute align x align y align z unless entity @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run scoreboard objectives remove BlueTP
execute align x align y align z unless entity @a[x=59,y=94,z=939,dx=2,dy=2,dz=2] run scoreboard objectives remove BlueTPTimer

# BROWN TP
execute if block 106 78 980 heavy_weighted_pressure_plate if entity @a[x=106,y=78,z=980,distance=..6] run function d3:hub/access_brown/brown_tp
execute align x align y align z unless entity @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run scoreboard objectives remove BrownTP
execute align x align y align z unless entity @a[x=105,y=78,z=979,dx=2,dy=2,dz=2] run scoreboard objectives remove BrownTPTimer

# RED TP
execute if block 105 91 1049 heavy_weighted_pressure_plate if entity @a[x=105,y=91,z=1049,distance=..6] run function d3:hub/access_red/red_tp
execute align x align y align z unless entity @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run scoreboard objectives remove RedTP
execute align x align y align z unless entity @a[x=104,y=91,z=1048,dx=2,dy=2,dz=2] run scoreboard objectives remove RedTPTimer

# BLACK TP
execute if block 47 90 1090 heavy_weighted_pressure_plate if entity @a[x=47,y=90,z=1090,distance=..6] run function d3:hub/access_black/black_tp
execute align x align y align z unless entity @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run scoreboard objectives remove BlackTP
execute align x align y align z unless entity @a[x=46,y=90,z=1089,dx=2,dy=2,dz=2] run scoreboard objectives remove BlackTPTimer

# GREEN TP
execute if block 15 71 1033 heavy_weighted_pressure_plate if entity @a[x=15,y=71,z=1033,distance=..6] run function d3:hub/access_green/green_tp
execute align x align y align z unless entity @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run scoreboard objectives remove GreenTP
execute align x align y align z unless entity @a[x=14,y=71,z=1031,dx=2,dy=2,dz=2] run scoreboard objectives remove GreenTPTimer


# BEACON BEAMS
execute if block 11 6 14 gravel if block -23 87 1091 barrier run setblock -23 87 1091 redstone_lamp
execute if block 11 6 14 gravel if block -23 88 1091 orange_carpet run setblock -23 88 1091 heavy_weighted_pressure_plate
execute if block 11 6 14 orange_wool if block -23 87 1091 redstone_lamp run setblock -23 87 1091 barrier
execute if block 11 6 14 orange_wool if block -23 88 1091 heavy_weighted_pressure_plate run setblock -23 88 1091 orange_carpet

execute if block 10 6 14 gravel if block -62 73 1057 barrier run setblock -62 73 1057 redstone_lamp
execute if block 10 6 14 gravel if block -62 74 1057 yellow_carpet run setblock -62 74 1057 heavy_weighted_pressure_plate
execute if block 10 6 14 yellow_wool if block -62 73 1057 redstone_lamp run setblock -62 73 1057 barrier
execute if block 10 6 14 yellow_wool if block -62 74 1057 heavy_weighted_pressure_plate run setblock -62 74 1057 yellow_carpet

execute if block 9 6 14 gravel if block -65 90 981 barrier run setblock -65 90 981 redstone_lamp
execute if block 9 6 14 gravel if block -65 91 981 lime_carpet run setblock -65 91 981 heavy_weighted_pressure_plate
execute if block 9 6 14 lime_wool if block -65 90 981 redstone_lamp run setblock -65 90 981 barrier
execute if block 9 6 14 lime_wool if block -65 91 981 heavy_weighted_pressure_plate run setblock -65 91 981 lime_carpet

execute if block 8 6 14 gravel if block -33 81 930 barrier run setblock -33 81 930 redstone_lamp
execute if block 8 6 14 gravel if block -33 82 930 pink_carpet run setblock -33 82 930 heavy_weighted_pressure_plate
execute if block 8 6 14 pink_wool if block -33 81 930 redstone_lamp run setblock -33 81 930 barrier
execute if block 8 6 14 pink_wool if block -33 82 930 heavy_weighted_pressure_plate run setblock -33 82 930 pink_carpet

execute if block 7 6 14 gravel if block 10 67 888 barrier run setblock 10 67 888 redstone_lamp
execute if block 7 6 14 gravel if block 10 68 888 cyan_carpet run setblock 10 68 888 heavy_weighted_pressure_plate
execute if block 7 6 14 cyan_wool if block 10 67 888 redstone_lamp run setblock 10 67 888 barrier
execute if block 7 6 14 cyan_wool if block 10 68 888 heavy_weighted_pressure_plate run setblock 10 68 888 cyan_carpet

execute if block 6 6 14 gravel if block 89 38 824 barrier run setblock 89 38 824 redstone_lamp
execute if block 6 6 14 gravel if block 89 39 824 purple_carpet run setblock 89 39 824 heavy_weighted_pressure_plate
execute if block 6 6 14 purple_wool if block 89 38 824 redstone_lamp run setblock 89 38 824 barrier
execute if block 6 6 14 purple_wool if block 89 39 824 heavy_weighted_pressure_plate run setblock 89 39 824 purple_carpet

execute if block 5 6 14 gravel if block 60 93 940 barrier run setblock 60 93 940 redstone_lamp
execute if block 5 6 14 gravel if block 60 94 940 blue_carpet run setblock 60 94 940 heavy_weighted_pressure_plate
execute if block 5 6 14 blue_wool if block 60 93 940 redstone_lamp run setblock 60 93 940 barrier
execute if block 5 6 14 blue_wool if block 60 94 940 heavy_weighted_pressure_plate run setblock 60 94 940 blue_carpet

execute if block 4 6 14 gravel if block 106 77 980 barrier run setblock 106 77 980 redstone_lamp
execute if block 4 6 14 gravel if block 106 78 980 brown_carpet run setblock 106 78 980 heavy_weighted_pressure_plate
execute if block 4 6 14 brown_wool if block 106 77 980 redstone_lamp run setblock 106 77 980 barrier
execute if block 4 6 14 brown_wool if block 106 78 980 heavy_weighted_pressure_plate run setblock 106 78 980 brown_carpet

execute if block 3 6 14 gravel if block 105 90 1049 barrier run setblock 105 90 1049 redstone_lamp
execute if block 3 6 14 gravel if block 105 91 1049 red_carpet run setblock 105 91 1049 heavy_weighted_pressure_plate
execute if block 3 6 14 red_wool if block 105 90 1049 redstone_lamp run setblock 105 90 1049 barrier
execute if block 3 6 14 red_wool if block 105 91 1049 heavy_weighted_pressure_plate run setblock 105 91 1049 red_carpet

execute if block 2 6 14 gravel if block 47 89 1090 barrier run setblock 47 89 1090 redstone_lamp
execute if block 2 6 14 gravel if block 47 90 1090 black_carpet run setblock 47 90 1090 heavy_weighted_pressure_plate
execute if block 2 6 14 black_wool if block 47 89 1090 redstone_lamp run setblock 47 89 1090 barrier
execute if block 2 6 14 black_wool if block 47 90 1090 heavy_weighted_pressure_plate run setblock 47 90 1090 black_carpet
