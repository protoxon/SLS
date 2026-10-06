####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove PurpleWoolTimer

# SETS SPAWN MONUMENT
setblock 6 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 6 2 14 purple_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 6 89 1039 air
setblock 6 90 1039 cracked_stone_bricks
fill 6 91 1039 6 92 1039 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=PurpleMonumentStand]
kill @e[tag=PurpleMonumentBlock]
kill @e[tag=PurpleMonumentCart]
kill @e[tag=PurpleMonumentShulker]
