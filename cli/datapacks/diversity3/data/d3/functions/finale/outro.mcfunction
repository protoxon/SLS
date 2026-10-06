####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# FEBRUARY 10 2019 / SEPTEMBER 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OutroTimer
#scoreboard objectives setdisplay sidebar CreditRoll
#scoreboard objectives setdisplay sidebar CreditPlayers
#scoreboard objectives setdisplay sidebar CR_TP

execute unless entity @e[tag=MainFinaleAEC] run summon area_effect_cloud 8 2 104 {Tags:["MainFinaleAEC"],Duration:2147483647}


# WAKE UP
scoreboard players add @e[tag=MainFinaleAEC] OutroTimer 0
scoreboard players add @e[scores={OutroTimer=0..499}] OutroTimer 1
scoreboard players add @e[scores={OutroTimer=501..599}] OutroTimer 1


# MAP MAKER NPCS
execute as @e[tag=OutroMapMaker] at @s if entity @a[distance=..5] run data merge entity @s[nbt=!{CustomNameVisible:1b}] {CustomNameVisible:1b}
execute as @e[tag=OutroMapMaker] at @s unless entity @a[distance=..5] run data merge entity @s[nbt=!{CustomNameVisible:0b}] {CustomNameVisible:0b}
execute as @e[tag=OutroMapMaker] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={OutroTimer=1..3}] run scoreboard objectives setdisplay sidebar
execute if entity @e[scores={OutroTimer=1..3}] run kill @e[tag=OutroMapMaker]
execute if entity @e[scores={OutroTimer=3}] run playsound entity.zombie_villager.converted master @a 62 18 -4002 1 0.5 1
execute if entity @e[scores={OutroTimer=80}] run tellraw @a ["",{"text":"<Kwa> ","color":"green","bold":false},{"text":"Hey. You're finally awake...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={OutroTimer=130}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"You sleep with dirt? That's kinda weird.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={OutroTimer=120}] unless entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run tellraw @a ["",{"text":"<renderXR> ","color":"dark_purple","bold":false},{"text":"Rise and shine, Amigo!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={OutroTimer=200}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"dark_gray","bold":false},{"text":"Alright guys. I'll get the tents. Just pack up your stuff and head to the RV.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={OutroTimer=200..300}] as @e[tag=OutroMapMaker] at @s run teleport @s ^ ^ ^ facing entity @e[tag=OutroJig,limit=1]
execute if entity @e[scores={OutroTimer=200..300}] as @e[tag=OutroJig] at @s run teleport @s ^ ^ ^ facing entity @e[tag=OutroRender,limit=1]
execute if entity @e[scores={OutroTimer=300..400}] as @e[tag=OutroMapMaker] at @s run teleport @s ^ ^ ^ facing entity @e[tag=OutroCFG,limit=1]
execute if entity @e[scores={OutroTimer=300..400}] as @e[tag=OutroCFG] at @s run teleport @s ^ ^ ^ facing entity @e[tag=OutroJig,limit=1]
execute if entity @e[scores={OutroTimer=400..480}] as @e[tag=OutroMapMaker] at @s run teleport @s ^ ^ ^ facing entity @e[tag=OutroCFG,limit=1]
execute if entity @e[scores={OutroTimer=400..480}] as @e[tag=OutroJig] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={OutroTimer=300}] run tellraw @a ["",{"text":"<Cold Fusion> ","color":"dark_aqua","bold":false},{"text":"I'll give you a hand with the tents, Jig.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={OutroTimer=390}] run tellraw @a ["",{"text":"<Jigarbov> ","color":"dark_gray","bold":false},{"text":"Cool. We'll be good. Head back to the RV then.","color":"none","bold":false,"underlined":false}]


execute as @e[tag=OutroAB] at @s if entity @a[distance=..5] unless entity @e[tag=MetAB] run tellraw @a ["",{"text":"<abrightmoore> ","color":"blue","bold":false},{"text":"Scary dream last night? Sounded like you were falling to your death over and over. Hahaha!","color":"none","bold":false,"underlined":false}]
execute as @e[tag=OutroAB] at @s if entity @a[distance=..5] run tag @e[tag=MainFinaleAEC] add MetAB

execute as @e[tag=OutroNoodlor] at @s if entity @a[distance=..5] unless entity @e[tag=MetNoodlor] run tellraw @a ["",{"text":"<Noodlor> ","color":"light_purple","bold":false},{"text":"Thanks for coming out. It was nice to meet you. We all should definitely hang out again sometime.","color":"none","bold":false,"underlined":false}]
execute as @e[tag=OutroNoodlor] at @s if entity @a[distance=..5] run tag @e[tag=MainFinaleAEC] add MetNoodlor

execute as @e[tag=OutroQwerty] at @s if entity @a[distance=..5] unless entity @e[tag=MetQwerty] run tellraw @a ["",{"text":"<qwerty> ","color":"dark_green","bold":false},{"text":"I heard they were selling this place to tear it down and build a golf course. Ah well. It was fun while it lasted.","color":"none","bold":false,"underlined":false}]
execute as @e[tag=OutroQwerty] at @s if entity @a[distance=..5] run tag @e[tag=MainFinaleAEC] add MetQwerty

execute as @e[tag=OutroAdam] at @s if entity @a[distance=..5] unless entity @e[tag=MetAdam] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Hey sleepy-head. We already loaded up the leftover food. But you can head back to the van and wait there if you like. We shouldn't be long.","color":"none","bold":false,"underlined":false}]
execute as @e[tag=OutroAdam] at @s if entity @a[distance=..5] run tag @e[tag=MainFinaleAEC] add MetAdam

execute as @e[tag=OutroQ] at @s if entity @a[distance=..8] unless entity @e[tag=MetQ] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Ready to get out of here? Hop in. The others should be here shortly.","color":"none","bold":false,"underlined":false}]
execute as @e[tag=OutroQ] at @s if entity @a[distance=..8] run tag @e[tag=MainFinaleAEC] add MetQ

execute unless entity @e[tag=OutroKwa] run summon armor_stand 56 18 -3999 {CustomName:"{\"text\":\"The1Kwa1Jsucsh\",\"color\":\"green\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[240.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4008727}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4011567}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4863005}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1ca31321-dbd1-4c83-93b8-f58311600709",Properties:{textures:[{Signature:"DxW02OCzQ93IXxCBge2bMSTq5geoiiBcJIZcVQj72gDJq/xGJ2BL0hUeP6llceMr3DKTpd2QY/FAyfmuSjCK7IHvP6umtwhm18G16AkD1NgG8iycNvtR/Nm09PHgQh10xmsGzD5uLsZHXkjEGOTUjWYrU3WAH1ExJ4UZomJ9F2rW856wgwoOy3yaASkpxUOkEsOhL7bdzzAomfBWPiTVGnKZMYInjoZNXXSJCAQ7lRjIkBtSO64QagFBVvnzpyYaTFDoXFBDIBh18OkLa4I4Mu5boWBLqDOK6wBFVKncAKubepmfIhv3jXCQZz+mYKmshj+QJ+4g7YiTfBLbshJTCkPxGws1LtLBNYUi/ptoZJCHdePbTuy9doaMVFiR1WcLNp+USrD7qAbUapw0fqMJVW3/s2AipZMJzFJYGhzWuYE5tGirCGL9vpiTGcpGLE6caPUvAHpOSBZmCm9ZEW8VDYsPI5Seex5sCGzQAD/ARsWFJBhyfz6YA4mBLHgJlJX9G6DtTyB5KLt+mHqbwUkjym3/pWcRdC9eXbIJynzE5pL3a0Vm2Ytj3u+nWdPm04EudUEQAzs1vgPwB4twbitOPowrFkgnLiYjoe8wzCDyZFc6EfiWF4A+FYTXTancolOjMc8WCdwONdiRXmZ5Q2zkcLNCTEI4vCUFLY7LLsa3At0=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkwNTc4MzksInByb2ZpbGVJZCI6IjFjYTMxMzIxZGJkMTRjODM5M2I4ZjU4MzExNjAwNzA5IiwicHJvZmlsZU5hbWUiOiJkZW1lbnRlZGRvb2QiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E1NmY2YzMzOTY1MTZjNjM0YTg2OWVkN2IwMzgxNTUwODljNzg3OTliOTA0ODEwZWVhNzQ4M2VjNGQ2MzQ2YWEifX19"}]},Name:"dementeddood"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroKwa","OutroMapMaker"]}

execute unless entity @e[tag=OutroRender] run summon armor_stand 56 18 -4004 {CustomName:"{\"text\":\"renderXR\",\"color\":\"dark_purple\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[290.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6929734}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6044718}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4415092}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1c361569-6b3e-4ab0-b27f-b9f0df43f336",Properties:{textures:[{Signature:"JLxMr+0q/SVVJOwnNZf8NHOeeHXJ7CFPAS46QG5nHGL6t9qXxAThGVi5hVFILC/ZacuN1CFnkMU4pmv66echLDqfEk6qOEoI33p5o3+w9DFj9yv7Gc/D7UrS08FiWUAkMnSoBaT1eLU7MrawnBpaUqc8727fh63TX+3kjGjSGmwPb9XU5RoEEPUvRkaOq1csimujkU5Bpj4oyb3AeQBsZUe8V4G6lus2jL15w3nYPbG737XQm4LHPo2r6/4kIB6YdDSxc4dgI16CG9HXiV5SAKEbHmJtx9W/o+uVZCQsvY68gexZhgq3oU9Gy6R6dJz/C7Y+7hDkzQXiTnM5XxmVGyHzQzWzR5jwSYmPScqnOCRqo5C5xTVWHTHVRmVbpbUmc9pe2fMBkCXUF/Hmm//U3b5TIjjPRaMbI2zM9I4vNquAXlPSx44vY9Yn3A/XjGPngSh94Xgu9tiNTilZz0fdJS7rtUdxM/ZpfxK8L8q0kiNhlnNnK53e6ld2zRZxjhy7kF0f/Lz1nbVdLm1lmMnCVk2e08Kmd2HGglROXhBb+qvx539MdoE8byCj4/rrQGI/bdiVzaGnSD2i4rTQ06VBYhoz5UVnj4F+4oqk6gDzARwXKBU9TwsX2eKSnrMyEPY4eNGy61OZn0dmSM/ymnN9uB9o4h2vXpL2DkK4Pl/Lh+I=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkxMDAyMjEsInByb2ZpbGVJZCI6IjFjMzYxNTY5NmIzZTRhYjBiMjdmYjlmMGRmNDNmMzM2IiwicHJvZmlsZU5hbWUiOiJyZW5kZXJYUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmMyNzZhZTZiMGY3YjQxMGI0NjZmNmIyZTk2MmU1MWNlMzk2ODRhYTM0YjUyOTQ0MDE4MWM1MjYyY2RmMWM4ZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"renderXR"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroRender","OutroMapMaker"]}

execute unless entity @e[tag=OutroJig] run summon armor_stand 47 18 -3998 {CustomName:"{\"text\":\"Jigarbov\",\"color\":\"dark_gray\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[260.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8421247}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:44975}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"0e696be4-b798-452e-921e-816330bc97a9",Properties:{textures:[{Signature:"L3/V5fd+uKro8fz+1wmU1QUSy4iWCh+XzDbHp8SnjO+12dX6FjqDOgoqJGnUatD7ufVy0s/ibWPAhlPzPOmEw3h6yNGpAYBs/49nQrewF+0PydEEcjleI+USzwhw/B3Cpslbpjkxy0N0aHsCA1JSd/PFUvJlf9g1l69GN9hN4FreeT9Q4S7Ki7UNWWIXpPtZtxSa6F1CGEGe3zn+jhZcoLULMCFP/mkccJTpnRAWc7CcSLsgSgyluc1ELbGYhAsK4NEx01Vc+waT95OXpV1S+TtK2hG9x5MolMhW/NcoPtRfSa0Ahl4fuAkSrXLxbF3Tc6YE6nQIcOnRPx5UJhByMcCPS2gzWbkB07YRqX0pIB+QsluI8tqLk+Gepy2bDMqcK/zk2xKhaUsDxJjQBkFStfoPZCFUrnpVuzuS7V2iB88GhTX8/VfUZfv41sqS40cwV/DIiCz6JNQveBh0qpsJ9e9aGIvmgVmVltAprTtnb+xirO6soZu/Ewm3O7fNBad7lS3D10UZ+h+WHI8mvZ2Rq12Tb5HL+Wlb2SPovAGk7s1+VFqFzyLhWC7Fb69w1hNoLEHl3pRIKpc/VFHNY341QMzPSJJStlCpWguc9LpdUPxlzhO3lZnxABHBIv+wS217fQ6CK/nPvgCdGQah4JZNdh0q6O4yr5W0n4edaKykMEs=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg5Nzc4MTQsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]},Name:"Jigarbov"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroJig","OutroMapMaker"]}

execute unless entity @e[tag=OutroCFG] run summon armor_stand 45 18 -4002 {CustomName:"{\"text\":\"Cold Fusion\",\"color\":\"dark_aqua\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[270.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"07270730-7cf6-48f4-8850-11847f4d61a3",Properties:{textures:[{Signature:"E08RJkQu7JMPAg4f2vRm3JEI1AJt+AAqanlkzt9i4Uy50v6pJZ/GL5iIM5nUri7DMCRIAC3Wf0PdYT2r9OfRlmxFvMs286skw5ZeqUfs0itYV6b/Y06lf1Szy3M0sNnfQe38GszoyzG54ZNrlEAj8fCF/EniN8bdVSdKAHAnAu3w4DVHZ8zim1qAHfHx4PFoubTTv53xqO6ip+OexMXOdGdaPjB8iRIt5X9lVvtSE1fk6/xIEeyEGaANSIUSkDL7SniEQRcC3Kp/MCZ3xbxzy6SP1DAH7XRiXUUNkdFez5o9O9iU1ec+LTMDAVouBruBs3Go+FLmqhFDHBH8zPxzY0+LkgxNSh3wo3k0n0gS2KjEbjxSie8Oiq7e0IXASUu6ayAQ/RZZ/8zT6wI50KF79gvDCSeSU3xb4fNCblcEp55JmUGnv3/FcHEib/qHn4bLNjAxt5rQLiec+l16NFFhCcPlaQiZB9GUWO7Cpmo7iMwyQPAXpM59VD+KZkJTNJlGPGPTlHIVKJcLHfngafH0Hz45HYex/37GTulrvfphG03+h3P+Vl3ZGADlcj54OEViTxOShM+8l9RkIv50TwbX6sNT4Y4BcugC9vNAI/c4vRt9qg9rQOtOhSqf1+InqwJOquysr/fhG3COvpvrOh6RjQ77lMDy2zEZ7Lx1dQgGmkc=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg4Njg5NDksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]},Name:"ColdFusionGaming"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroCFG","OutroMapMaker"]}

execute if block 17 21 -4032 podzol unless entity @e[tag=OutroAB] run summon armor_stand 17 22 -4032 {CustomName:"{\"text\":\"abrightmoore\",\"color\":\"blue\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[270.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"c67563fd-4b7f-4a6b-a908-7237c3f1eaf9",Properties:{textures:[{Signature:"nmp7wlrTf7LZ7MzCSEBlOGhMHPISEe0V96dvJN0nzcKbd6BqSvi7sn312Zy0lulVlPGc8BMaCXkU9xhPzznwdG8/TDfrtZueaXS5wvuLjdVR66mPYb72i90wbo8drdhZxKgnPVPD0rTVe98TCSm6duojBOm+/w0q/L4uVhcHhNIi/8N5AD6J22W6Ca9jjIqZOwLSMAZVJM8mtatgwEeY5SxzEXioRgOGo1pzgoqKvTgNPwiks4nWPzPI0KZNmS8lyZ0ETmdIzEHlMH2gNcgLq/D8dIxykVluS42bzRKuJVLmLXT+BLpf+AQG0EjsKjMfcg7ZleFjZ7AtXnLYz0BbfAjHBbQWpunxnhTVsy8DJhUmDUMWcOXzgqls+iv4Xm7O4OY1Pky65rjS0YdV+IdAoo4MCbtCF5/z5q35I+onA3W9CrXnByzoQvoJNUO1/4VVnR1eTD3USyuz3c3PDTNbTE6w9aQbcC8TzhIcXFdHOR0dAPj1icz8UzidBqZnO8Aczza6NhytTUcB73pbsDf6m0usl4A1U00BwV/kEUya2S5fnkIZsSTafhNTrgCI/12yaqD0ziYrKZhHKHsJ8zMFgou87WIQA1F6q2Fbxkm5oGyOwG/ZMy5fqptkuTQ+1PRhsJHjSPaFwC2TqRX0rjFaWAyrjYLzYuUEbS4xtumaHM4=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgxNTc3OTAsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]},Name:"abrightmoore"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroAB","OutroMapMaker"]}

execute if block -39 22 -3999 grass_block unless entity @e[tag=OutroNoodlor] run summon armor_stand -39 23 -3999 {CustomName:"{\"text\":\"Noodlor\",\"color\":\"light_purple\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[270.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:10079334}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13382502}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13421772}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"26fe7806-9bf5-455d-b460-706c99ec5f0a",Properties:{textures:[{Signature:"EFcsKqW5e5ATTpCGI4LGtyLwOemYDpEN0jhNpsRwqHdhbXydlnXU4ELAo/wjttvG1ywSJH9DNjzQX9MwT66oF4iNB3zkfPlQnPAiXN9oYr8oCIrcVhV6xxGtt6GheittZQ5gaTs0VUxJzKf36uYHFVHb9VpdQ5jNHTOOaxclGJSPpWDno94X+btNI2Kv2AWap0FsxRAhQ+hOHidnDnadEpnMUwef2wsT9RzxuGyyv8HWhSbfdKI5nwmqFXYCCJ6RHaihBl5+8UmyEo5fvfwCwAOH35HAi3MVhm/qEhTdkY7MwzDHP6lbFXySDeUIIP2zwfZL5UulzkMfWqr3pbGhfyzjw+DMWMXv6g3jYICd2P3WW7uYHC0Gw8zYo1x3sqHxN5A1ZfIerhdGm3P1F3voK3J5e18LqQavQnqL7pp5hpx/tHn0Mc5zZmP9dV4pJrOvja8vlSsQU5nkDfxzZ6zlvlghJLmN+GX0EPhf5sCAGDNTP+oQNogtjIK6l95uwgHZO7+yc6gPjH+nBq2q6TfBY7qGl1MMibQCALIHbXkSO61198ifJPL+os8q6xJ6wMGGZGnu2QINUF62Ih97El+hKO4Hd9Glmpuq+jiccfKHofwMD9Bs4hUqWsB+5NWOG/Hcccjq2B6MR9qr3GOKpCxuj9zhyECVVv3yfZ1pLJJusZw=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwMDUxNzYsInByb2ZpbGVJZCI6IjI2ZmU3ODA2OWJmNTQ1NWRiNDYwNzA2Yzk5ZWM1ZjBhIiwicHJvZmlsZU5hbWUiOiJOb29kbG9yIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mZTY3OGI2ZTBiMmEwZmRlMTk2ZGUyMWQ1MjczNjdiNjkzNDMzZGRjYjk3ZjFlMmM5MTFlNjAzN2RmNWRlNWI1In19fQ=="}]},Name:"Noodlor"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroNoodlor","OutroMapMaker"]}

execute if block -94 27 -4044 podzol unless entity @e[tag=OutroQwerty] run summon armor_stand -94 28 -4044 {CustomName:"{\"text\":\"qwertyuiopthepie\",\"color\":\"dark_green\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[0.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"03b07a62-98e6-4fc4-8187-fb276d5a317c",Properties:{textures:[{Signature:"eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]},Name:"qwertyuiopthepie"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroQwerty","OutroMapMaker"]}

