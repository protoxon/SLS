####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DarkAquaBush

# DARK AQUA
execute unless block 18 61 894 green_shulker_box run setblock 18 61 894 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 7 3 46 flower_pot if block 18 61 894 green_shulker_box run scoreboard objectives add DarkAquaBush dummy
execute if block 7 3 46 potted_dead_bush run scoreboard objectives remove DarkAquaBush
scoreboard players add @e[tag=MainHubAEC] DarkAquaBush 0
execute if block 18 61 894 green_shulker_box run scoreboard players add @e[scores={DarkAquaBush=0..100}] DarkAquaBush 1
execute if block 18 61 894 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{DarkAquaBush:1b}}]} run scoreboard objectives remove DarkAquaBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{DarkAquaBush:1b}}}] run scoreboard objectives remove DarkAquaBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{DarkAquaBush:1b}}]}] run scoreboard objectives remove DarkAquaBush
#execute if entity @e[scores={DarkAquaBush=100..}] run replaceitem block 18 61 894 container.13 dead_bush{display:{Name:"{\"text\":\"Excalibush\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",Lore:["This legendary Bush was given to a guy by an","old lady from some water. Then in 1963, the","guy had a cartoon made, where he told everyone","he grabbed it from a rock to become some king."]},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkAquaBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkAquaBush=100..}] run replaceitem block 18 61 894 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Excalibush ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",Lore:['{"text":"This legendary Bush was given to a guy by an","italic":"true","color":"dark_green"}','{"text":"old lady from some water. Then in 1963, the","italic":"true","color":"dark_green"}','{"text":"guy had a cartoon made, where he told everyone","italic":"true","color":"dark_green"}','{"text":"he grabbed it from a rock to become some king.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],DarkAquaBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={DarkAquaBush=100..}] run particle enchant 18 61.8 894 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={DarkAquaBush=100..}] run playsound entity.zombie_villager.converted master @a 18 61 894 0.5 1 0




