####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 14 2017 / JULY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar VisitNether

scoreboard objectives add VisitNether dummy
scoreboard players add @e[tag=MainSurvivalAEC] VisitNether 0

# 1.14 Herobrine book upgrade
replaceitem block -1 170 -96 container.4 book{HerobrineBook:1b,display:{Lore:['{"text":"An Impure Beholder ","italic":"true","color":"dark_red"}','{"text":"Brings Forth a Great Evil","italic":"true","color":"dark_red"}'],Name:"{\"text\":\"The Curse of Herobrine\",\"italic\":\"false\"}"}}


execute if entity @e[scores={VisitNether=0}] run setblock -1 62 -100 air replace

execute if entity @e[scores={VisitNether=0}] run kill @e[tag=Survivalqmagnet]
execute if entity @e[scores={VisitNether=0}] run kill @e[tag=SurvivalStand]
execute if entity @e[scores={VisitNether=0}] run kill @e[type=painting,nbt={Dimension:-1},tag=!SurvivalNetherPainting]
execute if entity @e[scores={VisitNether=0}] run kill @e[type=item_frame,nbt={Dimension:-1},tag=!SurvivalNetherFrame]

execute if entity @e[scores={VisitNether=0}] run setblock -16 145 -123 redstone_block
execute if entity @e[scores={VisitNether=0}] run setblock -16 145 -96 redstone_block

# AUTO FIXES FOR 1.13
execute if entity @e[scores={VisitNether=0}] run setblock 6 168 -95 dark_oak_trapdoor[facing=west,half=bottom,open=false]
execute if entity @e[scores={VisitNether=0}] run setblock 6 69 -95 dark_oak_trapdoor[facing=west,half=bottom,open=false]
execute if entity @e[scores={VisitNether=0}] run setblock 3 164 -92 birch_trapdoor[facing=north,half=bottom,open=true]
execute if entity @e[scores={VisitNether=0}] run setblock 3 65 -92 birch_trapdoor[facing=north,half=bottom,open=true]
execute if entity @e[scores={VisitNether=0}] run fill 0 163 -88 0 163 -86 spruce_trapdoor[facing=east,half=bottom]
execute if entity @e[scores={VisitNether=0}] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom]
execute if entity @e[scores={VisitNether=0}] run setblock -1 62 -100 air replace
execute if entity @e[scores={VisitNether=0}] run data merge block 5 160 -106 {Items:[{Slot:0b,id:"minecraft:totem_of_undying",Count: 1b},{Slot:2b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:4b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:6b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name: "{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:8b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},{Slot:9b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_regeneration"}},{Slot:11b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:13b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:15b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:17b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},{Slot:18b,id:"minecraft:shield",Count:1b,tag:{Unbreakable:1b,HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:"ts",Color:11},{Pattern:"bs",Color:11},{Pattern:"mr",Color:15},{Pattern:"ls",Color:11},{Pattern:"rs",Color:11},{Pattern:"br",Color:11},{Pattern:"bo",Color:15}],Base:11},display:{Name:"{\"text\":\"Shield of Q\",\"italic\":\"false\"}"},Damage:0}},{Slot:20b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:22b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:24b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:26b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}}]}

execute if entity @e[scores={VisitNether=0}] run setblock -16 48 -123 structure_block[mode=load]{name:"nether_house_1",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:32,sizeY:32,sizeZ:27,ignoreEntities:1b}
execute if entity @e[scores={VisitNether=0}] run setblock -16 48 -96 structure_block[mode=load]{name:"nether_house_2",mirror:"NONE",powered:0b,author:"qmagnet",rotation:"NONE",mode:"LOAD",posX:0,posY:0,posZ:0,id:"minecraft:structure_block",sizeX:32,sizeY:32,sizeZ:32,ignoreEntities:1b}

execute if entity @e[scores={VisitNether=0}] run setblock -16 49 -123 redstone_block destroy
execute if entity @e[scores={VisitNether=0}] run setblock -16 49 -96 redstone_block destroy
execute if entity @e[scores={VisitNether=0}] run setblock -16 49 -123 air
execute if entity @e[scores={VisitNether=0}] run setblock -16 49 -96 air