execute if block -98 28 -4140 podzol unless entity @e[tag=OutroAdam] run summon armor_stand -98 29 -4140 {CustomName:"{\"text\":\"AdamDJM\",\"color\":\"gold\"}",CustomNameVisible:0b,Invulnerable:1b,Rotation:[0.0f,0.0f],ShowArms:1b,NoBasePlate:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"30365a82-8bf5-484e-946d-6cb9458301ae",Properties:{textures:[{Signature:"QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]},Name:"AdamDJM"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroAdam","OutroMapMaker"]}

execute if block -56 24 -4196 black_concrete unless entity @e[tag=OutroQ] run summon armor_stand -55.0 25 -4196 {CustomName:"{\"text\":\"qmagnet\",\"color\":\"red\"}",CustomNameVisible:false,Invulnerable:true,Rotation:[90.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}},Count:1b}],DisabledSlots:2039583,Tags:["OutroQ","OutroMapMaker"]}


execute if block 56 18 -3995 oak_log unless entity @e[tag=HatchetAS2] run summon armor_stand 56.9 18.62 -3994.4 {Rotation:[45f,0f],Invisible:true,Invulnerable:true,Small:false,NoGravity:true,NoBasePlate:true,HandItems:[{id:"minecraft:iron_axe",Count:1b}],Tags:["HatchetAS2"],DisabledSlots:2039583,Pose:{RightArm:[30f,0f,0f]}}

