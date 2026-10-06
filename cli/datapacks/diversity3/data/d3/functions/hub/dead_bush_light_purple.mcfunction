####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LightPurpleBush

# LIGHT PURPLE
execute unless block -35 67 901 green_shulker_box run setblock -35 67 901 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 8 3 46 flower_pot if block -35 67 901 green_shulker_box run scoreboard objectives add LightPurpleBush dummy
execute if block 8 3 46 potted_dead_bush run scoreboard objectives remove LightPurpleBush
scoreboard players add @e[tag=MainHubAEC] LightPurpleBush 0
execute if block -35 67 901 green_shulker_box run scoreboard players add @e[scores={LightPurpleBush=0..100}] LightPurpleBush 1
execute if block -35 67 901 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{LightPurpleBush:1b}}]} run scoreboard objectives remove LightPurpleBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{LightPurpleBush:1b}}}] run scoreboard objectives remove LightPurpleBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{LightPurpleBush:1b}}]}] run scoreboard objectives remove LightPurpleBush
#execute if entity @e[scores={LightPurpleBush=100..}] run replaceitem block -35 67 901 container.13 dead_bush{display:{Name:"{\"text\":\"Bushille\",\"italic\":\"false\",\"color\":\"light_purple\"}",Lore:["This wire-wrapped Bush was created by the","leader of a post-apocalyptic community in","honour of his deceased wife, to defeat any","who would bring harm upon him or his people."]},Enchantments:[{id:"minecraft:lure",lvl:10}],LightPurpleBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={LightPurpleBush=100..}] run replaceitem block -35 67 901 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ Bushille ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"light_purple\"}",Lore:['{"text":"This wire-wrapped Bush was created by the","italic":"true","color":"dark_green"}','{"text":"leader of a post-apocalyptic community in","italic":"true","color":"dark_green"}','{"text":"honour of his deceased wife, to defeat any","italic":"true","color":"dark_green"}','{"text":"who would bring harm upon him or his people.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],LightPurpleBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={LightPurpleBush=100..}] run particle enchant -35 67.8 901 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={LightPurpleBush=100..}] run playsound entity.zombie_villager.converted master @a -35 67 901 0.5 1 0



