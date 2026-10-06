####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 31 2018 / JULY 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# WEAPONS / ARMOR
execute unless entity @e[tag=ArenaTrader1] run summon villager 13 50 1950 {CustomName:"{\"text\":\"Bob\",\"color\":\"none\"}",CustomNameVisible:false,Silent:true,NoAI:true,Invulnerable:true,VillagerData:{profession:"minecraft:armorer",type:"minecraft:desert",level:6},Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",Count:2b},sell:{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:3b},sell:{id:"minecraft:shield",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:5b},sell:{id:"minecraft:bow",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:1b},sell:{id:"minecraft:arrow",Count:3b},uses:0,maxUses:9999,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:8b},sell:{id:"minecraft:iron_boots",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:14b},sell:{id:"minecraft:iron_leggings",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:16b},sell:{id:"minecraft:iron_chestplate",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:10b},sell:{id:"minecraft:iron_helmet",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},]},PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaVillager","ArenaTrader","ArenaTrader1"]}


#VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains",level:6},

#{buy:{id:"minecraft:gold_nugget",Count:4b},sell:{id:"minecraft:chainmail_boots",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:7b},sell:{id:"minecraft:chainmail_leggings",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:8b},sell:{id:"minecraft:chainmail_chestplate",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:5b},sell:{id:"minecraft:chainmail_helmet",Count:1b,tag:{Unbreakable:0b}},uses:0,maxUses:99,rewardExp:0b},


