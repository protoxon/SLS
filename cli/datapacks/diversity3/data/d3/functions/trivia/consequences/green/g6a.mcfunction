####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 30 2018 / APRIL 14 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1049 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G6A
#scoreboard objectives setdisplay sidebar G6ADiamond
#scoreboard objectives setdisplay sidebar G6AGunpowder
#scoreboard objectives setdisplay sidebar G6ACyanDye
#scoreboard objectives setdisplay sidebar G6ACrafting
#scoreboard objectives setdisplay sidebar G6AWrongFirework
#scoreboard objectives setdisplay sidebar G6ARightFirework
#scoreboard objectives setdisplay sidebar G6AWrongRocket
#scoreboard objectives setdisplay sidebar G6ARocketShot

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G6A dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G6A 1

execute if entity @e[scores={Incorrect_G6A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G6A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G6A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G6A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G6A=1}] run title @a subtitle {"text":"Diamonds create Trail fireworks", "color":"white"}
execute if entity @e[scores={Incorrect_G6A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now follow the diamond ore trails and build us a rocket.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G6A=..10}] run kill @e[type=item,x=1155,y=54,z=1007,dx=24,dy=24,dz=24]

execute if entity @e[scores={Incorrect_G6A=1..}] run scoreboard objectives add G6ADiamond dummy
execute if entity @e[scores={Incorrect_G6A=1..}] run scoreboard objectives add G6AGunpowder dummy
execute if entity @e[scores={Incorrect_G6A=1..}] run scoreboard objectives add G6ACyanDye dummy
scoreboard players add @e[tag=MainTriviaAEC] G6ADiamond 1
scoreboard players add @e[tag=MainTriviaAEC] G6AGunpowder 1
scoreboard players add @e[tag=MainTriviaAEC] G6ACyanDye 1


execute if entity @e[nbt={Item:{id:"minecraft:diamond",tag:{G6ADiamond:1b}}}] run scoreboard objectives remove G6ADiamond
execute if entity @a[nbt={Inventory:[{id:"minecraft:diamond",tag:{G6ADiamond:1b}}]}] run scoreboard objectives remove G6ADiamond
execute unless entity @a[scores={G6ACrafting=1..}] unless entity @e[tag=G6AHasRightStuff] if entity @e[scores={G6ADiamond=30..}] run summon item 1174 68 1028 {Item:{id:"minecraft:diamond", Count:1b, tag:{G6ADiamond:1b}}, Age:-32768}

execute if entity @a[nbt={Inventory:[{id:"minecraft:gunpowder",tag:{G6AGunpowder:1b}}]}] run scoreboard objectives remove G6AGunpowder
execute unless entity @a[scores={G6ACrafting=1..}] unless entity @e[tag=G6AHasRightStuff] if entity @e[scores={G6AGunpowder=30..}] run summon item 1158 56 1026 {Item:{id:"minecraft:gunpowder", Count:1b, tag:{G6AGunpowder:1b}}, Age:-32768}
execute if entity @e[nbt={Item:{id:"minecraft:gunpowder",tag:{G6AGunpowder:1b}}}] run scoreboard objectives remove G6AGunpowder

execute if entity @a[nbt={Inventory:[{id:"minecraft:cyan_dye",tag:{G6ACyanDye:1b}}]}] run scoreboard objectives remove G6ACyanDye
execute unless entity @a[scores={G6ACrafting=1..}] unless entity @e[tag=G6AHasRightStuff] if entity @e[scores={G6ACyanDye=30..}] run summon item 1158 74 1009 {Item:{id:"minecraft:cyan_dye", Count:1b, tag:{G6ACyanDye:1b}}, Age:-32768}
execute if entity @e[nbt={Item:{id:"minecraft:cyan_dye",tag:{G6ACyanDye:1b}}}] run scoreboard objectives remove G6ACyanDye

scoreboard objectives add G6ACrafting minecraft.custom:minecraft.interact_with_crafting_table
scoreboard players add @a[scores={G6ACrafting=1..}] G6ACrafting 1
scoreboard players reset @a[scores={G6ACrafting=300..}] G6ACrafting

