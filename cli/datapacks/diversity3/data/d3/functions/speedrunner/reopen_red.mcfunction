####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove RedWoolTimer

# SETS SPAWN MONUMENT
setblock 3 6 14 gravel

# SHUTS OF SUMMON CLOCK
setblock 3 2 14 red_concrete

# CLEARS OUT PREVIOUS LEFT MONUMENT PIECE -> MATCHES MINECART TILE BLOCK
setblock 1 89 1035 air
setblock 1 90 1035 stone_bricks
fill 1 91 1035 1 92 1035 air

# REMOVES PREVIOUS MONUMENT POST -> FAILSAFE
kill @e[tag=RedMonumentStand]
kill @e[tag=RedMonumentBlock]
kill @e[tag=RedMonumentCart]
kill @e[tag=RedMonumentShulker]
