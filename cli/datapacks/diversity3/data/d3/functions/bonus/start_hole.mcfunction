####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE AND QMAGNET
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# Runs on a player when they try to start a hole

# Redundant UUID checking system
# tag @s add UUIDchecking
#execute if @a[distance=0.000001..]
scoreboard players add MasterUUID UUID 1
scoreboard players operation @s UUID = MasterUUID UUID
tag @s add UUIDed





scoreboard players set @s curScore 0
tag @s add golfing
title @s times 5 140 15

execute if entity @s[scores={currentHole=1}] run title @s subtitle {"text":"Par ● 2","color":"white"}
execute if entity @s[scores={currentHole=2}] run title @s subtitle {"text":"Par ● 3","color":"white"}
execute if entity @s[scores={currentHole=3}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=4}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=5}] run title @s subtitle {"text":"Par ● 3","color":"white"}
execute if entity @s[scores={currentHole=6}] run title @s subtitle {"text":"Par ● 5","color":"white"}
execute if entity @s[scores={currentHole=7}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=8}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=9}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=10}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=11}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=12}] run title @s subtitle {"text":"Par ● 3","color":"white"}
execute if entity @s[scores={currentHole=13}] run title @s subtitle {"text":"Par ● 3","color":"white"}
execute if entity @s[scores={currentHole=14}] run title @s subtitle {"text":"Par ● 5","color":"white"}
execute if entity @s[scores={currentHole=15}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=16}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=17}] run title @s subtitle {"text":"Par ● 4","color":"white"}
execute if entity @s[scores={currentHole=18}] run title @s subtitle {"text":"Par ● 3","color":"white"}

#execute if entity @s[scores={currentHole=1}] run title @s actionbar {"text":"Still Green","color":"dark_green"}
#execute if entity @s[scores={currentHole=2}] run title @s actionbar {"text":"Over the River","color":"dark_green"}
#execute if entity @s[scores={currentHole=3}] run title @s actionbar {"text":"Sand-Trapped","color":"dark_green"}
#execute if entity @s[scores={currentHole=4}] run title @s actionbar {"text":"An Uphill Battle","color":"dark_green"}
#execute if entity @s[scores={currentHole=5}] run title @s actionbar {"text":"Lakeside Property","color":"dark_green"}
#execute if entity @s[scores={currentHole=6}] run title @s actionbar {"text":"Down, Down, Down","color":"dark_green"}
#execute if entity @s[scores={currentHole=7}] run title @s actionbar {"text":"Make the Leap","color":"dark_green"}
#execute if entity @s[scores={currentHole=8}] run title @s actionbar {"text":"Nothing but Net","color":"dark_green"}
#execute if entity @s[scores={currentHole=9}] run title @s actionbar {"text":"Bridging the Gap","color":"dark_green"}
#execute if entity @s[scores={currentHole=10}] run title @s actionbar {"text":"The Cave","color":"dark_green"}
#execute if entity @s[scores={currentHole=11}] run title @s actionbar {"text":"Floating Islands","color":"dark_green"}
#execute if entity @s[scores={currentHole=12}] run title @s actionbar {"text":"Through the Hill","color":"dark_green"}
#execute if entity @s[scores={currentHole=13}] run title @s actionbar {"text":"Through the Mountain","color":"dark_green"}
#execute if entity @s[scores={currentHole=14}] run title @s actionbar {"text":"Longshot","color":"dark_green"}
#execute if entity @s[scores={currentHole=15}] run title @s actionbar {"text":"Up and Around","color":"dark_green"}
#execute if entity @s[scores={currentHole=16}] run title @s actionbar {"text":"Runway","color":"dark_green"}
#execute if entity @s[scores={currentHole=17}] run title @s actionbar {"text":"Blind Throw","color":"dark_green"}
#execute if entity @s[scores={currentHole=18}] run title @s actionbar {"text":"Good Aim","color":"dark_green"}

