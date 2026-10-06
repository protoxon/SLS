####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PuzzleBridge

execute if entity @e[scores={PuzzleBridge=..119}] run fill 64 82 1023 64 82 1025 quartz_block replace redstone_block
execute if entity @e[scores={PuzzleBridge=..119}] run fill 93 82 1023 93 82 1025 quartz_block replace redstone_block

execute if entity @e[scores={PuzzleBridge=10}] run playsound entity.illusioner.cast_spell master @a 62 84 1027 1 0.7 0
execute if entity @e[scores={PuzzleBridge=30}] run playsound block.beacon.activate master @a 62 90 1027 2 1 0
execute if entity @e[scores={PuzzleBridge=30..65}] run particle instant_effect 62 90.5 1027 0.3 0.3 0.3 0 15 force
execute if entity @e[scores={PuzzleBridge=80}] run playsound block.beacon.power_select master @a 62 90 1027 0.5 1.5 0
execute if entity @e[scores={PuzzleBridge=80..87}] run particle dust 1 0 0 1 63 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=80..88}] run particle dust 1 0 0 1 64 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=80..89}] run particle dust 1 0 0 1 65 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..90}] run particle dust 1 0 0 1 66 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..91}] run particle dust 1 0 0 1 67 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=81..92}] run particle dust 1 0 0 1 68 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..93}] run particle dust 1 0 0 1 69 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..94}] run particle dust 1 0 0 1 70 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=82..95}] run particle dust 1 0 0 1 71 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..96}] run particle dust 1 0 0 1 72 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..97}] run particle dust 1 0 0 1 73 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=83..98}] run particle dust 1 0 0 1 74 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..99}] run particle dust 1 0 0 1 75 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..100}] run particle dust 1 0 0 1 76 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=84..101}] run particle dust 1 0 0 1 77 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..102}] run particle dust 1 0 0 1 78 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..103}] run particle dust 1 0 0 1 79 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=85..104}] run particle dust 1 0 0 1 80 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..105}] run particle dust 1 0 0 1 81 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..106}] run particle dust 1 0 0 1 82 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=86..107}] run particle dust 1 0 0 1 83 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..108}] run particle dust 1 0 0 1 84 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..109}] run particle dust 1 0 0 1 85 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=87..110}] run particle dust 1 0 0 1 86 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..111}] run particle dust 1 0 0 1 87 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..112}] run particle dust 1 0 0 1 88 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=88..113}] run particle dust 1 0 0 1 89 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=89..114}] run particle dust 1 0 0 1 90 90.5 1027 0.3 0 0 0 3 force
execute if entity @e[scores={PuzzleBridge=89..115}] run particle dust 1 0 0 1 91 90.5 1027 0.3 0 0 0 3 force

execute if entity @e[scores={PuzzleBridge=125}] run playsound entity.guardian.attack master @a 62 90 1027 2 1.4 1
execute if entity @e[scores={PuzzleBridge=125..150}] run particle instant_effect 92 90.5 1027 0.3 0.3 0.3 0 15 force

scoreboard players set @e[scores={PuzzleBridge=180..}] PuzzleBridge 160
execute if entity @e[scores={PuzzleBridge=160}] run fill 64 82 1023 64 82 1025 redstone_block
execute if entity @e[scores={PuzzleBridge=160}] run fill 93 82 1023 93 82 1025 redstone_block

execute if entity @e[scores={PuzzleBridge=170}] run fill 64 82 1023 64 82 1025 quartz_block
execute if entity @e[scores={PuzzleBridge=170}] run fill 93 82 1023 93 82 1025 quartz_block

execute if entity @e[scores={PuzzleBridge=178}] run fill 66 82 1023 66 82 1025 red_stained_glass replace air
execute if entity @e[scores={PuzzleBridge=178}] run fill 91 82 1023 91 82 1025 red_stained_glass replace air
