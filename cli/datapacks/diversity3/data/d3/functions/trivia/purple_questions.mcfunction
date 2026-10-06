####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 13 2018 / AUGUST 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar Disco
#scoreboard objectives setdisplay sidebar DiscoTimer
#scoreboard objectives setdisplay sidebar TriviaShulker

# QUESTION PURPLE 1 -> DIVERSITY / ? ROOM
execute if block 984 64 1010 stone_button[powered=true] run scoreboard objectives add Question_P1 dummy
execute if block 984 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P1 1
execute if block 984 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_P1

execute if entity @e[scores={Question_P1=4}] run summon skeleton 987 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"07270730-7cf6-48f4-8850-11847f4d61a3",Properties:{textures:[{Signature:"E08RJkQu7JMPAg4f2vRm3JEI1AJt+AAqanlkzt9i4Uy50v6pJZ/GL5iIM5nUri7DMCRIAC3Wf0PdYT2r9OfRlmxFvMs286skw5ZeqUfs0itYV6b/Y06lf1Szy3M0sNnfQe38GszoyzG54ZNrlEAj8fCF/EniN8bdVSdKAHAnAu3w4DVHZ8zim1qAHfHx4PFoubTTv53xqO6ip+OexMXOdGdaPjB8iRIt5X9lVvtSE1fk6/xIEeyEGaANSIUSkDL7SniEQRcC3Kp/MCZ3xbxzy6SP1DAH7XRiXUUNkdFez5o9O9iU1ec+LTMDAVouBruBs3Go+FLmqhFDHBH8zPxzY0+LkgxNSh3wo3k0n0gS2KjEbjxSie8Oiq7e0IXASUu6ayAQ/RZZ/8zT6wI50KF79gvDCSeSU3xb4fNCblcEp55JmUGnv3/FcHEib/qHn4bLNjAxt5rQLiec+l16NFFhCcPlaQiZB9GUWO7Cpmo7iMwyQPAXpM59VD+KZkJTNJlGPGPTlHIVKJcLHfngafH0Hz45HYex/37GTulrvfphG03+h3P+Vl3ZGADlcj54OEViTxOShM+8l9RkIv50TwbX6sNT4Y4BcugC9vNAI/c4vRt9qg9rQOtOhSqf1+InqwJOquysr/fhG3COvpvrOh6RjQ77lMDy2zEZ7Lx1dQgGmkc=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTg4Njg5NDksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]},Name:"ColdFusionGaming"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP1","TriviaMobP1A"]}
execute if entity @e[scores={Question_P1=9}] run summon skeleton 981 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"a531d596-41fa-4372-8430-f38d5157c745",Properties:{textures:[{Signature:"n2kU3fQcMEQba89bz4fEKBXcCqlFBTvvapgtXfZ/lgVBnYsA4b84RKlbFBJ6hP95ijhHmZKrmng8WdHXZuDaTd1hKOfOR6bB6Cz+Xe4tey/LL5l2l64OvtsTLVW5N4qPxEzVkV6C/xMWSVYgp4bNWCDnvFRVQsw3bXBx+QTOQPDSxWXpZBhdH8ut6JW1NvibGK8SvEfEvl2IaZCOok3YHsKO8npYIRSoB/HtQO6scl+op/9E2WAsjH1dGP8mP7jv0eG8076MfzRzyRo1Nz0sIvmcjs8otlhiUjAMftbMDaX/oIzi+As5BRZRKDuLDsVbkwpoFTj4fIFnyA0CLOV0KuTNRQgxZU3iUFLR3NgqCjbKld5truSEkNn30ire6XJLHrR163f6chKLmzfcK6DxMiyW3i+2tLnT5xytNUZ6v0rrmS8Q7NU/NhTSvSCtarKNo19SxqLWSA7bKshO34VDiyXlzad9xTO8wdXD5s1nc4W/NQgPa+Kfuz3LQe7ITu4EgXfoGSgfIrwJi+/zPkJ6vYynaT89zqCteJlwktvZMWmf6jQt2MY9Kyyqb0QHWVhEFpBFzs+MObc7R5d970tmQrswj2F6kovOsRb983rtjipV17xTCAFi7+XxglzDEWhM0kFu+6LyzOdyD+kn6pzx1VhFOx0Qp8HwOe4Y3vJAcV4=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTk4MjczMTksInByb2ZpbGVJZCI6ImE1MzFkNTk2NDFmYTQzNzI4NDMwZjM4ZDUxNTdjNzQ1IiwicHJvZmlsZU5hbWUiOiJKZXNwZXJ0aGVlbmQiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzY4NDM0YzhkM2M2YWZlM2NmZDIxZTdhMjYwYjc3YmRiOTZiM2UwMDlmNWIzMDQ5YjdhZjcwZGFjNmU5Njg5YjMifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzE3OTEyNzkwZmYxNjRiOTMxOTZmMDhiYTcxZDBlNjIxMjkzMDQ3NzZkMGYzNDczMzRmOGE2ZWFlNTA5ZjhhNTYifX19"}]},Name:"Jespertheend"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP1","TriviaMobP1B"]}
execute if entity @e[scores={Question_P1=14}] run summon skeleton 981 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"33d27085-844a-4be7-ab27-941c217b48f5",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1MzYwNzgzNjQ1NTgsInByb2ZpbGVJZCI6IjMzZDI3MDg1ODQ0YTRiZTdhYjI3OTQxYzIxN2I0OGY1IiwicHJvZmlsZU5hbWUiOiJxbWFnbmV0IiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQ5YzI4OWQwOWE4ODE1MzAyZTM3MzU1MzUxNWY5OTcxYjM1YTE1ZmJjNjk4Mzc4OWI0ZDA2NDVlMmIzNzRkMzEifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2IwY2MwODg0MDcwMDQ0NzMyMmQ5NTNhMDJiOTY1ZjFkNjVhMTNhNjAzYmY2NGIxN2M4MDNjMjE0NDZmZTE2MzUifX19"}]},Name:"qmagnet"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP1","TriviaMobP1C"]}
execute if entity @e[scores={Question_P1=19}] run summon skeleton 987 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b510224e-d304-45a3-ac6a-bcd4ce4f34b9",Properties:{textures:[{Signature:"N9WBu6O4BdsABhoUVvl0DISTCijUNmQA6aNZyVAOOnzbgEWYhBpTGan9CpeglDBgQEw7GMGVCtoo1Mboh1Eq1Xf2Kg4IfVdUrsQmatmSy2fhmK8EHnvrcwQzTNG9c3zJAIvCp0LmzM513QfCQrUDx6nmhDIqgzMaiWrw2Y5mgNH8k9GAsU4IptF+QI6JH/xz13mxRNDRLrr2+OHqpgF+Xr60HsymmrsAThzGsqrqIpg5z96joioc4JqRjcqLH/LRJN03j4X/k0PWpwiBRZr1l9laqN5IaezMhwh4wiDTN8hkLmkC3UozMq74ruzotVjYZT+T8f1wevfQS4Ff8BVXlngi8pSo3Ei8dGIiFQTDA/uaQSjikfd9p109uO1Co6sJv7KO2fyvm55iUTkvYzG55qIN8x/U6U9y96b+mjxcuhyrSvJW5s+BDRAFBfPAa/eOBcER53vaVfbNdBnNbldwMsU8V8sddOCRCOSXtmNsNJ836Och5mxuq6LVgj+De0UWI1bDnqRQKaNpFT10A+xGyRStz8UmjU9fruWHxU53Hj6BJLnjtrbBCX9cCxkHSVfnrxJ1HEyXHPJXUm86Y+Hg/aw5Fd0lzT2pYrsHGJ9d+XvWSecJD0GeI04bfYI6TEBZ2rmapgUAqHs+8dl8xsaazmZM64omWrmz6P1x7/nCH0g=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTk5MjM5MTAsInByb2ZpbGVJZCI6ImI1MTAyMjRlZDMwNDQ1YTNhYzZhYmNkNGNlNGYzNGI5IiwicHJvZmlsZU5hbWUiOiJyc21hbGVjIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lZDYxODRlOWQwNWI0MzUxNzY4ZTM3Mjg5ZGRiYTMwZTZkNWIwNzA4OGZkODVlZWY3OTY5YTA5Y2Y5OGE5ZTVhIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85NTNjYWM4Yjc3OWZlNDEzODNlNjc1ZWUyYjg2MDcxYTcxNjU4ZjIxODBmNTZmYmNlOGFhMzE1ZWE3MGUyZWQ2In19fQ=="}]},Name:"rsmalec"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP1","TriviaMobP1D"]}

execute if entity @e[tag=TriviaMobP1] run scoreboard players set @e[scores={Question_P1=3}] Question_P1 19
execute if entity @e[scores={Question_P1=19}] run tellraw @a[tag=P1] ["",{"text":" Q: Who is the original creator of the Diversity Minecraft map series?","color":"green","bold":false}]
execute if entity @e[scores={Question_P1=19}] run kill @e[tag=MonumentChicken]
execute if entity @e[scores={Question_P1=19}] run summon chicken 979 65 1017 {NoAI:true,Tags:["MonumentChicken"]}
execute if entity @e[scores={Question_P1=19}] run summon chicken 980 65 1017 {NoAI:true,Tags:["MonumentChicken"]}
execute if entity @e[scores={Question_P1=19}] run summon chicken 981 65 1017 {NoAI:true,Tags:["MonumentChicken"]}
execute if entity @e[scores={Question_P1=19}] run summon chicken 982 65 1017 {NoAI:true,Tags:["MonumentChicken"]}
execute if entity @e[scores={Question_P1=19}] run summon chicken 983 65 1017 {NoAI:true,Tags:["MonumentChicken"]}


execute if entity @e[tag=TriviaMobP1A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP1A] unless entity @e[tag=TriviaAECP1A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP1","TriviaAECP1A"],Duration:2147483647,CustomName:"{\"text\":\"ColdFusion\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP1B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP1B] unless entity @e[tag=TriviaAECP1B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP1","TriviaAECP1B"],Duration:2147483647,CustomName:"{\"text\":\"Jesper the End\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP1C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP1C] unless entity @e[tag=TriviaAECP1C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP1","TriviaAECP1C"],Duration:2147483647,CustomName:"{\"text\":\"qmagnet\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP1D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP1D] unless entity @e[tag=TriviaAECP1D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP1","TriviaAECP1D"],Duration:2147483647,CustomName:"{\"text\":\"rsmalec\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP1A] as @e[tag=TriviaMobP1A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP1B] as @e[tag=TriviaMobP1B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP1C] as @e[tag=TriviaMobP1C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP1D] as @e[tag=TriviaMobP1D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP1A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP1A]
execute if entity @e[tag=TriviaMobP1B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP1B]
execute if entity @e[tag=TriviaMobP1C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP1C]
execute if entity @e[tag=TriviaMobP1D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP1D]

execute unless entity @e[tag=TriviaMobP1A] run kill @e[tag=TriviaAECP1A]
execute unless entity @e[tag=TriviaMobP1B] run kill @e[tag=TriviaAECP1B]
execute unless entity @e[tag=TriviaMobP1C] run kill @e[tag=TriviaAECP1C]
execute unless entity @e[tag=TriviaMobP1D] run kill @e[tag=TriviaAECP1D]


# IF WRONG
execute if entity @e[tag=TriviaMobP1A,nbt={HurtTime:10s}] run teleport @a 890 6 1019
execute if entity @e[tag=TriviaMobP1B,nbt={HurtTime:10s}] run teleport @a 890 6 1049
execute if entity @e[tag=TriviaMobP1D,nbt={HurtTime:10s}] run teleport @a 890 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobP1C,nbt={HurtTime:10s}] run scoreboard objectives add QP1_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP1_Correct 1

execute if entity @e[scores={QP1_Correct=1}] run setblock 984 64 1010 air
execute if entity @e[scores={QP1_Correct=1}] run kill @e[tag=TriviaAECP1]
execute if entity @e[scores={QP1_Correct=1}] run kill @e[tag=PreLoadStandP1]
execute if entity @e[scores={QP1_Correct=1}] as @e[tag=TriviaMobP1] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP1_Correct=1}] as @e[tag=TriviaMobP1] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP1_Correct=20}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP1_Correct=22}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP1_Correct=23}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP1_Correct=24}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP1_Correct=25}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP1_Correct=26}] at @a[tag=P1] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP1_Correct=30}] run playsound entity.firework_rocket.launch master @a 984 64 1010 1 1 0

execute if entity @e[scores={QP1_Correct=32}] run title @a[tag=P1] times 1 80 1
execute if entity @e[scores={QP1_Correct=32}] run title @a[tag=P1] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP1_Correct=32}] run title @a[tag=P1] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP1_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP1_Correct=35}] run tellraw @a[tag=P1] ["",{"text":" (✔) CORRECT: qmagnet is the original creator of Diversity. We hope you got that first try or he may be a bit sad. You can check out more of his maps "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=R4Sl8R5i7vY&index=2&list=PL-Jl0mSnzm10PvxtUqulutG-ZGRiaiNil"}},{"text":"."}]

execute if entity @e[scores={QP1_Correct=35}] run fill 977 63 996 977 63 996 air replace purple_concrete
execute if entity @e[scores={QP1_Correct=35}] run setblock 977 64 990 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP1_Correct=35}] at @a[tag=P1] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP1_Correct=35..}] run scoreboard objectives remove QP1_Correct

