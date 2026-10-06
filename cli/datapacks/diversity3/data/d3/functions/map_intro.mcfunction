####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 13 2018 / OCTOBER 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar IntroCheater
#scoreboard objectives setdisplay sidebar PaperPresent
#scoreboard objectives setdisplay sidebar CheckingCode
#scoreboard objectives setdisplay sidebar D2WoolDemo
#scoreboard objectives setdisplay sidebar D3WoolDemo
#scoreboard objectives setdisplay sidebar D3MapMaker
#scoreboard objectives setdisplay sidebar ActivateBeacons
difficulty easy
effect give @a[tag=!WrongAnswer,nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true


# CAMP SITE
execute unless block 52 18 -2515 campfire[lit=true] run setblock 52 18 -2515 campfire[lit=true]
execute if block 52 18 -2515 campfire unless block 52 17 -2515 hay_block run setblock 52 17 -2515 hay_block

execute if block 56 18 -2510 oak_log unless entity @e[tag=HatchetAS] run summon armor_stand 56.9 18.62 -2509.4 {Rotation:[45f,0f],Invisible:true,Invulnerable:true,Small:false,NoGravity:true,NoBasePlate:true,HandItems:[{id:"minecraft:iron_axe",Count:1b}],Tags:["HatchetAS"],DisabledSlots:2039583,Pose:{RightArm:[30f,0f,0f]}}

execute if block 60 18 -2515 chest unless entity @a[tag=IntroChests] run data merge block 60 18 -2515 {Items: [{Slot: 1b, id: "minecraft:fishing_rod", Count: 1b, tag: {Damage: 0}}, {Slot: 11b, id: "minecraft:fishing_rod", Count: 1b, tag: {Damage: 0}}, {Slot: 13b, id: "minecraft:cooked_cod", Count: 9b}, {Slot: 16b, id: "minecraft:flint_and_steel", Count: 1b, tag: {Damage: 0}}, {Slot: 18b, id: "minecraft:compass", Count: 0b}, {Slot: 24b, id: "minecraft:oak_log", Count: 14b}]}

execute if block 66 18 -2516 chest unless entity @a[tag=IntroChests] run data merge block 66 18 -2516 {Items: [{Slot: 0b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 11546150, Name: "{\"text\":\"Superman T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 1b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 16383998, Name: "{\"text\":\"Dress Shirt\",\"italic\":\"false\"}"}}},{Slot: 2b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3650006, Name: "{\"text\":\"Faded Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 3b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 1481884, Name: "{\"text\":\"Well Worn Jeans\",\"italic\":\"false\"}"}}},{Slot: 4b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {color: 16383998, Name: "{\"text\":\"Sneakers\",\"italic\":\"false\"}"}}},{Slot: 6b, id: "minecraft:lead", Count: 1b},{Slot: 8b, id: "minecraft:writable_book", Count: 1b},{Slot: 9b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 6192150, Name: "{\"text\":\"Green Lantern T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 11b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 12621367, Name: "{\"text\":\"Khaki Pants\",\"italic\":\"false\"}"},}},{Slot: 12b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3949738, Name: "{\"text\":\"Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 13b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {Name: "{\"text\":\"Hiking Boots\",\"italic\":\"false\"}"}}},{Slot: 16b, id: "minecraft:book", Count: 4b},{Slot: 18b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 1908001, Name: "{\"text\":\"Darth Vader T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 20b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3949738, Name: "{\"text\":\"Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 22b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {color: 1908001, Name: "{\"text\":\"Rain Boots\",\"italic\":\"false\"}"}}},{Slot: 26b, id: "minecraft:feather", Count: 1b}]}

execute if block 40 22 -2528 chest unless entity @a[tag=IntroChests] run data merge block 40 22 -2528 {Items: [{Slot: 0b, id: "minecraft:apple", Count: 9b}, {Slot: 1b, id: "minecraft:apple", Count: 4b}, {Slot: 4b, id: "minecraft:cooked_beef", Count: 4b}, {Slot: 5b, id: "minecraft:carrot", Count: 3b}, {Slot: 9b, id: "minecraft:carrot", Count: 3b}, {Slot: 11b, id: "minecraft:cooked_beef", Count: 12b}, {Slot: 13b, id: "minecraft:cookie", Count: 20b}, {Slot: 17b, id: "minecraft:cooked_beef", Count: 6b}, {Slot: 25b, id: "minecraft:bread", Count: 11b}]}

execute if block 60 18 -2515 chest if block 66 18 -2516 chest if block 40 22 -2528 chest run tag @a add IntroChests



# F3+A TIP AEC
execute if block 20 15 -2412 grass_path unless entity @e[tag=F3AAEC1] run summon area_effect_cloud 20 16.65 -2412 {Tags:["F3AAEC1","F3AAEC"],Duration:2147483647,CustomName:"{\"text\":\"IMPORTANT: F3+A fixes frame\",\"color\":\"white\"}",CustomNameVisible:true}
execute if block 20 15 -2412 grass_path unless entity @e[tag=F3AAEC2] run summon area_effect_cloud 20 16.4 -2412 {Tags:["F3AAEC2","F3AAEC"],Duration:2147483647,CustomName:"{\"text\":\"rate issues and invisible chunks\",\"color\":\"white\"}",CustomNameVisible:true}



# FRONT DOOR
execute align x align y align z run spawnpoint @a[x=-32,y=41,z=-2333,dx=2,dy=1,dz=0] -31 41 -2331

execute unless block -32 41 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 41 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 41 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 41 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 41 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 41 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 42 -2334 spruce_door[facing=east,half=lower,hinge=right,open=false] run setblock -32 42 -2334 spruce_door[facing=east,half=lower,hinge=right,open=false]
execute unless block -32 42 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 42 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 42 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 42 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 43 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 43 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 43 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 43 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 43 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 43 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 44 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 44 -2334 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 44 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 44 -2333 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 44 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 44 -2332 spruce_door[facing=east,half=upper,hinge=right,open=false]


# PATIO DOOR
execute unless block -32 50 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 50 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 50 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 50 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 50 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 50 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 51 -2329 spruce_door[facing=east,half=lower,hinge=right,open=false] run setblock -32 51 -2329 spruce_door[facing=east,half=lower,hinge=right,open=false]
execute unless block -32 51 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 51 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 51 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 51 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 52 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 52 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 52 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 52 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 52 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 52 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false]

execute unless block -32 53 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 53 -2329 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 53 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 53 -2328 spruce_door[facing=east,half=upper,hinge=right,open=false]
execute unless block -32 53 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false] run setblock -32 53 -2327 spruce_door[facing=east,half=upper,hinge=right,open=false]


# ART WALL
execute if block -49 45 -2319 sea_lantern unless entity @e[tag=WallArt1A] run summon item_frame -48 45 -2319 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 41}}, Tags:["WallArt1A","WallArt"]}
execute if block -49 45 -2320 sea_lantern unless entity @e[tag=WallArt1B] run summon item_frame -48 45 -2320 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 42}}, Tags:["WallArt1B","WallArt"]}
execute if block -49 45 -2321 sea_lantern unless entity @e[tag=WallArt1C] run summon item_frame -48 45 -2321 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 43}}, Tags:["WallArt1C","WallArt"]}
execute if block -49 45 -2322 sea_lantern unless entity @e[tag=WallArt1D] run summon item_frame -48 45 -2322 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 44}}, Tags:["WallArt1D","WallArt"]}
execute if block -49 45 -2323 sea_lantern unless entity @e[tag=WallArt1E] run summon item_frame -48 45 -2323 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 45}}, Tags:["WallArt1E","WallArt"]}
execute if block -49 44 -2319 sea_lantern unless entity @e[tag=WallArt1F] run summon item_frame -48 44 -2319 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 46}}, Tags:["WallArt1F","WallArt"]}
execute if block -49 44 -2320 sea_lantern unless entity @e[tag=WallArt1G] run summon item_frame -48 44 -2320 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 47}}, Tags:["WallArt1G","WallArt"]}
execute if block -49 44 -2321 sea_lantern unless entity @e[tag=WallArt1H] run summon item_frame -48 44 -2321 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 48}}, Tags:["WallArt1H","WallArt"]}
execute if block -49 44 -2322 sea_lantern unless entity @e[tag=WallArt1I] run summon item_frame -48 44 -2322 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 49}}, Tags:["WallArt1I","WallArt"]}
execute if block -49 44 -2323 sea_lantern unless entity @e[tag=WallArt1J] run summon item_frame -48 44 -2323 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 50}}, Tags:["WallArt1J","WallArt"]}
execute if block -49 43 -2319 sea_lantern unless entity @e[tag=WallArt1K] run summon item_frame -48 43 -2319 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 51}}, Tags:["WallArt1K","WallArt"]}
execute if block -49 43 -2320 sea_lantern unless entity @e[tag=WallArt1L] run summon item_frame -48 43 -2320 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 52}}, Tags:["WallArt1L","WallArt"]}
execute if block -49 43 -2321 sea_lantern unless entity @e[tag=WallArt1M] run summon item_frame -48 43 -2321 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 53}}, Tags:["WallArt1M","WallArt"]}
execute if block -49 43 -2322 sea_lantern unless entity @e[tag=WallArt1N] run summon item_frame -48 43 -2322 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 54}}, Tags:["WallArt1N","WallArt"]}
execute if block -49 43 -2323 sea_lantern unless entity @e[tag=WallArt1O] run summon item_frame -48 43 -2323 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 55}}, Tags:["WallArt1O","WallArt"]}
execute if block -49 42 -2319 sea_lantern unless entity @e[tag=WallArt1P] run summon item_frame -48 42 -2319 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 56}}, Tags:["WallArt1P","WallArt"]}
execute if block -49 42 -2320 sea_lantern unless entity @e[tag=WallArt1Q] run summon item_frame -48 42 -2320 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 57}}, Tags:["WallArt1Q","WallArt"]}
execute if block -49 42 -2321 sea_lantern unless entity @e[tag=WallArt1R] run summon item_frame -48 42 -2321 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 58}}, Tags:["WallArt1R","WallArt"]}
execute if block -49 42 -2322 sea_lantern unless entity @e[tag=WallArt1S] run summon item_frame -48 42 -2322 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 59}}, Tags:["WallArt1S","WallArt"]}
execute if block -49 42 -2323 sea_lantern unless entity @e[tag=WallArt1T] run summon item_frame -48 42 -2323 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 60}}, Tags:["WallArt1T","WallArt"]}

execute if block -48 41 -2321 brown_glazed_terracotta unless entity @e[tag=WallArt1Sign] run summon item_frame -48 42 -2321 {Facing: 1b, Silent:true, ItemRotation: 3b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 101}}, Tags:["WallArt1Sign","WallArtSign"]}

