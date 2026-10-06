####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 1 2017 / MAY 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


scoreboard objectives add DeathLevel deathCount
scoreboard players set @a DeathLevel 0
#scoreboard objectives setdisplay sidebar DeathLevel


kill @e[tag=HighFiveStand]



# SETUP YELLOW
setblock -1109 24 -102 clay
setblock -1109 24 -102 dropper[facing=up]{CustomName:"{\"text\":\"Core\",\"color\":\"yellow\"}"}
setblock -1105 25 -98 air
setblock -1105 25 -97 redstone_block

# BRUTEC (YELLOW)
#execute if entity @e[scores={YellowTravel=3}] run summon armor_stand -1105 28 -104 {CustomName:"{\"text\":\"Brutec\",\"color\":\"yellow\"}",CustomNameVisible:false,ShowArms:true,Rotation:[70f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:Brutec}}],HandItems:[{id:"minecraft:horn_coral_block",Count:1b,tag:{display:{Name:"{\"text\":\"Spark\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["Totally a robot part."]}}}],Pose:{Head:[20f,0f,0f],RightArm:[340f,340f,340f],LeftArm:[340f,0f,20f]},Tags:["HighFiveStand","HighFiveBrutec"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}



# SETUP ORANGE
setblock -1001 30 -141 coal_block
setblock -1001 30 -141 furnace[facing=north]{CustomName:"{\"text\":\"Nether Endertainment System\",\"color\":\"orange\"}"}

setblock -996 30 -146 clay
setblock -996 30 -146 chest[facing=south]{CustomName:"{\"text\":\"Game Collection\"}", Items: [{Slot: 0b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Chicken Hunt\",\"italic\":\"false\"}"}}},{Slot: 1b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Exciteboat\",\"italic\":\"false\"}"}}},{Slot: 2b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"The Legend of Zombie\",\"italic\":\"false\"}"}}},{Slot: 3b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Super Minecart Bros.\",\"italic\":\"false\"}"}}},{Slot: 4b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Pac\\u0027d Ice-Man\",\"italic\":\"false\"}"}}},{Slot: 5b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Strongholdvania\",\"italic\":\"false\"}"}}},{Slot: 6b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Endermiteroid\",\"italic\":\"false\"}"}}},{Slot: 7b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Double Ender Dragon\",\"italic\":\"false\"}"}}},{Slot: 8b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Magma Man\",\"italic\":\"false\"}"}}},{Slot: 9b, id: "minecraft:stone_pressure_plate", Count: 1b, tag: { display: {Name: "{\"text\":\"Ninja Taiga\",\"italic\":\"false\"}"}}}]}

# BIGRE (ORANGE)
#execute if entity @e[scores={OrangeTravel=3}] run summon armor_stand -1000 29.9 -146 {CustomName:"{\"text\":\"Bigre\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,Rotation:[0f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:Bigre_}}],Pose:{RightArm:[300f,350f,0f],RightLeg:[270f,10f,350f],LeftLeg:[270f,350f,10f]},Tags:["HighFiveStand","HighFiveBigre"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}



# SETUP PURPLE
# DISCO (PURPLE)
#execute if entity @e[scores={PurpleTravel=3}] run summon armor_stand -875 2 -72 {CustomName:"{\"text\":\"FVDisco\",\"color\":\"dark_purple\"}",CustomNameVisible:false,ShowArms:true,Rotation:[135f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:14145464}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:FVDisco}}],HandItems:[{id:"minecraft:blaze_rod",Count:1b},{id:"minecraft:blaze_rod",Count:1b}],Tags:["HighFiveStand","HighFiveDisco"],NoGravity:true,NoBasePlate:true,Invulnerable:true,Pose:{Head:[15f,0f,0f],RightArm:[300f,340f,80f],LeftArm:[310f,330f,310f],RightLeg:[0f,20f,10f],LeftLeg:[0f,345f,340f]},DisabledSlots:2039583}


# SETUP BROWN
#kill @e[nbt={Item:{id:"minecraft:paper"}}]
#summon item -1107.0 1 64.0 {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:"{\"text\":\"Ticket Stub\",\"italic\":\"false\"}",Lore:["Jingle All the Way 3","Screen 14","$17.99"]},Enchantments:[{id:"minecraft:knockback",lvl:1}],HideFlags:1}},Age:-32768s}

# RECABILLY (BROWN)
#execute if entity @e[scores={BrownTravel=3}] run summon armor_stand -1086 4.40 48 {CustomName:"{\"text\":\"Recabilly\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,Rotation:[155f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",tag:{SkullOwner:Recabilly},Count:1b}],Tags:["HighFiveStand","TicketStub","HighFiveRecabilly"],Pose:{Head:[10f,0f,0f],RightArm:[280f,0f,0f],RightLeg:[270f,20f,350f],LeftLeg:[270f,340f,10f]},NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}


