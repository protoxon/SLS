####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / JANUARY 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar GatesUp

scoreboard players add @e[scores={GatesUp=0..}] GatesUp 1


# ALCOVE 1
execute if entity @e[scores={GatesUp=1}] run playsound block.ender_chest.close master @a 27 63 1989 1 0.5 0.5


execute if entity @e[scores={GatesUp=2}] run fill 27 60 1988 27 60 1989 polished_andesite
execute if entity @e[scores={GatesUp=2}] run fill 28 60 1989 28 60 1990 polished_andesite

execute if entity @e[scores={GatesUp=2}] run fill 27 61 1988 27 64 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=2}] run fill 27 61 1989 27 64 1989 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=2}] run fill 28 61 1989 28 64 1989 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=2}] run fill 28 61 1990 28 64 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=4}] run fill 27 61 1988 27 61 1989 polished_andesite
execute if entity @e[scores={GatesUp=4}] run fill 28 61 1989 28 61 1990 polished_andesite

execute if entity @e[scores={GatesUp=4}] run fill 27 62 1988 27 65 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=4}] run fill 27 62 1989 27 65 1989 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=4}] run fill 28 62 1989 28 65 1989 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=4}] run fill 28 62 1990 28 65 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=6}] run fill 27 62 1988 27 62 1989 polished_andesite
execute if entity @e[scores={GatesUp=6}] run fill 28 62 1989 28 62 1990 polished_andesite

execute if entity @e[scores={GatesUp=6}] run fill 27 63 1988 27 66 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=6}] run fill 27 63 1989 27 66 1989 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=6}] run fill 28 63 1989 28 66 1989 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=6}] run fill 28 63 1990 28 66 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run fill 27 63 1988 27 63 1989 polished_andesite
execute if entity @e[scores={GatesUp=8}] run fill 28 63 1989 28 63 1990 polished_andesite

execute if entity @e[scores={GatesUp=8}] run fill 27 64 1988 27 67 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=8}] run fill 27 64 1989 27 67 1989 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=8}] run fill 28 64 1989 28 67 1989 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=8}] run fill 28 64 1990 28 67 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run playsound entity.blaze.hurt master @a 27 67 1989 1 0.5 0.5



# ALCOVE 2
execute if entity @e[scores={GatesUp=1}] run playsound block.ender_chest.close master @a 27 63 2011 1 0.5 0.5


execute if entity @e[scores={GatesUp=2}] run fill 28 60 2010 28 60 2011 polished_andesite
execute if entity @e[scores={GatesUp=2}] run fill 27 60 2011 27 60 2012 polished_andesite

execute if entity @e[scores={GatesUp=2}] run fill 28 61 2010 28 64 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=2}] run fill 28 61 2011 28 64 2011 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=2}] run fill 27 61 2011 27 64 2011 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=2}] run fill 27 61 2012 27 64 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=4}] run fill 28 61 2010 28 61 2011 polished_andesite
execute if entity @e[scores={GatesUp=4}] run fill 27 61 2011 27 61 2012 polished_andesite

execute if entity @e[scores={GatesUp=4}] run fill 28 62 2010 28 65 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=4}] run fill 28 62 2011 28 65 2011 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=4}] run fill 27 62 2011 27 65 2011 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=4}] run fill 27 62 2012 27 65 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=6}] run fill 28 62 2010 28 62 2011 polished_andesite
execute if entity @e[scores={GatesUp=6}] run fill 27 62 2011 27 62 2012 polished_andesite

execute if entity @e[scores={GatesUp=6}] run fill 28 63 2010 28 66 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=6}] run fill 28 63 2011 28 66 2011 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=6}] run fill 27 63 2011 27 66 2011 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=6}] run fill 27 63 2012 27 66 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run fill 28 63 2010 28 63 2011 polished_andesite
execute if entity @e[scores={GatesUp=8}] run fill 27 63 2011 27 63 2012 polished_andesite

execute if entity @e[scores={GatesUp=8}] run fill 28 64 2010 28 67 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=8}] run fill 28 64 2011 28 67 2011 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=8}] run fill 27 64 2011 27 67 2011 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=8}] run fill 27 64 2012 27 67 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run playsound entity.blaze.hurt master @a 27 67 2011 1 0.5 0.5



# ALCOVE 3
execute if entity @e[scores={GatesUp=1}] run playsound block.ender_chest.close master @a -27 63 2011 1 0.5 0.5


execute if entity @e[scores={GatesUp=2}] run fill -28 60 2010 -28 60 2011 polished_andesite
execute if entity @e[scores={GatesUp=2}] run fill -27 60 2011 -27 60 2012 polished_andesite

