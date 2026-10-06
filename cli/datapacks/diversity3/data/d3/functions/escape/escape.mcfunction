####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# FEBRUARY 18 2018 / OCTOBER 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

difficulty easy

#scoreboard objectives setdisplay sidebar EscapeLevel
#scoreboard objectives setdisplay sidebar EscapeTimer
#scoreboard objectives setdisplay sidebar EscapeCart1
#scoreboard objectives setdisplay sidebar EscapeCart2
#scoreboard objectives setdisplay sidebar Trial_1
#scoreboard objectives setdisplay sidebar Trial_2
#scoreboard objectives setdisplay sidebar Trial_3
#scoreboard objectives setdisplay sidebar Trial_4
#scoreboard objectives setdisplay sidebar Trial_5
#scoreboard objectives setdisplay sidebar Trial_6
#scoreboard objectives setdisplay sidebar FinalBox
#scoreboard objectives setdisplay sidebar MusicTimer


# BRING STRAGGLERS
execute if block 1 4 2 cyan_wool run gamemode adventure @a[tag=!InEscapeBranch,tag=!D3Admin]
execute if block 1 4 2 cyan_wool run spawnpoint @a[tag=!InEscapeBranch] -1000 2 806
execute if block 1 4 2 cyan_wool run teleport @a[tag=!InEscapeBranch] -1000 2 806 270 0
execute if block 1 4 2 cyan_wool run clear @a[tag=!InEscapeBranch]
execute if block 1 4 2 cyan_wool run tag @a add InEscapeBranch


# SPEECH TIMER ADDED
scoreboard objectives add EscapeTimer dummy
scoreboard players add @e[tag=MainEscapeAEC] EscapeTimer 1


# SPEECH LEVEL
scoreboard objectives add EscapeLevel dummy
scoreboard players add @e[tag=MainEscapeAEC] EscapeLevel 0


#### SPAWN / CHECK POINTS ####

teleport @a[x=-999,y=7,z=804,dx=0,dy=1,dz=0] -1000 2 806 270 0

execute if entity @e[scores={EscapeLevel=2}] run spawnpoint @a -997 19 807
teleport @a[x=-997,y=19,z=807,dx=0,dy=2,dz=0] -996 12 806 25 0

spawnpoint @a[x=-1004,y=12,z=997,dx=8,dy=3,dz=8] -1002 12 996

spawnpoint @a[x=-1005,y=38,z=999,dx=0,dy=3,dz=2] -1006 44 1000
teleport @a[x=-1006,y=44,z=1000,dx=0,dy=1,dz=0] -1006 38 1000 170 0

spawnpoint @a[x=-1006,y=53,z=994,dx=2,dy=3,dz=2] -1004 58 996
teleport @a[x=-1004,y=58,z=996,dx=0,dy=1,dz=0] -1004 53 996 315 0

execute if entity @e[scores={EscapeLevel=4}] run spawnpoint @a -996 71 1009
teleport @a[x=-996,y=71,z=1009,dx=0,dy=1,dz=0] -985 67 1009 90 0

execute if entity @e[scores={EscapeLevel=6}] run spawnpoint @a -1026 93 994
teleport @a[x=-1026,y=93,z=994,dx=0,dy=1,dz=0] -1026 89 994 180 0

execute if entity @e[scores={EscapeLevel=8}] run spawnpoint @a -1046 102 973
teleport @a[x=-1046,y=102,z=973,dx=0,dy=1,dz=0] -1046 98 973 270 0

execute if entity @e[scores={EscapeLevel=9}] run spawnpoint @a -1006 102 973
teleport @a[x=-1006,y=102,z=973,dx=0,dy=1,dz=0] -1006 98 973 225 0

execute if entity @e[scores={EscapeLevel=11}] run spawnpoint @a -991 98 987

spawnpoint @a[x=-978,y=88,z=1001,dx=0,dy=2,dz=2] -979 92 1002
teleport @a[x=-979,y=92,z=1002,dx=0,dy=1,dz=0] -975 88 998 225 0

execute if entity @e[scores={EscapeLevel=14}] run spawnpoint @a -969 96 1029
teleport @a[x=-969,y=96,z=1029,dx=0,dy=1,dz=0] -968 90 1029 315 -10

execute if entity @e[scores={EscapeLevel=15}] run spawnpoint @a -1004 105 1032
teleport @a[x=-1004,y=105,z=1032,dx=0,dy=1,dz=0] -979 104 1032 90 15

execute if entity @e[scores={EscapeLevel=16}] run spawnpoint @a -991 106 1014
teleport @a[x=-991,y=106,z=1014,dx=0,dy=1,dz=0] -991 101.5 1011 180 10

execute if entity @e[scores={EscapeLevel=17}] run spawnpoint @a -991 115 979
teleport @a[x=-991,y=115,z=979,dx=0,dy=1,dz=0] -991 111 981 180 0

execute if entity @e[scores={EscapeLevel=19}] run spawnpoint @a -1011 115 960
#teleport @a[x=-1011,y=115,z=960,dx=0,dy=1,dz=0] -1011 111 960 90 0

execute if entity @e[scores={EscapeLevel=20}] run spawnpoint @a -1036 115 942
teleport @a[x=-1036,y=115,z=942,dx=0,dy=1,dz=0] -1036 111 941 180 -10

execute if entity @e[scores={EscapeLevel=21}] run spawnpoint @a -1036 120 946

execute if entity @e[scores={EscapeLevel=22}] run spawnpoint @a -1036 124 1019
teleport @a[x=-1036,y=124,z=1019,dx=0,dy=1,dz=0] -1030 120 1019 270 0

spawnpoint @a[x=-959,y=143,z=1006,dx=4,dy=2,dz=4] -957 147 1009
teleport @a[x=-957,y=147,z=1009,dx=0,dy=1,dz=0] -957 143 1009 180 0

spawnpoint @a[x=-959,y=143,z=981,dx=4,dy=2,dz=4] -957 147 983
teleport @a[x=-957,y=147,z=983,dx=0,dy=1,dz=0] -957 143 983 90 0

spawnpoint @a[x=-985,y=143,z=974,dx=4,dy=2,dz=4] -983 147 977
teleport @a[x=-983,y=147,z=977,dx=0,dy=1,dz=0] -983 143 977 180 0

spawnpoint @a[x=-985,y=143,z=962,dx=4,dy=2,dz=11] -983 147 972
teleport @a[x=-983,y=147,z=972,dx=0,dy=1,dz=0] -983 143 972 180 0

spawnpoint @a[x=-985,y=143,z=953,dx=4,dy=2,dz=8] -983 147 960
teleport @a[x=-983,y=147,z=960,dx=0,dy=1,dz=0] -983 143 960 180 0

spawnpoint @a[x=-985,y=143,z=946,dx=4,dy=2,dz=6] -983 147 950
teleport @a[x=-983,y=147,z=950,dx=0,dy=1,dz=0] -983 143 950 90 0

execute if entity @e[scores={EscapeLevel=25}] run spawnpoint @a -1021 147 950
teleport @a[x=-1021,y=147,z=950,dx=0,dy=1,dz=0] -1006 143 950 90 0

execute if entity @e[scores={EscapeLevel=26}] run spawnpoint @a -1021 160 950
execute if entity @a[x=-1021,y=160,z=950,dx=0,dy=1,dz=0] run scoreboard players set @e[tag=MainEscapeAEC] EscapeLevel 25
teleport @a[x=-1021,y=160,z=950,dx=0,dy=1,dz=0] -1006 143 950 90 0

execute if entity @e[scores={EscapeLevel=27}] run spawnpoint @a -1000 169 997

execute if entity @e[scores={EscapeLevel=28}] run spawnpoint @a -1000 192 997

###############################




# IN CELL
execute if entity @e[tag=EscapeAnvilFrame,nbt={ItemRotation:6b}] run fill -996 0 806 -996 0 806 redstone_wall_torch[facing=west,lit=true] replace air
execute unless block -996 2 805 iron_bars[north=true,south=true] run setblock -996 2 805 iron_bars[north=true,south=true]
execute unless block -996 3 805 iron_bars[north=true,south=true] run setblock -996 3 805 iron_bars[north=true,south=true]
execute unless block -996 2 807 iron_bars[north=true,south=true] run setblock -996 2 807 iron_bars[north=true,south=true]
execute unless block -996 3 807 iron_bars[north=true,south=true] run setblock -996 3 807 iron_bars[north=true,south=true]


# 1.14 BUG
execute if block -1001 3 803 iron_trapdoor[powered=false] align xyz as @a[x=-1000.5,y=2,z=803.5,dx=0,dy=0,dz=0] at @s if block ~ ~ ~ cauldron run teleport @s ~ ~1 ~

# IN CELL -> LEVEL 0
execute if entity @e[scores={EscapeLevel=0,EscapeTimer=30}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Welcome to my Escape Branch! I'm Cold Fusion, the creator of this cozy prison cell. To claim the Cyan Wool, you must find a way to escape this cell. Good luck!","color":"none","bold":false,"underlined":false}]


# OUT OF CELL -> LEVEL 1
execute align x align y align z at @a[x=-989,y=1,z=805,dx=1,dy=3,dz=6] run scoreboard players set @e[scores={EscapeLevel=0}] EscapeTimer 0
execute align x align y align z at @a[x=-989,y=1,z=805,dx=1,dy=3,dz=6] run scoreboard players set @e[scores={EscapeLevel=0}] EscapeLevel 1

execute if entity @e[scores={EscapeLevel=1,EscapeTimer=1}] run playsound entity.enderman.teleport master @a -984 3 806 0.5 1 0
execute if entity @e[scores={EscapeLevel=1,EscapeTimer=1}] run particle portal -984 3 806 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=1,EscapeTimer=1}] run fill -985 3 806 -984 3 806 air
execute if entity @e[scores={EscapeLevel=1,EscapeTimer=1}] run setblock -984 3 806 oak_wall_sign[facing=west]{Text1:"{\"text\":\"HA!\"}",Text2:"{\"text\":\"As if it would\"}",Text3:"{\"text\":\"be that easy!\"}",Text4:"{\"text\":\"\"}",}

execute if entity @e[scores={EscapeLevel=1,EscapeTimer=20}] at @e[tag=EscapeCFG_Jail] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=1,EscapeTimer=20}] at @e[tag=EscapeCFG_Jail] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=1,EscapeTimer=20}] run kill @e[tag=EscapeCFG]

execute if entity @e[scores={EscapeLevel=1,EscapeTimer=100}] run fill -993 2 808 -991 4 808 air destroy

execute if entity @e[scores={EscapeLevel=1,EscapeTimer=20}] run summon armor_stand -995 12 818 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[203.0f,0.0f,315.0f],LeftLeg:[0.0f,0.0f,338.0f],LeftArm:[341.0f,0.0f,216.0f],RightLeg:[0.0f,0.0f,20.0f]},Small:0b,Rotation:[213.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG"]}

execute align x align y align z run effect give @a[x=-992,y=2,z=813,dx=0,dy=12,dz=0] levitation 1 3


# RISING OUT OF FIRST POLE -> LEVEL 2
execute align x align y align z at @a[x=-994,y=9,z=811,dx=4,dy=3,dz=4] run scoreboard players set @e[scores={EscapeLevel=..1}] EscapeTimer 0
execute align x align y align z at @a[x=-994,y=9,z=811,dx=4,dy=3,dz=4] run scoreboard players set @e[scores={EscapeLevel=..1}] EscapeLevel 2

execute if entity @e[scores={EscapeLevel=2,EscapeTimer=1}] run playsound ambient.cave master @a ~ ~ ~ 1 1 0

execute if entity @e[scores={EscapeLevel=2,EscapeTimer=10}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Behold! My creation!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=2,EscapeTimer=65}] run summon lightning_bolt -991 11 849
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=70}] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=75}] run summon lightning_bolt -1009 11 849
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=80}] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1 1

execute if entity @e[scores={EscapeLevel=2,EscapeTimer=80}] run title @a times 20 120 20
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=80}] run title @a title {"text":"THE CYAN DIMENSION","bold":true,"color":"dark_aqua"}
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=80}] run title @a subtitle {"text":"Escape Is Impossible... Probably?", "color":"white"}

execute if entity @e[scores={EscapeLevel=2,EscapeTimer=150}] at @e[tag=EscapeCFG] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=150}] at @e[tag=EscapeCFG] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=2,EscapeTimer=150}] run kill @e[tag=EscapeCFG]


# SUMMON BUTTONS
function d3:escape/toggle_switches


# MINECART KILLER
execute align x align y align z run tag @e[type=minecart,x=-1000,y=12,z=811,dx=0,dy=1,dz=0] add DeathCart
execute align x align y align z run kill @e[tag=DeathCart,x=-1000,y=12,z=809,dx=0,dy=1,dz=0]
execute align x align y align z run tag @e[type=minecart,x=-1000,y=12,z=977,dx=0,dy=1,dz=0] add DeathCart
execute align x align y align z run kill @e[tag=DeathCart,x=-1000,y=12,z=979,dx=0,dy=1,dz=0]