execute if entity @e[scores={QP1_Correct=1}] run kill @e[tag=TriviaPig]
execute if entity @e[scores={QP1_Correct=1}] run summon pig 981 65 991 {Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 981 65 989 {Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 981 65 969 {Rotation:[90f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}

execute if entity @e[scores={QP1_Correct=1}] run summon pig 973 65 991 {Rotation:[270f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 973 65 987 {Rotation:[270f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 973 65 985 {Rotation:[270f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 973 65 973 {Rotation:[270f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}
execute if entity @e[scores={QP1_Correct=1}] run summon pig 973 65 971 {Rotation:[270f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],NoAI:true,Tags:["TriviaPig"]}

execute as @e[tag=TriviaPig] at @s run teleport @s ^ ^ ^ facing entity @p[tag=P2]


#/give @p skull 1 3 {display:{Name:"Psy"},SkullOwner:{Id:"8d3bcd9a-8332-4f73-b898-c2cd59fdbb89",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjVkZWQzNTg3ODVjNWYzMjA1NzE1NWI0ZjUxN2ZiNDRmYzRiN2FlM2VhYzk5MTY4OWNmMDMzNDVmODdhOGQ1YyJ9fX0="}]}}}

###

# QUESTION PURPLE 2 -> MUSIC VIDEOS / MINECRAFT STYLE ROOM
execute if block 977 64 990 stone_button[powered=true] run scoreboard objectives add Question_P2 dummy
execute if block 977 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P2 1
execute if block 977 64 990 stone_button[powered=false] run scoreboard objectives remove Question_P2

execute if entity @e[scores={Question_P2=4}] run summon skeleton 980 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5f820c39-5883-4392-b174-3125ac05e38c",Properties:{textures:[{Signature:"akpzfEXSug2Oncsxp56eBhYPHSib5oZt3cyL1pWiy3/2Wyngd28N55JJSMVEEFem1O8AuGrLCilxzuFzU+w30oznLOEuQN/hqA+ybOqhyaO7HIFtjI7PEshh6YMVBQX5exopGumAo9u1C7xuNjcwP2xZ4JkCAca/uwUU4n/bkk9Q8TxWbmY7U/t3ICeaw1z2GiZ8jPBu6bNuUH2fSbqP+QxKgrj6X8ow80n23fnw9r3vBXr9r7cf+5TXaTv3j74vb77JmuByrTYfq/qwhqeRjmlTrCyrsovqC6u0ksYEgtG21vFT1WZBlOcr/pNr0HOyiCxggTRiTgkNZE3rVegqQBm+m0GDdMAhUgByEoBrYwXTNT9wT5dpaj5FuN62/ATjQ9O1Vq681VUX5XjWPQ8g4RAkIUXFGlLopu0X4giHHPMMGO2IfKRFwTnoBFi2Pw6B5zpHcc0SRSwOq/sGCnlKJx3glQRjw4qETEJfPmiOUd3JNXtcAPP7720y3QtAql6/t8he3/V6wxHa5IjrYtTWsttd4jQTatd/GoskvXcsgfmqK8CLnKVi8OFoHtiBEyV7Of85pEPcz+bcNDgzsvbg7qb82s+movCSU2ZiwtARZ8QBlEBQxjrstHPu79U134LLVDnuqf2weiwAgFou3wqQypXZ5IPPnrUsXfpxy5Lxe9M=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAwODM0MTMsInByb2ZpbGVJZCI6IjVmODIwYzM5NTg4MzQzOTJiMTc0MzEyNWFjMDVlMzhjIiwicHJvZmlsZU5hbWUiOiJDYXB0YWluU3BhcmtsZXoiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzg0MTIzN2UzY2NiNzE3ZTZiNGFmODg5MmRlOGU4MzJjOGI0OWE0Zjg3ZTg3YTFmYzk4ZmU5ZDJhODI4OTljNGMifX19"}]},Name:"CaptainSparklez"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP2","TriviaMobP2A"]}
execute if entity @e[scores={Question_P2=9}] run summon skeleton 974 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"6835219e-d8c1-44be-8780-16fe069f9725",Properties:{textures:[{Signature:"m1rXoN8RLbz7CrBfPtpUKQxK4qtwWz4Mw3UqG8A67LVl2tbC2eR8uCSpUt8cBL5XtiEaP2mv17YMBAY4Vza2drhiLZNBJheUSlWbahEJWuVsoAgMkbGNYZWDAb8PgZhKMLjFP4pQ8O+IOC6F9y1p89OltODl1aPl1kVRO96+gXGv3DIpZ+61f62CC9sAD5Ev84NjZMiqKd5Cby/kDkmTN11C11JybHdbg5o53Xl6Hqu9P4zwLsfNBbzj2ORX0F7F1GFT/ILWj0FqxDCdSVpbqxMM9LvDrF3OucOePEfjjyo402vlBedbcr8IPviBubAO9O56UoVvPqkc1yCKTl8a4hooSfBrgfKgmx4Q/kDaige8yTTtgP9OHI6y0HVDcKN4D9q/kplrAwB+rC3omgXnL6VZaLcAnvUYJSkZ0SJuvHAusUMvi3h/cwvrJZS+uyoGMZcHsgPMKG6l1M+OGtQUWw3/wG3f7e8SVpeHplU8ZOQDVPxt1S/JsUW6Yq3wFgHBQ4FJQ0iOE1ZAvX5CjUUDZa+Sw8MIhHgvcl17OK3Jhdtf6uKgiv9X+GQ68yMS03ZfiUo+HyXkiBRlwE0Q3u9ehA8SPCPSSmV3q/dVaars8V69tP7YSTtqMLWUCIH0ELJy90gBiz2tQl1DPuLGM4Z+gLrtOTzRKY22x23DlYqB3Z8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAxODU1NTEsInByb2ZpbGVJZCI6IjY4MzUyMTllZDhjMTQ0YmU4NzgwMTZmZTA2OWY5NzI1IiwicHJvZmlsZU5hbWUiOiJCZWJvcFZveCIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2VmZmVlMDU3ZThhMDBjNDdiOWEyYWYyOTM3YjNhMDliZmQzYzJhMWU3NDFhOTVkNzIxNjRmNDNmNGEyMTdlZiJ9fX0="}]},Name:"BebopVox"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP2","TriviaMobP2B"]}
execute if entity @e[scores={Question_P2=14}] run summon skeleton 974 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"fef70d41-c47b-4aa1-872f-e6f9271d2803",Properties:{textures:[{Signature:"hZdz95JHMBSF0/bkd7uK2KnHSluzffuPZU+fyDX4m1cRBeix6Kvh96wof57flb3llq0WswK5ibgVviHHoOTJcCdDD04C2uSRceN79mt9MT5eDaux7baWkLDxfZ/GE8YZGtMifPcdCeWUoNhgPsTUkjNNULm6QkME9lxHW9QnpHWz6Ij1pQGGTrA/l5xtZ68oerfsBW0fQamuNFJAKNEXQfAwTdZjwnNXOZsQV8QusVhfEN0YF0J8/Kblv91zdI0D7ljdLRwVvtWZwlf8XRAXGyjjgYpTz8CN64uFw9HDWxZ9nu3g0BPVUeYac2MHRYuR34uYFUMYeWm2UFajL4g58lz4AI+vonjSkiLSHXIaXScxgIqnrREOYtktdNYEcRXvJAOjw+IAkCgjrq2C8k/t86U67fcvDAIMecNRQofVqvr5KhemsCX54zO0VYreSDqST1qtNoXvYNE7kyB4zK/SURTVa6ruJISuIRl9/16SKH9tIBhSeLeBg+C11rvCjR8xYTIaguA0jaor/2tvsIhXdHIta03wj4W4X3xL3F7fbdf+zSeJtEw8ZfrpZF93hVeG0G17yCl9EFjgzcf0lOt0WGd6bvffQeeqydjUZCsxgD5HThHcJYn8h4e6sfjD05onZRXRp5BmP4HpFKnSpuLC3pyOBOzaz9W1/e9XLADFrGY=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAyNDQ2MjIsInByb2ZpbGVJZCI6ImZlZjcwZDQxYzQ3YjRhYTE4NzJmZTZmOTI3MWQyODAzIiwicHJvZmlsZU5hbWUiOiJUaGVDb2R5TWF2ZXJpY2siLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFiMGRlYzcwMDVjYmIwYzNlZjFhNjZiZGI3OTY5NDI5Y2VkN2Q4MWQ2ZWUwMmUxYmY4MWZkMTA5MDkzMjdhYzUifX19"}]},Name:"TheCodyMaverick"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP2","TriviaMobP2C"]}
execute if entity @e[scores={Question_P2=19}] run summon skeleton 980 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"91b4b2d6-07ae-47bb-a66f-13c28c3d1842",Properties:{textures:[{Signature:"qHEme1qru/CNsq8PynBTRAi+jMJY/dHo8bSvJUxwnVg6Z+kM7fyZBWMGW4lCyZ3FFNPgrUnNGgrKEywTN7t8xKt8/blmwaE1GbDYn3yZUpZ/dYgfz9xXem+uGkZa/KzkAVNgaM6c6TD7i+GEpQG4Ol14rmw2voZD0XeY9aFw35iC6NI5nC2ONoZ2PcQtCiqNW0j+QYRqvChfiWiv5VnisqZJSd3juCoEsmnz6VMdLRn+QYR5B25HOtI4VokQucG4eHNeqaPkGl9NI3lWGA/aPsBAspupgFaPZcoPrmtgVaO9dgMVzCuE30L9X6qRcGkHL4wz0lY9ZE8B6EuQPwrbKjo4HEE59lgruO1CZNwQ9ZbysuZ9lqoub79lDVnDL0Roz3FXwK43qBh0vMyLiUqdr6LKGk+pP/t5hKoL3czeqwIqdlsxLr6QUE0tZpWn0UMa3+FcdkqSq+StQhfnlXTJBl4VXPf36ge2EarAVaUtDoXstMxEVKpmzow91yxhEvDDLkYSdzQQmcdQuZAPMLEqG55++UgRA+Fa+xmZeWKPgqSYMKEQ7y5dDE7vtz7AepNhuwWNv4VsmUScPxuTCBOu9DYujhRDlbq93kVcDF4JmE4RyUwfcmiDqgEoO3MoMTKVbK0FQX52nnvrOa9A44Bt7pH7Hc+bA5waakjnUpCFKZk=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAzMDEwMTEsInByb2ZpbGVJZCI6IjkxYjRiMmQ2MDdhZTQ3YmJhNjZmMTNjMjhjM2QxODQyIiwicHJvZmlsZU5hbWUiOiJCYWphbkNhbmFkaWFuIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNWQ3NjY4NTI1OGEwZTYyNzEwODlkMjYxNTBjODEyM2ZkNzA2N2MxYzMwMjcyZjJjN2FjYmQ1MDA1MWU1ZDllIn19fQ=="}]},Name:"BajanCanadian"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP2","TriviaMobP2D"]}

execute if entity @e[tag=TriviaMobP2] run scoreboard players set @e[scores={Question_P2=3}] Question_P2 19
execute if entity @e[scores={Question_P2=19}] run tellraw @a[tag=P2] ["",{"text":" Q: Minecraft Music Video parodies are quite popular on YouTube. Which video parodies Coldplay's \"","color":"green","bold":false},{"text":"Viva la Vida","color":"green","italic":true},{"text":"\"?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP2A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP2A] unless entity @e[tag=TriviaAECP2A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP2","TriviaAECP2A"],Duration:2147483647,CustomName:"{\"text\":\"Fallen Kingdom\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP2B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP2B] unless entity @e[tag=TriviaAECP2B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP2","TriviaAECP2B"],Duration:2147483647,CustomName:"{\"text\":\"Don't Mine at Night\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP2C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP2C] unless entity @e[tag=TriviaAECP2C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP2","TriviaAECP2C"],Duration:2147483647,CustomName:"{\"text\":\"Supernatural Mobs\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP2D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP2D] unless entity @e[tag=TriviaAECP2D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP2","TriviaAECP2D"],Duration:2147483647,CustomName:"{\"text\":\"Hunger Games\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP2A] as @e[tag=TriviaMobP2A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP2B] as @e[tag=TriviaMobP2B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP2C] as @e[tag=TriviaMobP2C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP2D] as @e[tag=TriviaMobP2D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP2A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP2A]
execute if entity @e[tag=TriviaMobP2B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP2B]
execute if entity @e[tag=TriviaMobP2C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP2C]
execute if entity @e[tag=TriviaMobP2D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP2D]

execute unless entity @e[tag=TriviaMobP2A] run kill @e[tag=TriviaAECP2A]
execute unless entity @e[tag=TriviaMobP2B] run kill @e[tag=TriviaAECP2B]
execute unless entity @e[tag=TriviaMobP2C] run kill @e[tag=TriviaAECP2C]
execute unless entity @e[tag=TriviaMobP2D] run kill @e[tag=TriviaAECP2D]

# IF WRONG
execute if entity @e[tag=TriviaMobP2B,nbt={HurtTime:10s}] run teleport @a 890 6 981
execute if entity @e[tag=TriviaMobP2C,nbt={HurtTime:10s}] run teleport @a 890 6 951
execute if entity @e[tag=TriviaMobP2D,nbt={HurtTime:10s}] run teleport @a 890 6 921


# IF CORRECT
execute if entity @e[tag=TriviaMobP2A,nbt={HurtTime:10s}] run scoreboard objectives add QP2_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP2_Correct 1

execute if entity @e[scores={QP2_Correct=1}] run setblock 977 64 990 air
execute if entity @e[scores={QP2_Correct=1}] run kill @e[tag=TriviaAECP2]
execute if entity @e[scores={QP2_Correct=1}] run kill @e[tag=PreLoadStandP2]
execute if entity @e[scores={QP2_Correct=1}] as @e[tag=TriviaMobP2] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP2_Correct=1}] as @e[tag=TriviaMobP2] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP2_Correct=20}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP2_Correct=22}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP2_Correct=23}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP2_Correct=24}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP2_Correct=25}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP2_Correct=26}] at @a[tag=P2] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP2_Correct=30}] run playsound entity.firework_rocket.launch master @a 977 64 990 1 1 0

execute if entity @e[scores={QP2_Correct=32}] run title @a[tag=P2] times 1 80 1
execute if entity @e[scores={QP2_Correct=32}] run title @a[tag=P2] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP2_Correct=32}] run title @a[tag=P2] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP2_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP2_Correct=35}] run tellraw @a[tag=P2] ["",{"text":" (✔) CORRECT: \"Fallen Kingdom\" featured on CaptainSparklez' YouTube channel has over 114 million views. You can view it by clicking "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=I-sH53vXP2A"}},{"text":" if you like.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={QP2_Correct=35}] run fill 971 63 1004 971 63 1004 air replace purple_concrete
execute if entity @e[scores={QP2_Correct=35}] run setblock 971 62 1011 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP2_Correct=35}] at @a[tag=P2] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP2_Correct=35..}] run scoreboard objectives remove QP2_Correct



###

# QUESTION PURPLE 3 -> VECHS / SPELLBOUND CAVES ROOM
execute if block 971 62 1011 stone_button[powered=true] run scoreboard objectives add Question_P3 dummy
execute if block 971 62 1011 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P3 1
execute if block 971 62 1011 stone_button[powered=false] run scoreboard objectives remove Question_P3

execute if entity @e[scores={Question_P3=4}] run summon skeleton 974 60.5 1014 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0",Properties:{textures:[{Signature:"gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]},Name:"Vechs1"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP3","TriviaMobP3A"]}
execute if entity @e[scores={Question_P3=9}] run summon skeleton 968 60.5 1014 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0",Properties:{textures:[{Signature:"gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]},Name:"Vechs1"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP3","TriviaMobP3B"]}
execute if entity @e[scores={Question_P3=14}] run summon skeleton 968 60.5 1008 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0",Properties:{textures:[{Signature:"gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]},Name:"Vechs1"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP3","TriviaMobP3C"]}
execute if entity @e[scores={Question_P3=19}] run summon skeleton 974 60.5 1008 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0",Properties:{textures:[{Signature:"gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]},Name:"Vechs1"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP3","TriviaMobP3D"]}

execute as @e[tag=TriviaMobP3,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 60.58 ~ ~ 0

execute if entity @e[tag=TriviaMobP3] run scoreboard players set @e[scores={Question_P3=3}] Question_P3 19
execute if entity @e[scores={Question_P3=19}] run tellraw @a[tag=P3] ["",{"text":" Q: Vechs has made quite a name for himself with his very difficult Complete the Monument maps. But what branding does this series of maps go by?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP3A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP3A] unless entity @e[tag=TriviaAECP3A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP3","TriviaAECP3A"],Duration:2147483647,CustomName:"{\"text\":\"Extreme Survival\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP3B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP3B] unless entity @e[tag=TriviaAECP3B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP3","TriviaAECP3B"],Duration:2147483647,CustomName:"{\"text\":\"Legendary\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP3C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP3C] unless entity @e[tag=TriviaAECP3C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP3","TriviaAECP3C"],Duration:2147483647,CustomName:"{\"text\":\"RageCraft\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP3D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP3D] unless entity @e[tag=TriviaAECP3D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP3","TriviaAECP3D"],Duration:2147483647,CustomName:"{\"text\":\"Super Hostile\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP3A] as @e[tag=TriviaMobP3A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP3B] as @e[tag=TriviaMobP3B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP3C] as @e[tag=TriviaMobP3C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP3D] as @e[tag=TriviaMobP3D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP3A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP3A]
execute if entity @e[tag=TriviaMobP3B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP3B]
execute if entity @e[tag=TriviaMobP3C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP3C]
execute if entity @e[tag=TriviaMobP3D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP3D]

execute unless entity @e[tag=TriviaMobP3A] run kill @e[tag=TriviaAECP3A]
execute unless entity @e[tag=TriviaMobP3B] run kill @e[tag=TriviaAECP3B]
execute unless entity @e[tag=TriviaMobP3C] run kill @e[tag=TriviaAECP3C]
execute unless entity @e[tag=TriviaMobP3D] run kill @e[tag=TriviaAECP3D]


# IF WRONG
execute if entity @e[tag=TriviaMobP3A,nbt={HurtTime:10s}] run teleport @a 860 6 1019
execute if entity @e[tag=TriviaMobP3B,nbt={HurtTime:10s}] run teleport @a 860 6 1051
execute if entity @e[tag=TriviaMobP3C,nbt={HurtTime:10s}] run teleport @a 859 6 1088


# IF CORRECT
execute if entity @e[tag=TriviaMobP3D,nbt={HurtTime:10s}] run scoreboard objectives add QP3_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP3_Correct 1

execute if entity @e[scores={QP3_Correct=1}] run setblock 971 62 1011 air
execute if entity @e[scores={QP3_Correct=1}] run kill @e[tag=TriviaAECP3]
execute if entity @e[scores={QP3_Correct=1}] run kill @e[tag=PreLoadStandP3]
execute if entity @e[scores={QP3_Correct=1}] as @e[tag=TriviaMobP3] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP3_Correct=1}] as @e[tag=TriviaMobP3] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP3_Correct=20}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP3_Correct=22}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP3_Correct=23}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP3_Correct=24}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP3_Correct=25}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP3_Correct=26}] at @a[tag=P3] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP3_Correct=30}] run playsound entity.firework_rocket.launch master @a 971 64 1011 1 1 0

execute if entity @e[scores={QP3_Correct=32}] run title @a[tag=P3] times 1 80 1
execute if entity @e[scores={QP3_Correct=32}] run title @a[tag=P3] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP3_Correct=32}] run title @a[tag=P3] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP3_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP3_Correct=35}] run tellraw @a[tag=P3] ["",{"text":" (✔) CORRECT: Vechs has released quite a number of challenging CTM maps under the name of \"Super Hostile\", which are available for free "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://superhostile.mindcracklp.com/"}},{"text":"."}]
execute if entity @e[scores={QP3_Correct=35}] run fill 964 63 996 964 63 996 air replace purple_concrete
execute if entity @e[scores={QP3_Correct=35}] run setblock 964 64 990 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP3_Correct=35}] at @a[tag=P3] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP3_Correct=35..}] run scoreboard objectives remove QP3_Correct

###

# QUESTION PURPLE 4 -> HYPIXEL / HEROBRINE'S MANSION ROOM
execute if block 964 64 990 stone_button[powered=true] run scoreboard objectives add Question_P4 dummy
execute if block 964 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P4 1
execute if block 964 64 990 stone_button[powered=false] run scoreboard objectives remove Question_P4

