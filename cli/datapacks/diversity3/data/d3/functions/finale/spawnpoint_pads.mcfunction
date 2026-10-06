####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# JANUARY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar FinaleDeaths

scoreboard objectives add FinaleDeaths deathCount


# WHITE SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-7,y=35,z=5006,dx=0,dy=0,dz=0] run tag @s remove WhiteFinaleSpawn
execute align x align y align z as @a[tag=!WhiteFinaleSpawn,x=-7,y=35,z=5006,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"white","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"white","bold":true}]
execute align x align y align z as @a[tag=!WhiteFinaleSpawn,x=-7,y=35,z=5006,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!WhiteFinaleSpawn,x=-7,y=35,z=5006,dx=0,dy=0,dz=0] -7 41 5006
execute align x align y align z run tag @a[x=-7,y=35,z=5006,dx=0,dy=1,dz=0] add WhiteFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-7,y=41,z=5006,dx=0,dy=0,dz=0] run teleport @s -7 35 5006 302 0
scoreboard players reset @a[tag=WhiteFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ white_wool run spawnpoint @s 15 46 5020
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=15,y=46,z=5020,dx=0,dy=0,dz=0] 15 36 5020 324 0


# ORANGE SPAWN PAD
execute as @a align x align y align z unless entity @s[x=55,y=43,z=5049,dx=0,dy=0,dz=0] run tag @s remove OrangeFinaleSpawn
execute align x align y align z as @a[tag=!OrangeFinaleSpawn,x=55,y=43,z=5049,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"gold","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"gold","bold":true}]
execute align x align y align z as @a[tag=!OrangeFinaleSpawn,x=55,y=43,z=5049,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!OrangeFinaleSpawn,x=55,y=43,z=5049,dx=0,dy=0,dz=0] 55 49 5049
execute align x align y align z run tag @a[x=55,y=43,z=5049,dx=0,dy=1,dz=0] add OrangeFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=55,y=49,z=5049,dx=0,dy=0,dz=0] run teleport @s 55 43 5049 40 0
scoreboard players reset @a[tag=OrangeFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ orange_wool run spawnpoint @s 48 55 5093
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=48,y=55,z=5093,dx=0,dy=0,dz=0] 48 45 5093 324 0


# YELLOW SPAWN PAD
execute as @a align x align y align z unless entity @s[x=93,y=50,z=5122,dx=0,dy=0,dz=0] run tag @s remove YellowFinaleSpawn
execute align x align y align z as @a[tag=!YellowFinaleSpawn,x=93,y=50,z=5122,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"yellow","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"yellow","bold":true}]
execute align x align y align z as @a[tag=!YellowFinaleSpawn,x=93,y=50,z=5122,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!YellowFinaleSpawn,x=93,y=50,z=5122,dx=0,dy=0,dz=0] 93 56 5122
execute align x align y align z run tag @a[x=93,y=50,z=5122,dx=0,dy=1,dz=0] add YellowFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=93,y=56,z=5122,dx=0,dy=0,dz=0] run teleport @s 93 50 5122 70 0
scoreboard players reset @a[tag=YellowFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ yellow_wool run spawnpoint @s 75 62 5171
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=75,y=62,z=5171,dx=0,dy=0,dz=0] 75 52 5171 335 0


# LIME SPAWN PAD
execute as @a align x align y align z unless entity @s[x=105,y=61,z=5218,dx=0,dy=0,dz=0] run tag @s remove LimeFinaleSpawn
execute align x align y align z as @a[tag=!LimeFinaleSpawn,x=105,y=61,z=5218,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"green","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"green","bold":true}]
execute align x align y align z as @a[tag=!LimeFinaleSpawn,x=105,y=61,z=5218,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!LimeFinaleSpawn,x=105,y=61,z=5218,dx=0,dy=0,dz=0] 105 67 5218
execute align x align y align z run tag @a[x=105,y=61,z=5218,dx=0,dy=1,dz=0] add LimeFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=105,y=67,z=5218,dx=0,dy=0,dz=0] run teleport @s 105 61 5218 35 0
scoreboard players reset @a[tag=LimeFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ lime_wool run spawnpoint @s 94 73 5262
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=94,y=73,z=5262,dx=0,dy=0,dz=0] 94 63 5262 35 -30


