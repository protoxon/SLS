####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove BlackWoolTimer

# SETS SPAWN MONUMENT
setblock 2 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 2 2 14 black_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 0 89 1033 air
setblock 0 90 1033 coarse_dirt
fill 0 91 1033 0 92 1033 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=BlackMonumentStand]
kill @e[tag=BlackMonumentBlock]
kill @e[tag=BlackMonumentCart]
kill @e[tag=BlackMonumentShulker]
