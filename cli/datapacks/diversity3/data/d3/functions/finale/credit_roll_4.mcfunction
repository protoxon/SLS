####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# MARCH 11 2019 / JULY 17 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

gamemode spectator @a[tag=CR4,gamemode=!spectator]


execute align x align y align z if entity @a[x=-2534,y=77,z=487,dx=0,dy=2,dz=-100] unless entity @e[tag=CR4_AEC] run summon area_effect_cloud -2534 77 435 {Tags:["CR4_AEC","CR_AEC"],Duration:2147483647}
execute as @e[tag=CR4_AEC] at @s run teleport @s -2534 77.6 ~-0.25 0 0

execute as @a[tag=CR4,scores={CR_TP=0..198}] at @e[tag=CR4_AEC] run teleport @s ~ ~ ~ 0 0
execute if entity @e[scores={CreditPlayers=199..200}] as @a[tag=CR4,scores={CR_TP=2}] at @e[tag=CR4_AEC] run teleport @s ~ ~ ~ 0 0


tag @a[tag=CR4] remove NightVision
execute align x align y align z run tag @a[x=-2590,y=67,z=-127,dx=105,dy=39,dz=80] add NightVision
execute align x align y align z run tag @a[x=-2568,y=50,z=-313,dx=77,dy=62,dz=63] add NightVision
execute align x align y align z run tag @a[x=-2535,y=78,z=-236,dx=2,dy=2,dz=57] add NightVision
effect give @a[tag=NightVision] night_vision 12 255 true
execute if entity @e[scores={CreditRoll=1..}] run effect clear @a[tag=CR4,tag=!NightVision] night_vision

execute align x align y align x if entity @a[x=-2535,y=77,z=328,dx=1,dy=1,dz=1] run scoreboard objectives add CreditRoll dummy

execute if entity @e[tag=CR4_AEC] align x align y align z run kill @e[tag=CR4_AEC,x=-2535,y=77,z=-485,dx=2,dy=2,dz=2]


# RELATIVE AECS
execute if block -2534 76 276 birch_slab unless entity @e[tag=CR4_RelativeArenaAEC] run summon area_effect_cloud -2534 76 276 {Tags:["CR4_RelativeArenaAEC"],Duration:2147483647}
execute if block -2534 76 76 prismarine_bricks unless entity @e[tag=CR4_RelativeEscapeAEC] run summon area_effect_cloud -2534 76 76 {Tags:["CR4_RelativeEscapeAEC"],Duration:2147483647}
execute if block -2534 77 -155 cobblestone_wall unless entity @e[tag=CR4_RelativeSurvivalAEC] run summon area_effect_cloud -2534 77 -155 {Tags:["CR4_RelativeSurvivalAEC"],Duration:2147483647}
execute if block -2534 79 251 green_stained_glass unless entity @e[tag=CR4_TriviaDye] run summon area_effect_cloud -2534 78.80 251 {Duration:2147483647,Tags:["CR4_TriviaAEC"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:lime_dye",Count:1b},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_TriviaDye"]}]}

execute unless entity @e[tag=CR4_TriviaDye] run kill @e[tag=CR4_TriviaAEC]
execute unless entity @e[tag=CR4_TriviaAEC] run kill @e[tag=CR4_TriviaDye]




