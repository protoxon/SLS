####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# DECEMBER 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

# PICKAXE SMACKS
particle crit -1013 70 -952 0.5 0.5 0.5 2 1000 force

# CRACK NORTH SIDE
clone -1007 25 -1008 -992 40 -1008 -1016 55 -959 masked
particle cloud -1009 62 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1011 64 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1007 64 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1009 60 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1008 67 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1013 65 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1007 59 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1004 63 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1006 69 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1015 66 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1012 57 -960 0.3 0.3 0.3 0.1 10 force
particle cloud -1004 57 -960 0.3 0.3 0.3 0.1 10 force

# CRACK WEST SIDE
clone -1010 25 -1005 -1010 40 -990 -1016 55 -959 masked
particle cloud -1017 64 -953 0.3 0.3 0.3 0.1 10 force
particle cloud -1017 62 -951 0.3 0.3 0.3 0.1 10 force
particle cloud -1017 64 -949 0.3 0.3 0.3 0.1 10 force
particle cloud -1017 59 -952 0.3 0.3 0.3 0.1 10 force

# CRACK EAST SIDE
clone -1010 25 -1005 -1010 40 -990 -1001 55 -959 masked
particle cloud -1000 64 -949 0.3 0.3 0.3 0.1 10 force
particle cloud -1000 62 -951 0.3 0.3 0.3 0.1 10 force
particle cloud -1000 64 -953 0.3 0.3 0.3 0.1 10 force
particle cloud -1000 59 -952 0.3 0.3 0.3 0.1 10 force

# CRACK TOP SIDE
clone -1007 43 -1005 -992 43 -990 -1016 70 -959 masked
particle cloud -1007 71 -950 0.3 0.3 0.3 0.1 10 force
particle cloud -1009 71 -952 0.3 0.3 0.3 0.1 10 force
particle cloud -1012 71 -950 0.3 0.3 0.3 0.1 10 force
particle cloud -1008 71 -955 0.3 0.3 0.3 0.1 10 force

playsound entity.generic.explode master @a -1013 71 -952 10 1.5 0.3