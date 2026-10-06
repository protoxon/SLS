####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove BrownWoolTimer

# SETS SPAWN MONUMENT
setblock 4 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 4 2 14 brown_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 2 89 1037 air
setblock 2 90 1037 mossy_stone_bricks
fill 2 91 1037 2 92 1037 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=BrownMonumentStand]
kill @e[tag=BrownMonumentBlock]
kill @e[tag=BrownMonumentCart]
kill @e[tag=BrownMonumentShulker]
