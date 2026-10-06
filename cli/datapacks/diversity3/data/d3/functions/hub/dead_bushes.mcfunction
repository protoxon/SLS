####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JUNE 16 2018 / MARCH 25 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BushLife

fill 1 3 46 12 3 46 flower_pot replace air

execute if entity @e[type=item,nbt={Item:{id:"minecraft:dead_bush"}}] run scoreboard objectives add BushLife dummy
scoreboard players add @e[type=item,nbt={Item:{id:"minecraft:dead_bush"}}] BushLife 1
execute if entity @e[scores={BushLife=500..}] run kill @e[scores={BushLife=500..}]
execute unless entity @e[type=item,nbt={Item:{id:"minecraft:dead_bush"}}] run scoreboard objectives remove BushLife

advancement grant @a[nbt={Inventory:[{id:"minecraft:dead_bush",tag:{ShecretBush:1b}}]}] only d3:folder_c/secret_branch_item


# AQUA
execute if block 12 3 46 flower_pot if entity @a[x=30,y=126,z=1018,distance=..30] run function d3:hub/dead_bush_aqua
execute if block 12 3 46 potted_dead_bush run scoreboard objectives remove AquaBush

# GOLD
execute if block 11 3 46 flower_pot if entity @a[x=-19,y=118,z=1092,distance=..30] run function d3:hub/dead_bush_gold
execute if block 11 3 46 potted_dead_bush run scoreboard objectives remove GoldBush

# YELLOW
execute if block 10 3 46 flower_pot if entity @a[x=-79,y=80,z=1016,distance=..30] run function d3:hub/dead_bush_yellow
execute if block 10 3 46 potted_dead_bush run scoreboard objectives remove YellowBush

# GREEN
execute if block 9 3 46 flower_pot if entity @a[x=-84,y=68,z=991,distance=..30] run function d3:hub/dead_bush_green
execute if block 9 3 46 potted_dead_bush run scoreboard objectives remove GreenBush

# LIGHT PURPLE
execute if block 8 3 46 flower_pot if entity @a[x=-35,y=67,z=901,distance=..30] run function d3:hub/dead_bush_light_purple
execute if block 8 3 46 potted_dead_bush run scoreboard objectives remove LightPurpleBush

# DARK AQUA
execute if block 7 3 46 flower_pot if entity @a[x=18,y=61,z=894,distance=..30] run function d3:hub/dead_bush_dark_aqua
execute if block 7 3 46 potted_dead_bush run scoreboard objectives remove DarkAquaBush

# DARK PURPLE
execute if block 6 3 46 flower_pot if entity @a[x=129,y=49,z=840,distance=..30] run function d3:hub/dead_bush_dark_purple
execute if block 6 3 46 potted_dead_bush run scoreboard objectives remove DarkPurpleBush

# BLUE
execute if block 5 3 46 flower_pot if entity @a[x=75,y=112,z=938,distance=..30] run function d3:hub/dead_bush_blue
execute if block 5 3 46 potted_dead_bush run scoreboard objectives remove BlueBush

# DARK RED
execute if block 4 3 46 flower_pot if entity @a[x=104,y=94,z=965,distance=..30] run function d3:hub/dead_bush_dark_red
execute if block 4 3 46 potted_dead_bush run scoreboard objectives remove DarkRedBush

# RED
execute if block 3 3 46 flower_pot if entity @a[x=109,y=67,z=1053,distance=..30] run function d3:hub/dead_bush_red
execute if block 3 3 46 potted_dead_bush run scoreboard objectives remove RedBush

# DARK GRAY
execute if block 2 3 46 flower_pot if entity @a[x=38,y=84,z=1102,distance=..30] run function d3:hub/dead_bush_dark_gray
execute if block 2 3 46 potted_dead_bush run scoreboard objectives remove DarkGrayBush

# DARK GREEN
execute if block 1 3 46 flower_pot if entity @a[x=25,y=40,z=1012,distance=..30] run function d3:hub/dead_bush_dark_green
execute if block 1 3 46 potted_dead_bush run scoreboard objectives remove DarkGreenBush


# TALLY BUSHES
scoreboard players add @e[tag=MainHubAEC] TallyBushes 1
execute if entity @e[scores={TallyBushes=0..}] run function d3:hub/dead_bush_tally

execute if block 12 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 11 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 10 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 9 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 8 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 7 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 6 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 5 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 4 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 3 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 2 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]
execute if block 1 3 46 flower_pot run fill -5 90 1031 -5 90 1035 iron_trapdoor[open=false,half=top] replace iron_trapdoor[open=true]

fill -4 82 1031 -4 84 1035 structure_void replace water
fill -5 83 1031 -5 89 1035 water replace air