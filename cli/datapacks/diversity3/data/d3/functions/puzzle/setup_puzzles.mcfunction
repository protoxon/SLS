####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 24 2017 / MARCH 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainPuzzleAEC]
summon area_effect_cloud 40 2 8 {Tags:["MainPuzzleAEC"],Duration:2147483647}

# RESTART PUZZLES / CONCTANT CLOCK
setblock 46 2 8 redstone_block

# SIMON SAYS
setblock 46 2 14 clay

# MATCH FLOOR ROOM
setblock 44 2 14 clay

# MEMORY ROOM
setblock 37 2 14 clay

# SOUND PUZZLE ROOM
setblock 36 2 14 clay

# PISTON PUZZLE ROOM
setblock 43 2 14 clay

# PATHFINDER ROOM
setblock 35 2 14 clay

# BANNER BULLET ROOM
setblock 39 2 14 clay

# BANNER BULLET -> SQUID FIXER COMMANDS
setblock 39 5 14 clay

# HOPPER ORDER ROOM
setblock 42 2 14 clay

# HANGMAN ROOM
setblock 40 2 14 clay

kill @e[type=item]

# RESETS ALL DOORS
fill 984 64 -8 1016 65 24 redstone_block replace clay

# CONSTANT CLOCK
setblock 46 2 8 redstone_block


teleport @a 1000 64 19 0 0