#execute if block 60 18 -4000 chest unless entity @a[tag=OutroChests] run data merge block 60 18 -4000 {Items: [{Slot: 1b, id: "minecraft:fishing_rod", Count: 1b, tag: {Damage: 0}}, {Slot: 11b, id: "minecraft:fishing_rod", Count: 1b, tag: {Damage: 0}}, {Slot: 13b, id: "minecraft:cooked_cod", Count: 9b}, {Slot: 16b, id: "minecraft:flint_and_steel", Count: 1b, tag: {Damage: 0}}, {Slot: 18b, id: "minecraft:compass", Count: 1b}, {Slot: 24b, id: "minecraft:oak_log", Count: 14b}]}

execute if block 66 18 -4001 chest unless entity @a[tag=OutroChests] run data merge block 66 18 -4001 {Items: [{Slot: 0b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 11546150, Name: "{\"text\":\"Superman T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 1b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 16383998, Name: "{\"text\":\"Dress Shirt\",\"italic\":\"false\"}"}}},{Slot: 2b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3650006, Name: "{\"text\":\"Faded Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 3b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 1481884, Name: "{\"text\":\"Well Worn Jeans\",\"italic\":\"false\"}"}}},{Slot: 4b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {color: 16383998, Name: "{\"text\":\"Sneakers\",\"italic\":\"false\"}"}}},{Slot: 6b, id: "minecraft:lead", Count: 1b},{Slot: 8b, id: "minecraft:writable_book", Count: 1b},{Slot: 9b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 6192150, Name: "{\"text\":\"Green Lantern T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 11b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 12621367, Name: "{\"text\":\"Khaki Pants\",\"italic\":\"false\"}"},}},{Slot: 12b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3949738, Name: "{\"text\":\"Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 13b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {Name: "{\"text\":\"Hiking Boots\",\"italic\":\"false\"}"}}},{Slot: 16b, id: "minecraft:book", Count: 4b},{Slot: 18b, id: "minecraft:leather_chestplate", Count: 1b, tag: {HideFlags:63, display: {color: 1908001, Name: "{\"text\":\"Darth Vader T-Shirt\",\"italic\":\"false\"}"}}},{Slot: 20b, id: "minecraft:leather_leggings", Count: 1b, tag: {HideFlags:63, display: {color: 3949738, Name: "{\"text\":\"Blue Jeans\",\"italic\":\"false\"}"}}},{Slot: 22b, id: "minecraft:leather_boots", Count: 1b, tag: {HideFlags:63, display: {color: 1908001, Name: "{\"text\":\"Rain Boots\",\"italic\":\"false\"}"}}},{Slot: 26b, id: "minecraft:feather", Count: 1b}]}

