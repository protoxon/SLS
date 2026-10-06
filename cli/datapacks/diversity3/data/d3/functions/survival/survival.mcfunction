####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 21 2017 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar Survivor
#scoreboard objectives setdisplay sidebar MushNPCExists
#scoreboard objectives setdisplay sidebar MesaNPCExists
#scoreboard objectives setdisplay sidebar SnowNPCExists
#scoreboard objectives setdisplay sidebar JungleNPCExists
#scoreboard objectives setdisplay sidebar DesertNPCExists
#scoreboard objectives setdisplay sidebar SpawnerBroke
#scoreboard objectives setdisplay sidebar SurvivalDeaths


# BRING STRAGGLERS
execute if block 1 4 2 brown_wool run gamemode survival @a[tag=!InSurvivalBranch,tag=!D3Admin]
execute if block 1 4 2 brown_wool run spawnpoint @a[tag=!InSurvivalBranch] 7 64 -1070
execute if block 1 4 2 brown_wool run teleport @a[tag=!InSurvivalBranch] 7 64 -1070 270 0
execute if block 1 4 2 brown_wool run clear @a[tag=!InSurvivalBranch]
execute if block 1 4 2 brown_wool run tag @a add InSurvivalBranch
execute if block 1 4 2 brown_wool run teleport @a[x=-87,y=34,z=813,dx=220,dy=72,dz=300] 7 64 -1070 270 0



# TAGS PLAYERS WHO ARE ALLOWED IN NETHER
scoreboard objectives add Survivor dummy
scoreboard players set @a Survivor 1


# PROTECTS SPAWN
fill 7 64 -1070 7 65 -1070 air


# DISALLOW SPEEDRUNNER GLITCHING
function d3:speedrunner/prevention


# NO DEATHS ADVANCEMENT
scoreboard objectives add SurvivalDeaths deathCount
scoreboard players add @a SurvivalDeaths 0


# NEW ISLAND LOAD MECHANIC
execute if block 14 11 -18 clay run function d3:survival/reset_plains_island
execute if block 14 13 -18 clay run function d3:survival/reset_plains_island_details
execute if block 12 11 -18 clay run function d3:survival/reset_swamp_island
execute if block 10 11 -18 clay run function d3:survival/reset_mushroom_island
execute if block 10 13 -18 clay run function d3:survival/reset_mushroom_island_details
execute if block 8 11 -18 clay run function d3:survival/reset_mesa_island_bottom
execute if block 8 13 -18 clay run function d3:survival/reset_mesa_island_top
execute if block 6 11 -18 clay run function d3:survival/reset_snow_island
execute if block 6 13 -18 clay run function d3:survival/reset_snow_island_details
execute if block 4 11 -18 clay run function d3:survival/reset_jungle_island_bottom
execute if block 4 13 -18 clay run function d3:survival/reset_jungle_island_top
execute if block 4 15 -18 clay run function d3:survival/reset_jungle_island_details
execute if block 2 11 -18 clay run function d3:survival/reset_desert_island


# START RAIN
execute if block 14 13 -18 grass_block if block 12 13 -18 obsidian if block 10 13 -18 red_mushroom_block if block 8 11 -18 red_terracotta if block 8 13 -18 red_terracotta if block 6 13 -18 snow_block if block 4 15 -18 jungle_wood if block 2 11 -18 sandstone if block 14 6 -18 clay run weather rain
execute if block 14 13 -18 grass_block if block 12 13 -18 obsidian if block 10 13 -18 red_mushroom_block if block 8 11 -18 red_terracotta if block 8 13 -18 red_terracotta if block 6 13 -18 snow_block if block 4 15 -18 jungle_wood if block 2 11 -18 sandstone if block 14 6 -18 clay run setblock 14 6 -18 light_blue_concrete


# SET NETHER PORTAL / CHICKEN
execute if block 12 13 -18 clay if block 12 11 -18 spruce_planks unless entity @e[tag=SurvivalChicken] run summon chicken 18 63 -1005 {PersistenceRequired:1b,Tags:["SurvivalChicken","SurvivalMob"]}
execute if block 12 13 -18 clay if block 12 11 -18 spruce_planks if block 14 63 -999 air run setblock 14 63 -999 fire
execute if block 12 13 -18 clay if block 12 11 -18 spruce_planks if block 14 63 -999 fire run setblock 14 63 -999 air
execute if block 12 13 -18 clay if block 12 11 -18 spruce_planks if block 14 63 -999 nether_portal if entity @e[tag=SurvivalChicken] run setblock 12 13 -18 obsidian


