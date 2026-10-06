####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 19 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar GoldBush

# GOLD
execute unless block -19 118 1092 green_shulker_box run setblock -19 118 1092 green_shulker_box[facing=up]{CustomName:"{\"text\":\"Shecret Weapon Box\"}"}
execute if block 11 3 46 flower_pot run scoreboard objectives add GoldBush dummy
execute if block 11 3 46 potted_dead_bush run scoreboard objectives remove GoldBush
scoreboard players add @e[tag=MainHubAEC] GoldBush 0
execute if block -19 118 1092 green_shulker_box run scoreboard players add @e[scores={GoldBush=0..100}] GoldBush 1
execute if block -19 118 1092 green_shulker_box{Items:[{id:"minecraft:dead_bush",tag:{GoldBush:1b}}]} run scoreboard objectives remove GoldBush
execute if entity @e[nbt={Item:{id:"minecraft:dead_bush",tag:{GoldBush:1b}}}] run scoreboard objectives remove GoldBush
execute if entity @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{GoldBush:1b}}]}] run scoreboard objectives remove GoldBush
#execute if entity @e[scores={GoldBush=100..}] run replaceitem block -19 118 1092 container.13 dead_bush{display:{Name:"{\"text\":\"Bush of Gryffindead\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:["This magical Bush was once given to a","a British wizard named Scarface by a","talking hat and used in a highschool war","to chop a snake's head off in slow motion."]},Enchantments:[{id:"minecraft:lure",lvl:10}],GoldBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={GoldBush=100..}] run replaceitem block -19 118 1092 container.13 dead_bush{display:{Name:"{\"text\":\"ᚼ The Bush of Gryffindead ᚼ\",\"bold\":\"true\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"This magical Bush was once given to","italic":"true","color":"dark_green"}','{"text":"a British wizard named Scarface by a","italic":"true","color":"dark_green"}','{"text":"talking hat and used in a highschool war","italic":"true","color":"dark_green"}','{"text":"to chop a snake\'s head off in slow motion.","italic":"true","color":"dark_green"}']},Enchantments:[{id:"minecraft:lure",lvl:10}],GoldBush:1b,ShecretBush:1b} 1

execute if entity @e[scores={GoldBush=100..}] run particle enchant -19 118.8 1092 0.1 0.3 0.1 0.8 100
execute if entity @e[scores={GoldBush=100..}] run playsound entity.zombie_villager.converted master @a -19 118 1092 0.5 1 0
