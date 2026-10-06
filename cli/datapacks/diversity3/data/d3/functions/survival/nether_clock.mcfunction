####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 31 2018 / JULY 20 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar QExists
#scoreboard objectives setdisplay sidebar NetherBell
#scoreboard objectives setdisplay sidebar RiseHerobrine


# Q NPC ALWAYS PRESENT
#scoreboard objectives add QExists dummy
#scoreboard players set @e[tag=MainSurvivalAEC] QExists 0
#execute as @e[tag=NetherQ] run scoreboard players set @e[tag=MainSurvivalAEC] QExists 1
#execute if entity @e[scores={QExists=0}] run summon armor_stand 7.4 59.85 -94 {Tags:["NetherQ"],Invulnerable:true,Rotation:[90.0f,0.0f],CustomName:"{\"text\":\"qmagnet\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner:qmagnet},Count:1b}],Pose:{RightArm:[300f,0f,0f],LeftArm:[20f,0f,290f],RightLeg:[280f,10f,0f],LeftLeg:[280f,345f,0f],Body:[347f,0f,0f]},DisabledSlots:1973790}
execute unless entity @e[tag=NetherQ] run summon armor_stand 7.4 59.85 -94 {Tags:["NetherQ"],Invulnerable:true,Rotation:[90.0f,0.0f],CustomName:"{\"text\":\"qmagnet\",\"color\":\"gold\"}",CustomNameVisible:false,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzYwMjk3NTUxMzksInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}},Count:1b}],Pose:{RightArm:[300f,0f,0f],LeftArm:[20f,0f,290f],RightLeg:[280f,10f,0f],LeftLeg:[280f,345f,0f],Body:[347f,0f,0f]},DisabledSlots:1973790}


# DOORBELL
scoreboard objectives add NetherBell dummy
execute if block 1 66 -104 stone_button[powered=false] run scoreboard players set @e[tag=MainSurvivalAEC] NetherBell 0
execute if block 1 66 -104 stone_button[powered=true] run scoreboard players add @e[tag=MainSurvivalAEC] NetherBell 1
execute if entity @e[scores={NetherBell=1}] run playsound block.note_block.pling master @a 3 68 -97 1 1 0
execute if entity @e[scores={NetherBell=9}] run playsound block.note_block.pling master @a 3 68 -97 1 0.8 0


# BLOCK PROTECTION
execute if block 7 60 -94 air run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Hey! Don't break my comfy spot!","color":"none","bold":false,"underlined":false}]
execute if block 7 60 -94 air align x align y align z run kill @e[type=item,x=7,y=60,z=-94,dx=-1,dy=1,dz=0]
execute if block 7 60 -94 air run setblock 7 60 -94 oak_stairs[facing=east,half=bottom]


# BACK PORCH LAMP
execute if block 6 68 -87 stone_button[powered=false] run setblock 6 68 -87 stone_button[face=floor,facing=north,powered=true]

# TRAP DOOR ENTRANCE
#fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=false] replace oak_trapdoor
#fill 6 69 -95 6 69 -95 dark_oak_trapdoor[facing=west,half=bottom,open=false] replace oak_trapdoor
#fill 3 65 -92 3 65 -92 birch_trapdoor[facing=north,half=bottom,open=true] replace oak_trapdoor

execute if block 0 64 -88 spruce_trapdoor[open=false] if block 0 64 -87 spruce_trapdoor[open=false] if block 0 64 -86 spruce_trapdoor[open=true] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=true]
execute if block 0 64 -88 spruce_trapdoor[open=false] if block 0 64 -87 spruce_trapdoor[open=true] if block 0 64 -86 spruce_trapdoor[open=false] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=true]
execute if block 0 64 -88 spruce_trapdoor[open=true] if block 0 64 -87 spruce_trapdoor[open=false] if block 0 64 -86 spruce_trapdoor[open=false] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=true]