# REPLACE EXIT SIGN IF BROKEN
execute if block 11 65 -1071 air align x align y align z run kill @e[type=item,x=11,y=65,z=-1071,dx=0,dy=0,dz=0]
execute if block 11 65 -1071 air run setblock 11 65 -1071 oak_wall_sign[facing=south]{Text1: "{\"text\":\"\"}",Text2:"{\"text\":\"QUIT BRANCH?\"}",Text3:"{\"text\":\"Resets Progress\"}",Text4: "{\"text\":\"\"}"}


# REPLACE EXIT BUTTON IF BROKEN
execute if block 11 64 -1071 air align x align y align z run kill @e[type=item,x=11,y=64,z=-1071,dx=0,dy=0,dz=0]
execute if block 11 64 -1071 air run setblock 11 64 -1071 stone_button[powered=false,facing=south]


# EXITS BRANCH
execute if block 11 64 -1071 stone_button[powered=true] run tag @a add LeaveSurvival
execute if block 11 64 -1071 stone_button[powered=true] run setblock 11 64 -1071 stone_button[powered=false,facing=south]
teleport @a[tag=LeaveSurvival] 14 4 -31 0 -90
tag @a remove LeaveSurvival


# KILL SURVIVAL BOOK STAND WHEN PICK UP BOOK
kill @e[tag=SurvivalBook,nbt=!{HandItems:[{Count:1b}]}]


# NPCS ALWAYS PRESENT
#scoreboard objectives add MushNPCExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] MushNPCExists 0
#execute if entity @e[tag=MushNPC] run scoreboard players add @e[tag=MainSurvivalAEC] MushNPCExists 1
#execute if entity @e[scores={MushNPCExists=0}] run summon armor_stand -48 66 -1028.1 {Tags:["MushNPC","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Cubehamster\",\"color\":\"red\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16737281}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:12820229}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16736769}}},{id:"minecraft:player_head",tag:{SkullOwner:Cubehamster},Count:1b}],Pose:{Head:[0f,0f,10f],RightArm:[0f,0f,10f],LeftArm:[0f,0f,275f],RightLeg:[10f,0f,0f],LeftLeg:[345f,0f,10f],Body:[0f,0f,5f]},DisabledSlots:1973790}

execute if block -48 65 -1029 mycelium unless entity @e[tag=MushNPC] run summon armor_stand -48 66 -1028.1 {Tags:["MushNPC","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Cubehamster\",\"color\":\"red\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16737281}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:12820229}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16736769}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"c6da74e2-1ea2-46c2-bdae-78e591f7ab51",Properties:{textures:[{Signature:"CH8Nc37hTYsJwAnRZRokS76CWsp5eM73wMq7XXtI2aB+r1qR5dZsOj0Vu9SIyLcmCD1WJCKqUmgd+f3mvZ4aeyhDgsMDDOoTrm6X1r0n0b6i+TwEu2iqxrcTTSO3h/SZpJpELEZj3zhD9wb4ccynTUdmfJDjFq8BW1IjrmYwNvSTbUtLX1cCHEgnjeMOyIpHNvA0wUjsH44n7UHCkYRMJ4yHGYhxN70Mt0wwDJX26BSFU36dYxyVeiWJ55Fs/+EKC+0c8hO9TK5DXrN2QH+j2W+6guznGsKC6OAuowwmGkAjsgwT0G9ZZXiFFk8W0N+saRmWxvdFizfusCd2AVId8sNQL60524OojijWV+NdKFkrHc1tMYal/vHZ8brGbfXY9O0QMR5i5ZLca9KaatKiEHTUfsMR8gJzGXltIg5dzmZUTMPKfnGamc2of3+3kkTI7JIVld8jvHXN1WqnYgyxJVIkJnJReo/0osAGUiYCA2j6tsmD2e7w9WCdUUtxmgPRoDCfnmLv0xr7g236EyA1B/qtUxl2XsfbRW6xIckpn4ikeJ9/S82OtSzPJsuJsBZABYC3e52Bn7GZLQQFoWiyB9ZmvtAicoxtzKcZKBqY0q9DN7j/ruCPFJtfXpLdU0TbH25+EsvXIWfFEXeyvWNWDSGK54irn4neAPlfHqzfWbU=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjExMzU5OTAsInByb2ZpbGVJZCI6ImM2ZGE3NGUyMWVhMjQ2YzJiZGFlNzhlNTkxZjdhYjUxIiwicHJvZmlsZU5hbWUiOiJDdWJlaGFtc3RlciIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDFkYWMzYzg2OTlmZjQ5ZjUxNzEyZTNjNzc4N2YwZmY1NDJiYzVkNmU4ZTE1NTE5MGVmOGZjNzQxMmQ0OWFmZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"Cubehamster"}},Count:1b}],Pose:{Head:[0f,0f,10f],RightArm:[0f,0f,10f],LeftArm:[0f,0f,275f],RightLeg:[10f,0f,0f],LeftLeg:[345f,0f,10f],Body:[0f,0f,5f]},DisabledSlots:1973790}


