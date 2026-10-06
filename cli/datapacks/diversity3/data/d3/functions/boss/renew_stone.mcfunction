####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 25 2018 / NOVEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# STONE
#execute if block -997 62 -991 air unless entity @e[tag=FallingStone1] run summon falling_block -997 94 -991 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone1"]}

#execute if block -996 63 -992 air unless entity @e[tag=FallingStone2] run summon falling_block -996 100 -992 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone2"]}

#execute if block -996 62 -991 air unless entity @e[tag=FallingStone3] run summon falling_block -996 94 -991 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone3"]}

execute if block -995 62 -988 air unless entity @e[tag=FallingStone4] run summon falling_block -995 94 -988 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone4"]}

#execute if block -994 64 -992 air unless entity @e[tag=FallingStone5] run summon falling_block -994 106 -992 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone5"]}


execute if block -993 62 -992 air if block -993 63 -992 air if block -993 64 -992 air unless entity @e[tag=FallingStone5] run summon falling_block -993 94 -992 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone5"]}

execute if block -993 62 -992 air if block -993 63 -992 air if block -993 64 -992 air unless entity @e[tag=FallingStone6] run summon falling_block -993 100 -992 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone6"]}

execute if block -993 62 -992 air if block -993 63 -992 air if block -993 64 -992 air unless entity @e[tag=FallingStone7] run summon falling_block -993 106 -992 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone7"]}



execute if block -993 62 -987 air unless entity @e[tag=FallingStone8] run summon falling_block -993 94 -987 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone8"]}


execute if block -992 64 -991 air if block -992 65 -991 air unless entity @e[tag=FallingStone9] run summon falling_block -992 100 -991 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone9"]}

execute if block -992 64 -991 air if block -992 65 -991 air unless entity @e[tag=FallingStone10] run summon falling_block -992 106 -991 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone10"]}


execute if block -992 62 -986 air unless entity @e[tag=FallingStone11] run summon falling_block -992 88 -986 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone11"]}

execute if block -992 62 -985 air unless entity @e[tag=FallingStone12] run summon falling_block -992 88 -985 {BlockState:{Name:"minecraft:stone"},Time:1,DropItem:0,HurtEntities:1b,FallHurtAmount:2f,FallHurtMax:2,Tags:["FallingBossBlock","FallingStone","FallingStone12"]}


execute at @e[tag=FallingStone] unless block ~ ~-1 ~ air run particle block stone ~ ~0.5 ~ 0.2 0.2 0.2 1 25 normal
execute at @e[tag=FallingStone] unless block ~ ~-1 ~ air run playsound block.stone.fall block @a ~ ~ ~ 0.5 1 0