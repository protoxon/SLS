####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove BlueWoolTimer

# SETS SPAWN MONUMENT
setblock 5 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 5 2 14 blue_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 4 89 1038 air
setblock 4 90 1038 stone_bricks
fill 4 91 1038 4 92 1038 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=BlueMonumentStand]
kill @e[tag=BlueMonumentBlock]
kill @e[tag=BlueMonumentCart]
kill @e[tag=BlueMonumentShulker]