#scoreboard objectives add MesaNPCExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] MesaNPCExists 0
#execute if entity @e[tag=MesaNPC] run scoreboard players add @e[tag=MainSurvivalAEC] MesaNPCExists 1
#execute if entity @e[scores={MesaNPCExists=0}] run summon armor_stand -48.7 83.3 -967.3 {Tags:["MesaNPC","SurvivalNPC"],Invulnerable:true,Rotation:[45.0f,0.0f],CustomName:"{\"text\":\"rsmalec\",\"color\":\"yellow\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16711422}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4210495}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5592405}}},{id:"minecraft:player_head",tag:{SkullOwner:rsmalec},Count:1b}],Pose:{Head:[30f,0f,0f],RightArm:[0f,0f,5f],LeftArm:[0f,0f,355f],RightLeg:[280f,10f,0f],LeftLeg:[280f,345f,0f],Body:[15f,0f,0f]},DisabledSlots:1973790}

execute if block -49 83 -968 brown_terracotta unless entity @e[tag=MesaNPC] run summon armor_stand -48.7 83.3 -967.3 {Tags:["MesaNPC","SurvivalNPC"],Invulnerable:true,Rotation:[45.0f,0.0f],CustomName:"{\"text\":\"rsmalec\",\"color\":\"yellow\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16711422}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4210495}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5592405}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"b510224e-d304-45a3-ac6a-bcd4ce4f34b9",Properties:{textures:[{Signature:"t/EdOLvbIphbrAdApW6Hfoj0EUtFtaDae71MuEnsdb9s6ACkeSoYLXNUbNpMzNKUNDxa/YHrVDAI73SRe4AzHwDnDPWaqJPlzYs/8ANVVmQU/As+Z3ezeUeIq+VVGGg2ywMIWzddjbhsDShQsVQThuvjLVerIUoWP9HmcmO7MZ8Ms1QA2fG8gaLZWPaBMl+lxdqhK8FMg4BhWWMpqCGPIz48AckpYw6TifghuWix+/mXf87hTAHOfa6Z0E6dcDnhJSisd6Ddj4SC6as9Hk13utQtvm832raSGkuIsEr03Zl0Zlcn4/1XFHXbPqlVprK7h7D/9qKmA9Yjaa3GwPRUMD1+vJTwYnP67dBVuBxppsk+eHuDc/O66rsDFlZ5GrkXwWPUxtW/21QvIHV3590p9wTpTRPFJs4vGk/2SOQj8WuDua3M7uED8sSa8vFIEVGTA69y5GyhdLAGWeAwYD6rVpt5jZUNztk814C5PGiZHS5Fmfbk0zAd2Gss3r0RbiusOE4jR4wVy8UAVcvAcnayG/1fkOEvfsrLyDxHU3XLUJFlkBEsFyybnNC5W+pDnSLkThYrwqRfQ2YGzebhG3THp8R+7A8Mpk/XxNMsy2hI9aeRTOLMxC6Qn51rKgfoQ2y7UAv/+r+s5J5sW6gV4qg7x+q3qEUlY7rlqwaw7QK1IK8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjE2NTk2MjcsInByb2ZpbGVJZCI6ImI1MTAyMjRlZDMwNDQ1YTNhYzZhYmNkNGNlNGYzNGI5IiwicHJvZmlsZU5hbWUiOiJyc21hbGVjIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lZDYxODRlOWQwNWI0MzUxNzY4ZTM3Mjg5ZGRiYTMwZTZkNWIwNzA4OGZkODVlZWY3OTY5YTA5Y2Y5OGE5ZTVhIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85NTNjYWM4Yjc3OWZlNDEzODNlNjc1ZWUyYjg2MDcxYTcxNjU4ZjIxODBmNTZmYmNlOGFhMzE1ZWE3MGUyZWQ2In19fQ=="}]},Name:"rsmalec"}},Count:1b}],Pose:{Head:[30f,0f,0f],RightArm:[0f,0f,5f],LeftArm:[0f,0f,355f],RightLeg:[280f,10f,0f],LeftLeg:[280f,345f,0f],Body:[15f,0f,0f]},DisabledSlots:1973790}


#scoreboard objectives add SnowNPCExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] SnowNPCExists 0
#execute if entity @e[tag=SnowNPC] run scoreboard players add @e[tag=MainSurvivalAEC] SnowNPCExists 1
#execute if entity @e[scores={SnowNPCExists=0}] run summon armor_stand 6 48.0 -933  {Tags:["SnowNPC","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Moesh\",\"color\":\"blue\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3948899}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4804473}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4607091}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Moesh"}}],Pose:{RightArm:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,345.0f,0.0f],Head:[10.0f,0.0f,0.0f],LeftArm:[20.0f,0.0f,0.0f],RightLeg:[0.0f,10.0f,0.0f]},DisabledSlots:1973790}

execute if block 6 47 -933 chiseled_stone_bricks unless entity @e[tag=SnowNPC] run summon armor_stand 6 48.0 -933  {Tags:["SnowNPC","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Moesh\",\"color\":\"blue\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3948899}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4804473}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4607091}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f0fe3b50-9fee-43e2-a165-6c4526ac6473",Properties:{textures:[{Signature:"TkLVhu0ZK6le9/6MMrnUteKWbShy7163xygFv4VsdadXxY0q6wUiGsttkes5oSObNfIajyBYsPbkFuPvTiUyFZV0/th1makGtpHIdu8brJitYq5+aM8mVxY8RSG90yKRLA+ZZZ/iPDqw/yVm/w+YNWDzmIbMdmqSfFyVkw0XhvQ5f/WbcTwdmdZFdApJjhH0wIV13ONvrMfr4F7OpE4+cB7HhnQwtF0pbVWf0WYa/sNc+ez7jq9jxY9lTEnC80mdX+E+cVqwBvBpabV4kBqjp1BYgCNpYbrMXNJwspYxD9qJc8yXEn3Ff3LpW/IrP5N6HwvG+UaOWuwIlqj90nrZVbByIyHUAGGvu5GPXz2oeNTL1dnh22fRgHuyPtf+8ZP9QUlen2wkOyCvOILfhd4HdITL5HIK9CD0ADJDcahEjce0ZhGGhfCora7Hv8BTL4Jao+LOkfPZ66cNpI36f/wY5JSmqsScTjwTJd1yS73ViIWLZ9KQAX+ZEdyRVMejAzNhLJ9hsjJAYYbylDKoq5RGwQa80tl1se1lVyaAImOjk2kyWx/TkKU4JAmhPHWF9F/W/1nWFi0/7/z9gOFJZmHeby1WqC78pCrgu4SRXELcrYeFuQExGal9c0jwosfk6K33owC0RSs1USFK3Fiah5weN52vRbFSmVOcl6IuhRp66vM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjE4MjA5MDcsInByb2ZpbGVJZCI6ImYwZmUzYjUwOWZlZTQzZTJhMTY1NmM0NTI2YWM2NDczIiwicHJvZmlsZU5hbWUiOiJNb2VzaCIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2VlNmIwMzczZDQ0ODE2NDYwMzUwYmM0ZGY5ZTQyYmVmOTE2YmU3YTkxNzU3NzgxNjA0NDVkZjQxY2VhMGVkMCIsIm1ldGFkYXRhIjp7Im1vZGVsIjoic2xpbSJ9fSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzU3ODZmZTk5YmUzNzdkZmI2ODU4ODU5ZjkyNmM0ZGJjOTk1NzUxZTkxY2VlMzczNDY4YzVmYmY0ODY1ZTcxNTEifX19"}]},Name:"Moesh"}}}],Pose:{RightArm:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,345.0f,0.0f],Head:[10.0f,0.0f,0.0f],LeftArm:[20.0f,0.0f,0.0f],RightLeg:[0.0f,10.0f,0.0f]},DisabledSlots:1973790}