# MAP MAKER BOX
execute if block -912 11 972 air run setblock -18 5 46 dark_prismarine
execute if block -18 5 46 dark_prismarine run setblock -912 11 972 cyan_concrete
execute if block -18 5 46 dark_prismarine run setblock -912 11 972 cyan_shulker_box{Items: [{Slot: 0b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDU5MDA4MDksInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}, display: {Name: "{\"text\":\"qmagnet Mask\",\"italic\":\"false\"}"}}}, {Slot: 1b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "c67563fd-4b7f-4a6b-a908-7237c3f1eaf9", Properties: {textures: [{Signature: "S4MqkELplzu+P9IQnCcTjY6RiPeOpknCsPgOl6atNN5urwVHHgDNfGoYpGBiR5va+N/xheJ0HZInDWQI5cjvw5bKzTBd9CJgI1zTqzwaqQEceDqwnIs94DUoaYDw23iaoDiNZYHN/yH41U3rpT3qmU4kUc1Lf8YAmj4tybwYPfYl582Xy71peDY+8EzVnhzDF+egmlU9gxpD2I3NnwjjpaM6CrcqpOlE33DbDQbVP89OMrqBMVHVCcDDcozOQP6a11sHX8sqvNS0qkMzTqlyEME5IZHl7OlqR5wQTqUrsvQ6wRJ25rFArA15jfEzAF9j4ESOkjEg/C6QAGPomHgPCAyNlYMe8u37DNUDvVUOoBNasUoVV02BDrLIuQZGO/U8K2ojckU5BwrH7S4X5bL+PsGAqCWVnA5EhQm1cHJRizcXG5uM/l83VsdXIyci8NDbjTszWSThRHvR1YneRTCtu/TxAmLNF8pRbLeNMQ+QsYPjj24mA9CAKaPMI8oY4OnrYowYtzmamY8e0BYTfXNq1Gox507Mq4p1ZxT+6EpbXx7gjQydmvAfPStn/o5HAkl7PzW8rHJsVDIiLqLt+5C87d9K5Y8XWb8+tqHOB6ViyogWqdI+2/NJBhMiF14/yyL/KcDKYCfJh6qJkFHXioQg2KveqrHkdsQ7lBCvZLD3woM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzM5NTgsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]}, Name: "abrightmoore"}, display: {Name: "{\"text\":\"abrightmoore Mask\",\"italic\":\"false\"}"}}}, {Slot: 2b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "1c361569-6b3e-4ab0-b27f-b9f0df43f336", Properties: {textures: [{Signature: "VrNDnSWOEC+i9/hOjrUTboGNHs2d5two2moPyqY3hyzI5Ph9nghCbMoaETYhvAhUMghdcozX+B+2ZcQ5drRHQM99fQLb9OvoDguoyQDeFaQN2ds59rVHxH14mf5Rdun0TK1Z0o1O1E/jojyfZWy7EQACpOXRi22xuMrDFqYn2gfBBtNT7/u48UmUp6QvX3MDvzy2H/ZqLx+idRzAhPp5oI9FYiUkk0NfF8wR8YDyxb6GR/IZdHL90tlk8mQVPQpEeqzFjRb/XF3LhjSGTA/kbxeMhmZQCrX9tdFT2KJvatv5e//NXqPdW61M/xr0iuEHmlRrZL3/N1a7O7SJMiC+OnO1JdlpEkOZlTbB9mx7wIL7SwW3MUfUnVt9724WAf+kKycyaasajLPbyd2hMy9aGA+NNlOKOextsZPNkjRS34eUJjpVxXBg6zSzMUBSIOf9cFsRyK/y9UsmgQ21CFEpPvLO8dUHsSWhK2MP3DZXeSIGfpkNY6fAaYtHAzjiZiYs/Y47EGD9iEJm6GgSrs9sgQYVm3WGkqVohemlfwU3zhB/+XCw/ygtermk7Xa92xUe1YYti7t+sHfaaRG93JfRgycS6Q4vrAtwWz8mcw8Uup4W2EIz73v2RmPivvOIej68wBtX2y3NQJXYlwzGMjOuksNKj2pQZC3Yt6EourqClDk=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQwNDIsInByb2ZpbGVJZCI6IjFjMzYxNTY5NmIzZTRhYjBiMjdmYjlmMGRmNDNmMzM2IiwicHJvZmlsZU5hbWUiOiJyZW5kZXJYUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmMyNzZhZTZiMGY3YjQxMGI0NjZmNmIyZTk2MmU1MWNlMzk2ODRhYTM0YjUyOTQ0MDE4MWM1MjYyY2RmMWM4ZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]}, Name: "renderXR"}, display: {Name: "{\"text\":\"renderXR Mask\",\"italic\":\"false\"}"}}}, {Slot: 3b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "0e696be4-b798-452e-921e-816330bc97a9", Properties: {textures: [{Signature: "umqw9CQRNWSPdLTtxewBdHHw8IWmGjpqaKMweISLH+vktfo2fTGScd0l9aHyI6tPb22Wg0oG31SNwqKPkCJMJsTgkW4LEP+j/+Rm0m5monL9gRsGFGMJgU/f11RBXFL+Xe7WogOLNSATfOIJm2ByHMg/v687PaEwqVwMTlEqXk77t0mF5myqt+K1Wp5kPrhi+7xOwkVH1tQC8lNAB8Xe0pY6l1Pz+XFvIWItXhStgCIchU+KBkhrVEspNQ9Ub/ajkkluZ9AYiYYwfxexUvMKqUrKxSWw75i9PGt2FVeWmKrobhkYmKY1tl0J5FZxZpXuFTfMbj/uTQzg0NiCNtXtRUaOojXeLTnHaArTfwBiOhlFLWjd1dVSsBjqeDPEGh+EA2c5OpDOc+ozE3VVIQYmvrXw5wogsaA9LuEeluxmyGfFJdReXH4Irsec9dWIeAH3lPVEDRqmP1cmbTnevQs8Y7rTfF6GWg3YJah02zIE4oNEskYSVtxF8ZL8+cMuZv6vGb/wMR0miOYoiuxXHaL89SQDgn+pEsRxpoCZDC82hN84ZCLL5PqdqNf1KhN3FMoUTIhbfkIrgsVnRJ5ZQpjgqOI4zVQWfMy4WZDoLJGy3LSDUQuxV/YypKqH2lJxm1xA/FW/7mfvfmRJB0XvbRaG0lz7roAAhDRQjzR/pu8smxc=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQxNDMsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]}, Name: "Jigarbov"}, display: {Name: "{\"text\":\"Jigarbov Mask\",\"italic\":\"false\"}"}}}, {Slot: 4b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "94fa3b51-f70c-48b0-8117-7076ae5ad3ea", Properties: {textures: [{Signature: "qIbm9ihJjtBPPJV16cVxuGCUdloQUe2yYav0tl8SPkSlQl4n76aerGFL4gRXf/ffZSGNZei7DsFLGpoKc/DSzW9t2/125FRdogHMlktcOSyFHXixxSJ6/QIawkIRp62mZDmjLCZFLNxUoMY9fH6ytRuaYfjx7JSrY7xzhC6ODynbO3WLaqbJGzqlWc3yMWwZvrYUlP6YU7uDvcyFvB2LjOkiXofWnm9oAFDpJ9IN4zVYlBDegt54VITGwYMhZoQv6hbauR45amflTJvVXxXY4vRswWCwjAO4NXF6NXXPyHVrWr9ope/HZjUULCDCXk0Ty3UPqGel3TB0+A0Q1cMjC17cZcMYNoR7XWqjdcTjgp2NAPuMODc5e5nhJ0maJyif577qJ+J7azUcaUSQbk8fHgHhCPNYg4489ZGYYkBKSJTmSgmX5ucDhW7q0ASolZLJcEYCqQQc2L4YOIPbQMvZMpnrvma45jZa7WzEZ/YTnomGhQCyttFGVxPytad3CuAXOCcVt3yCA+tSFD6vw0+rCh9SUKVqgLmCdoeHott0lVKHOJupnvuUJW+48ioeOC8LL5+K03TzrvfwGtiqwnawfX95G//yg3WuEK9o+hS9MJGlT3SNYIrZoQYaad5L38BgaW8IS5F5iZJlifOGosKpWkC7JL1zOwpxrTt2WAKp6UA=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQyNjEsInByb2ZpbGVJZCI6Ijk0ZmEzYjUxZjcwYzQ4YjA4MTE3NzA3NmFlNWFkM2VhIiwicHJvZmlsZU5hbWUiOiJGZXlsaW5hIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xM2I5OTNmY2ZkMzU3OWQzMDFkNWM3YmY3OThhM2MxZGRlYzFjZmM3MWVlZmFlNmRiMmU2YTI4MGQ5YWE4NjEzIn19fQ=="}]}, Name: "Feylina"}, display: {Name: "{\"text\":\"Feylina Mask\",\"italic\":\"false\"}"}}}, {Slot: 5b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "7ff4e85a-c46a-488a-905a-dc3ea1481529", Properties: {textures: [{Signature: "HFIBz4Uquz6+IMLpLdhjJPvvp7trRogDB32e/MicqvrlxnMj0sHSkDEEmhdxICswq78W6eb/lRh0dlR+EU6oeBzb084P6TTIlvME0x5FwY+zj2fA/LJVD8cSvaJ5/qpLFgM256ybfrOoI2/09iRAmzzClCBG0RlAj4ssqyRuP8C5tKKrqJn4Z7HOpyFSCIEIETW/nrA1nLhTt+NcfqOvg6Dow4dlO9iT/ltqwrVwY/108nvD0/IvrjhJ8XViZXZTR+F3wmwmQ7w94ZpGmRDp3MjJFFjsKYNfYopb9WhXeVdk6OhJwTOa4syxpCT4BDmifUStypqDBx5EWeK3vSndPeWedMDYry2JoFnEhbbTH5uU3MBf3YeuWlfHIyvz5yX16+woWS2tE65YjttE/rGAn2xUOWBMAworsgnHmCZq9j3li3cq/CroZpgIAoMrXs56G4GlB4UkZCagi1Q2IVdNMqE37I0GRqQ2C69Arbpi/1ogeBQkfuzQi+guTQ/ky5KRp5gjAv21uE911Z9jCQyk+JOKB75RhanHydOVkgWARak24fEKgYf2pqeSRk6NpWXssLuD03sEu9CLoNOtvHkw53YW4ns2Pl+Nt79OOrGnue89FS3WpbA7cjqlkXEbAmtaOV4RR2XWcQraj9QmNWWXGo+w6+nh8Iqv5wpPTurGEeQ=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQzNjksInByb2ZpbGVJZCI6IjdmZjRlODVhYzQ2YTQ4OGE5MDVhZGMzZWExNDgxNTI5IiwicHJvZmlsZU5hbWUiOiJKYWRlbGYiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2Q2OWYwOTMyYTEzZWVkMDA3MjIwOGVjZWU1Yzg3ODhlYjQ1ZjdmZDA1ZTYzMDMwNmI3YzRiZWNlMGM1OWI0MDgifX19"}]}, Name: "Jadelf"}, display: {Name: "{\"text\":\"Jadelf Mask\",\"italic\":\"false\"}"}}}, {Slot: 6b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "2ff62933-6a15-4f0b-b0c5-12a1360a5c37", Properties: {textures: [{Signature: "p/shKU5a0PrWz7mCfH+Gho07KWqOd54yUySKAWMuRI2yiUcQmqRWEz5Cb4mwWW5kngnagBck1YDxFbBes9vHp9MgOmgJ0u0gcY1vfdfA+hImt4uQItHTkaQlYTgUiup7mfKfzWavMw+AaoGuq+4jmNyoz2WHuXcAfwHGg79JaRiYXhPqG8SNh8XX0z/sbfOdYlvvkxIKt13I7OU/rWn5FuP8XRC68Rm77GSZTz5bHqB9KaSZka4Yz6QWwQBeI4l1VX7V0DjNDA26YBrLrYf/RIFK/tTHPsuMNxgUnHy+r54ayZJ/EuUposJXLbDNY685qquqQxvtIA3S5vJ/WdJM45LZHeXKCxVCg0zU7SVxiJhbv4ptd4yQqnxATecAqssKqOVlBKDk8tHqEyPaZalZydgsffzyRPs8dyLxxZU6ULsHa+j3DfDP/8gHET8QtRsRkeifsT7r785Of8BixJXaVTlylbjYtxNlXyQ6+4US/R3q8TXVAfRyuoWuDZywt01t2Tb95RQBYVi23whEuAA+23ZKddTtS/qtcDChZTRewMArgXETEJpCfeBP6vFH8QT4pd+KbTsJxPh4bwSBtnPLAnVH+d8/Fuhe9SwZk6vrpf/uSnt2Rt3lr5CEisWd3wIMFsvTYnSWYc54cdPBxoceJ30YroLp5I/ZIEJaAliRdmY=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ0NTksInByb2ZpbGVJZCI6IjJmZjYyOTMzNmExNTRmMGJiMGM1MTJhMTM2MGE1YzM3IiwicHJvZmlsZU5hbWUiOiJtaXN0cmVzc19rYWhsYW4iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2RlOTc2NjcyMDhjNjViOTQ2Y2JkMzFjYTM5MWRkNmU5MzMzOGVjZGE0ZTg0NDIyMDlkM2Y3N2I5MGJlNDFiZjciLCJtZXRhZGF0YSI6eyJtb2RlbCI6InNsaW0ifX19fQ=="}]}, Name: "mistress_kahlan"}, display: {Name: "{\"text\":\"mistress_kahlan Mask\",\"italic\":\"false\"}"}}}, {Slot: 7b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "325c6fc0-ed80-4cff-8017-29b386ee6146", Properties: {textures: [{Signature: "kAKZSejXpEWqAsuijD0xrmZFuOD0EpGYB8PZcAHKmaSU2LOzSy5hTDAtILNXJVdQ7mEIwvoCzU5jsmZdz1NwUPDBJCBJU3d2MBuc8za7V4k7dTgtfvwIQpEy+Q8YZqoX6w6u95wJ3okqeDF/ZrGEteTelvoTxYYot8hPrPcBkSmylc1bDm/Lf8Jk0SutCmvFi27H1DjZxyqyjR9MBvOTVjh1SwcKuCOO83JGvOvIT/iQS0YmlSePQxltEb+27qPILN/oEAw3gG9sVnZyM/b7DgiExGcSnNZbCq04rI5qyLInDAg0SkNUoELa0vzpidhBkZ9RQaOr5MGYQtjZ0/8lELf8eCGA2gvhrFrHLciVXlVutUC7O13RVJGS6Stsl2jsTomm3ddjrqutu0Dm5N9pUqJVf6xD0XytiGwDhexGBMV08t8V1UmiNASbAX5nBA3tdBQeHs62LFolOxaos20q2VKI+pIrCyHUCNb6/YVYQ9sPt11xkITtipV0uDXKiOo8aS2nzePSD3I7m11EHkAVmBoEcU8SB0PxCVA6UPhsCwwf9XtVBCDIDlJ+N6cp19jrwhxNcvD+l2DAaZ6/t/8xocD/okzIkBf6ThX/SKCcbr4aJUV/31gwzta1MITFUMuUlxh0uUJtNCvCDX3K5axV/h1lguASVbmIkhcSugxY9co=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ2MTQsInByb2ZpbGVJZCI6IjMyNWM2ZmMwZWQ4MDRjZmY4MDE3MjliMzg2ZWU2MTQ2IiwicHJvZmlsZU5hbWUiOiJIYXdrbWluZXIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2FhNzkwOGVmNTQxYzVmOTVjMWE0ZTViYTcwMDZkODUxMDYwODliNTc1YmVhNmE1N2ZkNTE2ODcwYzQxZDI0NWMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzE1M2IxYTBkZmNiYWU5NTNjZGViNmYyYzJiZjZiZjc5OTQzMjM5YjEzNzI3ODBkYTQ0YmNiYjI5MjczMTMxZGEifX19"}]}, Name: "Hawkminer"}, display: {Name: "{\"text\":\"Hawkminer Mask\",\"italic\":\"false\"}"}}}, {Slot: 8b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "89384df1-e7ad-467e-9b72-e058aec7133a", Properties: {textures: [{Signature: "Cv/NDDRf/xUAFGPe2FTLcw2lWKPMDGRTsHw2kIRkC8c/JuDs8jqrrNJ7OboIB8nKdYxUS+j06eLwOuTOFSlthnHI8J9Dy//3mvrJafMHBQEsAAVkLbfkL/Ch7NAfcgHIOBulFx/nWQ1rbkp3J8csumNltIZ2YYMNVXogZNtuazNj0iu6MMpg+arg59SnxjEH4lgkyu+4/MlCzQUAO4jZd5HA6kEfeqlhrZtrvik3X33LvRGLJYWqWfaowJ6RXtg4YdZZcj1/tOv4ror0T9idFdnfM62rS0sc1wSXxp5SAkWIpChw4a45UNIKq1ABJ1LutsZB8Yax8qREtJTPtNc8SjW0xzFUJan5FActb+2wO3kOPtCbJqgfz/ooRVbkuiHaOL+ukfAY9e26EmGXVysz50B+VHJuLr7aCOQ49l7ZzHh0/3bxoXHoYI/QvTS8sFeCxR88BbkxAxm52Vsyb9YYk/oSMYIqAJwXIiKxBluOiiCBPJopneNdBtY2J4XiD0vCtgL/ItLfsPp0jq7rEIL8IFcpuq9SQN8IaB+L5BCg5IwaO5L2sByAFbR60e94c7cWNI7PAEL0Shyctftjy2y70IIHrbk/f0Hva6sVyHDZ78+YQ3Ks0z6PA+2pfMGUM5MS9wP7rp3+2FFnIKoSq+heLHm/ztVH6yEga34Nol6Uf8A=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ3MDIsInByb2ZpbGVJZCI6Ijg5Mzg0ZGYxZTdhZDQ2N2U5YjcyZTA1OGFlYzcxMzNhIiwicHJvZmlsZU5hbWUiOiJLb21zamVyIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hYjM3NTNkMjYyYTkxZGViNGVmMDc1M2FjZTUwZjQwOWI3OWJiYzQ2ODZlOWZkZDdiNDZkNmRlZGVmYTA2MTUyIn19fQ=="}]}, Name: "Komsjer"}, display: {Name: "{\"text\":\"Komsjer Mask\",\"italic\":\"false\"}"}}}, {Slot: 9b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "03b07a62-98e6-4fc4-8187-fb276d5a317c", Properties: {textures: [{Signature: "CDDFoFdu7vi/ouakhaE5+c47peWgx1FwfMs3He0N0KvTnVK5NrYOSNFd/UKjGu0rzfJkqEB87KRS3SzYXszPjB2NOAvQ+FT8dvGsYDEVsOwYEZVm0mfW3/FWQQAE6N0fWvMy5g2+sYBNXN2t80nc+XxQT0j6kLXVSyg4O/LH5yYvlO4ahZHjrP0TEmtEm51t8in/uTBFydbwHF1HFi8gla3sXfphv5xA8hc5WTt1aG6mTybvxoyDI8c2DXgUuTsM3LI6teizcnp444jufYFMt38UGI2RmKLKNaQjhO65rZS08fLPsXjgPDSe2+I3AY0s3FB4pkwiscUZ7pP5teq4K+MfMYFwFpnpmuYr2uNscjrDNgiDbAwa4i0RdYIr60hz3nGldQlI4WtPH1Nj31p07XuD4zTLrVy+8/vY+fjOb+LxyjQE8fw/472WNqT4iciyt/cqXGIMWiSa0797HJsEeBlJwoI2ZwdJB+BN/8wRUzMTaQDSVyvyvvVKjpec37810CA50q37fUiNxhG3uQPw6fGxFzjYjGRZTi74s3juUM7mE2EfT4XO8vS1eFSG3aYFl2HvitgwVgLV0XcQe9+7KMcweA/kozu3LSIhTIlDrObdERdLNYY+MK4p4mA8Ttuybs56GDUn1pIj02gv7NkdHuQGtKuasTB2Sg+101IkAQM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ4MDgsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]}, Name: "qwertyuiopthepie"}, display: {Name: "{\"text\":\"qwertyuiopthepie Mask\",\"italic\":\"false\"}"}}}, {Slot: 10b, id: "minecraft:player_head", Count: 1b, tag: {CFG:1b, SkullOwner: {Id: "07270730-7cf6-48f4-8850-11847f4d61a3", Properties: {textures: [{Signature: "Waw/ssp2yeNGdQHPOzKN1okgtHxSQ8pi0H+rZ7Y8OQBpGhw36/+8JDjg4TPoel/3YoUUSz5EqSR2IQi/0BlLIrqBG6r+UWVgH47wedsh6Rs3pW0+XtGJ0VbeIyAj153tjXyNwWY7iOWkzUvKSBMV84OnspnNLEwgqpqIB+CxIN13NXZYHdGuBCRJZtXUxgBzIzPG4F7JYKhAJ9cHjLl58HSI+IGsXu8+ejdUiPBpcuaaTL9lJD+g5nkJbOSnmd1yYpjsSNWdwgJMCA9piLGAgakLY5zAQPPuGxQiyb63etOTCJjQM8tOEI5dn+ySlgiO2SPaB1QZmh/BETQeEJTqv0VbtpFxYRt6ctSeoYOk0yF1KvcAABLywEks1Ok9hF+voEizgwMzW8kH+W2QcjjDTJpwhH3bX6YjsFPBoF6CnIklmAmLw46WlLEzZweiI5jGKBxdLn70NF1lQQlyf/PJIqzJsuq+whtwOD2pYJynkQutY0v270SwsrxIdXb8RD4SPPJ9L43QHFsUfs+tnV0dWVAVqoqPssIAL0FJE0A17sTqI0M9UA6zBiL3sB7By1YCpeyZmqjLPgXDyWU0ZZqkKgnqDd2TCrbM6cAqC38mTZkHFR5Q8C9Yw7hDzn/E8Mv45cYjI+bBIgG9qvnPWIiV7G5zxdYmmsSy+D0/y8HqhSc=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg1OTI3MjEsInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]}, Name: "ColdFusionGaming"}, display: {Name: "{\"text\":\"ColdFusionGaming Mask\",\"italic\":\"false\"}"}}}, {Slot: 11b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "3588d406-3518-4eb7-b25d-4295b4f09ed4", Properties: {textures: [{Signature: "iRLEmMeRCVphBZBJNc3yfT0Fqti/Z7Gu5ZzTAePQaFp4dbf/UYc04budmJh/g+Ya/5d7FNX8ylgd5Tw6J3N2y9azo4sDFprhWl73ec+RRubCwYtGKH5BhkVce4BgNE7E0/vjkUfoihYZdFPvMaidbG2xlsiMjfvz1jBrWRDk/oUVtkjbKwtDWvh2ISnXFbUQIq5+uDraR77xIdXmSv5H0YY81ew4RrfF1u+7TsnLfa5TipYx8Q1gw7VBRnuHncTJDP1dpumb6mUWXYAd31ioiXhiHrybtemnkaZBh+4bYtf1fwfL9KzEtdiBfq9sXQwyn3PJVrkie3XurW8CslXvcgZpTkO4BP2QlLyrjSbm3CW5hMz4y0PqnQ8qbuHpw2+h0uIZEcrwcz6vCUjJeg5YXTAxideJDRqLbWGUSg9nKp8bkJQB+J4nwnZDk2w0YKvwrT2TzEGd99z8zx2Qj7j7H0KC3x/PsubqQOmwserTJox28mZ6HKCYAwxDNX2PicBBGmYCPNirpzHNbPrg1H+Rom8j8wIQFH3dq3sV2KeulM5oOuFSz5n7+0NxrR/+74nLO+BZzZksEcfe/HvqNvpwvKwQfXy9OM1IRmWveITvacQhKTCw1tN4SLf8wmB2KA3euR6pF8aVcZs4T+fNwc3gxZoS+MjWnk3WN7eDc0ypG0U=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ4OTksInByb2ZpbGVJZCI6IjM1ODhkNDA2MzUxODRlYjdiMjVkNDI5NWI0ZjA5ZWQ0IiwicHJvZmlsZU5hbWUiOiJLb3ZvbHRhIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xZmFjOGQ1YWVlN2IxZjc2YjFlMzU0MzZhYjNiNzEwMzIxNmNhODc4YzVhMDQwZTE1YmViYTlhYWYyNThmNjgxIn19fQ=="}]}, Name: "Kovolta"}, display: {Name: "{\"text\":\"Kovolta Mask\",\"italic\":\"false\"}"}}}, {Slot: 12b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "b510224e-d304-45a3-ac6a-bcd4ce4f34b9", Properties: {textures: [{Signature: "NovMx1lgSyO7ONvFzTbdY8In2NoayNgL2xUdjt3aZthaI0M35hYrf4cUjusyl/NFIzTlISyHD9U965EXwBTOI/lAdeDbv4kqAIKrfnkmzUsCyiZV3abdQN7ue4Ml365G9IOsajgNP8XeY+E81zHTqe2B9cnfpIsurKpR0rZSEFTZTGObRaXMOcuzhZoYyYl2MbGW65o8xmB7dv5SiJUfFQokr/ZSD+bL0Smb5i9DtfKTl6JwBeZpus2cpOZrky7lP1vvJasopuTrnqvNjNeZQulXQ1PJL4uwvL1hcgu2fYXIrEvBfMCJatPn1Fywj9P26aCvPBSL6BRnGRekSnffELNGYFt65XLO9HXB9dsFVL2JhYyVJOhyFXrR9DMP1hg2srHNw1WTPUdTLQwWjHy/WyxY62ypZaASIyLq+M1JKi3TZUyQZw5S4KERhc1PmgkfJYXxF9u+Jm9VZI3wDPp3Tm/at9juar6khIDOBmqmymMUzbbLTT1IJ6iOlnWPYFVWF1Gs+u3+Q/klgnIPzK/ccmJ5UhihkUS7iyTHnXVPlW9kkHIzeUUUDrPayXumSlUwJrOBjD2D4Yn5cr2NDu0oOv8bMoiUk2ZG02xKqirU2efXLP42WXnzaXyYFS8oIQSZ9iWp3FVUYTrvbk6v0HN5XUdMl38MOmBU7J5P1iuthV4=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzQ5ODQsInByb2ZpbGVJZCI6ImI1MTAyMjRlZDMwNDQ1YTNhYzZhYmNkNGNlNGYzNGI5IiwicHJvZmlsZU5hbWUiOiJyc21hbGVjIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lZDYxODRlOWQwNWI0MzUxNzY4ZTM3Mjg5ZGRiYTMwZTZkNWIwNzA4OGZkODVlZWY3OTY5YTA5Y2Y5OGE5ZTVhIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85NTNjYWM4Yjc3OWZlNDEzODNlNjc1ZWUyYjg2MDcxYTcxNjU4ZjIxODBmNTZmYmNlOGFhMzE1ZWE3MGUyZWQ2In19fQ=="}]}, Name: "rsmalec"}, display: {Name: "{\"text\":\"rsmalec Mask\",\"italic\":\"false\"}"}}}, {Slot: 13b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "ac565705-9a59-43bb-9716-1c2103e41134", Properties: {textures: [{Signature: "v9F4iKlire/pIYyON8UMnQcTbWkPREmUSmKxMP/o0BrIy9VL0pZRhMl7giJ9y20kitb89sPK1rVIHgm2SZh11o0fh7l3cUY05eP1MB+pV1araB8UTJ4x7mR4uS5/1hhvJb6XgVWKtK9GlkAYeHnL0yEjXGxLIFWh5cl0xiTNmLLJZUuq2A3ZHIkAj5t+0anVZWmENpZMwU674f07qTreBj79ElYABhmtoTeGyJVgUk3ZGdRWYs8qEpAAfFTe5glHigo6QehYmUchJiLzQK0IC3CeOntLJixDLl9E3SG6UUrRA3yQLwlrQjKIpXM3fOIoP9A7K4QWZNr9AKiaA2LFWejyRzhjyBnqFuHVo2RqX19K6mRyNR6keMj2FllqQ6+Ms2mnUQQ3EBCvML8biK2ViO3q51SaoTIlK552mMTlCHFnMKxkW+OQEdD3v4MErkd4pKJ/NTaXZk/l0iegK90sL52DeBgMNlkT0mG/GauRg48vsClCisA3FcUnUnxhW2SYaShmXeQtwSpHCCp42YWIjFhnw0aUrKodHl1NSvIHJRNScp84ghJnQlVbeiQMsKiE8XOocsW8hJmF3j/aZOQC9Be/2+mj9VNvWBbNeqz8YkrzlXhZYKbvbyeBSoACrqtnrHShBvnQEGvsMbEBwT6jGAzpqt82D0XC0bH1hmDEdFs=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzUwNzgsInByb2ZpbGVJZCI6ImFjNTY1NzA1OWE1OTQzYmI5NzE2MWMyMTAzZTQxMTM0IiwicHJvZmlsZU5hbWUiOiJGYXVtZSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzYyMzU1MmJmMDEzYzM3ZGRlZmI2NDNjYWVkYmVjMTUwN2FmNDMxM2JhOTQwNGE0ZWJmNTVhMjVhZjViNDQyNSJ9fX0="}]}, Name: "Faume"}, display: {Name: "{\"text\":\"Faume Mask\",\"italic\":\"false\"}"}}}, {Slot: 14b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "82b9d7b2-24df-4205-8be3-dcdb7a74a635", Properties: {textures: [{Signature: "g5sdJUgVUPqxTtVuhjIj7IlcmmZwQ0eNdisGfEQKM+c/hO7inhBoyfkCCiIk1xPG8h7G+PKOR3ZuCUCisLpvzZPLPFiADTlAVrQI41Q8hzvfELmGICSQELjbqzHwt4Zh1s7TU9Io3ZwbU+8QjE/2Y5xK79N1oSRyDQdL/YFsgsSoI4BVD8LvtScUwakeFC2fQdGtHRkV8Uw47ADd2JACUmBIRAdQKZHsdXFDUfRmcUUN6CCU6hOeZgs7VVzzjwZI5aaLzWpgoCJZeJ7na5cVL0fSRpXLwGfVan+hioqFpDzmWZ4hBdImFiOnW4m2Ffppi+u86uVCZV6gQbAN1ZAgqZC6nwS+xX9OQCtSrRclFzBe+g4da0n8uz5CIrHkls2V021pVp6KF/Z8yqh0t/Nl8YkDIwEwOkB8Mx1h1KGF13LXk/cnyVr4YObhQZZ4/UrNU9YITSqbnTkiyVJCBqvkAq4yqTQUVn52Vg2Y8DNl3Gh2VnCsnry27/Lx3W5GpgpoQ2tDX4eFTrt4Ttwq6FQdckhC2KAIy9LEknDvIZmkXUHKf+joUK3I7Cv4ZeJpJXvQtzgZF5x7SUt16/yyKzKABTqbVOgxqiq7nZXoZvZLaToLlTn2ADHVR7hvsk//5haQlcS1jrP2RtymXFdDTiEEWT43qPyaxaOdaVWnH0nT72s=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzUxNjQsInByb2ZpbGVJZCI6IjgyYjlkN2IyMjRkZjQyMDU4YmUzZGNkYjdhNzRhNjM1IiwicHJvZmlsZU5hbWUiOiJDREZETUFOIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9jZTU5NDcxMGQ5NGY3NGRiMjAwZWI2ZTAyNDViOTZlNzE4ZmNjZWYxZGEwMmY0ZTRhNDI3OGY5ODdkNjI2NGQzIn19fQ=="}]}, Name: "CDFDMAN"}, display: {Name: "{\"text\":\"CDFDMAN Mask\",\"italic\":\"false\"}"}}}, {Slot: 15b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "8159c940-b316-4826-a7c4-573782edc3ba", Properties: {textures: [{Signature: "LUe7jL0TCHDIs0tZEtsmw7EyUC7mzwLvhFW/4S55YI3S/Sq+gF+sNTUeyV9XY81h2Na+NNEZXoPf3WuArCEyPLmOi4/oq/B5evLuQ4zrogz/5R8BpWMt1z3KvAVe4zQDzeSP1eK8cii9m2kWRjSQwOcORwUwh9xE8lIOfmkUICAfdg3R2jaBvp47nAGFEhZYonetkqvuVLYAntoFZ0pxymQPx6blXcMgvqOQAeUOTXJ7nEPgG4NjDc3wgtamqVgUypD7X61atW4GqXJxnCjahNlr3BCZ7Suf9olXUhJ8Wjm4mgDgBlv8MUh+aTNkbYP2eYemp7yCUEe+G+DZ06bbSDxrvK6nxjKykHl3CNlkpGEezTIJzVlxenGX8JCxJV7UBg/lq3S+nzblpxQtLQtstN0UXUygQjP17ci3wK0B1gkcDPNsL45ezpBQJ4drvDWw1wWwlA/ezv3UUQkma+0cMjndYQ/mgNYSQE2U4Rr13yXqo8cc5KBB8HsM7sddgrNJDax3zss56viqtHuN8nlegpaMQRX3u02P7JaDSWL5vXzRDocfDcKJhCVHJ2H8h9P3Y1OftKMFS0z2p3wVkpYjx3rnpUKESc22sPmRUKKSy6YipXgLKBO1pP0S0HNrYug+Y/BE57zW7isZO8isT+tg385kM1yVTTXlLQ1nFNE5kXk=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzUyNTQsInByb2ZpbGVJZCI6IjgxNTljOTQwYjMxNjQ4MjZhN2M0NTczNzgyZWRjM2JhIiwicHJvZmlsZU5hbWUiOiJVbmxpa2VseVdhZmZsZSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjkxNWRiNTYzYzJhY2I5ODllMGNkOWNkNWMxY2VjN2MyY2QwNWM5ZGY1ZmExNmIyYjZiZGY5ZDZjNTA1NjRmMCJ9fX0="}]}, Name: "UnlikelyWaffle"}, display: {Name: "{\"text\":\"UnlikelyWaffle Mask\",\"italic\":\"false\"}"}}}, {Slot: 16b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "56d442cd-2bce-47bd-8f98-0b1b96189d07", Properties: {textures: [{Signature: "emG3hKYnN2EhhrkJ+5pfkCZWeG6HK/qvYTpOCzBCWKyWkdN2ptaq5xjSR4HhZQRHW8YWsKhpqw8jtrAwY+HjULx6JE6cHYB6fC7iwCBEu+nYWcNwciM7aj7Fsi+SLZ1pc4VIc+lrkOxv94o1uRpCc6hGaU0DRDeTq+lM+SxL/QrxA9ojWZ4RAPa4tsB8o5Ho0UCmEy4M7pDEFbYMa3pDQGoMVanAqm6qyntbCK8Jz1ELvuZywF8YyRA2Zk9s5ZWi3SnOYxAbGUDHTZDmhqXidkzACKoJt/7iVZyZyHIbdtgwOJKRJZ9KaBRLn+m4Dt72zekkfS0PbugP8hnzo6P0AdrahuuMCpWKSMWXbIT6kXqtD8F2vU3ZUAbC2Hhef/ifgr4zY+mk6uJXiLvf6bB+MlBJs00NPYjdz2Y6XQC4hfONZCyvA6s4vzMZ6vByU4/PNMhoUpmoSPiLxDyDhHJAq1wXKsK7yrGhVi74Mlw/JntJRXqhtYuRuT0Ucb6Qb18mRMwugl549/nuxIAUKPN9S4rUeBSaslbM20qxcemj96/rgUm8fKOJwuclcsqAVyxNN+Bs7cYjAAy/Lz4ETq24eDGKMu9Z/dT2RnFtFGuXF9MJaRNO2PMDiAXf/41FLqB3Ld1FFYkxWgMTxrPLX7nv5VPNuazdInO+AAeg0ecsirc=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzU0MzAsInByb2ZpbGVJZCI6IjU2ZDQ0MmNkMmJjZTQ3YmQ4Zjk4MGIxYjk2MTg5ZDA3IiwicHJvZmlsZU5hbWUiOiJCYWtlcmJlbGxlIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zMzhlYWMwNDYyM2JiNzgxMmE1ZjVlZjdkZTA1MjlmZmZmZjUzZWZiN2Q1NzlhZjBiYWRjNTNmMzgwYWFiOGMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2U3ZGZlYTE2ZGM4M2M5N2RmMDFhMTJmYWJiZDEyMTYzNTljMGNkMGVhNDJmOTk5OWI2ZTk3YzU4NDk2M2U5ODAifX19"}]}, Name: "Bakerbelle"}, display: {Name: "{\"text\":\"Bakerbelle Mask\",\"italic\":\"false\"}"}}}, {Slot: 17b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "ed324acb-8522-4008-b485-b7544bf74b8c", Properties: {textures: [{Signature: "YGwj5bqQMJb7smzcNFEcEFHNMWXnDYrkWNuiPqU+P8e028akZOiV0bxT4EX1dlZhNGv2zGcuqB0N9CoMbnT9Y4p9gO0CZb4oRb24POiA6wmaYzNb3ldceencRWmgF4l4n9+p525/guPvD8CX7gxYfLfUqiDtYEuYkzC9FHO9vHnC/zygKgJC66aIYhyo1QKtlwUxXWBlrG8nmiU9gov6VZMs2Ri2mrP6zlZLtVTK23KKv+zye2hoISladtqnciym9XRGJEXjh8GnLVFXqp0gTLy5NszLkUcoWPvBVDW4tAG6tKUAZ/NsEjIytu4hpQK3AVYOIbrz8tVAwLNoPbCras+6vrWEXRBMAi+VkRTbC3rCMjvNpChWbcGd83rUpQGcPUIN2crHIYeQzhlXdJGJIqMxMgydsijkDXGWy9R5Ms6dDJg/HbNHtU7Xb3OIkwPeewHW60YESRTTEGIX6ZngVifFD+139u/ioPS0faa949ST0/8fmCZUHLlgPUvKJW8eB+R8LKAe+ujP1o9ZYgutcdY2Ow8HxsCO/RgkrKh5YEcGBXQRDsNvIkmfVwgm4vjGeA7xOVSZXEq3An5xs1tjS4ksiRoH4eZGS0qR7uRF+VSymhU/P0HqhMQtGo4fpXZMgOUEgB3M+aKcjPIKQpMWt94XGkcRyL8I+6zEIMx5OUI=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzU1MzQsInByb2ZpbGVJZCI6ImVkMzI0YWNiODUyMjQwMDhiNDg1Yjc1NDRiZjc0YjhjIiwicHJvZmlsZU5hbWUiOiJGYW5ncmlkZSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTkzODk3YTRhNDdiM2FkZjUyYjRmNDcwZWFlZDcyZWU4NTQ0ZjYxYTI3ZjUxN2FiZGI4NDRkNjY1ZWZhMGUwNiJ9fX0="}]}, Name: "Fangride"}, display: {Name: "{\"text\":\"Fangride Mask\",\"italic\":\"false\"}"}}}, {Slot: 18b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "1ca31321-dbd1-4c83-93b8-f58311600709", Properties: {textures: [{Signature: "F1YLXZp5q4i/5jecEPpE/KIp6Wu4vgweSbtlhGVPplEq1PuhLcoCGRPrnJx0FQtKs/npynRNvSf/ubkcEMmanHbCj3rEbE/nnF5716kbE81sWlzy4wLUxgTcV0UntGZkhLqr0tE8iZ0QDMJ8obtRFpV92fqPc6vKxXWm4Ch8tqKdEZ2hEwhpU6+zplNe76d7eDDiz9F/wVw6DQasrNs711ECuMRftV7heZC+Fs7n/EKfsZFrK/VMmnJqtW8cVswF+DbWsgsVntQI1vug7DEF6FJCSGpUg19htpMSm5kWnwNcGWBCa2m6PorwTL6MS+PCRqcd1Y2PP1nBtddA0uXAlTwQxbPj+mAn1AEGOSSWVSk5TWvupPCe5pTDPiWtWU8IeHO9jIl8Ji0r1Bu4LX/14eGtKXtPVGtGyAtOv3HFk06n7OOWOibkWV4pU6aJWxNQBO86Qpj/NkEw/HYCeXVMaqQ7ymXSavL62KHOLGeyer5Rm5lKDJysqI0Y1Pu2k+JqW9CS4bjtdDa8vJpn0zfy2gJwouQ/lN+z5EuOsVBBacIA3jXqcjsREYuQNOHmLXzcyUqsp5fy7z8+UvtLtHUC0v4zNV5XqEyUVu2LFSifHNpYBjMVvenntKrWvuipmWVqJkha+wJpL00mfpOjuZmw03FlRVRNVVPxfqRmlAp5JZQ=", Value: "eyJ0aW1lc3RhbXAiOjE1MzU0MTgwMzQxMDMsInByb2ZpbGVJZCI6IjFjYTMxMzIxZGJkMTRjODM5M2I4ZjU4MzExNjAwNzA5IiwicHJvZmlsZU5hbWUiOiJkZW1lbnRlZGRvb2QiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E1NmY2YzMzOTY1MTZjNjM0YTg2OWVkN2IwMzgxNTUwODljNzg3OTliOTA0ODEwZWVhNzQ4M2VjNGQ2MzQ2YWEifX19"}]}, Name: "dementeddood"}, display: {Name: "{\"text\":\"The1Kwa1Jsucsh Mask\",\"italic\":\"false\"}"}}}, {Slot: 19b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "26fe7806-9bf5-455d-b460-706c99ec5f0a", Properties: {textures: [{Signature: "Yex1ja/uOJGAqSB/mBjWnL99cdQKgdvcGC0UMStcllXvwuumXmt+40eL3Aqa62lUfNm5pt/s6tNCU5uN0S5CTbaOEPYCG5DvuiZF0qxXL8t6iQDjflhRpcLEUeYaFqcWXnOTbifKXPQkcHzrWtCtk/0jGO3TlHNZoP5TVpeu0fC54rQlNBfgf1hl52SMv7jneg5eAj5dHmEHKucypMHJPmynR8PpUShkd2a0Lj0gCZTAnfGkGTtlLyXStcME8u+ma1/hTu76IFZay4rha8tZbIdID5D19K+1uZui241UPNCgBL2vNpJR36caah/C2j7owjAm1RaryId1PxCuszpR3Osb8Fqj8yC4SaxnFPmhMAh+FwXzXFru4okjIr8vYmm2nND78oghh+0qN4z7gD8BSntlHDS0Id04D/vpGkIV4pY4kC7JEfvRzLAj8CftdjFSU4ofp6lLdigyAziX+7kLw/DhqNddW0spxlFSmWAmDC1wM3fhWq9324q3OYBe1dZGyi1fsXGcCyKOCESpcqnOQxn2aRb6ZV9STqZxXCNcCDWbqeHJJx8iNpCqwSY09fZvC0EMvD0sILAyhENWDzuxQsdeBLItrRUig/AopIjMv/vRRueGNkXlDzG/qVY7Z4N0DSE4DXvxjdkvBPJKrcCzILrqyjfj5baPnAHDKHU8c60=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzU3NjIsInByb2ZpbGVJZCI6IjI2ZmU3ODA2OWJmNTQ1NWRiNDYwNzA2Yzk5ZWM1ZjBhIiwicHJvZmlsZU5hbWUiOiJOb29kbG9yIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mZTY3OGI2ZTBiMmEwZmRlMTk2ZGUyMWQ1MjczNjdiNjkzNDMzZGRjYjk3ZjFlMmM5MTFlNjAzN2RmNWRlNWI1In19fQ=="}]}, Name: "Noodlor"}, display: {Name: "{\"text\":\"Noodlor Mask\",\"italic\":\"false\"}"}}}, {Slot: 20b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures: [{Signature: "eSeBQp7s78ow/xnMRsCVpybRlPN2uH2v4EjdGZdbFAGjOHy+F45IFTj/xE3zkMxEgnyE85yRCVpVNett+WVYHlwBw1boSMTe/3A8rbAltv9yBK9bLfrRtEFgVKM58Pug83Xsx3wxFIvE/i7jBGf7NX+9QbKymvwzeS58QKcdCnjONVK3SyVZFyFAcUiOqQ/TerF/63Ng270VfnXRqM3GlVEhhNIQuZzWIzXpj7t8Gif/BUPUFrCUuQJmwTKTDB7Qljr2z/2pf4LN9NlI1xY2neeW3w24z1YlpdoRFoQ8UbfEGOqGhULezJqGDWWq6dRA83mRB2qVZ4Pk6CHaK+3dizW8zbXBeT4QDYOyUolSm2gLtuyPRzQDfG8VsmUGYTO/vsxselaS7faqAsx9yUE+0AKKPVJnr9dFDE8P3Bo1di1Be8P+f8KJiV7+Sb+CDprByCqw4AJaI+5WPChIDRuakkI5klPmQh/7f0c+pe0i0rwT2C67EDayFWzUWpVgB4uaytkHLIVVRahrjJ2dS7rWP3GMg4+/mkeqZYBdqLaxPY2o7xs9P7Rg1x2FMs5CTvmTrZmTXLPB63M7G7VgnloNv1+Kp00FBJJIRsBHbztwZXS/q4QcUQjQ+Z8agEjYGf5OJ2Sf9sAO1BCqlBXBIsKE5cWTP1NRUQL4nr+iYPhmXNE=", Value: "eyJ0aW1lc3RhbXAiOjE1MzU0MjM0NDQwODAsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]}, Name: "AdamDJM"}, display: {Name: "{\"text\":\"AdamDJM Mask\",\"italic\":\"false\"}"}}}, {Slot: 21b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "65fd1d78-e2c8-447f-97ed-c3722af0a210", Properties: {textures: [{Signature: "d7gA9iNj3KDpCy1TB3Olrwtr4s/JRKIZSv1ZyBXKf+btUevd0kBes/hvtB0cIlaSopIJvjpWg7NIjYpUlD1bNvwqDcD4kObBZN2YPoM9XsAAJhBzipAPGlzY+wyVIYDE5jSL+dWE9Gp1vvbFuGF4YrnW9wVNRXzyHrHc8/IV/4d7RZ3UC0KO3ee+ESsbV1UA73PJ7SN3DbCSSHXijI4T0qgWcR6SgoypBrGx1LAt5RudRg+rrnzliT+fQ1hiS6jZ834nbpAeR22bMn1SwZO1MCELMPpvfMoJCpsnquzQ18ItbkAGeyJ5L4YA1tzmv6zALZgmrM87NW0imMky35ZFgi3oJ1XCJENoHpoSpL9+NTESiOOhtPRwFs1uU8IUSPAV2lUAje/ecbTLxVvSCGUxOK/W2NbzzFqn8UaV1vw019bvos+F657+GQ18Y81fYHnqaS000teXubuWCONYM7qfHGhS5sZLe9BF4YCNykOwwOfbd7OBU3D7rV2EKO9RmN00gZF6ofSeFZhamsChwUral9anwLYnKGqwFcJImHlFhW/2OT9aaK05eGL2j/hGX6Bt3d5UvhDLa5iKTg8GehRW+9LMpQztqeFm44f25JD49lsrziurktRL7mTqqkkBoRTcYhzcJ3lyhBNaEtHtv1qzoswwKCWODAgXrbyLxmnU0bw=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzYyNDcsInByb2ZpbGVJZCI6IjY1ZmQxZDc4ZTJjODQ0N2Y5N2VkYzM3MjJhZjBhMjEwIiwicHJvZmlsZU5hbWUiOiJGZWxsb25pdXMiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2FhMDZmZGYwYzM5MjA4MDFkMmI0MjU0ZDkzNWU3NzZkYmVkYmYyYmE0MDA2ZjNmNTY5ZWM3NGYyMDkyMmU2ZCJ9fX0="}]}, Name: "Fellonius"}, display: {Name: "{\"text\":\"Fellonius Mask\",\"italic\":\"false\"}"}}}, {Slot: 22b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "259cc676-7bb1-4190-bd4f-e67980f3f99c", Properties: {textures: [{Signature: "Q7kFF7k8SQ5aCM7OfgeUpu8/te5A/eZpbpgn+gOaJ5UhqeNdGTe9OcEQEOYCkXkJmm50Y6OFoN1LG0h1EwcAaZKdRBC88oVUusuJQlXQrQfs0FdHELSEK69mZrNim9B6ONLcj3UbfNQ4878kuS4/mFhJPUzcE63kPNmIo96CBzOWbGiG8U6EkvCfuAtwrlWCsXs23y7aXwvnzbRIcjDVC3WygQc8vzEgV9vC+MLnRsiYiUfXibg72Xncfi/ocHe/RI8q8hNtgArcUBo9U1qRklT+RUOUGOMDOHPJBo8k5HxB0Wtdwblrwc6OTRvteAaAlJtBhCIbKhlrKnauA2+F0A2spmJpwX/t5VUMFycWosrDSgNlfWtOiGLWFZVGeQJBsgdFGhSkM0HETU9dPosxqi9jUchBf8jD7UmR1pr4FJ0k197iHQVEjMPkkuB7Hj8zRWBDn1dc97707yGaHRrDjjr8udJu5WBPhSRpVw23sqViIuXO8MYm3cagcHt4C/G3FdOdzWmUMxy7eKkt/a78RWwevZ8n8hc00vIpIS8ki1wAKPNXE22Avd6o2yKbfhG/0eRxPv9iIgZeCxP7a0ZHwWjvLW4DKVMZor7ZTA+Wtc8RYijhuRueiLifT2RmBhJ7+M0o7VI+SL3v1CoXNNIMj7aULQvxbWWAMupn91P7QhM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzYzMzksInByb2ZpbGVJZCI6IjI1OWNjNjc2N2JiMTQxOTBiZDRmZTY3OTgwZjNmOTljIiwicHJvZmlsZU5hbWUiOiJCb25nb3RlenoiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzI3ZmYxOTE4ZWJkNmZmNGEzNDJhMWMyYmFjNDkxMDBkNmQwMGJlYjdjZGM3OTBjYTdmN2QxMWMyOWMzYmYyM2YifX19"}]}, Name: "Bongotezz"}, display: {Name: "{\"text\":\"Bongotezz Mask\",\"italic\":\"false\"}"}}}, {Slot: 23b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "6b89a3bd-3950-47a6-bc0d-e2a0abd625b3", Properties: {textures: [{Signature: "PKdaxRDdPnIxdpwDDhU62N7AGUTf1n6xeC/RWxSB1Jc+xzeOJ87kLOFK69EXuLSYDeJ5Q4TUTopP2DdS9sQPXKRAqyzKDtKavJidD20F9QnPj3e3Z3HrRmKR+hSQO0ic2dq4kcBvs5SrxaID07qSOapiYIrfQ+7xHTyHH/FsGUz75rwOQhJzF9lJQbk30K8najHCWQtiyUJ64JztBfH5vYEsf98KTaoDghoSZH0/ENaH4YFCTLHiNVO+AJfnUCK+Z0/UxOnaz/s46CsFb3pmBbboxulU8ZkoxBP17rzDq2Sox3Pcml6LdSNQiltO8svn+dMc3t6OPwkrIW514aa6GUUffrfiEe9Oyo7/gMZRrrIrGonOr0HUJRe645xhdBaoYbUSdzrt0ea881vkb20bFhRQ21Ys7nHO6K1ryCOb7N52i5oo6o9yVwIPL+E0YR+BNSOAOaw8vym7wKAw0EibQHeZgl97TzpEHTEkilaphCvw6iWugxGxB9vD84En61Cwg0WoBWbOW4xIwVSjpgkhPrUcbHhZqSkZuTsnbMjAtPGfcwLUmNRmJ8+0NsINhtpxMe3lRzLPlUKA1ytT7IkAzVbdBm564uIwUZxQAVrHTJ7wP6vg252g/waxFrvRIkkuSvK/x51gSnmCQ6VlTVaZoanpq5ODWfBPbnhAhQR9fLE=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzY0MzIsInByb2ZpbGVJZCI6IjZiODlhM2JkMzk1MDQ3YTZiYzBkZTJhMGFiZDYyNWIzIiwicHJvZmlsZU5hbWUiOiJqZ2F6bW9tIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81MTk0MWJjMTg4MTA0ZTk3MWNiZTY2MGUyY2M1ZGQzMDZjMGQwOGU4NDc4ZjQ4NmRkMWMzNDJiZGVmMjNkNmEyIn19fQ=="}]}, Name: "jgazmom"}, display: {Name: "{\"text\":\"jgazmom Mask\",\"italic\":\"false\"}"}}}, {Slot: 24b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "4eb2cae7-a8cb-4b18-967e-4499f3b5bf21", Properties: {textures: [{Signature: "jwdfmhF+ratkyEGzkvOIgnjPyQCMzoWat6RLNknVxdiWzSme6+iOkZk76gz0okp8Ybwk6DM0mHEPFcSLRcPkbGTPG7kV2qD/GXC3LS7X2Rrcch5GujPNMGk/G++azmszoleLUcP2pMtgJ9GN6aEAMlsqRfZV/3q5OIbjGu9YdWeb3bHcXm7DPxr6bPGPqFFgC8bJ3NTgt24U1MhXkg2YGkA3u1jXqsF0sqy5uqDP+0k4vcdn/GvBBrFoVz/WeEjXwLElJI5biCcFpefWVdugSDCB6pe44dboK4ICpdv6y9pW7aXvgAuEtoQsf/AJTVlHlNbnhBdGW4oouWOcp6yUUlGcIe9HnJE8YB9HStYezSOjShD7hsDcaSMTXAFFseH/gzVdExVfiWicjb8lJ2Tnedadn7ROpf2yaFi4A0PEoN4OEjYzB6dkqb2C7F5w1C8A2iklybNoMh310POy+QqFulD73OevDncr59BySE1jc5yIoBXYcZQjqyuS6h5LE+Zg5iQ+ADX310kuROcBc+6DFKZzK99XuqO32FrQrEaECEjflJhiNF06lr8DDUkFSK8bCFmjY8a0548lCt71GxN1J6KWzBd4B91vaY86VYR4KBBmm0oZftFlooHGdfWqYfR/empbFOCC9HY7uxH9R4407NFPAlHMzfrvLx/lRvZCtQg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzY1MzAsInByb2ZpbGVJZCI6IjRlYjJjYWU3YThjYjRiMTg5NjdlNDQ5OWYzYjViZjIxIiwicHJvZmlsZU5hbWUiOiJCaHVuYUJveSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTJhNDYzODk5OTk2ZWJjMGE4ZGVmYWRhZjNjMjFiNDIwMzRiMmYyYmJiMjcwOGFjZDM2ZjA0Y2QyYWMxMzJhNyJ9fX0="}]}, Name: "BhunaBoy"}, display: {Name: "{\"text\":\"BhunaBoy Mask\",\"italic\":\"false\"}"}}}, {Slot: 25b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "54a554b2-95cf-4254-842a-4c0b5fcedb93", Properties: {textures: [{Signature: "IU0kIj2obcQhaabDbLbGYEXLRYMHzBCgK/xHgRF3DtFtK9BkPHeiloVgVyhEIH0lua2kgUQiYtzACV1ysablxFFQV9LxFQwhbs+E2MNNwfHXoUPjuZ4WjKJ8udHlK+GjyyCDWtS6rCPYIDroEU3S3rIu9hZevkVJr6JzieztNtBz0t21/Qh9+l2EKaROhf3XXoMedCD2ZcO487dnX/boUWNznWUZOA8vUkH3oyl1Fh9hy2hYWArqbQOLnGYV9Kgh4+quDrZa2oi50xDBY2cqIYjlRyypbxsaSzjZHTLRLHsdLLzalxp/qcmjvpc4qqdosYgZeR7lqgFK4eBnKZAf0Z8khkCwg61bGeUGNQc8XAP1EV0QRnshC8pajDEbXhbydzrG4o9rJhqn9RcUvu1/BpDZHftRzgmJD0K0soCpYXNvV2FKOKUBZ2Id/66pwU7qanQ17kR/MQfEejdc4VEWxOhEKXgusVqL4bh3t0MQSnadiOmnaOd/VD7pwvezEmTogcVllb9HH3it3vTWk3FxRuikmMtPceHBxkenqUkEtspNRkwEMtmxUfBL8Mq6nStaTZXyVOZ77oirUE70DFbTxRHyiCosSDyvCyrV4y58xACHW4RAOWBifpVVzgCoKwYd9SqPLOtHZ6AInq+F93LQEjz3h6lvGp/fijGzJ0Dr1cQ=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzY2MzIsInByb2ZpbGVJZCI6IjU0YTU1NGIyOTVjZjQyNTQ4NDJhNGMwYjVmY2VkYjkzIiwicHJvZmlsZU5hbWUiOiJCYXdrcyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTVhOTRhMDliYjA0MDhiYzQ2NzI3YTZjMzA2MWI3OWMyODE2NGExNTg5YTBmMTNjYTliZTE3MzkwNjI4ZDFlYyJ9fX0="}]}, Name: "Bawks"}, display: {Name: "{\"text\":\"Bauwks Mask\",\"italic\":\"false\"}"}}}, {Slot: 26b, id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "1ce0cd15-4e3d-4ebc-a19a-db8ce9e9c9f3", Properties: {textures: [{Signature: "Fkh39v/P+UmFe6FPPz5rY6HHNJWcWsgeYJ1yeiKhXjIRR5fLyqm5mNwa7pGRGi9sX1x0ro139d499yO5D+X1hLO65nYh/fsdrZZjw4Do8AnCI/7YfPd/+SCwJrz5QVOPcdShisTi/Ha0NfdxNT2bRgClr9UJ5u/KxK2e9oK0BT8RDx5vsiSW2pFXNu31PjbYJUnjRQHUxFkJVbnc4DwXJ+m+pqYLXcXXGLLj0RF7J+dCeYPte7o6OB3HKKeGgYzlcHBzAA+XOthhQNLfO6PrA2x4SNC2ibJgBiLwdqKW4+KrwjTpRWCHaPQHBZ/+WrLJ17fgByFXTa2wUqYLeUDOwkJC6pMsDFf7f6Yl9LPhIWiUUQLXTdBqeZS7rLWQ1Y10fDoFqyJjZ3DjibOLMTp8lkQ7W6VpeEKHBp1cfKtLiSjfP0edK89VNkZ9yuVRaUyFsKs+UUjYI7pTdoq+1zmqocnRhIvbLBEOwE1P6txUGTRMsuiehzd7T+K6WKzT+ITvZSb+KCBDKExDJkUnJFsttCxW5y7I8qNg7qIC4UvKrw5N95W4JPo/tb4nCT/njVo2ZibaLp9PvXKeZikuNPb2vZFJ8/Nm0pBbBWm8iMXHC9OIupnWzkQBAcbvmkSa25n60VKwkdrwelAQ4BYUoUGIDycjRDd8GFsXYlA0rchD3zI=", Value: "eyJ0aW1lc3RhbXAiOjE1MzMzNDg2NzY3NDksInByb2ZpbGVJZCI6IjFjZTBjZDE1NGUzZDRlYmNhMTlhZGI4Y2U5ZTljOWYzIiwicHJvZmlsZU5hbWUiOiJDcm9tbWllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zMjM0Y2FhOWE0NThmMjI1Yjg2Y2YyOTIxNTFjODljMTFiNWUxMWZlZDExYTU1ZmM5YTUxZmExYmJhODc0ZjQxIn19fQ=="}]}, Name: "Crommie"}, display: {Name: "{\"text\":\"Crommie Mask\",\"italic\":\"false\"}"}}}]}

