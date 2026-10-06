####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 25 2018 / SEPTEMBER 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################


# MAIN SCOREBOARD CLOUD FOR WINS
#kill @e[tag=MainBossAEC]
execute unless entity @e[tag=MainBossAEC] run summon area_effect_cloud -24 2 -24 {Tags:["MainBossAEC"],Duration:2147483647}

gamerule doTileDrops false

# REMOVE SPEECH BUBBLE
fill -1045 85 -945 -1026 100 -945 air replace gray_concrete
fill -1045 85 -945 -1026 100 -945 air replace white_concrete
fill -1045 85 -945 -1026 100 -945 air replace red_concrete

# REMOVE SPEECH SIGN
fill -1045 85 -945 -1026 100 -945 air

# RESET STEVE
fill -1028 80 -948 -1023 85 -943 air
function d3:boss/steve_animations/arm_down
function d3:boss/steve_animations/arm_down_right
function d3:boss/steve_animations/face_to_stone

# RESET BOOT
fill -1026 52 -948 -1026 59 -948 redstone_block replace clay

# RESET ANY PICKAXE
fill -1028 79 -952 -1016 90 -952 air
fill -1036 79 -960 -1024 90 -960 air
fill -1023 67 -952 -1017 79 -952 air
fill -1016 71 -952 -1012 79 -952 air

# CLEAR LOWER AREA FROM STONE EXPLOSION
fill -1039 47 -977 -977 62 -963 air
fill -990 47 -993 -977 62 -930 air

# CLEAR UPPER PLATFORM FROM STONE EXPLOSION
fill -1039 55 -962 -991 65 -930 air replace light_gray_concrete_powder
fill -1039 55 -962 -991 65 -930 air replace stone_bricks
fill -1039 55 -962 -991 65 -930 air replace cobblestone
fill -1039 55 -962 -991 65 -930 air replace stone

# RESET GIANT STONE
fill -1016 56 -959 -1002 69 -945 air
clone -1007 25 -1005 -992 40 -990 -1016 55 -959 masked

# CLEAR FINAL JUMPING PLATFORMS
fill -1008 59 -963 -1006 61 -961 air
fill -1005 62 -970 -1002 63 -967 air
fill -1008 61 -976 -1006 62 -973 air
fill -1020 64 -949 -1018 65 -948 air

# RESET DRUMSTICK
clone -1006 54 -1011 -998 62 -1011 -1029 55 -956 masked

# RESET FOOD TARGET
fill -1028 65 -956 -1021 71 -956 air

# RESET PIG GRASS
fill -1034 64 -996 -1027 64 -992 air
fill -1034 63 -996 -1027 71 -992 air
fill -1034 62 -996 -1027 62 -994 air
fill -1042 47 -989 -1040 62 -982 air

# RESET COW GRASS
fill -1041 65 -988 -1039 65 -983 air
fill -1042 64 -982 -1038 64 -989 air
fill -1042 63 -982 -1038 63 -989 air
fill -1042 63 -990 -1038 71 -981 air
fill -1034 47 -996 -1028 62 -994 air

# RESET POISON SPAWNERS
setblock -1002 63 -988 air
setblock -1026 63 -982 air

kill @e[type=item]
kill @e[tag=BossMob]
kill @e[tag=BossNPC]
kill @e[tag=BossChickenAS]
fill -1016 62 -987 -1014 62 -985 red_concrete replace orange_concrete

bossbar remove bosspigman
bossbar remove bossmooshroom


# TEMP
scoreboard objectives remove BossPig
scoreboard objectives remove BossCow
scoreboard objectives remove OreAttack



# BUILD PLATFORM
clone -1039 1 -993 -991 8 -978 -1039 62 -993

#setblock -995 63 -981 oak_log[axis=y]
#setblock -995 64 -981 oak_log[axis=y]
#setblock -995 65 -981 oak_log[axis=y]
#setblock -995 66 -981 oak_log[axis=y]
#setblock -995 67 -981 oak_log[axis=y]
#setblock -995 68 -981 oak_log[axis=y]
#fill -997 66 -982 -997 67 -980 oak_leaves[persistent=true] replace air
#fill -996 66 -983 -994 67 -979 oak_leaves[persistent=true] replace air
#fill -993 66 -983 -993 66 -979 oak_leaves[persistent=true] replace air
#fill -993 67 -982 -993 67 -980 oak_leaves[persistent=true] replace air
#fill -995 68 -982 -994 68 -980 oak_leaves[persistent=true] replace air
#fill -996 68 -981 -994 69 -981 oak_leaves[persistent=true] replace air
#fill -995 68 -982 -995 69 -980 oak_leaves[persistent=true] replace air

# REMOVE CHEST
setblock -1000 63 -981 air

# RESET HOUSE
clone -1004 1 -1002 -995 8 -996 -1004 62 -1002
clone -1004 1 -995 -1001 8 -994 -1004 62 -995
clone -999 1 -995 -994 8 -994 -999 62 -995
clone -1000 5 -995 -1000 8 -995 -1000 66 -995
clone -1000 1 -994 -1000 8 -994 -1000 62 -994

execute unless block -1000 64 -995 oak_door run setblock -1000 64 -995 oak_door[facing=north,half=lower,hinge=left,open=false]
execute unless block -1000 65 -995 oak_door run setblock -1000 65 -995 oak_door[facing=north,half=upper,hinge=left,open=false]


#setblock -1002 65 -999 oak_log
#setblock -1002 65 -996 oak_log
#setblock -996 65 -999 oak_log
#setblock -996 65 -996 oak_log
#fill -1004 63 -1002 -994 69 -992 air replace chest
#fill -1004 63 -1002 -994 69 -992 air replace crafting_table
#fill -1004 63 -1002 -994 69 -992 air replace furnace
#setblock -998 64 -996 crafting_table
#setblock -997 64 -999 furnace[facing=west]

clear @a

setblock -18 2 -18 redstone_block

gamerule doTileDrops true

teleport @a[distance=..10] -999 64 -998 0 0
