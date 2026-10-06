####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar YellowBush

# YELLOW
execute unless block -79 80 1016 green_shulker_box run setblock -79 80 1016 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 10 3 46 flower_pot if block -79 80 1016 green_shulker_box run scoreboard objectives add YellowBush dummy
execute if block 10 3 46 potted_dead_bush run scoreboard objectives remove YellowBush
scoreboard players add @e[tag=MainHubAEC] YellowBush 0
execute if block -79 80 1016 green_shulker_box run scoreboard players add @e[scores={YellowBush=0..100}] YellowBush 1
execute if block -79 80 1016 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{YellowBush:1b}}]} run scoreboard objectives remove YellowBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{YellowBush:1b}}}] run scoreboard objectives remove YellowBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{YellowBush:1b}}]}] run scoreboard objectives remove YellowBush
#execute if entity @e[scores={YellowBush=100..}] run replaceitem block -79 80 1016 container.13 dead_bush{display:{Name:"{\"text\":\"The Infinity Bush\",\"italic\":\"false\",\"color\":\"yellow\"}",Lore:["At full power, this fashionable thorned","mitten made the final blow in a $2 billion","war, resulting in the tragic elimination","of half the Dead Bushes in the universe."]},Enchantments:[{id:"minecraft:lure",lvl:10}],YellowBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={YellowBush=100..}] run replaceitem block -79 80 1016 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ The Infinity Bush ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"yellow\"}",Lore:['{"text":"At full power, this fashionable thorned","italic":"true","color":"dark_green"}','{"text":"mitten made the final blow in a $2 billion","italic":"true","color":"dark_green"}','{"text":"war, resulting in the tragic elimination","italic":"true","color":"dark_green"}','{"text":"of half the Dead Bushes in the universe.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],YellowBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={YellowBush=100..}] run particle enchant -79 80.8 1016 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={YellowBush=100..}] run playsound entity.zombie_villager.converted master @a -79 80 1016 0.5 1 0