execute if entity @e[scores={Question_P4=4}] run summon skeleton 967 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f7c77d99-9f15-4a66-a87d-c4a51ef30d19",Properties:{textures:[{Signature:"kY7DJAf8kMgjenllyFBRjV9HY4DKqfH8aRUX7lHF+YIDykvfxHoP6CO5QePB/55tpVAR9WatbFXXNUse3IuE4bNbLFYLRExvSR4lc1Bo3YyqkftmzHque02sQhkVnN2es7qiNiXG866f5tNpFEfaFOBvCMWwfkQgDBubJ+cegPHeBOrqRWgSfCk1dWHAK21COk6mtTbGIJjPIF+TRF1JEr5eNRoYcYSd/5lEv8ncYU6wP3xPZsF1P2nRfdU577y6kUBuOeKkyRr0cEIuOh3Hqyot/Sqlgb91PCqoXzDoGL88EyeOqZr7mKqzAGpJTWFUKYQDHwA6gwHoPBY/3d0OwhLVyEkyMB8JTFmUSZ/FI11Cq7fsiidbeXoEcD7PF7IWLmWoXz7KfQWDqlddX1GyoifgOB79JbWPLK1bUytA9Op1KIXrgFdloFL5fS1kiWkpVgAp4pTQzLAAEnLUi53kKrxFTxaEen7AwbdRsM7sIyQlYUpiOW48/OfXU1F/atKvZdZhWbvLl127mznJZZiRGbFd5QmChKnlgivznWXPQU+RnW4/YihgIKbmnyoccfBpIFBrpPDd89lTx1gVeRa1uyKD1+mZ+QX+za6FLM5x0Nh//mjVEgVueoSMerxXIrq+rjE5wCHnxze4UWU/6qVd8KWNcch+wxiftcWTMNZ67V8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDA0NTg4MzksInByb2ZpbGVJZCI6ImY3Yzc3ZDk5OWYxNTRhNjZhODdkYzRhNTFlZjMwZDE5IiwicHJvZmlsZU5hbWUiOiJoeXBpeGVsIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8yNDdjMDU4ODQ1ZjNiNmQwMzQ4YWFlNTZiNmFhMWE2MWM0NjlkODRjYmFiYTA0ODE2NDA1MGExZDMzNWQ2ZWEwIn19fQ=="}]},Name:"hypixel"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP4","TriviaMobP4A"]}
execute if entity @e[scores={Question_P4=9}] run summon skeleton 961 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f7c77d99-9f15-4a66-a87d-c4a51ef30d19",Properties:{textures:[{Signature:"kY7DJAf8kMgjenllyFBRjV9HY4DKqfH8aRUX7lHF+YIDykvfxHoP6CO5QePB/55tpVAR9WatbFXXNUse3IuE4bNbLFYLRExvSR4lc1Bo3YyqkftmzHque02sQhkVnN2es7qiNiXG866f5tNpFEfaFOBvCMWwfkQgDBubJ+cegPHeBOrqRWgSfCk1dWHAK21COk6mtTbGIJjPIF+TRF1JEr5eNRoYcYSd/5lEv8ncYU6wP3xPZsF1P2nRfdU577y6kUBuOeKkyRr0cEIuOh3Hqyot/Sqlgb91PCqoXzDoGL88EyeOqZr7mKqzAGpJTWFUKYQDHwA6gwHoPBY/3d0OwhLVyEkyMB8JTFmUSZ/FI11Cq7fsiidbeXoEcD7PF7IWLmWoXz7KfQWDqlddX1GyoifgOB79JbWPLK1bUytA9Op1KIXrgFdloFL5fS1kiWkpVgAp4pTQzLAAEnLUi53kKrxFTxaEen7AwbdRsM7sIyQlYUpiOW48/OfXU1F/atKvZdZhWbvLl127mznJZZiRGbFd5QmChKnlgivznWXPQU+RnW4/YihgIKbmnyoccfBpIFBrpPDd89lTx1gVeRa1uyKD1+mZ+QX+za6FLM5x0Nh//mjVEgVueoSMerxXIrq+rjE5wCHnxze4UWU/6qVd8KWNcch+wxiftcWTMNZ67V8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDA0NTg4MzksInByb2ZpbGVJZCI6ImY3Yzc3ZDk5OWYxNTRhNjZhODdkYzRhNTFlZjMwZDE5IiwicHJvZmlsZU5hbWUiOiJoeXBpeGVsIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8yNDdjMDU4ODQ1ZjNiNmQwMzQ4YWFlNTZiNmFhMWE2MWM0NjlkODRjYmFiYTA0ODE2NDA1MGExZDMzNWQ2ZWEwIn19fQ=="}]},Name:"hypixel"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP4","TriviaMobP4B"]}
execute if entity @e[scores={Question_P4=14}] run summon skeleton 961 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f7c77d99-9f15-4a66-a87d-c4a51ef30d19",Properties:{textures:[{Signature:"kY7DJAf8kMgjenllyFBRjV9HY4DKqfH8aRUX7lHF+YIDykvfxHoP6CO5QePB/55tpVAR9WatbFXXNUse3IuE4bNbLFYLRExvSR4lc1Bo3YyqkftmzHque02sQhkVnN2es7qiNiXG866f5tNpFEfaFOBvCMWwfkQgDBubJ+cegPHeBOrqRWgSfCk1dWHAK21COk6mtTbGIJjPIF+TRF1JEr5eNRoYcYSd/5lEv8ncYU6wP3xPZsF1P2nRfdU577y6kUBuOeKkyRr0cEIuOh3Hqyot/Sqlgb91PCqoXzDoGL88EyeOqZr7mKqzAGpJTWFUKYQDHwA6gwHoPBY/3d0OwhLVyEkyMB8JTFmUSZ/FI11Cq7fsiidbeXoEcD7PF7IWLmWoXz7KfQWDqlddX1GyoifgOB79JbWPLK1bUytA9Op1KIXrgFdloFL5fS1kiWkpVgAp4pTQzLAAEnLUi53kKrxFTxaEen7AwbdRsM7sIyQlYUpiOW48/OfXU1F/atKvZdZhWbvLl127mznJZZiRGbFd5QmChKnlgivznWXPQU+RnW4/YihgIKbmnyoccfBpIFBrpPDd89lTx1gVeRa1uyKD1+mZ+QX+za6FLM5x0Nh//mjVEgVueoSMerxXIrq+rjE5wCHnxze4UWU/6qVd8KWNcch+wxiftcWTMNZ67V8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDA0NTg4MzksInByb2ZpbGVJZCI6ImY3Yzc3ZDk5OWYxNTRhNjZhODdkYzRhNTFlZjMwZDE5IiwicHJvZmlsZU5hbWUiOiJoeXBpeGVsIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8yNDdjMDU4ODQ1ZjNiNmQwMzQ4YWFlNTZiNmFhMWE2MWM0NjlkODRjYmFiYTA0ODE2NDA1MGExZDMzNWQ2ZWEwIn19fQ=="}]},Name:"hypixel"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP4","TriviaMobP4C"]}
execute if entity @e[scores={Question_P4=19}] run summon skeleton 967 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f7c77d99-9f15-4a66-a87d-c4a51ef30d19",Properties:{textures:[{Signature:"kY7DJAf8kMgjenllyFBRjV9HY4DKqfH8aRUX7lHF+YIDykvfxHoP6CO5QePB/55tpVAR9WatbFXXNUse3IuE4bNbLFYLRExvSR4lc1Bo3YyqkftmzHque02sQhkVnN2es7qiNiXG866f5tNpFEfaFOBvCMWwfkQgDBubJ+cegPHeBOrqRWgSfCk1dWHAK21COk6mtTbGIJjPIF+TRF1JEr5eNRoYcYSd/5lEv8ncYU6wP3xPZsF1P2nRfdU577y6kUBuOeKkyRr0cEIuOh3Hqyot/Sqlgb91PCqoXzDoGL88EyeOqZr7mKqzAGpJTWFUKYQDHwA6gwHoPBY/3d0OwhLVyEkyMB8JTFmUSZ/FI11Cq7fsiidbeXoEcD7PF7IWLmWoXz7KfQWDqlddX1GyoifgOB79JbWPLK1bUytA9Op1KIXrgFdloFL5fS1kiWkpVgAp4pTQzLAAEnLUi53kKrxFTxaEen7AwbdRsM7sIyQlYUpiOW48/OfXU1F/atKvZdZhWbvLl127mznJZZiRGbFd5QmChKnlgivznWXPQU+RnW4/YihgIKbmnyoccfBpIFBrpPDd89lTx1gVeRa1uyKD1+mZ+QX+za6FLM5x0Nh//mjVEgVueoSMerxXIrq+rjE5wCHnxze4UWU/6qVd8KWNcch+wxiftcWTMNZ67V8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDA0NTg4MzksInByb2ZpbGVJZCI6ImY3Yzc3ZDk5OWYxNTRhNjZhODdkYzRhNTFlZjMwZDE5IiwicHJvZmlsZU5hbWUiOiJoeXBpeGVsIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8yNDdjMDU4ODQ1ZjNiNmQwMzQ4YWFlNTZiNmFhMWE2MWM0NjlkODRjYmFiYTA0ODE2NDA1MGExZDMzNWQ2ZWEwIn19fQ=="}]},Name:"hypixel"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP4","TriviaMobP4D"]}

execute if entity @e[tag=TriviaMobP4] run scoreboard players set @e[scores={Question_P4=3}] Question_P4 19
execute if entity @e[scores={Question_P4=19}] run tellraw @a[tag=P4] ["",{"text":" Q: From maps to servers, Hypixel has mastered many of the creative aspects of the game. Which of these is not a Hypixel project?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP4A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP4A] unless entity @e[tag=TriviaAECP4A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP4","TriviaAECP4A"],Duration:2147483647,CustomName:"{\"text\":\"Creeper Dungeon\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP4B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP4B] unless entity @e[tag=TriviaAECP4B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP4","TriviaAECP4B"],Duration:2147483647,CustomName:"{\"text\":\"Vampire Survival\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP4C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP4C] unless entity @e[tag=TriviaAECP4C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP4","TriviaAECP4C"],Duration:2147483647,CustomName:"{\"text\":\"Wither's Challenge\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP4D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP4D] unless entity @e[tag=TriviaAECP4D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP4","TriviaAECP4D"],Duration:2147483647,CustomName:"{\"text\":\"Zombie Siege\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP4A] as @e[tag=TriviaMobP4A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP4B] as @e[tag=TriviaMobP4B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP4C] as @e[tag=TriviaMobP4C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP4D] as @e[tag=TriviaMobP4D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP4A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP4A]
execute if entity @e[tag=TriviaMobP4B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP4B]
execute if entity @e[tag=TriviaMobP4C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP4C]
execute if entity @e[tag=TriviaMobP4D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP4D]

execute unless entity @e[tag=TriviaMobP4A] run kill @e[tag=TriviaAECP4A]
execute unless entity @e[tag=TriviaMobP4B] run kill @e[tag=TriviaAECP4B]
execute unless entity @e[tag=TriviaMobP4C] run kill @e[tag=TriviaAECP4C]
execute unless entity @e[tag=TriviaMobP4D] run kill @e[tag=TriviaAECP4D]

# IF WRONG
execute if entity @e[tag=TriviaMobP4A,nbt={HurtTime:10s}] run teleport @a 860 6 981
execute if entity @e[tag=TriviaMobP4B,nbt={HurtTime:10s}] run teleport @a 860 6 951
execute if entity @e[tag=TriviaMobP4C,nbt={HurtTime:10s}] run teleport @a 860 6 916


# IF CORRECT
execute if entity @e[tag=TriviaMobP4D,nbt={HurtTime:10s}] run scoreboard objectives add QP4_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP4_Correct 1

execute if entity @e[scores={QP4_Correct=1}] run setblock 964 64 990 air
execute if entity @e[scores={QP4_Correct=1}] run kill @e[tag=TriviaAECP4]
execute if entity @e[scores={QP4_Correct=1}] run kill @e[tag=PreLoadStandP4]
execute if entity @e[scores={QP4_Correct=1}] as @e[tag=TriviaMobP4] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP4_Correct=1}] as @e[tag=TriviaMobP4] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP4_Correct=20}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP4_Correct=22}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP4_Correct=23}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP4_Correct=24}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP4_Correct=25}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP4_Correct=26}] at @a[tag=P4] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP4_Correct=30}] run playsound entity.firework_rocket.launch master @a 964 64 990 1 1 0

execute if entity @e[scores={QP4_Correct=32}] run title @a[tag=P4] times 1 80 1
execute if entity @e[scores={QP4_Correct=32}] run title @a[tag=P4] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP4_Correct=32}] run title @a[tag=P4] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP4_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP4_Correct=35}] run tellraw @a[tag=P4] ["",{"text":" (✔) CORRECT: \"Zombie Siege\" is a map by the talented map maker pioneer known as Disco. You can watch the trailer for this classic Minecraft mini game "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=I6FpNthcTsk"}},{"text":"."}]
execute if entity @e[scores={QP4_Correct=35}] run fill 958 63 1004 958 63 1004 air replace purple_concrete
execute if entity @e[scores={QP4_Correct=35}] run setblock 958 65 1010 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP4_Correct=35}] at @a[tag=P4] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP4_Correct=35..}] run scoreboard objectives remove QP4_Correct

execute if entity @e[scores={QP4_Correct=1}] run kill @e[tag=Hanz]
execute if entity @e[scores={QP4_Correct=1}] run kill @e[tag=Franz]
execute if entity @e[scores={QP4_Correct=1}] run summon villager 959 65 1020 {Profession:1,Silent:true,NoAI:true,Rotation:[180f,0f],Tags:["Hanz"]}
execute if entity @e[scores={QP4_Correct=1}] run summon villager 961 65 1020 {Profession:1,Silent:true,NoAI:true,Rotation:[165f,15f],Tags:["Franz"]}



###

# QUESTION PURPLE 5 -> RESOURCE PACKS / PROJECT TRANSCENDENCE ROOM
execute if block 958 65 1010 stone_button[powered=true] run scoreboard objectives add Question_P5 dummy
execute if block 958 65 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P5 1
execute if block 958 65 1010 stone_button[powered=false] run scoreboard objectives remove Question_P5