#execute if block 40 22 -4013 chest unless entity @a[tag=OutroChests] run data merge block 40 22 -4013 {Items: [{Slot: 0b, id: "minecraft:apple", Count: 9b}, {Slot: 1b, id: "minecraft:apple", Count: 4b}, {Slot: 4b, id: "minecraft:cooked_beef", Count: 4b}, {Slot: 5b, id: "minecraft:carrot", Count: 3b}, {Slot: 9b, id: "minecraft:carrot", Count: 3b}, {Slot: 11b, id: "minecraft:cooked_beef", Count: 12b}, {Slot: 13b, id: "minecraft:cookie", Count: 20b}, {Slot: 17b, id: "minecraft:cooked_beef", Count: 6b}, {Slot: 25b, id: "minecraft:bread", Count: 11b}]}

execute if block 66 18 -4001 chest run tag @a add OutroChests


# 1.14 CAMPFIRE
execute if block 52 18 -4000 cauldron run setblock 52 18 -4000 campfire[lit=false]
execute if block 52 17 -4000 magma_block run setblock 52 17 -4000 coal_block


# CAMP MAP
execute if block -69 28 -4186 air run setblock -69 28 -4186 oak_wall_sign[facing=south]
data merge block -69 28 -4186 {Text1:"{\"text\":\"           W E L C O\",\"color\":\"none\"}",Text2:"{\"text\":\"        - - - - - -\",\"color\":\"none\"}",Text3:"{\"text\":\"   EAZY DREAMZ\",\"color\":\"none\",\"bold\":\"true\"}",Text4:"{\"text\":\"               'Sweet\",\"color\":\"none\",\"italic\":\"true\"}"}

