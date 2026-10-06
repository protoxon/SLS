####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove OrangeWoolTimer

# SETS SPAWN MONUMENT
setblock 11 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 11 2 14 orange_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 16 89 1033 air
setblock 16 90 1033 grass_block
fill 16 91 1033 16 92 1033 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=OrangeMonumentStand]
kill @e[tag=OrangeMonumentBlock]
kill @e[tag=OrangeMonumentCart]
kill @e[tag=OrangeMonumentShulker]

