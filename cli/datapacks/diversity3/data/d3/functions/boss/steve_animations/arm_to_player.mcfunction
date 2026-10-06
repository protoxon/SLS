####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 25 2018 / DECEMBER 8 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov,net
####################################################################

# REMOVES ARM UP
execute if block -1027 86 -953 white_terracotta run fill -1027 79 -953 -1024 86 -950 air

# REMOVES ARM DOWN
execute if block -1027 67 -953 white_terracotta run fill -1027 67 -953 -1024 74 -950 air

# REMOVES ARM TO STONE
execute if block -1016 75 -953 white_terracotta run fill -1023 75 -953 -1016 78 -950 air
execute if block -1017 78 -952 black_terracotta run setblock -1017 78 -952 air

# PROTECTS CONCRETE POWDER
fill -1027 74 -953 -1024 74 -950 barrier

# SETS ARM TO PLAYER
fill -1027 75 -961 -1024 78 -954 white_terracotta hollow
setblock -1025 78 -960 black_terracotta