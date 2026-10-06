####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 26 2018 / DECEMBER 8 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov,net
####################################################################

# REMOVES ARM UP
execute if block -1027 86 -953 white_terracotta run fill -1027 79 -953 -1024 86 -950 air replace white_terracotta

# REMOVES ARM DOWN
execute if block -1027 67 -953 white_terracotta run fill -1027 67 -953 -1024 74 -950 air replace white_terracotta

# REMOVES ARM TO PLAYER
execute if block -1027 75 -961 white_terracotta run fill -1027 75 -961 -1024 78 -954 air replace white_terracotta
execute if block -1025 78 -960 black_terracotta run setblock -1025 78 -960 air

# PROTECTS CONCRETE POWDER
fill -1027 74 -953 -1024 74 -950 barrier

# SETS ARM TO STONE
fill -1023 75 -953 -1016 78 -950 white_terracotta hollow
setblock -1017 78 -952 black_terracotta