execute if entity @e[scores={GatesUp=2}] run fill -28 61 2010 -28 64 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=2}] run fill -28 61 2011 -28 64 2011 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=2}] run fill -27 61 2011 -27 64 2011 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=2}] run fill -27 61 2012 -27 64 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=4}] run fill -28 61 2010 -28 61 2011 polished_andesite
execute if entity @e[scores={GatesUp=4}] run fill -27 61 2011 -27 61 2012 polished_andesite

execute if entity @e[scores={GatesUp=4}] run fill -28 62 2010 -28 65 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=4}] run fill -28 62 2011 -28 65 2011 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=4}] run fill -27 62 2011 -27 65 2011 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=4}] run fill -27 62 2012 -27 65 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=6}] run fill -28 62 2010 -28 62 2011 polished_andesite
execute if entity @e[scores={GatesUp=6}] run fill -27 62 2011 -27 62 2012 polished_andesite

execute if entity @e[scores={GatesUp=6}] run fill -28 63 2010 -28 66 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=6}] run fill -28 63 2011 -28 66 2011 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=6}] run fill -27 63 2011 -27 66 2011 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=6}] run fill -27 63 2012 -27 66 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run fill -28 63 2010 -28 63 2011 polished_andesite
execute if entity @e[scores={GatesUp=8}] run fill -27 63 2011 -27 63 2012 polished_andesite

execute if entity @e[scores={GatesUp=8}] run fill -28 64 2010 -28 67 2010 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=8}] run fill -28 64 2011 -28 67 2011 iron_bars[east=true,west=false,north=true,south=false]
execute if entity @e[scores={GatesUp=8}] run fill -27 64 2011 -27 67 2011 iron_bars[east=false,west=true,north=false,south=true]
execute if entity @e[scores={GatesUp=8}] run fill -27 64 2012 -27 67 2012 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run playsound entity.blaze.hurt master @a 27 67 2011 1 0.5 0.5



# ALCOVE 4
execute if entity @e[scores={GatesUp=1}] run playsound block.ender_chest.close master @a -27 63 1989 1 0.5 0.5


execute if entity @e[scores={GatesUp=2}] run fill -27 60 1988 -27 60 1989 polished_andesite
execute if entity @e[scores={GatesUp=2}] run fill -28 60 1989 -28 60 1990 polished_andesite

execute if entity @e[scores={GatesUp=2}] run fill -27 61 1988 -27 64 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=2}] run fill -27 61 1989 -27 64 1989 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=2}] run fill -28 61 1989 -28 64 1989 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=2}] run fill -28 61 1990 -28 64 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=4}] run fill -27 61 1988 -27 61 1989 polished_andesite
execute if entity @e[scores={GatesUp=4}] run fill -28 61 1989 -28 61 1990 polished_andesite

execute if entity @e[scores={GatesUp=4}] run fill -27 62 1988 -27 65 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=4}] run fill -27 62 1989 -27 65 1989 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=4}] run fill -28 62 1989 -28 65 1989 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=4}] run fill -28 62 1990 -28 65 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=6}] run fill -27 62 1988 -27 62 1989 polished_andesite
execute if entity @e[scores={GatesUp=6}] run fill -28 62 1989 -28 62 1990 polished_andesite

execute if entity @e[scores={GatesUp=6}] run fill -27 63 1988 -27 66 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=6}] run fill -27 63 1989 -27 66 1989 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=6}] run fill -28 63 1989 -28 66 1989 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=6}] run fill -28 63 1990 -28 66 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run fill -27 63 1988 -27 63 1989 polished_andesite
execute if entity @e[scores={GatesUp=8}] run fill -28 63 1989 -28 63 1990 polished_andesite

execute if entity @e[scores={GatesUp=8}] run fill -27 64 1988 -27 67 1988 iron_bars[east=false,west=false,north=true,south=true]
execute if entity @e[scores={GatesUp=8}] run fill -27 64 1989 -27 67 1989 iron_bars[east=false,west=true,north=true,south=false]
execute if entity @e[scores={GatesUp=8}] run fill -28 64 1989 -28 67 1989 iron_bars[east=true,west=false,north=false,south=true]
execute if entity @e[scores={GatesUp=8}] run fill -28 64 1990 -28 67 1990 iron_bars[east=false,west=false,north=true,south=true]


execute if entity @e[scores={GatesUp=8}] run playsound entity.blaze.hurt master @a -27 67 1989 1 0.5 0.5


execute if entity @e[scores={GatesUp=9..}] run scoreboard objectives remove GatesUp