execute if entity @e[scores={Question_P5=4}] run summon skeleton 961 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"527c122d-0bca-4e8c-8e24-396c79356b08",Properties:{textures:[{Signature:"yA80VSW89XGS7Mx33VpAjAV1WU1Pt1CA0+i+O30ylo+A7UWg0yiAtCYcqtyaNtGSolG8/YyrfA9gRS9cCJWkq0iYxVK+smLIYvUnaxLaqYlg6leo3CcSswMksKOhPZPMD+e2igdlu9rOVA6eD6V0XE17I6eS7iM/KTu7oHpPbZq1SOJsNQ8z84M82WVHVjpR8vqQQYGs0jvVRhSQ7e2kjCJqcJQsMNGpXt42r2SRc+cAyNjD/IQPxZDa7KDEhAHou1AWX/86Gcu4SZjO6yh8PzdQ/Fzs8gqnmTKpAQA1wDEXo0woDe0B93ZRVNJtlEQPug9kkamxFbg+Cov7nkMMdec7Qwu267pxnciyjyq+Wj0wLQ3V7zwBJwO5nvBwa02CckaRMe93tQg51Zuu6RK/kMo4iMp5G5rxkrno/smTBFRbrPjX7sG9w7KfLA1wxmd3Z6/XvjRZi2OzFTJDpdbOxfOCs5NbArRQXZmm1czBO0wXINmQ0JtQXVPIxCpC0SpNWQRltjgeC3T/6DxjsVD+r5uc5JWuNqEVj7bQPG6FfD5/H5TQsy1dSlei4oicwoZ1qbr8BziXgFKPcztfQGvKg7Qnz00u90KklcPymuU7ah3OOEcxia+ITKhS+7hUifkyHH4Rem0K9KxDn+gtbl7RQXs0yStX2osyeRgNRYSnbBI=",Value:"eyJ0aW1lc3RhbXAiOjE1MzgwOTUwNTA3MzcsInByb2ZpbGVJZCI6IjUyN2MxMjJkMGJjYTRlOGM4ZTI0Mzk2Yzc5MzU2YjA4IiwicHJvZmlsZU5hbWUiOiJHbGltbWFyIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS82ZTI2OGJiYmU1YmIyYzgwNjYyYzg2YzZlZGQ2YjM5YWM0NTAyNzU1MjMwYjE2M2JiNzJmNWViNjdhN2M4YTEwIn19fQ=="}]},Name:"Glimmar"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP5","TriviaMobP5A"]}
execute if entity @e[scores={Question_P5=9}] run summon skeleton 955 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"c08f5f25-3d39-4c7a-b330-4fd23b9ccedb",Properties:{textures:[{Signature:"qvcwr7JRsiMExP3+e+WNdqUceQ92tLiGWtSze68N7tUDghZ9r8fZoDruyvRj6e796kRwe+4SuGJpNtPffgsNuuwwN5rqq5a23rqrjblwVDC4zevYmIkoRwfsjt9wIFiqXUY1gan450KIgVqQkRzVIM8rG13ultq/FrQ5b/Sscyl5xbkqnFvP1gbt6zxtnnDYGqoIM6VrKib77lsC8HjhXKAYYngkTOx1CuPc+p1m58Dsze4dFt9aTwf+sZGow65zlZBSAyire/5jv6nDUJmCnRuOyzN4nljoBgxuxkvVi4qoxELNuFkBiNPVJ+q+f+qZj6zOUrvgAgObq9JyGnaJaOZ0OtU5EPDUWWbONfdmyFuRGGkDy50OscXLzAPKz4NuDjT5vvKnZc4w+eXkPlJYwAi4A870ieCnfHsm53oMThkqh5HpQQuz6wLk4xHpCK7gfiaGlzohr94qnDK6iI6yHbGrHJ74nFXBCTZ8593LfwbO81gifSBKmKL1R6U53uKZhDhEg4rLHrxlE3dz2tSRGnwlkUymOP/ejdN+JiatVhQ/gRCyvoOotzUykRwV+2Cxd1w1Bbl67nTmMtd762E9pcwEAyAGs5SbM/ufI5i2+l4u6grqYQbSKodBIaEESK30CEJoRc0eREs3pFk/aamqDeT7LhoeP89eNKpzG9Xcq8g=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDA1NTI5NzQsInByb2ZpbGVJZCI6ImMwOGY1ZjI1M2QzOTRjN2FiMzMwNGZkMjNiOWNjZWRiIiwicHJvZmlsZU5hbWUiOiJLYWhyIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9iYTdjMWZiZmQ5YWI5OTFkMWI5ZjFlOGU3YzFjYWQ3OWEzODczZjFiNGNlMWEzMjBjYTdlZmMyYTBhYzE0YTUifX19"}]},Name:"Kahr"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP5","TriviaMobP5B"]}
execute if entity @e[scores={Question_P5=14}] run summon skeleton 955 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1949e9b1-56e0-4adb-bcf1-a9e3cd09f67e",Properties:{textures:[{Signature:"ZDi1JrdbjCyArvulRJ5VVtuEU5QJjOmnUCnnYo0iEmEE9Fm+OlFn3ATJ9GLtZhg4Vz4jRuruy/4OuDgM9feL2ogMvzsmXZie1DhxojxSuhTSElH50sVHudpwvnv2YrugHDiXHOY+Br/AxZ/L1iXrA/zjEAHbzJuwDAB/wk2lfukLgcddFIDpry+dx35M9byyQKCayuQHl0RFU8mhYhBBuAQzpg2Ion7ea3DvdmJWn18yt4wJ9Bognw9VZ6sykzcs1AUAwo04Y/+f7tK1Uqr3L0HUJhYQ1l/d3lu3+84yjF7KN9G/SgvuOfowj5MtWJahPTR+fJMS470trkGmcdqpadAhWHzp07QYJLhxK9ICu5prvtWBVuVBXqAc6gZsL2F+l+KiZ19GJ7y55VKBK/37J6urxkdHrnKhMmStyOice22M7f89YmpXgy85Nv9NTzwIFCy6fc98IrH3Y0uB5wTeiXNhEhc8ALGJNyhTWfN9I2G1e/pWTckr5PDEE7Mg6WN+2Tl76lQCSi9RDVmRGotyNZ0EZMEZb+mlQBXHZm21XxSlqd+ol2oHL3TYcAh9zzWTpvhNw+nwuGP5vl7CZzl4zhPfpO48flXFGrea7WfLbEO945N28z8ZdK4iSEDFPbEYYK+ptD+ojEGA0xmtElp6YA9LuepVr+1i0XSPLBG52To=",Value:"eyJ0aW1lc3RhbXAiOjE1MzgxMzIzNzQzMTIsInByb2ZpbGVJZCI6IjE5NDllOWIxNTZlMDRhZGJiY2YxYTllM2NkMDlmNjdlIiwicHJvZmlsZU5hbWUiOiJNaXNhIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kOTU3OGYxMGJhZWExYWU3ZDFiMjA1YjRjMThmMjJlYWQyMjdlNTgyNzFmMzg1NzVjOGNhODY5YzNmNWRlMWNlIiwibWV0YWRhdGEiOnsibW9kZWwiOiJzbGltIn19fX0="}]},Name:"Misa"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP5","TriviaMobP5C"]}
execute if entity @e[scores={Question_P5=19}] run summon skeleton 961 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"2afc86f0-fbc6-4e2a-9f44-e34526213c8a",Properties:{textures:[{Signature:"gfvLDds6DYsvJLzZmTF+ZRPQdUAmInq6lvWhnSoAzbNZnO9ITfnt6sSOzvy9oxB4pvHKwTLFOGjfZ6Q8zQAAbGx2rDNkp0dAmacNdTQtoNV+OG42Ho2QZlj+iyh/VzHF3ZqxJa77MBo0DxAuH6/xazDsO57eu2d7QO8lmrUWic0yiPmFnS3UNQB0W47pWwH36PEmwkL7967GJNG1DBFwUsgrZrv/xglZoeyg39B3BcO5zvZ5ffbSeF9glwSMUXsSaRmnvZWNRJXlIK69O76tsuYn/Z0Us6ii2XYPpfpsfvpXEVHnLuFtR9ai8mICVTwC17vjVpgp6BoBfSXgx2KyxwI/EsssVx1TGU19WpKaHleVhx6Ht9mTIkgqCLnRcuvsTvdUlhOkZxgdWXOzTIimkqQ4gDsvsWKzxjFDN012+ENLkyL/3f0tH83oy+UJS/BQCEkrxbWYZwLNazK6FOfIf2q80qK/76poBRuykfJ2zAi+xTBASq3KVwZxb5VSsVVsOJqvEU1CHWtE+ibUUkSJ1rCGPxLIdIz2fP5de4+I8fp3dcQK1OraGudY1eoumaS8Ait+qDW0piM0MBmBv9xi1JJj9zM4438Bue2lvNvb6gwMxBtLjCNORTcqlFtcLc21HMRBCNASFum1w9OBlWHa6we2iQbaLkfwSypVUL04ciM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDU0ODc0ODQsInByb2ZpbGVJZCI6IjJhZmM4NmYwZmJjNjRlMmE5ZjQ0ZTM0NTI2MjEzYzhhIiwicHJvZmlsZU5hbWUiOiJWYXR0aWMiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzU0NjEyZWE4ODYzMGFhYWNjOTA3NjY3MjYzYWE1NzAzNjQ1ODRlZmMwYTJhNGJhNzlhMDY2NWRkZjEwZjc0YTMifX19"}]},Name:"Vattic"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP5","TriviaMobP5D"]}

execute if entity @e[tag=TriviaMobP5] run scoreboard players set @e[scores={Question_P5=3}] Question_P5 19
execute if entity @e[scores={Question_P5=19}] run tellraw @a[tag=P5] ["",{"text":" Q: One of the most well known Resource Packs is Faithful 32x32, a higher resolution version of the classic default Resource Pack. Who originally created it?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP5A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP5A] unless entity @e[tag=TriviaAECP5A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP5","TriviaAECP5A"],Duration:2147483647,CustomName:"{\"text\":\"Glimmar\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP5B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP5B] unless entity @e[tag=TriviaAECP5B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP5","TriviaAECP5B"],Duration:2147483647,CustomName:"{\"text\":\"Kahr\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP5C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP5C] unless entity @e[tag=TriviaAECP5C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP5","TriviaAECP5C"],Duration:2147483647,CustomName:"{\"text\":\"Misa\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP5D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP5D] unless entity @e[tag=TriviaAECP5D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP5","TriviaAECP5D"],Duration:2147483647,CustomName:"{\"text\":\"Vattic\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP5A] as @e[tag=TriviaMobP5A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP5B] as @e[tag=TriviaMobP5B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP5C] as @e[tag=TriviaMobP5C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP5D] as @e[tag=TriviaMobP5D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP5A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP5A]
execute if entity @e[tag=TriviaMobP5B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP5B]
execute if entity @e[tag=TriviaMobP5C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP5C]
execute if entity @e[tag=TriviaMobP5D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP5D]

execute unless entity @e[tag=TriviaMobP5A] run kill @e[tag=TriviaAECP5A]
execute unless entity @e[tag=TriviaMobP5B] run kill @e[tag=TriviaAECP5B]
execute unless entity @e[tag=TriviaMobP5C] run kill @e[tag=TriviaAECP5C]
execute unless entity @e[tag=TriviaMobP5D] run kill @e[tag=TriviaAECP5D]

# IF WRONG
execute if entity @e[tag=TriviaMobP5A,nbt={HurtTime:10s}] run teleport @a 830 6 1019
execute if entity @e[tag=TriviaMobP5B,nbt={HurtTime:10s}] run teleport @a 830 6 1049
execute if entity @e[tag=TriviaMobP5C,nbt={HurtTime:10s}] run teleport @a 830 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobP5D,nbt={HurtTime:10s}] run scoreboard objectives add QP5_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP5_Correct 1

execute if entity @e[scores={QP5_Correct=1}] run setblock 958 65 1010 air
execute if entity @e[scores={QP5_Correct=1}] run kill @e[tag=TriviaAECP5]
execute if entity @e[scores={QP5_Correct=1}] run kill @e[tag=PreLoadStandP5]
execute if entity @e[scores={QP5_Correct=1}] as @e[tag=TriviaMobP5] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP5_Correct=1}] as @e[tag=TriviaMobP5] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP5_Correct=20}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP5_Correct=22}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP5_Correct=23}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP5_Correct=24}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP5_Correct=25}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP5_Correct=26}] at @a[tag=P5] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP5_Correct=30}] run playsound entity.firework_rocket.launch master @a 958 64 1010 1 1 0

execute if entity @e[scores={QP5_Correct=32}] run title @a[tag=P5] times 1 80 1
execute if entity @e[scores={QP5_Correct=32}] run title @a[tag=P5] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP5_Correct=32}] run title @a[tag=P5] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP5_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP5_Correct=35}] run tellraw @a[tag=P5] ["",{"text":" (✔) CORRECT: \"Faithful 32x32\" originally created by Vattic (later maintained by members of the community) is still available "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/resource-packs/1223254-faithful-32x32-pack-update-red-cat-clay-1-8"}},{"text":" but is no longer up to date."}]
execute if entity @e[scores={QP5_Correct=35}] run fill 951 63 996 951 63 996 air replace purple_concrete
execute if entity @e[scores={QP5_Correct=35}] run setblock 951 64 990 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP5_Correct=35}] at @a[tag=P5] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP5_Correct=35..}] run scoreboard objectives remove QP5_Correct

execute if entity @e[scores={QP5_Correct=1}] run kill @e[tag=LampCart]
execute if entity @e[scores={QP5_Correct=1}] run summon minecart 947 70 993 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,0.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:redstone_lamp",Properties:{lit:"true"}},DisplayOffset:-75,DisplayData:0,Tags:["LampCart"]}
execute if entity @e[scores={QP5_Correct=1}] run summon minecart 955 70 993 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,0.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:redstone_lamp",Properties:{lit:"true"}},DisplayOffset:-75,DisplayData:0,Tags:["LampCart"]}
execute if entity @e[scores={QP5_Correct=1}] run summon minecart 947 70 986 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,0.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:redstone_lamp",Properties:{lit:"true"}},DisplayOffset:-75,DisplayData:0,Tags:["LampCart"]}
execute if entity @e[scores={QP5_Correct=1}] run summon minecart 955 70 986 {NoGravity:true,Motion:[0.0d,0.0d,0.0d],Rotation:[90.0f,0.0f],CustomDisplayTile:1,DisplayState:{Name:"minecraft:redstone_lamp",Properties:{lit:"true"}},DisplayOffset:-75,DisplayData:0,Tags:["LampCart"]}

###

# QUESTION PURPLE 6 -> DROPPER 2 / DROPPER 2 ROOM
execute if block 951 64 990 stone_button[powered=true] run scoreboard objectives add Question_P6 dummy
execute if block 951 64 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P6 1
execute if block 951 64 990 stone_button[powered=false] run scoreboard objectives remove Question_P6

execute if entity @e[scores={Question_P6=4}] run summon skeleton 954 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5c26d143-f4a8-440e-beae-cc915f5e067b",Properties:{textures:[{Signature:"q2CoDmzDufElUNL1K906KKtw4nD+clA8/Clt4ifD3pX8qPl3bc38eXeknA40SaGOa4Des+MnZsjSTxsfPEGy/RL0YKhqcFo1dhy3SRWbBjvYXv0751/T/g3AdWFwnT/mD8f0UnN3h2PfYy2UJb3tK0ZvUkfJfQpCb/zsaBOF3XO7iRsDZbU8RuOiVO/tIMTipxsPVt8D0YifL6hgzVq95O6fmiyHR6BgDBWTv0A+cxGVPcpfpnTvzcroL5NYbzWsi//HYWwcuckw/6ybSG55S+RiuZ5BS7R+j4duOySE2zmu41xzOx35/aYZJbGxA4K+SFSdvXRkbk61ITMR/EAEKV1kJTKFKWu64SovTdhManQeZmr9mBpDZvne9+vxrsY6StnnlAJITczlrqy8/mk7DvygvN7k2UmvGEVdBB5lyGChIDJ2rV5mGiDVvdVbWflr3i+tEXwV7JwsQ0cemfi2V037mfhf774e5gCP4PLm07TEQa3bOKAL7+Yir1/pduuuvf4/bZPay8jZfqrM8nbiunbKWxJTrFAdqSK9Wxhi0iPOxG1m+BLrZHkZWfRGGNYsePi1TkT0OTKZO/94mHZ/gT3P58Up9SeiQhHauwlvm92WH39n2GFvX2t+TDVw+Lse19+BuHkPOqzgJLT5+dfnBZKQDxvK3P8l7j5wrOwV8b8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEwMjA1NjksInByb2ZpbGVJZCI6IjVjMjZkMTQzZjRhODQ0MGViZWFlY2M5MTVmNWUwNjdiIiwicHJvZmlsZU5hbWUiOiJCaWdyZV8iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmNTc5YjVjZjIwZWY4NGIxNDRmMjI1ODBhOTg5ZGU4ZDUzOTM5MWU5YzBmYWNkNjUxYWM3NWJmMWIyN2JmZTcifX19"}]},Name:"Bigre_"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP6","TriviaMobP6A"]}
execute if entity @e[scores={Question_P6=9}] run summon skeleton 948 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5c26d143-f4a8-440e-beae-cc915f5e067b",Properties:{textures:[{Signature:"q2CoDmzDufElUNL1K906KKtw4nD+clA8/Clt4ifD3pX8qPl3bc38eXeknA40SaGOa4Des+MnZsjSTxsfPEGy/RL0YKhqcFo1dhy3SRWbBjvYXv0751/T/g3AdWFwnT/mD8f0UnN3h2PfYy2UJb3tK0ZvUkfJfQpCb/zsaBOF3XO7iRsDZbU8RuOiVO/tIMTipxsPVt8D0YifL6hgzVq95O6fmiyHR6BgDBWTv0A+cxGVPcpfpnTvzcroL5NYbzWsi//HYWwcuckw/6ybSG55S+RiuZ5BS7R+j4duOySE2zmu41xzOx35/aYZJbGxA4K+SFSdvXRkbk61ITMR/EAEKV1kJTKFKWu64SovTdhManQeZmr9mBpDZvne9+vxrsY6StnnlAJITczlrqy8/mk7DvygvN7k2UmvGEVdBB5lyGChIDJ2rV5mGiDVvdVbWflr3i+tEXwV7JwsQ0cemfi2V037mfhf774e5gCP4PLm07TEQa3bOKAL7+Yir1/pduuuvf4/bZPay8jZfqrM8nbiunbKWxJTrFAdqSK9Wxhi0iPOxG1m+BLrZHkZWfRGGNYsePi1TkT0OTKZO/94mHZ/gT3P58Up9SeiQhHauwlvm92WH39n2GFvX2t+TDVw+Lse19+BuHkPOqzgJLT5+dfnBZKQDxvK3P8l7j5wrOwV8b8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEwMjA1NjksInByb2ZpbGVJZCI6IjVjMjZkMTQzZjRhODQ0MGViZWFlY2M5MTVmNWUwNjdiIiwicHJvZmlsZU5hbWUiOiJCaWdyZV8iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmNTc5YjVjZjIwZWY4NGIxNDRmMjI1ODBhOTg5ZGU4ZDUzOTM5MWU5YzBmYWNkNjUxYWM3NWJmMWIyN2JmZTcifX19"}]},Name:"Bigre_"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP6","TriviaMobP6B"]}
execute if entity @e[scores={Question_P6=14}] run summon skeleton 948 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5c26d143-f4a8-440e-beae-cc915f5e067b",Properties:{textures:[{Signature:"q2CoDmzDufElUNL1K906KKtw4nD+clA8/Clt4ifD3pX8qPl3bc38eXeknA40SaGOa4Des+MnZsjSTxsfPEGy/RL0YKhqcFo1dhy3SRWbBjvYXv0751/T/g3AdWFwnT/mD8f0UnN3h2PfYy2UJb3tK0ZvUkfJfQpCb/zsaBOF3XO7iRsDZbU8RuOiVO/tIMTipxsPVt8D0YifL6hgzVq95O6fmiyHR6BgDBWTv0A+cxGVPcpfpnTvzcroL5NYbzWsi//HYWwcuckw/6ybSG55S+RiuZ5BS7R+j4duOySE2zmu41xzOx35/aYZJbGxA4K+SFSdvXRkbk61ITMR/EAEKV1kJTKFKWu64SovTdhManQeZmr9mBpDZvne9+vxrsY6StnnlAJITczlrqy8/mk7DvygvN7k2UmvGEVdBB5lyGChIDJ2rV5mGiDVvdVbWflr3i+tEXwV7JwsQ0cemfi2V037mfhf774e5gCP4PLm07TEQa3bOKAL7+Yir1/pduuuvf4/bZPay8jZfqrM8nbiunbKWxJTrFAdqSK9Wxhi0iPOxG1m+BLrZHkZWfRGGNYsePi1TkT0OTKZO/94mHZ/gT3P58Up9SeiQhHauwlvm92WH39n2GFvX2t+TDVw+Lse19+BuHkPOqzgJLT5+dfnBZKQDxvK3P8l7j5wrOwV8b8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEwMjA1NjksInByb2ZpbGVJZCI6IjVjMjZkMTQzZjRhODQ0MGViZWFlY2M5MTVmNWUwNjdiIiwicHJvZmlsZU5hbWUiOiJCaWdyZV8iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmNTc5YjVjZjIwZWY4NGIxNDRmMjI1ODBhOTg5ZGU4ZDUzOTM5MWU5YzBmYWNkNjUxYWM3NWJmMWIyN2JmZTcifX19"}]},Name:"Bigre_"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP6","TriviaMobP6C"]}
execute if entity @e[scores={Question_P6=19}] run summon skeleton 954 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"5c26d143-f4a8-440e-beae-cc915f5e067b",Properties:{textures:[{Signature:"q2CoDmzDufElUNL1K906KKtw4nD+clA8/Clt4ifD3pX8qPl3bc38eXeknA40SaGOa4Des+MnZsjSTxsfPEGy/RL0YKhqcFo1dhy3SRWbBjvYXv0751/T/g3AdWFwnT/mD8f0UnN3h2PfYy2UJb3tK0ZvUkfJfQpCb/zsaBOF3XO7iRsDZbU8RuOiVO/tIMTipxsPVt8D0YifL6hgzVq95O6fmiyHR6BgDBWTv0A+cxGVPcpfpnTvzcroL5NYbzWsi//HYWwcuckw/6ybSG55S+RiuZ5BS7R+j4duOySE2zmu41xzOx35/aYZJbGxA4K+SFSdvXRkbk61ITMR/EAEKV1kJTKFKWu64SovTdhManQeZmr9mBpDZvne9+vxrsY6StnnlAJITczlrqy8/mk7DvygvN7k2UmvGEVdBB5lyGChIDJ2rV5mGiDVvdVbWflr3i+tEXwV7JwsQ0cemfi2V037mfhf774e5gCP4PLm07TEQa3bOKAL7+Yir1/pduuuvf4/bZPay8jZfqrM8nbiunbKWxJTrFAdqSK9Wxhi0iPOxG1m+BLrZHkZWfRGGNYsePi1TkT0OTKZO/94mHZ/gT3P58Up9SeiQhHauwlvm92WH39n2GFvX2t+TDVw+Lse19+BuHkPOqzgJLT5+dfnBZKQDxvK3P8l7j5wrOwV8b8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEwMjA1NjksInByb2ZpbGVJZCI6IjVjMjZkMTQzZjRhODQ0MGViZWFlY2M5MTVmNWUwNjdiIiwicHJvZmlsZU5hbWUiOiJCaWdyZV8iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmNTc5YjVjZjIwZWY4NGIxNDRmMjI1ODBhOTg5ZGU4ZDUzOTM5MWU5YzBmYWNkNjUxYWM3NWJmMWIyN2JmZTcifX19"}]},Name:"Bigre_"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP6","TriviaMobP6D"]}