execute if block -49 45 -2325 sea_lantern unless entity @e[tag=WallArt2A] run summon item_frame -48 45 -2325 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 61}}, Tags:["WallArt2A","WallArt"]}
execute if block -49 45 -2326 sea_lantern unless entity @e[tag=WallArt2B] run summon item_frame -48 45 -2326 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 62}}, Tags:["WallArt2B","WallArt"]}
execute if block -49 45 -2327 sea_lantern unless entity @e[tag=WallArt2C] run summon item_frame -48 45 -2327 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 63}}, Tags:["WallArt2C","WallArt"]}
execute if block -49 45 -2328 sea_lantern unless entity @e[tag=WallArt2D] run summon item_frame -48 45 -2328 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 64}}, Tags:["WallArt2D","WallArt"]}
execute if block -49 45 -2329 sea_lantern unless entity @e[tag=WallArt2E] run summon item_frame -48 45 -2329 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 65}}, Tags:["WallArt2E","WallArt"]}
execute if block -49 44 -2325 sea_lantern unless entity @e[tag=WallArt2F] run summon item_frame -48 44 -2325 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 66}}, Tags:["WallArt2F","WallArt"]}
execute if block -49 44 -2326 sea_lantern unless entity @e[tag=WallArt2G] run summon item_frame -48 44 -2326 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 67}}, Tags:["WallArt2G","WallArt"]}
execute if block -49 44 -2327 sea_lantern unless entity @e[tag=WallArt2H] run summon item_frame -48 44 -2327 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 68}}, Tags:["WallArt2H","WallArt"]}
execute if block -49 44 -2328 sea_lantern unless entity @e[tag=WallArt2I] run summon item_frame -48 44 -2328 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 69}}, Tags:["WallArt2I","WallArt"]}
execute if block -49 44 -2329 sea_lantern unless entity @e[tag=WallArt2J] run summon item_frame -48 44 -2329 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 70}}, Tags:["WallArt2J","WallArt"]}
execute if block -49 43 -2325 sea_lantern unless entity @e[tag=WallArt2K] run summon item_frame -48 43 -2325 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 71}}, Tags:["WallArt2K","WallArt"]}
execute if block -49 43 -2326 sea_lantern unless entity @e[tag=WallArt2L] run summon item_frame -48 43 -2326 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 72}}, Tags:["WallArt2L","WallArt"]}
execute if block -49 43 -2327 sea_lantern unless entity @e[tag=WallArt2M] run summon item_frame -48 43 -2327 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 73}}, Tags:["WallArt2M","WallArt"]}
execute if block -49 43 -2328 sea_lantern unless entity @e[tag=WallArt2N] run summon item_frame -48 43 -2328 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 74}}, Tags:["WallArt2N","WallArt"]}
execute if block -49 43 -2329 sea_lantern unless entity @e[tag=WallArt2O] run summon item_frame -48 43 -2329 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 75}}, Tags:["WallArt2O","WallArt"]}
execute if block -49 42 -2325 sea_lantern unless entity @e[tag=WallArt2P] run summon item_frame -48 42 -2325 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 76}}, Tags:["WallArt2P","WallArt"]}
execute if block -49 42 -2326 sea_lantern unless entity @e[tag=WallArt2Q] run summon item_frame -48 42 -2326 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 77}}, Tags:["WallArt2Q","WallArt"]}
execute if block -49 42 -2327 sea_lantern unless entity @e[tag=WallArt2R] run summon item_frame -48 42 -2327 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 78}}, Tags:["WallArt2R","WallArt"]}
execute if block -49 42 -2328 sea_lantern unless entity @e[tag=WallArt2S] run summon item_frame -48 42 -2328 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 79}}, Tags:["WallArt2S","WallArt"]}
execute if block -49 42 -2329 sea_lantern unless entity @e[tag=WallArt2T] run summon item_frame -48 42 -2329 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 80}}, Tags:["WallArt2T","WallArt"]}

execute if block -48 41 -2327 gray_glazed_terracotta unless entity @e[tag=WallArt2Sign] run summon item_frame -48 42 -2327 {Facing: 1b, Silent:true, ItemRotation: 3b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 102}}, Tags:["WallArt2Sign","WallArtSign"]}

execute if block -49 45 -2331 sea_lantern unless entity @e[tag=WallArt3A] run summon item_frame -48 45 -2331 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 81}}, Tags:["WallArt3A","WallArt"]}
execute if block -49 45 -2332 sea_lantern unless entity @e[tag=WallArt3B] run summon item_frame -48 45 -2332 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 82}}, Tags:["WallArt3B","WallArt"]}
execute if block -49 45 -2333 sea_lantern unless entity @e[tag=WallArt3C] run summon item_frame -48 45 -2333 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 83}}, Tags:["WallArt3C","WallArt"]}
execute if block -49 45 -2334 sea_lantern unless entity @e[tag=WallArt3D] run summon item_frame -48 45 -2334 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 84}}, Tags:["WallArt3D","WallArt"]}
execute if block -49 45 -2335 sea_lantern unless entity @e[tag=WallArt3E] run summon item_frame -48 45 -2335 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 85}}, Tags:["WallArt3E","WallArt"]}
execute if block -49 44 -2331 sea_lantern unless entity @e[tag=WallArt3F] run summon item_frame -48 44 -2331 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 86}}, Tags:["WallArt3F","WallArt"]}
execute if block -49 44 -2332 sea_lantern unless entity @e[tag=WallArt3G] run summon item_frame -48 44 -2332 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 87}}, Tags:["WallArt3G","WallArt"]}
execute if block -49 44 -2333 sea_lantern unless entity @e[tag=WallArt3H] run summon item_frame -48 44 -2333 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 88}}, Tags:["WallArt3H","WallArt"]}
execute if block -49 44 -2334 sea_lantern unless entity @e[tag=WallArt3I] run summon item_frame -48 44 -2334 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 89}}, Tags:["WallArt3I","WallArt"]}
execute if block -49 44 -2335 sea_lantern unless entity @e[tag=WallArt3J] run summon item_frame -48 44 -2335 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 90}}, Tags:["WallArt3J","WallArt"]}
execute if block -49 43 -2331 sea_lantern unless entity @e[tag=WallArt3K] run summon item_frame -48 43 -2331 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 91}}, Tags:["WallArt3K","WallArt"]}
execute if block -49 43 -2332 sea_lantern unless entity @e[tag=WallArt3L] run summon item_frame -48 43 -2332 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 92}}, Tags:["WallArt3L","WallArt"]}
execute if block -49 43 -2333 sea_lantern unless entity @e[tag=WallArt3M] run summon item_frame -48 43 -2333 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 93}}, Tags:["WallArt3M","WallArt"]}
execute if block -49 43 -2334 sea_lantern unless entity @e[tag=WallArt3N] run summon item_frame -48 43 -2334 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 94}}, Tags:["WallArt3N","WallArt"]}
execute if block -49 43 -2335 sea_lantern unless entity @e[tag=WallArt3O] run summon item_frame -48 43 -2335 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 95}}, Tags:["WallArt3O","WallArt"]}
execute if block -49 42 -2331 sea_lantern unless entity @e[tag=WallArt3P] run summon item_frame -48 42 -2331 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 96}}, Tags:["WallArt3P","WallArt"]}
execute if block -49 42 -2332 sea_lantern unless entity @e[tag=WallArt3Q] run summon item_frame -48 42 -2332 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 97}}, Tags:["WallArt3Q","WallArt"]}
execute if block -49 42 -2333 sea_lantern unless entity @e[tag=WallArt3R] run summon item_frame -48 42 -2333 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 98}}, Tags:["WallArt3R","WallArt"]}
execute if block -49 42 -2334 sea_lantern unless entity @e[tag=WallArt3S] run summon item_frame -48 42 -2334 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 99}}, Tags:["WallArt3S","WallArt"]}
execute if block -49 42 -2335 sea_lantern unless entity @e[tag=WallArt3T] run summon item_frame -48 42 -2335 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 100}}, Tags:["WallArt3T","WallArt"]}

execute if block -48 41 -2333 white_glazed_terracotta unless entity @e[tag=WallArt3Sign] run summon item_frame -48 42 -2333 {Facing: 1b, Silent:true, ItemRotation: 3b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 103}}, Tags:["WallArt3Sign","WallArtSign"]}

execute if entity @e[tag=WallArt,nbt=!{ItemRotation:0b}] as @e[tag=WallArt] run data merge entity @s {ItemRotation:0b}
execute if entity @e[tag=WallArtSign,nbt=!{ItemRotation:3b}] as @e[tag=WallArtSign] run data merge entity @s {ItemRotation:3b}


# DISPLAY CASE
execute if block -42 41 -2332 smooth_stone unless entity @e[tag=WeaponDisplay1] run summon armor_stand -42.1 40.62 -2330.3 {Rotation:[90f,0f],Invisible:true,Invulnerable:true,Small:false,NoGravity:true,NoBasePlate:true,HandItems:[{id:"minecraft:golden_sword",Count:1b}],Tags:["WeaponDisplay1"],DisabledSlots:2039583,Pose:{RightArm:[90f,0f,90f]}}


# DOWNSTAIRS DRAWERS
execute unless block -28 42 -2325 light_blue_stained_glass_pane[east=false] run setblock -28 42 -2325 light_blue_stained_glass_pane[east=false]
execute unless block -28 43 -2325 frosted_ice[age=3] run setblock -28 43 -2325 frosted_ice[age=3]

execute if block -28 41 -2323 quartz_block unless entity @e[tag=LivingRoomDrawerA] run summon item_frame -29 41 -2327 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["LivingRoomDrawerA","LivingRoomDrawer"]}
execute if block -28 41 -2323 quartz_block unless entity @e[tag=LivingRoomDrawerB] run summon item_frame -29 41 -2326 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["LivingRoomDrawerB","LivingRoomDrawer"]}
execute if block -28 41 -2323 quartz_block unless entity @e[tag=LivingRoomDrawerC] run summon item_frame -29 41 -2325 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["LivingRoomDrawerC","LivingRoomDrawer"]}
execute if block -28 41 -2323 quartz_block unless entity @e[tag=LivingRoomDrawerD] run summon item_frame -29 41 -2324 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["LivingRoomDrawerD","LivingRoomDrawer"]}
execute if block -28 41 -2323 quartz_block unless entity @e[tag=LivingRoomDrawerE] run summon item_frame -29 41 -2323 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["LivingRoomDrawerE","LivingRoomDrawer"]}

execute if entity @e[tag=LivingRoomDrawer,nbt=!{ItemRotation:0b}] as @e[tag=LivingRoomDrawer] run data merge entity @s {ItemRotation:0b}


# COFFEE TABLE
fill -33 42 -2309 -31 42 -2308 spruce_trapdoor[facing=north,half=bottom,open=false] replace light_gray_carpet
execute unless block -34 40 -2310 stripped_oak_log run fill -34 40 -2310 -30 40 -2307 stripped_oak_log[axis=x]