execute if block -912 11 972 cyan_shulker_box run setblock -18 5 46 cyan_shulker_box

########################################################



# TRIAL 1 - PUZZLING PUSH-PILLARS -> LEVEL 3
scoreboard objectives add Trial_1 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_1 0
execute align x align y align z if entity @a[x=-1012,y=12,z=988,dx=16,dy=51,dz=16] run scoreboard players set @e[tag=MainEscapeAEC] Trial_1 1
execute if entity @e[scores={Trial_1=0}] run fill -20 2 46 -20 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_1=1}] run fill -20 2 46 -20 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-1004,y=12,z=997,dx=8,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..2}] EscapeTimer 0
execute align x align y align z at @a[x=-1004,y=12,z=997,dx=8,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..2}] EscapeLevel 3

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=10}] run playsound ambient.cave master @a -1000 12 1000 1 1 0
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=10}] run title @a title {"text":"Trial #1", "color":"white"}
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=10}] run title @a subtitle {"text":"Puzzling Push-Pillars", "color":"white"}

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run summon armor_stand -1004 33 1001 {NoGravity:false,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[0.0f,0.0f,52.0f],LeftArm:[0.0f,0.0f,341.0f],RightLeg:[36.0f,0.0f,49.0f]},Small:0b,Rotation:[270.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Pillar"]}

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run summon armor_stand -996 39 997 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[335.0f,0.0f,39.0f],LeftLeg:[0.0f,0.0f,341.0f],Head:[15.0f,13.0f,0.0f],LeftArm:[23.0f,16.0f,335.0f],RightLeg:[0.0f,0.0f,20.0f]},Small:0b,Rotation:[89.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Corner"]}

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run summon armor_stand -1006 61 991 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[267.0f,7.0f,142.0f],Head:[29.0f,45.0f,0.0f],LeftArm:[241.0f,0.0f,52.0f],RightLeg:[10.0f,0.0f,10.0f],Body:[0.0f,0.0f,4.0f]},Small:0b,Rotation:[39.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Dancing"]}

execute if entity @a[x=-1004,y=31,z=999,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Pillar] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-1004,y=31,z=999,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Pillar] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-1004,y=31,z=999,dx=0,dy=1,dz=0] run kill @e[tag=EscapeCFG_Pillar]

