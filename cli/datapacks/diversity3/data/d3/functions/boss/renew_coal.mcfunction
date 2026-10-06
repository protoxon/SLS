####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 25 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# COAL
execute if block -992 64 -990 air unless entity @e[tag=FallingCoal1] run summon falling_block -992 100 -990 {BlockState:{Name:"minecraft:coal_ore"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingCoal","FallingCoal1"]}


execute if block -992 62 -989 air if block -992 63 -989 air if block -992 64 -989 air unless entity @e[tag=FallingCoal2] run summon falling_block -992 88 -989 {BlockState:{Name:"minecraft:coal_ore"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingCoal","FallingCoal2"]}

execute if block -992 62 -989 air if block -992 63 -989 air if block -992 64 -989 air unless entity @e[tag=FallingCoal3] run summon falling_block -992 94 -989 {BlockState:{Name:"minecraft:coal_ore"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingCoal","FallingCoal3"]}

execute if block -992 62 -989 air if block -992 63 -989 air if block -992 64 -989 air unless entity @e[tag=FallingCoal4] run summon falling_block -992 100 -989 {BlockState:{Name:"minecraft:coal_ore"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingCoal","FallingCoal4"]}


execute if block -992 64 -988 air unless entity @e[tag=FallingCoal5] run summon falling_block -992 100 -988 {BlockState:{Name:"minecraft:coal_ore"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingCoal","FallingCoal5"]}



execute at @e[tag=FallingCoal] unless block ~ ~-1 ~ air run particle block coal_ore ~ ~0.5 ~ 0.2 0.2 0.2 1 25 normal
execute at @e[tag=FallingCoal] unless block ~ ~-1 ~ air run playsound block.stone.fall block @a ~ ~ ~ 0.5 1 0