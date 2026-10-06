####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DarkRedBush

# DARK RED
execute unless block 104 94 965 green_shulker_box run setblock 104 94 965 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 4 3 46 flower_pot if block 104 94 965 green_shulker_box run scoreboard objectives add DarkRedBush dummy
execute if block 4 3 46 potted_dead_bush run scoreboard objectives remove DarkRedBush
scoreboard players add @e[tag=MainHubAEC] DarkRedBush 0
execute if block 104 94 965 green_shulker_box run scoreboard players add @e[scores={DarkRedBush=0..100}] DarkRedBush 1
execute if block 104 94 965 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{DarkRedBush:1b}}]} run scoreboard objectives remove DarkRedBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{DarkRedBush:1b}}}] run scoreboard objectives remove DarkRedBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{DarkRedBush:1b}}]}] run scoreboard objectives remove DarkRedBush
#execute if entity @e[scores={DarkRedBush=100..}] run replaceitem block 104 94 965 container.13 dead_bush{display:{Name:"{\"text\":\"Bush of Chaos\",\"italic\":\"false\",\"color\":\"dark_red\"}",Lore:["Forged in the darkest depths of Hades, this","chained Bush was used by a guy with red","swirly tattoos to hunt a War God for pulling","a really mean prank that gave him bad dreams."]},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkRedBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkRedBush=100..}] run replaceitem block 104 94 965 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Bush of Chaos ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"dark_red\"}",Lore:['{"text":"Forged in the darkest depths of Hades, this","italic":"true","color":"dark_green"}','{"text":"chained Bush was used by a guy with red","italic":"true","color":"dark_green"}','{"text":"swirly tattoos to hunt a War God for pulling","italic":"true","color":"dark_green"}','{"text":"a really mean prank that gave him bad dreams.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkRedBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkRedBush=100..}] run particle enchant 104 94.8 965 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={DarkRedBush=100..}] run playsound entity.zombie_villager.converted master @a 104 94 965 0.5 1 0