# DOWNSTAIRS TV MECHANIC
execute if block -30 42 -2312 stone_button[facing=north] run setblock -30 42 -2312 stone_button[face=floor,facing=east,powered=false]
execute if block -30 42 -2312 stone_button[facing=south] run setblock -30 42 -2312 stone_button[face=floor,facing=east,powered=false]
execute if block -30 42 -2312 stone_button[powered=true] unless entity @e[tag=SocialMediaTV,nbt={Item:{tag:{map:316}}}] run function d3:map_intro_social_media
execute if block -30 42 -2312 stone_button[powered=true] if entity @e[tag=SocialMediaTV,nbt={Item:{tag:{map:316}}}] run fill -34 42 -2305 -30 44 -2305 black_concrete
execute if block -30 42 -2312 stone_button[powered=true] if entity @e[tag=SocialMediaTV,nbt={Item:{tag:{map:316}}}] run kill @e[tag=SocialMediaTV]
execute if block -30 42 -2312 stone_button[powered=true] run setblock -30 42 -2312 stone_button[face=floor,facing=east,powered=false]
execute if entity @e[tag=SocialMediaTV,nbt=!{ItemRotation:0b}] as @e[tag=SocialMediaTV] run data merge entity @s {ItemRotation:0b}


# COMPLEX PC
execute if block -22 42 -2308 stone_brick_stairs unless entity @e[tag=ComplexMap] run summon item_frame -22 42 -2309 {Facing: 2b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 15}}, Tags:["ComplexMap"]}
execute if entity @e[tag=ComplexMap,nbt=!{ItemRotation:0b}] run data merge entity @e[tag=ComplexMap,limit=1] {ItemRotation:0b}
execute unless block -23 42 -2309 stone_button[facing=east] run setblock -23 42 -2309 stone_button[facing=east,face=floor]


# COMPLEX DRAWERS
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerA] run summon item_frame -22 43 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerA","ComplexDrawer"]}
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerB] run summon item_frame -21 43 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerB","ComplexDrawer"]}
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerC] run summon item_frame -22 42 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerC","ComplexDrawer"]}
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerD] run summon item_frame -21 42 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerD","ComplexDrawer"]}
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerE] run summon item_frame -22 41 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerE","ComplexDrawer"]}
execute if block -22 43 -2315 quartz_block unless entity @e[tag=ComplexDrawerF] run summon item_frame -21 41 -2314 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Tags:["ComplexDrawerF","ComplexDrawer"]}

execute if entity @e[tag=ComplexDrawer,nbt=!{ItemRotation:0b}] as @e[tag=ComplexDrawer] run data merge entity @s {ItemRotation:0b}


# BEDROOM 1.13 SWAP
fill -47 41 -2310 -45 41 -2310 dark_oak_trapdoor[facing=north,half=top,open=true] replace oak_trapdoor
fill -44 41 -2309 -44 41 -2306 dark_oak_trapdoor[facing=east,half=top,open=true] replace oak_trapdoor


# BATHROOM
execute unless entity @a[tag=Mirror1] align x align y align z run tag @a[tag=!Mirror1,tag=!Mirror2,tag=!Mirror3,tag=!Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] add Mirror1
execute unless entity @a[tag=Mirror2] align x align y align z run tag @a[tag=!Mirror1,tag=!Mirror2,tag=!Mirror3,tag=!Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] add Mirror2
execute unless entity @a[tag=Mirror3] align x align y align z run tag @a[tag=!Mirror1,tag=!Mirror2,tag=!Mirror3,tag=!Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] add Mirror3
execute unless entity @a[tag=Mirror4] align x align y align z run tag @a[tag=!Mirror1,tag=!Mirror2,tag=!Mirror3,tag=!Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] add Mirror4

execute align x align y align z unless entity @a[tag=Mirror1,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] run teleport @e[tag=MirrorMob1] 0 0 0
execute align x align y align z unless entity @a[tag=Mirror2,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] run teleport @e[tag=MirrorMob2] 0 0 0
execute align x align y align z unless entity @a[tag=Mirror3,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] run teleport @e[tag=MirrorMob3] 0 0 0
execute align x align y align z unless entity @a[tag=Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] run teleport @e[tag=MirrorMob4] 0 0 0

execute align x align y align z if entity @e[tag=MirrorMob,x=-1,y=0,z=-1,dx=2,dy=1,dz=2] run kill @e[tag=MirrorMob,x=-1,y=0,z=-1,dx=2,dy=1,dz=2]

execute align x align y align z if entity @a[tag=Mirror1,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] unless entity @e[tag=MirrorMob1] run summon zombie -49 50 -2330.0 {NoAI:true,Silent:true,Invulnerable:true,Tags:["MirrorMob1","MirrorMob"]}
execute align x align y align z if entity @a[tag=Mirror2,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] unless entity @e[tag=MirrorMob2] run summon skeleton -49 50 -2330.0 {NoAI:true,Silent:true,Invulnerable:true,Tags:["MirrorMob2","MirrorMob"]}
execute align x align y align z if entity @a[tag=Mirror3,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] unless entity @e[tag=MirrorMob3] run summon creeper -49 50 -2330.0 {NoAI:true,Silent:true,Invulnerable:true,Tags:["MirrorMob3","MirrorMob"]}
execute align x align y align z if entity @a[tag=Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] unless entity @e[tag=MirrorMob4] run summon wither_skeleton -49 50 -2330.0 {NoAI:true,Silent:true,Invulnerable:true,Tags:["MirrorMob4","MirrorMob"]}

execute if block -57 51 -2320 lever[powered=true] unless block -57 51 -2338 lever[face=wall,facing=east,powered=true] run setblock -57 51 -2338 lever[face=wall,facing=east,powered=true]
execute if block -57 51 -2320 lever[powered=false] unless block -57 51 -2338 lever[face=wall,facing=east,powered=false] run setblock -57 51 -2338 lever[face=wall,facing=east,powered=false]

execute if block -60 55 -2319 lever[powered=true] unless block -60 55 -2339 lever[face=wall,facing=south,powered=true] run setblock -60 55 -2339 lever[face=wall,facing=south,powered=true]
execute if block -60 55 -2319 lever[powered=false] unless block -60 55 -2339 lever[face=wall,facing=south,powered=false] run setblock -60 55 -2339 lever[face=wall,facing=south,powered=false]


execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2328,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2330
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2327,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2331
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2326,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2332
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2325,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2333
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2324,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2334
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2323,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2335
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2322,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2336
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2321,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2337
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2320,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2338
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror1,x=-62,y=50,z=-2319,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2339

execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2328,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2330
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2327,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2331
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2326,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2332
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2325,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2333
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2324,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2334
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2323,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2335
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2322,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2336
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2321,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2337
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2320,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2338
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror2,x=-62,y=50,z=-2319,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2339

execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2328,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2330
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2327,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2331
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2326,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2332
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2325,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2333
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2324,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2334
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2323,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2335
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2322,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2336
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2321,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2337
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2320,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2338
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror3,x=-62,y=50,z=-2319,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2339

execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2328,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2330
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2327,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2331
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2326,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2332
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2325,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2333
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2324,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2334
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2323,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2335
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2322,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2336
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2321,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2337
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2320,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2338
execute align x align y align z if entity @a[x=-62,y=50,z=-2328,dx=13,dy=6,dz=9] align x align y align z as @a[tag=Mirror4,x=-62,y=50,z=-2319,dx=13,dy=6,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2339

execute align x align y align z if entity @a[x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] align x align y align z as @a[tag=Mirror1,x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] at @s run teleport @e[tag=MirrorMob1] ~ ~ -2329.1
execute align x align y align z if entity @a[x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] align x align y align z as @a[tag=Mirror2,x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] at @s run teleport @e[tag=MirrorMob2] ~ ~ -2329.1
execute align x align y align z if entity @a[x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] align x align y align z as @a[tag=Mirror3,x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] at @s run teleport @e[tag=MirrorMob3] ~ ~ -2329.1
execute align x align y align z if entity @a[x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] align x align y align z as @a[tag=Mirror4,x=-56,y=51,z=-2329,dx=2,dy=1,dz=0] at @s run teleport @e[tag=MirrorMob4] ~ ~ -2329.1


# KITCHEN 1.13 SWAP
fill -36 57 -2305 -28 57 -2305 spruce_trapdoor[facing=north,half=bottom,open=true] replace oak_trapdoor
fill -49 52 -2328 -48 52 -2328 birch_trapdoor[open=true,half=top,facing=south] replace oak_trapdoor
fill -42 50 -2315 -42 51 -2309 spruce_trapdoor[open=true,half=bottom,facing=east] replace oak_trapdoor
fill -48 50 -2315 -48 51 -2309 spruce_trapdoor[open=true,half=bottom,facing=west] replace oak_trapdoor
fill -45 50 -2319 -45 51 -2319 spruce_trapdoor[open=true,half=bottom,facing=north] replace oak_trapdoor
fill -45 50 -2305 -45 51 -2305 spruce_trapdoor[open=true,half=bottom,facing=south] replace oak_trapdoor
fill -35 52 -2314 -34 52 -2314 acacia_trapdoor[half=top,open=true,facing=south] replace oak_trapdoor


# DIVERSITY PC
execute if block -38 42 -2307 light_blue_terracotta unless entity @e[tag=DiversityMap] run summon item_frame -39 42 -2307 {Facing: 4b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 16}}, Tags:["DiversityMap"]}
execute if entity @e[tag=DiversityMap,nbt=!{ItemRotation:0b}] run data merge entity @e[tag=DiversityMap,limit=1] {ItemRotation:0b}


# DIVERSITY 2 PC
execute if block -47 71 -2321 quartz_stairs unless entity @e[tag=Diversity2Map] run summon item_frame -46 71 -2321 {Facing: 5b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 17}}, Tags:["Diversity2Map"]}
execute if entity @e[tag=Diversity2Map,nbt=!{ItemRotation:0b}] run data merge entity @e[tag=Diversity2Map,limit=1] {ItemRotation:0b}


# ATTIC 1.13 SWAP
fill -40 70 -2309 -40 70 -2307 spruce_trapdoor[facing=east,half=top,open=true] replace oak_trapdoor
fill -46 70 -2309 -46 70 -2307 spruce_trapdoor[facing=west,half=top,open=true] replace oak_trapdoor
fill -47 80 -2324 -47 82 -2306 dark_oak_trapdoor[facing=east,half=bottom,open=true] replace air
fill -46 80 -2325 -40 82 -2325 dark_oak_trapdoor[facing=south,half=bottom,open=true] replace air


# BOOKSHELF HINT
execute if block -40 88 -2326 quartz_stairs unless entity @a[tag=ResetBookshelfHint] unless entity @e[tag=BookshelfBook] run summon armor_stand -39.45 88.20 -2325.23 {Invisible:1b,ShowArms:1b,NoGravity:1b,HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"extra\":[{\"bold\":true,\"text\":\"finished...\"},{\"strikethrough\":true,\"text\":\"\\n\\ngiant spruce door\\n\"},{\"strikethrough\":true,\"text\":\"tv remote\\n\"},{\"strikethrough\":true,\"text\":\"pun art\\n\"},{\"strikethrough\":true,\"text\":\"golden sword display\\n\"},{\"strikethrough\":true,\"text\":\"console nostalgia\\n\"},{\"strikethrough\":true,\"text\":\"hide lighting\\n\"},{\"strikethrough\":false,\"text\":\"bookshelf access\\n\"},{\"strikethrough\":true,\"text\":\"bathroom reflection\\n\"},{\"strikethrough\":true,\"text\":\"hint for oblivious\\n\"},{\"strikethrough\":true,\"text\":\"telescope\\n\"},{\"strikethrough\":true,\"text\":\"pointless lever\"}],\"text\":\"\"}"],author:"qmagnet",title:"concepts"}}],Rotation:[225f,0f],Pose:{RightArm:[180f,270f,180f]},Tags:["BookshelfBook"],Invulnerable:1b,DisabledSlots:1973790}
execute if entity @e[tag=BookshelfBook] run tag @a add ResetBookshelfHint
execute if entity @e[tag=BookshelfBook] unless entity @e[tag=BookshelfBook,nbt={HandItems:[{id:"minecraft:written_book"}]}] run kill @e[tag=BookshelfBook]


