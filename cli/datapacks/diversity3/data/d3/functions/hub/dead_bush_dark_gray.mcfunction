####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019 / SEPTEMBER 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DarkGrayBush

# DARK GRAY
execute unless block 38 84 1102 green_shulker_box run setblock 38 84 1102 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 2 3 46 flower_pot if block 38 84 1102 green_shulker_box run scoreboard objectives add DarkGrayBush dummy
execute if block 2 3 46 potted_dead_bush run scoreboard objectives remove DarkGrayBush
scoreboard players add @e[tag=MainHubAEC] DarkGrayBush 0
execute if block 38 84 1102 green_shulker_box run scoreboard players add @e[scores={DarkGrayBush=0..100}] DarkGrayBush 1
execute if block 38 84 1102 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{DarkGrayBush:1b}}]} run scoreboard objectives remove DarkGrayBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{DarkGrayBush:1b}}}] run scoreboard objectives remove DarkGrayBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{DarkGrayBush:1b}}]}] run scoreboard objectives remove DarkGrayBush
#execute if entity @e[scores={DarkGrayBush=100..}] run replaceitem block 38 84 1102 container.13 dead_bush{display:{Name:"{\"text\":\"Busharang\",\"italic\":\"false\",\"color\":\"dark_gray\"}",Lore:["Designed by a ninja, this projectile was","thrown from the shadows to disarm criminals","causing them demand why someone would hide","in the dark and toss Dead Bushes at them."]},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkGrayBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkGrayBush=100..}] run replaceitem block 38 84 1102 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Busharang ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"dark_gray\"}",Lore:['{"text":"Designed by a ninja, this projectile was","italic":"true","color":"dark_green"}','{"text":"thrown from the shadows to disarm criminals","italic":"true","color":"dark_green"}','{"text":"causing them to demand why someone would hide","italic":"true","color":"dark_green"}','{"text":"in the dark and toss Dead Bushes at them.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkGrayBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkGrayBush=100..}] run particle enchant 38 84.8 1102 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={DarkGrayBush=100..}] run playsound entity.zombie_villager.converted master @a 38 84 1102 0.5 1 0