execute if entity @e[type=item,nbt={Item: {id: "minecraft:firework_star"}},nbt=!{Item: {id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}}] run scoreboard objectives add G6AWrongFirework dummy
execute if entity @a[nbt={Inventory:[{id: "minecraft:firework_star"}]},nbt=!{Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] run scoreboard objectives add G6AWrongFirework dummy
execute if entity @e[type=item,nbt={Item: {id: "minecraft:firework_star"}},nbt=!{Item: {id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}}] run scoreboard objectives add G6AWrongFirework dummy
scoreboard players add @e[tag=MainTriviaAEC] G6AWrongFirework 1
execute if entity @e[scores={G6AWrongFirework=1}] run tellraw @a ["",{"text":" You didn't add the diamond to the Firework Star. Try again.","color":"white","bold":false}]
execute if entity @e[scores={G6AWrongFirework=1}] run kill @e[nbt={Item:{id:"minecraft:diamond",tag:{G6ADiamond:1b}}}]
execute if entity @e[scores={G6AWrongFirework=1}] run kill @e[nbt={Item:{id:"minecraft:gunpowder",tag:{G6AGunpowder:1b}}}]
execute if entity @e[scores={G6AWrongFirework=1}] run kill @e[nbt={Item:{id:"minecraft:cyan_dye",tag:{G6ACyanDye:1b}}}]

execute if entity @e[scores={G6AWrongFirework=1..}] if entity @e[type=item,nbt={Item: {id: "minecraft:firework_star"}},nbt=!{Item: {id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}}] run summon item 1167 56 1019 {Item:{id:"minecraft:gunpowder", Count:1b, tag:{G6AGunpowder:1b}}, Age:-32768}
execute if entity @e[scores={G6AWrongFirework=1..}] if entity @e[type=item,nbt={Item: {id: "minecraft:firework_star"}},nbt=!{Item: {id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}}] run summon item 1167 56 1019 {Item:{id:"minecraft:cyan_dye", Count:1b, tag:{G6ACyanDye:1b}}, Age:-32768}
execute if entity @e[scores={G6AWrongFirework=1..}] as @e[type=item,nbt={Item: {id: "minecraft:firework_star"}},nbt=!{Item: {id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}}] run kill @s

execute if entity @e[scores={G6AWrongFirework=3}] run give @a[nbt={Inventory:[{id: "minecraft:firework_star"}]},nbt=!{Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] gunpowder{G6AGunpowder:1b}
execute if entity @e[scores={G6AWrongFirework=3}] run give @a[nbt={Inventory:[{id: "minecraft:firework_star"}]},nbt=!{Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] cyan_dye{G6ACyanDye:1b}
execute if entity @e[scores={G6AWrongFirework=3..}] run clear @a[nbt={Inventory:[{id: "minecraft:firework_star"}]},nbt=!{Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] firework_star
execute if entity @e[scores={G6AWrongFirework=5..}] run scoreboard objectives remove G6AWrongFirework

execute if entity @a[nbt={Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] run scoreboard objectives add G6ARightFirework dummy
scoreboard players add @e[tag=MainTriviaAEC] G6ARightFirework 1
execute if entity @e[scores={G6ARightFirework=1}] run give @a[nbt={Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] gunpowder{G6AGunpowder:1b}
execute if entity @e[scores={G6ARightFirework=1}] run give @a[nbt={Inventory:[{id: "minecraft:firework_star", tag: {Explosion: {Trail: 1b}}}]}] paper{G6APaper:1b}

execute if entity @e[nbt={Item: {id: "minecraft:firework_rocket"}},nbt=!{Item: {id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}}] run scoreboard objectives add G6AWrongRocket dummy
execute if entity @a[nbt={Inventory:[{id: "minecraft:firework_rocket"}]},nbt=!{Inventory:[{id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}]}] run scoreboard objectives add G6AWrongRocket dummy
scoreboard players add @e[tag=MainTriviaAEC] G6AWrongRocket 1

execute if entity @e[scores={G6AWrongRocket=1}] run tellraw @a ["",{"text":" You forgot to add the Firework Star. Try again.","color":"white","bold":false}]
execute if entity @e[scores={G6AWrongRocket=1}] if entity @e[nbt={Item: {id: "minecraft:firework_rocket"}},nbt=!{Item: {id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}}] run summon item 1167 56 1019 {Item:{id:"minecraft:gunpowder", Count:1b, tag:{G6AGunpowder:1b}}, Age:-32768}
execute if entity @e[scores={G6AWrongRocket=1}] if entity @e[nbt={Item: {id: "minecraft:firework_rocket"}},nbt=!{Item: {id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}}] run summon item 1167 56 1019 {Item:{id:"minecraft:paper", Count:1b, tag:{G6APaper:1b}}, Age:-32768}



execute if entity @e[scores={G6AWrongRocket=1}] run give @a[nbt={Inventory:[{id: "minecraft:firework_rocket"}]},nbt=!{Inventory:[{id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}]}] gunpowder{G6AGunpowder:1b}
execute if entity @e[scores={G6AWrongRocket=1}] run give @a[nbt={Inventory:[{id: "minecraft:firework_rocket"}]},nbt=!{Inventory:[{id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}]}] paper{G6APaper:1b}
execute if entity @e[scores={G6AWrongRocket=1}] run clear @a[nbt={Inventory:[{id: "minecraft:firework_rocket"}]},nbt=!{Inventory:[{id: "minecraft:firework_rocket", tag:{Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}]}] firework_rocket

execute if entity @e[scores={G6AWrongRocket=1}] run kill @e[nbt={Item: {id: "minecraft:firework_rocket"}}]

execute if entity @e[scores={G6AWrongRocket=1..}] run scoreboard objectives remove G6AWrongRocket


replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:firework_rocket", Count:1b}},nbt=!{SelectedItem:{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] weapon.mainhand firework_rocket{HideFlags:16, Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}, CanPlaceOn:["minecraft:diamond_ore","minecraft:packed_ice","minecraft:crafting_table","minecraft:diamond_block","minecraft:light_blue_concrete","minecraft:light_blue_concrete_powder","minecraft:cyan_concrete","minecraft:cyan_concrete_powder"]} 1

replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:firework_rocket", Count:2b}},nbt=!{SelectedItem:{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] weapon.mainhand firework_rocket{HideFlags:16, Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}, CanPlaceOn:["minecraft:diamond_ore","minecraft:packed_ice","minecraft:crafting_table","minecraft:diamond_block","minecraft:light_blue_concrete","minecraft:light_blue_concrete_powder","minecraft:cyan_concrete","minecraft:cyan_concrete_powder"]} 2

replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:firework_rocket", Count:3b}},nbt=!{SelectedItem:{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] weapon.mainhand firework_rocket{HideFlags:16, Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}, CanPlaceOn:["minecraft:diamond_ore","minecraft:packed_ice","minecraft:crafting_table","minecraft:diamond_block","minecraft:light_blue_concrete","minecraft:light_blue_concrete_powder","minecraft:cyan_concrete","minecraft:cyan_concrete_powder"]} 3

execute align x align y align z as @e[type=item,x=1155,y=54,z=1007,dx=24,dy=24,dz=24,nbt={Item: {id: "minecraft:firework_rocket"}},nbt=!{Item: {id: "minecraft:firework_rocket", tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] run data merge entity @s {Item: {tag: {HideFlags:16, CanPlaceOn:["minecraft:diamond_ore","minecraft:packed_ice","minecraft:crafting_table","minecraft:diamond_block","minecraft:light_blue_concrete","minecraft:light_blue_concrete_powder","minecraft:cyan_concrete","minecraft:cyan_concrete_powder"], Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 2651799]}]}}}}

execute if entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] run scoreboard objectives remove G6ARightFirework


tag @e remove G6AHasRightStuff
execute if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}]}] run tag @e[tag=MainTriviaAEC] add G6AHasRightStuff
execute if entity @e[nbt={Item:{id:"minecraft:firework_rocket",tag:{CanPlaceOn:["minecraft:diamond_ore"]}}}] run tag @e[tag=MainTriviaAEC] add G6AHasRightStuff

