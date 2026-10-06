####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 30 2018 / JANUARY 5 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ScanSilverfish

scoreboard objectives add SpawnSilverfish dummy
scoreboard players add @e[tag=MainArenaAEC] SpawnSilverfish 1
scoreboard players set @e[scores={SpawnSilverfish=250..}] SpawnSilverfish 0

execute if entity @e[scores={SpawnSilverfish=20}] run scoreboard objectives add ScanSilverfish dummy
execute if entity @e[scores={SpawnSilverfish=20}] run scoreboard players set @e[tag=MainArenaAEC] ScanSilverfish 0
execute if entity @e[scores={SpawnSilverfish=20}] as @e[tag=ArenaSilverfish] run scoreboard players add @e[tag=MainArenaAEC] ScanSilverfish 1

execute if entity @e[scores={SpawnSilverfish=20}] run kill @e[tag=ArenaSilverfishAEC]
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1986 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1986 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1986 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1987 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1987 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1987 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1988 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1988 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1988 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1989 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1989 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1989 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1990 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1990 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1990 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1991 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1991 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1991 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 33 66 1992 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 34 66 1992 {Tags:["ArenaSilverfishAEC"],Duration:20}
execute if entity @e[scores={SpawnSilverfish=20}] run summon area_effect_cloud 35 66 1992 {Tags:["ArenaSilverfishAEC"],Duration:20}

execute if entity @e[scores={SpawnSilverfish=20}] run kill @e[tag=ArenaSilverfishAEC,sort=random,limit=19]
execute if entity @e[scores={SpawnSilverfish=20,ScanSilverfish=..14}] at @e[tag=ArenaSilverfishAEC] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force
execute if entity @e[scores={SpawnSilverfish=20,ScanSilverfish=..14}] at @e[tag=ArenaSilverfishAEC] run summon silverfish ~ ~ ~ {Attributes:[{Name:"generic.followRange",Base:50.0}],Rotation:[90f,0f],Team:ArenaMob,Tags:["ArenaMob","ArenaSilverfish","ArenaAlcoveMob","ArenaAlcove4Mob"]}
execute if entity @e[scores={SpawnSilverfish=20}] run scoreboard objectives remove ScanSilverfish