####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 25 2018 / SEPTEMBER 30 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 984 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P1D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=876,y=51,z=1065,dx=28,dy=28,dz=28] add WrongAnswer

scoreboard objectives add Incorrect_P1D dummy
execute align x align y align z if entity @a[x=876,y=51,z=1065,dx=28,dy=28,dz=28] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P1D 1

execute if entity @e[scores={Incorrect_P1D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P1D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P1D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P1D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P1D=1}] run title @a subtitle {"text":"Diversity was not created by rsmalec", "color":"white"}
execute if entity @e[scores={Incorrect_P1D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Ron Smalec is legend in the map making community but he has never been apart of a Diversity build team. This build is taken straight out of his map \"Fear in a Handful of Dust\" from May 2011 for Minecraft 1.0. Now go get a handful of dust to get out of here.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_P1D=1}] run kill @e[tag=P1DPainting]
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 883 56 1088 {Facing: 2b, Invulnerable: false, Motive: "minecraft:bust", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 887 56 1088 {Facing: 2b, Invulnerable: false, Motive: "minecraft:plant", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 891 56 1084 {Facing: 1b, Invulnerable: false, Motive: "minecraft:pool", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 891 56 1081 {Facing: 1b, Invulnerable: false, Motive: "minecraft:bomb", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 891 56 1076 {Facing: 1b, Invulnerable: false, Motive: "minecraft:aztec", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 891 56 1072 {Facing: 1b, Invulnerable: false, Motive: "minecraft:sunset", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 886 56 1071 {Facing: 3b, Invulnerable: false, Motive: "minecraft:match", Tags:["P1DPainting"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon painting 889 60 1069 {Facing: 0b, Invulnerable: false, Motive: "minecraft:creebet", Tags:["P1DPainting"]}

execute if entity @e[scores={Incorrect_P1D=1}] run kill @e[tag=P1DAS]
execute if entity @e[scores={Incorrect_P1D=5}] run summon armor_stand 879 53.26 1076 {Invisible:true,ShowArms:true,NoGravity:true,Rotation:[450f,0f],Pose:{RightArm:[180f,270f,180f]},Tags:["P1DAS","P1DDustAS1"],HandItems:[{id:"minecraft:redstone",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true,DisabledSlots:1973790}

kill @e[tag=P1DDustAS1,nbt=!{HandItems:[{id:"minecraft:redstone"}]}]

execute if entity @e[scores={Incorrect_P1D=1}] run setblock 881 55 1070 air
execute if entity @e[scores={Incorrect_P1D=5}] run setblock 881 55 1070 furnace[facing=east]{Items: [{Slot: 0b, id: "minecraft:redstone", Count: 1b, tag: {display: {Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}]}

execute if entity @e[scores={Incorrect_P1D=1}] run kill @e[tag=P1DWolf]
execute if entity @e[scores={Incorrect_P1D=5}] run summon wolf 884.0 59.6 1088 {NoAI:true,Rotation:[90f,0f],Sitting:true,Invulnerable:true,Age:0,Silent:true,Tags:["P1DWolf"]}
execute if entity @e[scores={Incorrect_P1D=5}] run summon armor_stand 883.6 59.33 1088 {NoGravity:true,Invisible:true,Small:true,Rotation:[90f,0f],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b510224e-d304-45a3-ac6a-bcd4ce4f34b9",Properties:{textures:[{Signature:"N9WBu6O4BdsABhoUVvl0DISTCijUNmQA6aNZyVAOOnzbgEWYhBpTGan9CpeglDBgQEw7GMGVCtoo1Mboh1Eq1Xf2Kg4IfVdUrsQmatmSy2fhmK8EHnvrcwQzTNG9c3zJAIvCp0LmzM513QfCQrUDx6nmhDIqgzMaiWrw2Y5mgNH8k9GAsU4IptF+QI6JH/xz13mxRNDRLrr2+OHqpgF+Xr60HsymmrsAThzGsqrqIpg5z96joioc4JqRjcqLH/LRJN03j4X/k0PWpwiBRZr1l9laqN5IaezMhwh4wiDTN8hkLmkC3UozMq74ruzotVjYZT+T8f1wevfQS4Ff8BVXlngi8pSo3Ei8dGIiFQTDA/uaQSjikfd9p109uO1Co6sJv7KO2fyvm55iUTkvYzG55qIN8x/U6U9y96b+mjxcuhyrSvJW5s+BDRAFBfPAa/eOBcER53vaVfbNdBnNbldwMsU8V8sddOCRCOSXtmNsNJ836Och5mxuq6LVgj+De0UWI1bDnqRQKaNpFT10A+xGyRStz8UmjU9fruWHxU53Hj6BJLnjtrbBCX9cCxkHSVfnrxJ1HEyXHPJXUm86Y+Hg/aw5Fd0lzT2pYrsHGJ9d+XvWSecJD0GeI04bfYI6TEBZ2rmapgUAqHs+8dl8xsaazmZM64omWrmz6P1x7/nCH0g=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTk5MjM5MTAsInByb2ZpbGVJZCI6ImI1MTAyMjRlZDMwNDQ1YTNhYzZhYmNkNGNlNGYzNGI5IiwicHJvZmlsZU5hbWUiOiJyc21hbGVjIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lZDYxODRlOWQwNWI0MzUxNzY4ZTM3Mjg5ZGRiYTMwZTZkNWIwNzA4OGZkODVlZWY3OTY5YTA5Y2Y5OGE5ZTVhIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85NTNjYWM4Yjc3OWZlNDEzODNlNjc1ZWUyYjg2MDcxYTcxNjU4ZjIxODBmNTZmYmNlOGFhMzE1ZWE3MGUyZWQ2In19fQ=="}]},Name:"rsmalec"}}}],Marker:true,Invulnerable:true,Tags:["P1DAS","P1DRonHead"]}

execute if entity @e[scores={Incorrect_P1D=5}] run summon armor_stand 883.22 59.715 1088.53 {Invisible:true,ShowArms:true,NoGravity:true,Rotation:[180f,0f],Small:true,Pose:{RightArm:[180f,270f,180f]},Tags:["P1DAS","P1DDustAS2"],HandItems:[{id:"minecraft:redstone",Count:1b,tag:{display:{Lore:['{"text":"1 of 3","italic":"true","color":"dark_purple"}']}}}],Invulnerable:true,DisabledSlots:1973790}
kill @e[tag=P1DDustAS2,nbt=!{HandItems:[{id:"minecraft:redstone"}]}]


execute if entity @e[scores={Incorrect_P1D=80..}] unless block 881 55 1070 furnace[facing=east]{Items:[{Slot: 0b, id: "minecraft:redstone"}]} unless entity @e[tag=P1DDustAS1,nbt={HandItems:[{id:"minecraft:redstone"}]}] unless entity @e[tag=P1DDustAS2,nbt={HandItems:[{id:"minecraft:redstone"}]}] run teleport @a[tag=WrongAnswer] 984 67 1000 0 0

# REALMS UPDATE REQ FOR E10+
data merge block 881 58 1082 {Text1:'{"text":"Sprites"}',Text2:'{"text":"Shot... 5c"}',Text3:'{"text":"Glass... 10c"}',Text4:'{"text":"Pint... 1s"}',Color:"black"}
data merge block 881 58 1081 {Text1:'{"text":"Ginger Ale"}',Text2:'{"text":"Shot... 5c"}',Text3:'{"text":"Glass... 10c"}',Text4:'{"text":"Pint... 1s"}',Color:"black"}
data merge block 881 58 1080 {Text1:'{"text":"Ron\'s Special"}',Text2:'{"text":" "}',Text3:'{"text":"Glass... 5c"}',Text4:'{"text":"Bottle... 12c"}',Color:"black"}
data merge block 881 58 1079 {Text1:'{"text":"Dirty milk"}',Text2:'{"text":"Shot... 6c"}',Text3:'{"text":"Glass... 12c"}',Text4:'{"text":" "}',Color:"black"}
data merge block 881 58 1078 {Text1:'{"text":"Cactus juice"}',Text2:'{"text":" "}',Text3:'{"text":"Glass... 3c"}',Text4:'{"text":" "}',Color:"black"}
data merge block 881 58 1077 {Text1:'{"text":"Sasparilla"}',Text2:'{"text":" "}',Text3:'{"text":"Glass... 2c"}',Text4:'{"text":" "}',Color:"black"}





# END SAFEGUARD
execute align x align y align z unless entity @a[x=876,y=51,z=1065,dx=28,dy=28,dz=28] run scoreboard objectives add P1D_End dummy
execute align x align y align z if entity @a[x=876,y=51,z=1065,dx=28,dy=28,dz=28] run scoreboard objectives remove P1D_End
execute align x align y align z unless entity @a[x=876,y=51,z=1065,dx=28,dy=28,dz=28] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P1D_End 1

execute if entity @e[scores={P1D_End=25..}] run clear @a
execute if entity @e[scores={P1D_End=25..}] run scoreboard objectives remove Incorrect_P1D
execute if entity @e[scores={P1D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P1D_End=25..}] run scoreboard objectives remove P1D_End