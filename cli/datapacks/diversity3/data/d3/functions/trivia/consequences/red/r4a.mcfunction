####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018 / SEPTEMBER 13 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1015 72 1029

#scoreboard objectives setdisplay sidebar Incorrect_R4A
#scoreboard objectives setdisplay sidebar R4AArrowLife
#scoreboard objectives setdisplay sidebar R4AGiveBow

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=969,y=54,z=1139,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R4A dummy
execute align x align y align z if entity @a[x=969,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R4A 1

execute if entity @e[scores={Incorrect_R4A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R4A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R4A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R4A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R4A=1}] run title @a subtitle {"text":"Activator Rails do eject the rider", "color":"white"}
execute if entity @e[scores={Incorrect_R4A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now go ahead. Eject the D3 Map Team!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R4A=..20}] run fill 973 69 1159 989 69 1157 air replace oak_button
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 973 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 975 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 977 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 979 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 981 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 983 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 985 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 987 69 1159 barrier
execute if entity @e[scores={Incorrect_R4A=..20}] run setblock 989 69 1159 barrier

# IF LEAVING BUTTONS
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 973 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 975 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 977 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 979 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 981 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 983 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 985 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 987 69 1157 oak_button[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R4A=21}] run setblock 989 69 1157 oak_button[face=wall,facing=north,powered=false]

execute if entity @e[scores={Incorrect_R4A=1}] run kill @e[tag=R4AMinecart]
execute if entity @e[scores={Incorrect_R4A=1}] as @e[tag=R4AMinecart] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R4A=1}] run kill @e[type=arrow]
execute if entity @e[scores={Incorrect_R4A=1}] run tag @e remove R4AStareMob
execute if entity @e[scores={Incorrect_R4A=5}] as @e[tag=R4AMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_R4A=15}] run kill @e[tag=R4AMob]


execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 989 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:zombie",Rotation:[180f,0f],CustomName:"{\"text\":\"abrightmoore\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "c67563fd-4b7f-4a6b-a908-7237c3f1eaf9", Properties: {textures: [{Signature: "nmp7wlrTf7LZ7MzCSEBlOGhMHPISEe0V96dvJN0nzcKbd6BqSvi7sn312Zy0lulVlPGc8BMaCXkU9xhPzznwdG8/TDfrtZueaXS5wvuLjdVR66mPYb72i90wbo8drdhZxKgnPVPD0rTVe98TCSm6duojBOm+/w0q/L4uVhcHhNIi/8N5AD6J22W6Ca9jjIqZOwLSMAZVJM8mtatgwEeY5SxzEXioRgOGo1pzgoqKvTgNPwiks4nWPzPI0KZNmS8lyZ0ETmdIzEHlMH2gNcgLq/D8dIxykVluS42bzRKuJVLmLXT+BLpf+AQG0EjsKjMfcg7ZleFjZ7AtXnLYz0BbfAjHBbQWpunxnhTVsy8DJhUmDUMWcOXzgqls+iv4Xm7O4OY1Pky65rjS0YdV+IdAoo4MCbtCF5/z5q35I+onA3W9CrXnByzoQvoJNUO1/4VVnR1eTD3USyuz3c3PDTNbTE6w9aQbcC8TzhIcXFdHOR0dAPj1icz8UzidBqZnO8Aczza6NhytTUcB73pbsDf6m0usl4A1U00BwV/kEUya2S5fnkIZsSTafhNTrgCI/12yaqD0ziYrKZhHKHsJ8zMFgou87WIQA1F6q2Fbxkm5oGyOwG/ZMy5fqptkuTQ+1PRhsJHjSPaFwC2TqRX0rjFaWAyrjYLzYuUEbS4xtumaHM4=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgxNTc3OTAsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]}, Name: "abrightmoore"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 987 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:zombie_pigman",Rotation:[180f,0f],CustomName:"{\"text\":\"AdamDJM\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures: [{Signature: "QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]}, Name: "AdamDJM"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 985 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:skeleton",Rotation:[180f,0f],CustomName:"{\"text\":\"ColdFusionGaming\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "07270730-7cf6-48f4-8850-11847f4d61a3", Properties: {textures: [{Signature: "E08RJkQu7JMPAg4f2vRm3JEI1AJt+AAqanlkzt9i4Uy50v6pJZ/GL5iIM5nUri7DMCRIAC3Wf0PdYT2r9OfRlmxFvMs286skw5ZeqUfs0itYV6b/Y06lf1Szy3M0sNnfQe38GszoyzG54ZNrlEAj8fCF/EniN8bdVSdKAHAnAu3w4DVHZ8zim1qAHfHx4PFoubTTv53xqO6ip+OexMXOdGdaPjB8iRIt5X9lVvtSE1fk6/xIEeyEGaANSIUSkDL7SniEQRcC3Kp/MCZ3xbxzy6SP1DAH7XRiXUUNkdFez5o9O9iU1ec+LTMDAVouBruBs3Go+FLmqhFDHBH8zPxzY0+LkgxNSh3wo3k0n0gS2KjEbjxSie8Oiq7e0IXASUu6ayAQ/RZZ/8zT6wI50KF79gvDCSeSU3xb4fNCblcEp55JmUGnv3/FcHEib/qHn4bLNjAxt5rQLiec+l16NFFhCcPlaQiZB9GUWO7Cpmo7iMwyQPAXpM59VD+KZkJTNJlGPGPTlHIVKJcLHfngafH0Hz45HYex/37GTulrvfphG03+h3P+Vl3ZGADlcj54OEViTxOShM+8l9RkIv50TwbX6sNT4Y4BcugC9vNAI/c4vRt9qg9rQOtOhSqf1+InqwJOquysr/fhG3COvpvrOh6RjQ77lMDy2zEZ7Lx1dQgGmkc=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTg4Njg5NDksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]}, Name: "ColdFusionGaming"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 983 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:husk",Rotation:[180f,0f],CustomName:"{\"text\":\"Jigarbov\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:8421247}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:8550}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:44975}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "0e696be4-b798-452e-921e-816330bc97a9", Properties: {textures: [{Signature: "L3/V5fd+uKro8fz+1wmU1QUSy4iWCh+XzDbHp8SnjO+12dX6FjqDOgoqJGnUatD7ufVy0s/ibWPAhlPzPOmEw3h6yNGpAYBs/49nQrewF+0PydEEcjleI+USzwhw/B3Cpslbpjkxy0N0aHsCA1JSd/PFUvJlf9g1l69GN9hN4FreeT9Q4S7Ki7UNWWIXpPtZtxSa6F1CGEGe3zn+jhZcoLULMCFP/mkccJTpnRAWc7CcSLsgSgyluc1ELbGYhAsK4NEx01Vc+waT95OXpV1S+TtK2hG9x5MolMhW/NcoPtRfSa0Ahl4fuAkSrXLxbF3Tc6YE6nQIcOnRPx5UJhByMcCPS2gzWbkB07YRqX0pIB+QsluI8tqLk+Gepy2bDMqcK/zk2xKhaUsDxJjQBkFStfoPZCFUrnpVuzuS7V2iB88GhTX8/VfUZfv41sqS40cwV/DIiCz6JNQveBh0qpsJ9e9aGIvmgVmVltAprTtnb+xirO6soZu/Ewm3O7fNBad7lS3D10UZ+h+WHI8mvZ2Rq12Tb5HL+Wlb2SPovAGk7s1+VFqFzyLhWC7Fb69w1hNoLEHl3pRIKpc/VFHNY341QMzPSJJStlCpWguc9LpdUPxlzhO3lZnxABHBIv+wS217fQ6CK/nPvgCdGQah4JZNdh0q6O4yr5W0n4edaKykMEs=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTg5Nzc4MTQsInByb2ZpbGVJZCI6IjBlNjk2YmU0Yjc5ODQ1MmU5MjFlODE2MzMwYmM5N2E5IiwicHJvZmlsZU5hbWUiOiJKaWdhcmJvdiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjk4YjNlYjMyM2M2ZjY0NzExZGJjODA2YjE0MzhhOTM3NmVjNTRlNjY0ZmM0M2UzMzQwYjM3NmJjNDA0NGNlIn19fQ=="}]}, Name: "Jigarbov"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 981 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:zombie",Rotation:[180f,0f],CustomName:"{\"text\":\"Noodlor\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:10079334}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13382502}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13421772}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "26fe7806-9bf5-455d-b460-706c99ec5f0a", Properties: {textures: [{Signature: "EFcsKqW5e5ATTpCGI4LGtyLwOemYDpEN0jhNpsRwqHdhbXydlnXU4ELAo/wjttvG1ywSJH9DNjzQX9MwT66oF4iNB3zkfPlQnPAiXN9oYr8oCIrcVhV6xxGtt6GheittZQ5gaTs0VUxJzKf36uYHFVHb9VpdQ5jNHTOOaxclGJSPpWDno94X+btNI2Kv2AWap0FsxRAhQ+hOHidnDnadEpnMUwef2wsT9RzxuGyyv8HWhSbfdKI5nwmqFXYCCJ6RHaihBl5+8UmyEo5fvfwCwAOH35HAi3MVhm/qEhTdkY7MwzDHP6lbFXySDeUIIP2zwfZL5UulzkMfWqr3pbGhfyzjw+DMWMXv6g3jYICd2P3WW7uYHC0Gw8zYo1x3sqHxN5A1ZfIerhdGm3P1F3voK3J5e18LqQavQnqL7pp5hpx/tHn0Mc5zZmP9dV4pJrOvja8vlSsQU5nkDfxzZ6zlvlghJLmN+GX0EPhf5sCAGDNTP+oQNogtjIK6l95uwgHZO7+yc6gPjH+nBq2q6TfBY7qGl1MMibQCALIHbXkSO61198ifJPL+os8q6xJ6wMGGZGnu2QINUF62Ih97El+hKO4Hd9Glmpuq+jiccfKHofwMD9Bs4hUqWsB+5NWOG/Hcccjq2B6MR9qr3GOKpCxuj9zhyECVVv3yfZ1pLJJusZw=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwMDUxNzYsInByb2ZpbGVJZCI6IjI2ZmU3ODA2OWJmNTQ1NWRiNDYwNzA2Yzk5ZWM1ZjBhIiwicHJvZmlsZU5hbWUiOiJOb29kbG9yIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mZTY3OGI2ZTBiMmEwZmRlMTk2ZGUyMWQ1MjczNjdiNjkzNDMzZGRjYjk3ZjFlMmM5MTFlNjAzN2RmNWRlNWI1In19fQ=="}]}, Name: "Noodlor"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 979 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:wither_skeleton",Rotation:[180f,0f],CustomName:"{\"text\":\"qmagnet\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3944244}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5392466}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "33d27085-844a-4be7-ab27-941c217b48f5", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]}, Name: "qmagnet"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 977 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:stray",Rotation:[180f,0f],CustomName:"{\"text\":\"qwertyuiopthepie\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "03b07a62-98e6-4fc4-8187-fb276d5a317c", Properties: {textures: [{Signature: "eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]}, Name: "qwertyuiopthepie"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 975 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:drowned",Rotation:[180f,0f],CustomName:"{\"text\":\"renderXR\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6929734}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6044718}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4415092}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "1c361569-6b3e-4ab0-b27f-b9f0df43f336", Properties: {textures: [{Signature: "JLxMr+0q/SVVJOwnNZf8NHOeeHXJ7CFPAS46QG5nHGL6t9qXxAThGVi5hVFILC/ZacuN1CFnkMU4pmv66echLDqfEk6qOEoI33p5o3+w9DFj9yv7Gc/D7UrS08FiWUAkMnSoBaT1eLU7MrawnBpaUqc8727fh63TX+3kjGjSGmwPb9XU5RoEEPUvRkaOq1csimujkU5Bpj4oyb3AeQBsZUe8V4G6lus2jL15w3nYPbG737XQm4LHPo2r6/4kIB6YdDSxc4dgI16CG9HXiV5SAKEbHmJtx9W/o+uVZCQsvY68gexZhgq3oU9Gy6R6dJz/C7Y+7hDkzQXiTnM5XxmVGyHzQzWzR5jwSYmPScqnOCRqo5C5xTVWHTHVRmVbpbUmc9pe2fMBkCXUF/Hmm//U3b5TIjjPRaMbI2zM9I4vNquAXlPSx44vY9Yn3A/XjGPngSh94Xgu9tiNTilZz0fdJS7rtUdxM/ZpfxK8L8q0kiNhlnNnK53e6ld2zRZxjhy7kF0f/Lz1nbVdLm1lmMnCVk2e08Kmd2HGglROXhBb+qvx539MdoE8byCj4/rrQGI/bdiVzaGnSD2i4rTQ06VBYhoz5UVnj4F+4oqk6gDzARwXKBU9TwsX2eKSnrMyEPY4eNGy61OZn0dmSM/ymnN9uB9o4h2vXpL2DkK4Pl/Lh+I=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTkxMDAyMjEsInByb2ZpbGVJZCI6IjFjMzYxNTY5NmIzZTRhYjBiMjdmYjlmMGRmNDNmMzM2IiwicHJvZmlsZU5hbWUiOiJyZW5kZXJYUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmMyNzZhZTZiMGY3YjQxMGI0NjZmNmIyZTk2MmU1MWNlMzk2ODRhYTM0YjUyOTQ0MDE4MWM1MjYyY2RmMWM4ZCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]}, Name: "renderXR"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}

execute if entity @e[scores={Incorrect_R4A=20}] run summon minecart 973 70 1158 {Invulnerable:true,Tags:["R4AMinecart"],Passengers:[{id:"minecraft:zombie",Rotation:[180f,0f],CustomName:"{\"text\":\"The1Kwa1Jsucsh\"}",CustomNameVisible:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4008727}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4011567}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4863005}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "1ca31321-dbd1-4c83-93b8-f58311600709", Properties: {textures: [{Signature: "DxW02OCzQ93IXxCBge2bMSTq5geoiiBcJIZcVQj72gDJq/xGJ2BL0hUeP6llceMr3DKTpd2QY/FAyfmuSjCK7IHvP6umtwhm18G16AkD1NgG8iycNvtR/Nm09PHgQh10xmsGzD5uLsZHXkjEGOTUjWYrU3WAH1ExJ4UZomJ9F2rW856wgwoOy3yaASkpxUOkEsOhL7bdzzAomfBWPiTVGnKZMYInjoZNXXSJCAQ7lRjIkBtSO64QagFBVvnzpyYaTFDoXFBDIBh18OkLa4I4Mu5boWBLqDOK6wBFVKncAKubepmfIhv3jXCQZz+mYKmshj+QJ+4g7YiTfBLbshJTCkPxGws1LtLBNYUi/ptoZJCHdePbTuy9doaMVFiR1WcLNp+USrD7qAbUapw0fqMJVW3/s2AipZMJzFJYGhzWuYE5tGirCGL9vpiTGcpGLE6caPUvAHpOSBZmCm9ZEW8VDYsPI5Seex5sCGzQAD/ARsWFJBhyfz6YA4mBLHgJlJX9G6DtTyB5KLt+mHqbwUkjym3/pWcRdC9eXbIJynzE5pL3a0Vm2Ytj3u+nWdPm04EudUEQAzs1vgPwB4twbitOPowrFkgnLiYjoe8wzCDyZFc6EfiWF4A+FYTXTancolOjMc8WCdwONdiRXmZ5Q2zkcLNCTEI4vCUFLY7LLsa3At0=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTkwNTc4MzksInByb2ZpbGVJZCI6IjFjYTMxMzIxZGJkMTRjODM5M2I4ZjU4MzExNjAwNzA5IiwicHJvZmlsZU5hbWUiOiJkZW1lbnRlZGRvb2QiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E1NmY2YzMzOTY1MTZjNjM0YTg2OWVkN2IwMzgxNTUwODljNzg3OTliOTA0ODEwZWVhNzQ4M2VjNGQ2MzQ2YWEifX19"}]}, Name: "dementeddood"}},Count:1b}],Tags:["R4AMob","R4AStareMob"]}]}


