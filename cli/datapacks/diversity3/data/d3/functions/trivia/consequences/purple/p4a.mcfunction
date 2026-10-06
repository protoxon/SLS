####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 72 994

#scoreboard objectives setdisplay sidebar Incorrect_P4A
#scoreboard objectives setdisplay sidebar P4APotion
#scoreboard objectives setdisplay sidebar P4AArmor

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=850,y=67,z=968,dx=20,dy=10,dz=30] add WrongAnswer

scoreboard objectives add Incorrect_P4A dummy
execute align x align y align z if entity @a[x=850,y=67,z=968,dx=20,dy=10,dz=30] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P4A 1

execute if entity @e[scores={Incorrect_P4A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P4A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P4A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P4A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P4A=1}] run title @a subtitle {"text":"Creeper Dungeon is a Hypixel map", "color":"white"}
execute if entity @e[scores={Incorrect_P4A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Creeper Dungeon is a 2012 Arena map made to celebrate 50 000 subscribers for the Hypixel YouTube channel. Think you can take on the creepers?","color":"red"}]


execute if entity @e[scores={Incorrect_P4A=1}] as @e[tag=P4AVillager] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_P4A=1}] as @e[tag=P4AVillager] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P4A=1}] as @e[tag=P4ASkeleton] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_P4A=5}] run summon villager 856 70 988 {Offers: {Recipes: [{maxUses: 7, buy: {id: "minecraft:gunpowder", Count: 3b}, sell: {id: "minecraft:cooked_beef", Count: 1b}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gunpowder", Count: 8b}, sell: {id: "minecraft:potion", Count: 1b, tag: {Potion: "minecraft:water"}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gunpowder", Count: 10b}, sell: {id: "minecraft:potion", Count: 1b, tag: {Potion: "minecraft:water"}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gunpowder", Count: 10b}, sell: {id: "minecraft:potion", Count: 1b, tag: {Potion: "minecraft:water"}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gunpowder", Count: 24b}, sell: {id: "minecraft:potion", Count: 1b, tag: {Potion: "minecraft:water"}}, uses: -2000000000, rewardExp: 1b}]}, Rotation: [270f, 0f], Profession: 3, Invulnerable:true, Tags:["P4AVillager"]}


execute if entity @e[scores={Incorrect_P4A=5}] run summon villager 856 70 984 {Offers: {Recipes: [{maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:iron_sword", Count: 1b, tag: {Enchantments: [{lvl: 2s, id: "minecraft:knockback"}, {lvl: 1s, id: "minecraft:sharpness"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:diamond_sword", Count: 1b, tag: {Enchantments: [{lvl: 2s, id: "minecraft:sharpness"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}]}, Rotation: [270f, 0f], Profession: 3, Invulnerable:true, Tags:["P4AVillager"]}

execute if entity @e[scores={Incorrect_P4A=5}] run summon villager 856 70 980 {Offers: {Recipes: [{maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:iron_chestplate", Count: 1b, tag: {Enchantments: [{lvl: 3s, id: "minecraft:blast_protection"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:iron_helmet", Count: 1b, tag: {Enchantments: [{lvl: 3s, id: "minecraft:blast_protection"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:iron_leggings", Count: 1b, tag: {Enchantments: [{lvl: 2s, id: "minecraft:blast_protection"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}, {maxUses: 7, buy: {id: "minecraft:gold_nugget", Count: 1b, tag: {display: {Lore: ["§7§oUsed at merchants for special items!"], Name: "{\"text\":\"§6Creeper Coin\"}"}}}, sell: {id: "minecraft:iron_boots", Count: 1b, tag: {Enchantments: [{lvl: 2s, id: "minecraft:blast_protection"}], Damage: 0}}, uses: -2000000000, rewardExp: 1b}]}, Rotation: [270f, 0f], Profession: 3, Invulnerable:true, Tags:["P4AVillager"]}


execute if block 863 70 989 stone_button[powered=true] run scoreboard objectives add P4APotion dummy
scoreboard players add @e[tag=MainTriviaAEC] P4APotion 1
execute if block 863 70 989 stone_button[powered=false] run scoreboard objectives remove P4APotion

execute if block 860 70 989 stone_button[powered=true] run scoreboard objectives add P4AArmor dummy
scoreboard players add @e[tag=MainTriviaAEC] P4AArmor 1
execute if block 860 70 989 stone_button[powered=false] run scoreboard objectives remove P4AArmor

execute if entity @e[scores={P4APotion=1..19}] at @p[x=863,y=70,z=989] run summon potion ~ ~1 ~ {CustomName:"{\"text\":\"Random Ultimate Potion\",\"color\":\"white\"}",Potion:{id:"minecraft:splash_potion",Count:1,tag:{Potion:"minecraft:harming",CustomPotionEffects:[{Id:7,Amplifier:2,Duration:20}]}}}

execute if entity @e[scores={P4AArmor=1}] run summon skeleton 870 68 981.0 {CustomName:"{\"text\":\"Random Ultimate Armor\",\"color\":\"white\"}",Rotation:[90f,0f],Silent:true,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:10}]}},{id:"minecraft:diamond_leggings",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:10}]}},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:10}]}},{id:"minecraft:diamond_helmet",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:10}]}}],Tags:["P4ASkeleton"]}

effect give @e[tag=P4ASkeleton] invisibility 3 255 true
effect give @e[tag=P4ASkeleton] strength 3 255 true




# END SAFEGUARD
execute align x align y align z unless entity @a[x=850,y=67,z=968,dx=20,dy=10,dz=30] run scoreboard objectives add P4A_End dummy
execute align x align y align z if entity @a[x=850,y=67,z=968,dx=20,dy=10,dz=30] run scoreboard objectives remove P4A_End
execute align x align y align z unless entity @a[x=850,y=67,z=968,dx=20,dy=10,dz=30] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P4A_End 1

execute if entity @e[scores={P4A_End=25..}] run clear @a
execute if entity @e[scores={P4A_End=25..}] run kill @e[tag=P4ASkeleton]
execute if entity @e[scores={P4A_End=25..}] run scoreboard objectives remove Incorrect_P4A
execute if entity @e[scores={P4A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P4A_End=25..}] run scoreboard objectives remove P4A_End