# WHITE BOARD
execute if block -70 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap1] run summon item_frame -70 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 21}}, Tags:["WhiteBoardMap","WhiteBoardMap1"]}
execute if block -69 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap2] run summon item_frame -69 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 22}}, Tags:["WhiteBoardMap","WhiteBoardMap2"]}
execute if block -68 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap3] run summon item_frame -68 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 23}}, Tags:["WhiteBoardMap","WhiteBoardMap3"]}
execute if block -67 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap4] run summon item_frame -67 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 24}}, Tags:["WhiteBoardMap","WhiteBoardMap4"]}
execute if block -66 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap5] run summon item_frame -66 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 25}}, Tags:["WhiteBoardMap","WhiteBoardMap5"]}
execute if block -65 53 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap6] run summon item_frame -65 53 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 26}}, Tags:["WhiteBoardMap","WhiteBoardMap6"]}

execute if block -70 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap7] run summon item_frame -70 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 27}}, Tags:["WhiteBoardMap","WhiteBoardMap7"]}
execute if block -69 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap8] run summon item_frame -69 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 28}}, Tags:["WhiteBoardMap","WhiteBoardMap8"]}
execute if block -68 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap9] run summon item_frame -68 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 29}}, Tags:["WhiteBoardMap","WhiteBoardMap9"]}
execute if block -67 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap10] run summon item_frame -67 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 30}}, Tags:["WhiteBoardMap","WhiteBoardMap10"]}
execute if block -66 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap11] run summon item_frame -66 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 31}}, Tags:["WhiteBoardMap","WhiteBoardMap11"]}
execute if block -65 52 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap12] run summon item_frame -65 52 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 32}}, Tags:["WhiteBoardMap","WhiteBoardMap12"]}

execute if block -70 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap13] run summon item_frame -70 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 33}}, Tags:["WhiteBoardMap","WhiteBoardMap13"]}
execute if block -69 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap14] run summon item_frame -69 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 34}}, Tags:["WhiteBoardMap","WhiteBoardMap14"]}
execute if block -68 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap15] run summon item_frame -68 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 35}}, Tags:["WhiteBoardMap","WhiteBoardMap15"]}
execute if block -67 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap16] run summon item_frame -67 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 36}}, Tags:["WhiteBoardMap","WhiteBoardMap16"]}
execute if block -66 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap17] run summon item_frame -66 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 37}}, Tags:["WhiteBoardMap","WhiteBoardMap17"]}
execute if block -65 51 -2302 sea_lantern unless entity @e[tag=WhiteBoardMap18] run summon item_frame -65 51 -2301 {Facing: 3b, Silent:true, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 38}}, Tags:["WhiteBoardMap","WhiteBoardMap18"]}

execute if entity @e[tag=WhiteBoardMap,nbt=!{ItemRotation:0b}] as @e[tag=WhiteBoardMap] run data merge entity @s {ItemRotation:0b}


# REMINDER NOTE -> change?
execute if block -71 49 -2288 sea_lantern unless entity @e[tag=ReminderMap] run summon item_frame -71 50 -2288 {Facing: 1b, Silent:true, ItemRotation: 2b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 39}}, Tags:["ReminderMap"]}
execute if entity @e[tag=ReminderMap,nbt=!{ItemRotation:1b}] run data merge entity @e[tag=ReminderMap,limit=1] {ItemRotation:1b}


# FUNNY DEATH CHEAT
execute align x align y align z if entity @a[gamemode=creative,x=-71,y=50,z=-2302,dx=20,dy=8,dz=17] run scoreboard objectives add IntroCheater dummy
execute align x align y align z run scoreboard players add @a[name=!qmagnet,gamemode=!adventure,x=-71,y=50,z=-2302,dx=20,dy=8,dz=17] IntroCheater 0
scoreboard players set @a[scores={IntroCheater=0}] IntroCheater 1
spawnpoint @a[scores={IntroCheater=1}] -61 50 -2305
execute if entity @a[scores={IntroCheater=1}] run tellraw @a {"text":"","extra":[{"text":" DEATH TO CHEATERS!!","color":"red"}]}
scoreboard players set @a[scores={IntroCheater=1}] IntroCheater 2
gamemode adventure @a[scores={IntroCheater=2}]
kill @a[scores={IntroCheater=2}]
scoreboard players reset @a[scores={IntroCheater=2..}] IntroCheater
execute unless entity @a[scores={IntroCheater=0..}] run scoreboard objectives remove IntroCheater


# LAB MOB
execute if block -57 50 -2301 redstone_block unless entity @e[tag=LabSpit] run summon llama_spit -57 50.85 -2301 {NoAI:true,NoGravity:true,Invulnerable:true,Tags:["LabSpit"]}
execute if block -58 50 -2301 iron_block unless entity @e[tag=LabMob] run summon vex -58 51 -2301 {NoAI:true,Rotation:[270f,0f],NoGravity:true,Invulnerable:true,Tags:["LabMob"]}
execute align x align y align z if entity @a[x=-71,y=50,z=-2301,dx=20,dy=8,dz=17] as @e[tag=LabMob] at @s run teleport @s ^ ^ ^ facing entity @p[x=-71,y=50,z=-2301,dx=20,dy=8,dz=17] eyes
execute align x align y align z unless entity @a[x=-71,y=50,z=-2301,dx=20,dy=8,dz=17] as @e[tag=LabMob] run data merge entity @s {Rotation:[0.0f,0.0f]}
execute as @e[tag=LabMob] at @s run teleport @s -58 51 -2301 ~ 0
execute if block -52 50 -2296 lever[powered=false] if entity @e[tag=BulletDemo] run kill @e[tag=BulletDemo]
execute if block -52 50 -2296 lever[powered=true] unless entity @e[tag=BulletDemo] run summon shulker_bullet -51 51.4 -2296 {NoGravity:true,NoAI:true,Invulnerable:false,Tags:["BulletDemo"]}


#effect give @e[tag=LabMob] invisibility 255 10 true
#execute if block -71 50 -2288 repeating_command_block unless block -71 50 -2288 repeating_command_block{Command:"particle heart ~ ~1 ~ 0 0 0 0 1 force"} run data merge block -71 50 -2288 {Command:"particle heart ~ ~1 ~ 0 0 0 0 1 force"}


# WOOL DEMO
execute if block -58 50 -2295 stone_button[powered=true] run scoreboard objectives add D2WoolDemo dummy
execute if block -58 50 -2295 stone_button[powered=false] run scoreboard objectives remove D2WoolDemo
execute if block -58 50 -2295 stone_button[powered=true] run scoreboard players add @e[tag=MainHubAEC] D2WoolDemo 1

execute if entity @e[scores={D2WoolDemo=1}] run fill -58 50 -2293 -58 55 -2293 air
execute if entity @e[scores={D2WoolDemo=1}] run setblock -58 55 -2293 white_wool
execute if entity @e[scores={D2WoolDemo=1}] run setblock -58 55 -2293 air destroy
execute if entity @e[scores={D2WoolDemo=1}] run summon falling_block -58 55 -2293 {BlockState:{Name:"minecraft:white_wool"},Tags:["D2DemoWool"],DropItem:false,Time:-2147483648}
execute if entity @e[scores={D2WoolDemo=18}] run setblock -58 50 -2293 air destroy

execute if block -64 50 -2295 stone_button[powered=true] run scoreboard objectives add D3WoolDemo dummy
execute if block -64 50 -2295 stone_button[powered=false] run scoreboard objectives remove D3WoolDemo
execute if block -64 50 -2295 stone_button[powered=true] run scoreboard players add @e[tag=MainHubAEC] D3WoolDemo 1

execute if entity @e[scores={D3WoolDemo=1}] run kill @e[tag=D3DemoWool]
execute if entity @e[scores={D3WoolDemo=1}] run playsound entity.wither.shoot master @a -64 50 -2293 0.3 1 0
execute if entity @e[scores={D3WoolDemo=1}] run summon armor_stand -64 50 -2293 {Small:true,Invisible:true,NoGravity:true,ArmorItems:[{},{},{},{id:"minecraft:white_wool",Count:1b}],Tags:["D3DemoWool"],DisabledSlots:2039583}
execute as @e[tag=D3DemoWool] at @s run teleport @s ~ ~0.5 ~

execute align x align y align z if entity @e[tag=D3DemoWool,x=-64,y=55,z=-2293,dx=0,dy=0,dz=0] run playsound block.wool.hit master @a -64 55 -2293 1 0.5 0
execute align x align y align z if entity @e[tag=D3DemoWool,x=-64,y=55,z=-2293,dx=0,dy=0,dz=0] run particle falling_dust white_wool -64 55.7 -2293 0.2 0.2 0.2 1 50 force @a
execute align x align y align z if entity @e[tag=D3DemoWool,x=-64,y=55,z=-2293,dx=0,dy=0,dz=0] run kill @e[tag=D3DemoWool]