execute if entity @e[tag=TriviaMobP6] run scoreboard players set @e[scores={Question_P6=3}] Question_P6 19
execute if entity @e[scores={Question_P6=19}] run tellraw @a[tag=P6] ["",{"text":" Q: In 2011, Bigre released a new genre of Minecraft gameplay with his massively popular Dropper map. A couple years later, Bigre released a sequel. What is the subtitle of the second Dropper map?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP6A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP6A] unless entity @e[tag=TriviaAECP6A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP6","TriviaAECP6A"],Duration:2147483647,CustomName:"{\"text\":\"Dimension Jumper\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP6B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP6B] unless entity @e[tag=TriviaAECP6B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP6","TriviaAECP6B"],Duration:2147483647,CustomName:"{\"text\":\"Newton VS Darwin\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP6C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP6C] unless entity @e[tag=TriviaAECP6C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP6","TriviaAECP6C"],Duration:2147483647,CustomName:"{\"text\":\"Sticks & Stones\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP6D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP6D] unless entity @e[tag=TriviaAECP6D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP6","TriviaAECP6D"],Duration:2147483647,CustomName:"{\"text\":\"There is no subtitle\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP6A] as @e[tag=TriviaMobP6A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP6B] as @e[tag=TriviaMobP6B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP6C] as @e[tag=TriviaMobP6C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP6D] as @e[tag=TriviaMobP6D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP6A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP6A]
execute if entity @e[tag=TriviaMobP6B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP6B]
execute if entity @e[tag=TriviaMobP6C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP6C]
execute if entity @e[tag=TriviaMobP6D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP6D]

execute unless entity @e[tag=TriviaMobP6A] run kill @e[tag=TriviaAECP6A]
execute unless entity @e[tag=TriviaMobP6B] run kill @e[tag=TriviaAECP6B]
execute unless entity @e[tag=TriviaMobP6C] run kill @e[tag=TriviaAECP6C]
execute unless entity @e[tag=TriviaMobP6D] run kill @e[tag=TriviaAECP6D]

# IF WRONG
execute if entity @e[tag=TriviaMobP6A,nbt={HurtTime:10s}] run teleport @a 830 6 981
execute if entity @e[tag=TriviaMobP6C,nbt={HurtTime:10s}] run teleport @a 830 6 951
execute if entity @e[tag=TriviaMobP6D,nbt={HurtTime:10s}] run teleport @a 830 6 921


# IF CORRECT
execute if entity @e[tag=TriviaMobP6B,nbt={HurtTime:10s}] run scoreboard objectives add QP6_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP6_Correct 1

execute if entity @e[scores={QP6_Correct=1}] run setblock 951 64 990 air
execute if entity @e[scores={QP6_Correct=1}] run kill @e[tag=TriviaAECP6]
execute if entity @e[scores={QP6_Correct=1}] run kill @e[tag=PreLoadStandP6]
execute if entity @e[scores={QP6_Correct=1}] as @e[tag=TriviaMobP6] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP6_Correct=1}] as @e[tag=TriviaMobP6] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP6_Correct=20}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP6_Correct=22}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP6_Correct=23}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP6_Correct=24}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP6_Correct=25}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP6_Correct=26}] at @a[tag=P6] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP6_Correct=30}] run playsound entity.firework_rocket.launch master @a 951 64 990 1 1 0

execute if entity @e[scores={QP6_Correct=32}] run title @a[tag=P6] times 1 80 1
execute if entity @e[scores={QP6_Correct=32}] run title @a[tag=P6] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP6_Correct=32}] run title @a[tag=P6] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP6_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP6_Correct=35}] run tellraw @a[tag=P6] ["",{"text":" (✔) CORRECT: \"The Dropper 2; Newton VS Darwin\" by Bigre, is an amazing looking and fun Dropper map created for Minecraft 1.5 and can be downloaded "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/project/the-dropper-2-newton-vs-darwin"}},{"text":" for free."}]
execute if entity @e[scores={QP6_Correct=35}] run fill 945 63 1004 945 63 1004 air replace purple_concrete
execute if entity @e[scores={QP6_Correct=35}] run setblock 945 64 1010 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP6_Correct=35}] at @a[tag=P6] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP6_Correct=35..}] run scoreboard objectives remove QP6_Correct

execute if entity @e[scores={QP6_Correct=1}] run kill @e[tag=DanTDMLab]
execute if entity @e[scores={QP6_Correct=1}] run summon villager 946.0 64 1021.0 {NoAI:true,CustomName:"{\"text\":\"Dr Trayaurus\",\"color\":\"white\"}",CustomNameVisible:true,Invulnerable:true,Profession:1,Rotation:[135f,5f],Tags:["DanTDMLab"]}
execute if entity @e[scores={QP6_Correct=1}] run summon armor_stand 944.0 64 1021.0 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[203.0f,0.0f,315.0f],LeftLeg:[0.0f,0.0f,338.0f],LeftArm:[341.0f,0.0f,216.0f],RightLeg:[0.0f,0.0f,20.0f]},Rotation:[260.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:5317376}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13674}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"77cc85ae-388a-46ec-a535-9e2ffef71b29",Properties:{textures:[{Signature:"qF7vKhf/IhlN1NkANaFxAXBgSKFzykwz6ZQx9PgzigQk08UI4t6IdvAvubV49xwYkI35AUaLECtvvy/IWrkieIzKL8746VcstzIsZkNELsFiY9m0JIOTeKksNJaYVQyBWZ5OaBl0+0ztZDdbzvjErpW176flFJsuUDk2BKeDkM+CrKwBrMD5NOEA+5Gy1HC9j8u483VvWG3bfyWEXQolZzPNCUPnXNiaJda2UE+whfGmeAMKzO1iP7gud1QT4hv9/0iXRis/P25fpCvzcoGuwUyj3RMcc9EYhSDnRTfn/3Hd3PgnSsXuv6Sd3VAr6k8jpSOzqwXVQgv74fyVlzxDmg8d/T5/XttDpRo9ovHkj3eIrtQpfKJN5jmpAm/0vO5pP4yus3l+EtbpJf4Dg/V9IBZQpoBE1h90UcvogoLmyaY8H3OrH1+uK3lMJYOoG5oCZwc8hC2nofvavS2ItGehRv5+KalwtnDbztVzzK+VRphKLnt4Iss47zyqEQ32BOPQDqj10qg3a+6T8NRTQ+rkt5+JzcGZeKkgJUmfIkfXmM3fDxrELvZkRFzMdo6gHxq4U6JmpfEGurf77ugNMC2tJlv3zoepHgMDrRmKrskDTUcUSp7SBpZg9uk4A19wZHahE3hIM24eT77/om6BZZ0gSPPEqrFIZ99/tvW/tU2vmuU=",Value:"eyJ0aW1lc3RhbXAiOjE1NjU0NDkyMDUwNzksInByb2ZpbGVJZCI6Ijc3Y2M4NWFlMzg4YTQ2ZWNhNTM1OWUyZmZlZjcxYjI5IiwicHJvZmlsZU5hbWUiOiJEYW5URE0iLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E2MTZlN2QwOTNkMDU3NWYxYWRlMmY3YmIyMDBhODliOWM0NGM2YmFkY2I0NjM0Mjc3YWI0MDI2Y2I3NzlkNCJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjBjYzA4ODQwNzAwNDQ3MzIyZDk1M2EwMmI5NjVmMWQ2NWExM2E2MDNiZjY0YjE3YzgwM2MyMTQ0NmZlMTYzNSJ9fX0="}]},Name:"DanTDM"}},Count:1b}],NoBasePlate:true,Tags:["DanTDMLab"]}


###

# QUESTION PURPLE 7 -> MODS / DANTDM LAB ROOM
execute if block 945 64 1010 stone_button[powered=true] run scoreboard objectives add Question_P7 dummy
execute if block 945 64 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P7 1
execute if block 945 64 1010 stone_button[powered=false] run scoreboard objectives remove Question_P7

execute if entity @e[scores={Question_P7=4}] run summon skeleton 948 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f3c8d69b-0776-4512-8434-d1b2165909eb",Properties:{textures:[{Signature:"tjRT/IhfkBo8h0UFUSqzJN/WNVcuDzLmByAi+QQgfSppkvJ96CYMwoghZ5NqUWxuHZH2QWCmL8JR44ATZ6fpNjk/6vQtMyP/QkmS1KaZrBukZxeND5tigszY31UM1qIHSw70a8s3vruBWnzg+959yl3ilmkt4VH/GXRGKggv6r7a+g2fjhWTXeHvolOICITlbA8s+444nkpitSEXg9olb5s4ZFYwdRysvWAJ0SXJ80ya9wDVZS2jMcsKeQu9y6+U11PpVyIfkIlDx8+6ZIT2+UWwm5TiyfLLt46nF86rXLghC/KvgdDz0ngiiAJHROgsf9D4fdtKnMCZ00V31Qk+y0baPqxRi/LPqM/7jFregb+4/ZxmZXVf2u4d6+LriupUrDK0anVfgxUCOZ1BsOy8NbUCRJTxcONrUyBuqVgcvSUxjNEZaMkX24nwuodxoSZxs1GQgQbiyQkv+3Hd2EWnKoa5GasJ/OlYpLlnRpRw0gggS8Tl4JuRaXN5KTRSPK4dT0u70e0OkE47h4KUCHC+WDAfTTW62V0f6GkRzA3ub42SzBzXNcvTmeXvz4uqlWAGopnwaDhY0DjtDSYng0nHWTezgzwNkCfzyOgrCoGQnNFKy+dcM33gpCMp4nxknCmTw/GalzJbhqNXTMY0n22p1BheBLiWqXcW/T5Neybij5w=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEwOTIyMTIsInByb2ZpbGVJZCI6ImYzYzhkNjliMDc3NjQ1MTI4NDM0ZDFiMjE2NTkwOWViIiwicHJvZmlsZU5hbWUiOiJkYW4yMDAiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2NmMWQ2YmYwMjVjNTczM2E3NzhhMTc1MWMxOGIxYTAxNjE4NTIxNmIyYjY0MzczM2NmYzNmZWY5NmZhMzI3YzkifX19"}]},Name:"dan200"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP7","TriviaMobP7A"]}
execute if entity @e[scores={Question_P7=9}] run summon skeleton 942 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"bbb87dbe-690f-4205-bdc5-72ffb8ebc29d",Properties:{textures:[{Signature:"lTRdNyiVo9TC6HoaLMLrtersNAd2J+Jvl79k0jR/D9d4VfbEao16MA8YCSG+VDqlXTR9Gy/5DaMMoUt1hG2RdhYWMavrG+c25oKgqtCI7e7QU80+si6BEexGDxZXZinfyrbTpkC7iYcgj2Yz8g+fHkFWyJtKrOhIcqz6prq8DqV1J+h1PVlHAsEORVuPDOhOztbablCEacrRPKv21pbgBOzhSUJDBcJgf33XkhyHrplPPkpmnDd9f/ckE74bTGoo/aBiBh/XiIJkWRhDW4OeZS8ic5xtg5ocimT6hU4MoRjWQq2VTTxuAV8ajk/yMTe1+7N8sj20Ytt8srmiQZaKMgQEC5Y53qi2AetG0xjfphcImXaKqaKC4eHAYJWpmWO6evmkC8woUy7EB2g22Mdug4X4/II1XybziSLNII3clEVkotzfFYLdDDBkYqTQKMZHX0TdWJvz1UJORYkLC+h4tTQMkjVZFoqV5BAWH5ZVG5txpvVSC3GEp9kyjCfuJkFSTQ37wwa5D74lycKHAdGNpDTu99TxfkH5nWkVm8gVMMiHcpowJrxuOQ7PhmDp7MSCN9YP4E4dOSkt+c4te9jMmpRblii4p7gMyx9XV1mkqc/RXCIzxHUwsDTeG16Zc/Jtm/403IU7lC0WSjWOHg6sS8Ndl2cQsqz2wIhDeRw5Jgs=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDExODY0OTAsInByb2ZpbGVJZCI6ImJiYjg3ZGJlNjkwZjQyMDViZGM1NzJmZmI4ZWJjMjlkIiwicHJvZmlsZU5hbWUiOiJkaXJld29sZjIwIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS80YzdiMDQ2ODA0NGJmZWNhY2M0M2QwMGEzYTY5MzM1YTgzNGI3MzkzNzY4ODI5MmMyMGQzOTg4Y2FlNTgyNDhkIn19fQ=="}]},Name:"direwolf20"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP7","TriviaMobP7B"]}
execute if entity @e[scores={Question_P7=14}] run summon skeleton 942 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"d3cf097a-438f-4523-b770-ec11e13ecc32",Properties:{textures:[{Signature:"pgbRDPYFbffsiVaZE3jWf3c79R7WGZd3qFaBKV3HjFUXXk2jQh3bs8+/tgRRFjIHCRDrMi1fdxGSp/L180W3GUWqNDvuGyUb3djfoEPplqPXw4oy4netcewrkkn9YwmraI5Exgs4+O4lmkZpXPNDYC6pjzIdZN5ToHjUmp4a0JJ5CbCV0il25QUkP5LkEsYQhuMearcyI4b0Z3MbfZVI/AG41xqVHNAlPHrfqGPedNRltuYbuNRvxfXflEMahIQeuKr8BGwEg+doX8GmH5g+zu4eDTX4Mx7XfcAJrQmjHQcjbgZ3DK4WTyOkD2vbs6oPV1u5YC5V7vbfha/FoH/K6C6XUkjuOmpMsQpgqqxko/8v+xgEac6PYPrBun3cn8Gn98sEtAsIAPRV2ufizUG9RNlj32Zi+iMv9ChT6oIAm0xtN7o2wMJiVX57U931v9S+n3zTlkQIMFaWNdqzGCZMlJhJFQrZYBqkayM3DIj2YoQsHav8Pr6kASwoAEVWiN1mTllKG4mb3T+dbr9gzcH2kAiMtwEgMx/V2SI7Qtxh1Ii9JUQwflY5USVZJGQ7+ZuXWqTF+DW+Dvcqceh/F6ae1hDx4qgeqgtFlTjTAYV8J0tZ4RI7TxwQsVRsFziQ/ziFHmCHuTQwidUoSo1hfkQ0kRPu0pPYcgZeS5rd2ZLyHss=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDEzMzAwMjcsInByb2ZpbGVJZCI6ImQzY2YwOTdhNDM4ZjQ1MjNiNzcwZWMxMWUxM2VjYzMyIiwicHJvZmlsZU5hbWUiOiJMZXhNYW5vcyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWIzNWFiMWYzZGVjMzc4MjJjNzhjYTBlMjZiNGM1OGQzYjU2ZjMwMTgzYjk3MjJlZTQzMTkwYWNmNGU5NDcxNiJ9fX0="}]},Name:"LexManos"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP7","TriviaMobP7C"]}
execute if entity @e[scores={Question_P7=19}] run summon skeleton 948 62.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"07a4bbac-8d56-4cee-8e06-3e44ccc31fc3",Properties:{textures:[{Signature:"XhaGLSGSITPB7MCaEri+qYSq0s68te1ehNwty1w4REt4Cyad30JC87teLUkR1oRQgnssWsCKXA1O8SnYJqqHd/4LGC8Ggep7N/W1+3+TdjlukJvBowT9uw4cyZD65fL1/tpMMpHkwluX5vd9By+ryMWudwn+kDYrgCECEKMJW6Qm9BvVEXqAmr6YAx5La5C6CYG4tiu+A7ssaWbTj9XTGIF3o22EnofZMv+t9zQ23IYlGFAXBf+tK8iNofCoIILfWKlb0R7StZkYG8nlKNaaqR65dqSAchZcCeH1a4tXivx7+R0PPdDkEzai2yyTym0mNYdVRjJ3CDt9MdFAa6UqZ3+7ELgsCsJMSvVc0zIa75sA7K/WH3Rre0JElW5dzq0s6s8zl6cof/Y866J2XgYScPXjDkRDQDVAFGYzKegvScg3sBdgs37+OsYCqNZ0jRQCljv9ryblC4bNevFZy743J1XtNvROexAXvdhPIuIVxFgTKMrHpTB+Acfp2IBfZoQ8QDaNOshzoTVJklyeppTX29FARNcjzdpRy4T/xGf+4DqPXM3O5lWAkEwDnCT4qOmL5LG7qgK0XFcvsOtmN/AlMgYzzWjmM8UpTGWbq8+qMV4bAHIStk3GaLVq1c/XIw3cRkJOF4a30y6ReNqq0J0YguZCyWrCzyd8cng9h6QFapo=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDE0Njc4MzEsInByb2ZpbGVJZCI6IjA3YTRiYmFjOGQ1NjRjZWU4ZTA2M2U0NGNjYzMxZmMzIiwicHJvZmlsZU5hbWUiOiJzcDYxNHgiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzg4M2IxMjhkZjgxNmY4NWYwMTY3YzA1NWM0NTRmZjIxYmU5MDFmMjBjY2NkMDI1YTQzMDE2OWVhMzkwNjdkNzgifX19"}]},Name:"sp614x"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP7","TriviaMobP7D"]}

