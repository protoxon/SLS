####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AquaBush

# AQUA
execute unless block 30 126 1018 green_shulker_box run setblock 30 126 1018 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 12 3 46 flower_pot if block 30 126 1018 green_shulker_box run scoreboard objectives add AquaBush dummy
execute if block 12 3 46 potted_dead_bush run scoreboard objectives remove AquaBush
scoreboard players add @e[tag=MainHubAEC] AquaBush 0
execute if block 30 126 1018 green_shulker_box run scoreboard players add @e[scores={AquaBush=0..100}] AquaBush 1
execute if block 30 126 1018 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{AquaBush:1b}}]} run scoreboard objectives remove AquaBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{AquaBush:1b}}}] run scoreboard objectives remove AquaBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{AquaBush:1b}}]}] run scoreboard objectives remove AquaBush
#execute if entity @e[scores={AquaBush=100..}] run replaceitem block 30 126 1018 container.13 dead_bush{display:{Name:"{\"text\":\"The Master Bush\",\"italic\":\"false\",\"color\":\"aqua\"}",Lore:["This legendary Bush of Evil's Bane was","once wielded by a Hero of Time and used","to defeat a giant evil warthog to free","a captive princess with a triangle tattoo."]},Enchantments:[{id:"minecraft:lure",lvl:10}],AquaBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={AquaBush=100..}] run replaceitem block 30 126 1018 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ The Master Bush ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"aqua\"}",Lore:['{"text":"This legendary Bush of Evil\'s Bane was","italic":"true","color":"dark_green"}','{"text":"once wielded by a Hero of Time and used","italic":"true","color":"dark_green"}','{"text":"to defeat a giant evil warthog to free","italic":"true","color":"dark_green"}','{"text":"a captive princess with a triangle tattoo.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],AquaBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={AquaBush=100..}] run particle enchant 30 126.8 1018 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={AquaBush=100..}] run playsound entity.zombie_villager.converted master @a 30 126 1018 0.5 1 0