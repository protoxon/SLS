####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 29 2018 / SEPTEMBER 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 995

#scoreboard objectives setdisplay sidebar Incorrect_G5D
#scoreboard objectives setdisplay sidebar G5DWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G5D dummy
execute align x align y align z if entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G5D 1

execute if entity @e[scores={Incorrect_G5D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G5D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G5D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G5D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G5D=1}] run title @a subtitle {"text":"There are fewer than 8 infested blocks", "color":"white"}
execute if entity @e[scores={Incorrect_G5D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Let's see how well you fare against your decision...","color":"red","bold":false}]

#execute as @e[tag=G5DFish] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]
execute if entity @e[scores={Incorrect_G5D=650..}] run effect give @a[tag=WrongAnswer] strength 1 1 true

execute if entity @e[scores={Incorrect_G5D=1}] run scoreboard objectives remove G5DWin

execute if entity @e[scores={Incorrect_G5D=..10}] run kill @e[tag=G5DFish]
execute if entity @e[scores={Incorrect_G5D=..10}] run kill @e[tag=G5DCrystal]
execute if entity @e[scores={Incorrect_G5D=1}] run fill 1172 57 917 1170 77 919 barrier hollow
execute if entity @e[scores={Incorrect_G5D=1}] run setblock 1171 57 918 air

execute if entity @e[scores={Incorrect_G5D=1}] run kill @e[tag=G5DAS]

execute if entity @e[scores={Incorrect_G5D=1}] run summon armor_stand 1169.5 54.8 931.7 {Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures: [{Signature: "QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]}, Name: "AdamDJM"}},Count:1b}],DisabledSlots:2039583,Tags:["G5DAS"],Pose:{Head:[355f,0f,0f],LeftLeg:[269f,340f,0f],RightLeg:[268f,14f,0f],LeftArm:[200f,0f,20f],RightArm:[300f,0f,10f]}}

execute if entity @e[scores={Incorrect_G5D=1}] run summon armor_stand 1167.5 54.8 931.7 {Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "03b07a62-98e6-4fc4-8187-fb276d5a317c", Properties: {textures: [{Signature: "eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]}, Name: "qwertyuiopthepie"}},Count:1b}],DisabledSlots:2039583,Tags:["G5DAS"],Pose:{Head:[355f,0f,0f],LeftLeg:[269f,340f,0f],RightLeg:[268f,14f,0f],LeftArm:[280f,350f,0f],RightArm:[0f,0f,10f]}}

execute if entity @e[scores={Incorrect_G5D=180}] run summon end_crystal 1172.0 54.5 918.0 {Invulnerable:true, ShowBottom:false, Tags:["G5DCrystal"], BeamTarget:{X:1167,Y:70,Z:922}}
execute if entity @e[scores={Incorrect_G5D=180}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"In the North East corner, we have our Trivia Branch contender!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={Incorrect_G5D=350}] run kill @e[tag=G5DCrystal]
execute if entity @e[scores={Incorrect_G5D=350}] run tellraw @a ["",{"text":"<qwertyuiopthepie> ","color":"light_purple","bold":false},{"text":"And in the South West corner, weighing in at 8 Silverfish, it's your opponent!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={Incorrect_G5D=370}] run summon end_crystal 1164.0 54.5 926.0 {Invulnerable:true, ShowBottom:false, Tags:["G5DCrystal"], BeamTarget:{X:1168,Y:70,Z:921}}

execute if entity @e[scores={Incorrect_G5D=370}] run particle portal 1164 58 925 0.1 0.3 0.1 0.5 20 force @a
execute if entity @e[scores={Incorrect_G5D=370}] run playsound entity.enderman.teleport master @a 1164 58 925 0.5 1 0

execute if entity @e[scores={Incorrect_G5D=370}] run summon silverfish 1164 57 925 {Tags:["G5DFish"],Rotation:[225f,0f], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"], Passengers:[{id:"minecraft:silverfish",Rotation:[225f,0f],Tags:["G5DFish"]}]}]}]}]}]}]}]}

execute if entity @e[scores={Incorrect_G5D=370..371}] as @e[tag=G5DFish] run data merge entity @s {NoAI:true}
execute if entity @e[scores={Incorrect_G5D=490}] run kill @e[tag=G5DCrystal]

execute if entity @e[scores={Incorrect_G5D=540}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Now we want a clean fight. No funny business.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={Incorrect_G5D=640}] run execute at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={Incorrect_G5D=643}] run execute at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={Incorrect_G5D=646}] run execute at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={Incorrect_G5D=650}] run title @a title {"text":"FIGHT!","bold":false,"color":"white"}

execute if entity @e[scores={Incorrect_G5D=655}] run fill 1172 57 917 1170 77 919 air
execute if entity @e[scores={Incorrect_G5D=655}] as @e[tag=G5DFish] run data merge entity @s {NoAI: false}
execute if entity @e[scores={Incorrect_G5D=655}] run gamerule naturalRegeneration false


# FOR THE WIN
execute if entity @e[scores={Incorrect_G5D=625..}] unless entity @e[tag=G5DFish] run scoreboard objectives add G5DWin dummy
scoreboard players add @e[tag=MainTriviaAEC] G5DWin 1
execute if entity @e[scores={G5DWin=20}] at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={G5DWin=23}] at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={G5DWin=26}] at @a[tag=WrongAnswer] run playsound block.note_block.chime master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={G5DWin=50}] run teleport @a[tag=WrongAnswer] 1042 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives add G5D_End dummy
execute align x align y align z if entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives remove G5D_End
execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G5D_End 1

execute if entity @e[scores={G5D_End=25..}] run kill @e[tag=G5DFish]
execute if entity @e[scores={G5D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G5D_End=25..}] run clear @a
execute if entity @e[scores={G5D_End=25..}] run scoreboard objectives remove G5DWin
execute if entity @e[scores={G5D_End=25..}] run scoreboard objectives remove Incorrect_G5D
execute if entity @e[scores={G5D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G5D_End=25..}] run scoreboard objectives remove G5D_End


#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run kill @e[tag=G5DFish]
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run gamerule naturalRegeneration true
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives remove Incorrect_G5D
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives remove G5DWin
#clear @a[tag=!WrongAnswer]
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run clear @a
#execute align x align y align z unless entity @a[x=1155,y=54,z=909,dx=24,dy=24,dz=24] run setblock 43 19 46 clay