execute if entity @a[x=-998,y=38,z=996,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Corner] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-998,y=38,z=996,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Corner] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-998,y=38,z=996,dx=0,dy=1,dz=0] run kill @e[tag=EscapeCFG_Corner]

execute if block -1008 62 994 lever[powered=false] at @e[tag=EscapeCFG_Dancing] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if block -1008 62 994 lever[powered=false] at @e[tag=EscapeCFG_Dancing] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if block -1008 62 994 lever[powered=false] run kill @e[tag=EscapeCFG_Dancing]

teleport @a[x=-1008,y=52,z=992,dx=16,dy=0,dz=16] -1004 53 996 315 0


# LIVING ROOM -> LEVEL 4
execute align x align y align z at @a[x=-988,y=66,z=1009,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={EscapeLevel=..3}] EscapeTimer 0
execute align x align y align z at @a[x=-988,y=66,z=1009,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={EscapeLevel=..3}] EscapeLevel 4

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run kill @e[tag=LivingRoomArt]

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -983 69 1012 {Invulnerable:true,Facing:2b,Rotation:[180.0f,0.0f],Motive:"minecraft:donkey_kong",TileX:-983,TileY:69,TileZ:1012,Tags:["LivingRoomArt"]}

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -989 67 1012 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:graham",TileX:-989,TileY:67,TileZ:1012,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -991 67 1012 {Invulnerable:true,Facing:1b,Rotation:[90.0f,0.0f],Motive:"minecraft:graham",TileX:-991,TileY:67,TileZ:1012,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon item_frame -990 68 1011 {Silent:true, Facing: 2b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 110}}, Tags:["LivingRoomArt","VideoGameMap"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -989.5 66 1011.2 {Invisible:true,Small:false,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:lever",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -989.5 67.35 1011.475 {Invisible:true,Small:true,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:acacia_button",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}


execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -989 67 1006 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:graham",TileX:-989,TileY:67,TileZ:1006,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -991 67 1006 {Invulnerable:true,Facing:1b,Rotation:[90.0f,0.0f],Motive:"minecraft:graham",TileX:-991,TileY:67,TileZ:1006,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon item_frame -990 68 1007 {Silent:true, Facing: 3b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 111}}, Tags:["LivingRoomArt","VideoGameMap"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -989.5 66 1007.2 {Invisible:true,Small:false,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:lever",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -989.5 67.35 1007.475 {Invisible:true,Small:true,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:acacia_button",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}


execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -991 67 1012 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:wanderer",TileX:-991,TileY:67,TileZ:1012,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -993 67 1012 {Invulnerable:true,Facing:1b,Rotation:[90.0f,0.0f],Motive:"minecraft:wanderer",TileX:-993,TileY:67,TileZ:1012,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon item_frame -992 68 1011 {Silent:true, Facing: 2b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 112}}, Tags:["LivingRoomArt","VideoGameMap"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -991.5 66 1011.2 {Invisible:true,Small:false,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:lever",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -991.5 67.35 1011.475 {Invisible:true,Small:true,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:acacia_button",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}


execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -991 67 1006 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:wanderer",TileX:-991,TileY:67,TileZ:1006,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon painting -993 67 1006 {Invulnerable:true,Facing:1b,Rotation:[90.0f,0.0f],Motive:"minecraft:wanderer",TileX:-993,TileY:67,TileZ:1006,Tags:["LivingRoomArt"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon item_frame -992 68 1007 {Silent:true, Facing: 3b, ItemRotation: 0b, Invulnerable: true, Item: {id: "minecraft:filled_map", Count: 1b, tag: {map: 113}}, Tags:["LivingRoomArt","VideoGameMap"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -991.5 66 1007.2 {Invisible:true,Small:false,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:lever",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -991.5 67.35 1007.475 {Invisible:true,Small:true,NoGravity:true,Rotation:[180f,0f],ArmorItems:[{},{},{},{id:"minecraft:acacia_button",Count:1b}],DisabledSlots:2039583,Tags:["LivingRoomArt","JoystickAS"]}


execute as @e[tag=VideoGameMap,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run kill @e[tag=EscapeCFG_TV]
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=1}] run summon armor_stand -983 68.8 1006 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{LeftLeg:[299.0f,0.0f,0.0f],LeftArm:[0.0f,0.0f,341.0f],RightLeg:[299.0f,0.0f,0.0f]},Small:0b,Rotation:[0.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_TV"]}

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=15}] run title @a title {"text":"A Glorious Living Room", "color":"white"}
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=45}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Evidently you know how to jump. Well, let's see how well you fare without that little gimmick!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=4,EscapeTimer=200}] at @e[tag=EscapeCFG_TV] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=200}] at @e[tag=EscapeCFG_TV] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=4,EscapeTimer=200}] run kill @e[tag=EscapeCFG_TV]