#scoreboard objectives add JungleNPCExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] JungleNPCExists 0
#execute if entity @e[tag=JungleNPC] run scoreboard players add @e[tag=MainSurvivalAEC] JungleNPCExists 1
#execute if entity @e[scores={JungleNPCExists=0}] run summon armor_stand 61 96 -969.2 {Tags:["JungleNPC","SurvivalNPC"],Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"CDFDMAN\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1776411}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2960685}}},{id:"minecraft:player_head",tag:{SkullOwner:CDFDMAN},Count:1b}],Pose:{Head:[5f,10f,0f],RightArm:[20f,0f,40f],LeftArm:[20f,0f,320f],RightLeg:[0f,10f,10f],LeftLeg:[10f,0f,355f],Body:[355f,0f,0f]},DisabledSlots:1973790}

execute if block 61 95 -970 jungle_slab unless entity @e[tag=JungleNPC] run summon armor_stand 61 96 -969.2 {Tags:["JungleNPC","SurvivalNPC"],Invulnerable:true,Rotation:[0.0f,0.0f],CustomName:"{\"text\":\"CDFDMAN\",\"color\":\"green\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1776411}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2960685}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"82b9d7b2-24df-4205-8be3-dcdb7a74a635",Properties:{textures:[{Signature:"TO1P62ZUX8qvy8XwEHnIkIulVH6jBqTV2X/MRtIeqls4vmli2Re+Fck0rrw88DxVYx30IkaQpsvZ3ZwPyGFYG9Psw6M154gGumchlfWNLvq+AhGJwNJcEx1l90247hEr0EHjZSDmdiTUg0oQ3mvU9yU7/zhlkB3h2hjxUzHuuE3P3vbfI7AkvE1CMbl+Vrtn36gzvgW+ydLgsZnRiRxNiJos1kbW6NYkELiRl18L+R8aXdKyda3GYR+TNa1p542F2uJD6J5A7OHBifArLiGOJ31c8y/sI2lZlboIEwMBOSip06xOZgcFodF5yeIFq4BDjaovheOw4sTP6uk+h+BJNo5y1uVmbeDjo4+kt16GnuhLhIPd+SYbetuqd3IEBNfEi8HDwvBjFgUHdyH/J5/8lWOgEuVgb/9JZh2kziyKPEV17xiWtnOLIqxmFT8ZKjFnV6YPK4kyGbFR3LA0h+LSo10Jz71NZE3ysX3UCRfYbM4AIqPdXkk61Z5x84n8Ds7Th+iXVufqNeZKCgRYMUbJNxf1B8SBGVy6bIT/bqnDpV4PbVqFXI3/pj2cIbKLOBfTxLSyuwO3evQbVxljaDE0LPtl2YmCHsB+MKK3bdY6aWY1oyUmfoW/nz43+lHCeRhbIqN/+8OK+etQPNCYP5jO8Krg1afHqIy7X2IGDZLqd2s=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzc5MDg4OTIsInByb2ZpbGVJZCI6IjA4N2MzMTJkYjZmNDRkM2RiMjQwYzVmYTgxNTU4MGEzIiwicHJvZmlsZU5hbWUiOiJ0aGVxbWFnbmV0Iiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81MjM1YzlkMGNkOTk4ZDI3ZmVhNjlhZjg5YmE4YjViNDExNGU4MjAzOWE2ZGM5MWFmMWE1YmQ5ZmU1ZDFlY2QyIn19fQ=="}]},Name:"CDFDMAN"}},Count:1b}],Pose:{Head:[5f,10f,0f],RightArm:[20f,0f,40f],LeftArm:[20f,0f,320f],RightLeg:[0f,10f,10f],LeftLeg:[10f,0f,355f],Body:[355f,0f,0f]},DisabledSlots:1973790}


#scoreboard objectives add DesertNPCExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] DesertNPCExists 0
#execute as @e[tag=DesertNPC] run scoreboard players add @e[tag=MainSurvivalAEC] DesertNPCExists 1
#execute if entity @e[scores={DesertNPCExists=..2}] run kill @e[tag=DesertNPC]
#execute if entity @e[scores={DesertNPCExists=0}] run summon armor_stand 64 64.7 -1032.8 {Tags:["DesertNPC","DesertNPCHead","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Jespertheend\",\"color\":\"dark_aqua\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}},Damage:0s},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2016708}},Damage:0s},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Jespertheend"}}],Pose:{Head:[260.0f,0.0f,15.0f],RightArm:[270.0f,10.0f,0.0f],LeftArm:[0.0f,0.0f,0.0f],Body:[270.0f,0.0f,0.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,90.0f]},DisabledSlots:1973790}
#execute if entity @e[scores={DesertNPCExists=0}] run summon armor_stand 65.7 65.34 -1032.77 {Tags:["DesertNPC","DesertNPCLegs","SurvivalNPC"],Invulnerable:true,Invisible:true,Rotation:[90.0f,90.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:5129652}}},{},{}],Pose:{RightLeg:[268.0f,355.0f,335.0f],LeftLeg:[268.0f,10.0f,20.0f],Body:[0.0f,0.0f,0.0f]},DisabledSlots:2039583}
#execute if entity @e[scores={DesertNPCExists=0}] run summon armor_stand 65.15 65.35 -1032.8  {Tags:["DesertNPC","DesertNPCBoots","SurvivalNPC"],Invulnerable:true,Invisible:true,Rotation:[270.0f,90.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:7895160}},Damage:0s},{},{},{}],Pose:{RightLeg:[260.0f,2.0f,340.0f],LeftLeg:[260.0f,0.0f,15.0f],Body:[15.0f,0.0f,0.0f]},DisabledSlots:2039583}

execute if block 65 65 -1033 sandstone unless entity @e[tag=DesertNPCHead] run summon armor_stand 64 64.7 -1032.8 {Tags:["DesertNPC","DesertNPCHead","SurvivalNPC"],Invulnerable:true,Rotation:[270.0f,0.0f],CustomName:"{\"text\":\"Jespertheend\",\"color\":\"dark_aqua\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}},Damage:0s},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2016708}},Damage:0s},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"a531d596-41fa-4372-8430-f38d5157c745",Properties:{textures:[{Signature:"mRScQNsuNzpn9OF7QFaF6uX1HdyN2XTBGQm+7OvoT+XgikI7/7uoglQ/m2yvU/S6WfdHuSJ9CsIZ+RNvz2F3bZWarG0u1D4U1cYtlhbyzsExSzjyL+XeAonQem7brWcFA6ztUowvje9/ZqDtybzcoVPx9kZDRW0/JZz5Nm74e0hw8+q/5VdlwAMiZiKwppdghbueOZsBv2RKvSW4CGr66vNdtJ+Rw7ZBChUvFf9DjE4EXXMLA9S5HE12RxCVIkzilQedVvg9zfsW/bTEZaXpJCt664zdNxrLQ4x2753y6tBXLfPbjnHJieynGZPr+aKIJuGmGYmKC4TXou0NEwQob+60vEOfrdGbEPwtGhoQ8EggnJoRoUvv0V5iinxXgezuAstwOQAv/W/JUU6r2BFa7qF8KE+4F0BfKa4hkpAzF47k5UEzT395jbPVYl9+QXaIKQ8yiXva8m0hJZ7HfVwk1POxIeRhCzSSTmK1WujO6gzqyfZYE6Siyqad8iT9MyH1y8EZ5bR8pAb4sT18FTmgjEcOCk01mfqCLgtbA7a0hCvOpTkINK+S3ZaAQxpK/dzeg0COjUos2d2BW3FUQAsDMqfhrUvOqCqgLFfr9A7eYt2hpQZkFQrS44/vZvGt1mscseCHyXQ7xAlCI+d3kb66tDbSSh0P3ZXSdVhh7ObFKXE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNjE5NTgyMDUsInByb2ZpbGVJZCI6ImE1MzFkNTk2NDFmYTQzNzI4NDMwZjM4ZDUxNTdjNzQ1IiwicHJvZmlsZU5hbWUiOiJKZXNwZXJ0aGVlbmQiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzY4NDM0YzhkM2M2YWZlM2NmZDIxZTdhMjYwYjc3YmRiOTZiM2UwMDlmNWIzMDQ5YjdhZjcwZGFjNmU5Njg5YjMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzE3OTEyNzkwZmYxNjRiOTMxOTZmMDhiYTcxZDBlNjIxMjkzMDQ3NzZkMGYzNDczMzRmOGE2ZWFlNTA5ZjhhNTYifX19"}]},Name:"Jespertheend"}}}],Pose:{Head:[260.0f,0.0f,15.0f],RightArm:[270.0f,10.0f,0.0f],LeftArm:[0.0f,0.0f,0.0f],Body:[270.0f,0.0f,0.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,90.0f]},DisabledSlots:1973790}
execute if block 65 65 -1033 sandstone unless entity @e[tag=DesertNPCLegs] run summon armor_stand 65.7 65.34 -1032.77 {Tags:["DesertNPC","DesertNPCLegs","SurvivalNPC"],Invulnerable:true,Invisible:true,Rotation:[90.0f,90.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:5129652}}},{},{}],Pose:{RightLeg:[268.0f,355.0f,335.0f],LeftLeg:[268.0f,10.0f,20.0f],Body:[0.0f,0.0f,0.0f]},DisabledSlots:2039583}
execute if block 65 65 -1033 sandstone unless entity @e[tag=DesertNPCBoots] run summon armor_stand 65.15 65.35 -1032.8  {Tags:["DesertNPC","DesertNPCBoots","SurvivalNPC"],Invulnerable:true,Invisible:true,Rotation:[270.0f,90.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:7895160}},Damage:0s},{},{},{}],Pose:{RightLeg:[260.0f,2.0f,340.0f],LeftLeg:[260.0f,0.0f,15.0f],Body:[15.0f,0.0f,0.0f]},DisabledSlots:2039583}