execute if entity @s[scores={currentHole=1}] run title @s title {"text":"#1 \"An Easy Toss\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=2}] run title @s title {"text":"#2 \"Over the Stream\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=3}] run title @s title {"text":"#3 \"It's a Trap!\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=4}] run title @s title {"text":"#4 \"An Uphill Battle\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=5}] run title @s title {"text":"#5 \"Across the Pond\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=6}] run title @s title {"text":"#6 \"Down, Down, Down\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=7}] run title @s title {"text":"#7 \"Make the Leap\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=8}] run title @s title {"text":"#8 \"Nothin' but Net\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=9}] run title @s title {"text":"#9 \"Bridging the Gap\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=10}] run title @s title {"text":"#10 \"Into the Cave\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=11}] run title @s title {"text":"#11 \"Up, Up, Up\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=12}] run title @s title {"text":"#12 \"Aim for the Window\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=13}] run title @s title {"text":"#13 \"Through the Mountain\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=14}] run title @s title {"text":"#14 \"Longshot\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=15}] run title @s title {"text":"#15 \"Up and Around\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=16}] run title @s title {"text":"#16 \"The Runway\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=17}] run title @s title {"text":"#17 \"Blind Faith\"","bold":"false","color":"dark_green"}
execute if entity @s[scores={currentHole=18}] run title @s title {"text":"#18 \"Perfect Aim\"","bold":"false","color":"dark_green"}

give @s ender_pearl{display:{Name:"{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"}",Lore:['{"text":"Drop this item to quit current hole","italic":"true","color":"green"}']}}


# Sets up golferLoc, an armor stand which the player cannot leave
execute at @s run summon armor_stand ~ ~ ~ {Invulnerable:1b,Marker:0b,Small:1b,Invisible:1b,Tags:["golferLoc","scoreThisTurn"]}
execute at @s run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["lastLoc","scoreThisTurn"]}
execute at @s run scoreboard players operation @e[tag=scoreThisTurn] UUID = @s UUID
execute at @s run scoreboard players operation @e[tag=scoreThisTurn] currentHole = @s currentHole
tag @e[tag=scoreThisTurn] remove scoreThisTurn



# Spawn hole markers
execute if entity @s[scores={currentHole=1}] unless entity @e[tag=hole1Marker] run summon shulker 82 78 3183 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole1Marker","holeMarker"]}
execute if entity @s[scores={currentHole=2}] unless entity @e[tag=hole2Marker] run summon shulker 220 74 3116 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole2Marker","holeMarker"]}
execute if entity @s[scores={currentHole=3}] unless entity @e[tag=hole3Marker] run summon shulker 120 103 3029 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole3Marker","holeMarker"]}
execute if entity @s[scores={currentHole=4}] unless entity @e[tag=hole4Marker] run summon shulker 75 130 3078 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole4Marker","holeMarker"]}
execute if entity @s[scores={currentHole=5}] unless entity @e[tag=hole5Marker] run summon shulker 136 139 3181 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole5Marker","holeMarker"]}
execute if entity @s[scores={currentHole=6}] unless entity @e[tag=hole6Marker] run summon shulker 142 108 3264 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole6Marker","holeMarker"]}
execute if entity @s[scores={currentHole=7}] unless entity @e[tag=hole7Marker] run summon shulker 59 127 3303 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole7Marker","holeMarker"]}
execute if entity @s[scores={currentHole=8}] unless entity @e[tag=hole8Marker] run summon shulker -41 99 3339 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole8Marker","holeMarker"]}
execute if entity @s[scores={currentHole=9}] unless entity @e[tag=hole9Marker] run summon shulker -94 103 3262 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole9Marker","holeMarker"]}
execute if entity @s[scores={currentHole=10}] unless entity @e[tag=hole10Marker] run summon shulker -56 167 3153 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole10Marker","holeMarker"]}
execute if entity @s[scores={currentHole=11}] unless entity @e[tag=hole11Marker] run summon shulker -6 228 3134 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole11Marker","holeMarker"]}
execute if entity @s[scores={currentHole=12}] unless entity @e[tag=hole12Marker] run summon shulker 59 177 3238 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole12Marker","holeMarker"]}
execute if entity @s[scores={currentHole=13}] unless entity @e[tag=hole13Marker] run summon shulker 153 204 3223 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole13Marker","holeMarker"]}
execute if entity @s[scores={currentHole=14}] unless entity @e[tag=hole14Marker] run summon shulker 175 207 3099 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole14Marker","holeMarker"]}
execute if entity @s[scores={currentHole=15}] unless entity @e[tag=hole15Marker] run summon shulker 82 228 3080 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole15Marker","holeMarker"]}
execute if entity @s[scores={currentHole=16}] unless entity @e[tag=hole16Marker] run summon shulker -71 151 3037 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole16Marker","holeMarker"]}
execute if entity @s[scores={currentHole=17}] unless entity @e[tag=hole17Marker] run summon shulker -30 138 3091 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole17Marker","holeMarker"]}
execute if entity @s[scores={currentHole=18}] unless entity @e[tag=hole18Marker] run summon shulker -14 106 3164 {Glowing:1b,Silent:2b,NoAI:1b,Invulnerable:1b,Color:15,Tags:["hole18Marker","holeMarker"]}