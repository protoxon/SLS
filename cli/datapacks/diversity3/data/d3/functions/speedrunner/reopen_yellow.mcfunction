####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove YellowWoolTimer

# SETS SPAWN MONUMENT
setblock 10 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 10 2 14 yellow_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 15 89 1035 air
setblock 15 90 1035 grass_block
fill 15 91 1035 15 92 1035 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=YellowMonumentStand]
kill @e[tag=YellowMonumentBlock]
kill @e[tag=YellowMonumentCart]
kill @e[tag=YellowMonumentShulker]