# STARTS CLOCKS IN RANGE OF NPCS
execute at @e[tag=MushNPC] if entity @a[distance=..8] run fill 10 2 -18 10 2 -18 redstone_block replace clay
execute at @e[tag=MushNPC] unless entity @a[distance=..8] run fill 10 2 -18 10 2 -18 clay replace redstone_block
#execute at @e[tag=MushNPC] if entity @a[distance=9..] run fill 10 2 -18 10 2 -18 clay replace redstone_block
execute if block 10 2 -18 clay run scoreboard players reset @e MushTimer

execute at @e[tag=MesaNPC] if entity @a[distance=..8] run fill 8 2 -18 8 2 -18 redstone_block replace clay
execute at @e[tag=MesaNPC] unless entity @a[distance=..8] run fill 8 2 -18 8 2 -18 clay replace redstone_block
#execute at @e[tag=MesaNPC] if entity @a[distance=9..] run fill 8 2 -18 8 2 -18 clay replace redstone_block
execute if block 8 2 -18 clay run scoreboard players reset @e MesaTimer

execute at @e[tag=SnowNPC] if entity @a[distance=..8] run fill 6 2 -18 6 2 -18 redstone_block replace clay
execute at @e[tag=SnowNPC] unless entity @a[distance=..8] run fill 6 2 -18 6 2 -18 clay replace redstone_block
#execute at @e[tag=SnowNPC] if entity @a[distance=9..] run fill 6 2 -18 6 2 -18 clay replace redstone_block
execute if block 6 2 -18 clay run scoreboard players reset @e SnowTimer

