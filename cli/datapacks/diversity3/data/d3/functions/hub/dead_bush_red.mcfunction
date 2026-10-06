####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar RedBush

# RED
execute unless block 109 67 1053 green_shulker_box run setblock 109 67 1053 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 3 3 46 flower_pot if block 109 67 1053 green_shulker_box run scoreboard objectives add RedBush dummy
execute if block 3 3 46 potted_dead_bush run scoreboard objectives remove RedBush
scoreboard players add @e[tag=MainHubAEC] RedBush 0
execute if block 109 67 1053 green_shulker_box run scoreboard players add @e[scores={RedBush=0..100}] RedBush 1
execute if block 109 67 1053 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{RedBush:1b}}]} run scoreboard objectives remove RedBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{RedBush:1b}}}] run scoreboard objectives remove RedBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{RedBush:1b}}]}] run scoreboard objectives remove RedBush
#execute if entity @e[scores={RedBush=100..}] run replaceitem block 109 67 1053 container.13 dead_bush{display:{Name:"{\"text\":\"Hidden Bush\",\"italic\":\"false\",\"color\":\"red\"}",Lore:["This concealed Assassin's wrist-Bush first","required amputation of the ring finger, until","the 13th century, when it was altered so","that all fingers would be removed instead."]},Enchantments:[{id:"minecraft:lure",lvl:10}],RedBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={RedBush=100..}] run replaceitem block 109 67 1053 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Hidden Bush ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"red\"}",Lore:['{"text":"This concealed Assassin\'s wrist-Bush first","italic":"true","color":"dark_green"}','{"text":"required amputation of the ring finger, until","italic":"true","color":"dark_green"}','{"text":"the 13th century, when it was altered so","italic":"true","color":"dark_green"}','{"text":"that all fingers would be removed instead.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],RedBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={RedBush=100..}] run particle enchant 109 67.8 1053 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={RedBush=100..}] run playsound entity.zombie_villager.converted master @a 109 67 1053 0.5 1 0
