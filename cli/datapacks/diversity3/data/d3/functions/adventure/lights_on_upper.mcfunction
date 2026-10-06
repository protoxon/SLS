####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / JULY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AdvUpperPower

scoreboard objectives add AdvUpperPower dummy
scoreboard players add @e[tag=MainAdventureAEC] AdvUpperPower 1


execute if entity @e[scores={AdvUpperPower=1}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.activate master @a 1032 94 2006 100 0.5 1
execute if entity @e[scores={AdvUpperPower=1}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.power_select master @a 1032 94 2006 100 0.5 1

execute if entity @e[scores={AdvUpperPower=1}] run setblock 1034 94 1999 yellow_terracotta
execute if entity @e[scores={AdvUpperPower=55}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound item.firecharge.use master @a 1034 94 1999 1 0.5 0

#execute if entity @e[scores={AdvUpperPower=60}] run fill 1034 94 1998 1034 97 2000 furnace[lit=true,facing=west] replace furnace[lit=false]

execute if entity @e[scores={AdvUpperPower=60}] run fill 1034 94 1998 1034 97 2000 blast_furnace[lit=true,facing=west] replace blast_furnace[lit=false]


execute if entity @e[scores={AdvUpperPower=90}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.zombie_villager.converted ambient @a 1032 94 2006 1 0.5 1
execute if entity @e[scores={AdvUpperPower=100}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.iron_golem.hurt master @a 1032 94 2006 1 0.7 1
execute if entity @e[scores={AdvUpperPower=100}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.ender_chest.open ambient @a 1032 94 2006 1 0.7 1
execute if entity @e[scores={AdvUpperPower=100}] run setblock 1032 94 2006 glowstone
execute if entity @e[scores={AdvUpperPower=100}] run fill 1031 95 2005 1033 95 2007 daylight_detector[inverted=false] replace daylight_detector[inverted=true]
execute if entity @e[scores={AdvUpperPower=105}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.zombie.infect master @a 1032 94 2006 1 0.5 1


# LIVING QUARTERS LAUNDRY
execute if entity @e[scores={AdvUpperPower=110..}] if block 1011 112 2055 clay run setblock 1011 112 2055 redstone_block
execute if entity @e[scores={AdvUpperPower=110..}] run fill 1010 107 2052 1012 107 2052 redstone_block replace clay

# LIVING QUARTERS WASHROOM
execute if entity @e[scores={AdvUpperPower=120..}] run fill 976 102 2050 990 112 2060 redstone_block replace clay

# LIVING QUARTERS MAIN ROOM
execute if entity @e[scores={AdvUpperPower=130..}] run fill 993 104 2029 1007 112 2055 redstone_block replace clay

# LIVING QUARTERS DESK LAMPS
execute if entity @e[scores={AdvUpperPower=130..}] run fill 993 107 2031 1007 107 2045 end_rod[facing=down] replace iron_bars

# LIVING QUARTERS GARDEN
execute if entity @e[scores={AdvUpperPower=140..}] run fill 994 113 2061 1006 113 2063 redstone_block replace clay

# ASTROSUIT ROOM
execute if entity @e[scores={AdvUpperPower=150..}] run fill 1027 103 1994 1037 114 2008 redstone_block replace clay
execute if entity @e[scores={AdvUpperPower=150..}] run fill 1036 108 1999 1036 109 1999 end_rod[facing=south] replace air
execute if entity @e[scores={AdvUpperPower=150..}] run fill 1036 108 2001 1036 109 2001 end_rod[facing=north] replace air
execute if entity @e[scores={AdvUpperPower=150..}] run fill 1036 110 2000 1036 110 2000 end_rod[facing=down] replace air

# ELEVATOR
execute if entity @e[scores={AdvUpperPower=160..}] if block 46 5 78 glowstone run fill 991 98 1967 997 104 1973 redstone_block replace clay

# ELEVATOR / EXIT
execute if entity @e[scores={AdvUpperPower=160..}] run fill 955 108 1950 1016 113 1970 redstone_block replace clay

# BOSS OFFICE
execute if entity @e[scores={AdvUpperPower=170..}] run fill 959 102 1982 971 112 2005 redstone_block replace clay
execute if entity @e[scores={AdvUpperPower=170..}] run fill 959 107 1983 969 107 2004 end_rod[facing=down] replace iron_bars

# UPPER RING
execute if entity @e[scores={AdvUpperPower=170..}] run fill 977 113 1977 1023 113 2023 redstone_block replace clay

# SURFACE RING
execute if entity @e[scores={AdvUpperPower=180..}] run fill 980 123 1980 1020 123 2030 redstone_block replace clay