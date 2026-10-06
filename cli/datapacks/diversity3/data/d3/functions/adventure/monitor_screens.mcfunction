####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 10 2018 / JULY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# DRILL MONITORS
execute unless block 1001 107 2021 stone_button[facing=east,face=floor] run setblock 1001 107 2021 stone_button[facing=east,face=floor]
execute if block 1000 107 2020 quartz_stairs unless entity @e[tag=DrillMonitorA] run summon item_frame 1000 107 2021 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}},Tags:["DrillMonitor","DrillMonitorA","AdventureUpperMonitor","AdventureMonitor"]}

execute if block 980 107 2000 quartz_stairs unless entity @e[tag=DrillMonitorB] run summon item_frame 979 107 2000 {Facing:4b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}},Tags:["DrillMonitor","DrillMonitorB","AdventureUpperMonitor","AdventureMonitor"]}

execute unless block 999 107 1979 stone_button[facing=east,face=floor] run setblock 999 107 1979 stone_button[facing=east,face=floor]
execute if block 1000 107 1980 quartz_stairs unless entity @e[tag=DrillMonitorC] run summon item_frame 1000 107 1979 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}},Tags:["DrillMonitor","DrillMonitorC","AdventureUpperMonitor","AdventureMonitor"]}

execute if block 1020 107 2000 quartz_stairs unless entity @e[tag=DrillMonitorD] run summon item_frame 1021 107 2000 {Facing:5b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}},Tags:["DrillMonitor","DrillMonitorD","AdventureUpperMonitor","AdventureMonitor"]}


# RECEPTION
fill 971 107 2003 971 107 2003 iron_trapdoor[facing=north,open=true] replace barrier
execute if block 971 107 2004 heavy_weighted_pressure_plate unless entity @e[tag=ReceptionMonitor] run summon item_frame 971 107 2004 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:255}},Tags:["ReceptionMonitor","AdventureUpperMonitor","AdventureMonitor"]}

# ASTRO CHAMBER
execute if block 1037 107 1994 quartz_stairs unless entity @e[tag=AstroMonitorA] run summon item_frame 1036 107 1994 {Facing:4b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:259}},Tags:["AstroMonitor","AstroMonitorA","AdventureUpperMonitor","AdventureMonitor"]}

execute if block 1037 107 2006 quartz_stairs unless entity @e[tag=AstroMonitorB] run summon item_frame 1036 107 2006 {Facing:4b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:256}},Tags:["AstroMonitor","AstroMonitorB","AdventureUpperMonitor","AdventureMonitor"]}

# ZOMBO'S BEDROOM
execute unless block 956 94 1985 stone_button[facing=east,face=floor] run setblock 956 94 1985 stone_button[facing=east,face=floor]
execute if block 955 94 1984 quartz_stairs unless entity @e[tag=ZomboMonitor] run summon item_frame 955 94 1985 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:254}},Tags:["ZomboMonitor","AdventureLowerMonitor","AdventureMonitor"]}

# LAUNCH BAY
execute if block 858 105 2033 white_concrete unless entity @e[tag=LaunchMonitor] run summon item_frame 857 105 2033 {Facing:4b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:258}},Tags:["LaunchMonitor","AdventureMonitor"]}

# COM OFFICE
execute if block 956 145 2092 quartz_stairs unless entity @e[tag=RobloxMonitor] run summon item_frame 957 145 2092 {Facing:5b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}},Tags:["RobloxMonitor","AdventureMonitor"]}


# COM MAIN ROOM
execute if block 947 145 2094 quartz_block unless entity @e[tag=ComMonitor1] run summon item_frame 947 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor1","ComMonitor","AdventureMonitor"]}

execute if block 946 145 2094 quartz_block unless entity @e[tag=ComMonitor2] run summon item_frame 946 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor2","ComMonitor","AdventureMonitor"]}

execute if block 945 145 2094 quartz_block unless entity @e[tag=ComMonitor3] run summon item_frame 945 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor3","ComMonitor","AdventureMonitor"]}