# SETUP WHITE
# NINJANOAH5 (WHITE)
#execute if entity @e[scores={WhiteTravel=3}] run summon armor_stand -1005 5 21 {CustomName:"{\"text\":\"ninjanoah5\",\"color\":\"white\"}",CustomNameVisible:false,ShowArms:true,Rotation:[270f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4781}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:790029}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:137422}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:ninjanoah5}}],Pose:{RightArm:[190f,0f,350f]},Tags:["HighFiveStand"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}


# SETUP GREEN
setblock -922 4 41 clay
setblock -922 4 41 chest[facing=west]{CustomName:"{\"text\":\"Trunk\"}",Items:[{Slot:3b,id:"minecraft:iron_ingot",Count:1b},{Slot:4b,id:"minecraft:iron_ingot",Count:1b},{Slot:5b,id:"minecraft:iron_ingot",Count:1b},{Slot:12b,id:"minecraft:iron_ingot",Count:1b},{Slot:13b,id:"minecraft:iron_ingot",Count:1b},{Slot:14b,id:"minecraft:iron_ingot",Count:1b},{Slot:21b,id:"minecraft:iron_ingot",Count:1b},{Slot:22b,id:"minecraft:iron_ingot",Count:1b},{Slot:23b,id:"minecraft:iron_ingot",Count:1b}]}

setblock -922 0 41 clay
setblock -922 0 41 chest[facing=west]{CustomName:"{\"text\":\"Trunk\"}"}

# MRGARRETTO (GREEN)
#execute if entity @e[scores={GreenTravel=3}] run summon armor_stand -921 3 39 {CustomName:"{\"text\":\"MrGarretto\",\"color\":\"dark_green\"}",CustomNameVisible:false,ShowArms:true,Rotation:[240f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:0b,tag:{display:{color:5383936}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:46039}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11078144}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:MrGarretto}}],Tags:["HighFiveStand","HighFiveMrGarretto"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}


# SETUP BLACK
setblock -1074 3 93 coal_block
setblock -1074 3 94 coal_block

setblock -1074 3 93 black_shulker_box[facing=north]{CustomName:"{\"text\":\"Crime Prevention\"}",Items:[{Slot:1b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f49689dc-5eb0-4dc3-b0ea-67b890330158",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjVlZWJkMThhYzUyMjA3YThmZDgxMGE4YmE5Y2NkMzA3MWI0NWEyYWZiOTUyMTE5NWUyMzYwMzU1YzU5YzRhMSJ9fX0="}]}},display:{Name:"{\"text\":\"Mister Freeze's Head\",\"italic\":\"false\",\"color\":\"aqua\"}"}}},{Slot:5b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"75d4f7e0-414e-40e2-aad1-5d204f376dd1",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2Q3NWI2MWI0MzZkOGY5NWZiMTYwNWRhMTM4NGI3MTE5MWNjOWQ1OTE1OWFjOGVkYTcwOGYyYzI5NDFiMSJ9fX0="}]}},display:{Name:"{\"text\":\"Mad Hatter's Head\",\"italic\":\"false\",\"color\":\"dark_green\"}"}}},{Slot:9b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fe6c8c6c-55bb-4fc7-ba85-6e34640d5c8c",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWM4MGMwNzhkYjg4MmRkYmJhMjFkYzJjODRmZTE2N2RiNTBkMTEwY2M0OGVmODM3MmVkODBhOWE0MmFkNTU0In19fQ=="}]}},display:{Name:"{\"text\":\"Harley Quinn's Head\",\"italic\":\"false\",\"color\":\"red\"}"}}},{Slot:11b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8fb0e62b-f648-4c00-b0d8-b375c351984b",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYmRlYmIwOTI1ZDY4MWQxZGY0ZGI0YjU4NWI4YTM2NDk4ZjRlZGI4NTJlZTA0MjNhNDcxNGM2NjE4OTJmMiJ9fX0="}]}},display:{Name:"{\"text\":\"Bane's Head\",\"italic\":\"false\",\"color\":\"gray\"}"}}},{Slot:13b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"2f70c0a4-f371-4366-b18d-928c0fa8aff8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTE1ZDM3YzMyMzYzOGJlMjc4ODkyYzRjZTk4Y2VmZDg4M2Y2MmViZDBhZmMwNWI0ZmVmMzFlMTYwNmU5NDRlIn19fQ=="}]}},display:{Name:"{\"text\":\"Two-Face's Head\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}},{Slot:15b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"40043a18-2d29-41f2-82b1-7422c723a5d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzY2NjdlNjg3NmExNTU2Njg0ZWUxNTVlOGUxZjMxNjU4MzczZWZhYWQyZWQyZGY3NzBkYzhjOGFlMjZmZjg3MSJ9fX0="}]}},display:{Name:"{\"text\":\"Poison Ivy's Head\",\"italic\":\"false\",\"color\":\"green\"}"}}},{Slot:16b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"6e3cb648-09bb-4a3d-a1f8-b8a017078e34",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDQ1MTQ0YmQyOWQ0YTJkOTI5MjY2OTVhZjZkYjZkYmUxOGNiNzg0YTU5NTVkYmFhYjEyOTY4ZDcwOWVjYSJ9fX0="}]}},display:{Name:"{\"text\":\"Adam West's Head\",\"italic\":\"false\",\"color\":\"blue\"}"}}},{Slot:19b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3ee188a6-2c6a-4c26-98a5-d655d4eed50f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTE3MWJhYTVhZDE2N2JkMzNlNDE5ZmU3NDVmN2IwMTg0MGNiNmQ3ZThkN2FlYzZjZGEzMWNlMmQ1Y2Y2MSJ9fX0="}]}},display:{Name:"{\"text\":\"Scarecrow's Head\",\"italic\":\"false\",\"color\":\"gold\"}"}}},{Slot:21b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f7ecc813-83ff-4bf5-8c51-325beac1a7af",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzJlN2ZhMmY5YjhkNmQxZTczNGVkYTVlM2NlMDI2Njg4MTM0MjkyZmNhZmMzMjViMWVhZDQzZDg5Y2MxZTEifX19"}]}},display:{Name:"{\"text\":\"Killer Croc's Head\",\"italic\":\"false\",\"color\":\"dark_green\"}"}}},{Slot:22b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"95dfcd00-a80e-469f-b011-19267da206e2",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjU4ZDVhZjJmOGE3NGI2OTBiOGYxYTllZmUzMzM5ZmMzZmNmMTRhN2I0NTkyYzI4ZTk5MzdkYzE0YWE1ZjJmIn19fQ=="}]}},display:{Name:"{\"text\":\"Catwoman's Head\",\"italic\":\"false\",\"color\":\"light_purple\"}"}}}]}

