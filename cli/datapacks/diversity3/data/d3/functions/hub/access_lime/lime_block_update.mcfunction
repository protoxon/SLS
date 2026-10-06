####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019 / AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# TRIVIA ACCESS
fill -24 87 992 -24 87 992 lime_concrete replace jungle_leaves

fill -24 87 985 -24 87 985 air replace oak_leaves
#fill -24 87 986 -24 87 986 bone_block replace air
fill -24 85 986 -24 85 986 sticky_piston[facing=up] replace dirt
fill -23 87 985 -23 87 985 air replace jungle_leaves
fill -23 88 985 -23 88 985 air replace oak_leaves

fill -22 86 978 -22 86 978 lime_concrete_powder replace air
execute if block -22 86 977 air run setblock -22 86 977 oak_wall_sign[facing=north]{Text1:"{\"text\":\"Gondola Toll\"}",Text2:"{\"text\":\"-------------\"}",Text3: "{\"text\":\"76 80 991\",\"obfuscated\":\"false\"}",Text4:"{\"text\":\"-------------\"}"}
#fill -24 86 986 -24 86 986 hopper{CustomName:"{\"text\":\"76 80 991\"}"} replace grass_block
fill -24 86 986 -24 86 986 bone_block replace grass_block
fill -24 86 987 -24 86 987 lime_concrete_powder replace stone
fill -24 86 985 -24 86 985 lime_concrete_powder replace grass_block
fill -25 86 986 -25 86 986 lime_concrete_powder replace grass_block
fill -23 86 986 -23 86 986 lime_concrete_powder replace grass_block



#   _       _
##  (_'-----'_)
#  (_.'""""._)
#76 80 991