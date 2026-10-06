####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove LimeWoolTimer

# SETS SPAWN MONUMENT
setblock 9 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 9 2 14 lime_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 14 89 1037 air
setblock 14 90 1037 mossy_stone_bricks
fill 14 91 1037 14 92 1037 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=LimeMonumentStand]
kill @e[tag=LimeMonumentBlock]
kill @e[tag=LimeMonumentCart]
kill @e[tag=LimeMonumentShulker]
