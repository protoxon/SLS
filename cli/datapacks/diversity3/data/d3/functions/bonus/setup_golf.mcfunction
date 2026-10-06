####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE AND QMAGNET
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

scoreboard objectives add curScore minecraft.used:minecraft.ender_pearl {"text":"Shots Taken","color":"dark_green","bold":"true","underlined":"true"}
scoreboard objectives add droppedPearl minecraft.dropped:minecraft.ender_pearl
scoreboard objectives add UUID dummy
scoreboard players set MasterUUID UUID 1
scoreboard players set openingArea UUID 0
scoreboard objectives add Score1 dummy
scoreboard objectives add Score2 dummy
scoreboard objectives add Score3 dummy
scoreboard objectives add Score4 dummy
scoreboard objectives add Score5 dummy
scoreboard objectives add Score6 dummy
scoreboard objectives add Score7 dummy
scoreboard objectives add Score8 dummy
scoreboard objectives add Score9 dummy
scoreboard objectives add Score10 dummy
scoreboard objectives add Score11 dummy
scoreboard objectives add Score12 dummy
scoreboard objectives add Score13 dummy
scoreboard objectives add Score14 dummy
scoreboard objectives add Score15 dummy
scoreboard objectives add Score16 dummy
scoreboard objectives add Score17 dummy
scoreboard objectives add Score18 dummy
scoreboard objectives add ScoreTotal dummy
scoreboard objectives add ScoreTotal2 dummy
scoreboard objectives add golfClap dummy
scoreboard objectives add golfGear dummy
scoreboard objectives setdisplay sidebar curScore
scoreboard objectives add currentHole dummy
scoreboard objectives add ballReturnTimer dummy
scoreboard objectives add sandTrapTimer dummy
scoreboard objectives add golfFailsafe dummy
fill -2 89 3212 2 93 3212 green_stained_glass replace air

function d3:bonus/load_gear

team add golfer
team modify golfer friendlyFire false
team join golfer @a

execute as @a run function d3:bonus/setup_player
#execute as @e[type=chicken,name=Larry] run function d3:bonus/setup_player

# Reset the score signs
fill 25 88 3197 25 90 3203 air
setblock 18 86 3200 air
##setblock 25 89 3200 minecraft:wall_sign[facing=west]{Text1:"{\"text\":\"~~~~~~~~~~~~~~~\",\"color\":\"black\"}",Text2:"{\"text\":\"Please wait for\",\"color\":\"black\"}",Text3:"{\"text\":\"game to finish!\",\"color\":\"black\"}",Text4:"{\"text\":\"~~~~~~~~~~~~~~~\",\"color\":\"black\"}"} replace


# PICNIC
data merge block 42 88 3196 {Items:[{Slot:0b,id:"minecraft:apple",Count:12b},{Slot:1b,id:"minecraft:apple",Count:5b},{Slot:4b,id:"minecraft:cookie",Count:12b},{Slot:6b,id:"minecraft:bread",Count:2b},{Slot:8b,id:"minecraft:cooked_cod",Count:8b},{Slot:11b,id:"minecraft:apple",Count:14b},{Slot:14b,id:"minecraft:bread",Count:5b},{Slot:17b,id:"minecraft:cooked_cod",Count:1b},{Slot:18b,id:"minecraft:apple",Count:4b},{Slot:21b,id:"minecraft:apple",Count:9b},{Slot:25b,id:"minecraft:cooked_cod",Count:4b}]}
setblock 42 92 3196 iron_bars[north=true]
setblock 42 92 3194 iron_bars[south=true]
setblock 41 92 3195 iron_bars[east=true]
setblock 43 92 3195 iron_bars[west=true]

fill 37 89 3193 39 89 3193 spruce_trapdoor[facing=west,half=bottom,open=false]
fill 37 89 3192 39 89 3192 spruce_trapdoor[facing=west,half=bottom,open=false]


# initiate the golf loop
setblock 14 2 46 redstone_block