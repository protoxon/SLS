####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 17 2019 / JULY 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

data merge entity @e[tag=ArenaTrader3,limit=1] {Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",Count:2b},buyB:{id:"minecraft:gold_nugget",Count:49b},sell:{id:"minecraft:yellow_shulker_box",Count:1b,tag:{display:{Name:"{\"text\":\"Loot Shulker\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Purchase this container for a","italic":"true","color":"gold"}','{"text":"chance at some special mystery","italic":"true","color":"gold"}','{"text":"items that could enhance your","italic":"true","color":"gold"}','{"text":"experience in the Arena™!","italic":"true","color":"gold"}','{"text":" ","italic":"true","color":"gold"}','{"text":"But it\'s totally your choice.","italic":"true","color":"gold"}']}}},uses:0,maxUses:1,rewardExp:0b}]}}

summon area_effect_cloud 8 47 1873 {Tags:["LBCreeperHeadAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBStickAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBSlimeBlockAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBPumpkinAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBPaintingAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBGhastTearAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBPaperAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBDiamondAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBClayAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBBottleAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBBannerAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBPackedIceAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBSandAEC","ArenaLootBoxAEC"],Duration:20}
summon area_effect_cloud 8 47 1873 {Tags:["LBPressurePlateAEC","ArenaLootBoxAEC"],Duration:20}


execute if block 8 7 78 gold_block run kill @e[tag=ArenaLootBoxAEC,sort=random,limit=11]

setblock 8 47 1873 air destroy
particle cloud 8 47.5 1873 0.3 0.3 0.3 0 50
#playsound entity.ghast.death master @a 8 47.5 1873 1 1 0
playsound entity.evoker.cast_spell master @a 8 47.5 1873 0.5 0.5 0
playsound block.conduit.attack.target master @a 8 47.5 1873 1 1.5 0
playsound entity.ender_eye.death ambient @a 8 47.5 1873 1 0.7 0


# ONLY FIRST TIME
execute if block 8 7 78 clay run kill @e[tag=ArenaLootBoxAEC,sort=random,limit=12]
execute if block 8 7 78 clay run summon area_effect_cloud 8 47 1873 {Tags:["LBLeviBombAEC","ArenaLootBoxAEC"],Duration:20}
execute if block 8 7 78 clay run setblock 8 7 78 gold_block

# LEVI BOMB
execute if entity @e[tag=LBLeviBombAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:snowball",Count:1b,tag:{HideFlags:3,display:{Name:"{\"text\":\"Levitation Bomb\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"*** ONE-TIME USE ***","italic":"true","color":"gold"}','{"text":"*** DOES NOT WORK ON BOSSES ***","italic":"true","color":"gold"}','{"text":"----------------------------","italic":"true","color":"gold"}','{"text":"Toss this little thing when you\'re","italic":"true","color":"gold"}','{"text":"overwhelmed by attackers and all","italic":"true","color":"gold"}','{"text":"present Arena™ enemies will rise","italic":"true","color":"gold"}','{"text":" ","italic":"true","color":"gold"}','{"text":"up, giving you an unfair advantage","italic":"true","color":"gold"}']},Enchantments:[{id:"minecraft:lure",lvl:2s}]}},Tags:["ArenaLootBoxItem"]}

