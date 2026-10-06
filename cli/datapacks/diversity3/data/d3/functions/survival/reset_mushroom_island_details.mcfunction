####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# FOR TESTING
#say mushroom details not changed


# SETS BED
execute if block 10 11 -18 red_mushroom_block if block -42 55 -1025 acacia_planks unless block -42 56 -1025 red_bed[facing=south,part=foot] run setblock -42 56 -1025 red_bed[facing=south,part=foot]
execute if block 10 11 -18 red_mushroom_block if block -42 55 -1025 acacia_planks unless block -42 56 -1024 red_bed[facing=south,part=head] run setblock -42 56 -1024 red_bed[facing=south,part=head]


execute if block 10 11 -18 red_mushroom_block unless block -39 57 -1024 player_head run setblock -39 57 -1024 player_head[rotation=15]{Owner: {Id: "a81f6ec7-a7dc-461f-aa99-ce435cfa4d11", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODIyYmEzZGZjYmQ3ZTZhZjg2ZmE1OTRjNTYyNjExMDg1MTJiMDYyNDE0YWY5YTA0ODIzYThkZjRhNWFiOCJ9fX0="}]}}, x: 43, y: 16, z: -41, id: "minecraft:skull"}

execute if block 10 11 -18 red_mushroom_block unless block -38 57 -1032 observer run setblock -38 57 -1032 observer[facing=north]
execute if block 10 11 -18 red_mushroom_block unless block -56 57 -1035 observer run setblock -56 57 -1035 observer[facing=north]

execute if block 10 11 -18 red_mushroom_block if block -49 62 -1041 mycelium unless entity @e[tag=SurvivalMooshroom1] run summon mooshroom -49 63 -1041 {Tags:["SurvivalMooshroom1","SurvivalMob"]}
execute if block 10 11 -18 red_mushroom_block if block -45 63 -1021 mycelium unless entity @e[tag=SurvivalMooshroom2] run summon mooshroom -45 64 -1021 {Tags:["SurvivalMooshroom2","SurvivalMob"]}

execute if block -42 56 -1025 red_bed[facing=south,part=foot] if block -42 56 -1024 red_bed[facing=south,part=head] if block -39 57 -1024 player_head if block -38 57 -1032 observer if block -56 57 -1035 observer if entity @e[tag=SurvivalMooshroom1] if entity @e[tag=SurvivalMooshroom2] run setblock 10 13 -18 red_mushroom_block

kill @e[type=item,nbt={Item:{id:"minecraft:red_bed"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:player_head"}}]

# FOR TESTING
#execute if block -42 56 -1025 red_bed[facing=south,part=foot] if block -42 56 -1024 red_bed[facing=south,part=head] if block -39 57 -1024 player_head if block -38 57 -1032 observer if block -56 57 -1035 observer if entity @e[tag=SurvivalMooshroom1] if entity @e[tag=SurvivalMooshroom2] run say mushroom details changed


