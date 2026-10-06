####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 1 2017 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar PistonRange
#scoreboard objectives setdisplay sidebar PistonHint
#scoreboard objectives setdisplay sidebar PistonWin

scoreboard objectives add PistonRange dummy

execute as @a at @s run execute if block ~ 60 ~ air run scoreboard players set @s PistonRange -2
execute as @a at @s run execute if block ~ 60 ~ magma_block run scoreboard players add @s PistonRange 1


# TESTFORBLOCKS SPECIFICALLY HERE #
execute if block 985 62 5 sticky_piston[extended=false] run execute if block 987 62 5 sticky_piston[extended=false] run execute if block 983 62 7 sticky_piston[extended=false] run execute if block 985 62 7 sticky_piston[extended=false] run execute if block 987 62 7 sticky_piston[extended=false] run execute if block 989 62 7 sticky_piston[extended=false] run execute if block 983 62 9 sticky_piston[extended=false] run execute if block 985 62 9 sticky_piston[extended=false] run execute if block 987 62 9 sticky_piston[extended=false] run execute if block 989 62 9 sticky_piston[extended=false] run execute if block 985 62 11 sticky_piston[extended=false] run execute if block 987 62 11 sticky_piston[extended=false] run scoreboard players set @a PistonRange -200
###################################


execute as @a[scores={PistonRange=1}] at @s run fill ~-2 61 ~-2 ~2 61 ~2 stone replace redstone_block
execute as @a[scores={PistonRange=1}] at @s run fill ~-2 61 ~-2 ~2 61 ~2 redstone_block replace clay

execute as @a[scores={PistonRange=2}] at @s run fill ~-2 61 ~-2 ~2 61 ~2 clay replace stone


# RUN THE HINT TIMER
scoreboard objectives add PistonHint dummy
scoreboard players add @e[tag=MainPuzzleAEC] PistonHint 1

execute if entity @e[scores={PistonHint=1}] run kill @e[type=end_crystal]
execute if entity @e[scores={PistonHint=2999}] run kill @e[type=end_crystal]

# 1. BLACK
execute if entity @e[scores={PistonHint=3000}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:985,Y:61,Z:11},Tags:["PistonCrystal"]}

# 2. PURPLE
execute if entity @e[scores={PistonHint=3400}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:985,Y:61,Z:5},Tags:["PistonCrystal"]}

# 3. WHITE
execute if entity @e[scores={PistonHint=3800}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:989,Y:61,Z:7},Tags:["PistonCrystal"]}

# 4. LIGHT BLUE
execute if entity @e[scores={PistonHint=4200}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:983,Y:61,Z:7},Tags:["PistonCrystal"]}

# 5. ORANGE
execute if entity @e[scores={PistonHint=4600}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:985,Y:61,Z:7},Tags:["PistonCrystal"]}



# SHOWS PATHWAY
execute if entity @e[scores={PistonHint=5399}] run kill @e[type=end_crystal]
execute if entity @e[scores={PistonHint=5400}] run summon end_crystal 986 90 8 {Invulnerable:false,ShowBottom:false,BeamTarget:{X:980,Y:61,Z:8},Tags:["PistonCrystal"]}

execute if entity @e[scores={PistonHint=5560}] run data merge entity @e[type=end_crystal,limit=1] {BeamTarget:{X:985,Y:61,Z:11}}
execute if entity @e[scores={PistonHint=5620}] run data merge entity @e[type=end_crystal,limit=1] {BeamTarget:{X:985,Y:61,Z:5}}
execute if entity @e[scores={PistonHint=5680}] run data merge entity @e[type=end_crystal,limit=1] {BeamTarget:{X:989,Y:61,Z:7}}
execute if entity @e[scores={PistonHint=5740}] run data merge entity @e[type=end_crystal,limit=1] {BeamTarget:{X:983,Y:61,Z:7}}
execute if entity @e[scores={PistonHint=5800}] run data merge entity @e[type=end_crystal,limit=1] {BeamTarget:{X:985,Y:61,Z:7}}

scoreboard players set @e[scores={PistonHint=5880..}] PistonHint 5398


# TEST FOR THE WIN
scoreboard objectives add PistonWin dummy
execute if block 985 62 5 sticky_piston[extended=true] run scoreboard players set @e[tag=MainPuzzleAEC] PistonWin 0

execute if block 985 62 5 sticky_piston[extended=false] run execute if block 987 62 5 sticky_piston[extended=false] run execute if block 983 62 7 sticky_piston[extended=false] run execute if block 985 62 7 sticky_piston[extended=false] run execute if block 987 62 7 sticky_piston[extended=false] run execute if block 989 62 7 sticky_piston[extended=false] run execute if block 983 62 9 sticky_piston[extended=false] run execute if block 985 62 9 sticky_piston[extended=false] run execute if block 987 62 9 sticky_piston[extended=false] run execute if block 989 62 9 sticky_piston[extended=false] run execute if block 985 62 11 sticky_piston[extended=false] run execute if block 987 62 11 sticky_piston[extended=false] run scoreboard players add @e[tag=MainPuzzleAEC] PistonWin 1


# DOORS OPEN
execute if entity @e[scores={PistonWin=19}] run difficulty easy
execute if entity @e[scores={PistonWin=20}] run execute at @e[tag=PistonCrystal,limit=1,sort=random] run summon creeper ~ ~ ~ {Fuse:0}
execute if entity @e[scores={PistonWin=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={PistonWin=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={PistonWin=70}] run fill 984 64 1 988 65 15 clay replace redstone_block


# SWITCH TO END KEY
execute as @e[scores={PistonWin=70}] run setblock 979 65 8 clay
execute as @e[scores={PistonWin=70}] run setblock 979 65 8 command_block[facing=up]{auto:0b,TrackOutput:false}


# END
execute if entity @e[scores={PistonWin=70}] run scoreboard objectives remove PistonRange
execute if entity @e[scores={PistonWin=70}] run scoreboard objectives remove PistonHint
execute if entity @e[scores={PistonWin=70}] run setblock 43 2 14 clay
execute if entity @e[scores={PistonWin=70}] run scoreboard objectives remove PistonWin

#[tag=MainPuzzleAEC]