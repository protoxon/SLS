####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 8 2018 / DECEMBER 9 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


tag @e remove MooshroomInjured

kill @e[tag=FlyToTarget]

summon area_effect_cloud -1039.5 72 -985.0 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -991.5 72 -985.0 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1015 72 -975 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1015 72 -995 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1037 72 -975 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1029 71 -992 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1008 72 -973 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -995 72 -981 {Duration:500,Tags:["BossAEC","FlyToTarget"]}
summon area_effect_cloud -1006 72 -997 {Duration:500,Tags:["BossAEC","FlyToTarget"]}



execute at @e[tag=BossMooshroom] run kill @e[tag=FlyToTarget,limit=1,sort=nearest]
kill @e[tag=FlyToTarget,limit=7,sort=random]



# LAUNCH COW MANURE
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop"]}
summon area_effect_cloud -1015 47 -986 {Duration:2,Tags:["BossAEC","RandomBombDrop","BombDropYes"]}
kill @e[tag=RandomBombDrop,limit=6,sort=random]

execute if entity @e[tag=BombDropYes] run scoreboard objectives add ManureBomb dummy