####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# SURVIVAL BLOCKS
fill 74 81 999 74 81 999 brown_concrete replace birch_leaves

fill 72 80 992 72 80 992 redstone_wire replace grass_block
fill 72 81 992 72 81 992 brown_concrete_powder replace air
fill 73 81 992 73 81 992 stone_button[face=wall,facing=east,powered=false] replace air
fill 78 78 994 80 78 996 brown_concrete_powder replace dirt

execute unless block 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"} run setblock 72 79 992 command_block{Command:"summon skeleton 74 74 990 {HandItems:[{id:\"minecraft:bow\",Count:1b}],Tags:[\"GrinderSkeleton\"]}"}

execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 structure_void replace acacia_wood
execute if block 79 79 995 acacia_sapling run fill 79 72 992 103 82 1002 air replace jungle_stairs