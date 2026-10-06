####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar GreenBush

# GREEN
execute unless block -84 68 991 green_shulker_box run setblock -84 68 991 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 9 3 46 flower_pot if block -84 68 991 green_shulker_box run scoreboard objectives add GreenBush dummy
execute if block 9 3 46 potted_dead_bush run scoreboard objectives remove GreenBush
scoreboard players add @e[tag=MainHubAEC] GreenBush 0
execute if block -84 68 991 green_shulker_box run scoreboard players add @e[scores={GreenBush=0..100}] GreenBush 1
execute if block -84 68 991 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{GreenBush:1b}}]} run scoreboard objectives remove GreenBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{GreenBush:1b}}}] run scoreboard objectives remove GreenBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{GreenBush:1b}}]}] run scoreboard objectives remove GreenBush
#execute if entity @e[scores={GreenBush=100..}] run replaceitem block -84 68 991 container.13 dead_bush{display:{Name:"{\"text\":\"Luke's Lightsabush\",\"italic\":\"false\",\"color\":\"green\"}",Lore:["This Bush of illumination was once wielded","by a desert farmboy to spar against his","telekinetic cyborg dad over the unfair","expansion of his dad's boss's organization."]},Enchantments:[{id:"minecraft:lure",lvl:10}],GreenBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={GreenBush=100..}] run replaceitem block -84 68 991 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Luke's Lightsabush ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"green\"}",Lore:['{"text":"This Bush of illumination was once wielded","italic":"true","color":"dark_green"}','{"text":"by a desert farmboy to spar against his","italic":"true","color":"dark_green"}','{"text":"telekinetic cyborg dad over the unfair","italic":"true","color":"dark_green"}','{"text":"expansion of his dad\'s boss\'s organization.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],GreenBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={GreenBush=100..}] run particle enchant -84 68.8 991 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={GreenBush=100..}] run playsound entity.zombie_villager.converted master @a -84 68 991 0.5 1 0