execute if block -68 28 -4186 air run setblock -68 28 -4186 oak_wall_sign[facing=south]
data merge block -68 28 -4186 {Text1:"{\"text\":\"M E  T O            \",\"color\":\"none\"}",Text2:"{\"text\":\"- - - - - -           \",\"color\":\"none\"}",Text3:"{\"text\":\"PRIVATE CAMP        \",\"color\":\"none\",\"bold\":\"true\"}",Text4:"{\"text\":\"dreamzzz...'        \",\"color\":\"none\",\"italic\":\"true\"}"}

execute if block -69 27 -4187 oak_planks unless entity @e[tag=CampMap1] run summon item_frame -69 27 -4186 {Invulnerable:1b,Facing:3b,Silent:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:400}},Tags:["CampMap1","CampMap"]}
execute if block -68 27 -4187 oak_planks unless entity @e[tag=CampMap2] run summon item_frame -68 27 -4186 {Invulnerable:1b,Facing:3b,Silent:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:401}},Tags:["CampMap2","CampMap"]}
execute if block -69 26 -4187 spruce_planks unless entity @e[tag=CampMap3] run summon item_frame -69 26 -4186 {Invulnerable:1b,Facing:3b,Silent:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:402}},Tags:["CampMap3","CampMap"]}
execute if block -68 26 -4187 oak_planks unless entity @e[tag=CampMap4] run summon item_frame -68 26 -4186 {Invulnerable:1b,Facing:3b,Silent:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:403}},Tags:["CampMap4","CampMap"]}

