####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / NOVEMBER 16 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainAdventureAEC]
summon area_effect_cloud 40 2 72 {Tags:["MainAdventureAEC"],Duration:2147483647}

kill @e[type=villager]
kill @e[tag=AdventureFish]

# UPPER LEVEL POWER
setblock 1033 94 1999 lever[face=wall,facing=west,powered=true]
setblock 46 7 78 glowstone

# LOWER LEVEL POWER
setblock 1033 94 1995 lever[face=wall,facing=west,powered=false]
setblock 46 5 78 magma_block


setblock 1011 112 2055 redstone_block
fill 1010 107 2052 1012 107 2052 redstone_block replace clay
fill 976 102 2050 990 112 2060 redstone_block replace clay
fill 993 104 2029 1007 112 2055 redstone_block replace clay
fill 993 107 2031 1007 107 2045 end_rod[facing=down] replace iron_bars
fill 994 113 2061 1006 113 2063 redstone_block replace clay
fill 1027 103 1994 1037 114 2008 redstone_block replace clay
fill 1036 108 1999 1036 109 1999 end_rod[facing=south] replace air
fill 1036 108 2001 1036 109 2001 end_rod[facing=north] replace air
fill 1036 110 2000 1036 110 2000 end_rod[facing=down] replace air
fill 955 108 1950 1016 113 1970 redstone_block replace clay
fill 959 102 1982 971 112 2005 redstone_block replace clay
fill 959 107 1983 969 107 2004 end_rod[facing=down] replace iron_bars
fill 977 113 1977 1023 113 2023 redstone_block replace clay
fill 33 2 78 44 2 78 air


setblock 46 2 78 redstone_block

teleport @a 1011 106 2055 90 0
