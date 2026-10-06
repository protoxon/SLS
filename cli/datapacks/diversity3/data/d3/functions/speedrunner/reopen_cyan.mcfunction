####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove CyanWoolTimer

# SETS SPAWN MONUMENT
setblock 7 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 7 2 14 cyan_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 10 89 1039 air
setblock 10 90 1039 mossy_stone_bricks
fill 10 91 1039 12 92 1039 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=CyanMonumentStand]
kill @e[tag=CyanMonumentBlock]
kill @e[tag=CyanMonumentCart]
kill @e[tag=CyanMonumentShulker]