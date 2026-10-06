####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 3 2018 / NOVEMBER 25 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1055 69 986

#scoreboard objectives setdisplay sidebar Incorrect_G7D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=909,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true
effect give @a[tag=G7DHusk] resistance 3 255 true
effect give @a[tag=G7DHusk] regeneration 3 255 true

scoreboard objectives add Incorrect_G7D dummy
execute align x align y align z if entity @a[x=1185,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G7D 1

execute if entity @e[scores={Incorrect_G7D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G7D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G7D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G7D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G7D=1}] run title @a subtitle {"text":"12 is not the correct amount", "color":"white"}
execute if entity @e[scores={Incorrect_G7D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now all you have to do to get back, is break these 12 bookshelves.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G7D=1}] as @e[tag=G7DHusk] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1191 60 928 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1195 58 926 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1200 60 925 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1205 59 926 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1190 59 920 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1193 59 922 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1197 58 919 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1202 60 920 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1191 58 916 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1196 61 914 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1203 62 915 bookshelf
execute if entity @e[scores={Incorrect_G7D=1}] run setblock 1201 65 929 bookshelf


# SUMMON MOBS
execute if block 1191 60 928 air run summon husk 1191 60 928 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1195 58 926 air run summon husk 1195 58 926 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1200 60 925 air run summon husk 1200 60 925 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1205 59 926 air run summon husk 1205 59 926 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1190 59 920 air run summon husk 1190 59 920 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1193 59 922 air run summon husk 1193 59 922 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1197 58 919 air run summon husk 1197 58 919 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1202 60 920 air run summon husk 1202 60 920 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1191 58 916 air run summon husk 1191 58 916 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1196 61 914 air run summon husk 1196 61 914 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1203 62 915 air run summon husk 1203 62 915 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}
execute if block 1201 65 929 air run summon husk 1201 65 929 {Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:bookshelf",Count:1b}],Attributes:[{Name:"generic.maxHealth",Base:300.0}],Health:300f,HandItems:[{id:"minecraft:wooden_axe",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:1}]}}],Tags:["G7DHusk"]}



# CHANGE TO STRUCTURE VOIDS
execute if block 1191 60 928 air run setblock 1191 60 928 structure_void
execute if block 1195 58 926 air run setblock 1195 58 926 structure_void
execute if block 1200 60 925 air run setblock 1200 60 925 structure_void
execute if block 1205 59 926 air run setblock 1205 59 926 structure_void
execute if block 1190 59 920 air run setblock 1190 59 920 structure_void
execute if block 1193 59 922 air run setblock 1193 59 922 structure_void
execute if block 1197 58 919 air run setblock 1197 58 919 structure_void
execute if block 1202 60 920 air run setblock 1202 60 920 structure_void
execute if block 1191 58 916 air run setblock 1191 58 916 structure_void
execute if block 1196 61 914 air run setblock 1196 61 914 structure_void
execute if block 1203 62 915 air run setblock 1203 62 915 structure_void
execute if block 1201 65 929 air run setblock 1201 65 929 structure_void



scoreboard objectives add G7DAxe dummy
scoreboard players add @a G7DAxe 1

execute if entity @e[nbt={Item:{id:"minecraft:wooden_axe"}}] run scoreboard objectives remove G7DAxe
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:wooden_axe"}]}] G7DAxe
execute if entity @e[scores={Incorrect_G7D=10..}] run give @a[tag=WrongAnswer,scores={G7DAxe=10..}] wooden_axe{Unbreakable:true,CanDestroy:["minecraft:bookshelf"],HideFlags:2,Enchantments:[{id:"minecraft:knockback",lvl:1}]}



# FOR THE WIN
execute if entity @e[scores={Incorrect_G7D=10..}] if block 1191 60 928 structure_void if block 1195 58 926 structure_void if block 1200 60 925 structure_void if block 1205 59 926 structure_void if block 1190 59 920 structure_void if block 1193 59 922 structure_void if block 1197 58 919 structure_void if block 1202 60 920 structure_void if block 1191 58 916 structure_void if block 1196 61 914 structure_void if block 1203 62 915 structure_void if block 1201 65 929 structure_void run kill @e[tag=G7DHusk]

execute if entity @e[scores={Incorrect_G7D=10..}] if block 1191 60 928 structure_void if block 1195 58 926 structure_void if block 1200 60 925 structure_void if block 1205 59 926 structure_void if block 1190 59 920 structure_void if block 1193 59 922 structure_void if block 1197 58 919 structure_void if block 1202 60 920 structure_void if block 1191 58 916 structure_void if block 1196 61 914 structure_void if block 1203 62 915 structure_void if block 1201 65 929 structure_void run teleport @a[tag=WrongAnswer] 1055 67 1000 180 0







# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives add G7D_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives remove G7D_End
execute align x align y align z unless entity @a[x=1185,y=54,z=909,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G7D_End 1

execute if entity @e[scores={G7D_End=25..}] run clear @a
execute if entity @e[scores={G7D_End=25..}] run scoreboard objectives remove G7DAxe
execute if entity @e[scores={G7D_End=25..}] run scoreboard objectives remove Incorrect_G7D
execute if entity @e[scores={G7D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G7D_End=25..}] run scoreboard objectives remove G7D_End