effect give @e[tag=R4AStareMob] resistance 2 255 true
execute as @e[tag=R4AMinecart] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}


scoreboard objectives add R4AArrowLife dummy
scoreboard players add @e[type=arrow] R4AArrowLife 1
kill @e[type=arrow,scores={R4AArrowLife=60..}]

execute if entity @e[scores={Incorrect_R4A=30..}] as @e[tag=R4AStareMob] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]
execute align x align y align z as @e[tag=R4AStareMob,x=973,y=69,z=1159,dx=16,dy=2,dz=0] run tag @s remove R4AStareMob
execute align x align y align z as @e[tag=R4AMob] at @s if block ~ ~-1 ~ barrier run setblock ~ ~-1 ~ oak_button[face=wall,facing=south,powered=true]
execute as @e[tag=R4AMob] at @s if block ~ ~1 ~ lava run kill @s


scoreboard objectives add R4AGiveBow dummy
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:bow"}]}] R4AGiveBow
scoreboard players add @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:bow"}]}] R4AGiveBow 1
execute if entity @e[scores={Incorrect_R4A=80..}] run give @a[tag=WrongAnswer,scores={R4AGiveBow=5..}] bow{Unbreakable:true,HideFlags:4,Enchantments:[{id:"minecraft:infinity",lvl:1}]}

