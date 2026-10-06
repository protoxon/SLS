####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / OCTOBER 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DarkGreenBush

# DARK GREEN
execute unless block 25 40 1012 green_shulker_box run setblock 25 40 1012 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 1 3 46 flower_pot if block 25 40 1012 green_shulker_box run scoreboard objectives add DarkGreenBush dummy
execute if block 1 3 46 potted_dead_bush run scoreboard objectives remove DarkGreenBush
scoreboard players add @e[tag=MainHubAEC] DarkGreenBush 0
execute if block 25 40 1012 green_shulker_box run scoreboard players add @e[scores={DarkGreenBush=0..100}] DarkGreenBush 1
execute if block 25 40 1012 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{DarkGreenBush:1b}}]} run scoreboard objectives remove DarkGreenBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{DarkGreenBush:1b}}}] run scoreboard objectives remove DarkGreenBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{DarkGreenBush:1b}}]}] run scoreboard objectives remove DarkGreenBush
#execute if entity @e[scores={DarkGreenBush=100..}] run replaceitem block 25 40 1012 container.13 dead_bush{display:{Name:"{\"text\":\"Exbushimental MIRV\",\"italic\":\"false\",\"color\":\"dark_green\"}",Lore:["This pre-War Capital Wasteland launcher could","fire up to 8 mini-Bushes. Unfortunately this","did little damage, resulting in the launcher","being useless apart from its prickly thorns."]},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkGreenBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkGreenBush=100..}] run replaceitem block 25 40 1012 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Exbushimental MIRV ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"dark_green\"}",Lore:['{"text":"This pre-War Capital Wasteland launcher could","italic":"true","color":"dark_green"}','{"text":"fire up to 8 mini-Bushes. Unfortunately this","italic":"true","color":"dark_green"}','{"text":"did little damage, resulting in the launcher","italic":"true","color":"dark_green"}','{"text":"being useless apart from its prickly thorns.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkGreenBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkGreenBush=100..}] run particle enchant 25 40.8 1012 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={DarkGreenBush=100..}] run playsound entity.zombie_villager.converted master @a 25 40 1012 0.5 1 0