# TRIAL 2 - NO JUMPING -> LEVEL 5
scoreboard objectives add Trial_2 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_2 0
execute align x align y align z if entity @a[x=-1027,y=67,z=996,dx=31,dy=51,dz=40] run scoreboard players set @e[tag=MainEscapeAEC] Trial_2 1
execute if entity @e[scores={Trial_2=0}] run fill -22 2 46 -22 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_2=1}] run fill -22 2 46 -22 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-997,y=67,z=1004,dx=0,dy=1,dz=0] run scoreboard players set @e[scores={EscapeLevel=..4}] EscapeTimer 0
execute align x align y align z at @a[x=-997,y=67,z=1004,dx=0,dy=1,dz=0] run scoreboard players set @e[scores={EscapeLevel=..4}] EscapeLevel 5

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run kill @e[tag=SkullPainting]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run summon painting -1021 86 1000 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:burning_skull",TileX:-1021,TileY:86,TileZ:1000,Tags:["SkullPainting"]}

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=10}] run playsound ambient.cave master @a -1000 67 1000 1 1 0
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=10}] run title @a title {"text":"Trial #2", "color":"gold"}
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=10}] run title @a subtitle {"text":"No Jumping Allowed", "color":"gold"}

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] at @e[tag=EscapeCFG_TV] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] at @e[tag=EscapeCFG_TV] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run kill @e[tag=EscapeCFG_TV]

execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run kill @e[tag=EscapeCFG_Balancing]
execute if entity @e[scores={EscapeLevel=5,EscapeTimer=1}] run summon armor_stand -1001.15 78 1024 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[338.0f,77.0f,0.0f],LeftLeg:[36.0f,0.0f,264.0f],Head:[0.0f,0.0f,7.0f],LeftArm:[164.0f,0.0f,29.0f]},Small:0b,Rotation:[181.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Balancing"]}

execute if entity @a[x=-1004,y=77,z=1023,dx=4,dy=1,dz=2] at @e[tag=EscapeCFG_Balancing] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-1004,y=77,z=1023,dx=4,dy=1,dz=2] at @e[tag=EscapeCFG_Balancing] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-1004,y=77,z=1023,dx=4,dy=1,dz=2] run kill @e[tag=EscapeCFG_Balancing]



# LEAVING TRIAL 2 -> LEVEL 6
fill -1001 68 999 -999 68 1001 acacia_pressure_plate replace oak_pressure_plate

execute align x align y align z at @a[x=-1027,y=89,z=995,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..5}] EscapeTimer 0
execute align x align y align z at @a[x=-1027,y=89,z=995,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..5}] EscapeLevel 6

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run kill @e[tag=FoyerArt]

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon painting -1053 90 970 {Invulnerable:true,Facing:0b,Rotation:[0.0f,0.0f],Motive:"minecraft:bust",TileX:-1053,TileY:90,TileZ:970,Tags:["FoyerArt"]}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon painting -1051 90 976 {Invulnerable:true,Facing:2b,Rotation:[180.0f,0.0f],Motive:"minecraft:void",TileX:-1051,TileY:90,TileZ:976,Tags:["FoyerArt"]}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon item_frame -1051 89 971 {Invulnerable:true,Facing:3b,Rotation:[0.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["FoyerArt"]}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon item_frame -1051 90 971 {Invulnerable:true,Facing:3b,Rotation:[0.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["FoyerArt"]}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon item_frame -1055 92 973 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"minecraft:clock",Count:1b},Tags:["FoyerArt"]}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon painting -1055 100 973 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:fighters",TileX:-1055,TileY:100,TileZ:973,Tags:["FoyerArt"]}


#execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1049 104 973 {Items: [{Slot:0b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"d",display:{Name:"{\"text\":\"qmagnet Mask\",\"italic\":\"false\"}"}}},{Slot:1b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"abrightmoore",display:{Name:"{\"text\":\"abrightmoore Mask\",\"italic\":\"false\"}"}}},{Slot:2b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"renderXR",display:{Name:"{\"text\":\"renderXR Mask\",\"italic\":\"false\"}"}}},{Slot:3b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Jigarbov",display:{Name:"{\"text\":\"Jigarbov Mask\",\"italic\":\"false\"}"}}},{Slot:4b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Feylina",display:{Name:"{\"text\":\"Feylina Mask\",\"italic\":\"false\"}"}}},{Slot:5b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Jadelf",display:{Name:"{\"text\":\"Jadelf Mask\",\"italic\":\"false\"}"}}},{Slot:6b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"mistress_kahlan",display:{Name:"{\"text\":\"mistress_kahlan Mask\",\"italic\":\"false\"}"}}},{Slot:7b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Hawkminer",display:{Name:"{\"text\":\"Hawkminer Mask\",\"italic\":\"false\"}"}}},{Slot:8b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Komsjer",display:{Name:"{\"text\":\"Komsjer Mask\",\"italic\":\"false\"}"}}},{Slot:9b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"qwertyuiopthepie",display:{Name:"{\"text\":\"qwertyuiopthepie Mask\",\"italic\":\"false\"}"}}},{Slot:10b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"ColdFusionGaming",display:{Name:"{\"text\":\"ColdFusionGaming Mask\",\"italic\":\"false\"}"}}},{Slot:11b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Kovolta",display:{Name:"{\"text\":\"Kovolta Mask\",\"italic\":\"false\"}"}}},{Slot:12b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"rsmalec",display:{Name:"{\"text\":\"rsmalec Mask\",\"italic\":\"false\"}"}}},{Slot:13b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Faume",display:{Name:"{\"text\":\"Faume Mask\",\"italic\":\"false\"}"}}},{Slot:14b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"CDFDMAN",display:{Name:"{\"text\":\"CDFDMAN Mask\",\"italic\":\"false\"}"}}},{Slot:15b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"UnlikelyWaffle",display:{Name:"{\"text\":\"UnlikelyWaffle Mask\",\"italic\":\"false\"}"}}},{Slot:16b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Bakerbelle",display:{Name:"{\"text\":\"Bakerbelle Mask\",\"italic\":\"false\"}"}}},{Slot:17b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Fangride",display:{Name:"{\"text\":\"Fangride Mask\",\"italic\":\"false\"}"}}},{Slot:18b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"goldenturkey97",display:{Name:"{\"text\":\"goldenturkey97 Mask\",\"italic\":\"false\"}"}}},{Slot:19b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Noodlor",display:{Name:"{\"text\":\"Noodlor Mask\",\"italic\":\"false\"}"}}},{Slot:20b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Thungon",display:{Name:"{\"text\":\"Thungon Mask\",\"italic\":\"false\"}"}}},{Slot:21b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Fellonius",display:{Name:"{\"text\":\"Fellonius Mask\",\"italic\":\"false\"}"}}},{Slot:22b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Bongotezz",display:{Name:"{\"text\":\"Bongotezz Mask\",\"italic\":\"false\"}"}}},{Slot:23b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"jgazmom",display:{Name:"{\"text\":\"jgazmom Mask\",\"italic\":\"false\"}"}}},{Slot:24b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"BhunaBoy",display:{Name:"{\"text\":\"BhunaBoy Mask\",\"italic\":\"false\"}"}}},{Slot:25b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Bawks",display:{Name:"{\"text\":\"Bauwks Mask\",\"italic\":\"false\"}"}}},{Slot:26b,id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"Crommie",display:{Name:"{\"text\":\"Crommie Mask\",\"italic\":\"false\"}"}}}],}

#Mask\"
#Mask\",\"italic\":\"false\"

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1052 88 976 {Items:[{Slot:11b,id:"minecraft:stick",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #1\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}}],}
execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1051 88 976 {Items:[{Slot:6b,id:"minecraft:string",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #2\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}}],}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1053 88 970 {Items:[{Slot:23b,id:"minecraft:iron_nugget",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #4\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}}],}
execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1052 88 970 {Items: [{Slot:2b,id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #3\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}}],}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run data merge block -1055 97 972 {Items:[{Slot:6b,id:"minecraft:clock",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #6\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}},{Slot:20b,id:"minecraft:glass_bottle",Count:1b,tag:{display:{Name:"{\"text\":\"Useless Flavor Item #5\",\"italic\":\"false\",\"color\":\"dark_aqua\"}"}}}],}

execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=6,EscapeTimer=1}] run summon armor_stand -1050 89 975 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[7.0f,0.0f,122.0f],LeftArm:[0.0f,0.0f,13.0f],RightLeg:[0.0f,0.0f,4.0f]},Small:0b,Rotation:[225.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Ladder"]}

execute if entity @a[x=-1047,y=89,z=972,dx=0,dy=2,dz=2] at @e[tag=EscapeCFG_Ladder] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-1047,y=89,z=972,dx=0,dy=2,dz=2] at @e[tag=EscapeCFG_Ladder] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-1047,y=89,z=972,dx=0,dy=2,dz=2] run kill @e[tag=EscapeCFG_Ladder]



# DIVERSE FOYER DOWNSTAIRS -> LEVEL 7
execute align x align y align z at @a[x=-1047,y=89,z=972,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..6}] EscapeTimer 0
execute align x align y align z at @a[x=-1047,y=89,z=972,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..6}] EscapeLevel 7

execute if entity @e[scores={EscapeLevel=7,EscapeTimer=1}] run title @a title {"text":"A Diverse Foyer", "color":"gold"}

execute if entity @e[scores={EscapeLevel=7,EscapeTimer=1}] run data merge block -1049 104 973 {Items:[{Slot:6b,id:"minecraft:name_tag",Count:1b,tag:{display:{Name:"{\"text\":\"Shhh...\",\"italic\":\"false\",\"color\":\"green\"}"}}}],}

execute if entity @e[scores={EscapeLevel=7,EscapeTimer=1}] run kill @e[tag=EscapeCFG_Fence]
execute if entity @e[scores={EscapeLevel=7,EscapeTimer=1}] run summon armor_stand -1053.9 104 973 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[309.0f,0.0f,0.0f],LeftLeg:[20.0f,0.0f,0.0f],Head:[23.0f,0.0f,0.0f],LeftArm:[312.0f,0.0f,0.0f],RightLeg:[16.0f,0.0f,0.0f]},Small:0b,Rotation:[270.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Fence"]}



# DIVERSE FOYER UPSTAIRS -> LEVEL 8
execute align x align y align z at @a[x=-1049,y=98,z=975,dx=0,dy=1,dz=0] run scoreboard players set @e[scores={EscapeLevel=..7}] EscapeTimer 0
execute align x align y align z at @a[x=-1049,y=98,z=975,dx=0,dy=1,dz=0] run scoreboard players set @e[scores={EscapeLevel=..7}] EscapeLevel 8

execute if entity @e[scores={EscapeLevel=8,EscapeTimer=1}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"I suppose I need to step up my game if I'm to keep you here forever. I bet this next trial will blow you away!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=8,EscapeTimer=200}] at @e[tag=EscapeCFG_Fence] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=8,EscapeTimer=200}] at @e[tag=EscapeCFG_Fence] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[scores={EscapeLevel=8,EscapeTimer=200}] run kill @e[tag=EscapeCFG_Fence]

execute if entity @a[x=-1055,y=104,z=971,dx=0,dy=2,dz=4] at @e[tag=EscapeCFG_Fence] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-1055,y=104,z=971,dx=0,dy=2,dz=4] at @e[tag=EscapeCFG_Fence] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-1055,y=104,z=971,dx=0,dy=2,dz=4] run kill @e[tag=EscapeCFG_Fence]

execute if entity @e[scores={EscapeLevel=..8}] as @e[tag=KnockbackCreeper] run kill @s
execute if entity @e[scores={EscapeLevel=..8}] run fill -1006 105 959 -991 105 974 prismarine replace glowstone
execute if entity @e[scores={EscapeLevel=..8}] run fill -997 97 962 -995 97 964 green_concrete replace lime_concrete
execute if entity @e[scores={EscapeLevel=..8}] run fill -992 97 957 -990 97 959 green_concrete replace lime_concrete
execute if entity @e[scores={EscapeLevel=..8}] run fill -1007 97 961 -1005 97 963 green_concrete replace lime_concrete
execute if entity @e[scores={EscapeLevel=..8}] run fill -1000 97 972 -998 97 974 green_concrete replace lime_concrete
execute if entity @e[scores={EscapeLevel=..8}] run fill -1006 97 958 -991 97 985 lime_stained_glass replace lime_concrete
execute if entity @e[scores={EscapeLevel=..8}] run fill -992 98 987 -990 100 987 iron_bars[west=true,east=true] replace air



# TRIAL 3 - DON'T BLOW IT -> LEVEL 9
scoreboard objectives add Trial_3 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_3 0
execute align x align y align z if entity @a[x=-1018,y=95,z=953,dx=32,dy=4,dz=34] run scoreboard players set @e[tag=MainEscapeAEC] Trial_3 1
execute if entity @e[scores={Trial_3=0}] run fill -24 2 46 -24 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_3=1}] run fill -24 2 46 -24 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-1016,y=97,z=972,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..8}] EscapeTimer 0
execute align x align y align z at @a[x=-1016,y=97,z=972,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..8}] EscapeLevel 9

execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run playsound ambient.cave master @a -1012 98 973 1 1 0
execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run title @a title {"text":"Trial #3", "color":"green"}
execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run title @a subtitle {"text":"Don't Blow It!", "color":"green"}
execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run fill -1006 105 959 -991 105 974 glowstone

execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run setblock -991 101 1007 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run fill -992 98 1005 -990 100 1005 iron_bars[west=true,east=true]

execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run summon armor_stand -991 102 992 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[0.0f,0.0f,347.0f],Head:[10.0f,0.0f,0.0f],LeftArm:[302.0f,10.0f,81.0f]},Small:0b,Rotation:[180.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],HandItems:[{id:"minecraft:book",Count:1b,Damage:0s},{}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Book"]}

execute if entity @e[scores={EscapeLevel=9,EscapeTimer=1}] run summon armor_stand -994 93.3 989 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[0.0f,0.0f,106.0f],LeftLeg:[280.0f,0.0f,0.0f],Head:[10.0f,0.0f,0.0f],LeftArm:[171.0f,180.0f,81.0f],RightLeg:[283.0f,0.0f,0.0f]},Small:0b,Rotation:[270.0f,0.0f],HandItems:[{id:"minecraft:wooden_hoe",Count:1b,Damage:0s},{id:"minecraft:grass_block",Count:1b,Damage:0s}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Grass"]}



# LIBRARY -> LEVEL 11
execute align x align y align z at @a[x=-992,y=98,z=988,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..10}] EscapeTimer 0
execute align x align y align z at @a[x=-992,y=98,z=988,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..10}] EscapeLevel 11

execute if entity @e[scores={EscapeLevel=11,EscapeTimer=1}] run title @a title {"text":"A Stormy Library", "color":"green"}
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=11}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Hey, look at all of these great books! Maybe you should read for a while. Or forever. Otherwise I'll have to send you into the awful water dungeon of despair. Your choice.","color":"none","bold":false,"underlined":false}]

