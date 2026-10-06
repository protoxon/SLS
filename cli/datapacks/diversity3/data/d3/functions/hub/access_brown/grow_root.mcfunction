####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute as @e[tag=RootGrowth] at @s run teleport @s ^ ^ ^0.5 facing 105 74 994
execute as @e[tag=RootGrowth] at @s run fill 79 79 995 79 79 995 acacia_wood replace acacia_sapling
execute as @e[tag=RootGrowth] at @s run fill ~ ~-4 ~-2 ~ ~2 ~6 acacia_wood replace structure_void

execute if block 82 79 1000 acacia_wood run fill 82 80 1000 82 80 1000 jungle_stairs[half=bottom,facing=south] replace air
execute if block 82 79 1000 acacia_wood run fill 82 80 1001 82 80 1001 jungle_stairs[half=top,facing=north] replace air
execute if block 82 79 1000 acacia_wood run fill 82 81 1001 82 81 1001 jungle_stairs[half=bottom,facing=north] replace air

execute if block 83 79 1001 acacia_wood run fill 83 78 1002 83 78 1002 jungle_stairs[half=top,facing=south] replace air
execute if block 83 79 1001 acacia_wood run fill 83 79 1002 83 79 1002 jungle_stairs[half=bottom,facing=north] replace air

execute if block 83 79 997 acacia_wood run fill 84 79 997 84 79 997 jungle_stairs[half=top,facing=west] replace air
execute if block 83 79 997 acacia_wood run fill 84 80 997 84 80 997 jungle_stairs[half=bottom,facing=east] replace air

execute if block 85 79 999 acacia_wood run fill 86 79 999 86 79 999 jungle_stairs[half=top,facing=west] replace air
execute if block 85 79 999 acacia_wood run fill 86 80 999 86 80 999 jungle_stairs[half=bottom,facing=west] replace air

execute if block 87 77 1001 acacia_wood run fill 87 76 1001 87 76 1001 jungle_stairs[half=top,facing=south] replace air
execute if block 87 77 1001 acacia_wood run fill 87 76 1002 87 76 1002 jungle_stairs[half=top,facing=north] replace air
execute if block 87 77 1001 acacia_wood run fill 87 77 1002 87 77 1002 jungle_stairs[half=bottom,facing=south] replace air

execute if block 89 75 997 acacia_wood run fill 89 75 996 89 75 996 jungle_stairs[half=top,facing=east] replace air
execute if block 89 75 997 acacia_wood run fill 89 76 996 89 76 996 jungle_stairs[half=bottom,facing=north] replace air
execute if block 89 75 997 acacia_wood run fill 89 76 995 89 76 995 jungle_stairs[half=bottom,facing=south] replace air

execute if block 91 74 997 acacia_wood run fill 90 72 997 90 72 997 jungle_stairs[half=top,facing=west] replace air
execute if block 91 74 997 acacia_wood run fill 90 73 997 90 73 997 jungle_stairs[half=bottom,facing=east] replace air
execute if block 91 74 997 acacia_wood run fill 91 73 997 91 73 997 jungle_stairs[half=top,facing=west] replace air

execute if block 91 75 998 acacia_wood run fill 91 74 1000 91 74 1000 jungle_stairs[half=bottom,facing=south] replace air
execute if block 91 75 998 acacia_wood run fill 91 74 999 91 74 999 jungle_stairs[half=top,facing=south] replace air
execute if block 91 75 998 acacia_wood run fill 91 75 999 91 75 999 jungle_stairs[half=bottom,facing=north] replace air

execute if block 92 75 998 acacia_wood run fill 92 76 998 92 76 998 jungle_stairs[half=bottom,facing=east] replace air
execute if block 92 75 998 acacia_wood run fill 93 76 998 93 76 998 jungle_stairs[half=top,facing=west] replace air
execute if block 92 75 998 acacia_wood run fill 93 77 998 93 77 998 jungle_stairs[half=bottom,facing=west] replace air

execute if block 94 73 994 acacia_wood run fill 94 72 993 94 72 993 jungle_stairs[half=bottom,facing=south] replace air
execute if block 94 73 994 acacia_wood run fill 94 72 994 94 72 994 jungle_stairs[half=top,facing=north] replace air

execute if block 96 73 995 acacia_wood run fill 96 74 996 96 74 996 jungle_stairs[half=bottom,facing=south] replace air

execute if block 97 73 993 acacia_wood run fill 97 72 992 97 72 992 jungle_stairs[half=top,facing=north] replace air
execute if block 97 73 993 acacia_wood run fill 97 73 992 97 73 992 jungle_stairs[half=bottom,facing=south] replace air

kill @e[tag=RootGrowth,x=105,y=74,z=994,dx=0,dy=0,dz=0]