execute if block 941 145 2094 quartz_block unless entity @e[tag=ComMonitor4] run summon item_frame 941 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor4","ComMonitor","AdventureMonitor"]}

execute if block 940 145 2094 quartz_block unless entity @e[tag=ComMonitor5] run summon item_frame 940 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor5","ComMonitor","AdventureMonitor"]}

execute if block 939 145 2094 quartz_block unless entity @e[tag=ComMonitor6] run summon item_frame 939 145 2093 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor6","ComMonitor","AdventureMonitor"]}


execute if block 947 145 2094 quartz_block unless entity @e[tag=ComMonitor7] run summon item_frame 947 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor7","ComMonitor","AdventureMonitor"]}

execute if block 946 145 2094 quartz_block unless entity @e[tag=ComMonitor8] run summon item_frame 946 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor8","ComMonitor","AdventureMonitor"]}

execute if block 945 145 2094 quartz_block unless entity @e[tag=ComMonitor9] run summon item_frame 945 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor9","ComMonitor","AdventureMonitor"]}

execute if block 941 145 2094 quartz_block unless entity @e[tag=ComMonitor10] run summon item_frame 941 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor10","ComMonitor","AdventureMonitor"]}

execute if block 940 145 2094 quartz_block unless entity @e[tag=ComMonitor11] run summon item_frame 940 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor11","ComMonitor","AdventureMonitor"]}

execute if block 939 145 2094 quartz_block unless entity @e[tag=ComMonitor12] run summon item_frame 939 145 2095 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor12","ComMonitor","AdventureMonitor"]}


execute if block 947 145 2100 quartz_block unless entity @e[tag=ComMonitor13] run summon item_frame 947 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor13","ComMonitor","AdventureMonitor"]}

execute if block 946 145 2100 quartz_block unless entity @e[tag=ComMonitor14] run summon item_frame 946 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor14","ComMonitor","AdventureMonitor"]}

execute if block 945 145 2100 quartz_block unless entity @e[tag=ComMonitor15] run summon item_frame 945 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor15","ComMonitor","AdventureMonitor"]}

execute if block 941 145 2100 quartz_block unless entity @e[tag=ComMonitor16] run summon item_frame 941 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor16","ComMonitor","AdventureMonitor"]}

execute if block 940 145 2100 quartz_block unless entity @e[tag=ComMonitor17] run summon item_frame 940 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor17","ComMonitor","AdventureMonitor"]}

execute if block 939 145 2100 quartz_block unless entity @e[tag=ComMonitor18] run summon item_frame 939 145 2099 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor18","ComMonitor","AdventureMonitor"]}


execute if block 947 145 2100 quartz_block unless entity @e[tag=ComMonitor19] run summon item_frame 947 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor19","ComMonitor","AdventureMonitor"]}

execute if block 946 145 2100 quartz_block unless entity @e[tag=ComMonitor20] run summon item_frame 946 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor20","ComMonitor","AdventureMonitor"]}

execute if block 945 145 2100 quartz_block unless entity @e[tag=ComMonitor21] run summon item_frame 945 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor21","ComMonitor","AdventureMonitor"]}

execute if block 941 145 2100 quartz_block unless entity @e[tag=ComMonitor22] run summon item_frame 941 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor22","ComMonitor","AdventureMonitor"]}

execute if block 940 145 2100 quartz_block unless entity @e[tag=ComMonitor23] run summon item_frame 940 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor23","ComMonitor","AdventureMonitor"]}

execute if block 939 145 2100 quartz_block unless entity @e[tag=ComMonitor24] run summon item_frame 939 145 2101 {Facing:3b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["ComMonitor24","ComMonitor","AdventureMonitor"]}


# COM GRID MONITOR
execute if block 940 137 2086 white_concrete unless entity @e[tag=GridMonitor] run summon item_frame 940 137 2085 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:257}},Tags:["GridMonitor","AdventureMonitor"]}

# DIG BUNKER OFF MONITOR
execute if block 900 92 2109 quartz_stairs unless entity @e[tag=BunkerMonitor] run summon item_frame 900 93 2109 {Facing:1b,Silent:true,ItemRotation:3b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}},Tags:["BunkerMonitor"]}


