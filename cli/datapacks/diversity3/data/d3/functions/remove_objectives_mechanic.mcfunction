####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# 1.3.0 EXPERIMENTAL UPDATE FOR REMOVING OBJECTIVES
execute if block 19 1 2 air run setblock 19 1 2 repeater[facing=north,delay=4]
execute if block 19 1 3 air run setblock 19 1 3 repeater[facing=north,delay=4]
execute if block 19 1 4 air run setblock 19 1 4 repeater[facing=north,delay=4]
execute if block 19 1 5 air run setblock 19 1 5 repeater[facing=north,delay=4]
execute if block 19 1 6 air run setblock 19 1 6 repeater[facing=north,delay=4]
execute if block 19 1 7 air run setblock 19 1 7 repeater[facing=north,delay=4]
execute if block 19 1 8 air run setblock 19 1 8 repeating_command_block[facing=up]{Command:"function d3:remove_objectives",TrackOutput:0b}
execute if block 19 1 9 air run setblock 19 1 9 command_block[facing=south]{Command:"scoreboard objectives add DebugCount dummy",TrackOutput:0b}
execute if block 19 1 10 air run setblock 19 1 10 chain_command_block[facing=south]{Command:"scoreboard players add @a DebugCount 1",TrackOutput:0b}


# WHY AREN'T OBJECTIVES BEING REMOVED?!?!