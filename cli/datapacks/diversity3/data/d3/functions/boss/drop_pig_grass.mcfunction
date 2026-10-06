####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 28 2018 / NOVEMBER 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar DropPigGrass

scoreboard players add @e[tag=MainBossAEC] DropPigGrass 1

execute if entity @e[scores={DropPigGrass=1}] run fill -1034 64 -996 -1027 64 -992 air
execute if entity @e[scores={DropPigGrass=1}] run fill -1034 63 -996 -1027 71 -992 air
execute if entity @e[scores={DropPigGrass=1}] run fill -1034 62 -996 -1027 62 -994 air

execute if entity @e[scores={DropPigGrass=1}] run fill -1033 62 -995 -1028 62 -994 barrier

execute if entity @e[scores={DropPigGrass=12}] run summon falling_block -1033 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=54}] run summon falling_block -1032 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=24}] run summon falling_block -1031 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=45}] run summon falling_block -1030 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=15}] run summon falling_block -1029 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=33}] run summon falling_block -1028 94 -995 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

execute if entity @e[scores={DropPigGrass=39}] run summon falling_block -1028 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=36}] run summon falling_block -1029 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=51}] run summon falling_block -1030 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=27}] run summon falling_block -1031 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=3}] run summon falling_block -1032 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=9}] run summon falling_block -1033 94 -994 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

execute if entity @e[scores={DropPigGrass=48}] run summon falling_block -1028 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=42}] run summon falling_block -1029 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=9}] run summon falling_block -1030 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=21}] run summon falling_block -1031 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=30}] run summon falling_block -1032 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}
execute if entity @e[scores={DropPigGrass=18}] run summon falling_block -1033 94 -993 {BlockState:{Name:"minecraft:grass_block"},Time:1,DropItem:0,Tags:["FallingBossBlock","FallingGrass"]}

scoreboard players set @e[scores={DropPigGrass=100}] DropPigGrass 115


execute if entity @e[scores={DropPigGrass=120}] run setblock -1034 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=121}] run setblock -1034 63 -995 light_blue_concrete
execute if entity @e[scores={DropPigGrass=122}] run setblock -1034 63 -994 light_blue_concrete
execute if entity @e[scores={DropPigGrass=123}] run setblock -1034 63 -993 light_blue_concrete
execute if entity @e[scores={DropPigGrass=124}] run setblock -1034 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=125}] run setblock -1033 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=126}] run setblock -1032 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=127}] run setblock -1031 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=128}] run setblock -1030 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=129}] run setblock -1029 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=130}] run setblock -1028 63 -992 light_blue_concrete


execute if entity @e[scores={DropPigGrass=120}] run setblock -1027 63 -992 light_blue_concrete
execute if entity @e[scores={DropPigGrass=121}] run setblock -1027 63 -993 light_blue_concrete
execute if entity @e[scores={DropPigGrass=122}] run setblock -1027 63 -994 light_blue_concrete
execute if entity @e[scores={DropPigGrass=123}] run setblock -1027 63 -995 light_blue_concrete
execute if entity @e[scores={DropPigGrass=124}] run setblock -1027 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=125}] run setblock -1028 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=126}] run setblock -1029 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=127}] run setblock -1030 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=128}] run setblock -1031 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=129}] run setblock -1032 63 -996 light_blue_concrete
execute if entity @e[scores={DropPigGrass=130}] run setblock -1033 63 -996 light_blue_concrete


execute if entity @e[scores={DropPigGrass=160}] run setblock -1028 64 -994 grass
execute if entity @e[scores={DropPigGrass=160}] run playsound block.grass.place block @a -1028 64 -994 0.5 1 0

execute if entity @e[scores={DropPigGrass=170}] run setblock -1031 64 -995 grass
execute if entity @e[scores={DropPigGrass=170}] run playsound block.grass.place block @a -1031 64 -995 0.5 1 0

execute if entity @e[scores={DropPigGrass=180}] run setblock -1033 64 -993 grass
execute if entity @e[scores={DropPigGrass=180}] run playsound block.grass.place block @a -1033 64 -993 0.5 1 0

execute if entity @e[scores={DropPigGrass=180..}] run scoreboard objectives remove DropPigGrass