scoreboard objectives add R4AGiveArrow dummy
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:arrow"}]}] R4AGiveArrow
scoreboard players add @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:arrow"}]}] R4AGiveArrow 1
execute if entity @e[scores={Incorrect_R4A=80..}] run give @a[tag=WrongAnswer,scores={R4AGiveArrow=5..}] arrow

execute align x align y align z run kill @e[x=969,y=54,z=1139,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:bow"}}]
execute align x align y align z run kill @e[x=969,y=54,z=1139,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:arrow"}}]




execute if entity @e[scores={Incorrect_R4A=80..}] unless entity @e[tag=R4AMob] run teleport @a[tag=WrongAnswer] 1000 67 1036 90 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=969,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives add R4A_End dummy
execute align x align y align z if entity @a[x=969,y=54,z=1139,dx=24,dy=24,dz=24] run scoreboard objectives remove R4A_End
execute align x align y align z unless entity @a[x=969,y=54,z=1139,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R4A_End 1

execute if entity @e[scores={R4A_End=25..}] run clear @a
execute if entity @e[scores={R4A_End=25..}] run scoreboard objectives remove R4AArrowLife
execute if entity @e[scores={R4A_End=25..}] run scoreboard objectives remove R4AGiveArrow
execute if entity @e[scores={R4A_End=25..}] run scoreboard objectives remove R4AGiveBow
execute if entity @e[scores={R4A_End=25..}] run scoreboard objectives remove Incorrect_R4A
execute if entity @e[scores={R4A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R4A_End=25..}] run scoreboard objectives remove R4A_End