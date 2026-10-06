####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DarkPurpleBush

# DARK PURPLE
execute unless block 129 49 840 green_shulker_box run setblock 129 49 840 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 6 3 46 flower_pot if block 129 49 840 green_shulker_box run scoreboard objectives add DarkPurpleBush dummy
execute if block 6 3 46 potted_dead_bush run scoreboard objectives remove DarkPurpleBush
scoreboard players add @e[tag=MainHubAEC] DarkPurpleBush 0
execute if block 129 49 840 green_shulker_box run scoreboard players add @e[scores={DarkPurpleBush=0..100}] DarkPurpleBush 1
execute if block 129 49 840 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{DarkPurpleBush:1b}}]} run scoreboard objectives remove DarkPurpleBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{DarkPurpleBush:1b}}}] run scoreboard objectives remove DarkPurpleBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{DarkPurpleBush:1b}}]}] run scoreboard objectives remove DarkPurpleBush
#execute if entity @e[scores={DarkPurpleBush=100..}] run replaceitem block 129 49 840 container.13 dead_bush{display:{Name:"{\"text\":\"Bushnir\",\"italic\":\"false\",\"color\":\"dark_purple\"}",Lore:["Once wielded by a god, when thrown, this","mystical Bush would boomerang back, and","could even attach cool posters to his","bedroom walls or fix broken chairs."]},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkPurpleBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkPurpleBush=100..}] run replaceitem block 129 49 840 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Bushnir ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"dark_purple\"}",Lore:['{"text":"Once wielded by a god, when thrown, this","italic":"true","color":"dark_green"}','{"text":"mystical Bush would boomerang back, and","italic":"true","color":"dark_green"}','{"text":"could even attach cool posters to his","italic":"true","color":"dark_green"}','{"text":"bedroom walls or fix broken chairs.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkPurpleBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkPurpleBush=100..}] run particle enchant 129 49.8 840 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={DarkPurpleBush=100..}] run playsound entity.zombie_villager.converted master @a 129 49 840 0.5 1 0