# CREEPER HEAD
execute if entity @e[tag=LBCreeperHeadAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:creeper_head",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Cosmetic Mask\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Present yourself as one of those","italic":"true","color":"gold"}','{"text":"pesky Arena™ foes and see if","italic":"true","color":"gold"}','{"text":"your friends can even pick you","italic":"true","color":"gold"}','{"text":"out of the battle!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# STICK
execute if entity @e[tag=LBStickAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:stick",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Historical Replica\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"You\'ll be the talk of the town","italic":"true","color":"gold"}','{"text":"with this commemorative immitation","italic":"true","color":"gold"}','{"text":"weapon from the Arena™ battles","italic":"true","color":"gold"}','{"text":"of long ago!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# SLIME BLOCK
execute if entity @e[tag=LBSlimeBlockAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:slime_block",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Slime Action Figure\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Decorate your shelf with this","italic":"true","color":"gold"}','{"text":"special 20th Anniversary Edition","italic":"true","color":"gold"}','{"text":"scale model the fan favourite","italic":"true","color":"gold"}','{"text":"foe, the dreaded Evil Slime!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# PUMPKIN
execute if entity @e[tag=LBPumpkinAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:carved_pumpkin",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"GolemVision™ Helmet\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Watch the entire battle in style!","italic":"true","color":"gold"}','{"text":"This wearable utility mask simulates","italic":"true","color":"gold"}','{"text":"the actual vision of a real-life Golem!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# PAINTING
execute if entity @e[tag=LBPaintingAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:painting",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Mystery Art\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Decorate your bedroom with this","italic":"true","color":"gold"}','{"text":"magical changing portrait.","italic":"true","color":"gold"}','{"text":"Each time you hang this painting,","italic":"true","color":"gold"}','{"text":"the result is a new surprise!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# GHAST TEAR
execute if entity @e[tag=LBGhastTearAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:ghast_tear",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Unhappy Gem\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Your friends will be jealous of this","italic":"true","color":"gold"}','{"text":"Limited Edition replica artifact of the","italic":"true","color":"gold"}','{"text":"flying fire-spewing screech monster","italic":"true","color":"gold"}','{"text":"of the mythical Lava Dimension!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# PAPER
execute if entity @e[tag=LBPaperAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:paper",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"AdamDJM's Autograph\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Dearest Buyer,","italic":"true","color":"gold"}','{"text":"You\'re the real hero!","italic":"true","color":"gold"}','{"text":" ","italic":"true","color":"gold"}','{"text":"Your friend,","italic":"true","color":"gold"}','{"text":"- AdamDJM","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# DIAMOND
execute if entity @e[tag=LBDiamondAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:diamond",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Old World Money\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"This ancient tricket was the","italic":"true","color":"gold"}','{"text":"accepted currency long ago","italic":"true","color":"gold"}','{"text":"in the Trade Shop during the","italic":"true","color":"gold"}','{"text":"Arena™ Battles of Diversity 2","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# CLAY
execute if entity @e[tag=LBClayAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:clay_ball",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Modeling Putty\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Now you can create your own miniature","italic":"true","color":"gold"}','{"text":"Arena baddies! You can even paint \'em","italic":"true","color":"gold"}','{"text":"and compare with your friends who\'s","italic":"true","color":"gold"}','{"text":"got the coolest looking statue!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# BOTTLE
execute if entity @e[tag=LBBottleAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:glass_bottle",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"White's Breath\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"This bottle contains the actual","italic":"true","color":"gold"}','{"text":"breath of Mr. White, the first","italic":"true","color":"gold"}','{"text":"Arena™ champion, after the famous","italic":"true","color":"gold"}','{"text":"\'Test of the Resource Packs\' battle.","italic":"true","color":"gold"}','{"text":" ","italic":"true","color":"gold"}','{"text":"Just don\'t open it and let it escape!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# BANNER
execute if entity @e[tag=LBBannerAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:yellow_banner",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Official Arena™ Cloth\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Support your local Arena™ with","italic":"true","color":"gold"}','{"text":"this portable authentic bath towel","italic":"true","color":"gold"}','{"text":"and dry off with these colours to","italic":"true","color":"gold"}','{"text":"show your family you\'re a true fan!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# PACKED ICE
execute if entity @e[tag=LBPackedIceAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:packed_ice",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Icepak\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Relax after a hard day of battle","italic":"true","color":"gold"}','{"text":"with this pain relief ice pack","italic":"true","color":"gold"}','{"text":"that decreases swelling of muscles","italic":"true","color":"gold"}','{"text":"and joints and soothes pain","italic":"true","color":"gold"}','{"text":" ","italic":"true","color":"gold"}','{"text":"*** Keep frozen ***","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# SAND
execute if entity @e[tag=LBSandAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:sand",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Authentic Arena Sand\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Hold on to a piece of history","italic":"true","color":"gold"}','{"text":"with this sample of the actual","italic":"true","color":"gold"}','{"text":"sand used in the very first","italic":"true","color":"gold"}','{"text":"Diversity Arena™ floor!","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

# GOLD PRESSURE PLATE
execute if entity @e[tag=LBPressurePlateAEC] run summon item 8 47.5 1873 {Item:{id:"minecraft:light_weighted_pressure_plate",Count:1b,tag:{HideFlags:2,display:{Name:"{\"text\":\"Golden Ticket\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"A special certificate inviting you","italic":"true","color":"gold"}','{"text":"on the first day of February at","italic":"true","color":"gold"}','{"text":"ten o\'clock sharp to take a tour","italic":"true","color":"gold"}','{"text":"at a famous chocolate factory","italic":"true","color":"gold"}']}}},Tags:["ArenaLootBoxItem"]}

#Purchase this container for a

tag @e[tag=ArenaLootBoxItem,sort=random,limit=1] add ArenaLootBoxItem1
tag @e[tag=ArenaLootBoxItem,sort=random,limit=1,tag=!ArenaLootBoxItem1] add ArenaLootBoxItem2
tag @e[tag=ArenaLootBoxItem,sort=random,limit=1,tag=!ArenaLootBoxItem1,tag=!ArenaLootBoxItem2] add ArenaLootBoxItem3

data merge entity @e[tag=ArenaLootBoxItem1,limit=1] {NoGravity:0b,Motion:[0.05d,0.2d,0.05d]}
data merge entity @e[tag=ArenaLootBoxItem2,limit=1] {NoGravity:0b,Motion:[0.1d,0.2d,0.1d]}
data merge entity @e[tag=ArenaLootBoxItem3,limit=1] {NoGravity:0b,Motion:[0.05d,0.2d,-0.05d]}




#Motion:[0.0d,0.2d,0.0d],





scoreboard objectives remove LootBox
tag @a remove LootBoxed
