####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# ARENA
fill -28 86 1033 -28 86 1033 yellow_concrete replace jungle_leaves
fill -20 89 1039 -20 89 1039 lever[face=wall,facing=east,powered=false] replace air
fill -21 89 1039 -21 89 1039 yellow_concrete_powder replace oak_wood

# TOO LAZY TO FIX
execute if block -50 57 1024 chest run setblock -50 57 1024 air
execute if block 101 91 969 air run setblock 101 91 969 birch_leaves
execute if block 31 116 1033 air run setblock 31 116 1033 birch_leaves