# PINK SPAWN PAD
execute as @a align x align y align z unless entity @s[x=95,y=93,z=5304,dx=0,dy=0,dz=0] run tag @s remove PinkFinaleSpawn
execute align x align y align z as @a[tag=!PinkFinaleSpawn,x=95,y=93,z=5304,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"light_purple","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"light_purple","bold":true}]
execute align x align y align z as @a[tag=!PinkFinaleSpawn,x=95,y=93,z=5304,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!PinkFinaleSpawn,x=95,y=93,z=5304,dx=0,dy=0,dz=0] 95 99 5304
execute align x align y align z run tag @a[x=95,y=93,z=5304,dx=0,dy=1,dz=0] add PinkFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=95,y=99,z=5304,dx=0,dy=0,dz=0] run teleport @s 95 93 5304 20 -10
scoreboard players reset @a[tag=PinkFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ pink_wool run spawnpoint @s 58 100 5330
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=58,y=100,z=5330,dx=0,dy=0,dz=0] 58 90 5330 70 -25


# CYAN SPAWN PAD
execute as @a align x align y align z unless entity @s[x=5,y=113,z=5339,dx=0,dy=0,dz=0] run tag @s remove CyanFinaleSpawn
execute align x align y align z as @a[tag=!CyanFinaleSpawn,x=5,y=113,z=5339,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"dark_aqua","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"dark_aqua","bold":true}]
execute align x align y align z as @a[tag=!CyanFinaleSpawn,x=5,y=113,z=5339,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!CyanFinaleSpawn,x=5,y=113,z=5339,dx=0,dy=0,dz=0] 5 119 5339
execute align x align y align z run tag @a[x=5,y=113,z=5339,dx=0,dy=1,dz=0] add CyanFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=5,y=119,z=5339,dx=0,dy=0,dz=0] run teleport @s 5 113 5339 35 3
scoreboard players reset @a[tag=CyanFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ cyan_wool run spawnpoint @s -32 123 5347
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-32,y=123,z=5347,dx=0,dy=0,dz=0] -32 113 5347 105 -25


# PURPLE SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-69,y=134,z=5340,dx=0,dy=0,dz=0] run tag @s remove PurpleFinaleSpawn
execute align x align y align z as @a[tag=!PurpleFinaleSpawn,x=-69,y=134,z=5340,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"dark_purple","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"dark_purple","bold":true}]
execute align x align y align z as @a[tag=!PurpleFinaleSpawn,x=-69,y=134,z=5340,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!PurpleFinaleSpawn,x=-69,y=134,z=5340,dx=0,dy=0,dz=0] -69 140 5340
execute align x align y align z run tag @a[x=-69,y=134,z=5340,dx=0,dy=1,dz=0] add PurpleFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-69,y=140,z=5340,dx=0,dy=0,dz=0] run teleport @s -69 134 5340 140 3
scoreboard players reset @a[tag=PurpleFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ purple_wool run spawnpoint @s -136 118 5188
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-136,y=118,z=5188,dx=0,dy=0,dz=0] -136 108 5188 145 -30


# BLUE SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-159,y=124,z=5164,dx=0,dy=0,dz=0] run tag @s remove BlueFinaleSpawn
execute align x align y align z as @a[tag=!BlueFinaleSpawn,x=-159,y=124,z=5164,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"dark_blue","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"dark_blue","bold":true}]
execute align x align y align z as @a[tag=!BlueFinaleSpawn,x=-159,y=124,z=5164,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!BlueFinaleSpawn,x=-159,y=124,z=5164,dx=0,dy=0,dz=0] -159 130 5164
execute align x align y align z run tag @a[x=-159,y=124,z=5164,dx=0,dy=1,dz=0] add BlueFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-159,y=130,z=5164,dx=0,dy=0,dz=0] run teleport @s -159 124 5164 260 3
scoreboard players reset @a[tag=BlueFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ blue_wool run spawnpoint @s -154 150 5114
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-154,y=150,z=5114,dx=0,dy=0,dz=0] -154 140 5114 171 -15


