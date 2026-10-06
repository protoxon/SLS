####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# Score equivalent:
# 1 = White
# 2 = Pink
# 3 = Cyan
# 4 = Black
# 5 = Orange
# 6 = Lime
# 7 = Purple
# 8 = Red
# 9 = Magenta
# 10 = LightBlue
# 11 = Blue
# 12 = Brown
# 13 = Green
# 14 = Midnight



# Tag player as they pick up armor
execute positioned 6 89 3200 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 51
execute positioned 6 89 3202 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 52
execute positioned 6 89 3207 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 53
execute positioned 6 89 3209 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 54
execute positioned 9 89 3200 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 55
execute positioned 9 89 3202 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 56
execute positioned 9 89 3207 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 57
execute positioned 9 89 3209 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 58
execute positioned 12 89 3200 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 59
execute positioned 12 89 3202 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 60
execute positioned 12 89 3207 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 61
execute positioned 12 89 3209 if block ~ ~ ~ acacia_pressure_plate[powered=true] align x align y align z run scoreboard players set @p golfGear 62

# Equipping sound
execute as @a[scores={golfGear=50..}] at @s run playsound item.armor.equip_leather master @s



# Clear any leftover "old armor"
clear @a[scores={golfGear=50..}] leather_helmet
clear @a[scores={golfGear=50..}] leather_chestplate
clear @a[scores={golfGear=50..}] leather_leggings
clear @a[scores={golfGear=50..}] leather_boots



# Equip armor on newly-equipped players
# White
replaceitem entity @a[scores={golfGear=51}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"white\"}",color:16383998}}
replaceitem entity @a[scores={golfGear=51}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"white\"}",color:16383998}}
replaceitem entity @a[scores={golfGear=51}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"white\"}",color:16383998}}
replaceitem entity @a[scores={golfGear=51}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"white\"}",color:16383998}}

# Pink
replaceitem entity @a[scores={golfGear=52}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"light_purple\"}",color:15961002}}
replaceitem entity @a[scores={golfGear=52}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"light_purple\"}",color:15961002}}
replaceitem entity @a[scores={golfGear=52}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"light_purple\"}",color:15961002}}
replaceitem entity @a[scores={golfGear=52}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"light_purple\"}",color:15961002}}

# Cyan
replaceitem entity @a[scores={golfGear=53}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",color:1481884}}
replaceitem entity @a[scores={golfGear=53}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",color:1481884}}
replaceitem entity @a[scores={golfGear=53}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",color:1481884}}
replaceitem entity @a[scores={golfGear=53}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"dark_aqua\"}",color:1481884}}


# Black
replaceitem entity @a[scores={golfGear=54}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"dark_gray\"}",color:1908001}}
replaceitem entity @a[scores={golfGear=54}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"dark_gray\"}",color:1908001}}
replaceitem entity @a[scores={golfGear=54}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"dark_gray\"}",color:1908001}}
replaceitem entity @a[scores={golfGear=54}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"dark_gray\"}",color:1908001}}

# Orange
replaceitem entity @a[scores={golfGear=55}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"gold\"}",color:16351261}}
replaceitem entity @a[scores={golfGear=55}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"gold\"}",color:16351261}}
replaceitem entity @a[scores={golfGear=55}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"gold\"}",color:16351261}}
replaceitem entity @a[scores={golfGear=55}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"gold\"}",color:16351261}}

# Lime
replaceitem entity @a[scores={golfGear=56}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"green\"}",color:8439583}}
replaceitem entity @a[scores={golfGear=56}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"green\"}",color:8439583}}
replaceitem entity @a[scores={golfGear=56}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"green\"}",color:8439583}}
replaceitem entity @a[scores={golfGear=56}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"green\"}",color:8439583}}

# Purple
replaceitem entity @a[scores={golfGear=57}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:8991416}}
replaceitem entity @a[scores={golfGear=57}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:8991416}}
replaceitem entity @a[scores={golfGear=57}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:8991416}}
replaceitem entity @a[scores={golfGear=57}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:8991416}}

# Red
replaceitem entity @a[scores={golfGear=58}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"red\"}",color:11546150}}
replaceitem entity @a[scores={golfGear=58}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"red\"}",color:11546150}}
replaceitem entity @a[scores={golfGear=58}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"red\"}",color:11546150}}
replaceitem entity @a[scores={golfGear=58}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"red\"}",color:11546150}}

# Magenta
replaceitem entity @a[scores={golfGear=59}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:13061821}}
replaceitem entity @a[scores={golfGear=59}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:13061821}}
replaceitem entity @a[scores={golfGear=59}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:13061821}}
replaceitem entity @a[scores={golfGear=59}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"dark_purple\"}",color:13061821}}

# LightBlue
replaceitem entity @a[scores={golfGear=60}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"aqua\"}",color:3847130}}
replaceitem entity @a[scores={golfGear=60}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"aqua\"}",color:3847130}}
replaceitem entity @a[scores={golfGear=60}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"aqua\"}",color:3847130}}
replaceitem entity @a[scores={golfGear=60}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"aqua\"}",color:3847130}}