# MAP MAKER DEMO
execute if block -71 50 -2292 stone_brick_slab unless entity @e[tag=MapMakerFrame] run summon item_frame -71 51 -2292 {Facing: 1b, ItemRotation: 6b, Invulnerable: true, Item: {id: "minecraft:map", Count: 1b}, Tags:["MapMakerFrame"]}
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 6b, Item: {id: "minecraft:map"}}] run scoreboard objectives remove D3MapMaker
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 7b, Item: {id: "minecraft:map"}}] run scoreboard objectives add D3MapMaker dummy
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 7b, Item: {id: "minecraft:map"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 0
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 0b, Item: {id: "minecraft:blue_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 1
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 1b, Item: {id: "minecraft:orange_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 2
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 2b, Item: {id: "minecraft:cyan_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 3
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 3b, Item: {id: "minecraft:black_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 4
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 4b, Item: {id: "minecraft:pink_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 5
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 5b, Item: {id: "minecraft:red_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 6
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 6b, Item: {id: "minecraft:green_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 7
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 7b, Item: {id: "minecraft:purple_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 8
execute if entity @e[tag=MapMakerFrame,nbt={ItemRotation: 0b, Item: {id: "minecraft:white_concrete"}}] run scoreboard players set @e[tag=MainHubAEC] D3MapMaker 9

execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:map"}, ItemRotation: 7b}, limit=1] run data merge entity @s {Item:{id:"minecraft:blue_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:blue_concrete"}, ItemRotation: 7b}, limit=1] run data merge entity @s {ItemRotation: 0b}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:blue_concrete"}, ItemRotation: 1b}, limit=1] run data merge entity @s {Item:{id:"minecraft:orange_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:orange_concrete"}, ItemRotation: 2b}, limit=1] run data merge entity @s {Item:{id:"minecraft:cyan_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:cyan_concrete"}, ItemRotation: 3b}, limit=1] run data merge entity @s {Item:{id:"minecraft:black_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:black_concrete"}, ItemRotation: 4b}, limit=1] run data merge entity @s {Item:{id:"minecraft:pink_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:pink_concrete"}, ItemRotation: 5b}, limit=1] run data merge entity @s {Item:{id:"minecraft:red_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:red_concrete"}, ItemRotation: 6b}, limit=1] run data merge entity @s {Item:{id:"minecraft:green_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:green_concrete"}, ItemRotation: 7b}, limit=1] run data merge entity @s {Item:{id:"minecraft:purple_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:purple_concrete"}, ItemRotation: 0b}, limit=1] run data merge entity @s {Item:{id:"minecraft:white_concrete"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:white_concrete"}, ItemRotation: 1b}, limit=1] run data merge entity @s {Item:{id:"minecraft:map"}}
execute as @e[tag=MapMakerFrame,nbt={Item:{id:"minecraft:map"}, ItemRotation: 1b}, limit=1] run data merge entity @s {ItemRotation: 6b}

execute unless entity @e[scores={D3MapMaker=0..}] as @e[tag=D3MapMakerAEC] run kill @s
execute unless entity @e[scores={D3MapMaker=0..}] as @e[tag=D3MapMakerAS] run kill @s

execute unless entity @e[scores={D3MapMaker=0..}] if block -74 50 -2292 oak_wall_sign run setblock -74 50 -2292 air
execute if entity @e[scores={D3MapMaker=0..}] if block -74 50 -2292 air run setblock -74 50 -2292 oak_wall_sign[facing=east]{Text1: "{\"text\":\"DIVERSITY 3\"}", Text2: "{\"text\":\"----------------\"}", Text3: "{\"text\":\">> Map Team <<\"}", Text4:"{\"text\":\"----------------\"}"}

execute if entity @e[scores={D3MapMaker=0..}] unless entity @e[tag=D3MapMakerAEC] run summon area_effect_cloud -75 52.8 -2292 {Tags:["D3MapMakerAEC"],Duration:2147483647}
execute if entity @e[scores={D3MapMaker=0..}] unless entity @e[tag=D3MapMakerAS] run summon armor_stand -75 51 -2292 {Rotation:[270f,0f],Invisible:true,Invulnerable:true,Small:false,NoGravity:true,NoBasePlate:true,ShowArms:true,Tags:["D3MapMakerAS"]}

execute as @e[tag=D3MapMakerAS] at @s run teleport @s ~ ~ ~ ~2 ~

execute if entity @e[scores={D3MapMaker=1}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"MCEdit Programmer / Builder:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=1}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"abrightmoore\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"c67563fd-4b7f-4a6b-a908-7237c3f1eaf9",Properties:{textures:[{Signature:"nmp7wlrTf7LZ7MzCSEBlOGhMHPISEe0V96dvJN0nzcKbd6BqSvi7sn312Zy0lulVlPGc8BMaCXkU9xhPzznwdG8/TDfrtZueaXS5wvuLjdVR66mPYb72i90wbo8drdhZxKgnPVPD0rTVe98TCSm6duojBOm+/w0q/L4uVhcHhNIi/8N5AD6J22W6Ca9jjIqZOwLSMAZVJM8mtatgwEeY5SxzEXioRgOGo1pzgoqKvTgNPwiks4nWPzPI0KZNmS8lyZ0ETmdIzEHlMH2gNcgLq/D8dIxykVluS42bzRKuJVLmLXT+BLpf+AQG0EjsKjMfcg7ZleFjZ7AtXnLYz0BbfAjHBbQWpunxnhTVsy8DJhUmDUMWcOXzgqls+iv4Xm7O4OY1Pky65rjS0YdV+IdAoo4MCbtCF5/z5q35I+onA3W9CrXnByzoQvoJNUO1/4VVnR1eTD3USyuz3c3PDTNbTE6w9aQbcC8TzhIcXFdHOR0dAPj1icz8UzidBqZnO8Aczza6NhytTUcB73pbsDf6m0usl4A1U00BwV/kEUya2S5fnkIZsSTafhNTrgCI/12yaqD0ziYrKZhHKHsJ8zMFgou87WIQA1F6q2Fbxkm5oGyOwG/ZMy5fqptkuTQ+1PRhsJHjSPaFwC2TqRX0rjFaWAyrjYLzYuUEbS4xtumaHM4=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgxNTc3OTAsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]},Name:"abrightmoore"}},Count:1b}],Pose:{Head:[18f,0f,0f],LeftLeg:[0f,0f,351f],RightLeg:[33f,321f,23f],LeftArm:[350f,20f,220f],RightArm:[335f,345f,340f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=2}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Aesthetic Builder / Branch Designer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=2}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"AdamDJM\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"30365a82-8bf5-484e-946d-6cb9458301ae",Properties:{textures:[{Signature:"QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]},Name:"AdamDJM"}},Count:1b}],Pose:{Body:[357f,0f,0f],Head:[332f,0f,0f],LeftLeg:[0f,0f,344f],RightLeg:[0f,0f,14f],LeftArm:[332f,0f,342f],RightArm:[332f,19f,22f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=3}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Branch Designer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=3}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"Cold Fusion\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"07270730-7cf6-48f4-8850-11847f4d61a3",Properties:{textures:[{Signature:"E08RJkQu7JMPAg4f2vRm3JEI1AJt+AAqanlkzt9i4Uy50v6pJZ/GL5iIM5nUri7DMCRIAC3Wf0PdYT2r9OfRlmxFvMs286skw5ZeqUfs0itYV6b/Y06lf1Szy3M0sNnfQe38GszoyzG54ZNrlEAj8fCF/EniN8bdVSdKAHAnAu3w4DVHZ8zim1qAHfHx4PFoubTTv53xqO6ip+OexMXOdGdaPjB8iRIt5X9lVvtSE1fk6/xIEeyEGaANSIUSkDL7SniEQRcC3Kp/MCZ3xbxzy6SP1DAH7XRiXUUNkdFez5o9O9iU1ec+LTMDAVouBruBs3Go+FLmqhFDHBH8zPxzY0+LkgxNSh3wo3k0n0gS2KjEbjxSie8Oiq7e0IXASUu6ayAQ/RZZ/8zT6wI50KF79gvDCSeSU3xb4fNCblcEp55JmUGnv3/FcHEib/qHn4bLNjAxt5rQLiec+l16NFFhCcPlaQiZB9GUWO7Cpmo7iMwyQPAXpM59VD+KZkJTNJlGPGPTlHIVKJcLHfngafH0Hz45HYex/37GTulrvfphG03+h3P+Vl3ZGADlcj54OEViTxOShM+8l9RkIv50TwbX6sNT4Y4BcugC9vNAI/c4vRt9qg9rQOtOhSqf1+InqwJOquysr/fhG3COvpvrOh6RjQ77lMDy2zEZ7Lx1dQgGmkc=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg4Njg5NDksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]},Name:"ColdFusionGaming"}},Count:1b}],Pose:{Head:[0f,320f,0f],Body:[0f,0f,0f],LeftLeg:[0f,332f,354f],RightLeg:[0f,22f,9f],LeftArm:[0f,337f,272f],RightArm:[0f,24f,70f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=4}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Branch Designer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=4}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"Jigarbov\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8421247}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:44975}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"0e696be4-b798-452e-921e-816330bc97a9",Properties:{textures:[{Signature:"L3/V5fd+uKro8fz+1wmU1QUSy4iWCh+XzDbHp8SnjO+12dX6FjqDOgoqJGnUatD7ufVy0s/ibWPAhlPzPOmEw3h6yNGpAYBs/49nQrewF+0PydEEcjleI+USzwhw/B3Cpslbpjkxy0N0aHsCA1JSd/PFUvJlf9g1l69GN9hN4FreeT9Q4S7Ki7UNWWIXpPtZtxSa6F1CGEGe3zn+jhZcoLULMCFP/mkccJTpnRAWc7CcSLsgSgyluc1ELbGYhAsK4NEx01Vc+waT95OXpV1S+TtK2hG9x5MolMhW/NcoPtRfSa0Ahl4fuAkSrXLxbF3Tc6YE6nQIcOnRPx5UJhByMcCPS2gzWbkB07YRqX0pIB+QsluI8tqLk+Gepy2bDMqcK/zk2xKhaUsDxJjQBkFStfoPZCFUrnpVuzuS7V2iB88GhTX8/VfUZfv41sqS40cwV/DIiCz6JNQveBh0qpsJ9e9aGIvmgVmVltAprTtnb+xirO6soZu/Ewm3O7fNBad7lS3D10UZ+h+WHI8mvZ2Rq12Tb5HL+Wlb2SPovAGk7s1+VFqFzyLhWC7Fb69w1hNoLEHl3pRIKpc/VFHNY341QMzPSJJStlCpWguc9LpdUPxlzhO3lZnxABHBIv+wS217fQ6CK/nPvgCdGQah4JZNdh0q6O4yr5W0n4edaKykMEs=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg5Nzc4MTQsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]},Name:"Jigarbov"}},Count:1b}],Pose:{Head:[40f,0f,0f],LeftLeg:[0f,339f,257f],RightLeg:[0f,27f,74f],LeftArm:[105f,105f,47f],RightArm:[0f,47f,27f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=5}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Structure Contributer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=5}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"Noodlor\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:10079334}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13382502}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13421772}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"26fe7806-9bf5-455d-b460-706c99ec5f0a",Properties:{textures:[{Signature:"EFcsKqW5e5ATTpCGI4LGtyLwOemYDpEN0jhNpsRwqHdhbXydlnXU4ELAo/wjttvG1ywSJH9DNjzQX9MwT66oF4iNB3zkfPlQnPAiXN9oYr8oCIrcVhV6xxGtt6GheittZQ5gaTs0VUxJzKf36uYHFVHb9VpdQ5jNHTOOaxclGJSPpWDno94X+btNI2Kv2AWap0FsxRAhQ+hOHidnDnadEpnMUwef2wsT9RzxuGyyv8HWhSbfdKI5nwmqFXYCCJ6RHaihBl5+8UmyEo5fvfwCwAOH35HAi3MVhm/qEhTdkY7MwzDHP6lbFXySDeUIIP2zwfZL5UulzkMfWqr3pbGhfyzjw+DMWMXv6g3jYICd2P3WW7uYHC0Gw8zYo1x3sqHxN5A1ZfIerhdGm3P1F3voK3J5e18LqQavQnqL7pp5hpx/tHn0Mc5zZmP9dV4pJrOvja8vlSsQU5nkDfxzZ6zlvlghJLmN+GX0EPhf5sCAGDNTP+oQNogtjIK6l95uwgHZO7+yc6gPjH+nBq2q6TfBY7qGl1MMibQCALIHbXkSO61198ifJPL+os8q6xJ6wMGGZGnu2QINUF62Ih97El+hKO4Hd9Glmpuq+jiccfKHofwMD9Bs4hUqWsB+5NWOG/Hcccjq2B6MR9qr3GOKpCxuj9zhyECVVv3yfZ1pLJJusZw=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwMDUxNzYsInByb2ZpbGVJZCI6IjI2ZmU3ODA2OWJmNTQ1NWRiNDYwNzA2Yzk5ZWM1ZjBhIiwicHJvZmlsZU5hbWUiOiJOb29kbG9yIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mZTY3OGI2ZTBiMmEwZmRlMTk2ZGUyMWQ1MjczNjdiNjkzNDMzZGRjYjk3ZjFlMmM5MTFlNjAzN2RmNWRlNWI1In19fQ=="}]},Name:"Noodlor"}},Count:1b}],Pose:{Body:[0f,0f,0f],RightArm:[259f,19f,0f],LeftLeg:[20.0f,0.0f,0.0f],Head:[0.0f,0.0f,0.0f],LeftArm:[55f,17f,0f],RightLeg:[320.0f,0.0f,0.0f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=6}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Lead Map Designer / Programmer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=6}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"qmagnet\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}},Count:1b}],Pose:{Head:[15f,0f,0f],Body:[0f,0f,0f],LeftLeg:[0f,319f,352f],RightLeg:[2f,0f,4f],LeftArm:[35f,310f,0f],RightArm:[35f,50f,0f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=7}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Command Contributer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=7}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"qwertyuiopthepie\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"03b07a62-98e6-4fc4-8187-fb276d5a317c",Properties:{textures:[{Signature:"eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]},Name:"qwertyuiopthepie"}},Count:1b}],Pose:{Head:[355f,57f,0f],LeftLeg:[0f,350f,352f],RightLeg:[0f,55f,90f],LeftArm:[311f,4f,337f],RightArm:[327f,37f,52f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=8}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Branch Designer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=8}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"renderXR\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6929734}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6044718}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4415092}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1c361569-6b3e-4ab0-b27f-b9f0df43f336",Properties:{textures:[{Signature:"JLxMr+0q/SVVJOwnNZf8NHOeeHXJ7CFPAS46QG5nHGL6t9qXxAThGVi5hVFILC/ZacuN1CFnkMU4pmv66echLDqfEk6qOEoI33p5o3+w9DFj9yv7Gc/D7UrS08FiWUAkMnSoBaT1eLU7MrawnBpaUqc8727fh63TX+3kjGjSGmwPb9XU5RoEEPUvRkaOq1csimujkU5Bpj4oyb3AeQBsZUe8V4G6lus2jL15w3nYPbG737XQm4LHPo2r6/4kIB6YdDSxc4dgI16CG9HXiV5SAKEbHmJtx9W/o+uVZCQsvY68gexZhgq3oU9Gy6R6dJz/C7Y+7hDkzQXiTnM5XxmVGyHzQzWzR5jwSYmPScqnOCRqo5C5xTVWHTHVRmVbpbUmc9pe2fMBkCXUF/Hmm//U3b5TIjjPRaMbI2zM9I4vNquAXlPSx44vY9Yn3A/XjGPngSh94Xgu9tiNTilZz0fdJS7rtUdxM/ZpfxK8L8q0kiNhlnNnK53e6ld2zRZxjhy7kF0f/Lz1nbVdLm1lmMnCVk2e08Kmd2HGglROXhBb+qvx539MdoE8byCj4/rrQGI/bdiVzaGnSD2i4rTQ06VBYhoz5UVnj4F+4oqk6gDzARwXKBU9TwsX2eKSnrMyEPY4eNGy61OZn0dmSM/ymnN9uB9o4h2vXpL2DkK4Pl/Lh+I=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkxMDAyMjEsInByb2ZpbGVJZCI6IjFjMzYxNTY5NmIzZTRhYjBiMjdmYjlmMGRmNDNmMzM2IiwicHJvZmlsZU5hbWUiOiJyZW5kZXJYUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmMyNzZhZTZiMGY3YjQxMGI0NjZmNmIyZTk2MmU1MWNlMzk2ODRhYTM0YjUyOTQ0MDE4MWM1MjYyY2RmMWM4ZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"renderXR"}},Count:1b}],Pose:{Head:[0f,0f,0f],LeftLeg:[347f,0f,0f],RightLeg:[2f,0f,0f],LeftArm:[281f,0f,0f],RightArm:[279f,0f,0f]},Invisible:false}

execute if entity @e[scores={D3MapMaker=9}] as @e[tag=D3MapMakerAEC] run data merge entity @s {CustomName:"{\"text\":\"Terraformer / Aesthetic Designer:\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[scores={D3MapMaker=9}] as @e[tag=D3MapMakerAS] run data merge entity @s {CustomName:"{\"text\":\"The1Kwa1Jsucsh\",\"bold\":\"true\",\"color\":\"white\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4008727}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4011567}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4863005}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1ca31321-dbd1-4c83-93b8-f58311600709",Properties:{textures:[{Signature:"DxW02OCzQ93IXxCBge2bMSTq5geoiiBcJIZcVQj72gDJq/xGJ2BL0hUeP6llceMr3DKTpd2QY/FAyfmuSjCK7IHvP6umtwhm18G16AkD1NgG8iycNvtR/Nm09PHgQh10xmsGzD5uLsZHXkjEGOTUjWYrU3WAH1ExJ4UZomJ9F2rW856wgwoOy3yaASkpxUOkEsOhL7bdzzAomfBWPiTVGnKZMYInjoZNXXSJCAQ7lRjIkBtSO64QagFBVvnzpyYaTFDoXFBDIBh18OkLa4I4Mu5boWBLqDOK6wBFVKncAKubepmfIhv3jXCQZz+mYKmshj+QJ+4g7YiTfBLbshJTCkPxGws1LtLBNYUi/ptoZJCHdePbTuy9doaMVFiR1WcLNp+USrD7qAbUapw0fqMJVW3/s2AipZMJzFJYGhzWuYE5tGirCGL9vpiTGcpGLE6caPUvAHpOSBZmCm9ZEW8VDYsPI5Seex5sCGzQAD/ARsWFJBhyfz6YA4mBLHgJlJX9G6DtTyB5KLt+mHqbwUkjym3/pWcRdC9eXbIJynzE5pL3a0Vm2Ytj3u+nWdPm04EudUEQAzs1vgPwB4twbitOPowrFkgnLiYjoe8wzCDyZFc6EfiWF4A+FYTXTancolOjMc8WCdwONdiRXmZ5Q2zkcLNCTEI4vCUFLY7LLsa3At0=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkwNTc4MzksInByb2ZpbGVJZCI6IjFjYTMxMzIxZGJkMTRjODM5M2I4ZjU4MzExNjAwNzA5IiwicHJvZmlsZU5hbWUiOiJkZW1lbnRlZGRvb2QiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E1NmY2YzMzOTY1MTZjNjM0YTg2OWVkN2IwMzgxNTUwODljNzg3OTliOTA0ODEwZWVhNzQ4M2VjNGQ2MzQ2YWEifX19"}]},Name:"dementeddood"}},Count:1b}],Pose:{Head:[0f,0f,12f],LeftLeg:[354f,0f,0f],RightLeg:[72f,0f,7f],LeftArm:[0f,0f,250f],RightArm:[324f,90f,35f]},Invisible:false}


# HINT TO ANVIL
data merge block -49 51 -2299 {Command:"tellraw @a [{\"text\":\"[the Code] Paper. Anvil. Thou must insert the code...\"}]"}
#tellraw @a [{"text":"[the Code] Thou must rename the paper "},{"text":"Jesper the End","color":"blue","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/user/jespertheend2"}},{"text":"."}]


# CODE MECHANIC
execute if block -50 49 -2293 quartz_block unless block -50 50 -2293 black_concrete_powder run setblock -50 50 -2293 black_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 50 -2292 lime_concrete_powder run setblock -50 50 -2292 lime_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 50 -2291 light_blue_concrete_powder run setblock -50 50 -2291 light_blue_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 51 -2293 brown_concrete_powder run setblock -50 51 -2293 brown_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 51 -2292 white_concrete_powder run setblock -50 51 -2292 white_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 51 -2291 green_concrete_powder run setblock -50 51 -2291 green_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 52 -2293 yellow_concrete_powder run setblock -50 52 -2293 yellow_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 52 -2292 orange_concrete_powder run setblock -50 52 -2292 orange_concrete_powder
execute if block -50 49 -2293 quartz_block unless block -50 52 -2291 purple_concrete_powder run setblock -50 52 -2291 purple_concrete_powder

execute if block -53 50 -2301 air run setblock -53 50 -2301 anvil[facing=east]
execute if block -55 51 -2301 air run setblock -55 51 -2301 cake
execute if block -51 51 -2301 air run setblock -51 51 -2301 cake
execute if block -53 50 -2301 anvil unless block -50 50 -2293 air run scoreboard objectives add PaperPresent dummy
execute if block -53 50 -2301 chipped_anvil unless block -50 50 -2293 air run scoreboard objectives add PaperPresent dummy
execute if block -53 50 -2301 damaged_anvil unless block -50 50 -2293 air run scoreboard objectives add PaperPresent dummy
execute if block -50 50 -2293 air run scoreboard objectives remove PaperPresent
execute if entity @e[nbt={Item:{id:"minecraft:paper"}},x=-53,y=51,z=-2301,dx=0,dz=0,dy=0] run scoreboard objectives remove PaperPresent
#execute if entity @e[nbt={Item:{id:"minecraft:paper"}}] run scoreboard objectives remove PaperPresent
#execute if entity @a[nbt={Inventory:[{id:"minecraft:paper"}]}] run scoreboard objectives remove PaperPresent
execute if block -53 49 -2299 hopper{Items:[{id:"minecraft:paper"}]} run scoreboard objectives remove PaperPresent
scoreboard players add @e[tag=MainHubAEC] PaperPresent 0
scoreboard players add @e[scores={PaperPresent=0..299}] PaperPresent 1

execute if entity @e[scores={PaperPresent=249..}] run playsound entity.item.pickup master @a -53 51 -2301 0.5 1 0
execute if entity @e[scores={PaperPresent=249..}] run summon item -53 51 -2301 {Item:{id:"minecraft:paper",Count:1b},PickupDelay:50s}
execute if entity @e[nbt={Item:{id:"minecraft:paper"}},x=-53,y=51,z=-2301,dx=0,dz=0,dy=0] run scoreboard objectives remove PaperPresent

tag @a remove Paper101
execute unless block -50 50 -2293 air align x align y align z run tag @a[x=-55,y=50,z=-2301,dx=4,dy=1,dz=4] add Paper101
experience set @a[tag=Paper101] 101 levels
experience set @a[tag=Paper101] 0 points
experience set @a[tag=!Paper101] 0 levels
experience set @a[tag=!Paper101] 0 points


# CHECK CODE
data merge block -53 49 -2299 {CustomName: "{\"text\":\"Insert Code\"}"}

execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper"}]} unless block -50 50 -2293 air run scoreboard objectives add CheckingCode dummy
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper"}]} unless block -50 50 -2293 air run scoreboard players add @e[tag=MainHubAEC] CheckingCode 0

execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"qmagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"QMAGNET\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"qMagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"Qmagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"QMagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"Q Magnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"Q MAGNET\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"q magnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"qMAGNET\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"q MAGNET\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"the qmagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"theqmagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"The Q Magnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"TheQMagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101
execute if block -53 49 -2299 hopper{Items: [{id: "minecraft:paper", tag: {display: {Name: "{\"text\":\"theQmagnet\"}"}}}]} run scoreboard players set @e[scores={CheckingCode=0..}] CheckingCode 101

execute if block -53 49 -2299 hopper{Items:[{Slot:0b,id:"minecraft:paper"}]} unless block -50 50 -2293 air run replaceitem block -53 49 -2299 container.0 air
execute if block -53 49 -2299 hopper{Items:[{Slot:1b,id:"minecraft:paper"}]} unless block -50 50 -2293 air run replaceitem block -53 49 -2299 container.1 air
execute if block -53 49 -2299 hopper{Items:[{Slot:2b,id:"minecraft:paper"}]} unless block -50 50 -2293 air run replaceitem block -53 49 -2299 container.2 air
execute if block -53 49 -2299 hopper{Items:[{Slot:3b,id:"minecraft:paper"}]} unless block -50 50 -2293 air run replaceitem block -53 49 -2299 container.3 air
execute if block -53 49 -2299 hopper{Items:[{Slot:4b,id:"minecraft:paper"}]} unless block -50 50 -2293 air run replaceitem block -53 49 -2299 container.4 air
scoreboard players add @e[scores={CheckingCode=0..}] CheckingCode 1

execute if entity @e[scores={CheckingCode=1}] run tellraw @a {"text":"","extra":[{"text":"[the Code] Checking...","color":"white"}]}
execute if entity @e[scores={CheckingCode=102}] run tellraw @a {"text":"","extra":[{"text":"[the Code] Checking...","color":"white"}]}
#execute if entity @e[scores={CheckingCode=99}] run tellraw @a {"text":"","extra":[{"text":"[the Code] Incorrect Code. Jesper will incinerate that worthless paper.","color":"white"}]}
execute if entity @e[scores={CheckingCode=99}] run tellraw @a [{"text":"[the Code] Incorrect code. "},{"text":"Jesper","color":"blue","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=x8B3LOC01Sc"}},{"text":" has incinerated that worthless paper."}]


execute if entity @e[scores={CheckingCode=199}] run fill -50 47 -2293 -50 49 -2291 air
scoreboard players reset @e[scores={CheckingCode=99}] CheckingCode
execute if entity @e[scores={CheckingCode=101..}] run scoreboard objectives remove PaperPresent
execute if entity @e[scores={CheckingCode=149}] run playsound ambient.cave ambient @a -50 51 -2292 1 1 0
execute if entity @e[scores={CheckingCode=175}] run playsound block.note_block.chime master @a -53 49 -2299 2 0.5 0
execute if entity @e[scores={CheckingCode=199..}] run clear @a paper
execute if entity @e[scores={CheckingCode=199..}] run kill @e[nbt={Item:{id:"minecraft:paper"}}]
execute if entity @e[scores={CheckingCode=199}] run playsound entity.evoker.cast_spell master @a -50 51 -2292 1 0.5 0
execute if entity @e[scores={CheckingCode=199..}] run scoreboard objectives remove CheckingCode

# ADD LATER WHEN ANVIL STAT GETS ADDED
#scoreboard objectives add InAnvil minecraft.custom:minecraft.interact_with_anvil
#scoreboard objectives setdisplay sidebar InAnvil


# QUICKSAND FIX FOR SPEEDRUNNERS
execute align x align y align z if entity @a[x=-50,y=47,z=-2293,dx=0,dy=2,dz=2] as @a[x=-50,y=47,z=-2293,dx=0,dy=2,dz=2] at @s run teleport @s ~ 50.2 ~


# RESETS GAMEPLAY AFTER CREDITS
execute if block -51 48 -2309 redstone_lamp unless entity @a[tag=ResetPistons] if block -51 49 -2309 lever[powered=true] run setblock -51 49 -2309 lever[face=wall,facing=north,powered=false] destroy
execute if block -51 48 -2309 redstone_lamp run tag @a add ResetPistons

execute if block -53 49 -2299 hopper unless entity @a[tag=ResetPowder] if block -50 50 -2293 air run setblock -50 49 -2293 quartz_block
execute if block -53 49 -2299 hopper run tag @a add ResetPowder

#execute if block -53 49 -2299 hopper unless entity @a[tag=ResetBookshelfHint] if block -50 50 -2293 air run setblock -50 49 -2293 quartz_block
#execute if block -53 49 -2299 hopper run tag @a add ResetBookshelfHint

execute align x align y align z run spawnpoint @a[x=-49,y=50,z=-2293,dx=2,dy=2,dz=2] -40 47 -2292
execute align x align y align z run spawnpoint @a[x=-62,y=29,z=-2196,dx=5,dy=1,dz=0] -60 27 -2191
execute align x align y align z run spawnpoint @a[x=-6,y=46,z=-2209,dx=20,dy=5,dz=1] 0 46 -2209


# KWA MAPS
execute if block -40 41 -2240 air run setblock -40 41 -2240 green_shulker_box[facing=up]{CustomName: "{\"text\":\"Shecret Box\"}", Items: [{Slot: 13b, id: "minecraft:filled_map", Count: 1b, tag: {HideFlags:63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 151}}]}
execute if block -36 49 -2007 air run setblock -36 49 -2007 green_shulker_box[facing=up]{CustomName: "{\"text\":\"Shecret Box\"}", Items: [{Slot: 13b, id: "minecraft:filled_map", Count: 1b, tag: {HideFlags:63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 153}}]}
execute if block 83 33 -2108 air run setblock 83 33 -2108 green_shulker_box[facing=up]{CustomName: "{\"text\":\"Shecret Box\"}", Items: [{Slot: 13b, id: "minecraft:filled_map", Count: 1b, tag: {HideFlags:63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 154}}]}

execute if block 4 20 -2210 white_terracotta unless entity @e[tag=KwaMap1] run summon item_frame 3 20 -2211 {Facing: 4b, ItemRotation: 0b, Invulnerable: false, Tags:["KwaMap1","KwaMap"]}
execute if block 4 20 -2210 white_terracotta unless entity @e[tag=KwaMap2] run summon item_frame 3 20 -2210 {Silent:true, Facing: 4b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 152}}, Tags:["KwaMap2","KwaMap"]}
execute if block 4 20 -2210 white_terracotta unless entity @e[tag=KwaMap3] run summon item_frame 3 19 -2211 {Facing: 4b, ItemRotation: 0b, Invulnerable: false, Tags:["KwaMap3","KwaMap"]}
execute if block 4 20 -2210 white_terracotta unless entity @e[tag=KwaMap4] run summon item_frame 3 19 -2210 {Facing: 4b, ItemRotation: 0b, Invulnerable: false, Tags:["KwaMap4","KwaMap"]}

