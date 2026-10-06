####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 18 2019 / MAY 25 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FORCE CONSTANT LOAD
scoreboard objectives add PuzzleSetup dummy
scoreboard players add @e[tag=MainPuzzleAEC] PuzzleSetup 0
execute if entity @e[scores={PuzzleSetup=0}] run fill 984 64 -8 1016 65 24 redstone_block replace clay
execute if entity @e[scores={PuzzleSetup=0}] run function d3:puzzle/restart_puzzles

execute if block 46 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 44 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 43 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 42 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 40 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 39 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 37 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 36 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 35 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1
execute if block 33 2 14 redstone_block run scoreboard players set @e[tag=MainPuzzleAEC] PuzzleSetup 1


# KILL EGGS
execute align x align y align z if entity @e[type=item,nbt={Item:{id:"minecraft:egg"}},x=995,y=64,z=3,dx=11,dy=2,dz=11] run kill @e[type=item,nbt={Item:{id:"minecraft:egg"}},x=995,y=64,z=3,dx=11,dy=2,dz=11]


# BRING STRAGGLERS
execute if block 1 4 2 red_wool run gamemode adventure @a[tag=!InPuzzleBranch,tag=!D3Admin]
execute if block 1 4 2 red_wool run spawnpoint @a[tag=!InPuzzleBranch] 1000 64 19
execute if block 1 4 2 red_wool run teleport @a[tag=!InPuzzleBranch] 1000 64 19 0 0
execute if block 1 4 2 red_wool run clear @a[tag=!InPuzzleBranch]
execute if block 1 4 2 red_wool run tag @a add InPuzzleBranch

execute align x align y align z run advancement grant @a[x=1008,y=1,z=15,dx=2,dy=1,dz=1] only d3:folder_c/puzzle_trap