setblock -1074 3 94 black_shulker_box[facing=south]{CustomName:"{\"text\":\"Batmobile Parts\"}",Items:[{Slot:13b,id:"minecraft:melon",Count:1b,tag:{HideFlags:32,display:{Name:"{\"text\":\"Spare BatTire\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Not the best replacement,","color":"blue"}','{"text":"but it should at least roll.","color":"blue"}']},CanPlaceOn:["minecraft:observer"]}}]}

setblock -1075 1 96 air

#execute if entity @e[scores={BlackTravel=3}] run summon armor_stand -1070 1 102 {CustomName:"{\"text\":\"razlight789\",\"color\":\"dark_gray\"}",CustomNameVisible:false,ShowArms:true,Rotation:[110f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:43288}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1185043}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:115492}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:razlight789}}],Pose:{RightArm:[305f,0f,60f],Head:[0f,20f,0f]},Tags:["HighFiveStand","HighFiverazlight789"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:2039583}


# SETUP LIME
setblock -1002 2 121 lime_glazed_terracotta[facing=west]
setblock -1002 3 121 lime_glazed_terracotta[facing=south]
setblock -1002 2 120 lime_glazed_terracotta[facing=north]
setblock -1002 3 120 lime_glazed_terracotta[facing=east]

setblock -1001 3 120 lime_glazed_terracotta[facing=south]

setblock -1000 2 121 lime_glazed_terracotta[facing=west]
setblock -1000 3 121 lime_glazed_terracotta[facing=south]
setblock -1000 2 120 lime_glazed_terracotta[facing=north]
setblock -1000 3 120 lime_glazed_terracotta[facing=east]


# SLICEDLIME (LIME)
#execute if entity @e[scores={LimeTravel=3}] run summon armor_stand -999 1 123 {CustomName:"{\"text\":\"slicedlime\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,Rotation:[30f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5383936}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3957279}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3957279}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:slicedlime}}],HandItems:[{id:"minecraft:iron_axe",Count:1b,tag:{display:{Name:"{\"text\":\"Lime Slicer\",\"italic\":\"false\",\"color\":\"green\"}",Lore:["It's a little dull. Probably from all the limes","that were sliced to make this Drop."]},CanDestroy:["minecraft:lime_glazed_terracotta"],HideFlags:63}}],Tags:["HighFiveStand","HighFiveslicedlime"],NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}


# SETUP LIGHT BLUE
setblock -885 14 137 tnt

# TEXELELF (LIGHT BLUE)
#execute if entity @e[scores={LightBlueTravel=3}] run summon armor_stand -883 14 138 {CustomName:"{\"text\":\"texelelf\",\"color\":\"aqua\"}",CustomNameVisible:false,ShowArms:true,Rotation:[155f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8671793}}},{id:"minecraft:player_head",tag:{SkullOwner:texelelf},Count:1b}],HandItems:[{id:"minecraft:lever",Count:1b,tag:{CanPlaceOn:["minecraft:tnt"],HideFlags:63}}],Tags:["HighFiveStand","HighFivetexelelf"],Pose:{RightArm:[320f,0f,0f]},NoGravity:true,NoBasePlate:true,Invulnerable:true,DisabledSlots:1973790}



# TOGGLE TO SEE NAMES
#execute as @e[tag=HighFiveStand] run data merge entity @s {CustomNameVisible:true}