execute if entity @a[x=-988,y=98,z=988,dx=0,dy=2,dz=0] at @e[tag=EscapeCFG_Book] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-988,y=98,z=988,dx=0,dy=2,dz=0] at @e[tag=EscapeCFG_Book] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-988,y=98,z=988,dx=0,dy=2,dz=0] run kill @e[tag=EscapeCFG_Book]

execute if entity @a[x=-994,y=94,z=991,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Grass] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-994,y=94,z=991,dx=0,dy=1,dz=0] at @e[tag=EscapeCFG_Grass] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-994,y=94,z=991,dx=0,dy=1,dz=0] run kill @e[tag=EscapeCFG_Grass]

execute if entity @a[x=-987,y=88,z=990,dx=0,dy=2,dz=2] at @e[tag=EscapeCFG_Grass] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @a[x=-987,y=88,z=990,dx=0,dy=2,dz=2] at @e[tag=EscapeCFG_Grass] run particle portal ~ ~1 ~ 0.2 0.2 0.2 0.5 20 force @a
execute if entity @a[x=-987,y=88,z=990,dx=0,dy=2,dz=2] run kill @e[tag=EscapeCFG_Grass]

teleport @a[x=-997,y=96,z=996,dx=12,dy=-1,dz=8] -991 98 1000

execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run fill -965 88 992 -964 106 1003 air replace water
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 96 997 water
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 95 997 barrier
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 95 997 air
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 96 1001 water
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 95 1001 barrier
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -964 95 1001 air
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run fill -976 75 1005 -975 106 1023 air replace water
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run fill -976 98 1005 -974 98 1008 water
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run fill -976 102 1014 -975 104 1016 water

execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -976 100 1003 lever[face=wall,facing=east,powered=false]
execute if entity @e[scores={EscapeLevel=11,EscapeTimer=10}] run setblock -967 106 1022 lever[face=ceiling,facing=south,powered=false]



# TRIAL 4 - GO WITH THE FLOW -> LEVEL 12
scoreboard objectives add Trial_4 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_4 0
execute align x align y align z if entity @a[x=-984,y=86,z=984,dx=21,dy=20,dz=43] run scoreboard players set @e[tag=MainEscapeAEC] Trial_4 1
execute if entity @e[scores={Trial_4=0}] run fill -26 2 46 -26 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_4=1}] run fill -26 2 46 -26 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-977,y=88,z=1001,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..11}] EscapeTimer 0
execute align x align y align z at @a[x=-977,y=88,z=1001,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..11}] EscapeLevel 12

execute if entity @e[scores={EscapeLevel=12,EscapeTimer=1}] run playsound ambient.cave master @a -975 88 1002 1 1 0
execute if entity @e[scores={EscapeLevel=12,EscapeTimer=1}] run title @a title {"text":"Trial #4", "color":"aqua"}
execute if entity @e[scores={EscapeLevel=12,EscapeTimer=1}] run title @a subtitle {"text":"Go With the Flow", "color":"aqua"}



# BEFORE KITCHEN -> LEVEL 13
execute align x align y align z at @a[x=-968,y=100,z=1023,dx=2,dy=-2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..12}] EscapeTimer 0
execute align x align y align z at @a[x=-968,y=100,z=1023,dx=2,dy=-2,dz=2] run scoreboard players set @e[scores={EscapeLevel=..12}] EscapeLevel 13

execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run kill @e[tag=KitchenArt]
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -965 91 1035 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:cod",Count:1b},Tags:["KitchenArt"]}
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -969 91 1035 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"minecraft:golden_apple",Count:1b},Tags:["KitchenArt"]}
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -969 91 1032 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"carrot",Count:1b},Tags:["KitchenArt"]}
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -969 91 1031 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"minecraft:potato",Count:1b},Tags:["KitchenArt"]}
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -969 91 1030 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"minecraft:pumpkin_pie",Count:1b},Tags:["KitchenArt"]}
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon item_frame -969 91 1029 {Invulnerable:true,Facing:5b,Rotation:[270.0f,0.0f],Item:{id:"minecraft:apple",Count:1b},Tags:["KitchenArt"]}


execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run summon armor_stand -965 90 1033 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[315.0f,0.0f,0.0f],LeftLeg:[16.0f,0.0f,0.0f],Head:[26.0f,0.0f,0.0f],LeftArm:[322.0f,0.0f,325.0f],RightLeg:[347.0f,0.0f,0.0f]},Small:0b,Rotation:[270.0f,0.0f],HandItems:[{id:"minecraft:cauldron",Count:1b,Damage:0s},{id:"minecraft:lava_bucket",Count:1b,Damage:0s}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Cooking"]}

execute if entity @e[scores={EscapeLevel=13,EscapeTimer=1}] run data merge block -965 93 1035 {Items:[{Slot:11b,id:"minecraft:mushroom_stew",Count:1b,Damage:0s},{Slot:13b,id:"minecraft:mushroom_stew",Count:1b,Damage:0s},{Slot:15b,id:"minecraft:mushroom_stew",Count:1b,Damage:0s}]}

teleport @a[x=-970,y=85,z=1021,dx=6,dy=-2,dz=6] -970 104 1024 270 15



# FROSTY KITCHEN -> LEVEL 14
execute align x align y align z at @a[x=-968,y=90,z=1028,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..13}] EscapeTimer 0
execute align x align y align z at @a[x=-968,y=90,z=1028,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..13}] EscapeLevel 14

execute if entity @e[scores={EscapeLevel=14,EscapeTimer=1}] run title @a title {"text":"A Frosty Kitchen", "color":"aqua"}
execute if entity @e[scores={EscapeLevel=14,EscapeTimer=31}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Seriously?! It took me at least five hours to playtest that trial, and you finished it before I even had the chance to get some popcorn. Well, no matter. I'm sure this next trial will make you blow a fuse!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=14,EscapeTimer=1}] run setblock -989 103 1028 white_wool
execute if entity @e[scores={EscapeLevel=14,EscapeTimer=1}] run fill -991 102 1028 -991 103 1028 iron_bars[west=true,east=true]

execute if entity @e[scores={EscapeLevel=14,EscapeTimer=180}] at @e[tag=EscapeCFG_Cooking] run particle portal ~ ~0.5 ~ 0.2 0.2 0.2 1 50 force @a
execute if entity @e[scores={EscapeLevel=14,EscapeTimer=180}] at @e[tag=EscapeCFG_Cooking] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=14,EscapeTimer=180}] run kill @e[tag=EscapeCFG_Cooking]



# TRIAL 5 - DOWN TO THE WIRE -> LEVEL 15
scoreboard objectives add Trial_5 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_5 0
execute align x align y align z if entity @a[x=-994,y=102,z=1029,dx=15,dy=5,dz=6] run scoreboard players set @e[tag=MainEscapeAEC] Trial_5 1
execute align x align y align z if entity @a[x=-993,y=107,z=1007,dx=4,dy=6,dz=4] run scoreboard players set @e[tag=MainEscapeAEC] Trial_5 1
execute align x align y align z if entity @a[x=-1010,y=106,z=954,dx=21,dy=14,dz=24] run scoreboard players set @e[tag=MainEscapeAEC] Trial_5 1
execute if entity @e[scores={Trial_5=0}] run fill -28 2 46 -28 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_5=1}] run fill -28 2 46 -28 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-980,y=103,z=1031,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..14}] EscapeTimer 0
execute align x align y align z at @a[x=-980,y=103,z=1031,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..14}] EscapeLevel 15

execute if entity @e[scores={EscapeLevel=15,EscapeTimer=1}] run playsound ambient.cave master @a -983 102 1032 1 1 0
execute if entity @e[scores={EscapeLevel=15,EscapeTimer=1}] run title @a title {"text":"Trial #5", "color":"light_purple"}
execute if entity @e[scores={EscapeLevel=15,EscapeTimer=1}] run title @a subtitle {"text":"Down to the Wire", "color":"light_purple"}


# TRIAL 5 - NEXT CUT -> LEVEL 16
execute align x align y align z at @a[x=-992,y=102,z=1013,dx=2,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..15}] EscapeTimer 0
execute align x align y align z at @a[x=-992,y=102,z=1013,dx=2,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..15}] EscapeLevel 16

execute if entity @e[scores={EscapeLevel=16,EscapeTimer=1}] run setblock -994 112 1008 white_wool
execute if entity @e[scores={EscapeLevel=16,EscapeTimer=1}] run fill -991 111 1006 -991 112 1006 iron_bars[west=true,east=true]

execute if entity @e[scores={EscapeLevel=16,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=16,EscapeTimer=1}] run summon armor_stand -990 114 959 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[241.0f,0.0f,0.0f],LeftLeg:[39.0f,0.0f,0.0f],Head:[322.0f,0.0f,0.0f],LeftArm:[286.0f,0.0f,0.0f],RightLeg:[302.0f,0.0f,0.0f]},Small:0b,Rotation:[180.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Bomb"]}


execute if block -991 101 1007 lever[powered=false] run fill -992 98 1005 -990 100 1005 iron_bars[west=true,east=true] replace air
execute if block -991 101 1007 lever[powered=true] if block -991 99 1005 iron_bars run playsound entity.experience_orb.pickup master @a -991 99 1005
execute if block -991 101 1007 lever[powered=true] if block -991 99 1005 iron_bars run playsound item.chorus_fruit.teleport master @a -991 99 1005 1 0.7 0
execute if block -991 101 1007 lever[powered=true] if block -991 99 1005 iron_bars run particle cloud -991 99 1005 1 1 0 0 100
execute if block -991 101 1007 lever[powered=true] run fill -992 98 1005 -990 100 1005 air destroy

execute align x align y align z run effect give @a[x=-991,y=98,z=1009,dx=0,dy=12,dz=0] levitation 1 3


# LEAVING SECOND CUT -> LEVEL 17
execute align x align y align z at @a[x=-992,y=111,z=1005,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..16}] EscapeTimer 0
execute align x align y align z at @a[x=-992,y=111,z=1005,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..16}] EscapeLevel 17



# TRIAL 5 - TIMEBOMB -> LEVEL 18
execute align x align y align z at @a[x=-991,y=111,z=976,dx=0,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..17}] EscapeTimer 0
execute align x align y align z at @a[x=-991,y=111,z=976,dx=0,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..17}] EscapeLevel 18

execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run fill -1010 111 959 -1010 113 961 iron_bars[north=true,south=true]
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run setblock -1008 119 972 orange_wool

execute if entity @e[scores={EscapeLevel=18,EscapeTimer=80}] at @e[tag=EscapeCFG_Bomb] run particle portal ~ ~0.5 ~ 0.2 0.2 0.2 1 50 force @a
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=80}] at @e[tag=EscapeCFG_Bomb] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=80}] run kill @e[tag=EscapeCFG_Bomb]



# COMPLETED TIME BOMB -> 19
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run kill @e[tag=EscapeCFG_Bed]
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run summon armor_stand -1040 110 938.0 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[241.0f,0.0f,0.0f],LeftLeg:[39.0f,0.0f,0.0f],Head:[296.0f,0.0f,0.0f],LeftArm:[286.0f,0.0f,0.0f],RightLeg:[302.0f,0.0f,0.0f],Body:[283.0f,0.0f,0.0f]},Small:0b,Rotation:[0.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Bed"]}

execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run kill @e[tag=GauntletArmor]
execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run summon armor_stand -1039 111 933 {NoGravity:true,Invulnerable:true,Rotation:[270.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8991416}},Damage:0s},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8991416}},Damage:0s},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:8991416}},Damage:0s},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:8991416}},Damage:0s}],Tags:["GauntletArmor"]}

execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run summon armor_stand -1033 111 933 {NoGravity:true,Invulnerable:true,Rotation:[90.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16351261}},Damage:0s},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16351261}},Damage:0s},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16351261}},Damage:0s},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:16351261}},Damage:0s}],Tags:["GauntletArmor"]}

execute if entity @e[scores={EscapeLevel=18,EscapeTimer=1}] run summon armor_stand -1036 120 934 {NoGravity:true,Invulnerable:true,Rotation:[0.0f,0.0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16701501}},Damage:0s},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16701501}},Damage:0s},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16701501}},Damage:0s},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:16701501}},Damage:0s}],Tags:["GauntletArmor"]}



# MONSTROUS BEDROOM -> LEVEL 20
execute align x align y align z at @a[x=-1037,y=111,z=941,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..19}] EscapeTimer 0
execute align x align y align z at @a[x=-1037,y=111,z=941,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..19}] EscapeLevel 20

execute if entity @e[scores={EscapeLevel=20,EscapeTimer=1}] run title @a title {"text":"A Monstrous Bedroom", "color":"light_purple"}
execute if entity @e[scores={EscapeLevel=20,EscapeTimer=10}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"I've let you climb too far. Time to activate my tower's completely unfair and not at all fun security system of doom!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=20,EscapeTimer=180}] at @e[tag=EscapeCFG_Bed] run particle portal ~ ~0.5 ~ 0.2 0.2 0.2 1 50 force @a
execute if entity @e[scores={EscapeLevel=20,EscapeTimer=180}] at @e[tag=EscapeCFG_Bed] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={EscapeLevel=20,EscapeTimer=180}] run kill @e[tag=EscapeCFG_Bed]



# TRIAL 6 - GAUNTLET ARROWS -> LEVEL 21
scoreboard objectives add Trial_6 dummy
scoreboard players set @e[tag=MainEscapeAEC] Trial_6 0
execute align x align y align z if entity @a[x=-1041,y=117,z=942,dx=61,dy=31,dz=84] run scoreboard players set @e[tag=MainEscapeAEC] Trial_6 1
execute align x align y align z if entity @a[x=-1019,y=143,z=946,dx=65,dy=32,dz=65] run scoreboard players set @e[tag=MainEscapeAEC] Trial_6 1
execute if entity @e[scores={Trial_6=0}] run fill -30 2 46 -30 2 46 clay replace redstone_block
execute if entity @e[scores={Trial_6=1}] run fill -30 2 46 -30 2 46 redstone_block replace clay

execute align x align y align z at @a[x=-1037,y=120,z=942,dx=2,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..20}] EscapeTimer 0
execute align x align y align z at @a[x=-1037,y=120,z=942,dx=2,dy=3,dz=0] run scoreboard players set @e[scores={EscapeLevel=..20}] EscapeLevel 21

execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run playsound ambient.cave master @a -1036 120 952 1 1 0
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run title @a title {"text":"Trial #6", "color":"yellow"}
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run title @a subtitle {"text":"Run the Gauntlet", "color":"yellow"}

execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run fill -1029 107 996 -1021 107 1004 lime_concrete replace red_concrete
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run setblock -1025 123 1003 yellow_wall_banner[facing=north]
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run setblock -1028 123 1000 yellow_wall_banner[facing=east]
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run setblock -1025 123 997 yellow_wall_banner[facing=south]
execute if entity @e[scores={EscapeLevel=21,EscapeTimer=1}] run setblock -1022 123 1000 yellow_wall_banner[facing=west]



# INSIDE ARROW LEVITATION POLE
execute align x align y align z run effect give @a[x=-991,y=120,z=1009,dx=0,dy=22,dz=0] levitation 3 3 true
execute if entity @e[scores={ArrowTimer=1}] align x align y align z at @a[x=-992,y=121,z=1008,dx=2,dy=18,dz=2] run summon arrow ~ 147 ~
execute align x align y align z run kill @e[type=arrow,x=-993,y=119,z=1007,dx=4,dy=24,dz=4,nbt={inGround:1b}]


# RAINBOW RUN -> LEVEL 23
execute align x align y align z at @a[x=-988,y=143,z=1008,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..22}] EscapeTimer 0
execute align x align y align z at @a[x=-988,y=143,z=1008,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..22}] EscapeLevel 23

