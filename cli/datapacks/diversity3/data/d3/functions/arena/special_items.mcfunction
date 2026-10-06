####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 1 2019 / JULY 8 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# REEDS OF GREED (GREEN)
execute if entity @e[scores={ArenaRound=0}] unless block -4 51 1962 green_stained_glass run setblock -4 51 1962 green_stained_glass
execute if block -4 51 1962 green_stained_glass unless entity @e[tag=GreenArenaStand] run summon armor_stand -3.75 49.8 1962.565  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:sugar_cane",Count:1b,tag:{Enchantments:[{id:"minecraft:fortune",lvl:2s},{id:"minecraft:knockback",lvl:2s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","GreenArenaStand"]}
execute unless block -4 50 1962 air unless block -5 50 1962 oak_wall_sign run setblock -5 50 1962 oak_wall_sign[facing=west]{Text1:"{\"text\":\"REEDS OF GREED\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Wielder gains 2x cash\",\"color\":\"none\"}",Text4:"{\"text\":\"cash on each kill\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1962 air if entity @e[tag=GreenArenaStand] run summon item -4 51 1962 {Item:{id:"minecraft:sugar_cane",Count:1b,tag:{display:{Name:"{\"text\":\"Reeds of Greed\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"}",Lore:['{"text":"Killing enemies with this weapon","italic":"true","color":"yellow"}','{"text":"rewards the wielder two times","italic":"true","color":"yellow"}','{"text":"the Kill Ca$h","italic":"true","color":"yellow"}']},TwiceCash:1b,Enchantments:[{id:"minecraft:fortune",lvl:2s},{id:"minecraft:knockback",lvl:2s},{id:"minecraft:sharpness",lvl:6s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1962 air if entity @e[tag=GreenArenaStand] run kill @e[tag=GreenArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1962 air if entity @a[nbt={Inventory:[{id:"minecraft:green_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:green_concrete_powder"}]}] green_concrete_powder


# GODPLATE (CYAN)
execute if entity @e[scores={ArenaRound=0}] unless block -4 51 1964 light_blue_stained_glass run setblock -4 51 1964 light_blue_stained_glass
execute if block -4 51 1964 light_blue_stained_glass unless entity @e[tag=LightBlueArenaStand] run summon armor_stand -3.75 49.8 1964.565  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:blast_protection",lvl:3s},{id:"minecraft:projectile_protection",lvl:3s},{id:"minecraft:thorns",lvl:1s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","LightBlueArenaStand"]}
execute unless block -4 50 1964 air unless block -5 50 1964 oak_wall_sign run setblock -5 50 1964 oak_wall_sign[facing=west]{Text1:"{\"text\":\"GODPLATE\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Hurts foes that\",\"color\":\"none\"}",Text4:"{\"text\":\"hurt the wearer\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1964 air if entity @e[tag=LightBlueArenaStand] run summon item -4 51 1964 {Item:{id:"minecraft:diamond_chestplate",Count:1b,tag:{display:{Name:"{\"text\":\"Godplate\",\"italic\":\"false\",\"color\":\"blue\",\"bold\":\"true\"}",Lore:['{"text":"Enemies who inflinct damage to","italic":"true","color":"yellow"}','{"text":"the wearer of this armor will","italic":"true","color":"yellow"}','{"text":"recieve damage in return","italic":"true","color":"yellow"}']},Unbreakable:1b,Enchantments:[{id:"minecraft:blast_protection",lvl:1s},{id:"minecraft:projectile_protection",lvl:1s},{id:"minecraft:thorns",lvl:2s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1964 air if entity @e[tag=LightBlueArenaStand] run kill @e[tag=LightBlueArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1964 air if entity @a[nbt={Inventory:[{id:"minecraft:light_blue_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:light_blue_concrete_powder"}]}] light_blue_concrete_powder


# PENNY PINCHER (BROWN)
execute if entity @e[scores={ArenaRound=0}] unless block -4 51 1966 brown_stained_glass run setblock -4 51 1966 brown_stained_glass
execute if block -4 51 1966 brown_stained_glass unless entity @e[tag=BrownArenaStand] run summon armor_stand -3.75 49.8 1966.565  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:book",Count:1b,tag:{Enchantments:[{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fortune",lvl:2s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","BrownArenaStand"]}
execute unless block -4 50 1966 air unless block -5 50 1966 oak_wall_sign run setblock -5 50 1966 oak_wall_sign[facing=west]{Text1:"{\"text\":\"PENNY PINCHER\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Death only takes\",\"color\":\"none\"}",Text4:"{\"text\":\"1/2 the cash\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1966 air if entity @e[tag=BrownArenaStand] run summon item -4 51 1966 {Item:{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Penny Pincher\",\"italic\":\"false\",\"color\":\"dark_red\",\"bold\":\"true\"}",Lore:['{"text":"*** UNLIMITED USE ***","italic":"true","color":"yellow"}','{"text":"-----------------------","italic":"true","color":"yellow"}','{"text":"Placed in the inventory, this","italic":"true","color":"yellow"}','{"text":"item allows its owner to save","italic":"true","color":"yellow"}','{"text":"half of their Kill Ca$h if","italic":"true","color":"yellow"}','{"text":"they die","italic":"true","color":"yellow"}']},HalfCash:1b,Enchantments:[{id:"minecraft:fortune",lvl:2s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1966 air if entity @e[tag=BrownArenaStand] run kill @e[tag=BrownArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -4 51 1966 air if entity @a[nbt={Inventory:[{id:"minecraft:brown_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:brown_concrete_powder"}]}] brown_concrete_powder

#['{"text":"*** UNLIMITED USE ***","italic":"true","color":"yellow"}','{"text":"-------------","italic":"true","color":"yellow"}','{"text":"Placed in the inventory, this","italic":"true","color":"yellow"}','{"text":"item allows its owner to save","italic":"true","color":"yellow"}','{"text":"half of their Kill Ca$h if","italic":"true","color":"yellow"}','{"text":"they die","italic":"true","color":"yellow"}']


# OCEAN FORK (CYAN)
execute if entity @e[scores={ArenaRound=0}] unless block -6 51 1968 cyan_stained_glass run setblock -6 51 1968 cyan_stained_glass
#execute if block -6 51 1968 cyan_stained_glass unless entity @e[tag=CyanArenaStand] run summon armor_stand -5.96 50.65 1968.6  {Invisible:1b,Invulnerable:1b,ShowArms:1b,Small:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:trident",Count:1b}],Pose:{Head:[20f,0f,135f],RightArm:[0f,300f,0f],LeftArm:[80f,270f,0f]},DisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","CyanArenaStand"]}
execute if block -6 51 1968 cyan_stained_glass unless entity @e[tag=CyanArenaStand] run summon armor_stand -5.19 50.1 1968.82  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:trident",Count:1b,tag:{Enchantments:[{id:"minecraft:loyalty",lvl:10s},{id:"minecraft:lure",lvl:10s}]}}],Pose:{Head:[0f,0f,0f],RightArm:[0f,300f,0f],LeftArm:[80f,270f,0f]},DisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","CyanArenaStand"]}
execute unless block -6 50 1968 air unless block -6 50 1967 oak_wall_sign run setblock -6 50 1967 oak_wall_sign[facing=north]{Text1:"{\"text\":\"OCEAN FORK\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Returns to user\",\"color\":\"none\"}",Text4:"{\"text\":\"when thrown\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -6 51 1968 air if entity @e[tag=CyanArenaStand] run summon item -6 51 1968 {Item:{id:"minecraft:trident",Count:1b,tag:{display:{Name:"{\"text\":\"Ocean Fork\",\"italic\":\"false\",\"color\":\"aqua\",\"bold\":\"true\"}",Lore:['{"text":"This melee/ranged weapon will","italic":"true","color":"yellow"}','{"text":"automatically return to its owner","italic":"true","color":"yellow"}','{"text":"after being thrown at a target","italic":"true","color":"yellow"}']},Unbreakable:1b,Enchantments:[{id:"minecraft:loyalty",lvl:10s},{id:"minecraft:sharpness",lvl:1s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -6 51 1968 air if entity @e[tag=CyanArenaStand] run kill @e[tag=CyanArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -6 51 1968 air if entity @a[nbt={Inventory:[{id:"minecraft:cyan_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:cyan_concrete_powder"}]}] cyan_concrete_powder



# DRACULA BLADE (RED)
execute if entity @e[scores={ArenaRound=0}] unless block -8 51 1968 red_stained_glass run setblock -8 51 1968 red_stained_glass
execute if block -8 51 1968 red_stained_glass unless entity @e[tag=RedArenaStand] run summon armor_stand -6.963 50.54 1968.23  {Marker:1b,Invisible:1b,Invulnerable:1b,ShowArms:1b,Small:0b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:diamond_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:smite",lvl:2s},{id:"minecraft:sweeping",lvl:10s}]}}],Pose:{Head:[0f,0f,135f],RightArm:[0f,300f,0f],LeftArm:[80f,270f,0f]},dDisabledSlots:2039583,Rotation:[180f,0f],Tags:["ArenaStand","RedArenaStand"]}
execute unless block -8 50 1968 air unless block -8 50 1967 oak_wall_sign run setblock -8 50 1967 oak_wall_sign[facing=north]{Text1:"{\"text\":\"DRACULA BLADE\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Steals health\",\"color\":\"none\"}",Text4:"{\"text\":\"with each kill\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -8 51 1968 air if entity @e[tag=RedArenaStand] run summon item -8 51 1968 {Item:{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:"{\"text\":\"Dracula Blade\",\"italic\":\"false\",\"color\":\"red\",\"bold\":\"true\"}",Lore:['{"text":"Upon every kill with this blade,","italic":"true","color":"yellow"}','{"text":"the wielder will regain health","italic":"true","color":"yellow"}','{"text":"and cure any sickness","italic":"true","color":"yellow"}']},Dracula:1b,Unbreakable:1b,Enchantments:[{id:"minecraft:sweeping",lvl:10s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -8 51 1968 air if entity @e[tag=RedArenaStand] run kill @e[tag=RedArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -8 51 1968 air if entity @a[nbt={Inventory:[{id:"minecraft:red_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:red_concrete_powder"}]}] red_concrete_powder


# ICE ARROWS (WHITE)
execute if entity @e[scores={ArenaRound=0}] unless block -10 51 1968 white_stained_glass run setblock -10 51 1968 white_stained_glass
execute if block -10 51 1968 white_stained_glass unless entity @e[tag=WhiteArenaStand] run summon armor_stand -9.57 49.8 1968.25 {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:13302779,CustomPotionEffects:[{Id:27,Duration:350}],Enchantments:[{id:"minecraft:frost_walker",lvl:1s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[270f,0f],Tags:["ArenaStand","WhiteArenaStand"]}
execute unless block -10 50 1968 air unless block -10 50 1967 oak_wall_sign run setblock -10 50 1967 oak_wall_sign[facing=north]{Text1:"{\"text\":\"ICE ARROWS\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Freezes enemies\",\"color\":\"none\"}",Text4:"{\"text\":\"from fired shots\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -10 51 1968 air if entity @e[tag=WhiteArenaStand] run summon item -10 51 1968 {Item:{id:"minecraft:tipped_arrow",Count:64b,tag:{HideFlags:33,display:{Name:"{\"text\":\"Ice Arrow\",\"italic\":\"false\",\"color\":\"white\",\"bold\":\"true\"}",Lore:['{"text":"*** DOES NOT WORK ON BOSSES ***","italic":"true","color":"yellow"}','{"text":"----------------------------","italic":"true","color":"yellow"}','{"text":"Firing this from a bow immobilizes","italic":"true","color":"yellow"}','{"text":"a struck enemy for 15 seconds","italic":"true","color":"yellow"}']},Enchantments:[{id:"minecraft:frost_walker",lvl:10s}],CustomPotionColor:13302779,CustomPotionEffects:[{Id:27,Duration:350}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -10 51 1968 air if entity @e[tag=WhiteArenaStand] run kill @e[tag=WhiteArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -10 51 1968 air if entity @a[nbt={Inventory:[{id:"minecraft:white_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:white_concrete_powder"}]}] white_concrete_powder

execute if entity @e[type=arrow,nbt={CustomPotionEffects:[{Id:27b}],inGround:1b}] run kill @e[type=arrow,nbt={CustomPotionEffects:[{Id:27b}],inGround:1b}]


# USES BAD LUCK EFFECT -> NO AI


# MAGNETIC MINE (BLACK)
execute if entity @e[scores={ArenaRound=0}] unless block -12 51 1966 black_stained_glass run setblock -12 51 1966 black_stained_glass
execute if block -12 51 1966 black_stained_glass unless entity @e[tag=BlackArenaStand] run summon armor_stand -11.25 49.8 1966.435  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:turtle_spawn_egg",Count:1b,tag:{Enchantments:[{id:"minecraft:lure",lvl:10s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[0f,0f],Tags:["ArenaStand","BlackArenaStand"]}
execute unless block -12 50 1966 air unless block -11 50 1966 oak_wall_sign run setblock -11 50 1966 oak_wall_sign[facing=east]{Text1:"{\"text\":\"MAGNETIC MINE\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Pulls enemies to\",\"color\":\"none\"}",Text4:"{\"text\":\"placed location\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1966 air if entity @e[tag=BlackArenaStand] run summon item -12 51 1966 {Item:{id:"minecraft:turtle_spawn_egg",Count:1b,tag:{HideFlags:17,CanPlaceOn:["minecraft:grass","minecraft:sand","minecraft:cut_red_sandstone","minecraft:red_sandstone","minecraft:red_sandstone_stairs","minecraft:green_terracotta","minecraft:green_concrete_powder","minecraft:mossy_cobblestone","minecraft:dark_prismarine","minecraft:podzol","minecraft:spruce_leaves","minecraft:light_gray_concrete_powder","minecraft:dispenser","minecraft:spruce_planks","minecraft:spruce_slab","minecraft:oak_log","minecraft:red_sand","minecraft:terracotta","minecraft:purple_terracotta","minecraft:purple_concrete","minecraft:purple_concrete_powder","minecraft:red_nether_bricks","minecraft:nether_brick_slab","minecraft:nether_brick_stairs"],display:{Name:"{\"text\":\"Magnetic Mine\",\"italic\":\"false\",\"color\":\"dark_gray\",\"bold\":\"true\"}",Lore:['{"text":"*** ONE-TIME USE / LASTS 2 MINUTES ***","italic":"true","color":"yellow"}','{"text":"*** DOES NOT WORK ON BOSSES ***","italic":"true","color":"yellow"}','{"text":"----------------------------","italic":"true","color":"yellow"}','{"text":"Activating this mine will create a magnetic","italic":"true","color":"yellow"}','{"text":"force that pulls in enemies within 10","italic":"true","color":"yellow"}','{"text":"blocks of the mine\'s location","italic":"true","color":"yellow"}']},Enchantments:[{id:"minecraft:lure",lvl:2s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1966 air if entity @e[tag=BlackArenaStand] run kill @e[tag=BlackArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1966 air if entity @a[nbt={Inventory:[{id:"minecraft:black_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:black_concrete_powder"}]}] black_concrete_powder

execute unless block -12 50 1966 dried_kelp_block run setblock -12 50 1966 dried_kelp_block


# SENTRY (LIGHT GREY)
execute if entity @e[scores={ArenaRound=0}] unless block -12 51 1964 light_gray_stained_glass run setblock -12 51 1964 light_gray_stained_glass
execute if block -12 51 1964 light_gray_stained_glass unless entity @e[tag=LightGreyArenaStand] run summon armor_stand -11.25 49.8 1964.435  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:dolphin_spawn_egg",Count:1b,tag:{Enchantments:[{id:"minecraft:lure",lvl:10s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[0f,0f],Tags:["ArenaStand","LightGreyArenaStand"]}
execute unless block -12 50 1964 air unless block -11 50 1964 oak_wall_sign run setblock -11 50 1964 oak_wall_sign[facing=east]{Text1:"{\"text\":\"SENTRY\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Defensive turret\",\"color\":\"none\"}",Text4:"{\"text\":\"to join the battle\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run summon item -12 51 1964 {Item:{id:"minecraft:dolphin_spawn_egg",Count:1b,tag:{HideFlags:17,CanPlaceOn:["minecraft:grass","minecraft:sand","minecraft:cut_red_sandstone","minecraft:red_sandstone","minecraft:red_sandstone_stairs","minecraft:green_terracotta","minecraft:green_concrete_powder","minecraft:mossy_cobblestone","minecraft:dark_prismarine","minecraft:podzol","minecraft:spruce_leaves","minecraft:light_gray_concrete_powder","minecraft:dispenser","minecraft:spruce_planks","minecraft:spruce_slab","minecraft:oak_log","minecraft:red_sand","minecraft:terracotta","minecraft:purple_terracotta","minecraft:purple_concrete","minecraft:purple_concrete_powder","minecraft:red_nether_bricks","minecraft:nether_brick_slab","minecraft:nether_brick_stairs"],display:{Name:"{\"text\":\"Sentry\",\"italic\":\"false\",\"color\":\"gray\",\"bold\":\"true\"}",Lore:['{"text":"*** ONE-TIME USE / LASTS 1 ROUND ***","italic":"true","color":"yellow"}','{"text":"*** DOES NOT WORK ON BOSSES ***","italic":"true","color":"yellow"}','{"text":"--------------------------------","italic":"true","color":"yellow"}','{"text":"Placing this in the Arena creates","italic":"true","color":"yellow"}','{"text":"a one-shot kill Sentry that targets","italic":"true","color":"yellow"}','{"text":"random mobs and can shoot through","italic":"true","color":"yellow"}','{"text":"walls to get the kills","italic":"true","color":"yellow"}','{"text":"Sentry kills count towards the totals","italic":"true","color":"yellow"}']},Enchantments:[{id:"minecraft:lure",lvl:2s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run kill @e[tag=LightGreyArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @a[nbt={Inventory:[{id:"minecraft:light_gray_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:light_gray_concrete_powder"}]}] light_gray_concrete_powder


#*** ONE-TIME USE / LASTS 1 ROUND ***
#------------------------------------
#Placing this in the Arena creates
#a one-shot kill Sentry that targets
#random mobs and can shoot through
#walls to get the kills
#Sentry kills count towards the totals




#Throwing this will cause all present
#enemies to transform into domestic
#animals
#Kills are still counted towards
#the hostile totals


execute unless block -12 50 1964 dead_brain_coral_block run setblock -12 50 1964 dead_brain_coral_block

#execute if block -12 51 1964 light_gray_stained_glass unless entity @e[tag=LightGreyArenaStand] run summon armor_stand -12 50 1964 {Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,DisabledSlots:2039583,Rotation:[90f,0f],Tags:["ArenaStand","LightGreyArenaStand"]}
#execute if block -12 51 1964 light_gray_stained_glass unless entity @e[tag=ArenaWolf] run summon wolf -11.64 51.05 1964.5  {Invulnerable:1b,Silent:true,NoAI:true,Sitting:1b,Age:-9999999,Health:300.0f,Attributes:[{Name:"generic.maxHealth",Base:300.0},{Name:"generic.attackDamage",Base:5.0}],CollarColor:4b,Rotation:[270f,0f],Team:Arena,Tags:["ArenaWolf"]}
#execute if block -12 51 1964 light_gray_stained_glass unless block -12 50 1964 dropper run setblock -12 50 1964 dropper[facing=down] 
#execute if block -12 51 1964 light_gray_stained_glass run data merge block -12 50 1964 {CustomName:"{\"text\":\"Bone Container\"}",Lock:"Wolf"}
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] as @e[tag=ArenaWolf] run data merge entity @s {Age:0,Silent:0b,Sitting:0b}
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run playsound block.chest.locked block @a -12 50 1964
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run data merge block -12 50 1964 {Items:[{Slot:4b,id:"minecraft:bone",Count:64b}],Lock:""}
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] align x align y align z run title @a[x=-13,y=50,z=1959,dx=10,dy=4,dz=11] actionbar {"text":"Bone Container is unlocked!"}
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] at @e[tag=ArenaWolf] run playsound entity.wolf.ambient master @a
#execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run particle heart -12 50.5 1964 0.3 0.3 0.3 0 50 force @a
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1964 air if entity @e[tag=LightGreyArenaStand] run setblock -12 50 1964 dispenser[facing=up]{CustomName:"{\"text\":\"Bone Container\"}",Items:[{Slot:4b,id:"minecraft:bone",Count:64b}],Lock:""}


#execute if block -12 51 1964 air if entity @e[tag=ArenaWolf,nbt={NoAI:1b}] as @e[tag=ArenaWolf] at @s run teleport @s ^ ^ ^ facing entity @p
#execute if block -12 51 1964 air if entity @e[tag=ArenaWolf,nbt={NoAI:1b}] as @e[tag=ArenaWolf] at @s run teleport @s ^ ^ ^ facing entity @p[nbt={SelectedItem:{id:"minecraft:bone"}}]
#execute if block -12 51 1964 air if entity @e[tag=ArenaWolf,nbt={NoAI:1b}] as @e[tag=ArenaWolf] at @s run teleport @s -12 51 1964 ~ 0
#execute if block -12 51 1964 air if entity @e[tag=ArenaWolf,nbt={NoAI:1b},nbt=!{OwnerUUID:""}] as @e[tag=ArenaWolf,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}
#execute if block -12 51 1964 air if entity @e[tag=ArenaWolf,nbt={Invulnerable:1b}] run data merge entity @e[tag=ArenaWolf,limit=1] {Invulnerable:0b}

# PASSIVIER (ORANGE)
execute if entity @e[scores={ArenaRound=0}] unless block -12 51 1962 orange_stained_glass run setblock -12 51 1962 orange_stained_glass
execute if block -12 51 1962 orange_stained_glass unless entity @e[tag=OrangeArenaStand] run summon armor_stand -11.25 49.8 1962.435  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:egg",Count:1b,tag:{Enchantments:[{id:"minecraft:sharpness",lvl:3s}]}}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[0f,0f],Tags:["ArenaStand","OrangeArenaStand"]}
execute unless block -12 50 1962 air unless block -11 50 1962 oak_wall_sign run setblock -11 50 1962 oak_wall_sign[facing=east]{Text1:"{\"text\":\"PASSIVIER\",\"color\":\"none\"}",Text2:"{\"text\":\"---------------\",\"color\":\"none\"}",Text3:"{\"text\":\"Converts hostiles\",\"color\":\"none\"}",Text4:"{\"text\":\"into domestic\",\"color\":\"none\"}"}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1962 air if entity @e[tag=OrangeArenaStand] run summon item -12 51 1962 {Item:{id:"minecraft:egg",Count:1b,tag:{HideFlags:1,display:{Name:"{\"text\":\"Passivier\",\"italic\":\"false\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:['{"text":"*** ONE-TIME USE / LASTS 1 MINUTE ***","italic":"true","color":"yellow"}','{"text":"*** DOES NOT WORK ON BOSSES ***","italic":"true","color":"yellow"}','{"text":"----------------------------","italic":"true","color":"yellow"}','{"text":"Throwing this will cause all present","italic":"true","color":"yellow"}','{"text":"enemies to transform into domestic","italic":"true","color":"yellow"}','{"text":"animals","italic":"true","color":"yellow"}','{"text":" ","italic":"true","color":"yellow"}','{"text":"Kills are still counted towards","italic":"true","color":"yellow"}','{"text":"the hostile totals","italic":"true","color":"yellow"}']},Enchantments:[{id:"minecraft:sharpness",lvl:2s}]}},Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1962 air if entity @e[tag=OrangeArenaStand] run kill @e[tag=OrangeArenaStand]
execute if entity @e[scores={ArenaRound=1..}] if block -12 51 1962 air if entity @a[nbt={Inventory:[{id:"minecraft:orange_concrete_powder"}]}] run clear @a[nbt={Inventory:[{id:"minecraft:orange_concrete_powder"}]}] orange_concrete_powder



# SPECIAL ABILITIES

# CORAL
tag @a remove ArenaSecret
tag @a[nbt={Inventory:[{tag:{ArenaSecret:1b}}]}] add ArenaSecret
execute if entity @a[tag=ArenaSecret] run scoreboard objectives add HealthBoost dummy
scoreboard players add @a[tag=ArenaSecret] HealthBoost 0
scoreboard players add @a[tag=ArenaSecret,scores={HealthBoost=..4}] HealthBoost 1
scoreboard players add @a[tag=!ArenaSecret,scores={HealthBoost=5..}] HealthBoost 1
scoreboard players set @a[tag=ArenaSecret,scores={HealthBoost=6..}] HealthBoost 3
effect give @a[tag=ArenaSecret,scores={HealthBoost=1}] health_boost 1000000 4 true
effect give @a[tag=ArenaSecret,scores={HealthBoost=1}] strength 1000000 1 true
effect clear @a[tag=!ArenaSecret,scores={HealthBoost=100..}] health_boost
effect clear @a[tag=!ArenaSecret,scores={HealthBoost=100..}] strength
scoreboard players reset @a[tag=!ArenaSecret,scores={HealthBoost=100..}] HealthBoost
advancement grant @a[tag=ArenaSecret] only d3:folder_c/tomb_raider


# REEDS
tag @a remove Greedy
tag @a[nbt={SelectedItem:{id:"minecraft:sugar_cane",tag:{TwiceCash:1b}}}] add Greedy
execute if entity @a[tag=Greedy] run scoreboard objectives add GreedyKill totalKillCount
execute unless entity @a[tag=Greedy] run scoreboard objectives remove GreedyKill
scoreboard players add @a[tag=Greedy,scores={GreedyKill=1..}] ArenaCash 1
scoreboard players reset @a GreedyKill


# SWORD
tag @a remove Dracula
tag @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",tag:{Dracula:1b}}}] add Dracula
execute if entity @a[tag=Dracula] run scoreboard objectives add DraculaKill totalKillCount
execute unless entity @a[tag=Dracula] run scoreboard objectives remove DraculaKill
effect give @a[tag=Dracula,scores={DraculaKill=1..}] regeneration 2 2 true
effect clear @a[tag=Dracula,scores={DraculaKill=1..}] poison
effect clear @a[tag=Dracula,scores={DraculaKill=1..}] slowness
effect clear @a[tag=Dracula,scores={DraculaKill=1..}] weakness
effect clear @a[tag=Dracula,scores={DraculaKill=1..}] wither
effect clear @a[tag=Dracula,scores={DraculaKill=1..}] nausea
scoreboard players reset @a DraculaKill


# ICE ARROWS
execute if entity @e[tag=ArenaAlcoveMob,nbt={ActiveEffects:[{Id:27b}]}] run tag @e[tag=ArenaAlcoveMob,nbt={ActiveEffects:[{Id:27b}]}] add FrozenMob
execute if entity @e[tag=FrozenMob] run scoreboard objectives add FrozenMob dummy
execute unless entity @e[tag=FrozenMob] run scoreboard objectives remove FrozenMob
scoreboard players add @e[tag=FrozenMob] FrozenMob 1
execute if entity @e[scores={FrozenMob=1}] run effect clear @e[scores={FrozenMob=1}] unluck
execute at @e[scores={FrozenMob=1}] run playsound entity.silverfish.step hostile @a ~ ~ ~ 1 0.5 0
execute as @e[scores={FrozenMob=1}] run data merge entity @s {NoAI:1b,Silent:1b}
execute as @e[tag=FrozenMob,nbt={OnGround:0b}] at @s if block ~ ~-0.1 ~ air run teleport @s ~ ~-1 ~
execute as @e[tag=FrozenMob,nbt={OnGround:0b}] at @s if block ~ ~-1.1 ~ red_sandstone_slab[type=bottom] run teleport @s ~ ~-0.5 ~
execute at @e[scores={FrozenMob=1..200}] run particle instant_effect ~ ~0.4 ~ 0.1 0.2 0.1 0 1 force
execute at @e[scores={FrozenMob=210..}] run particle splash ~ ~0.7 ~ 0.2 0.1 0.2 0 1 force
execute as @e[scores={FrozenMob=300..}] run data merge entity @s {NoAI:0b,Silent:0b}
execute as @e[scores={FrozenMob=300..}] run tag @s remove FrozenMob
scoreboard players reset @e[scores={FrozenMob=300..}] FrozenMob


# MAGNETIC MINE
#scoreboard objectives setdisplay sidebar MagnetTimer
execute if entity @e[type=turtle,nbt={CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"dark_gray\",\"text\":\"Magnetic Mine\"}"}] at @e[type=turtle] unless entity @e[tag=MagneticMine] run summon turtle ~ ~ ~ {Invulnerable:1b,PersistenceRequired:1b,Team:ArenaMob,Tags:["ArenaMob","ArenaTurtle","MagneticMine"]}
execute if entity @e[type=turtle,tag=!MagneticMine] as @e[type=turtle,tag=!MagneticMine] at @s run teleport @s ~ ~-100 ~
execute if entity @e[tag=MagneticMine] run scoreboard objectives add MagnetTimer dummy
execute if entity @e[tag=MagneticMine] run effect clear @e[type=turtle]
scoreboard players add @e[tag=MagneticMine] MagnetTimer 1
execute if entity @e[tag=MagneticMine] as @e[tag=ArenaAlcoveMob] at @e[tag=MagneticMine] run teleport @s[distance=..10] ^ ^ ^ facing entity @e[tag=MagneticMine,limit=1]
execute if entity @e[tag=MagneticMine] as @e[type=vex] at @e[tag=MagneticMine] run teleport @s[distance=..10] ^ ^ ^ facing entity @e[tag=MagneticMine,limit=1]
execute if entity @e[tag=MagneticMine] as @e[tag=ArenaAlcoveMob] at @e[tag=MagneticMine,distance=..2] run effect give @s slowness 1 10 true
execute at @e[tag=MagneticMine,scores={MagnetTimer=2400..}] run playsound entity.generic.explode master @a ~ ~ ~ 1 1 0
execute at @e[tag=MagneticMine,scores={MagnetTimer=2400..}] as @e[tag=ArenaAlcoveMob,distance=..2] run effect give @s instant_health 1 1 true
execute if entity @e[tag=MagneticMine,scores={MagnetTimer=2400..}] run kill @e[tag=MagneticMine,scores={MagnetTimer=2400..}]


# COMPANION FIX
#execute align x align y align z as @e[tag=ArenaWolf,x=-33,y=46,z=1944,dx=14,dy=3,dz=16,nbt=!{Sitting:1b}] run data merge entity @s {Sitting:1b}
#execute align x align y align z if entity @e[tag=ArenaWolf,x=-33,y=46,z=1944,dx=14,dy=3,dz=16,nbt={Sitting:1b}] run teleport @e[tag=ArenaWolf] 0 50 1963 180 0



# DOLPHIN SENTRY
tag @a remove BattleZone
execute align xyz as @a[x=-39,y=60,z=1972,dx=78,dy=10,dz=56] align xyz unless entity @s[x=-2,y=64,z=1971,dx=4,dy=4,dz=8] run tag @s add BattleZone

execute if entity @e[scores={SentryTimer=100..}] if entity @e[type=dolphin,nbt={CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"gray\",\"text\":\"Sentry\"}"}] if block 0 82 2000 air run function d3:arena/reset_sentry

execute if entity @e[type=dolphin,nbt={CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"gray\",\"text\":\"Sentry\"}"}] run scoreboard objectives add SentryTimer dummy
scoreboard players add @e[tag=MainArenaAEC] SentryTimer 0
scoreboard players add @e[scores={SentryTimer=0..}] SentryTimer 1
execute if entity @e[scores={SentryTimer=0..}] run function d3:arena/sentry

execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~ ~ grindstone run setblock ~ ~ ~ air destroy
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~1 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~1 ~ air destroy
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~2 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~2 ~ air destroy
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~3 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~3 ~ air destroy
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=Sentry] run playsound entity.dolphin.death master @a ~ ~ ~
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] run kill @e[tag=Sentry]
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] run kill @e[tag=SentryMarkerAEC]
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air run scoreboard objectives remove SentryTimer
execute if entity @e[scores={ArenaRound=..2,ArenaTimer=3502..}] if block 0 82 2000 air run scoreboard objectives remove SentryScan


# PASSIVIER
execute if block -12 51 1962 air if block 1 1 76 clay run setblock 1 1 76 white_concrete
execute if block 1 1 76 white_concrete if entity @e[type=egg] run scoreboard objectives add EggFound dummy
scoreboard players set @e[tag=MainArenaAEC] EggFound 0
execute if entity @e[type=egg] run scoreboard players set @e[tag=MainArenaAEC] EggFound 1
execute if entity @e[scores={EggFound=0}] run scoreboard objectives add Passivier dummy
scoreboard players add @e[tag=MainArenaAEC] Passivier 0
execute if entity @e[scores={Passivier=0..}] run function d3:arena/passivier
execute if block 1 1 76 white_concrete if entity @e[type=egg] run setblock 1 1 76 yellow_terracotta
execute if entity @e[scores={EggFound=0}] run scoreboard objectives remove EggFound


# LOOT BOX
#tag @a[nbt={Inventory:[{tag:{LootBox:1b}}]}] add LootBoxed

tag @a[nbt={Inventory:[{id:"minecraft:yellow_shulker_box"}]}] add LootBoxed
execute if entity @a[tag=LootBoxed] run clear @a[tag=LootBoxed] yellow_shulker_box
execute if entity @a[tag=LootBoxed] run setblock 8 47 1873 yellow_shulker_box
execute if block 8 47 1873 yellow_shulker_box run scoreboard objectives add LootBox minecraft.custom:minecraft.open_shulker_box
execute if entity @a[scores={LootBox=1..}] run function d3:arena/loot_boxed
execute if block 8 47 1873 air run scoreboard objectives remove LootBox
advancement grant @a[tag=LootBoxed] only d3:folder_c/gambler
tag @a remove LootBoxed



# LEVITATION BOMB
execute if entity @e[type=snowball] run scoreboard objectives add LeviBomb dummy
scoreboard players set @e[tag=MainArenaAEC] LeviBomb 0
execute if entity @e[type=snowball] run scoreboard players set @e[tag=MainArenaAEC] LeviBomb 1
execute if entity @e[scores={LeviBomb=0}] at @e[tag=ArenaAlcoveMob] run playsound block.conduit.activate hostile @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={LeviBomb=0}] at @e[tag=ArenaAlcoveMob] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 1 1.5 0
execute if entity @e[scores={LeviBomb=0}] run effect give @e[tag=ArenaAlcoveMob] levitation 15 1
#execute if entity @a[tag=LeviBomb] run say hi
execute unless entity @e[type=snowball] run scoreboard objectives remove LeviBomb