execute as @e[tag=KwaMap1,nbt={Item: {id: "minecraft:filled_map", tag: {map: 151}}}] run data merge entity @s {Invulnerable:true,Silent:true}
execute as @e[tag=KwaMap3,nbt={Item: {id: "minecraft:filled_map", tag: {map: 153}}}] run data merge entity @s {Invulnerable:true,Silent:true}
execute as @e[tag=KwaMap4,nbt={Item: {id: "minecraft:filled_map", tag: {map: 154}}}] run data merge entity @s {Invulnerable:true,Silent:true}

execute if block -2 18 -2215 oak_wall_sign unless entity @e[tag=KwaDrawer1] run summon item_frame -2 18 -2215 {Facing: 3b, Silent:true, ItemRotation: 0b, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Invulnerable: true, Tags:["KwaDrawer1","KwaMap"]}
execute if block -2 18 -2215 oak_wall_sign unless entity @e[tag=KwaDrawer2] run summon item_frame -1 18 -2215 {Facing: 3b, Silent:true, ItemRotation: 0b, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Invulnerable: true, Tags:["KwaDrawer2","KwaMap"]}
execute if block -2 18 -2215 oak_wall_sign unless entity @e[tag=KwaDrawer3] run summon item_frame 0 18 -2215 {Facing: 3b, Silent:true, ItemRotation: 0b, Item: {id: "minecraft:light_gray_carpet", Count: 1b}, Invulnerable: true, Tags:["KwaDrawer3","KwaMap"]}