execute as @e[tag=CampMap,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}



# RV STEERING WHEEL
execute if block -53 26 -4197 iron_bars[east=false,west=true,north=true,south=false] run setblock -53 26 -4197 iron_bars[east=false,west=false,north=false,south=false]


# ACTIVATE CREDITS
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run gamerule sendCommandFeedback false
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run playsound entity.player.levelup master @a 0 0 0 100000 0.9 1
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run scoreboard players set @e[scores={OutroTimer=..500}] OutroTimer 501
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run tag @a add CR
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR1] run tag @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11,tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1] add CR1
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR2] run tag @a[tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1,sort=random] add CR2
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR3] run tag @a[tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1,sort=random] add CR3
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR4] run tag @a[tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1,sort=random] add CR4
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR5] run tag @a[tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1,sort=random] add CR5
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] unless entity @a[tag=CR6] run tag @a[tag=!CR1,tag=!CR2,tag=!CR3,tag=!CR4,tag=!CR5,tag=!CR6,limit=1,sort=random] add CR6
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run gamemode spectator @a

execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run clear @a
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR2] -2178 77 416 0 0
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR3] -2356 77 416 0 0
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR4] -2534 77 416 0 0
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR5] -2712 77 416 0 0
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR6] -2890 77 416 0 0
execute align x align y align z if entity @a[x=-53,y=26,z=-4197,dx=1,dy=1,dz=11] run teleport @a[tag=CR1] -2000 77 416 0 0