execute as @e[tag=AdventureMonitor,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}
execute as @e[tag=BunkerMonitor,nbt=!{ItemRotation:3b}] run data merge entity @s {ItemRotation:3b}


# EPILOGUE MONITOR
execute unless block 1003 58 1961 stone_button[facing=east,face=floor] run setblock 1003 58 1961 stone_button[facing=east,face=floor]
execute if block 1004 58 1962 observer unless entity @e[tag=EpilogueMonitor] run summon item_frame 1004 58 1961 {Facing:2b,Silent:true,ItemRotation:0b,Invulnerable:true,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:260}},Tags:["EpilogueMonitor","AdventureMonitor"]}




# MONITOR RESETS

# UPPER POWER
execute if block 46 7 78 magma_block as @e[tag=AdventureUpperMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}}}
execute if entity @e[scores={AdventureLevel=..109}] if block 46 7 78 glowstone as @e[tag=DrillMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:250}}}

execute if entity @e[scores={AdventureLevel=..109}] if block 46 7 78 glowstone as @e[tag=ReceptionMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:255}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:255}}}


execute if entity @e[scores={AdventureLevel=..109}] if block 46 7 78 glowstone as @e[tag=AstroMonitorA,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:259}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:259}}}
execute if entity @e[scores={AdventureLevel=..109}] if block 46 7 78 glowstone as @e[tag=AstroMonitorB,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:256}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:256}}}


# LOWER POWER
execute if block 46 5 78 magma_block as @e[tag=AdventureLowerMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:251}}}

execute if entity @e[scores={AdventureLevel=..109}] if block 46 5 78 glowstone as @e[tag=ZomboMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:254}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:254}}}


# COM STATION
execute if entity @e[scores={AdventureLevel=..109}] as @e[tag=RobloxMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}}}

execute if entity @e[scores={AdventureLevel=..40}] as @e[tag=GridMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:257}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:257}}}
execute if entity @e[scores={AdventureLevel=41}] as @e[tag=GridMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:263}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:263}}}


execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor1,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:265}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:265}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor2,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:266}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:266}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor3,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:267}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:267}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor4,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:271}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:271}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor5,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:272}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:272}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor6,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:282}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:282}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor7,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:268}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:268}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor8,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:269}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:269}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor9,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:270}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:270}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor10,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:274}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:274}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor11,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:275}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:275}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor12,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:283}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:283}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor13,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:277}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:277}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor14,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:278}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:278}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor15,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:280}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:280}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor16,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:273}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:273}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor17,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:279}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:279}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor18,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:286}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:286}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor19,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:289}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:289}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor20,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:276}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:276}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor21,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:281}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:281}}}

execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor22,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:284}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:284}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor23,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:291}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:291}}}
execute if entity @e[scores={AdventureLevel=..28}] as @e[tag=ComMonitor24,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:285}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:285}}}




# LAUNCH BAY
execute if entity @e[scores={AdventureLevel=..109}] if block 858 105 2033 white_concrete as @e[tag=LaunchMonitor,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:258}}}] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:258}}}



# SELF DESTRUCT
execute if entity @e[scores={AdventureLevel=..109}] run scoreboard objectives remove SelfDestruct
execute if entity @e[scores={AdventureLevel=110,AdventureTimer=720}] run scoreboard objectives add SelfDestruct dummy
execute if entity @e[scores={AdventureLevel=150}] run scoreboard objectives add SelfDestruct dummy
execute if entity @e[scores={AdventureLevel=200..}] run scoreboard objectives remove SelfDestruct
scoreboard players add @e[tag=MainAdventureAEC] SelfDestruct 1
scoreboard players set @e[scores={SelfDestruct=40}] SelfDestruct 0
execute if entity @e[scores={SelfDestruct=1}] as @e[tag=AdventureMonitor,tag=!EpilogueMonitor,tag=!BunkerMonitor] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:252}}}
execute if entity @e[scores={SelfDestruct=20}] as @e[tag=AdventureMonitor,tag=!EpilogueMonitor,tag=!BunkerMonitor] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:253}}}
