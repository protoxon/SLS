####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 27 2018 / JULY 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar RedIsland
#scoreboard objectives setdisplay sidebar FinaleSheepTimer
#scoreboard objectives setdisplay sidebar KillFinaleSheep



# CLEANS UP SKULLS FROM BROWN ISLAND
execute if entity @a[nbt={Inventory:[{id:"minecraft:skeleton_skull"}]}] run clear @a skeleton_skull
execute if entity @a[nbt={Inventory:[{id:"minecraft:zombie_head"}]}] run clear @a zombie_head
execute if entity @a[nbt={Inventory:[{id:"minecraft:creeper_head"}]}] run clear @a creeper_head
execute if entity @a[nbt={Inventory:[{id:"minecraft:wither_skeleton_skull"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:wither_skeleton_skull"}]},nbt=!{Inventory:[{id:"minecraft:wither_skeleton_skull",tag:{FinaleSkull:1b}}]}] wither_skeleton_skull


execute if block 2 6 110 clay run scoreboard objectives add RedIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] RedIsland 0

# SETUP
execute if entity @e[scores={RedIsland=0}] run setblock -121 169 4988 air 
execute if entity @e[scores={RedIsland=0}] run setblock -121 169 4974 air
execute if entity @e[scores={RedIsland=0}] run setblock -121 169 4960 air
execute if entity @e[scores={RedIsland=0}] run setblock -107 169 4988 air 
execute if entity @e[scores={RedIsland=0}] run setblock -107 169 4974 air
execute if entity @e[scores={RedIsland=0}] run setblock -107 169 4960 air
execute if entity @e[scores={RedIsland=0}] run setblock -93 169 4988 air 
execute if entity @e[scores={RedIsland=0}] run setblock -93 169 4974 air
execute if entity @e[scores={RedIsland=0}] run setblock -93 169 4960 air

execute if entity @e[scores={RedIsland=0}] if block -121 169 4988 air if block -121 169 4974 air if block -121 169 4960 air if block -107 169 4988 air if block -107 169 4974 air if block -107 169 4960 air if block -93 169 4988 air if block -93 169 4974 air if block -93 169 4960 air run scoreboard players set @e[scores={RedIsland=0}] RedIsland 1


# YELLOW BUTTON
execute if block -116 170 4991 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -116 170 4991 stone_button[powered=true] run setblock -116 170 4991 stone_button[face=wall,facing=west,powered=false]

# ORANGE BUTTON
execute if block -116 170 4974 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -116 170 4974 stone_button[powered=true] run setblock -116 170 4974 stone_button[face=wall,facing=west,powered=false]

# PURPLE BUTTON
execute if block -126 170 4960 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -126 170 4960 stone_button[powered=true] run setblock -126 170 4960 stone_button[face=wall,facing=east,powered=false]

# BROWN BUTTON
execute if block -107 170 4993 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -107 170 4993 stone_button[powered=true] run setblock -107 170 4993 stone_button[face=wall,facing=north,powered=false]

# WHITE BUTTON
execute if block -105 169 4974 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -105 169 4974 stone_button[powered=true] run setblock -105 169 4974 stone_button[face=wall,facing=west,powered=false]

# GREEN BUTTON
execute if block -107 170 4955 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -107 170 4955 stone_button[powered=true] run setblock -107 170 4955 stone_button[face=wall,facing=south,powered=false]

# BLACK BUTTON
execute if block -88 170 4988 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -88 170 4988 stone_button[powered=true] run setblock -88 170 4988 stone_button[face=wall,facing=west,powered=false]

# LIME BUTTON
execute if block -90 170 4969 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -90 170 4969 stone_button[powered=true] run setblock -90 170 4969 stone_button[face=wall,facing=south,powered=false]

# LIGHT_BLUE BUTTON
execute if block -94 170 4955 stone_button[powered=true] run tag @e[tag=MainFinaleAEC] add SpawnFinaleSheep
execute if block -94 170 4955 stone_button[powered=true] run setblock -94 170 4955 stone_button[face=wall,facing=south,powered=false]

#execute if entity @e[tag=SpawnFinaleSheep] unless entity @e[tag=FinaleSheep] run summon sheep -108 169 4945 {NoAI:0b,Leashed:true,Leash:{X:-107,Y:170,Z:4945},Health:1f,Tags:["FinaleSheep"]}

execute unless entity @e[scores={RedIsland=1}] run tag @e[tag=MainFinaleAEC] remove SpawnFinaleSheep

execute if entity @e[tag=SpawnFinaleSheep] run kill @e[tag=FinaleCarpetZombie]
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -125 169 4978 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -117 169 4984 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -106 170 4982 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -96 169 4993 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -88 170 4978 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -112 169 4979 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -103 169 4964 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -89 170 4962 {Tags:["RandomRedFinaleAEC"],Duration:1}
execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -119 170 4955 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -112 169 4946 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -91 169 4949 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -81 169 4981 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -109 169 5001 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -127 174 4994 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -135 169 4961 {Tags:["RandomRedFinaleAEC"],Duration:1}
#execute if entity @e[tag=SpawnFinaleSheep] run summon area_effect_cloud -131 169 4982 {Tags:["RandomRedFinaleAEC"],Duration:1}

execute at @e[tag=RandomRedFinaleAEC] run setblock ~ ~ ~ air

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnWhiteZombie
execute at @e[tag=SpawnWhiteZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16383998}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:16383998}}}],Tags:["WhiteCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnWhiteZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnOrangeZombie
execute at @e[tag=SpawnOrangeZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16351261}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:16351261}}}],Tags:["OrangeCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnOrangeZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnMagentaZombie
#execute at @e[tag=SpawnMagentaZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13061821}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:13061821}}}],Tags:["MagentaCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnMagentaZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnLightBlueZombie
execute at @e[tag=SpawnLightBlueZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3847130}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:3847130}}}],Tags:["LightBlueCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnLightBlueZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnYellowZombie
execute at @e[tag=SpawnYellowZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16701501}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:16701501}}}],Tags:["YellowCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnYellowZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnLimeZombie
execute at @e[tag=SpawnLimeZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8439583}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:8439583}}}],Tags:["LimeCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnLimeZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnPinkZombie
#execute at @e[tag=SpawnPinkZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:15961002}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:15961002}}}],Tags:["PinkCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnPinkZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnGreyZombie
#execute at @e[tag=SpawnGreyZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4673362}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4673362}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4673362}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:4673362}}}],Tags:["GreyCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnGreyZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnLightGreyZombie
#execute at @e[tag=SpawnLightGreyZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:10329495}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:10329495}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:10329495}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:10329495}}}],Tags:["LightGreyCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnLightGreyZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnCyanZombie
#execute at @e[tag=SpawnCyanZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1481884}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:1481884}}}],Tags:["CyanCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnCyanZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnPurpleZombie
execute at @e[tag=SpawnPurpleZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8991416}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:8991416}}}],Tags:["PurpleCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnPurpleZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnBlueZombie
#execute at @e[tag=SpawnBlueZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3949738}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:3949738}}}],Tags:["BlueCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnBlueZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnBrownZombie
execute at @e[tag=SpawnBrownZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8606770}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:8606770}}}],Tags:["BrownCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnBrownZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnGreenZombie
execute at @e[tag=SpawnGreenZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:6192150}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:6192150}}}],Tags:["GreenCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnGreenZombie]

#execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnRedZombie
#execute at @e[tag=SpawnRedZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11546150}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:11546150}}}],Tags:["RedCarpetZombie","FinaleCarpetZombie"]}
#kill @e[tag=SpawnRedZombie]

execute as @e[tag=RandomRedFinaleAEC,limit=1,sort=random] run tag @s add SpawnBlackZombie
execute at @e[tag=SpawnBlackZombie] run summon zombie ~ ~ ~ {Health:0.5f,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1908001}}},{id:"minecraft:stone_button",Count:1b,tag:{display:{color:1908001}}}],Tags:["BlackCarpetZombie","FinaleCarpetZombie"]}
kill @e[tag=SpawnBlackZombie]