execute at @e[tag=JungleNPC] if entity @a[distance=..8] run fill 4 2 -18 4 2 -18 redstone_block replace clay
execute at @e[tag=JungleNPC] unless entity @a[distance=..8] run fill 4 2 -18 4 2 -18 clay replace redstone_block
#execute at @e[tag=JungleNPC] if entity @a[distance=9..] run fill 4 2 -18 4 2 -18 clay replace redstone_block
execute if block 4 2 -18 clay run scoreboard players reset @e JungleTimer

execute at @e[tag=DesertNPC] if entity @a[distance=..8] run fill 2 2 -18 2 2 -18 redstone_block replace clay
execute at @e[tag=DesertNPC] unless entity @a[distance=..8] run fill 2 2 -18 2 2 -18 clay replace redstone_block
#execute at @e[tag=DesertNPC] if entity @a[distance=9..] run fill 2 2 -18 2 2 -18 clay replace redstone_block
execute if block 2 2 -18 clay run scoreboard players reset @e DesertTimer


# POPULATION CONTROL
#scoreboard objectives setdisplay sidebar MaxPigmen
#scoreboard objectives setdisplay sidebar MaxCreepers
#scoreboard objectives setdisplay sidebar MaxZombies
#scoreboard objectives setdisplay sidebar MaxSkeletons
#scoreboard objectives setdisplay sidebar MaxSpiders
#scoreboard objectives setdisplay sidebar MaxStrays
#scoreboard objectives setdisplay sidebar MaxHusks

