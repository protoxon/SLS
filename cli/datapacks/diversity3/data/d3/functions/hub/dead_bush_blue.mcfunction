####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlueBush

# BLUE
execute unless block 75 112 938 green_shulker_box run setblock 75 112 938 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 5 3 46 flower_pot if block 75 112 938 green_shulker_box run scoreboard objectives add BlueBush dummy
execute if block 5 3 46 potted_dead_bush run scoreboard objectives remove BlueBush
scoreboard players add @e[tag=MainHubAEC] BlueBush 0
execute if block 75 112 938 green_shulker_box run scoreboard players add @e[scores={BlueBush=0..100}] BlueBush 1
execute if block 75 112 938 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{BlueBush:1b}}]} run scoreboard objectives remove BlueBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{BlueBush:1b}}}] run scoreboard objectives remove BlueBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{BlueBush:1b}}]}] run scoreboard objectives remove BlueBush
#execute if entity @e[scores={BlueBush=100..}] run replaceitem block 75 112 938 container.13 dead_bush{display:{Name:"{\"text\":\"Mega Bushter\",\"italic\":\"false\",\"color\":\"blue\"}",Lore:["Created by Santa, this mechanical arm Bush","was the main weapon used by the Jamaican","robot, Mega Mon, to battle his evil robotic","family members for having ridiculous names."]},Enchantments:[{id:"minecraft:lure",lvl:10}],BlueBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={BlueBush=100..}] run replaceitem block 75 112 938 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Mega Bushter ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"blue\"}",Lore:['{"text":"Created by Santa, this mechanical arm Bush","italic":"true","color":"dark_green"}','{"text":"was the main weapon used by the Jamaican","italic":"true","color":"dark_green"}','{"text":"robot, Mega Mon, to battle his evil robotic","italic":"true","color":"dark_green"}','{"text":"family members for having ridiculous names.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],BlueBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={BlueBush=100..}] run particle enchant 75 112.8 938 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={BlueBush=100..}] run playsound entity.zombie_villager.converted master @a 75 112 938 0.5 1 0