execute as @e[tag=KwaMap,nbt={Item: {Count: 1b}},nbt=!{ItemRotation: 0b}] run data merge entity @s {ItemRotation: 0b}

execute align x align y align z if entity @a[x=-4,y=18,z=-2215,dx=7,dy=3,dz=9] if entity @e[type=item,nbt={Item: {id:"minecraft:item_frame"}}] run kill @e[type=item,nbt={Item: {id:"minecraft:item_frame"}}]

fill -2 18 -2213 -2 18 -2210 dark_oak_trapdoor[facing=east,half=bottom,open=true] replace oak_trapdoor
fill -4 18 -2214 -3 18 -2214 dark_oak_trapdoor[facing=north,half=bottom,open=true] replace oak_trapdoor
execute if block -1 18 -2207 oak_trapdoor run setblock -1 18 -2207 spruce_trapdoor[facing=north,half=bottom,open=true]
execute if block 0 18 -2206 oak_trapdoor run setblock 0 18 -2206 spruce_trapdoor[facing=east,half=bottom,open=true]

#execute align x align y align z run teleport @a[x=6,y=18,z=-2207,dx=0,dy=1,dz=0] 0 46 -2209 0 0


tag @e remove BlankMap151
tag @e[type=item_frame,nbt={Item: {id: "minecraft:filled_map", Count: 1b, tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 151}}}] add BlankMap151
data merge entity @e[tag=BlankMap151,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=BlankMap151,limit=1] {Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 151}}}

tag @e remove BlankMap153
tag @e[type=item_frame,nbt={Item: {id: "minecraft:filled_map", Count: 1b, tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 153}}}] add BlankMap153
data merge entity @e[tag=BlankMap153,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=BlankMap153,limit=1] {Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 153}}}

tag @e remove BlankMap154
tag @e[type=item_frame,nbt={Item: {id: "minecraft:filled_map", Count: 1b, tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 154}}}] add BlankMap154
data merge entity @e[tag=BlankMap154,limit=1] {Item:{id:"minecraft:air"}}
data merge entity @e[tag=BlankMap154,limit=1] {Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 154}}}


execute as @e[type=item,nbt={Item: {id: "minecraft:filled_map", tag: {map: 151}}}, nbt=!{Item: {tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}}}}] run data merge entity @s {Item: {id: "minecraft:filled_map", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 151}}}

execute as @e[type=item,nbt={Item: {id: "minecraft:filled_map", tag: {map: 153}}}, nbt=!{Item: {tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}}}}] run data merge entity @s {Item: {id: "minecraft:filled_map", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 153}}}

