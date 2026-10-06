####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 4 2018 / MAY 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives remove LetterParkWin
scoreboard objectives add LetterInRange dummy
scoreboard objectives add InRangeTimer dummy

fill 864 85 -866 934 90 -866 air
fill 874 63 -924 924 64 -874 air
clone 933 85 -901 937 96 -897 897 93 -865

kill @e[tag=LetterCloud]
summon area_effect_cloud 874 61 -924 {Tags:["ParkourCloud","LetterCloud","LetterParkourSetup"],Duration:2147483647}


# SETS IN RANDOM CLOUDS
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~ {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}

execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~9 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}

execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~18 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}

execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~27 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}

execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~36 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}

execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~ ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~9 ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~18 ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~27 ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~36 ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterParkourSetup] run summon area_effect_cloud ~45 ~ ~45 {Tags:["ParkourCloud","LetterCloud","RandomLetterCloud"],Duration:2147483647}


# SETS IN LETTERS / NUMBERS
execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_A","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_A] run clone 25 2 -23 30 2 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_A] run clone 25 2 -23 30 2 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_A] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_B","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_B] run clone 25 5 -23 30 5 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_B] run clone 25 5 -23 30 5 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_B] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_C","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_C] run clone 25 8 -23 30 8 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_C] run clone 25 8 -23 30 8 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_C] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_D","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_D] run clone 25 11 -23 30 11 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_D] run clone 25 11 -23 30 11 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_D] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_E","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_E] run clone 25 14 -23 30 14 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_E] run clone 25 14 -23 30 14 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_E] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_F","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_F] run clone 25 17 -23 30 17 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_F] run clone 25 17 -23 30 17 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_F] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_G","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_G] run clone 25 20 -23 30 20 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_G] run clone 25 20 -23 30 20 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_G] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_H","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_H] run clone 25 23 -23 30 23 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_H] run clone 25 23 -23 30 23 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_H] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_I","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_I] run clone 25 26 -23 30 26 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_I] run clone 25 26 -23 30 26 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_I] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_J","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_J] run clone 25 29 -23 30 29 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_J] run clone 25 29 -23 30 29 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_J] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_K","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_K] run clone 25 32 -23 30 32 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_K] run clone 25 32 -23 30 32 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_K] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_L","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_L] run clone 25 35 -23 30 35 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_L] run clone 25 35 -23 30 35 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_L] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]



execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_M","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_M] run clone 17 2 -23 22 2 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_M] run clone 17 2 -23 22 2 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_M] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_N","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_N] run clone 17 5 -23 22 5 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_N] run clone 17 5 -23 22 5 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_N] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_O","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_O] run clone 17 8 -23 22 8 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_O] run clone 17 8 -23 22 8 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_O] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_P","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_P] run clone 17 11 -23 22 11 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_P] run clone 17 11 -23 22 11 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_P] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_Q","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_Q] run clone 17 14 -23 22 14 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_Q] run clone 17 14 -23 22 14 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_Q] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_R","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_R] run clone 17 17 -23 22 17 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_R] run clone 17 17 -23 22 17 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_R] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_S","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_S] run clone 17 20 -23 22 20 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_S] run clone 17 20 -23 22 20 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_S] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_T","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_T] run clone 17 23 -23 22 23 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_T] run clone 17 23 -23 22 23 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_T] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_U","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_U] run clone 17 26 -23 22 26 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_U] run clone 17 26 -23 22 26 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_U] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_V","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_V] run clone 17 29 -23 22 29 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_V] run clone 17 29 -23 22 29 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_V] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_W","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_W] run clone 17 32 -23 22 32 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_W] run clone 17 32 -23 22 32 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_W] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_X","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_X] run clone 17 35 -23 22 35 -18 ~ ~2 ~
execute at @e[tag=LetterCloud_X] run clone 17 35 -23 22 35 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_X] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]



execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_Y","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_Y] run clone 17 2 -31 22 2 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_Y] run clone 17 2 -31 22 2 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_Y] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_Z","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_Z] run clone 17 5 -31 22 5 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_Z] run clone 17 5 -31 22 5 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_Z] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_0","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_0] run clone 17 8 -31 22 8 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_0] run clone 17 8 -31 22 8 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_0] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_1","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_1] run clone 17 11 -31 22 11 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_1] run clone 17 11 -31 22 11 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_1] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_2","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_2] run clone 17 14 -31 22 14 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_2] run clone 17 14 -31 22 14 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_2] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_3","RightLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_3] run clone 17 17 -31 22 17 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_3] run clone 17 17 -31 22 17 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_3] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_4","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_4] run clone 17 20 -31 22 20 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_4] run clone 17 20 -31 22 20 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_4] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_5","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_5] run clone 17 23 -31 22 23 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_5] run clone 17 23 -31 22 23 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_5] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_6","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_6] run clone 17 26 -31 22 26 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_6] run clone 17 26 -31 22 26 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_6] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_7","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_7] run clone 17 29 -31 22 29 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_7] run clone 17 29 -31 22 29 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_7] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_8","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_8] run clone 17 32 -31 22 32 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_8] run clone 17 32 -31 22 32 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_8] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]

execute at @e[tag=RandomLetterCloud,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParkourCloud","LetterCloud","LetterCloud_9","WrongLetterCloud"],Duration:2147483647}
execute at @e[tag=LetterCloud_9] run clone 17 35 -31 22 35 -26 ~ ~2 ~
execute at @e[tag=LetterCloud_9] run clone 17 35 -31 22 35 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_9] run kill @e[tag=RandomLetterCloud,sort=nearest,limit=1]


execute at @a run playsound block.end_portal_frame.fill master @a 899 83 -937 1 0.8 0


kill @e[tag=RandomLetterCloud]
kill @e[tag=LetterParkourSetup]