# Blue
replaceitem entity @a[scores={golfGear=61}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"blue\"}",color:3949738}}
replaceitem entity @a[scores={golfGear=61}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"blue\"}",color:3949738}}
replaceitem entity @a[scores={golfGear=61}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"blue\"}",color:3949738}}
replaceitem entity @a[scores={golfGear=61}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"blue\"}",color:3949738}}

# Brown
replaceitem entity @a[scores={golfGear=62}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"dark_red\"}",color:8606770}}
replaceitem entity @a[scores={golfGear=62}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"dark_red\"}",color:8606770}}
replaceitem entity @a[scores={golfGear=62}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"dark_red\"}",color:8606770}}
replaceitem entity @a[scores={golfGear=62}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"dark_red\"}",color:8606770}}

# Green
replaceitem entity @a[scores={golfGear=63}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\",\"italic\":\"false\",\"color\":\"green\"}",color:876046}}
replaceitem entity @a[scores={golfGear=63}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\",\"italic\":\"false\",\"color\":\"green\"}",color:876046}}
replaceitem entity @a[scores={golfGear=63}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\",\"italic\":\"false\",\"color\":\"green\"}",color:876046}}
replaceitem entity @a[scores={golfGear=63}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\",\"italic\":\"false\",\"color\":\"green\"}",color:876046}}

# Midnight
replaceitem entity @a[scores={golfGear=64}] armor.head leather_helmet{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Cap\"}",color:0}}
replaceitem entity @a[scores={golfGear=64}] armor.chest leather_chestplate{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Polo\"}",color:0}}
replaceitem entity @a[scores={golfGear=64}] armor.legs leather_leggings{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Pants\"}",color:0}}
replaceitem entity @a[scores={golfGear=64}] armor.feet leather_boots{GolfGear:1b,HideFlags:38,display:{Name:"{\"text\":\"Golf Shoes\"}",color:0}}



# Kill the stand being given
execute if entity @a[scores={golfGear=51}] run kill @e[tag=WhiteGear]
execute if entity @a[scores={golfGear=52}] run kill @e[tag=PinkGear]
execute if entity @a[scores={golfGear=53}] run kill @e[tag=CyanGear]
execute if entity @a[scores={golfGear=54}] run kill @e[tag=BlackGear]
execute if entity @a[scores={golfGear=55}] run kill @e[tag=OrangeGear]
execute if entity @a[scores={golfGear=56}] run kill @e[tag=LimeGear]
execute if entity @a[scores={golfGear=57}] run kill @e[tag=PurpleGear]
execute if entity @a[scores={golfGear=58}] run kill @e[tag=RedGear]
execute if entity @a[scores={golfGear=59}] run kill @e[tag=MagentaGear]
execute if entity @a[scores={golfGear=60}] run kill @e[tag=LightBlueGear]
execute if entity @a[scores={golfGear=61}] run kill @e[tag=BlueGear]
execute if entity @a[scores={golfGear=62}] run kill @e[tag=BrownGear]



# Tell the player what's up
tellraw @a[scores={golfGear=51}] {"text":"● White Gear equipped ●","color":"white","bold":true}
tellraw @a[scores={golfGear=52}] {"text":"● Pink Gear equipped ●","color":"light_purple","bold":true}
tellraw @a[scores={golfGear=53}] {"text":"● Cyan Gear equipped ●","color":"dark_aqua","bold":true}
tellraw @a[scores={golfGear=54}] {"text":"● Black Gear equipped ●","color":"dark_gray","bold":true}
tellraw @a[scores={golfGear=55}] {"text":"● Orange Gear equipped ●","color":"gold","bold":true}
tellraw @a[scores={golfGear=56}] {"text":"● Lime Gear equipped ●","color":"green","bold":true}
tellraw @a[scores={golfGear=57}] {"text":"● Purple Gear equipped ●","color":"dark_purple","bold":true}
tellraw @a[scores={golfGear=58}] {"text":"● Red Gear equipped ●","color":"red","bold":true}
tellraw @a[scores={golfGear=59}] {"text":"● Magenta Gear equipped ●","color":"dark_purple","bold":true}
tellraw @a[scores={golfGear=60}] {"text":"● Light Blue Gear equipped ●","color":"aqua","bold":true}
tellraw @a[scores={golfGear=61}] {"text":"● Blue Gear equipped ●","color":"blue","bold":true}
tellraw @a[scores={golfGear=62}] {"text":"● Brown Gear equipped ●","color":"dark_red","bold":true}
tellraw @a[scores={golfGear=63}] {"text":"...Green gear equipped‽","color":"dark_green","bold":true}
tellraw @a[scores={golfGear=64}] {"text":"MIDNIGHT gear equipped‽‽","color":"black","bold":"true"}





# Drop from "getting armor" score to "have armor" score
scoreboard players remove @a[scores={golfGear=50..}] golfGear 50

# Reload gear, removing armor/plates as needed
function d3:bonus/load_gear