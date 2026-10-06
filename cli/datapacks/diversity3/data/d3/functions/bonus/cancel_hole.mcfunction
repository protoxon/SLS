####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# Used in case a hole is cancelled, in case of either intentional cancellation by dropping an ender pearl or by death.

title @s times 5 30 15
tellraw @s {"text":"● Current hole cancelled. To restart this hole, walk back to the dark green pad.","color":"red"}

scoreboard players reset @s droppedPearl
scoreboard players reset @s curScore

# Most of this is just taken from finish_hole, so see that for more info
tag @s remove golfing
clear @s ender_pearl

scoreboard players operation @e[type=ender_pearl] UUID -= @s UUID
scoreboard players operation @e[tag=golferLoc] UUID -= @s UUID
scoreboard players operation @e[tag=enderPearlLoc] UUID -= @s UUID
scoreboard players operation @e[tag=lastLoc] UUID -= @s UUID
	kill @e[type=ender_pearl,scores={UUID=0}]
	kill @e[tag=golferLoc,scores={UUID=0}]
	kill @e[tag=enderPearlLoc,scores={UUID=0}]
	kill @e[tag=lastLoc,scores={UUID=0}]
scoreboard players operation @e[type=ender_pearl] UUID += @s UUID
scoreboard players operation @e[tag=golferLoc] UUID += @s UUID
scoreboard players operation @e[tag=enderPearlLoc] UUID += @s UUID
scoreboard players operation @e[tag=lastLoc] UUID += @s UUID

function d3:bonus/tp_current_hole