scoreboard objectives add MaxPigmen dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxPigmen
execute as @e[type=zombie_pigman] run scoreboard players add @e[tag=MainSurvivalAEC] MaxPigmen 1
execute if entity @e[scores={MaxPigmen=..3}] run tag @e[type=zombie_pigman] add SurvivalMob
execute as @e[type=zombie_pigman,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

scoreboard objectives add MaxCreepers dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxCreepers
execute as @e[type=creeper] run scoreboard players add @e[tag=MainSurvivalAEC] MaxCreepers 1
execute if entity @e[scores={MaxCreepers=..5}] run tag @e[type=creeper] add SurvivalMob
execute as @e[type=creeper,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

scoreboard objectives add MaxZombies dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxZombies
execute as @e[type=zombie] run scoreboard players add @e[tag=MainSurvivalAEC] MaxZombies 1
execute if entity @e[scores={MaxZombies=..5}] run tag @e[type=zombie] add SurvivalMob
execute as @e[type=zombie,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

scoreboard objectives add MaxSkeletons dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxSkeletons
execute as @e[type=skeleton] run scoreboard players add @e[tag=MainSurvivalAEC] MaxSkeletons 1
execute if entity @e[scores={MaxSkeletons=..5}] run tag @e[type=skeleton] add SurvivalMob
execute as @e[type=skeleton,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

scoreboard objectives add MaxSpiders dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxSpiders
execute as @e[type=spider] run scoreboard players add @e[tag=MainSurvivalAEC] MaxSpiders 1
execute if entity @e[scores={MaxSpiders=..5}] run tag @e[type=spider] add SurvivalMob
execute as @e[type=spider,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

scoreboard objectives add MaxStrays dummy
scoreboard players reset @e[tag=MainSurvivalAEC] MaxStrays
execute as @e[type=stray] run scoreboard players add @e[tag=MainSurvivalAEC] MaxStrays 1
execute if entity @e[scores={MaxStrays=..3}] run tag @e[type=stray] add SurvivalMob
execute as @e[type=stray,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

#scoreboard objectives add MaxHusks dummy
#scoreboard players reset @e[tag=MainSurvivalAEC] MaxHusks
#execute as @e[type=husk] run scoreboard players add @e[tag=MainSurvivalAEC] MaxHusks 1
#execute if entity @e[scores={MaxHusks=..5}] run tag @e[type=husk] add SurvivalMob
#execute as @e[type=husk,tag=!SurvivalMob] at @s run teleport @s ~ ~-30 ~

execute as @e[type=sheep] at @s run teleport @s ~ ~-100 ~
kill @e[type=bat]


# ADVANCEMENTS
execute if block 14 6 -18 light_blue_concrete run scoreboard objectives add SpawnerBroke dummy
scoreboard players add @e[tag=MainSurvivalAEC] SpawnerBroke 0
execute if block 66 67 -1031 air run scoreboard players set @e[tag=MainSurvivalAEC] SpawnerBroke 1
execute if block 67 89 -973 air run scoreboard players set @e[tag=MainSurvivalAEC] SpawnerBroke 1
execute if block 8 65 -1000 air run scoreboard players set @e[tag=MainSurvivalAEC] SpawnerBroke 1
execute if block -49 60 -1039 air run scoreboard players set @e[tag=MainSurvivalAEC] SpawnerBroke 1
execute if block -50 65 -969 air run scoreboard players set @e[tag=MainSurvivalAEC] SpawnerBroke 1
