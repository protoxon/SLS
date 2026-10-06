####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar TriviaAccess

execute if entity @e[type=item,nbt={Item:{id:"minecraft:item_frame"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}}]

execute unless entity @e[tag=TriviaBoneFrame] run summon item_frame -24 88 986 {Item:[{id:"minecraft:arrow",Count:1b}],Facing:1b,Invulnerable:1b,Silent:1b,Tags:["TriviaBoneFrame"]}

#execute if entity @a[nbt={SelectedItem:{}] run say OK

#execute if entity @a[nbt={SelectedItem:{id:"minecraft:bone_meal"}},nbt=!{SelectedItem:{id:"minecraft:bone_meal",tag:{CanPlaceOn:["minecraft:acacia_sapling"]}}}] run function d3:hub/access_brown/replace_bone_meal