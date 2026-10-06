####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# DECEMBER 30 2018 / MAY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ArenaHealth
#scoreboard objectives setdisplay sidebar ArenaDeaths
#scoreboard objectives setdisplay sidebar ArenaDeathCash

scoreboard objectives add ArenaHealth dummy
scoreboard players add @e[tag=MainArenaAEC] ArenaHealth 1
scoreboard players set @e[scores={ArenaHealth=80..}] ArenaHealth 0

effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

tag @a add GetArenaHealth
execute at @e[tag=ArenaMob,tag=!ArenaStatue] run tag @a[distance=..2] remove GetArenaHealth
execute at @e[tag=ArenaBoss,tag=!ArenaBoss1] run tag @a[distance=..7] remove GetArenaHealth
tag @a[nbt=!{Fire:-20s}] remove GetArenaHealth
execute as @a[tag=GetArenaHealth] at @s if block ~ ~-1 ~ cactus run tag @s remove GetArenaHealth
execute as @a[tag=GetArenaHealth] at @s if block ~1 ~ ~ cactus run tag @s remove GetArenaHealth
execute as @a[tag=GetArenaHealth] at @s if block ~-1 ~ ~ cactus run tag @s remove GetArenaHealth
execute as @a[tag=GetArenaHealth] at @s if block ~ ~ ~1 cactus run tag @s remove GetArenaHealth
execute as @a[tag=GetArenaHealth] at @s if block ~ ~ ~-1 cactus run tag @s remove GetArenaHealth

execute if entity @e[scores={ArenaHealth=1}] run effect give @a[tag=GetArenaHealth,tag=!ArenaSecret,nbt=!{Health:20.0f}] regeneration 1 2 true
execute if entity @e[scores={ArenaHealth=1}] run effect give @a[tag=GetArenaHealth,tag=ArenaSecret,nbt={Inventory:[{tag:{ArenaSecret:1b}}]},nbt=!{Health:40.0f}] regeneration 1 2 true
execute if entity @e[scores={ArenaHealth=41}] run effect give @a[tag=GetArenaHealth,tag=ArenaSecret,nbt={Inventory:[{tag:{ArenaSecret:1b}}]},nbt=!{Health:40.0f}] regeneration 1 2 true


# CASH MECHANIC
scoreboard objectives add ArenaDeaths deathCount {"text":"Arena Deaths","color":"yellow","bold":"true","underlined":"true"}
scoreboard objectives add ArenaDeathCash deathCount
scoreboard objectives add ArenaTwoValue dummy
scoreboard players set @e[tag=MainArenaAEC] ArenaTwoValue 2

tag @a remove HalfCash
tag @a[nbt={Inventory:[{id:"minecraft:book",tag:{HalfCash:1b}}]}] add HalfCash
scoreboard players operation @a[scores={ArenaDeathCash=1..}] ArenaCash /= @e[tag=MainArenaAEC] ArenaTwoValue
scoreboard players set @a[tag=!HalfCash,scores={ArenaDeathCash=1..}] ArenaCash 0
scoreboard players set @a[scores={ArenaDeathCash=1..}] ArenaDeathCash 0


# DEATH SIGN
execute align x align y align z unless entity @a[x=-9,y=50,z=1943,dx=2,dy=3,dz=2] if block -8 52 1945 oak_wall_sign run setblock -8 52 1945 air
execute if entity @a[scores={ArenaDeaths=1..10}] align x align y align z if entity @a[x=-9,y=50,z=1943,dx=2,dy=3,dz=2] if block -8 52 1945 air run setblock -8 52 1945 oak_wall_sign[facing=north]{Text1:"{\"text\":\"Lag after death?\",\"color\":\"black\",\"bold\":false}",Text2:"{\"text\":\"xxxxxxxxxxxxxxx\",\"color\":\"black\"}",Text3:"{\"text\":\"F3+A helps!\",\"color\":\"black\",\"bold\":true}",Text4:"{\"text\":\"xxxxxxxxxxxxxxx\",\"color\":\"black\"}"}


# ACTION BAR DEATH MECHANIC
scoreboard objectives add ActionBarDeaths deathCount
scoreboard players add @a[scores={ActionBarDeaths=1..}] ActionBarDeaths 1
execute align x align y align z if entity @a[x=-8,y=50,z=1944,dx=0,dy=1,dz=0,scores={ActionBarDeaths=1..,ArenaDeaths=1}] run title @a actionbar [{"selector":"@p[scores={ActionBarDeaths=1..}]"}," has fallen 1 time"]
execute align x align y align z if entity @a[x=-8,y=50,z=1944,dx=0,dy=1,dz=0,scores={ActionBarDeaths=1..,ArenaDeaths=2..}] run title @a actionbar [{"selector":"@p[scores={ActionBarDeaths=1..}]"}," has fallen ",{"score":{"name":"@p[scores={ArenaDeaths=1..,ActionBarDeaths=1..}]","objective":"ArenaDeaths"},"color":"none","bold":false}," times"]
scoreboard players reset @a[scores={ActionBarDeaths=1..}] HealthBoost
execute align x align y align z run scoreboard players reset @a[x=-8,y=50,z=1944,dx=0,dy=1,dz=0,scores={ActionBarDeaths=1..}] ActionBarDeaths