execute if entity @e[tag=TriviaMobP7] run scoreboard players set @e[scores={Question_P7=3}] Question_P7 19
execute if entity @e[scores={Question_P7=19}] run tellraw @a[tag=P7] ["",{"text":" Q: Mods are one of the most popular aspects of Minecraft, many of which are made more easily accessible with the program Forge. Which of these Minecrafters develops Forge?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP7A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP7A] unless entity @e[tag=TriviaAECP7A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP7","TriviaAECP7A"],Duration:2147483647,CustomName:"{\"text\":\"dan200\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP7B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP7B] unless entity @e[tag=TriviaAECP7B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP7","TriviaAECP7B"],Duration:2147483647,CustomName:"{\"text\":\"direwolf20\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP7C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP7C] unless entity @e[tag=TriviaAECP7C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP7","TriviaAECP7C"],Duration:2147483647,CustomName:"{\"text\":\"LexManos\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP7D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP7D] unless entity @e[tag=TriviaAECP7D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP7","TriviaAECP7D"],Duration:2147483647,CustomName:"{\"text\":\"sp614x\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP7A] as @e[tag=TriviaMobP7A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP7B] as @e[tag=TriviaMobP7B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP7C] as @e[tag=TriviaMobP7C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP7D] as @e[tag=TriviaMobP7D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP7A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP7A]
execute if entity @e[tag=TriviaMobP7B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP7B]
execute if entity @e[tag=TriviaMobP7C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP7C]
execute if entity @e[tag=TriviaMobP7D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP7D]

execute unless entity @e[tag=TriviaMobP7A] run kill @e[tag=TriviaAECP7A]
execute unless entity @e[tag=TriviaMobP7B] run kill @e[tag=TriviaAECP7B]
execute unless entity @e[tag=TriviaMobP7C] run kill @e[tag=TriviaAECP7C]
execute unless entity @e[tag=TriviaMobP7D] run kill @e[tag=TriviaAECP7D]

# IF WRONG
execute if entity @e[tag=TriviaMobP7A,nbt={HurtTime:10s}] run teleport @a 800 6 1019
execute if entity @e[tag=TriviaMobP7B,nbt={HurtTime:10s}] run teleport @a 800 6 1049
execute if entity @e[tag=TriviaMobP7D,nbt={HurtTime:10s}] run teleport @a 800 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobP7C,nbt={HurtTime:10s}] run scoreboard objectives add QP7_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP7_Correct 1

execute if entity @e[scores={QP7_Correct=1}] run setblock 945 64 1010 air
execute if entity @e[scores={QP7_Correct=1}] run kill @e[tag=TriviaAECP7]
execute if entity @e[scores={QP7_Correct=1}] run kill @e[tag=PreLoadStandP7]
execute if entity @e[scores={QP7_Correct=1}] as @e[tag=TriviaMobP7] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP7_Correct=1}] as @e[tag=TriviaMobP7] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP7_Correct=20}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP7_Correct=22}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP7_Correct=23}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP7_Correct=24}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP7_Correct=25}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP7_Correct=26}] at @a[tag=P7] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP7_Correct=30}] run playsound entity.firework_rocket.launch master @a 945 64 1010 1 1 0

execute if entity @e[scores={QP7_Correct=32}] run title @a[tag=P7] times 1 80 1
execute if entity @e[scores={QP7_Correct=32}] run title @a[tag=P7] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP7_Correct=32}] run title @a[tag=P7] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP7_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP7_Correct=35}] run tellraw @a[tag=P7] ["",{"text":" (✔) CORRECT: Forge was originally developed by Eloraam, SpaceToad and FlowerChild circa 2010. LexManos took over shortly after and has been lead developer since. If you want to try out some of the many crazy Minecraft mods, you can get started "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"http://www.minecraftforge.net"}},{"text":" and download Forge for free."}]
execute if entity @e[scores={QP7_Correct=35}] run fill 938 63 996 938 63 996 air replace purple_concrete
execute if entity @e[scores={QP7_Correct=35}] run setblock 938 66 990 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP7_Correct=35}] at @a[tag=P7] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP7_Correct=35..}] run scoreboard objectives remove QP7_Correct

###

# QUESTION PURPLE 8 -> LET'S PLAY / FIRST HOUSE ROOM
execute if block 938 66 990 stone_button[powered=true] run scoreboard objectives add Question_P8 dummy
execute if block 938 66 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P8 1
execute if block 938 66 990 stone_button[powered=false] run scoreboard objectives remove Question_P8

execute if entity @e[scores={Question_P8=4}] run summon skeleton 941 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"f392ef9d-d8b3-4a74-b009-2b82b3b8a50f",Properties:{textures:[{Signature:"ENfv+EJOzonOyDxQLqCbXBSxtCsEV+57ORKoozCCWG7YqrXEpJLDrWClautw9kpYe80tWCV0tEI4XI+y/PbRIkOZ3Ellqy/hqBogm4BFHZFqNAYGrI0zNfDEw+Y2pD1XzvdtXZ8Exjq2Ya88zDTK5tAEmaBj0uKD9JUYxM7ddL3E2dAPFfaJWXa8NS4vLjSPg5tZM1y19iVk+B0UIdGFGVU3LoRdKS/fFS82zYlSSY2MAigF3iqj9SuSHxRpy575dNmtXNUEdu42olLGcnMoqzJkB70Di+WNuSQqjDP5jbvemepwDrctkvh8SpB8wMo2IDbbB/A4/vDC3dUydEjD02Q4CUNl3X/zX4oe0JqsFnO5eU1pil7Br46ReR1rJWM9SlTbETNoF2nNzorL0g33KNldamrHDDm/EbuPX9h+1UOfVnDD8mnvP5n74wvIDDHWGRmxSX1KgQZlab6DHXS5Ph2AEAhx+wuXWCG3lqtNf53Gvu0y+gCQCmnaBOOYGX+JWky4xk0ajm6jYVB730gmaXTXLx567prX0XPlo3cYT6QWe+PQUiGe/00aGUHhGKn9S+oZ6AC226muBe3oZKZ7wxRcfBbiEweHwgeNPPekzgaUUKg/erEusakdsxRduubujZa7P2d+NJDuC3NJ5k+g6bgDFp4pLeoiyRdpG2viKgQ=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDIxMzIwODgsInByb2ZpbGVJZCI6ImYzOTJlZjlkZDhiMzRhNzRiMDA5MmI4MmIzYjhhNTBmIiwicHJvZmlsZU5hbWUiOiJjYXJsejByIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81ZmZjYjM0MzU1NjZmNGMyZGU3ZDM0ZTgyZjE1ZWZhNjQ0ZjAwNmZhMWY4N2I3ZmJjMTUyYWQ3ZGY5ZjVjYjlhIn19fQ=="}]},Name:"carlz0r"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP8","TriviaMobP8A"]}
execute if entity @e[scores={Question_P8=9}] run summon skeleton 935 64.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"459e4ba1-485c-456d-88dd-6996fee135d4",Properties:{textures:[{Signature:"efMGTqIC68A3fdFm+U2JmXW8YTL8vtIIdJXaF0CqdWcC0Eg1ogLPYlizEEqo0aiH5X535AMGASkfsMzbiNKtCloaUCaoa4UM7BDlqstfg4nXdfbBNaqq9r2xFUm79Am92iNnYI1EE0E8dCUHsyRVmgiFUsuZ8Gc5c7OZT2o6EBuqCcRhMNg2+D4yaVI1xVrl1vh96FYQ9EqgPXX3+Cd+JYEHrOF87U81hYb5qwediSXNwSyiP0KFvQ7m9qhx//Fk5Knja7GFp5vOGYfm51BZH3TxvbfEcb2HUeMlx4tma5KnF7UxlUR4EBJStFdziEh17gebbNIhrTs2ZbYd72Of9M2gLyrrbBIFNCiUm7UKiwIUJg/gNHXsN0G4EFSReM7hDBjnGSit9WFBBrdTjex6f+aN28EVgzsvZjX8i+AMmwQx6RT0h8I8Y5I5cgc//doPSixmgXnRyZxWbQbZq+pmtsDDQFu6H3VDAW4J81a455xO05Y7N3uWEkTHBRvnEmttNHBggZx2+hyIeG2Oo0wulbWeFU6Qz5jVPcJCJ//Zm29vBnluFqI6Hm7I1P7Hj8CialQ+ZKwD8KocBXEU/Blhf9HdSsYoiagTM01gRRZ8Qbh/fn+WRVxfltDGKX1gVcasW94pLkVy7Ve9hrbl8ho7YoNgurOe0nlLrfOtzuBsCjY=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDIzNTI0NjcsInByb2ZpbGVJZCI6IjQ1OWU0YmExNDg1YzQ1NmQ4OGRkNjk5NmZlZTEzNWQ0IiwicHJvZmlsZU5hbWUiOiJHcmF2aXRhcnkiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzg0YTVhYWIxZGM4ZTBjNWZiNWEwMGVhNTdkZGU5OGNkOGEzZjEzZGVlNTkyMGZiNzY0N2U0MzczZDM4ZWFjN2QifX19"}]},Name:"Gravitary"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP8","TriviaMobP8B"]}
execute if entity @e[scores={Question_P8=14}] run summon skeleton 935 64.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"06d8a457-891e-4f99-9d5c-c1e2b33f3321",Properties:{textures:[{Signature:"mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]},Name:"paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP8","TriviaMobP8C"]}
execute if entity @e[scores={Question_P8=19}] run summon skeleton 941 64.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"2020946e-7494-42fb-b805-aa1ba98b5e65",Properties:{textures:[{Signature:"fYBQuRPh5d08bZdPkF3BEBEDfNFTIgYqifd8M74i3p4CHJ7FZ9ZfPtgwV7XgMxxHKNm/XDUwZSGVLKJ89DijIuPHqjBAHuAV2T7GF/Zy3h8s1wn6GZtupJqHgmuCwzNJBbs3oEovoV8EZcM2AhO+EbSvyw4f6Nz9MlzqHcbW2xJcW6cMAm378gLVsHcgob7/j8VfV483nudhC5cFlagYLymn0d4QZtRkusI7T7Ys77XIwBJrhqNkAbpxnAJmLyWuB9bXrLBvv8zdzwr5u6qbSHeKg5e4ivAKv8y89zoSoBaLACm0h2ICXg2ydTit6LvyNCjTLqwEldMi2bDZP43VIafHFikyjuJ3B7L5Is6YJQoNTiSFs/xtzlxbU7Rltqc84+vsdrBDuF8+7A3Gv2MI3IY0FZb2YjODCcSS+IseO5PodcpVjILw1xArOVZpYBXvAMKEv/6Xv9a0pL0AP3vTyapqIsrXEm8fTINwkXPPh2AXNVtbH05E3ma9N4KsjZRwvYCdG0FGQJix2Qf7MV1MNb0ZrhLSfyC9D+nOw+LZ9mg7YJkfWXdqD0zBqVMEpsfVDzM1sthe4VL5qiVukj67HD4FW1EdKKRHLK+85Jyt2SwwPmSEm0fisz3v2FpJFoAMxMOoPMJlhZJyT1p74rAbgj5ZK8bBs/V+ykVlkbl4Zs4=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDI0NzgyNzIsInByb2ZpbGVJZCI6IjIwMjA5NDZlNzQ5NDQyZmJiODA1YWExYmE5OGI1ZTY1IiwicHJvZmlsZU5hbWUiOiJkYXZpZHI2NCIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTE2MmJhNzczNWQ0ZTM0NTk5ZTM1YmExMzMxNzNlOGY3Y2UwZGM2MzBkMDRlZjFmMjg0N2E0YTk4MzU2NWQ0ZSJ9fX0="}]},Name:"davidr64"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP8","TriviaMobP8D"]}

execute as @e[tag=TriviaMobP8B,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 64.58 ~ ~ 0
execute as @e[tag=TriviaMobP8C,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 64.58 ~ ~ 0
execute as @e[tag=TriviaMobP8D,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 64.58 ~ ~ 0

execute if entity @e[tag=TriviaMobP8] run scoreboard players set @e[scores={Question_P8=3}] Question_P8 19
execute if entity @e[scores={Question_P8=19}] run tellraw @a[tag=P8] ["",{"text":" Q: What would Minecraft be if it weren't for YouTube? Do you know who created the very first Minecraft Let's Play?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP8A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP8A] unless entity @e[tag=TriviaAECP8A] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP8","TriviaAECP8A"],Duration:2147483647,CustomName:"{\"text\":\"The Carlz0r\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP8B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP8B] unless entity @e[tag=TriviaAECP8B] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP8","TriviaAECP8B"],Duration:2147483647,CustomName:"{\"text\":\"HypnotoadProductions\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP8C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP8C] unless entity @e[tag=TriviaAECP8C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP8","TriviaAECP8C"],Duration:2147483647,CustomName:"{\"text\":\"paulsoaresjr\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP8D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP8D] unless entity @e[tag=TriviaAECP8D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP8","TriviaAECP8D"],Duration:2147483647,CustomName:"{\"text\":\"X\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP8A] as @e[tag=TriviaMobP8A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP8B] as @e[tag=TriviaMobP8B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP8C] as @e[tag=TriviaMobP8C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP8D] as @e[tag=TriviaMobP8D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP8A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP8A]
execute if entity @e[tag=TriviaMobP8B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP8B]
execute if entity @e[tag=TriviaMobP8C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP8C]
execute if entity @e[tag=TriviaMobP8D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP8D]

execute unless entity @e[tag=TriviaMobP8A] run kill @e[tag=TriviaAECP8A]
execute unless entity @e[tag=TriviaMobP8B] run kill @e[tag=TriviaAECP8B]
execute unless entity @e[tag=TriviaMobP8C] run kill @e[tag=TriviaAECP8C]
execute unless entity @e[tag=TriviaMobP8D] run kill @e[tag=TriviaAECP8D]

# IF WRONG
execute if entity @e[tag=TriviaMobP8B,nbt={HurtTime:10s}] run teleport @a 800 6 981
execute if entity @e[tag=TriviaMobP8C,nbt={HurtTime:10s}] run teleport @a 800 6 891
execute if entity @e[tag=TriviaMobP8D,nbt={HurtTime:10s}] run teleport @a 800 6 861


# IF CORRECT
execute if entity @e[tag=TriviaMobP8A,nbt={HurtTime:10s}] run scoreboard objectives add QP8_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP8_Correct 1

execute if entity @e[scores={QP8_Correct=1}] run setblock 938 66 990 air
execute if entity @e[scores={QP8_Correct=1}] run kill @e[tag=TriviaAECP8]
execute if entity @e[scores={QP8_Correct=1}] run kill @e[tag=PreLoadStandP8]
execute if entity @e[scores={QP8_Correct=1}] as @e[tag=TriviaMobP8] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP8_Correct=1}] as @e[tag=TriviaMobP8] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP8_Correct=20}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP8_Correct=22}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP8_Correct=23}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP8_Correct=24}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP8_Correct=25}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP8_Correct=26}] at @a[tag=P8] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP8_Correct=30}] run playsound entity.firework_rocket.launch master @a 938 64 990 1 1 0