execute if entity @e[scores={VisitNether=0}] unless block 5 61 -106 chest run setblock 5 61 -106 chest[facing=west]
execute if entity @e[scores={VisitNether=0}] run data merge block 5 61 -106 {Items:[{Slot:0b,id:"minecraft:totem_of_undying",Count: 1b},{Slot:2b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:4b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:6b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name: "{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:8b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},{Slot:9b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_regeneration"}},{Slot:11b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:13b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:15b,id:"minecraft:bow",Count:1b,tag:{Enchantments:[{id:"minecraft:infinity",lvl:1s},{id:"minecraft:power",lvl:5s}]}},{Slot:17b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},{Slot:18b,id:"minecraft:shield",Count:1b,tag:{Unbreakable:1b,HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:"ts",Color:11},{Pattern:"bs",Color:11},{Pattern:"mr",Color:15},{Pattern:"ls",Color:11},{Pattern:"rs",Color:11},{Pattern:"br",Color:11},{Pattern:"bo",Color:15}],Base:11},display:{Name:"{\"text\":\"Shield of Q\",\"italic\":\"false\"}"},Damage:0}},{Slot:20b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:22b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:24b,id:"minecraft:tipped_arrow",Count:64b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:25,Duration:350}],display:{Name:"{\"text\":\"Arrow of Levitation\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:26b,id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}}]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=SurvivalNetherPainting1] run summon painting 4 66 -99 {Facing:2b,Dimension:-1,Rotation:[180.0f,0.0f],Motive:"minecraft:creebet",TileX:4,TileY:66,TileZ:-99,Tags:["SurvivalNetherPainting1","SurvivalNetherPainting"]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=SurvivalNetherPainting2] run summon painting 3 67 -95 {Facing:0b,Dimension:-1,Rotation:[0.0f,0.0f],Motive:"minecraft:sea",TileX:3,TileY:67,TileZ:-95,Tags:["SurvivalNetherPainting2","SurvivalNetherPainting"]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=SurvivalNetherPainting3] run summon painting 0 67 -93 {Facing:3b,Dimension:-1,Rotation:[270.0f,0.0f],Motive:"minecraft:pool",TileX:0,TileY:67,TileZ:-93,Tags:["SurvivalNetherPainting3","SurvivalNetherPainting"]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=SurvivalNetherPainting4] run summon painting 3 61 -102 {Facing:0b,Dimension:-1,Rotation:[0.0f,0.0f],Motive:"minecraft:wanderer",TileX:3,TileY:61,TileZ:-102,Tags:["SurvivalNetherPainting4","SurvivalNetherPainting"]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=SurvivalNetherFrame,nbt={Item:{id:"minecraft:clock"}}] run summon item_frame 7 61 -100 {Facing:4b,ItemRotation:0b,Dimension:-1,Rotation:[90.0f,0.0f],Item:{id:"minecraft:clock",Count:1b,Damage:0s},TileX:7,TileY:61,TileZ:-100,Tags:["SurvivalNetherFrame"]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=ChainSuit] run summon armor_stand 2 60 -90 {ShowArms:true,Rotation:[180f,0f],Tags:["ChainSuit","SurvivalStand"]}
execute if entity @e[scores={VisitNether=0}] run data merge entity @e[tag=ChainSuit,limit=1] {ArmorItems:[{id:"minecraft:chainmail_boots",Count:1b},{id:"minecraft:chainmail_leggings",Count:1b},{id:"minecraft:chainmail_chestplate",Count:1b},{id:"minecraft:chainmail_helmet",Count:1b}],HandItems:[{id:"minecraft:stone_sword",Count:1b}]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=IronSuit] run summon armor_stand 4 60 -90 {ShowArms:true,Rotation:[180f,0f],Tags:["IronSuit","SurvivalStand"]}
execute if entity @e[scores={VisitNether=0}] run data merge entity @e[tag=IronSuit,limit=1] {ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:iron_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],HandItems:[{id:"minecraft:iron_sword",Count:1b}]}

execute if entity @e[scores={VisitNether=0}] unless entity @e[tag=DiamondSuit] run summon armor_stand 6 60 -90 {ShowArms:true,Rotation:[180f,0f],Tags:["DiamondSuit","SurvivalStand"]}
execute if entity @e[scores={VisitNether=0}] run data merge entity @e[tag=DiamondSuit,limit=1] {ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}],HandItems:[{id:"minecraft:diamond_sword",Count:1b},{}]}

#execute if entity @e[scores={VisitNether=0}] unless block -1 62 -100 dragon_head[rotation=7] run setblock -1 62 -100 dragon_head[rotation=7]
execute if entity @e[scores={VisitNether=0}] run setblock -16 145 -123 redstone_block
execute if entity @e[scores={VisitNether=0}] run setblock -16 145 -96 redstone_block


#execute if entity @e[scores={VisitNether=0}] run say SUCCESS
execute if entity @e[scores={VisitNether=0}] run kill @e[type=item,nbt={Dimension:-1}]

# NEW NETHER FIX
execute if block 6 168 -95 dark_oak_trapdoor[facing=west,half=bottom,open=false] if block 6 69 -95 dark_oak_trapdoor[facing=west,half=bottom,open=false] if block 3 164 -92 birch_trapdoor[facing=north,half=bottom,open=true] if block 3 65 -92 birch_trapdoor[facing=north,half=bottom,open=true] if block 0 163 -88 spruce_trapdoor[facing=east,half=bottom] if block 0 163 -87 spruce_trapdoor[facing=east,half=bottom] if block 0 163 -86 spruce_trapdoor[facing=east,half=bottom] if block 0 64 -88 spruce_trapdoor[facing=east,half=bottom] if block 0 64 -87 spruce_trapdoor[facing=east,half=bottom] if block 0 64 -86 spruce_trapdoor[facing=east,half=bottom] if entity @e[tag=SurvivalNetherPainting1] if entity @e[tag=SurvivalNetherPainting2] if entity @e[tag=SurvivalNetherPainting3] if entity @e[tag=SurvivalNetherPainting4] if entity @e[tag=SurvivalNetherFrame] if entity @e[tag=ChainSuit] if entity @e[tag=IronSuit] if entity @e[tag=DiamondSuit] if block -1 62 -100 dragon_head[rotation=7] run scoreboard players set @e[scores={VisitNether=0}] VisitNether 1


setblock 3 129 -96 redstone_block