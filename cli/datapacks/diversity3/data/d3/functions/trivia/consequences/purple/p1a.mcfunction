####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 25 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 984 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P1A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=880,y=54,z=1007,dx=24,dy=24,dz=30] add WrongAnswer

scoreboard objectives add Incorrect_P1A dummy
execute align x align y align z if entity @a[x=880,y=54,z=1007,dx=24,dy=24,dz=30] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P1A 1

execute if entity @e[scores={Incorrect_P1A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P1A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P1A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P1A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P1A=1}] run title @a subtitle {"text":"Diversity was not created by ColdFusion", "color":"white"}
execute if entity @e[scores={Incorrect_P1A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: But ColdFusion was part of the build team for D2 and D3. This room is taken right out of his first map \"Hero's Quest\" released way back in September 2011.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_P1A=1}] run setblock 887 66 1021 air
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 887 66 1021 lever[face=floor,facing=west,powered=false]

execute if entity @e[scores={Incorrect_P1A=1}] run setblock 888 66 1025 air
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 888 66 1025 lever[face=floor,facing=west,powered=true]
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 888 64 1025 redstone_wire[power=15]

execute if entity @e[scores={Incorrect_P1A=1}] run setblock 897 66 1018 air
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 897 66 1018 lever[face=floor,facing=west,powered=false]

execute if entity @e[scores={Incorrect_P1A=1}] run setblock 894 66 1028 air
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 894 66 1028 lever[face=floor,facing=west,powered=true]
execute if entity @e[scores={Incorrect_P1A=2}] run setblock 894 64 1028 redstone_wire[power=15]


execute if block 889 66 1014 oak_pressure_plate[powered=true] align x align y align z unless entity @e[x=887,y=64,z=1008,dx=0,dy=2,dz=7,tag=P1AZombie] run summon zombie 887 65 1008 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "07270730-7cf6-48f4-8850-11847f4d61a3", Properties: {textures: [{Signature: "E08RJkQu7JMPAg4f2vRm3JEI1AJt+AAqanlkzt9i4Uy50v6pJZ/GL5iIM5nUri7DMCRIAC3Wf0PdYT2r9OfRlmxFvMs286skw5ZeqUfs0itYV6b/Y06lf1Szy3M0sNnfQe38GszoyzG54ZNrlEAj8fCF/EniN8bdVSdKAHAnAu3w4DVHZ8zim1qAHfHx4PFoubTTv53xqO6ip+OexMXOdGdaPjB8iRIt5X9lVvtSE1fk6/xIEeyEGaANSIUSkDL7SniEQRcC3Kp/MCZ3xbxzy6SP1AAH7XRiXUUNkdFez5o9O9iU1ec+LTMDAVouBruBs3Go+FLmqhFDHBH8zPxzY0+LkgxNSh3wo3k0n0gS2KjEbjxSie8Oiq7e0IXASUu6ayAQ/RZZ/8zT6wI50KF79gvDCSeSU3xb4fNCblcEp55JmUGnv3/FcHEib/qHn4bLNjAxt5rQLiec+l16NFFhCcPlaQiZB9GUWO7Cpmo7iMwyQPAXpM59VD+KZkJTNJlGPGPTlHIVKJcLHfngafH0Hz45HYex/37GTulrvfphG03+h3P+Vl3ZGADlcj54OEViTxOShM+8l9RkIv50TwbX6sNT4Y4BcugC9vNAI/c4vRt9qg9rQOtOhSqf1+InqwJOquysr/fhG3COvpvrOh6RjQ77lMDy2zEZ7Lx1dQgGmkc=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTg4Njg5NDksInByb2ZpbGVJZCI6IjA3MjcwNzMwN2NmNjQ4ZjQ4ODUwMTE4NDdmNGQ2MWEzIiwicHJvZmlsZU5hbWUiOiJDb2xkRnVzaW9uR2FtaW5nIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lMzFiNjhkNmIwODhiYjkxMGM2Zjc2NGU3MTM0YWYxZTdmZjA4YzYxNWM1YjM4OGNkYWYyYjgyODFjMGMxNzY0In19fQ=="}]}, Name: "ColdFusionGaming"}}}],Tags:[P1AZombie]}

execute align x align y align z as @e[tag=P1AZombie,x=887,y=64,z=1013,dx=0,dy=1,dz=0] run data merge entity @s {Motion:[0.0d,0.0d,0.08d]}
execute align x align y align z as @e[tag=P1AZombie,x=891,y=64,z=1018,dx=0,dy=1,dz=0] run data merge entity @s {Motion:[0.08d,0.0d,0.0d]}
execute align x align y align z as @e[tag=P1AZombie,x=894,y=64,z=1022,dx=0,dy=1,dz=0] run data merge entity @s {Motion:[0.0d,0.0d,0.08d]}
execute align x align y align z as @e[tag=P1AZombie,x=892,y=64,z=1025,dx=0,dy=1,dz=0] run data merge entity @s {Motion:[-0.08d,0.0d,0.0d]}


execute if entity @e[scores={Incorrect_P1A=80..}] if block 881 56 1035 stone_button[powered=true] run kill @e[tag=P1AZombie]
execute if entity @e[scores={Incorrect_P1A=80..}] if block 881 56 1035 stone_button[powered=true] run teleport @a[tag=WrongAnswer] 984 67 1000 0 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=880,y=54,z=1007,dx=24,dy=24,dz=30] run scoreboard objectives add P1A_End dummy
execute align x align y align z if entity @a[x=880,y=54,z=1007,dx=24,dy=24,dz=30] run scoreboard objectives remove P1A_End
execute align x align y align z unless entity @a[x=880,y=54,z=1007,dx=24,dy=24,dz=30] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P1A_End 1

execute if entity @e[scores={P1A_End=25..}] run clear @a
execute if entity @e[scores={P1A_End=25..}] run scoreboard objectives remove Incorrect_P1A
execute if entity @e[scores={P1A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P1A_End=25..}] run scoreboard objectives remove P1A_End