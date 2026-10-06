####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 26 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar MoveGate


execute if block -2 65 1975 lever run scoreboard objectives add MoveGate dummy
scoreboard players add @e[tag=MainArenaAEC] MoveGate 0

execute if entity @e[scores={MoveGate=0}] run fill -1 63 1979 1 63 1979 polished_andesite
execute if entity @e[scores={MoveGate=0}] run fill -1 64 1979 1 67 1979 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=0}] run fill -1 64 1971 1 67 1971 air
execute if entity @e[scores={MoveGate=0}] run fill -1 59 1971 1 59 1971 polished_andesite
execute if entity @e[scores={MoveGate=0}] run fill -1 60 1971 1 63 1971 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=0}] run setblock -2 65 1975 lever[face=wall,facing=east,powered=false]
scoreboard players set @e[scores={MoveGate=0}] MoveGate 112


# SOUTHERN LEVER
execute if block -2 65 1968 lever[powered=true] unless block -3 64 1968 redstone_block run setblock -3 64 1968 redstone_block
execute if block -2 65 1968 lever[powered=false] unless block -4 64 1968 red_concrete run setblock -4 64 1968 redstone_block
fill -1 60 1971 1 67 1971 iron_bars[east=true,west=true,north=false,south=false] replace iron_bars[east=true,west=true,north=true,south=true]


# NORTHERN LEVER
execute if block -2 65 1975 lever[powered=true] unless block -3 64 1975 redstone_block run setblock -3 64 1975 redstone_block
execute if block -2 65 1975 lever[powered=false] unless block -4 64 1975 red_concrete run setblock -4 64 1975 redstone_block
fill -1 60 1979 1 67 1979 iron_bars[east=true,west=true,north=false,south=false] replace iron_bars[east=true,west=true,north=true,south=true]


execute if block -2 65 1975 lever[powered=true] run scoreboard players remove @e[scores={MoveGate=101..112}] MoveGate 1
execute if block -2 65 1975 lever[powered=false] run scoreboard players add @e[scores={MoveGate=100..111}] MoveGate 1



# NORTH GATE
execute if entity @e[scores={MoveGate=102}] run fill -1 59 1979 1 59 1979 polished_andesite
execute if entity @e[scores={MoveGate=102}] run fill -1 60 1979 1 63 1979 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=102}] run fill -1 64 1979 1 67 1979 air

execute if entity @e[scores={MoveGate=104}] run fill -1 60 1979 1 60 1979 polished_andesite
execute if entity @e[scores={MoveGate=104}] run fill -1 61 1979 1 64 1979 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=104}] run fill -1 65 1979 1 67 1979 air

execute if entity @e[scores={MoveGate=106}] run fill -1 61 1979 1 61 1979 polished_andesite
execute if entity @e[scores={MoveGate=106}] run fill -1 62 1979 1 65 1979 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=106}] run fill -1 66 1979 1 67 1979 air

execute if entity @e[scores={MoveGate=108}] run fill -1 62 1979 1 62 1979 polished_andesite
execute if entity @e[scores={MoveGate=108}] run fill -1 63 1979 1 66 1979 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=108}] run fill -1 67 1979 1 67 1979 air

execute if entity @e[scores={MoveGate=110}] run fill -1 63 1979 1 63 1979 polished_andesite
execute if entity @e[scores={MoveGate=110}] run fill -1 64 1979 1 67 1979 iron_bars[east=true,west=true,north=false,south=false]



# SOUTH GATE
execute if entity @e[scores={MoveGate=102}] run fill -1 63 1971 1 63 1971 polished_andesite
execute if entity @e[scores={MoveGate=102}] run fill -1 64 1971 1 67 1971 iron_bars[east=true,west=true,north=false,south=false]

execute if entity @e[scores={MoveGate=104}] run fill -1 62 1971 1 62 1971 polished_andesite
execute if entity @e[scores={MoveGate=104}] run fill -1 63 1971 1 66 1971 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=104}] run fill -1 67 1971 1 67 1971 air

execute if entity @e[scores={MoveGate=106}] run fill -1 61 1971 1 61 1971 polished_andesite
execute if entity @e[scores={MoveGate=106}] run fill -1 62 1971 1 65 1971 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=106}] run fill -1 66 1971 1 67 1971 air

execute if entity @e[scores={MoveGate=108}] run fill -1 60 1971 1 60 1971 polished_andesite
execute if entity @e[scores={MoveGate=108}] run fill -1 61 1971 1 64 1971 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=108}] run fill -1 65 1971 1 67 1971 air

execute if entity @e[scores={MoveGate=110}] run fill -1 59 1971 1 59 1971 polished_andesite
execute if entity @e[scores={MoveGate=110}] run fill -1 60 1971 1 63 1971 iron_bars[east=true,west=true,north=false,south=false]
execute if entity @e[scores={MoveGate=110}] run fill -1 64 1971 1 67 1971 air



execute if block -2 65 1975 lever[powered=true] if entity @e[scores={MoveGate=111}] run playsound block.ender_chest.close ambient @a 0 67 1979 1 0.5 0.5
execute if block -2 65 1975 lever[powered=false] if entity @e[scores={MoveGate=101}] run playsound block.ender_chest.close ambient @a 0 67 1971 1 0.5 0.5

execute if block -2 65 1975 lever[powered=true] if entity @e[scores={MoveGate=101}] run playsound entity.blaze.hurt ambient @a 0 67 1971 1 0.5 0.5
execute if block -2 65 1975 lever[powered=false] if entity @e[scores={MoveGate=111}] run playsound entity.blaze.hurt ambient @a 0 67 1979 1 0.5 0.5
