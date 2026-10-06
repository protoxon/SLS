####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# FOR TESTING
#say jungle details not changed


# SETS BED
execute if block 4 13 -18 jungle_wood unless block 63 82 -972 green_bed[facing=south,part=foot] run setblock 63 82 -972 green_bed[facing=south,part=foot]
execute if block 4 13 -18 jungle_wood unless block 63 82 -971 green_bed[facing=south,part=head] run setblock 63 82 -971 green_bed[facing=south,part=head]

execute if block 4 13 -18 jungle_wood unless entity @e[tag=SurvivalOcelot] run summon ocelot 65 83 -974 {PersistenceRequired:1b,Tags:["SurvivalOcelot","SurvivalMob"]}

execute if block 63 82 -972 green_bed[facing=south,part=foot] if block 63 82 -971 green_bed[facing=south,part=head] if entity @e[tag=SurvivalOcelot] run setblock 4 15 -18 jungle_wood

kill @e[type=item,nbt={Item:{id:"minecraft:green_bed"}}]


# FOR TESTING
#execute if block 63 82 -972 green_bed[facing=south,part=foot] if block 63 82 -971 green_bed[facing=south,part=head] if entity @e[tag=SurvivalOcelot] run say jungle details changed