####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / JULY 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AdvLowerPower

scoreboard objectives add AdvLowerPower dummy
scoreboard players add @e[tag=MainAdventureAEC] AdvLowerPower 1


execute if entity @e[scores={AdvLowerPower=1}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.activate master @a 1036 94 2006 100 0.5 1
execute if entity @e[scores={AdvLowerPower=1}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.beacon.power_select master @a 1036 94 2006 100 0.5 1

execute if entity @e[scores={AdvLowerPower=1}] run setblock 1034 94 1995 yellow_terracotta
execute if entity @e[scores={AdvLowerPower=55}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound item.firecharge.use master @a 1034 94 1995 1 0.5 0

#execute if entity @e[scores={AdvLowerPower=60}] run fill 1034 94 1994 1034 97 1996 furnace[lit=true,facing=west] replace furnace[lit=false]

execute if entity @e[scores={AdvLowerPower=60}] run fill 1034 94 1994 1034 97 1996 blast_furnace[lit=true,facing=west] replace blast_furnace[lit=false]

execute if entity @e[scores={AdvLowerPower=90}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.zombie_villager.converted ambient @a 1036 94 2006 1 0.5 1
execute if entity @e[scores={AdvLowerPower=100}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.iron_golem.hurt master @a 1036 94 2006 1 0.7 1
execute if entity @e[scores={AdvLowerPower=100}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound block.ender_chest.open ambient @a 1036 94 2006 1 0.7 1
execute if entity @e[scores={AdvLowerPower=100}] run setblock 1036 94 2006 glowstone
execute if entity @e[scores={AdvLowerPower=100}] run fill 1035 95 2005 1037 95 2007 daylight_detector[inverted=false] replace daylight_detector[inverted=true]
execute if entity @e[scores={AdvLowerPower=105}] align x align y align z if entity @a[x=1027,y=93,z=1993,dx=10,dy=5,dz=14] run playsound entity.zombie.infect master @a 1036 94 2006 1 0.5 1


# GENERATOR ROOM
execute if entity @e[scores={AdvLowerPower=110..}] run fill 1029 101 1995 1035 101 2005 redstone_block replace clay

# MECHANICAL HALLWAY
execute if entity @e[scores={AdvLowerPower=120..}] run fill 965 97 1990 1042 97 2050 redstone_block replace clay

# CORE ENTRANCE
execute if entity @e[scores={AdvLowerPower=130..}] run fill 1000 81 1970 1032 99 1994 redstone_block replace clay
execute if entity @e[scores={AdvLowerPower=130..}] run fill 1006 100 1970 1007 100 1970 redstone_block replace clay

# RESEARCH LAB
execute if entity @e[scores={AdvLowerPower=140..}] run fill 953 97 1986 971 99 2005 redstone_block replace clay
execute if entity @e[scores={AdvLowerPower=140..}] run fill 965 94 2001 965 94 2001 end_rod[facing=down] replace iron_bars

# REC ROOM
execute if entity @e[scores={AdvLowerPower=150..}] run fill 995 99 2029 1005 99 2035 redstone_block replace clay
execute if entity @e[scores={AdvLowerPower=150..}] run fill 1002 93 2037 1007 93 2037 end_rod[facing=up] replace iron_bars
execute if entity @e[scores={AdvLowerPower=150..}] run fill 1002 94 2037 1007 94 2037 end_rod[facing=down] replace iron_bars

# LOWER RING
execute if entity @e[scores={AdvLowerPower=170..}] run fill 977 100 1977 1023 100 2023 redstone_block replace clay