####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / NOVEMBER 10 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove AdvLowerPower
execute if block 1034 94 1995 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run stopsound @a

execute if block 1034 94 1995 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.deactivate master @a 1036 94 2006 100 0.5 1
execute if block 1034 94 1995 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.iron_golem.hurt master @a 1036 94 2006 100 0.5 1
execute if block 1034 94 1995 yellow_terracotta run setblock 1034 94 1995 red_terracotta
execute if block 1036 94 2006 glowstone run setblock 1036 94 2006 magma_block
fill 1035 95 2005 1037 95 2007 daylight_detector[inverted=true] replace daylight_detector[inverted=false]
#fill 1034 94 1994 1034 97 1996 furnace[lit=false,facing=west] replace furnace[lit=true]
fill 1034 94 1994 1034 97 1996 blast_furnace[lit=false,facing=west] replace blast_furnace[lit=true]

# GENERATOR ROOM
fill 1029 101 1995 1035 101 2005 clay replace redstone_block

# MECHANICAL HALLWAY
fill 965 97 1990 1042 97 2050 clay replace redstone_block

# CORE ENTRANCE
fill 1006 100 1970 1007 100 1970 clay replace redstone_block
fill 1000 81 1970 1032 99 1994 clay replace redstone_block

# RESEARCH LAB
fill 953 97 1986 971 99 2005 clay replace redstone_block
fill 965 94 2001 965 94 2001 iron_bars replace end_rod

# REC ROOM
fill 995 99 2029 1005 99 2035 clay replace redstone_block
fill 1002 93 2037 1007 94 2037 iron_bars[east=false,west=false,north=false,south=false] replace end_rod

# LOWER RING
fill 977 100 1977 1023 100 2023 clay replace redstone_block

# ELEVATOR
fill 991 98 1967 997 104 1973 clay replace redstone_block

kill @e[tag=AdvDKGame]