execute if entity @e[tag=G6AHasRightStuff] run clear @a[tag=WrongAnswer] diamond
execute if entity @e[tag=G6AHasRightStuff] run clear @a[tag=WrongAnswer] gunpowder
execute if entity @e[tag=G6AHasRightStuff] run clear @a[tag=WrongAnswer] cyan_dye
execute if entity @e[tag=G6AHasRightStuff] run clear @a[tag=WrongAnswer] paper

execute if entity @e[tag=G6AHasRightStuff] run kill @e[nbt={Item:{id:"minecraft:diamond",tag:{G6ADiamond:1b}}}]
execute if entity @e[tag=G6AHasRightStuff] run kill @e[nbt={Item:{id:"minecraft:gunpowder",tag:{G6AGunpowder:1b}}}]
execute if entity @e[tag=G6AHasRightStuff] run kill @e[nbt={Item:{id:"minecraft:cyan_dye",tag:{G6ACyanDye:1b}}}]
execute if entity @e[tag=G6AHasRightStuff] run kill @e[nbt={Item:{id:"minecraft:paper",tag:{G6APaper:1b}}}]


execute if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:firework_rocket"}]}] run scoreboard objectives add G6ARocketShot minecraft.used:minecraft.firework_rocket
execute if entity @a[scores={G6ARocketShot=1}] run scoreboard players add @e[tag=MainTriviaAEC] G6ARocketShot 1
scoreboard players reset @a[scores={G6ARocketShot=1..}] G6ARocketShot
scoreboard players add @e[scores={G6ARocketShot=3..}] G6ARocketShot 1

execute if entity @e[scores={G6ARocketShot=80..}] run teleport @a[tag=WrongAnswer] 1049 67 1000 0 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add G6A_End dummy
execute align x align y align z if entity @a[x=1155,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove G6A_End
execute align x align y align z unless entity @a[x=1155,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G6A_End 1

execute if entity @e[scores={G6A_End=25..}] run kill @e[type=item,x=1155,y=54,z=1007,dx=24,dy=24,dz=24]
execute if entity @e[scores={G6A_End=25..}] run clear @a
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6ADiamond
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6AGunpowder
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6ACyanDye
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6ACrafting
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6AWrongFirework
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6ARightFirework
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6AWrongRocket
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6ARocketShot
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove Incorrect_G6A
execute if entity @e[scores={G6A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G6A_End=25..}] run scoreboard objectives remove G6A_End