# BROWN SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-150,y=156,z=5074,dx=0,dy=0,dz=0] run tag @s remove BrownFinaleSpawn
execute align x align y align z as @a[tag=!BrownFinaleSpawn,x=-150,y=156,z=5074,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"dark_red","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"dark_red","bold":true}]
execute align x align y align z as @a[tag=!BrownFinaleSpawn,x=-150,y=156,z=5074,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!BrownFinaleSpawn,x=-150,y=156,z=5074,dx=0,dy=0,dz=0] -150 162 5074
execute align x align y align z run tag @a[x=-150,y=156,z=5074,dx=0,dy=1,dz=0] add BrownFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-150,y=162,z=5074,dx=0,dy=0,dz=0] run teleport @s -150 156 5074 166 0
scoreboard players reset @a[tag=BrownFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ brown_wool run spawnpoint @s -154 167 5011
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-154,y=167,z=5011,dx=0,dy=0,dz=0] -154 157 5011 220 -20


# RED SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-138,y=170,z=4971,dx=0,dy=0,dz=0] run tag @s remove RedFinaleSpawn
execute align x align y align z as @a[tag=!RedFinaleSpawn,x=-138,y=170,z=4971,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"red","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"red","bold":true}]
execute align x align y align z as @a[tag=!RedFinaleSpawn,x=-138,y=170,z=4971,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!RedFinaleSpawn,x=-138,y=170,z=4971,dx=0,dy=0,dz=0] -138 176 4971
execute align x align y align z run tag @a[x=-138,y=170,z=4971,dx=0,dy=1,dz=0] add RedFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-138,y=176,z=4971,dx=0,dy=0,dz=0] run teleport @s -138 170 4971 283 0
scoreboard players reset @a[tag=RedFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ red_wool run spawnpoint @s -82 182 4971
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-82,y=182,z=4971,dx=0,dy=0,dz=0] -82 172 4971 220 -20


# BLACK SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-57,y=183,z=4929,dx=0,dy=0,dz=0] run tag @s remove BlackFinaleSpawn
execute align x align y align z as @a[tag=!BlackFinaleSpawn,x=-57,y=183,z=4929,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"dark_gray","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"dark_gray","bold":true}]
execute align x align y align z as @a[tag=!BlackFinaleSpawn,x=-57,y=183,z=4929,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!BlackFinaleSpawn,x=-57,y=183,z=4929,dx=0,dy=0,dz=0] -57 189 4929
execute align x align y align z run tag @a[x=-57,y=183,z=4929,dx=0,dy=0,dz=0] add BlackFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-57,y=189,z=4929,dx=0,dy=0,dz=0] run teleport @s -57 183 4929 270 -10
scoreboard players reset @a[tag=BlackFinaleSpawn] FinaleDeaths

execute as @a[tag=EnderPad] at @s if block ~ ~-1 ~ black_wool run spawnpoint @s -36 195 4912
execute align x align y align z run teleport @a[scores={FinaleDeaths=1..},x=-36,y=195,z=4912,dx=0,dy=0,dz=0] -36 185 4912 180 0


# CHURCH SPAWN PAD
execute as @a align x align y align z unless entity @s[x=-36,y=189,z=4877,dx=0,dy=0,dz=0] run tag @s remove ChurchFinaleSpawn
execute align x align y align z as @a[tag=!ChurchFinaleSpawn,x=-36,y=189,z=4877,dx=0,dy=0,dz=0] unless entity @s[scores={FinaleDeaths=1..}] run tellraw @s ["",{"text":"+","color":"blue","bold":true},{"text":" Spawnpoint Set ","color":"none","bold":false,"underlined":false},{"text":"+","color":"blue","bold":true}]
execute align x align y align z as @a[tag=!ChurchFinaleSpawn,x=-36,y=189,z=4877,dx=0,dy=0,dz=0] at @s unless entity @s[scores={FinaleDeaths=1..}] run playsound entity.ender_eye.death master @s
spawnpoint @a[tag=!ChurchFinaleSpawn,x=-36,y=189,z=4877,dx=0,dy=0,dz=0] -36 195 4877
execute align x align y align z run tag @a[x=-36,y=189,z=4877,dx=0,dy=0,dz=0] add ChurchFinaleSpawn
execute align x align y align z as @a[scores={FinaleDeaths=1..},x=-36,y=195,z=4877,dx=0,dy=0,dz=0] run teleport @s -36 189 4877 180 0
scoreboard players reset @a[tag=ChurchFinaleSpawn] FinaleDeaths



scoreboard players reset @a[tag=EnderPad] FinaleDeaths