# ITEMS
execute unless entity @e[tag=ArenaTrader2] run summon villager 13 50 1954 {CustomName:"{\"text\":\"Doug\",\"color\":\"none\"}",CustomNameVisible:false,Silent:true,NoAI:true,Invulnerable:true,VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:jungle",level:6},Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",Count:3b},sell:{id:"minecraft:stone_pickaxe",Count:1b,tag:{HideFlags:2,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:1s}],display:{Name:"{\"text\":\"Spawner Smasher\",\"italic\":\"false\",\"color\":\"yellow\"}",Lore:["Required to destroy spawners"]},CanDestroy:["minecraft:spawner"]}},uses:0,maxUses:12,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:2b},sell:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:healing"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_nugget",Count:5b},sell:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:2b},sell:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:3b},sell:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strength"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:5b},sell:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_strength"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_ingot",Count:2b},sell:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:strong_regeneration"}},uses:0,maxUses:10,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:green_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Green Smash Token\",\"italic\":\"false\",\"color\":\"dark_green\"}",Lore:['{"text":"Opens Reeds of Greed case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:green_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:light_blue_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Light Blue Smash Token\",\"italic\":\"false\",\"color\":\"blue\"}",Lore:['{"text":"Opens Godplate case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:light_blue_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:brown_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Brown Smash Token\",\"italic\":\"false\",\"color\":\"dark_red\"}",Lore:['{"text":"Opens Penny Pincher case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:brown_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:cyan_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Cyan Smash Token\",\"italic\":\"false\",\"color\":\"aqua\"}",Lore:['{"text":"Opens Ocean Fork case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:cyan_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:red_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Red Smash Token\",\"italic\":\"false\",\"color\":\"red\"}",Lore:['{"text":"Opens Dracula Blade case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:red_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:white_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"White Smash Token\",\"italic\":\"false\",\"color\":\"white\"}",Lore:['{"text":"Opens Ice Arrows case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:white_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:black_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Black Smash Token\",\"italic\":\"false\",\"color\":\"dark_gray\"}",Lore:['{"text":"Opens Magnetic Mine case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:black_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:light_gray_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Light Grey Smash Token\",\"italic\":\"false\",\"color\":\"gray\"}",Lore:['{"text":"Opens Sentry case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:light_gray_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b},{buy:{id:"minecraft:gold_block",Count:1b},sell:{id:"minecraft:orange_concrete_powder",Count:1b,tag:{display:{Name:"{\"text\":\"Orange Smash Token\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Opens Passivier case","italic":"true","color":"yellow"}']},CanDestroy:["minecraft:orange_stained_glass"],Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1}},uses:0,maxUses:1,rewardExp:0b}]},PersistenceRequired:1b,Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaVillager","ArenaTrader","ArenaTrader2"]}


#['{"text":"Opens Passivier case","italic":"true","color":"yellow"}']


execute unless entity @e[tag=TraderFrame1] run summon item_frame 14 51 1949 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:iron_sword",Count:1b},Tags:["TraderFrame","TraderFrame1"]}
execute unless entity @e[tag=TraderFrame2] run summon item_frame 14 51 1950 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:iron_chestplate",Count:1b},Tags:["TraderFrame","TraderFrame2"]}
execute unless entity @e[tag=TraderFrame3] run summon item_frame 14 51 1951 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:bow",Count:1b},Tags:["TraderFrame","TraderFrame3"]}

execute unless entity @e[tag=TraderFrame4] run summon item_frame 14 51 1953 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:stone_pickaxe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1s}]}},Tags:["TraderFrame","TraderFrame4"]}
execute unless entity @e[tag=TraderFrame5] run summon item_frame 14 51 1954 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:healing"}},Tags:["TraderFrame","TraderFrame5"]}
execute unless entity @e[tag=TraderFrame6] run summon item_frame 14 51 1955 {Invulnerable:1b,Silent:1b,Facing:4b,Item:{id:"minecraft:light_gray_concrete_powder",Count:1b,tag:{Enchantments:[{id:"minecraft:fire_aspect",lvl:1s}]}},Tags:["TraderFrame","TraderFrame6"]}


execute as @e[tag=TraderFrame,tag=!TraderFrame6,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}
execute as @e[tag=TraderFrame6,nbt=!{ItemRotation:1b}] run data merge entity @s {ItemRotation:1b}



execute as @e[tag=ArenaVillager] at @s if entity @a[distance=..5] run data merge entity @s[nbt={Silent:1b}] {Silent:0b}
execute as @e[tag=ArenaVillager] at @s unless entity @a[distance=..5] run data merge entity @s[nbt=!{Silent:1b}] {Silent:1b}
execute as @e[tag=ArenaTrader] at @s if entity @a[distance=..10] run teleport @s ^ ^ ^ facing entity @p
execute as @e[tag=ArenaTrader1,nbt=!{Rotation:[90f,0f]}] at @s unless entity @a[distance=..10] run data merge entity @s {Rotation:[90f,0f]}
execute as @e[tag=ArenaTrader2,nbt=!{Rotation:[90f,0f]}] at @s unless entity @a[distance=..10] run data merge entity @s {Rotation:[90f,0f]}
execute as @e[tag=ArenaTrader3,nbt=!{Rotation:[180f,20f]}] at @s unless entity @a[distance=..10] run data merge entity @s {Rotation:[180f,20f]}
#execute as @e[type=villager] run data merge entity @s {Willing:0}


# TP ITEMS THAT FALL BEHIND COUNTER
execute align x align y align z as @e[type=item,x=13,y=50,z=1949,dx=2,dy=2,dz=9] at @s run teleport @s 11 ~ ~







# MCKENZIE
execute unless entity @e[tag=ArenaTrader3] run summon villager 10 47 1875 {CustomName:"{\"text\":\"Pearson\",\"color\":\"none\"}",CustomNameVisible:false,Silent:true,NoAI:true,Invulnerable:true,VillagerData:{profession:"minecraft:leatherworker",type:"minecraft:snow",level:6},Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",Count:2b},buyB:{id:"minecraft:gold_nugget",Count:49b},sell:{id:"minecraft:yellow_shulker_box",Count:1b,tag:{display:{Name:"{\"text\":\"Loot Shulker\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Purchase this container for a","italic":"true","color":"yellow"}','{"text":"chance at some special mystery","italic":"true","color":"yellow"}','{"text":"items that could enhance your","italic":"true","color":"yellow"}','{"text":"experience in the Arena™!","italic":"true","color":"yellow"}','{"text":" ","italic":"true","color":"yellow"}','{"text":"But it\'s totally your choice.","italic":"true","color":"yellow"}']}}},uses:0,maxUses:1,rewardExp:0b}]},PersistenceRequired:1b,Rotation:[180f,0f],Team:ArenaMob,Tags:["ArenaVillager","ArenaTrader","ArenaTrader3"]}