tag @e[tag=MainFinaleAEC] remove SpawnFinaleSheep



#execute if entity @e[tag=FinaleSheep] run scoreboard objectives add KillFinaleSheep minecraft.killed:minecraft.sheep
#execute if entity @a[scores={KillFinaleSheep=1..}] run clear @a[scores={KillFinaleSheep=1..}] lead
#execute if entity @a[scores={KillFinaleSheep=1..}] run kill @e[type=item,nbt={Item:{id:"minecraft:lead"}}]
#scoreboard players reset @a[scores={KillFinaleSheep=1..}] KillFinaleSheep
#execute unless entity @e[tag=FinaleSheep] run scoreboard objectives remove KillFinaleSheep


# SHEEP TIMER
execute if entity @e[tag=FinaleSheep] run scoreboard objectives add FinaleSheepTimer dummy
execute unless entity @e[tag=FinaleSheep] run scoreboard objectives remove FinaleSheepTimer
scoreboard players add @e[tag=FinaleSheep] FinaleSheepTimer 1
scoreboard players set @e[scores={FinaleSheepTimer=161..}] FinaleSheepTimer 0
#execute as @e[scores={FinaleSheepTimer=1}] run data merge entity @s {Color:0b}
#execute as @e[scores={FinaleSheepTimer=11}] run data merge entity @s {Color:1b}
#execute as @e[scores={FinaleSheepTimer=21}] run data merge entity @s {Color:2b}
#execute as @e[scores={FinaleSheepTimer=31}] run data merge entity @s {Color:3b}
#execute as @e[scores={FinaleSheepTimer=41}] run data merge entity @s {Color:4b}
#execute as @e[scores={FinaleSheepTimer=51}] run data merge entity @s {Color:5b}
#execute as @e[scores={FinaleSheepTimer=61}] run data merge entity @s {Color:6b}
#execute as @e[scores={FinaleSheepTimer=71}] run data merge entity @s {Color:7b}
#execute as @e[scores={FinaleSheepTimer=81}] run data merge entity @s {Color:8b}
#execute as @e[scores={FinaleSheepTimer=91}] run data merge entity @s {Color:9b}
#execute as @e[scores={FinaleSheepTimer=101}] run data merge entity @s {Color:10b}
#execute as @e[scores={FinaleSheepTimer=111}] run data merge entity @s {Color:11b}
#execute as @e[scores={FinaleSheepTimer=121}] run data merge entity @s {Color:12b}
#execute as @e[scores={FinaleSheepTimer=131}] run data merge entity @s {Color:13b}
#execute as @e[scores={FinaleSheepTimer=141}] run data merge entity @s {Color:14b}
#execute as @e[scores={FinaleSheepTimer=151}] run data merge entity @s {Color:15b}


