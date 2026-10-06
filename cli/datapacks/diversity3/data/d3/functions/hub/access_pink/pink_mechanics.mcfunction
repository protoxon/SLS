####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ParkourAccess

# PARKOUR ACCESS -> TIMED PLATFORMS
scoreboard objectives add ParkourAccess dummy
scoreboard players add @e[tag=MainHubAEC] ParkourAccess 1
execute if entity @e[scores={ParkourAccess=220..}] if block -1 86 969 lever[powered=true] run playsound block.lever.click block @a -1 86 969 0.1 0.5 0
execute if entity @e[scores={ParkourAccess=220..}] run fill -1 86 969 -1 86 969 lever[face=floor,facing=west,powered=false] replace lever[powered=true]

execute if entity @e[scores={ParkourAccess=10}] run playsound block.note_block.chime block @a -6 83 963 1 1 0
execute if entity @e[scores={ParkourAccess=10}] run clone 7 11 13 9 12 15 -6 83 963
execute if entity @e[scores={ParkourAccess=30}] run playsound block.note_block.chime block @a -7 82 959 1 1 0
execute if entity @e[scores={ParkourAccess=30}] run clone 7 11 13 9 12 15 -7 82 959
execute if entity @e[scores={ParkourAccess=50}] run playsound block.note_block.chime block @a -9 81 954 1 1 0
execute if entity @e[scores={ParkourAccess=50}] run clone 7 11 13 9 12 15 -9 81 954
execute if entity @e[scores={ParkourAccess=70}] run playsound block.note_block.chime block @a -14 80 951 1 1 0
execute if entity @e[scores={ParkourAccess=70}] run clone 7 11 13 9 12 15 -14 80 951
execute if entity @e[scores={ParkourAccess=90}] run playsound block.note_block.chime block @a -19 79 952 1 1 0
execute if entity @e[scores={ParkourAccess=90}] run clone 7 11 13 9 12 15 -19 79 952
execute if entity @e[scores={ParkourAccess=110}] run playsound block.note_block.chime block @a -24 78 955 1 1 0
execute if entity @e[scores={ParkourAccess=110}] run clone 7 11 13 9 12 15 -24 78 955
execute if entity @e[scores={ParkourAccess=130}] run playsound block.note_block.chime block @a -29 77 954 1 1 0
execute if entity @e[scores={ParkourAccess=130}] run clone 7 11 13 9 12 15 -29 77 954
execute if entity @e[scores={ParkourAccess=150}] run playsound block.note_block.chime block @a -33 78 950 1 1 0
execute if entity @e[scores={ParkourAccess=150}] run clone 7 11 13 9 12 15 -33 78 950