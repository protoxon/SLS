####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

setblock 14 2 46 air
setblock 1 4 2 stone_bricks
scoreboard objectives remove UUID
scoreboard objectives remove Score1
scoreboard objectives remove Score2
scoreboard objectives remove Score3
scoreboard objectives remove Score4
scoreboard objectives remove Score5
scoreboard objectives remove Score6
scoreboard objectives remove Score7
scoreboard objectives remove Score8
scoreboard objectives remove Score9
scoreboard objectives remove Score10
scoreboard objectives remove Score11
scoreboard objectives remove Score12
scoreboard objectives remove Score13
scoreboard objectives remove Score14
scoreboard objectives remove Score15
scoreboard objectives remove Score16
scoreboard objectives remove Score17
scoreboard objectives remove Score18
scoreboard objectives remove ScoreTotal
scoreboard objectives remove ScoreTotal2
scoreboard objectives remove curScore
scoreboard objectives remove currentHole
scoreboard objectives remove droppedPearl
scoreboard objectives remove golfClap
scoreboard objectives remove golfGear
scoreboard objectives remove ballReturnTimer
scoreboard objectives remove sandTrapTimer
scoreboard objectives remove golfFailsafe
tag @a remove UUIDed
tag @a remove golfing
tag @a remove startTut
tag @a remove startTut2
tag @a remove FirstPlace
tag @a remove SecondPlace
tag @a remove ThirdPlace
tag @a remove inGolfBranch
tag @a remove needsBall
tag @a remove giveBall
#tag @a remove nauseated
#tag @a remove UUIDchecking
#clear @a written_book
#clear @a ender_pearl
clear @a
team remove golfer
kill @e[tag=golferLoc]
kill @e[tag=ender_pearl]
kill @e[tag=enderPearlLoc]
kill @e[tag=lastLoc]
kill @e[tag=holeMarker]
effect clear @a
kill @e[tag=GolfGearStand]
kill @e[tag=WinStand]
fill -2 89 3212 2 93 3212 green_stained_glass replace air

# Send the players through the normal leave_branch function
teleport @a 14 4 33 0 -90