execute if block 0 64 -88 spruce_trapdoor[open=true] if block 0 64 -87 spruce_trapdoor[open=true] if block 0 64 -86 spruce_trapdoor[open=false] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=false]
execute if block 0 64 -88 spruce_trapdoor[open=true] if block 0 64 -87 spruce_trapdoor[open=false] if block 0 64 -86 spruce_trapdoor[open=true] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=false]
execute if block 0 64 -88 spruce_trapdoor[open=false] if block 0 64 -87 spruce_trapdoor[open=true] if block 0 64 -86 spruce_trapdoor[open=true] run fill 0 64 -88 0 64 -86 spruce_trapdoor[facing=east,half=bottom,open=false]


# CHEST ADVANCEMENT
advancement grant @a[x=3,y=61,z=-107,dx=2,dy=1,dz=2] only d3:folder_c/found_qchest



# HEROBRINE
execute if entity @a[nbt={Inventory:[{id:"minecraft:book",tag:{HerobrineBook:1b}}]}] run scoreboard objectives add RiseHerobrine dummy
scoreboard players add @e[tag=MainSurvivalAEC] RiseHerobrine 1
execute if entity @e[scores={RiseHerobrine=1}] run setblock 0 129 -93 air
execute if entity @e[scores={RiseHerobrine=1}] run clone -1 71 -96 -1 71 -96 0 129 -93
execute if entity @e[scores={RiseHerobrine=1}] run data merge block -1 71 -96 {Items:[{}]}
execute if entity @e[scores={RiseHerobrine=1}] run difficulty normal
execute if entity @e[scores={RiseHerobrine=10}] if block -1 71 -96 chest run playsound entity.zombie.break_door_wood master @a -1 71 -96 1 1 0
execute if entity @e[scores={RiseHerobrine=10}] run playsound entity.wither.death master @a -1 71 -96 0.7 0.8 0
execute if entity @e[scores={RiseHerobrine=10}] run setblock -1 71 -96 air destroy
execute if entity @e[scores={RiseHerobrine=10}] run summon husk -1 71.0 -96 {CustomName:"{\"text\":\"Herobrine\",\"color\":\"black\"}",Rotation:[270.0f,0.0f],Tags:["Herobrine","SurvivalMob"],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "9586e5ab-157a-4658-ad80-b07552a9ca63", Properties: {textures: [{Signature: "f8+U1qexoxMIr4pcBkU0bi8+pNZWfb6DvRTtNoy6F4HHpyDV+A6vcjm8Y7WAIRT6WHfNXrHEDOwklV8RtO/Rnb4b7mG1ZKSnf8Wic8I5J61tVTZgbBTXmy4c+feVCCo4L0QmD/W7EByZP5sVJ4XQEN7ySPgrim5HiNKDCGqAX0aO9ywGqBtt2tFspuCO6F72+F+OLMlhbm9Vf4D79EnIoeODwx0C0nIGrs+TJ6GfcvrScb27j0VDy8eUcpDSPXdSO2xrfFsF0UjC1zyv0kmrnxhQYk73QTSn3Efa/weqPG03zSvMBafU6hfmztflVsA9rUrCTElVXPpRxkm2dRpjmUQxsF7nZJy9ANKT2e2RGGh0ON6FUh7JYCExIaBR9uuKT+TbYoepVDGYQdmYnv0uNo8FyGJ8v0FR7/Bo/Gw9JtWSd8XcvJDGhMuSz0UEiI/pRKdC90hunHuAp45DGZ4JtAHV7Vcdn/jdfPxXOhNjEBx7rNc4e/ETXIa0j5kx+VxbVqR874jCF0ITBy1b6HpMiikMN8R+xCGh+wECPIjodrueF6C6ZCCz5O0fqVsKFPlMEUDZxFEK3QE2vypazqmtch74S8GGwHEHP36jnVG57cW4Cyfk3yfumPShJw8gewaISvLY76BwkDYJUQhG53sd7KJf1C1jjbL6tk/Xu6rXasI=", Value: "eyJ0aW1lc3RhbXAiOjE1MzM1ODk1NzcxMzUsInByb2ZpbGVJZCI6Ijk1ODZlNWFiMTU3YTQ2NThhZDgwYjA3NTUyYTljYTYzIiwicHJvZmlsZU5hbWUiOiJNSEZfSGVyb2JyaW5lIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8yYzY1ZWQyODI5YzgzZTExOWE4MGRmYjIyMjE2NDQzZTg3OGVmMTA2NDljNGEzNTRmNzRiZjQ1YWQwNmJjMWE3In19fQ=="}]}, Name: "MHF_Herobrine"}}}]}
execute if entity @e[scores={RiseHerobrine=10..11}] align x align y align z run kill @e[type=item,nbt={Item:{id: "minecraft:chest"}},x=-1,y=70,z=-97,dx=1,dy=1,dz=2]