# TERRIBLE MULTIPLAYER FIX FOR CHUNK LOADING
scoreboard objectives add CreditPlayers dummy
scoreboard players set @e[tag=MainFinaleAEC] CreditPlayers 0
execute as @a run scoreboard players add @e[tag=MainFinaleAEC] CreditPlayers 1

execute if entity @e[scores={OutroTimer=501..}] run scoreboard objectives add CR_TP dummy
scoreboard players add @a CR_TP 1


# CREDIT MUSIC
execute if entity @e[scores={OutroTimer=550}] run playsound music.under_water master @a 0 0 0 10000 1.31 1



# RUN CREDITS
execute if entity @a[tag=CR1] run function d3:finale/credit_roll_1
execute if entity @a[tag=CR2] run function d3:finale/credit_roll_2
execute if entity @a[tag=CR3] run function d3:finale/credit_roll_3
execute if entity @a[tag=CR4] run function d3:finale/credit_roll_4
execute if entity @a[tag=CR5] run function d3:finale/credit_roll_5
execute if entity @a[tag=CR6] run function d3:finale/credit_roll_6
scoreboard players set @a[scores={CR_TP=200..}] CR_TP 0


execute if entity @e[scores={OutroTimer=570}] run title @a times 80 200 80
execute if entity @e[scores={OutroTimer=570}] run title @a title ["",{"text":"D ","color":"gold","bold":"true"},{"text":"I ","color":"yellow","bold":"true"},{"text":"V ","color":"green","bold":"true"},{"text":"E ","color":"light_purple","bold":"true"},{"text":"R ","color":"dark_aqua","bold":"true"},{"text":"S ","color":"dark_purple","bold":"true"},{"text":"I ","color":"blue","bold":"true"},{"text":"T ","color":"dark_red","bold":"true"},{"text":"Y ","color":"red","bold":"true"},{"text":" 3","color":"dark_gray","bold":"true"}]
execute if entity @e[scores={OutroTimer=570}] run title @a subtitle {"text":" ","color":"white"}


execute align x align y align x if entity @a[x=-2001,y=77,z=328,dx=1,dy=1,dz=1] run scoreboard objectives add CreditRoll dummy
scoreboard players add @e[tag=MainFinaleAEC] CreditRoll 0
scoreboard players add @e[scores={CreditRoll=0..}] CreditRoll 1

execute if entity @e[scores={CreditRoll=90..}] run scoreboard objectives remove OutroTimer

execute if entity @e[scores={CreditRoll=90}] run title @a times 30 160 30
execute if entity @e[scores={CreditRoll=90}] run title @a title {"text":"AdamDJM","bold":false,"color":"gold"}
execute if entity @e[scores={CreditRoll=90}] run title @a subtitle {"text":"Lead Aesthetic Builder","color":"white"}

