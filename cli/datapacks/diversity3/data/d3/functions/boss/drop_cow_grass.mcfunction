####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 29 2018 / DECEMBER 2 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar DropCowGrass

scoreboard players add @e[tag=MainBossAEC] DropCowGrass 1

execute if entity @e[scores={DropCowGrass=1}] run fill -1041 65 -988 -1039 65 -983 air
execute if entity @e[scores={DropCowGrass=1}] run fill -1042 64 -982 -1038 64 -989 air
execute if entity @e[scores={DropCowGrass=1}] run fill -1042 63 -982 -1038 63 -989 air
execute if entity @e[scores={DropCowGrass=1}] run fill -1042 63 -990 -1038 71 -981 air


execute if entity @e[scores={DropCowGrass=1}] run fill -1042 62 -982 -1040 62 -989 barrier

execute if entity @e[scores={DropCowGrass=12}] run summon falling_block -1041 94 -988 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=54}] run summon falling_block -1041 94 -987 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=24}] run summon falling_block -1041 94 -986 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=45}] run summon falling_block -1041 94 -985 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=15}] run summon falling_block -1041 94 -984 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=33}] run summon falling_block -1041 94 -983 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

execute if entity @e[scores={DropCowGrass=39}] run summon falling_block -1040 94 -988 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=36}] run summon falling_block -1040 94 -987 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=51}] run summon falling_block -1040 94 -986 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=27}] run summon falling_block -1040 94 -985 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=3}] run summon falling_block -1040 94 -984 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=9}] run summon falling_block -1040 94 -983 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

execute if entity @e[scores={DropCowGrass=48}] run summon falling_block -1039 94 -988 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=42}] run summon falling_block -1039 94 -987 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=9}] run summon falling_block -1039 94 -986 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=21}] run summon falling_block -1039 94 -985 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=30}] run summon falling_block -1039 94 -984 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropCowGrass=18}] run summon falling_block -1039 94 -983 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

scoreboard players set @e[scores={DropCowGrass=100}] DropCowGrass 115


execute if entity @e[scores={DropCowGrass=120}] run setblock -1042 63 -989 light_blue_concrete
execute if entity @e[scores={DropCowGrass=121}] run setblock -1042 63 -988 light_blue_concrete
execute if entity @e[scores={DropCowGrass=122}] run setblock -1042 63 -987 light_blue_concrete
execute if entity @e[scores={DropCowGrass=123}] run setblock -1042 63 -986 light_blue_concrete
execute if entity @e[scores={DropCowGrass=124}] run setblock -1042 63 -985 light_blue_concrete
execute if entity @e[scores={DropCowGrass=125}] run setblock -1042 63 -984 light_blue_concrete
execute if entity @e[scores={DropCowGrass=126}] run setblock -1042 63 -983 light_blue_concrete
execute if entity @e[scores={DropCowGrass=127}] run setblock -1042 63 -982 light_blue_concrete
execute if entity @e[scores={DropCowGrass=128}] run setblock -1041 63 -982 light_blue_concrete
execute if entity @e[scores={DropCowGrass=129}] run setblock -1040 63 -982 light_blue_concrete
execute if entity @e[scores={DropCowGrass=130}] run setblock -1039 63 -982 light_blue_concrete


execute if entity @e[scores={DropCowGrass=120}] run setblock -1038 63 -982 light_blue_concrete
execute if entity @e[scores={DropCowGrass=121}] run setblock -1038 63 -983 light_blue_concrete
execute if entity @e[scores={DropCowGrass=122}] run setblock -1038 63 -984 light_blue_concrete
execute if entity @e[scores={DropCowGrass=123}] run setblock -1038 63 -985 light_blue_concrete
execute if entity @e[scores={DropCowGrass=124}] run setblock -1038 63 -986 light_blue_concrete
execute if entity @e[scores={DropCowGrass=125}] run setblock -1038 63 -987 light_blue_concrete
execute if entity @e[scores={DropCowGrass=126}] run setblock -1038 63 -988 light_blue_concrete
execute if entity @e[scores={DropCowGrass=127}] run setblock -1038 63 -989 light_blue_concrete
execute if entity @e[scores={DropCowGrass=128}] run setblock -1039 63 -989 light_blue_concrete
execute if entity @e[scores={DropCowGrass=129}] run setblock -1040 63 -989 light_blue_concrete
execute if entity @e[scores={DropCowGrass=130}] run setblock -1041 63 -989 light_blue_concrete


execute if entity @e[scores={DropCowGrass=160}] run setblock -1040 64 -988 grass
execute if entity @e[scores={DropCowGrass=160}] run playsound block.grass.place block @a -1040 64 -988 0.5 1 0

execute if entity @e[scores={DropCowGrass=170}] run setblock -1041 64 -986 grass
execute if entity @e[scores={DropCowGrass=170}] run playsound block.grass.place block @a -1041 64 -986 0.5 1 0

execute if entity @e[scores={DropCowGrass=180}] run setblock -1039 64 -983 grass
execute if entity @e[scores={DropCowGrass=180}] run playsound block.grass.place block @a -1039 64 -983 0.5 1 0

execute if entity @e[scores={DropCowGrass=180..}] run scoreboard objectives remove DropCowGrass