# SHEEP CARPET
#execute as @e[tag=FinaleSheep,nbt={Color:0b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ white_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:1b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ orange_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:2b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ magenta_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:3b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ light_blue_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:4b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ yellow_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:5b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ lime_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:6b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ pink_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:7b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ gray_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:8b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ light_gray_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:9b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ cyan_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:10b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ purple_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:11b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ blue_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:12b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ brown_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:13b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ green_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:14b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ red_carpet
#execute as @e[tag=FinaleSheep,nbt={Color:15b}] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ black_carpet


# ZOMBIE CARPET
execute as @e[tag=WhiteCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ white_carpet
execute as @e[tag=OrangeCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ orange_carpet
#execute as @e[tag=MagentaCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ magenta_carpet
execute as @e[tag=LightBlueCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ light_blue_carpet
execute as @e[tag=YellowCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ yellow_carpet
execute as @e[tag=LimeCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ lime_carpet
#execute as @e[tag=PinkCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ pink_carpet
#execute as @e[tag=GreyCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ gray_carpet
#execute as @e[tag=LightGreyCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ light_gray_carpet
#execute as @e[tag=CyanCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ cyan_carpet
execute as @e[tag=PurpleCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ purple_carpet
#execute as @e[tag=BlueCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ blue_carpet
execute as @e[tag=BrownCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ brown_carpet
execute as @e[tag=GreenCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ green_carpet
#execute as @e[tag=RedCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ red_carpet
execute as @e[tag=BlackCarpetZombie] at @s if block ~ ~-1 ~ nether_wart_block run setblock ~ ~ ~ black_carpet


execute if entity @e[scores={RedIsland=1}] if block -121 169 4988 yellow_carpet if block -121 169 4974 orange_carpet if block -121 169 4960 purple_carpet if block -107 169 4988 brown_carpet if block -107 169 4974 white_carpet if block -107 169 4960 green_carpet if block -93 169 4988 black_carpet if block -93 169 4974 lime_carpet if block -93 169 4960 light_blue_carpet run kill @e[tag=FinaleCarpetZombie]

execute if entity @e[scores={RedIsland=1}] if block -121 169 4988 yellow_carpet if block -121 169 4974 orange_carpet if block -121 169 4960 purple_carpet if block -107 169 4988 brown_carpet if block -107 169 4974 white_carpet if block -107 169 4960 green_carpet if block -93 169 4988 black_carpet if block -93 169 4974 lime_carpet if block -93 169 4960 light_blue_carpet run scoreboard players set @e[scores={RedIsland=1}] RedIsland 1000


# SET UP FOR WOOL DROP
scoreboard players add @e[scores={RedIsland=1000..}] RedIsland 1


# WOOL DROPS
execute if entity @e[scores={RedIsland=1002}] run setblock 2 6 110 red_wool

execute if entity @e[scores={RedIsland=1002}] run playsound entity.evoker.cast_spell master @a -82 171 4971 2 1 1
execute if entity @e[scores={RedIsland=1002}] run playsound entity.ender_eye.death master @a -82 171 4971 2 0.5 1
execute if entity @e[scores={RedIsland=1002}] run playsound entity.player.levelup master @a -82 171 4971 3 1 1

execute if entity @e[scores={RedIsland=1002}] run kill @e[tag=RandomRedWoolAEC]
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4970 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4971 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -83 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -82 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}
execute if entity @e[scores={RedIsland=1002}] run summon area_effect_cloud -81 171 4972 {Tags:["RandomRedWoolAEC"],Duration:200}

execute if entity @e[scores={RedIsland=1002}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1007}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1012}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1017}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1022}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1027}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1032}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1037}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC
execute if entity @e[scores={RedIsland=1042}] run tag @e[tag=RandomRedWoolAEC,limit=1,sort=random] add ChosenRedWoolAEC

execute if entity @e[scores={RedIsland=1002..}] at @e[tag=ChosenRedWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:red_wool"},Tags:["FinaleWoolFB","RedWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenRedWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={RedIsland=1002..}] if block -83 171 4970 red_wool if block -82 171 4970 red_wool if block -81 171 4970 red_wool if block -83 171 4971 red_wool if block -82 171 4971 red_wool if block -81 171 4971 red_wool if block -83 171 4972 red_wool if block -82 171 4972 red_wool if block -81 171 4972 red_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={RedIsland=1002..}] if block -83 171 4970 red_wool if block -82 171 4970 red_wool if block -81 171 4970 red_wool if block -83 171 4971 red_wool if block -82 171 4971 red_wool if block -81 171 4971 red_wool if block -83 171 4972 red_wool if block -82 171 4972 red_wool if block -81 171 4972 red_wool run scoreboard objectives remove RedIsland