execute if entity @e[scores={EscapeLevel=23,EscapeTimer=1}] run fill -984 143 979 -982 145 979 green_concrete
execute if entity @e[scores={EscapeLevel=23,EscapeTimer=1}] run setblock -983 144 979 redstone_lamp[lit=false]
execute if entity @e[scores={EscapeLevel=23,EscapeTimer=1}] run setblock -983 144 980 stone_button[face=wall,facing=south]
execute if entity @e[scores={EscapeLevel=23,EscapeTimer=1}] run setblock -983 143 985 lever[face=floor,facing=north,powered=false]



# EVOKER FANGS SETUP -> LEVEL 24
execute if block -983 144 980 stone_button[powered=true] run playsound entity.experience_orb.pickup master @a -983 144 986
execute if block -983 144 980 stone_button[powered=true] run scoreboard players set @e[tag=MainEscapeAEC] EscapeLevel 24
execute if block -983 144 980 stone_button[powered=true] run scoreboard players set @e[tag=MainEscapeAEC] EscapeTimer 0
execute if block -983 144 980 stone_button[powered=true] run fill -984 143 978 -982 145 979 air destroy

execute if entity @e[scores={EscapeLevel=24,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=24,EscapeTimer=1}] run summon armor_stand -983 147 946.9 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[270.0f,0.0f,0.0f],LeftLeg:[16.0f,0.0f,0.0f],LeftArm:[277.0f,0.0f,0.0f],RightLeg:[16.0f,0.0f,0.0f]},Small:0b,Rotation:[0.0f,0.0f],HandItems:[{id:"minecraft:redstone_torch",Count:1b,Damage:0s},{id:"minecraft:redstone_torch",Count:1b,Damage:0s}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Torches"]}

execute if entity @e[scores={EscapeLevel=24,EscapeTimer=1}] run setblock -1009 170 947 lever[face=wall,facing=east,powered=false]



# LEAVING EVOKER FANGS -> LEVEL 25
execute align x align y align z at @a[x=-985,y=143,z=951,dx=4,dy=5,dz=0] at @e[tag=EscapeCFG_Torches] run particle portal ~ ~0.5 ~ 0.2 0.2 0.2 1 50 force @a
execute align x align y align z at @a[x=-985,y=143,z=951,dx=4,dy=5,dz=0] at @e[tag=EscapeCFG_Torches] run playsound entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0
execute align x align y align z at @a[x=-985,y=143,z=951,dx=4,dy=5,dz=0] run kill @e[tag=EscapeCFG_Torches]

execute align x align y align z at @a[x=-1006,y=143,z=949,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..24}] EscapeTimer 0
execute align x align y align z at @a[x=-1006,y=143,z=949,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..24}] EscapeLevel 25



# LAVA RISE -> LEVEL 26
execute align x align y align z at @a[x=-1012,y=143,z=949,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..25}] EscapeTimer 0
execute align x align y align z at @a[x=-1012,y=143,z=949,dx=0,dy=3,dz=2] run scoreboard players set @e[scores={EscapeLevel=..25}] EscapeLevel 26

fill -1010 143 949 -1011 145 951 structure_void replace lava
fill -1010 169 949 -1010 171 951 structure_void replace lava



# TO DO ROOM -> LEVEL 27
execute align x align y align z at @a[x=-1001,y=169,z=995,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..26}] EscapeTimer 0
execute align x align y align z at @a[x=-1001,y=169,z=995,dx=2,dy=2,dz=0] run scoreboard players set @e[scores={EscapeLevel=..26}] EscapeLevel 27

#execute if entity @e[scores={EscapeLevel=27,EscapeTimer=1}] run kill @e[tag=ToDoArt]

execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt1] run summon item_frame -998 169 998 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt1"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt2] run summon item_frame -998 169 999 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt2"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt3] run summon item_frame -998 169 1001 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt3"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt4] run summon item_frame -998 169 1002 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt4"]}

execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt5] run summon item_frame -998 170 998 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt5"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt6] run summon item_frame -998 170 999 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt6"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt7] run summon item_frame -998 170 1001 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt7"]}
execute if entity @e[scores={EscapeLevel=26..27,EscapeTimer=1}] unless entity @e[tag=ToDoArt8] run summon item_frame -998 170 1002 {Invulnerable:true,Facing:4b,Rotation:[90.0f,0.0f],Item:{id:"minecraft:anvil",Count:1b},Tags:["ToDoArt","ToDoArt8"]}

execute if entity @e[scores={EscapeLevel=27,EscapeTimer=1}] run summon painting -1010 170 1003 {Invulnerable:true,Facing:3b,Rotation:[270.0f,0.0f],Motive:"minecraft:alban",TileX:-1010,TileY:170,TileZ:1003,Tags:["ToDoArt"]}

execute if entity @e[scores={EscapeLevel=27..}] run scoreboard objectives add FinalBox dummy
execute if entity @e[scores={EscapeLevel=26..27}] run fill -1001 191 998 -999 191 998 ladder[facing=north]
execute if entity @e[scores={EscapeLevel=26..27}] run fill -1001 191 1000 -999 191 1000 ladder[facing=south]

execute if entity @e[scores={EscapeLevel=27,EscapeTimer=1}] run kill @e[tag=EscapeCFG]
execute if entity @e[scores={EscapeLevel=27,EscapeTimer=1}] run summon armor_stand -1000 192 1002 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[347.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,355.0f],LeftArm:[16.0f,0.0f,351.0f],RightLeg:[0.0f,0.0f,5.0f]},Small:0b,Rotation:[180.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Final"]}

execute if entity @e[scores={EscapeLevel=..27}] align x align y align z run kill @e[type=item,x=-1003,y=192,z=997,dx=6,dy=6,dz=6]



# FINAL ROOM - CHECK FOR ALL PLAYERS -> LEVEL 28 
execute align x align y align z as @a[x=-1003,y=192,z=997,dx=6,dy=6,dz=6] run scoreboard objectives add FinalBox dummy
scoreboard players set @e[tag=MainEscapeAEC] FinalBox 1
execute as @a run scoreboard players add @e[tag=MainEscapeAEC] FinalBox 1
execute align x align y align z as @a[x=-1003,y=192,z=997,dx=6,dy=6,dz=6] run scoreboard players remove @e[tag=MainEscapeAEC] FinalBox 1

scoreboard players set @e[scores={EscapeLevel=..27,FinalBox=1}] EscapeTimer 0
scoreboard players set @e[scores={EscapeLevel=..27,FinalBox=1}] EscapeLevel 28

tag @a add OutsideBox
execute align x align y align z run tag @a[x=-1003,y=192,z=997,dx=6,dy=6,dz=6] remove OutsideBox

tag @a remove Climber
execute align x align y align z run tag @a[x=-1001,y=188,z=998,dx=3,dy=3,dz=3] add Climber

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=20..}] as @a[tag=Climber] at @s run teleport @s ~ 192.1 ~
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=20..}] run teleport @a[tag=!Climber,tag=OutsideBox,gamemode=adventure] -1000 192 997 0 0
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=20..}] run fill -1001 191 998 -999 191 1000 quartz_block replace ladder


# SETUP FINAL ROOM
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run fill -1005 191 1000 -1005 196 1004 cyan_concrete
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run fill -995 193 1002 -995 194 1002 cyan_concrete
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run fill -996 193 1002 -996 194 1002 dark_prismarine
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run clone -996 192 997 -996 198 1003 -1004 192 997
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run clone -997 192 999 -997 193 1001 -1003 192 999
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] run fill -1002 192 1003 -1002 194 1003 quartz_pillar[axis=y]
execute if entity @e[scores={EscapeLevel=..27,EscapeTimer=1}] align x align y align z run kill @e[tag=MileyCyrus,x=-1003,y=192,z=997,dx=6,dy=6,dz=6]

execute if entity @e[scores={EscapeLevel=28}] run scoreboard objectives remove NoEscapeShield


# FINAL SPEECH
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=30}] run tellraw @a[tag=!OutsideBox] ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"So... You've made it through my traps. You actually escaped your prison...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=300}] run tellraw @a[tag=!OutsideBox] ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Congratulations! You have made it through the first of 146 dimensions I've designed for the Escape Branch!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=500}] run tellraw @a[tag=!OutsideBox] ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"At this rate, you might actually gain the Cyan Wool in just a few weeks!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=700}] run tellraw @a[tag=!OutsideBox] ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"And if you do well on the ","color":"none","bold":false},{"text":"I'M SO LONELY","color":"none","obfuscated":true},{"text":" Dimension, I may even let you smell the Cyan Wool this time.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=800}] at @e[tag=EscapeCFG] run playsound block.wool.step master @a ~ ~ ~ 1 1.3 0
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=800}] run data merge entity @e[tag=EscapeCFG_Final,limit=1] {HandItems:[{id:"minecraft:cyan_wool",Count:1}]}

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=900}] at @e[tag=EscapeCFG] run playsound block.wool.step master @a ~ ~ ~ 1 1.3 0
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=900}] run data merge entity @e[tag=EscapeCFG_Final,limit=1] {HandItems:[{},{}]}

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run tellraw @a[tag=!OutsideBox] ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"Now in order to move to the next Dimension, you must find a way to escape this roo---","color":"none","bold":false,"underlined":false}]


# ADVANCEMENT
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=30..}] run advancement grant @a[nbt={Inventory:[{Slot:103b,id:"minecraft:player_head",tag:{CFG:1b}}]}] only d3:folder_c/cfg_head
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=30..}] run advancement grant ColdFusionGaming only d3:folder_c/cfg_head


# TESTING PRE-LOAD ROOM
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run fill -1005 191 1000 -1005 196 1004 cyan_concrete
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run fill -995 193 1002 -995 194 1002 cyan_concrete
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run fill -996 193 1002 -996 194 1002 dark_prismarine
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run clone -996 192 997 -996 198 1003 -1004 192 997
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run clone -997 192 999 -997 193 1001 -1003 192 999
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1000}] run fill -1002 192 1003 -1002 194 1003 quartz_pillar[axis=y]
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1001}] as @e[tag=MileyCyrus] run data merge entity @s {NoAI:false}
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1001}] as @e[tag=MileyCyrus] at @s run teleport @s ~ ~-300 ~
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1050}] run kill @e[tag=MileyCyrus]



##################
# WRECKING BALL
execute if entity @e[scores={EscapeLevel=28..,EscapeTimer=1062}] run scoreboard objectives add MusicTimer dummy
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1062}] run scoreboard players set @e[tag=MainEscapeAEC] MusicTimer -40
execute if entity @e[scores={EscapeLevel=28..,EscapeTimer=1062..}] run function d3:escape/wrecking_ball
##################



# MILEY ARRIVES
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run summon iron_golem -1004 192 1002 {NoAI:true,Rotation:[270f,0f],Tags:["MileyCyrus"],CustomName:"{\"text\":\"Iron Miley Cyrus\",\"color\":\"white\"}",CustomNameVisible:true,Invulnerable:true}

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run fill -1004 192 1001 -1005 194 1003 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run fill -1005 191 1001 -1005 195 1003 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run fill -1005 192 1004 -1005 194 1004 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run fill -1003 192 1001 -1003 193 1001 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run fill -1005 192 1000 -1005 193 1000 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run setblock -1004 191 1002 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run setblock -1004 193 1000 air

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run particle explosion_emitter -1004 193 1002 0.1 0.1 0.1 0 2

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run particle block sea_lantern -1004 193 1002 0.5 0.5 0.5 0 100 force @a

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run particle block dark_prismarine -1004 193 1002 1 1 1 0 300 force @a

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run playsound block.end_gateway.spawn master @a ~ ~ ~ 1 1 1

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1100}] run playsound block.stone.break master @a

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1101}] run playsound block.stone.break master @a

execute align x align y align z if entity @e[tag=MileyCyrus,x=-1002,y=192,z=1002,dx=0,dy=0,dz=0] run fill -1002 192 1003 -1002 194 1003 air destroy

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=..1400}] as @e[tag=MileyCyrus,x=-1004,y=192,z=1002,dx=3,dy=0,dz=0] at @s run teleport @s ~0.4 ~ ~

#execute @a[score_CFGSpeechLevel_min=28,score_CFGSpeechTimer=1400] ~ ~ ~ #execute @e[tag=MileyCyrus] ~ ~ ~ #teleport @s[x=-1001,y=192,z=1002,dx=-3] ~0.4 ~ ~

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=..1400}] align x align y align z as @e[tag=MileyCyrus,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] at @s run teleport @s -1000 192 1002


#########################
###execute @e[tag=GauntletCloud,score_FinalBox=0] ~ ~ ~ #execute @a[score_CFGSpeechLevel_min=28,score_CFGSpeechTimer_min=1200,score_CFGSpeechTimer=1200] ~ ~ ~ entitydata @e[tag=MileyCyrus] {HandItems:[{id:"minecraft:wool",Count:1,Damage:9s}]}
#########################


execute as @e[tag=MileyCyrus,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] as @e[tag=EscapeCFG_Final,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] at @a run playsound entity.player.attack.knockback master @a ~ ~ ~ 1 1 1
execute as @e[tag=MileyCyrus,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] as @e[tag=EscapeCFG_Final,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] at @a run playsound entity.vindication_illager.hurt master @a ~ ~ ~ 1 1 0

execute as @e[tag=MileyCyrus,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] run teleport @e[tag=EscapeCFG_Final] -996.2 193 1002 90 0

execute as @e[tag=EscapeCFG_Final,x=-996,y=193,z=1002,dx=0,dy=0,dz=0] run scoreboard players add @s EscapeTimer 1
#execute @e[tag=EscapeCFG_Final,score_CFGSpeechTimer_min=2,score_CFGSpeechTimer=2] ~ ~ ~ particle blockcrack ~1 ~0.5 ~ 0.6 1 0.1 0 70 force @a 168
execute as @e[tag=EscapeCFG_Final,scores={EscapeTimer=2}] run playsound entity.player.death master @a ~ ~ ~ 1 1 1
execute as @e[tag=EscapeCFG_Final,scores={EscapeTimer=4}] run playsound entity.vindication_illager.death master @a ~ ~ ~ 1 1 1
execute as @e[tag=EscapeCFG_Final,scores={EscapeTimer=4}] run particle poof ~ ~ ~ 0.1 1 0.1 0 30 force @a
execute as @e[tag=EscapeCFG_Final,scores={EscapeTimer=4}] run fill -996 193 1002 -995 194 1002 air destroy
kill @e[tag=EscapeCFG_Final,scores={EscapeTimer=6}]


# MILEY SPEAKS
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1200}] run teleport @e[tag=MileyCyrus] -1000 192 1002 180 0

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1330}] run tellraw @a ["",{"text":"<Iron Miley Cyrus> ","color":"gray","bold":false},{"text":"Here is block. Win game.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1430..1600}] as @e[tag=MileyCyrus,x=-1000,y=192,z=1002,dx=0,dy=0,dz=0] at @s run teleport @s -1000 192 ~0.03 180 30

execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1440}] run playsound entity.item.pickup master @a -1000 192 1002 1 1 0
execute if entity @e[scores={EscapeLevel=28,EscapeTimer=1440}] run summon item -1000 192 1002 {Item:{id:"minecraft:cyan_wool",Count:1}}



# COMPLETE BRANCH
tag @a remove HasCyanWool
execute if entity @e[scores={EscapeLevel=28}] run tag @a[nbt={Inventory:[{id:"minecraft:cyan_wool"}]}] add HasCyanWool
execute if entity @a[tag=HasCyanWool] run clear @a
replaceitem entity @a[tag=HasCyanWool] weapon.mainhand cyan_wool
execute if entity @a[tag=HasCyanWool] run fill -30 2 46 -18 2 46 clay replace redstone_block
execute if entity @a[tag=HasCyanWool] run kill @e[tag=MileyCyrus]
execute if entity @a[tag=HasCyanWool] run kill @e[tag=MainEscapeAEC]
execute if entity @a[tag=HasCyanWool] run teleport @a -24 4 33 0 -90
