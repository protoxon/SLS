####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 6 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# TRIVIA
execute if block 1000 29 1000 command_block run execute unless block 1000 29 1000 command_block{Command: "function d3:trivia/setup_trivia"} run data merge block 1000 29 1000 {Command: "function d3:trivia/setup_trivia"}


# PARKOUR
execute if block 1000 8 -1000 command_block run execute unless block 1000 8 -1000 command_block{Command: "function d3:parkour/setup_parkour"} run data merge block 1000 8 -1000 {Command: "function d3:parkour/setup_parkour"}


# ESCAPE
execute if block -1008 0 806 command_block run execute unless block -1008 0 806 command_block{Command: "function d3:escape/setup_escape"} run data merge block -1008 0 806 {Command: "function d3:escape/setup_escape"}


# DROPPER
execute if block -1001 253 24 command_block run execute unless block -1001 253 24 command_block{Command: "function d3:dropper/setup_dropper"} run data merge block -1001 253 24 {Command: "function d3:dropper/setup_dropper"}


# SURVIVAL
execute if block 8 47 -1000 command_block run execute unless block 8 47 -1000 command_block{Command: "execute align x align y align z run kill @e[type=!player,dx=0,dy=3,dz=0]"} run data merge block 8 47 -1000 {Command: "execute align x align y align z run kill @e[type=!player,dx=0,dy=3,dz=0]"}
execute if block 8 46 -1000 chain_command_block run execute unless block 8 46 -1000 chain_command_block{Command: "execute align x align y align z run execute if entity @e[type=player,dx=0,dy=3,dz=0] run setblock 12 2 -18 redstone_block"} run data merge block 8 46 -1000 {Command: "execute align x align y align z run execute if entity @e[type=player,dx=0,dy=3,dz=0] run setblock 12 2 -18 redstone_block"}


# PUZZLE
execute if block 1000 34 8 command_block run execute unless block 1000 34 8 command_block{Command: "function d3:puzzle/setup_puzzles"} run data merge block 1000 34 8 {Command: "function d3:puzzle/setup_puzzles"}


# BONUS
execute if block 0 82 3200 command_block run execute unless block 0 82 3200 command_block{Command: "function d3:bonus/setup_golf"} run data merge block 0 82 3200 {Command: "function d3:bonus/setup_golf"}