execute if entity @e[scores={CreditRoll=400}] run title @a times 30 160 30
execute if entity @e[scores={CreditRoll=400}] run title @a title {"text":"The1Kwa1Jsucsh","bold":false,"color":"green"}
execute if entity @e[scores={CreditRoll=400}] run title @a subtitle {"text":"Camp and Monument Islands Builder","color":"white"}

execute if entity @e[scores={CreditRoll=700}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=700}] run title @a title {"text":"Noodlor","bold":false,"color":"light_purple"}
execute if entity @e[scores={CreditRoll=700}] run title @a subtitle {"text":"Pirate Ship Structure Builder","color":"white"}

execute if entity @e[scores={CreditRoll=950}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=950}] run title @a title {"text":"Cold Fusion","bold":false,"color":"dark_aqua"}
execute if entity @e[scores={CreditRoll=950}] run title @a subtitle {"text":"Escape Branch Designer","color":"white"}

execute if entity @e[scores={CreditRoll=1270}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=1270}] run title @a title {"text":"renderXR","bold":false,"color":"dark_purple"}
execute if entity @e[scores={CreditRoll=1270}] run title @a subtitle {"text":"Elytra Branch Builder","color":"white"}

execute if entity @e[scores={CreditRoll=1600}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=1600}] run title @a title {"text":"abrightmoore","bold":false,"color":"aqua"}
execute if entity @e[scores={CreditRoll=1600}] run title @a subtitle {"text":"Parkour and Dropper Course Builder","color":"white"}

execute if entity @e[scores={CreditRoll=1980}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=1980}] run title @a title {"text":"qwertyuiopthepie","bold":false,"color":"dark_green"}
execute if entity @e[scores={CreditRoll=1980}] run title @a subtitle {"text":"Ring and Pearl Branch Mechanics","color":"white"}

execute if entity @e[scores={CreditRoll=2350}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=2350}] run title @a title {"text":"Jigarbov","bold":false,"color":"gray"}
execute if entity @e[scores={CreditRoll=2350}] run title @a subtitle {"text":"Boss Battle Branch Designer","color":"white"}

execute if entity @e[scores={CreditRoll=2700}] run title @a times 30 170 30
execute if entity @e[scores={CreditRoll=2700}] run title @a title {"text":"qmagnet","bold":false,"color":"red"}
execute if entity @e[scores={CreditRoll=2700}] run title @a subtitle {"text":"Map Programmer and Director","color":"white"}

execute if entity @e[scores={CreditRoll=3210}] run title @a times 30 350 30
execute if entity @e[scores={CreditRoll=3210}] run title @a title {"text":" ","bold":false,"color":"yellow"}
execute if entity @e[scores={CreditRoll=3210}] run title @a subtitle {"text":"Thanks for playing","color":"white"}

execute if entity @e[scores={CreditRoll=3299}] run gamemode spectator @a[gamemode=!spectator]

#execute if entity @e[scores={CreditRoll=3300..}] run kill @e[tag=CR_AEC]




# END
execute if entity @e[scores={CreditRoll=3920}] at @a run summon area_effect_cloud ~ ~ ~ {Tags:["CreditEndAEC"],Duration:100}
execute if entity @e[scores={CreditRoll=3920..4024}] as @a at @e[tag=CreditEndAEC,sort=nearest] run teleport @s ~ ~ ~

execute if entity @e[scores={CreditRoll=3945..}] at @a run particle portal ~ ~2 ~ 0.7 1 0.7 0 50 force
execute if entity @e[scores={CreditRoll=3945}] at @e[tag=CreditEndAEC] run playsound block.portal.trigger master @a
execute if entity @e[scores={CreditRoll=4024}] run effect give @a blindness 2 255 true
execute if entity @e[scores={CreditRoll=4024}] run stopsound @a
execute if entity @e[scores={CreditRoll=4025..}] run tag @a remove InFinale
execute if entity @e[scores={CreditRoll=4025..}] run scoreboard objectives remove WhiteFailSafe
execute if entity @e[scores={CreditRoll=4025..}] run kill @e[tag=CreditEndAEC]
execute if entity @e[scores={CreditRoll=4025..}] run setblock 0 2 106 clay
execute if entity @e[scores={CreditRoll=4025..}] run gamemode adventure @a
execute if entity @e[scores={CreditRoll=4025..}] run time set 12500
execute if entity @e[scores={CreditRoll=4025..}] run teleport @a 8 4 97 0 -90