execute as @e[type=item,nbt={Item: {id: "minecraft:filled_map", tag: {map: 154}}}, nbt=!{Item: {tag: {display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}}}}] run data merge entity @s {Item: {id: "minecraft:filled_map", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Shecret Map 1/3\"}"}, map: 154}}}

execute if entity @a[x=-4,y=18,z=-2215,dx=7,dy=3,dz=9] run gamerule doEntityDrops true


# TARDIS BANNER
execute if block 4 19 -2207 air run setblock 4 19 -2207 blue_wall_banner[facing=west]{Patterns: [{Pattern: "bri", Color: 0}, {Pattern: "hhb", Color: 11}, {Pattern: "sc", Color: 11}, {Pattern: "bo", Color: 11}, {Pattern: "sc", Color: 15}, {Pattern: "sc", Color: 11}, {Pattern: "bo", Color: 15}, {Pattern: "bo", Color: 11}]}


# MUSIC BOX
execute if block -4 19 -2216 air run setblock -4 19 -2216 green_shulker_box[facing=north]{CustomName: "{\"text\":\"Kwa's Music Box\"}", Items: [{Slot: 9b, id: "minecraft:music_disc_stal", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"K.W.A. - Straight Outta Swamplands\",\"italic\":\"false\"}"}, CanPlaceOn: ["minecraft:jukebox"]}},{Slot: 11b, id: "minecraft:music_disc_mall", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Kwaminem - The Slime Blocky EP\",\"italic\":\"false\"}"}, CanPlaceOn: ["minecraft:jukebox"]}},{Slot: 13b, id: "minecraft:music_disc_strad", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Kwanye West - Creepus\",\"italic\":\"false\"}"}, CanPlaceOn: ["minecraft:jukebox"]}},{Slot: 15b, id: "minecraft:music_disc_wait", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Kwandré 3000 - Look Ma No Commands\",\"italic\":\"false\"}"}, CanPlaceOn: ["minecraft:jukebox"]}},{Slot: 17b, id: "minecraft:music_disc_blocks", Count: 1b, tag: {HideFlags: 63, display: {Name: "{\"text\":\"Snoop Kwagg - Kwaggystyle\",\"italic\":\"false\"}"}, CanPlaceOn: ["minecraft:jukebox"]}}]}


# FIRST BEACON MONUMENT

# WHITE
execute if block 0 47 -2114 lever[powered=false] if block 0 43 -2108 iron_block run setblock 0 43 -2108 clay

# ORANGE
execute if block 0 47 -2114 lever[powered=false] if block -3 43 -2109 iron_block run setblock -3 43 -2109 clay

# YELLOW
execute if block 0 47 -2114 lever[powered=false] if block -5 43 -2111 iron_block run setblock -5 43 -2111 clay

# LIME
execute if block 0 47 -2114 lever[powered=false] if block -6 43 -2114 iron_block run setblock -6 43 -2114 clay

# PINK
execute if block 0 47 -2114 lever[powered=false] if block -5 43 -2117 iron_block run setblock -5 43 -2117 clay

# CYAN
execute if block 0 47 -2114 lever[powered=false] if block -3 43 -2119 iron_block run setblock -3 43 -2119 clay

# PURPLE
execute if block 0 47 -2114 lever[powered=false] if block 3 43 -2119 iron_block run setblock 3 43 -2119 clay

# BLUE
execute if block 0 47 -2114 lever[powered=false] if block 5 43 -2117 iron_block run setblock 5 43 -2117 clay

# BROWN
execute if block 0 47 -2114 lever[powered=false] if block 6 43 -2114 iron_block run setblock 6 43 -2114 clay

# RED
execute if block 0 47 -2114 lever[powered=false] if block 5 43 -2111 iron_block run setblock 5 43 -2111 clay

# BLACK
execute if block 0 47 -2114 lever[powered=false] if block 3 43 -2109 iron_block run setblock 3 43 -2109 clay

execute if block 0 47 -2114 lever[powered=false] run effect clear @a blindness

execute if block 1 4 2 spruce_log if block 0 47 -2114 lever[powered=true] run scoreboard objectives add ActivateBeacons dummy
execute if block 0 47 -2114 lever[powered=false] run scoreboard objectives remove ActivateBeacons
scoreboard players add @e[tag=MainHubAEC] ActivateBeacons 0
scoreboard players add @e[scores={ActivateBeacons=0..}] ActivateBeacons 1

execute if entity @e[scores={ActivateBeacons=1}] run effect give @a fire_resistance 65 255 true
execute if entity @e[scores={ActivateBeacons=1}] run effect give @a resistance 65 255 true
execute if entity @e[scores={ActivateBeacons=1}] run playsound block.end_gateway.spawn ambient @a 0 40 -2114 6 0.5 0
execute if entity @e[scores={ActivateBeacons=1}] run playsound block.end_portal.spawn ambient @a 0 40 -2114 6 0.5 0
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 47 -2114 air
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 43 -2114 redstone_block
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 45 -2114 air
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 44 -2114 air
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 44 -2114 sticky_piston[facing=up,extended=true]
execute if entity @e[scores={ActivateBeacons=1}] run setblock 0 45 -2114 piston_head[facing=up,type=sticky]
execute if entity @e[scores={ActivateBeacons=60}] run setblock 0 43 -2114 clay

execute if entity @e[scores={ActivateBeacons=90}] run setblock 0 43 -2108 iron_block
execute if entity @e[scores={ActivateBeacons=120}] run setblock -3 43 -2109 iron_block
execute if entity @e[scores={ActivateBeacons=120}] run data merge block -3 44 -2109 {Levels:1}
execute if entity @e[scores={ActivateBeacons=150}] run setblock -5 43 -2111 iron_block
execute if entity @e[scores={ActivateBeacons=180}] run setblock -6 43 -2114 iron_block
execute if entity @e[scores={ActivateBeacons=210}] run setblock -5 43 -2117 iron_block
execute if entity @e[scores={ActivateBeacons=240}] run setblock -3 43 -2119 iron_block
execute if entity @e[scores={ActivateBeacons=270}] run setblock 3 43 -2119 iron_block
execute if entity @e[scores={ActivateBeacons=300}] run setblock 5 43 -2117 iron_block
execute if entity @e[scores={ActivateBeacons=330}] run setblock 6 43 -2114 iron_block
execute if entity @e[scores={ActivateBeacons=360}] run setblock 5 43 -2111 iron_block
execute if entity @e[scores={ActivateBeacons=390}] run setblock 3 43 -2109 iron_block

execute if entity @e[scores={ActivateBeacons=400}] run setblock -50 49 -2293 quartz_block

execute if block 3 44 -2109 beacon{Levels:1} run scoreboard players set @e[scores={ActivateBeacons=..999}] ActivateBeacons 1000
execute if entity @e[scores={ActivateBeacons=1100}] run effect give @a blindness 30 255 true

execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1100}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1

execute if entity @e[scores={ActivateBeacons=1160}] run effect give @a blindness 30 255 true
execute if entity @e[scores={ActivateBeacons=1160}] run effect give @a night_vision 30 255 true

execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1160}] run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.5 1

#execute if entity @e[scores={ActivateBeacons=1160}] at @a run summon area_effect_cloud ~ ~ ~ {Tags:["StuckAEC"],Duration:200}
execute if entity @e[scores={ActivateBeacons=1160}] at @a run summon armor_stand ~ ~ ~ {Tags:["StuckAS"],Invisible:true,Invulnerable:true,Marker:true}
#execute if entity @e[scores={ActivateBeacons=1160..}] as @e[tag=StuckAS,sort=nearest,limit=1] at @s run teleport @a[distance=..1] ~ ~ ~
execute if entity @e[scores={ActivateBeacons=1160..}] at @e[tag=StuckAS] as @a[distance=..1] run teleport @s ~ ~ ~

execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1
execute if entity @e[scores={ActivateBeacons=1220}] run playsound entity.guardian.attack master @a ~ ~1 ~ 2 0.5 1

execute if entity @e[scores={ActivateBeacons=1220..}] run effect give @a levitation 255 1 true
execute if entity @e[scores={ActivateBeacons=1220..}] as @a at @s run teleport @s ^ ^ ^ facing 0 108 -2114
execute if entity @e[scores={ActivateBeacons=1220..}] as @e[tag=StuckAS] at @s run teleport @s ~ ~0.3 ~
execute if entity @e[scores={ActivateBeacons=1220}] run effect give @a slowness 15 1 true
execute if entity @e[scores={ActivateBeacons=1275}] run effect give @a slowness 15 2 true
execute if entity @e[scores={ActivateBeacons=1280}] run effect give @a slowness 15 3 true
execute if entity @e[scores={ActivateBeacons=1285}] run effect give @a slowness 15 4 true
execute if entity @e[scores={ActivateBeacons=1290}] run effect give @a slowness 15 5 true
execute if entity @e[scores={ActivateBeacons=1295}] run effect give @a slowness 15 6 true

execute if entity @e[scores={ActivateBeacons=1300}] run kill @e[tag=StuckAS]

execute if entity @e[scores={ActivateBeacons=1300}] run setblock 1 4 2 white_terracotta
execute if entity @e[scores={ActivateBeacons=1300}] run teleport @a 8 4 1 0 -90
execute if entity @e[scores={ActivateBeacons=1300}] run setblock 1 2 4 clay

execute if entity @e[scores={ActivateBeacons=1300}] run setblock 0 46 -2114 quartz_pillar[axis=y]
execute if entity @e[scores={ActivateBeacons=1300}] run setblock 0 47 -2114 lever[face=floor,facing=north,powered=false]

# WHITE
execute if block 0 47 -2114 lever[powered=false] if block 0 43 -2108 iron_block run setblock 0 43 -2108 clay

# ORANGE
execute if block 0 47 -2114 lever[powered=false] if block -3 43 -2109 iron_block run setblock -3 43 -2109 clay

# YELLOW
execute if block 0 47 -2114 lever[powered=false] if block -5 43 -2111 iron_block run setblock -5 43 -2111 clay

# LIME
execute if block 0 47 -2114 lever[powered=false] if block -6 43 -2114 iron_block run setblock -6 43 -2114 clay

# PINK
execute if block 0 47 -2114 lever[powered=false] if block -5 43 -2117 iron_block run setblock -5 43 -2117 clay

# CYAN
execute if block 0 47 -2114 lever[powered=false] if block -3 43 -2119 iron_block run setblock -3 43 -2119 clay

# PURPLE
execute if block 0 47 -2114 lever[powered=false] if block 3 43 -2119 iron_block run setblock 3 43 -2119 clay

# BLUE
execute if block 0 47 -2114 lever[powered=false] if block 5 43 -2117 iron_block run setblock 5 43 -2117 clay

# BROWN
execute if block 0 47 -2114 lever[powered=false] if block 6 43 -2114 iron_block run setblock 6 43 -2114 clay

# RED
execute if block 0 47 -2114 lever[powered=false] if block 5 43 -2111 iron_block run setblock 5 43 -2111 clay

# BLACK
execute if block 0 47 -2114 lever[powered=false] if block 3 43 -2109 iron_block run setblock 3 43 -2109 clay


execute if entity @e[scores={ActivateBeacons=1300..}] run scoreboard objectives remove ActivateBeacons