effect give @e[tag=Herobrine] invisibility 1000000 255 true
effect give @e[tag=Herobrine] strength 5 1 true
execute at @e[tag=Herobrine] run particle block coal_block ~ ~1 ~ 0.4 0.3 0.4 0 10 force @a

execute if entity @e[nbt={Item:{tag:{HerobrineBook:1b}},OnGround:1b}] run scoreboard players set @e[scores={RiseHerobrine=1..}] RiseHerobrine -99
execute if entity @e[scores={RiseHerobrine=-99}] if block 0 129 -93 chest run clone 0 129 -93 0 129 -93 -1 71 -96
execute if entity @e[scores={RiseHerobrine=-99}] if block 0 129 -93 air run setblock -1 71 -96 chest[facing=east]
execute if entity @e[scores={RiseHerobrine=-99}] run replaceitem block -1 71 -96 container.4 book{HerobrineBook:1b,display:{Lore:['{"text":"An Impure Beholder ","italic":"true","color":"dark_red"}','{"text":"Brings Forth a Great Evil","italic":"true","color":"dark_red"}'],Name:"{\"text\":\"The Curse of Herobrine\",\"italic\":\"false\"}"}}
execute if entity @e[scores={RiseHerobrine=-99}] run particle enchant -1 71.5 -96 0.1 0.3 0.1 0.8 500
execute if entity @e[scores={RiseHerobrine=-99}] run playsound entity.zombie_villager.converted master @a -1 71 -96 1 1 0
execute if entity @e[scores={RiseHerobrine=-99}] run teleport @e[tag=Herobrine] 3 4 -96
execute if entity @e[scores={RiseHerobrine=-99}] at @e[nbt={Item:{tag:{HerobrineBook:1b}}}] run effect clear @a[distance=..5] hunger
execute if entity @e[scores={RiseHerobrine=-99}] at @e[nbt={Item:{tag:{HerobrineBook:1b}}}] run effect give @a[distance=..5] regeneration 1 255 true
execute if entity @e[scores={RiseHerobrine=-99}] run kill @e[nbt={Item:{tag:{HerobrineBook:1b}}}]
execute if entity @e[scores={RiseHerobrine=-99}] run scoreboard objectives remove RiseHerobrine

execute if entity @e[tag=Herobrine] run advancement grant @a[x=-1,y=70,z=-98,dx=8,dy=2,dz=4] only d3:folder_c/found_herobrine


# STARTS CLOCKS IN RANGE OF Q
scoreboard objectives add NetherTimer dummy
execute at @e[tag=NetherQ] if entity @a[distance=..15] run fill 5 129 -96 5 129 -96 redstone_block replace clay
execute at @e[tag=NetherQ] if entity @a[distance=16..] run fill 5 129 -96 5 129 -96 clay replace redstone_block
execute if block 5 129 -96 clay run scoreboard players reset @e NetherTimer