execute if entity @e[scores={QP8_Correct=32}] run title @a[tag=P8] times 1 80 1
execute if entity @e[scores={QP8_Correct=32}] run title @a[tag=P8] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP8_Correct=32}] run title @a[tag=P8] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP8_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP8_Correct=35}] run tellraw @a[tag=P8] ["",{"text":" (✔) CORRECT: This honour goes to TheCarlz0r who even has a Guinness Record to go with that. It was posted May 21, 2009, just 4 days after Notch released the game publicly. Check out the video "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=keWC1NuCUY4"}},{"text":"."}]
execute if entity @e[scores={QP8_Correct=35}] run fill 932 63 1004 932 63 1004 air replace purple_concrete
execute if entity @e[scores={QP8_Correct=35}] run setblock 932 65 1010 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP8_Correct=35}] at @a[tag=P8] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP8_Correct=35..}] run scoreboard objectives remove QP8_Correct

execute if entity @e[scores={QP8_Correct=1}] run kill @e[tag=AsleepAS]
execute if entity @e[scores={QP8_Correct=1}] run summon armor_stand 932.0 63.96 1011.28 {NoGravity:true,Invulnerable:true,Invisible:true,Small:true,DisabledSlots:2039583,ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1b}],Tags:["AsleepAS"]}
execute if entity @e[scores={QP8_Correct=1}] run summon armor_stand 932 63.65 1012.57 {NoGravity:true,Invulnerable:true,Invisible:true,Small:false,DisabledSlots:2039583,Rotation:[-50.0f,0.0f],HandItems:[{id:"minecraft:stick",Count:1b}],Pose:{RightArm:[180.0f,0.0f,90.0f]},Tags:["AsleepAS"]}

execute if entity @e[scores={QP8_Correct=1}] run summon villager 929 64 1018.45 {NoAI:true,Invulnerable:true,Silent:true,Profession:1,Rotation:[205f,0f],Tags:["AsleepAS"]}
execute if entity @e[scores={QP8_Correct=1}] run summon armor_stand 930.21 63.9 1017.6 {NoGravity:true,Invulnerable:true,Invisible:true,Small:false,DisabledSlots:2039583,Rotation:[45.0f,0.0f],HandItems:[{id:"minecraft:lever",Count:1b}],Pose:{RightArm:[300.0f,340.0f,0.0f]},Tags:["AsleepAS"]}



###

# QUESTION PURPLE 9 -> MCEDIT / ASLEEP GAMESHOW ROOM
execute if block 932 65 1010 stone_button[powered=true] run scoreboard objectives add Question_P9 dummy
execute if block 932 65 1010 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P9 1
execute if block 932 65 1010 stone_button[powered=false] run scoreboard objectives remove Question_P9

execute if entity @e[scores={Question_P9=4}] run summon skeleton 935 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"cf792ddf-92f3-41e7-a007-42db5f909947",Properties:{textures:[{Signature:"V2k97VzXR2K8UiRmKgTXyLVdlQMkCtACmgYgAEJaJ0eCiWy+AmuekOs1PznIYx7+P+iUtpaFAN9hHLUgv0zxKGz925hlGySXRrUnqtCuxyjTImI3Zx9K4wJqA/0JAxmhpfd2gp6dyGTl60C9OnJfOxbuN5aTArpOYSXcdDrkBg9zjDd4xa2OwSzGjNCymhY9SVQnco0E03U6rG9gqNj2yI12IJAlky+DykQgTP6xSg1imQ4KTTiQhfoZfB+FbLfBZuYbFypY+a49G2fFprPqveIOc4O+5OTSZTCUEW4WtUm0mHvo0CMTQ1uClvXtbcCNRx1335aLia00fUwNt/YSJ2PAPVp65SuEbR7ASG2Qx/MIUUPICk3d+dJMkv3Y9vhpoFvRM6oz5FwtXSjh+3jyKbaCO/FXNSyOaIOfMFJ56fKDl26hcFTpAzjct1mU3gWtXhnGP82YrvCxqEiTbCUX44rso2w5y22KA0TNhLc6IJdZDPbLuAk9wwtJ13lMI3OUJj2zgCDUI+ehIqTDO0QWBk4hdFRqvNb3cUf5VicZAiCAVin8OGY6eECUcoGfz8y7kVFBGzbzKSKwqW/xZJBPoyLKLhrj3e0W6UhQbzniqERxqoTEkn/4wMUmhcEF3unQ+kRkt/lpYO1DQSwZQJpa+0ZLm99mX/kwV9S/7y9vn00=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDI2NjIzMTksInByb2ZpbGVJZCI6ImNmNzkyZGRmOTJmMzQxZTdhMDA3NDJkYjVmOTA5OTQ3IiwicHJvZmlsZU5hbWUiOiJDYXB0YWluX0NoYW9zIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS80MDIzYzAzM2FiNmJhYWViYjRkNmFlZWQ5MWQyYjg3MTU4NDAwY2E3MzIwMjk3Mzg4YTk4MjZkYzExZjg3N2YxIn19fQ=="}]},Name:"Captain_Chaos"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP9","TriviaMobP9A"]}
execute if entity @e[scores={Question_P9=9}] run summon skeleton 929 62.5 1013 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"a1f04ccd-e535-4a34-ae5f-b05084e5888f",Properties:{textures:[{Signature:"RZF1B0SGSk/HVXLUkCDCU5WcGej8CUCs8CTDxbMDm094sEZRH7RuWEYA0wlf6kVdtZUrIQj4PMfKpmhnSlYzaonXpyupG9ofkVGnwp4Ey/pjhlmjJ3cZSjCR0rWmRK2T9Ge13lIu6B/tu9tZJ1doSIic5c/xTC//sPT2NR9RZCuK4o5kTlscuulw7NyGDCVzo1IYA/Lw81NrOMNY1XoGqk3UhmNVHotWrUNGtTZjQi/itxnHmCS1H73SkC67B4g//N5yb8lCoPfXa+DG3JKXZ9wGfqFgsjVYEwOQjcxYR00nS+orfiEyXWjF9zF6C4YLuKPhboHddwlt667SVMatswTvE0XUBs5k+ENUDXg6+i2IDjaCfjFWoNC3qlh4PCBXlu2axHCqAsgGu7Zd+p81gGBLR6ZZEwiYszSdA+kmr8inYvYyetmU+Ho2fK0j6nobZaDGjH8ajpaopH+W8R7dmAziV3GAJRG/VfaTcmHhS+MeIhAwfQ8ZynzQLlZP03oCybcl9bSupvlUjbkQar7QIKG7NLlZgbpIlKrllaHTI7Hze5c/uDlQnn9FCF/FRJQx/q3aiylGZIs/DCjEhH3faW1FtywKB2453y6eNbkgi+JG9wIniKt6wWT0TL9RvPFqB+p5Bk5w5PuwCY+n4jBYh9q34nS79d5/7hq/6uCqhw8=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDMwNDg3ODQsInByb2ZpbGVJZCI6ImExZjA0Y2NkZTUzNTRhMzRhZTVmYjA1MDg0ZTU4ODhmIiwicHJvZmlsZU5hbWUiOiJjb2Rld2FycmlvciIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWViMjljYWE0NzY0NzhkYzQ5ZTBiYzA2ZmNjMTk2N2Q5OWJmN2IwZGU2ODRkZGYxZGU2OTc2YjY4YmNiZThmMyJ9fX0="}]},Name:"codewarrior"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP9","TriviaMobP9B"]}
execute if entity @e[scores={Question_P9=14}] run summon skeleton 929 63.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0dcb0641-5207-43d5-8457-7454d008a2a2",Properties:{textures:[{Signature:"WslC+6wWpEuKLRlIZF8xIMAHm5Cg6hrCAakkg8G6j7hcXxQRn85HaRPCAMq1/w+HmliYV8HhJzgTxYuP73Ygu0uphIUt6ardBN/QCMovlfn7DWykw539baFg1FE8RRqgGxzkXR2YlNSI2GJwnSo5IU0FJbKD8G+GSx7zflfbpIQnHv1G7aySLO2PZNX18hqH2Cs8rwx36UnXBYZVe9ZvFoQVF4+/dqQCUWA0lPqXqVAGQAsW01UkHYoF4IwJAaUyJYMzIPH+BuZXlJH8QD2ZE9kmkx7DKE6EqFXbbSmsAjFqhXTnxHLpNlPzzYaIFYW33lc27hCdXUsBXqoM4mvmykSte2GfudvkBOk0zQ85d6l4iBvU4nRkw1l0J08iaNcjR4jHyYgBwMc+3mDyE5vosqR/C/MonE7HpWjzUaTagvXSUEvefrUcSy4rkBowSp6UxolWV4FuMNuyMz5WTUpw8qdgiOJPv1TGWQIXdTc17tQo8xy/OshLb+uFGOlSggO4bIKrUHgNdDtvcEfk7DDSIyhNzA0Qzfm4/CCmoHxAIn+Nzhm7G8cqgLvFAWHzrfjr0P0XdlD4p/RpzeyZwNLBXNR2R5VOdLGWYwLB7W42MkUULqLV6i8NgkoRTBDBSoJV75nhUksP6U9r7dW9a5Gqw74kpLTpq0Z3YPtTmII6fLM=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM1OTc1NTUsInByb2ZpbGVJZCI6IjBkY2IwNjQxNTIwNzQzZDU4NDU3NzQ1NGQwMDhhMmEyIiwicHJvZmlsZU5hbWUiOiJUZXhlbHNhdXIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E0ZDkxMTViNDZjMTk4NjUxYjM3MDRiYTlhY2EwZjQzMjEwYjUzMjA3NzdiZWE2YjVhZTNkMDE0Yjk1ODhkNzYifX19"}]},Name:"Texelsaur"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP9","TriviaMobP9C"]}
execute if entity @e[scores={Question_P9=19}] run summon skeleton 935 63.5 1007 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0ea8eca3-dbf6-47cc-9d1a-c64551ca975c",Properties:{textures:[{Signature:"FncUBs7Yo2wzVCEKOBXw1dhgyCPUhbu4/UvJ8B9ahLdqCKq7MEJ++wWxdPM8mMATGJl0YhlhujU9NPJp5ufnyGww9Cd62YQ1Wl7VrhG11axvnbg9dE6lMYHMXu6wUc0iCNuF6PiRsPKsgD8gqrwfjYm/wQi78m+to89s9fTFoGD/7WMFFJ6APW0RPFp3qt5HtJD/SmNsep6MyUNhgDMHCt1tl1U630ahdoNt+VVbLKTfpZHR3CEsqPKhOP1a2rcteHljXzXGJLeJrJdmZUbh7idXm5GNF3yfxwRThtzoSK7H6whuLYRooe5WN8C+a563paJUWtwYyG8lM23tqk4D8i9EuAiFWVgxipeagc92lT6z6RJTlDYZ15gFovM6j+lDjfeRZ4vo+kqGrSdhtX0XzxcJ2JtGq1IgBx3JvWhsbkWX4NGrbzz6SW+4JQMrVDoLMl3gzHuUYXXyMXxdOuUGP0M6Msd2G4Pt5l5TtDjjwPl2cE6ZTvh7GzEXZMINg6Gw+OQnLq9Mx6lOBMxF5hoz5azJU89eiDrCfyrVis+1VFAfmjlS5KZtpJGSKY48fV2fGVBiFbyG929WVaIC4oH3GCu7p12YYcbwNWNleNSV8MBcPtuOc5qoPJ3X+vzXsiOq6YQCvnX/EqpYrn2HUTZRFNz04xA/7blpH+7wk38O54M=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM2NDY1MTEsInByb2ZpbGVJZCI6IjBlYThlY2EzZGJmNjQ3Y2M5ZDFhYzY0NTUxY2E5NzVjIiwicHJvZmlsZU5hbWUiOiJzazg5cSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjEzMjYwMDA3Y2JiN2YwMTRkNTA0YzE0ODQwYmQ4ZTU1NmMwMGUwMWIzNmQwYmUyM2M4NDlhOWY4MmE1YjdmMCJ9fX0="}]},Name:"sk89q"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP9","TriviaMobP9D"]}

execute as @e[tag=TriviaMobP9C,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 63.58 ~ ~ 0
execute as @e[tag=TriviaMobP9D,scores={TriviaMobAge=17..18}] at @s run teleport @s ~ 63.58 ~ ~ 0

execute if entity @e[tag=TriviaMobP9] run scoreboard players set @e[scores={Question_P9=3}] Question_P9 19
execute if entity @e[scores={Question_P9=19}] run tellraw @a[tag=P9] ["",{"text":" Q: There are many extremely handy external programs for building massive Minecraft maps and projects. Who is the original creator of MCEdit?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP9A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP9A] unless entity @e[tag=TriviaAECP9A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP9","TriviaAECP9A"],Duration:2147483647,CustomName:"{\"text\":\"Captain_Chaos\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP9B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP9B] unless entity @e[tag=TriviaAECP9B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP9","TriviaAECP9B"],Duration:2147483647,CustomName:"{\"text\":\"codewarrior0\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP9C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP9C] unless entity @e[tag=TriviaAECP9C] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP9","TriviaAECP9C"],Duration:2147483647,CustomName:"{\"text\":\"jaquadro\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP9D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP9D] unless entity @e[tag=TriviaAECP9D] run summon area_effect_cloud ~ ~1.5 ~ {Tags:["TriviaAEC","TriviaAECP9","TriviaAECP9D"],Duration:2147483647,CustomName:"{\"text\":\"sk89q\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP9A] as @e[tag=TriviaMobP9A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP9B] as @e[tag=TriviaMobP9B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP9C] as @e[tag=TriviaMobP9C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP9D] as @e[tag=TriviaMobP9D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP9A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP9A]
execute if entity @e[tag=TriviaMobP9B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP9B]
execute if entity @e[tag=TriviaMobP9C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP9C]
execute if entity @e[tag=TriviaMobP9D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP9D]

execute unless entity @e[tag=TriviaMobP9A] run kill @e[tag=TriviaAECP9A]
execute unless entity @e[tag=TriviaMobP9B] run kill @e[tag=TriviaAECP9B]
execute unless entity @e[tag=TriviaMobP9C] run kill @e[tag=TriviaAECP9C]
execute unless entity @e[tag=TriviaMobP9D] run kill @e[tag=TriviaAECP9D]

# IF WRONG
execute if entity @e[tag=TriviaMobP9A,nbt={HurtTime:10s}] run teleport @a 770 6 1019
execute if entity @e[tag=TriviaMobP9C,nbt={HurtTime:10s}] run teleport @a 770 6 1049
execute if entity @e[tag=TriviaMobP9D,nbt={HurtTime:10s}] run teleport @a 770 6 1079


# IF CORRECT
execute if entity @e[tag=TriviaMobP9B,nbt={HurtTime:10s}] run scoreboard objectives add QP9_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP9_Correct 1

execute if entity @e[scores={QP9_Correct=1}] run setblock 932 65 1010 air
execute if entity @e[scores={QP9_Correct=1}] run kill @e[tag=TriviaAECP9]
execute if entity @e[scores={QP9_Correct=1}] run kill @e[tag=PreLoadStandP9]
execute if entity @e[scores={QP9_Correct=1}] as @e[tag=TriviaMobP9] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP9_Correct=1}] as @e[tag=TriviaMobP9] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP9_Correct=20}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP9_Correct=22}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP9_Correct=23}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP9_Correct=24}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP9_Correct=25}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP9_Correct=26}] at @a[tag=P9] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP9_Correct=30}] run playsound entity.firework_rocket.launch master @a 932 64 1010 1 1 0

execute if entity @e[scores={QP9_Correct=32}] run title @a[tag=P9] times 1 80 1
execute if entity @e[scores={QP9_Correct=32}] run title @a[tag=P9] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP9_Correct=32}] run title @a[tag=P9] subtitle {"text":"Next question open", "color":"white"}
execute if entity @e[scores={QP9_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP9_Correct=35}] run tellraw @a[tag=P9] ["",{"text":" (✔) CORRECT: MCEdit, created by codewarrior0, allows you to make massive changes to a world file quickly and easily, while being outside the game. It's available free for Minecraft versions prior to 1.13 "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"http://www.mcedit.net/"}},{"text":"."}]
execute if entity @e[scores={QP9_Correct=35}] run fill 925 63 996 925 63 996 air replace purple_concrete
execute if entity @e[scores={QP9_Correct=35}] run setblock 925 65 990 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP9_Correct=35}] at @a[tag=P9] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP9_Correct=35..}] run scoreboard objectives remove QP9_Correct

execute if entity @e[scores={QP9_Correct=1}] run kill @e[tag=SimburbiaFrame]
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 925 64 995 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 927 64 995 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 925 64 992 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 927 64 992 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 923 64 989 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 925 64 989 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 927 64 989 {Invulnerable:true,Facing:3b,Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 921 64 991 {Invulnerable:true,Facing:4b,Tags:["SimburbiaFrame"]}

execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 926 65 984 {Invulnerable:true,Facing:3b,Item:{id:"minecraft:apple",Count:1b},Tags:["SimburbiaFrame"]}

execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 921 67 980 {Invulnerable:true,Facing:3b,ItemRotation:1b,Item:{id:"minecraft:purple_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 922 67 980 {Invulnerable:true,Facing:3b,ItemRotation:0b,Item:{id:"minecraft:red_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 923 67 980 {Invulnerable:true,Facing:3b,ItemRotation:1b,Item:{id:"minecraft:lime_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 924 67 980 {Invulnerable:true,Facing:3b,ItemRotation:0b,Item:{id:"minecraft:yellow_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 925 67 980 {Invulnerable:true,Facing:3b,ItemRotation:1b,Item:{id:"minecraft:blue_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 926 67 980 {Invulnerable:true,Facing:3b,ItemRotation:0b,Item:{id:"minecraft:orange_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 927 67 980 {Invulnerable:true,Facing:3b,ItemRotation:1b,Item:{id:"minecraft:white_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 928 67 980 {Invulnerable:true,Facing:3b,ItemRotation:0b,Item:{id:"minecraft:cyan_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 929 67 980 {Invulnerable:true,Facing:3b,ItemRotation:1b,Item:{id:"minecraft:pink_concrete_powder",Count:1b},Tags:["SimburbiaFrame"]}

execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 929 66 984 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:192}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 929 65 985 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:193}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 929 66 987 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:194}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 929 65 990 {Invulnerable:true,Facing:4b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:195}},Tags:["SimburbiaFrame"]}

execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 927 66 995 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:196}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 926 66 995 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:197}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 925 66 995 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:198}},Tags:["SimburbiaFrame"]}
execute if entity @e[scores={QP9_Correct=1}] run summon item_frame 924 66 995 {Invulnerable:true,Facing:2b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:199}},Tags:["SimburbiaFrame"]}



