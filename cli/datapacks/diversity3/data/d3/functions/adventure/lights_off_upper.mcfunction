####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / JULY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove AdvUpperPower
execute if block 1034 94 1999 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run stopsound @a

execute if block 1034 94 1999 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.deactivate master @a 1032 94 2006 100 0.5 1
execute if block 1034 94 1999 yellow_terracotta align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.iron_golem.hurt master @a 1032 94 2006 100 0.5 1
execute if block 1034 94 1999 yellow_terracotta run setblock 1034 94 1999 red_terracotta
execute if block 1032 94 2006 glowstone run setblock 1032 94 2006 magma_block
fill 1031 95 2005 1033 95 2007 daylight_detector[inverted=true] replace daylight_detector[inverted=false]
#fill 1034 94 1998 1034 97 2000 furnace[lit=false,facing=west] replace furnace[lit=true]
fill 1034 94 1998 1034 97 2000 blast_furnace[lit=false,facing=west] replace blast_furnace[lit=true]

# LIVING QUARTERS LAUNDRY
execute if block 1011 112 2055 redstone_block run setblock 1011 112 2055 clay
fill 1010 107 2052 1012 107 2052 clay replace redstone_block

# LIVING QUARTERS WASHROOM
fill 976 102 2050 990 112 2060 clay replace redstone_block

# LIVING QUARTERS MAIN ROOM
fill 993 104 2029 1007 112 2055 clay replace redstone_block

# LIVING QUARTERS DESK LAMPS
fill 993 107 2031 1007 107 2045 iron_bars[east=false,west=false,north=false,south=false] replace end_rod

# LIVING QUARTERS GARDEN
fill 994 113 2061 1006 113 2063 clay replace redstone_block

# ASTROSUIT ROOM
fill 1027 103 1994 1037 114 2008 clay replace redstone_block
fill 1036 108 1999 1036 110 2001 air replace end_rod

# ELEVATOR / EXIT
fill 955 108 1950 1016 113 1970 clay replace redstone_block

# BOSS OFFICE
fill 959 102 1982 971 112 2005 clay replace redstone_block
fill 959 107 1983 969 107 2004 iron_bars[east=false,west=false,north=false,south=false] replace end_rod

# UPPER RING
fill 977 113 1977 1023 113 2023 clay replace redstone_block

# RING ON SURFACE
fill 980 123 1980 1020 123 2030 clay replace redstone_block

# ELEVATOR
fill 991 98 1967 997 104 1973 clay replace redstone_block