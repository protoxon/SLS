####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 24 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# DOWNSTAIRS TV YOUTUBE (SECOND)
execute as @e[tag=SocialMediaTV1] run data merge entity @s {Item:{tag:{map:316}}}
execute as @e[tag=SocialMediaTV2] run data merge entity @s {Item:{tag:{map:317}}}
execute as @e[tag=SocialMediaTV3] run data merge entity @s {Item:{tag:{map:318}}}
execute as @e[tag=SocialMediaTV4] run data merge entity @s {Item:{tag:{map:319}}}
execute as @e[tag=SocialMediaTV5] run data merge entity @s {Item:{tag:{map:320}}}

execute as @e[tag=SocialMediaTV6] run data merge entity @s {Item:{tag:{map:321}}}
execute as @e[tag=SocialMediaTV7] run data merge entity @s {Item:{tag:{map:322}}}
execute as @e[tag=SocialMediaTV8] run data merge entity @s {Item:{tag:{map:323}}}
execute as @e[tag=SocialMediaTV9] run data merge entity @s {Item:{tag:{map:324}}}
execute as @e[tag=SocialMediaTV10] run data merge entity @s {Item:{tag:{map:325}}}

execute as @e[tag=SocialMediaTV11] run data merge entity @s {Item:{tag:{map:326}}}
execute as @e[tag=SocialMediaTV12] run data merge entity @s {Item:{tag:{map:327}}}
execute as @e[tag=SocialMediaTV13] run data merge entity @s {Item:{tag:{map:328}}}
execute as @e[tag=SocialMediaTV14] run data merge entity @s {Item:{tag:{map:329}}}
execute as @e[tag=SocialMediaTV15] run data merge entity @s {Item:{tag:{map:330}}}



# DOWNSTAIRS TV TWITTER (FIRST)
execute unless entity @e[tag=SocialMediaTV1] run summon item_frame -30 44 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:301}},Tags:["SocialMediaTV1","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV2] run summon item_frame -31 44 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:302}},Tags:["SocialMediaTV2","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV3] run summon item_frame -32 44 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:303}},Tags:["SocialMediaTV3","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV4] run summon item_frame -33 44 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:304}},Tags:["SocialMediaTV4","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV5] run summon item_frame -34 44 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:305}},Tags:["SocialMediaTV5","SocialMediaTV"]}

execute unless entity @e[tag=SocialMediaTV6] run summon item_frame -30 43 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:306}},Tags:["SocialMediaTV6","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV7] run summon item_frame -31 43 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:307}},Tags:["SocialMediaTV7","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV8] run summon item_frame -32 43 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:308}},Tags:["SocialMediaTV8","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV9] run summon item_frame -33 43 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:309}},Tags:["SocialMediaTV9","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV10] run summon item_frame -34 43 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:310}},Tags:["SocialMediaTV10","SocialMediaTV"]}

execute unless entity @e[tag=SocialMediaTV11] run summon item_frame -30 42 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:311}},Tags:["SocialMediaTV11","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV12] run summon item_frame -31 42 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:312}},Tags:["SocialMediaTV12","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV13] run summon item_frame -32 42 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:313}},Tags:["SocialMediaTV13","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV14] run summon item_frame -33 42 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:314}},Tags:["SocialMediaTV14","SocialMediaTV"]}
execute unless entity @e[tag=SocialMediaTV15] run summon item_frame -34 42 -2306 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:315}},Tags:["SocialMediaTV15","SocialMediaTV"]}

fill -34 42 -2305 -30 44 -2305 sea_lantern replace black_concrete

setblock -30 42 -2312 stone_button[face=floor,facing=east,powered=false]