###

# QUESTION PURPLE 10 -> NOOBCREW / SIMBURBIA CLASSROOM
execute if block 925 65 990 stone_button[powered=true] run scoreboard objectives add Question_P10 dummy
execute if block 925 65 990 stone_button[powered=true] run scoreboard players add @e[tag=MainTriviaAEC] Question_P10 1
execute if block 925 65 990 stone_button[powered=false] run scoreboard objectives remove Question_P10

execute if entity @e[scores={Question_P10=4}] run summon skeleton 928 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[135f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ba2d16f-3d11-4a1f-b214-09e83906e6b5",Properties:{textures:[{Signature:"Dtb/009jc8Jln6gjjWt5I4b9K4cvsGuHpWHyP9yk7+6CDXSwfsuCCdFT/3kS3i9RXOGwa61lGaFwPBRwT6+Lr8iuGqYPrzxUqsJvHSw18KMbSHrp2azfW7L6QfUIApwZ6sz6rW3LlbmFpjVdmdsC2/sZvH3F86ZNd5Wiu+f6FtuoQKyCZegrayC17EpY0enk6Z9rjIhJjJIWXKNUlrQtBOnJ8wDDvwM5n9/K78kX6WKWAlrg2gh+KB4SoObx1sUIZHCYTd1XPau2oGoSvr67Z7pX4wfLoeGjLoYh66lUyVJErYi0ugjNug+BhXqz1Fsp4aUYl4oNI6Hj+7b6kYwg48Xgu5GYWDBXMgXLqMIxBNXF+YtEbWVcldVdknGTBMLTqRLvZ4c9VpgwdH74ANU2bYPFSP63VajUSRO3t1PNtC65GSm1Nhqas7FIihPntgnarmnou5Ml+6kMxGumrYLe4ABZykf1/brgQGvrHy4KvsZ+WgW1UzSxE7G/HVxz+FDq+0sc854jEcOnKYSuIkT4itb4YmWSCp9Ag7B6qaq49blNVtwMizztIf5C2zzoimx6UcLICktnGGsGHysa4gHjcqpMg+EDABQExpjdkUr/cauEuRbzO6YvKIrQvgoAxz/T6bB65px2Kwob7HPVBa9zzSnbkchlF0KM4QAG20txGOE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM3MjkxNjUsInByb2ZpbGVJZCI6IjFiYTJkMTZmM2QxMTRhMWZiMjE0MDllODM5MDZlNmI1IiwicHJvZmlsZU5hbWUiOiJOb29iY3JldyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDU0MDEwYTMzOGI0YTJhZDRhNDZmN2Y1OTZmMzQ2ODljNzNhMmVkN2JlMjdiZmQzYTM4MzA3NWNlNjRjZDdhNSJ9fX0="}]},Name:"Noobcrew"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP10","TriviaMobP10A"]}
execute if entity @e[scores={Question_P10=9}] run summon skeleton 922 62.5 993 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[225f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ba2d16f-3d11-4a1f-b214-09e83906e6b5",Properties:{textures:[{Signature:"Dtb/009jc8Jln6gjjWt5I4b9K4cvsGuHpWHyP9yk7+6CDXSwfsuCCdFT/3kS3i9RXOGwa61lGaFwPBRwT6+Lr8iuGqYPrzxUqsJvHSw18KMbSHrp2azfW7L6QfUIApwZ6sz6rW3LlbmFpjVdmdsC2/sZvH3F86ZNd5Wiu+f6FtuoQKyCZegrayC17EpY0enk6Z9rjIhJjJIWXKNUlrQtBOnJ8wDDvwM5n9/K78kX6WKWAlrg2gh+KB4SoObx1sUIZHCYTd1XPau2oGoSvr67Z7pX4wfLoeGjLoYh66lUyVJErYi0ugjNug+BhXqz1Fsp4aUYl4oNI6Hj+7b6kYwg48Xgu5GYWDBXMgXLqMIxBNXF+YtEbWVcldVdknGTBMLTqRLvZ4c9VpgwdH74ANU2bYPFSP63VajUSRO3t1PNtC65GSm1Nhqas7FIihPntgnarmnou5Ml+6kMxGumrYLe4ABZykf1/brgQGvrHy4KvsZ+WgW1UzSxE7G/HVxz+FDq+0sc854jEcOnKYSuIkT4itb4YmWSCp9Ag7B6qaq49blNVtwMizztIf5C2zzoimx6UcLICktnGGsGHysa4gHjcqpMg+EDABQExpjdkUr/cauEuRbzO6YvKIrQvgoAxz/T6bB65px2Kwob7HPVBa9zzSnbkchlF0KM4QAG20txGOE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM3MjkxNjUsInByb2ZpbGVJZCI6IjFiYTJkMTZmM2QxMTRhMWZiMjE0MDllODM5MDZlNmI1IiwicHJvZmlsZU5hbWUiOiJOb29iY3JldyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDU0MDEwYTMzOGI0YTJhZDRhNDZmN2Y1OTZmMzQ2ODljNzNhMmVkN2JlMjdiZmQzYTM4MzA3NWNlNjRjZDdhNSJ9fX0="}]},Name:"Noobcrew"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP10","TriviaMobP10B"]}
execute if entity @e[scores={Question_P10=14}] run summon skeleton 922 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[315f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ba2d16f-3d11-4a1f-b214-09e83906e6b5",Properties:{textures:[{Signature:"Dtb/009jc8Jln6gjjWt5I4b9K4cvsGuHpWHyP9yk7+6CDXSwfsuCCdFT/3kS3i9RXOGwa61lGaFwPBRwT6+Lr8iuGqYPrzxUqsJvHSw18KMbSHrp2azfW7L6QfUIApwZ6sz6rW3LlbmFpjVdmdsC2/sZvH3F86ZNd5Wiu+f6FtuoQKyCZegrayC17EpY0enk6Z9rjIhJjJIWXKNUlrQtBOnJ8wDDvwM5n9/K78kX6WKWAlrg2gh+KB4SoObx1sUIZHCYTd1XPau2oGoSvr67Z7pX4wfLoeGjLoYh66lUyVJErYi0ugjNug+BhXqz1Fsp4aUYl4oNI6Hj+7b6kYwg48Xgu5GYWDBXMgXLqMIxBNXF+YtEbWVcldVdknGTBMLTqRLvZ4c9VpgwdH74ANU2bYPFSP63VajUSRO3t1PNtC65GSm1Nhqas7FIihPntgnarmnou5Ml+6kMxGumrYLe4ABZykf1/brgQGvrHy4KvsZ+WgW1UzSxE7G/HVxz+FDq+0sc854jEcOnKYSuIkT4itb4YmWSCp9Ag7B6qaq49blNVtwMizztIf5C2zzoimx6UcLICktnGGsGHysa4gHjcqpMg+EDABQExpjdkUr/cauEuRbzO6YvKIrQvgoAxz/T6bB65px2Kwob7HPVBa9zzSnbkchlF0KM4QAG20txGOE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM3MjkxNjUsInByb2ZpbGVJZCI6IjFiYTJkMTZmM2QxMTRhMWZiMjE0MDllODM5MDZlNmI1IiwicHJvZmlsZU5hbWUiOiJOb29iY3JldyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDU0MDEwYTMzOGI0YTJhZDRhNDZmN2Y1OTZmMzQ2ODljNzNhMmVkN2JlMjdiZmQzYTM4MzA3NWNlNjRjZDdhNSJ9fX0="}]},Name:"Noobcrew"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP10","TriviaMobP10C"]}
execute if entity @e[scores={Question_P10=19}] run summon skeleton 928 62.5 987 {PersistenceRequired:1b,Invulnerable:1b,Rotation:[45f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1ba2d16f-3d11-4a1f-b214-09e83906e6b5",Properties:{textures:[{Signature:"Dtb/009jc8Jln6gjjWt5I4b9K4cvsGuHpWHyP9yk7+6CDXSwfsuCCdFT/3kS3i9RXOGwa61lGaFwPBRwT6+Lr8iuGqYPrzxUqsJvHSw18KMbSHrp2azfW7L6QfUIApwZ6sz6rW3LlbmFpjVdmdsC2/sZvH3F86ZNd5Wiu+f6FtuoQKyCZegrayC17EpY0enk6Z9rjIhJjJIWXKNUlrQtBOnJ8wDDvwM5n9/K78kX6WKWAlrg2gh+KB4SoObx1sUIZHCYTd1XPau2oGoSvr67Z7pX4wfLoeGjLoYh66lUyVJErYi0ugjNug+BhXqz1Fsp4aUYl4oNI6Hj+7b6kYwg48Xgu5GYWDBXMgXLqMIxBNXF+YtEbWVcldVdknGTBMLTqRLvZ4c9VpgwdH74ANU2bYPFSP63VajUSRO3t1PNtC65GSm1Nhqas7FIihPntgnarmnou5Ml+6kMxGumrYLe4ABZykf1/brgQGvrHy4KvsZ+WgW1UzSxE7G/HVxz+FDq+0sc854jEcOnKYSuIkT4itb4YmWSCp9Ag7B6qaq49blNVtwMizztIf5C2zzoimx6UcLICktnGGsGHysa4gHjcqpMg+EDABQExpjdkUr/cauEuRbzO6YvKIrQvgoAxz/T6bB65px2Kwob7HPVBa9zzSnbkchlF0KM4QAG20txGOE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYxMDM3MjkxNjUsInByb2ZpbGVJZCI6IjFiYTJkMTZmM2QxMTRhMWZiMjE0MDllODM5MDZlNmI1IiwicHJvZmlsZU5hbWUiOiJOb29iY3JldyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDU0MDEwYTMzOGI0YTJhZDRhNDZmN2Y1OTZmMzQ2ODljNzNhMmVkN2JlMjdiZmQzYTM4MzA3NWNlNjRjZDdhNSJ9fX0="}]},Name:"Noobcrew"}}}],Silent:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Team:Trivia,Tags:["TriviaMob","TriviaMobP10","TriviaMobP10D"]}

execute if entity @e[tag=TriviaMobP10] run scoreboard players set @e[scores={Question_P10=3}] Question_P10 19
execute if entity @e[scores={Question_P10=19}] run tellraw @a[tag=P10] ["",{"text":" Q: When it comes to map making pioneers, Noobcrew is one of the most successful. Which popular custom Minecraft map did he create?","color":"green","bold":false}]

execute if entity @e[tag=TriviaMobP10A,scores={TriviaMobAge=40..}] at @e[tag=TriviaMobP10A] unless entity @e[tag=TriviaAECP10A] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP10","TriviaAECP10A"],Duration:2147483647,CustomName:"{\"text\":\"Ant Farm Survival\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP10B,scores={TriviaMobAge=35..}] at @e[tag=TriviaMobP10B] unless entity @e[tag=TriviaAECP10B] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP10","TriviaAECP10B"],Duration:2147483647,CustomName:"{\"text\":\"The Building Game\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP10C,scores={TriviaMobAge=30..}] at @e[tag=TriviaMobP10C] unless entity @e[tag=TriviaAECP10C] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP10","TriviaAECP10C"],Duration:2147483647,CustomName:"{\"text\":\"Skyblock\",\"color\":\"white\"}",CustomNameVisible:true}
execute if entity @e[tag=TriviaMobP10D,scores={TriviaMobAge=25..}] at @e[tag=TriviaMobP10D] unless entity @e[tag=TriviaAECP10D] run summon area_effect_cloud ~ ~1.7 ~ {Tags:["TriviaAEC","TriviaAECP10","TriviaAECP10D"],Duration:2147483647,CustomName:"{\"text\":\"Terra Swoop Force\",\"color\":\"white\"}",CustomNameVisible:true}

execute if entity @e[tag=TriviaAECP10A] as @e[tag=TriviaMobP10A,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP10B] as @e[tag=TriviaMobP10B,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP10C] as @e[tag=TriviaMobP10C,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[tag=TriviaAECP10D] as @e[tag=TriviaMobP10D,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}

execute if entity @e[tag=TriviaMobP10A,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP10A]
execute if entity @e[tag=TriviaMobP10B,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP10B]
execute if entity @e[tag=TriviaMobP10C,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP10C]
execute if entity @e[tag=TriviaMobP10D,nbt={HurtTime:10s}] run kill @e[tag=TriviaAECP10D]

execute unless entity @e[tag=TriviaMobP10A] run kill @e[tag=TriviaAECP10A]
execute unless entity @e[tag=TriviaMobP10B] run kill @e[tag=TriviaAECP10B]
execute unless entity @e[tag=TriviaMobP10C] run kill @e[tag=TriviaAECP10C]
execute unless entity @e[tag=TriviaMobP10D] run kill @e[tag=TriviaAECP10D]

# IF WRONG
execute if entity @e[tag=TriviaMobP10A,nbt={HurtTime:10s}] run teleport @a 770 6 981
execute if entity @e[tag=TriviaMobP10B,nbt={HurtTime:10s}] run teleport @a 770 6 951
execute if entity @e[tag=TriviaMobP10D,nbt={HurtTime:10s}] run teleport @a 663 45 905


# IF CORRECT
execute if entity @e[tag=TriviaMobP10C,nbt={HurtTime:10s}] run scoreboard objectives add QP10_Correct dummy
scoreboard players add @e[tag=MainTriviaAEC] QP10_Correct 1

execute if entity @e[scores={QP10_Correct=1}] run setblock 925 65 990 air
execute if entity @e[scores={QP10_Correct=1}] run kill @e[tag=TriviaAECP10]
execute if entity @e[scores={QP10_Correct=1}] run kill @e[tag=PreLoadStandP10]
execute if entity @e[scores={QP10_Correct=1}] as @e[tag=TriviaMobP10] run data merge entity @s {NoAI:false}
execute if entity @e[scores={QP10_Correct=1}] as @e[tag=TriviaMobP10] at @s run teleport @s ~ 0 ~
execute if entity @e[scores={QP10_Correct=20}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1 1
execute if entity @e[scores={QP10_Correct=22}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.1 1
execute if entity @e[scores={QP10_Correct=23}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={QP10_Correct=24}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.3 1
execute if entity @e[scores={QP10_Correct=25}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.4 1
execute if entity @e[scores={QP10_Correct=26}] at @a[tag=P10] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={QP10_Correct=30}] run playsound entity.firework_rocket.launch master @a 925 64 990 1 1 0

execute if entity @e[scores={QP10_Correct=32}] run title @a[tag=P10] times 1 80 1
execute if entity @e[scores={QP10_Correct=32}] run title @a[tag=P10] title {"text":"CORRECT!","bold":false,"color":"green"}
execute if entity @e[scores={QP10_Correct=32}] run title @a[tag=P10] subtitle {"text":"All Community Trivia Complete!", "color":"white"}
execute if entity @e[scores={QP10_Correct=32}] run scoreboard players add Correct TriviaTally 1

execute if entity @e[scores={QP10_Correct=35}] run tellraw @a[tag=P10] ["",{"text":" (✔) CORRECT: \"Skyblock\", created by Noobcrew, is one of the most recognizable Minecraft maps ever. You can still download the original version of this massively popular but simplistic survival challenge "},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/maps/1473433-surv-skyblock"}},{"text":"."}]
#execute if entity @e[scores={QP10_Correct=35}] run fill 932 63 1004 932 63 1004 air replace purple_concrete
#execute if entity @e[scores={QP10_Correct=35}] run setblock 932 64 1010 stone_button[face=floor,facing=north]
#execute if entity @e[scores={QP10_Correct=35}] at @a[tag=P10] run playsound entity.player.levelup master @a
execute if entity @e[scores={QP10_Correct=35..}] run scoreboard objectives add FinalPurple dummy

execute if entity @e[scores={QP10_Correct=35..}] run scoreboard objectives remove QP10_Correct






# SPAWNPOINT TELEPORTS
# P2
execute align x align y align z run teleport @a[x=977,y=70,z=995,dx=0,dy=1,dz=0] 977 67 1000 180 0

# P4
execute align x align y align z run teleport @a[x=964,y=73,z=994,dx=0,dy=1,dz=0] 964 67 1000 180 0

# P6
execute align x align y align z run teleport @a[x=964,y=73,z=987,dx=0,dy=1,dz=0] 951 67 1000 180 0

# P8
execute align x align y align z run teleport @a[x=938,y=72,z=995,dx=0,dy=1,dz=0] 938 67 1000 180 0

# P10
execute align x align y align z run teleport @a[x=938,y=72,z=985,dx=0,dy=1,dz=0] 925 67 1000 180 0