# CREDIT 4 ARENA ITEMS
execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaGreenItem] run summon area_effect_cloud ~4 ~1.8 ~-2 {Duration:2147483647,Tags:["CR4_ArenaGreenAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:sugar_cane",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaGreenItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaGreenItem] run kill @e[tag=CR4_ArenaGreenAEC]
execute unless entity @e[tag=CR4_ArenaGreenAEC] run kill @e[tag=CR4_ArenaGreenItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaLightBlueItem] run summon area_effect_cloud ~4 ~1.8 ~ {Duration:2147483647,Tags:["CR4_ArenaLightBlueAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:diamond_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaLightBlueItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaLightBlueItem] run kill @e[tag=CR4_ArenaLightBlueAEC]
execute unless entity @e[tag=CR4_ArenaLightBlueAEC] run kill @e[tag=CR4_ArenaLightBlueItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaBrownItem] run summon area_effect_cloud ~4 ~1.8 ~2 {Duration:2147483647,Tags:["CR4_ArenaBrownAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:book",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaBrownItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaBrownItem] run kill @e[tag=CR4_ArenaBrownAEC]
execute unless entity @e[tag=CR4_ArenaBrownAEC] run kill @e[tag=CR4_ArenaBrownItem]


execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaCyanItem] run summon area_effect_cloud ~2 ~1.8 ~4 {Duration:2147483647,Tags:["CR4_ArenaCyanAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:trident",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaCyanItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaCyanItem] run kill @e[tag=CR4_ArenaCyanAEC]
execute unless entity @e[tag=CR4_ArenaCyanAEC] run kill @e[tag=CR4_ArenaCyanItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaRedItem] run summon area_effect_cloud ~ ~1.8 ~4 {Duration:2147483647,Tags:["CR4_ArenaRedAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:diamond_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaRedItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaRedItem] run kill @e[tag=CR4_ArenaRedAEC]
execute unless entity @e[tag=CR4_ArenaRedAEC] run kill @e[tag=CR4_ArenaRedItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaWhiteItem] run summon area_effect_cloud ~-2 ~1.8 ~4 {Duration:2147483647,Tags:["CR4_ArenaWhiteAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:13302779,Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaWhiteItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaWhiteItem] run kill @e[tag=CR4_ArenaWhiteAEC]
execute unless entity @e[tag=CR4_ArenaWhiteAEC] run kill @e[tag=CR4_ArenaWhiteItem]


execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaBlackItem] run summon area_effect_cloud ~-4 ~1.8 ~2 {Duration:2147483647,Tags:["CR4_ArenaBlackAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:turtle_spawn_egg",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaBlackItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaBlackItem] run kill @e[tag=CR4_ArenaBlackAEC]
execute unless entity @e[tag=CR4_ArenaBlackAEC] run kill @e[tag=CR4_ArenaBlackItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless block ~-4 ~1 ~2 dried_kelp_block run setblock ~-4 ~1 ~2 dried_kelp_block

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaLightGreyItem] run summon area_effect_cloud ~-4 ~1.8 ~ {Duration:2147483647,Tags:["CR4_ArenaLightGreyAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:dolphin_spawn_egg",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaLightGreyItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaLightGreyItem] run kill @e[tag=CR4_ArenaLightGreyAEC]
execute unless entity @e[tag=CR4_ArenaLightGreyAEC] run kill @e[tag=CR4_ArenaLightGreyItem]

execute at @e[tag=CR4_RelativeArenaAEC] unless block ~-4 ~1 ~ dead_brain_coral_block run setblock ~-4 ~1 ~ dead_brain_coral_block
execute at @e[tag=CR4_RelativeArenaAEC] run data merge block ~-3 ~1 ~ {Text1:"{\"text\":\"SENTRY\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Defensive turret\",\"color\":\"none\"}",Text4:"{\"text\":\"to join the battle\",\"color\":\"none\"}"}

execute at @e[tag=CR4_RelativeArenaAEC] unless entity @e[tag=CR4_ArenaOrangeItem] run summon area_effect_cloud ~-4 ~1.8 ~-2 {Duration:2147483647,Tags:["CR4_ArenaOrangeAEC","CR4_ArenaEntity"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:egg",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}},Age:-32768s,PickupDelay:32767,NoGravity:1b,Tags:["CR4_ArenaOrangeItem","CR4_ArenaEntity"]}]}
execute unless entity @e[tag=CR4_ArenaOrangeItem] run kill @e[tag=CR4_ArenaOrangeAEC]
execute unless entity @e[tag=CR4_ArenaOrangeAEC] run kill @e[tag=CR4_ArenaOrangeItem]





# CREDIT 4 ESCAPE BLOCKS
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~ ~2 ~20 oak_pressure_plate run setblock ~ ~2 ~20 acacia_pressure_plate
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~ ~1 ~19 oak_button run setblock ~ ~1 ~19 acacia_button[face=wall,facing=north]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~ ~4 ~-15 oak_trapdoor run setblock ~ ~4 ~-15 acacia_trapdoor[facing=south,half=top,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~ ~5 ~-16 oak_trapdoor run setblock ~ ~5 ~-16 acacia_trapdoor[facing=north,half=bottom,open=true]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~ ~5 ~-14 oak_trapdoor run setblock ~ ~5 ~-14 acacia_trapdoor[facing=south,half=bottom,open=true]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-1 ~5 ~-15 oak_trapdoor run setblock ~-1 ~5 ~-15 acacia_trapdoor[facing=west,half=bottom,open=true]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~1 ~5 ~-15 oak_trapdoor run setblock ~1 ~5 ~-15 acacia_trapdoor[facing=east,half=bottom,open=true]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-4 ~-4 ~-16 oak_trapdoor run setblock ~-4 ~-4 ~-16 acacia_trapdoor[facing=north,half=bottom,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-4 ~-4 ~-14 oak_trapdoor run setblock ~-4 ~-4 ~-14 acacia_trapdoor[facing=south,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-1 ~-4 ~-19 oak_trapdoor run setblock ~-1 ~-4 ~-19 acacia_trapdoor[facing=west,half=bottom,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~1 ~-4 ~-19 oak_trapdoor run setblock ~1 ~-4 ~-19 acacia_trapdoor[facing=east,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~4 ~-1 ~-16 oak_trapdoor run setblock ~4 ~-1 ~-16 acacia_trapdoor[facing=north,half=bottom,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~4 ~-1 ~-14 oak_trapdoor run setblock ~4 ~-1 ~-14 acacia_trapdoor[facing=south,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-1 ~ ~-11 oak_trapdoor run setblock ~-1 ~ ~-11 acacia_trapdoor[facing=west,half=bottom,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~1 ~ ~-11 oak_trapdoor run setblock ~1 ~ ~-11 acacia_trapdoor[facing=east,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-11 ~9 ~-11 oak_trapdoor run setblock ~-11 ~9 ~-11 acacia_trapdoor[facing=west,half=top,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-9 ~9 ~-11 oak_trapdoor run setblock ~-9 ~9 ~-11 acacia_trapdoor[facing=east,half=top,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-13 ~13 ~-11 oak_trapdoor run setblock ~-13 ~13 ~-11 acacia_trapdoor[facing=west,half=top,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-11 ~13 ~-11 oak_trapdoor run setblock ~-11 ~13 ~-11 acacia_trapdoor[facing=east,half=top,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-9 ~13 ~-19 oak_trapdoor run setblock ~-9 ~13 ~-19 acacia_trapdoor[facing=west,half=bottom,open=false]
execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-7 ~13 ~-19 oak_trapdoor run setblock ~-7 ~13 ~-19 acacia_trapdoor[facing=east,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] if block ~-12 ~8 ~-15 oak_trapdoor run setblock ~-12 ~8 ~-15 acacia_trapdoor[facing=west,half=bottom,open=false]

execute at @e[tag=CR4_RelativeEscapeAEC] run fill ~-1 ~-9 ~-16 ~1 ~-9 ~-14 acacia_pressure_plate replace oak_pressure_plate
execute at @e[tag=CR4_RelativeEscapeAEC] run fill ~-16 ~4 ~-16 ~-7 ~4 ~-14 acacia_pressure_plate replace oak_pressure_plate



# CREDIT 4 SURVIVAL ITEMS
execute at @e[tag=CR4_RelativeSurvivalAEC] unless entity @e[tag=CR4_SurvivalPainting] run summon painting ~ ~1 ~6 {Invulnerable:1b,Facing:2b,Rotation:[0.0f,0.0f],Motive:"minecraft:wanderer",Tags:["CR4_SurvivalPainting"]}
execute at @e[tag=CR4_RelativeSurvivalAEC] unless entity @e[tag=CR4_SurvivalItemFrame] run summon item_frame ~-4 ~1 ~4 {Invulnerable:1b,Facing:5b,ItemRotation:0b,Item:{id:"minecraft:clock",Count:1b},Tags:["CR4_SurvivalItemFrame"]}

execute at @e[tag=CR4_RelativeSurvivalAEC] unless entity @e[tag=CR4_ChainSuit] run summon armor_stand ~1 ~ ~-6 {ShowArms:true,Rotation:[0f,0f],ArmorItems:[{id:"minecraft:chainmail_boots",Count:1b},{id:"minecraft:chainmail_leggings",Count:1b},{id:"minecraft:chainmail_chestplate",Count:1b},{id:"minecraft:chainmail_helmet",Count:1b}],HandItems:[{id:"minecraft:stone_sword",Count:1b}],Tags:["CR4_ChainSuit"]}

execute at @e[tag=CR4_RelativeSurvivalAEC] unless entity @e[tag=CR4_IronSuit] run summon armor_stand ~-1 ~ ~-6  {ShowArms:true,Rotation:[0f,0f],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:iron_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],HandItems:[{id:"minecraft:iron_sword",Count:1b}],Tags:["CR4_IronSuit"]}

execute at @e[tag=CR4_RelativeSurvivalAEC] unless entity @e[tag=CR4_DiamondSuit] run summon armor_stand ~-3 ~ ~-6  {ShowArms:true,Rotation:[0f,0f],ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}],HandItems:[{id:"minecraft:diamond_sword",Count:1b}],Tags:["CR4_DiamondSuit"]}
