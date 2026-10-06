####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove PinkWoolTimer

# SETS SPAWN MONUMENT
setblock 8 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 8 2 14 pink_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 12 89 1038 air
setblock 12 90 1038 stone_bricks
fill 12 91 1038 12 92 1038 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=PinkMonumentStand]
kill @e[tag=PinkMonumentBlock]
kill @e[tag=PinkMonumentCart]
kill @e[tag=PinkMonumentShulker]
