####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 29 2018 / SEPTEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 73 995

#scoreboard objectives setdisplay sidebar Incorrect_P8D
#scoreboard objectives setdisplay sidebar P8DRound
#scoreboard objectives setdisplay sidebar P8DTimer
#scoreboard objectives setdisplay sidebar P8DVillagerWin
#scoreboard objectives setdisplay sidebar P8DZombieWin
#scoreboard objectives setdisplay sidebar P8DScore
#scoreboard objectives setdisplay sidebar P8DMobTotal
#scoreboard objectives setdisplay sidebar P8DTie

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=54,z=849,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P8D dummy
execute align x align y align z if entity @a[x=788,y=54,z=849,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P8D 1

execute if entity @e[scores={Incorrect_P8D=1}] run scoreboard objectives remove P8DMobTotal
execute if entity @e[scores={Incorrect_P8D=1}] run scoreboard objectives remove P8DScore
execute if entity @e[scores={Incorrect_P8D=1}] run scoreboard objectives remove P8DTie

execute if entity @e[scores={Incorrect_P8D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P8D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P8D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P8D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8D=1}] run title @a subtitle {"text":"X wasn't the first LP", "color":"white"}
execute if entity @e[scores={Incorrect_P8D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: X's first adventure video was posted August 4, 2010. But someone was earlier. How about some Xs and Os?","color":"red"}]
execute if entity @e[scores={Incorrect_P8D=130}] run title @a times 1 40 1
execute if entity @e[scores={Incorrect_P8D=130}] run title @a title {"text":"Round 1","bold":false,"color":"red"}

execute if entity @e[scores={Incorrect_P8D=1}] run fill 796 56 857 804 56 865 air
execute if entity @e[scores={Incorrect_P8D=1}] run kill @e[tag=P8DAEC]
execute if entity @e[scores={Incorrect_P8D=1}] as @e[tag=P8DMob] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P8D=5}] run kill @e[tag=P8DMob]
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 804 56 865 {Tags:["P8DYellowAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 800 56 865 {Tags:["P8DOrangeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 796 56 865 {Tags:["P8DPurpleAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 804 56 861 {Tags:["P8DBrownAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 800 56 861 {Tags:["P8DWhiteAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 796 56 861 {Tags:["P8DGreenAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 804 56 857 {Tags:["P8DBlackAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 800 56 857 {Tags:["P8DLimeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] run summon area_effect_cloud 796 56 857 {Tags:["P8DLightBlueAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={Incorrect_P8D=130}] at @e[tag=P8DAEC] run setblock ~ ~ ~ stone_button[face=floor,facing=south]

execute at @e[tag=P8DAEC] if block ~ ~ ~ stone_button[powered=true] run setblock ~ ~ ~ structure_void
execute at @e[tag=P8DAEC] if block ~ ~ ~ structure_void run fill 796 56 857 804 56 865 air replace stone_button
execute as @e[tag=P8DYellowAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DYellowVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DOrangeAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DOrangeVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DPurpleAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DPurpleVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DBrownAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DBrownVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DWhiteAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DWhiteVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DGreenAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DGreenVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DBlackAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DBlackVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DLimeAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DLimeVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DLightBlueAEC] at @s if block ~ ~ ~ structure_void run summon villager ~ ~20 ~ {Age:-9999999,Invulnerable:true,Profession:5,NoAI:false,ArmorItems:[{},{},{},{id:"minecraft:white_banner",Count:1b, tag:{BlockEntityTag: {Patterns: [{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}}}],Tags:["P8DVillager","P8DLightBlueVillager","P8DMob","P8DStatueMob"]}
execute as @e[tag=P8DAEC] at @s if block ~ ~ ~ structure_void run scoreboard objectives add P8DTimer dummy
execute as @e[tag=P8DAEC] at @s if block ~ ~ ~ structure_void run kill @s

execute align x align y align z as @e[tag=P8DMob] at @s if block ~ ~-1 ~ air run data merge entity @s {NoAI:false}
execute align x align y align z as @e[tag=P8DStatueMob,x=796,y=56,z=857,dx=8,dy=0,dz=8,nbt={OnGround:1b}] run data merge entity @s {NoAI:true}

execute as @e[tag=P8DMob,nbt={NoAI:1b}] at @s run teleport @s ^ ^ ^ facing entity @p[tag=WrongAnswer]
execute as @e[tag=P8DMob,nbt={NoAI:1b}] at @s run teleport @s ~ ~ ~ ~ 0


execute if entity @e[scores={Incorrect_P8D=1}] run scoreboard objectives add P8DRound dummy
execute if entity @e[scores={Incorrect_P8D=1}] run scoreboard players set @e[tag=MainTriviaAEC] P8DRound 1

# LOGIC
scoreboard players add @e[tag=MainTriviaAEC] P8DTimer 1
execute if entity @e[scores={P8DTimer=100..}] at @e[tag=P8DAEC] run setblock ~ ~ ~ stone_button[face=floor,facing=south]
execute if entity @e[scores={P8DTimer=100..}] run scoreboard objectives remove P8DTimer

#execute as @e[tag=P8DMob] run data merge entity @s {Silent:true}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}

# ROUND 1 -> RANDOM
#execute if entity @e[scores={P8DRound=1,P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] run tag @e[tag=P8DAEC,sort=random,limit=1] add P8DRandomAEC
#execute at @e[tag=P8DYellowAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DYellowZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DOrangeAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DOrangeZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DPurpleAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DPurpleZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DBrownAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBrownZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DWhiteAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DGreenAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DGreenZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DBlackAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBlackZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DLimeAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLimeZombie","P8DMob","P8DStatueMob"]}
#execute at @e[tag=P8DLightBlueAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLightBlueZombie","P8DMob","P8DStatueMob"]}
#tag @e[tag=P8DAEC] remove P8DRandomAEC



# LOGIC
execute if entity @e[scores={P8DRound=2}] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DRound=2}] at @e[tag=P8DWhiteAEC] run setblock ~ ~ ~ air
execute if entity @e[scores={P8DRound=2}] run kill @e[tag=P8DWhiteAEC] 

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DOrangeZombie] at @e[tag=P8DPurpleAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DPurpleZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DPurpleZombie] at @e[tag=P8DOrangeAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DOrangeZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DOrangeZombie] if entity @e[tag=P8DPurpleZombie] at @e[tag=P8DYellowAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DYellowZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DBrownZombie] at @e[tag=P8DBlackAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBlackZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBrownZombie] if entity @e[tag=P8DBlackZombie] at @e[tag=P8DYellowAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DYellowZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DBlackZombie] at @e[tag=P8DBrownAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBrownZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBrownZombie] if entity @e[tag=P8DWhiteZombie] at @e[tag=P8DGreenAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DGreenZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DGreenZombie] at @e[tag=P8DBrownAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBrownZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBrownZombie] if entity @e[tag=P8DGreenZombie] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DOrangeZombie] if entity @e[tag=P8DWhiteZombie] at @e[tag=P8DLimeAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLimeZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DLimeZombie] at @e[tag=P8DOrangeAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DOrangeZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DOrangeZombie] if entity @e[tag=P8DLimeZombie] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBlackZombie] if entity @e[tag=P8DLimeZombie] at @e[tag=P8DLightBlueAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLightBlueZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DLimeZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DBlackAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBlackZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBlackZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DLimeAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLime","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DPurpleZombie] if entity @e[tag=P8DGreenZombie] at @e[tag=P8DLightBlueAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLightBlueZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DGreenZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DPurpleAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DPurpleZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DPurpleZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DGreenAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DGreenZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DWhiteZombie] at @e[tag=P8DLightBlueAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLightBlueZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DYellowAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DYellowZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DLightBlueZombie] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}

execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBlackZombie] if entity @e[tag=P8DWhiteZombie] at @e[tag=P8DPurpleAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DPurpleZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DPurpleZombie] at @e[tag=P8DBlackAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBlackZombie","P8DMob","P8DStatueMob"]}
execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] if entity @e[tag=P8DBlackZombie] if entity @e[tag=P8DPurpleZombie] at @e[tag=P8DWhiteAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}


execute if entity @e[scores={P8DTimer=60}] unless entity @e[tag=P8DSingleZombie] run tag @e[tag=P8DAEC,sort=random,limit=1] add P8DRandomAEC
execute at @e[tag=P8DYellowAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DYellowZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DOrangeAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DOrangeZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DPurpleAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DPurpleZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DBrownAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBrownZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DWhiteAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DWhiteZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DGreenAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DGreenZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DBlackAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DBlackZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DLimeAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLimeZombie","P8DMob","P8DStatueMob"]}
execute at @e[tag=P8DLightBlueAEC,tag=P8DRandomAEC] run summon zombie ~ ~20 ~ {IsBaby:true,NoAI:false,Tags:["P8DSingleZombie","P8DZombie","P8DLightBlueZombie","P8DMob","P8DStatueMob"]}

# MASTER ENTITY DATA
execute as @e[tag=P8DZombie,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:player_head"}]}] run data merge entity @s {CustomName:"{\"text\":\"X\",\"color\":\"white\"}",CustomNameVisible:true,IsBaby:true,Invulnerable:true,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "2020946e-7494-42fb-b805-aa1ba98b5e65", Properties: {textures: [{Signature: "fYBQuRPh5d08bZdPkF3BEBEDfNFTIgYqifd8M74i3p4CHJ7FZ9ZfPtgwV7XgMxxHKNm/XDUwZSGVLKJ89DijIuPHqjBAHuAV2T7GF/Zy3h8s1wn6GZtupJqHgmuCwzNJBbs3oEovoV8EZcM2AhO+EbSvyw4f6Nz9MlzqHcbW2xJcW6cMAm378gLVsHcgob7/j8VfV483nudhC5cFlagYLymn0d4QZtRkusI7T7Ys77XIwBJrhqNkAbpxnAJmLyWuB9bXrLBvv8zdzwr5u6qbSHeKg5e4ivAKv8y89zoSoBaLACm0h2ICXg2ydTit6LvyNCjTLqwEldMi2bDZP43VIafHFikyjuJ3B7L5Is6YJQoNTiSFs/xtzlxbU7Rltqc84+vsdrBDuF8+7A3Gv2MI3IY0FZb2YjODCcSS+IseO5PodcpVjILw1xArOVZpYBXvAMKEv/6Xv9a0pL0AP3vTyapqIsrXEm8fTINwkXPPh2AXNVtbH05E3ma9N4KsjZRwvYCdG0FGQJix2Qf7MV1MNb0ZrhLSfyC9D+nOw+LZ9mg7YJkfWXdqD0zBqVMEpsfVDzM1sthe4VL5qiVukj67HD4FW1EdKKRHLK+85Jyt2SwwPmSEm0fisz3v2FpJFoAMxMOoPMJlhZJyT1p74rAbgj5ZK8bBs/V+ykVlkbl4Zs4=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0NzgyNzIsInByb2ZpbGVJZCI6IjIwMjA5NDZlNzQ5NDQyZmJiODA1YWExYmE5OGI1ZTY1IiwicHJvZmlsZU5hbWUiOiJkYXZpZHI2NCIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTE2MmJhNzczNWQ0ZTM0NTk5ZTM1YmExMzMxNzNlOGY3Y2UwZGM2MzBkMDRlZjFmMjg0N2E0YTk4MzU2NWQ0ZSJ9fX0="}]}, Name: "davidr64"}}}]}

execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DYellowZombie] run kill @e[tag=P8DYellowAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DOrangeZombie] run kill @e[tag=P8DOrangeAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DPurpleZombie] run kill @e[tag=P8DPurpleAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DBrownZombie] run kill @e[tag=P8DBrownAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DWhiteZombie] run kill @e[tag=P8DWhiteAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DGreenZombie] run kill @e[tag=P8DGreenAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DBlackZombie] run kill @e[tag=P8DBlackAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DLimeZombie] run kill @e[tag=P8DLimeAEC]
execute if entity @e[scores={Incorrect_P8D=80..}] if entity @e[tag=P8DLightBlueZombie] run kill @e[tag=P8DLightBlueAEC]
tag @e[tag=P8DSingleZombie] remove P8DSingleZombie


# ROUND WINS
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DYellowVillager] if entity @e[tag=P8DOrangeVillager] if entity @e[tag=P8DPurpleVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DBrownVillager] if entity @e[tag=P8DWhiteVillager] if entity @e[tag=P8DGreenVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DBlackVillager] if entity @e[tag=P8DLimeVillager] if entity @e[tag=P8DLightBlueVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DYellowVillager] if entity @e[tag=P8DBrownVillager] if entity @e[tag=P8DBlackVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DOrangeVillager] if entity @e[tag=P8DWhiteVillager] if entity @e[tag=P8DLimeVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DPurpleVillager] if entity @e[tag=P8DGreenVillager] if entity @e[tag=P8DLightBlueVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DYellowVillager] if entity @e[tag=P8DWhiteVillager] if entity @e[tag=P8DLightBlueVillager] run scoreboard objectives add P8DVillagerWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=2..}] unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DPurpleVillager] if entity @e[tag=P8DWhiteVillager] if entity @e[tag=P8DBlackVillager] run scoreboard objectives add P8DVillagerWin dummy

execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DOrangeZombie] if entity @e[tag=P8DPurpleZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DBrownZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DGreenZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DBlackZombie] if entity @e[tag=P8DLimeZombie] if entity @e[tag=P8DLightBlueZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DBrownZombie] if entity @e[tag=P8DBlackZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DOrangeZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DLimeZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DPurpleZombie] if entity @e[tag=P8DGreenZombie] if entity @e[tag=P8DLightBlueZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DYellowZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DLightBlueZombie] run scoreboard objectives add P8DZombieWin dummy
execute if entity @e[scores={Incorrect_P8D=80..}] unless entity @e[scores={P8DScore=..-2}] unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DPurpleZombie] if entity @e[tag=P8DWhiteZombie] if entity @e[tag=P8DBlackZombie] run scoreboard objectives add P8DZombieWin dummy

execute if entity @e[scores={Incorrect_P8D=80}] run scoreboard objectives add P8DScore dummy
execute if entity @e[scores={Incorrect_P8D=80}] run scoreboard players set @e[tag=MainTriviaAEC] P8DScore 0

scoreboard players add @e[tag=MainTriviaAEC] P8DVillagerWin 1
execute if entity @e[scores={P8DVillagerWin=1}] run scoreboard objectives remove P8DTimer
execute if entity @e[scores={P8DVillagerWin=1}] run kill @e[tag=P8DAEC]
execute if entity @e[scores={P8DVillagerWin=50}] at @e[tag=P8DVillager] run playsound entity.villager.yes master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={P8DVillagerWin=70}] run kill @e[tag=P8DZombie]
execute if entity @e[scores={P8DVillagerWin=114}] run scoreboard players add @e[tag=MainTriviaAEC] P8DScore 1
execute if entity @e[scores={P8DVillagerWin=115}] as @e[tag=P8DVillager] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P8DVillagerWin=125}] run kill @e[tag=P8DVillager]

scoreboard players set @e[scores={P8DVillagerWin=125,P8DRound=3}] P8DRound 4
scoreboard players set @e[scores={P8DVillagerWin=125,P8DRound=2}] P8DRound 3
scoreboard players set @e[scores={P8DVillagerWin=125,P8DRound=1}] P8DRound 2

execute if entity @e[scores={P8DVillagerWin=125,P8DRound=2,P8DScore=-1..1}] run title @a times 1 40 1
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=2,P8DScore=-1..1}] run title @a title {"text":"Round 2","bold":false,"color":"red"}
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=3,P8DScore=-1..1}] run title @a times 1 40 1
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=3,P8DScore=-1..1}] run title @a title {"text":"Final Round","bold":false,"color":"red"}

#execute if entity @e[scores={P8DVillagerWin=125}] run kill @e[tag=P8DMob]
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 804 56 865 {Tags:["P8DYellowAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 800 56 865 {Tags:["P8DOrangeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 796 56 865 {Tags:["P8DPurpleAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 804 56 861 {Tags:["P8DBrownAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 800 56 861 {Tags:["P8DWhiteAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 796 56 861 {Tags:["P8DGreenAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 804 56 857 {Tags:["P8DBlackAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 800 56 857 {Tags:["P8DLimeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] run summon area_effect_cloud 796 56 857 {Tags:["P8DLightBlueAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DVillagerWin=125}] at @e[tag=P8DAEC] run setblock ~ ~ ~ air
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=..3,P8DScore=-1..1}] at @e[tag=P8DAEC] run setblock ~ ~ ~ stone_button[face=floor,facing=south]
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=..3,P8DScore=2..}] run title @a times 1 40 1
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=..3,P8DScore=2..}] run title @a title {"text":"Win!","bold":false,"color":"red"}
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=..3,P8DScore=2..}] run teleport @a[tag=WrongAnswer] 938 67 1000 180 0

execute if entity @e[scores={P8DVillagerWin=125,P8DRound=4..}] run title @a times 1 40 1
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=4..}] run title @a title {"text":"Win!","bold":false,"color":"red"}
execute if entity @e[scores={P8DVillagerWin=125,P8DRound=4..}] run teleport @a[tag=WrongAnswer] 938 67 1000 180 0

execute if entity @e[scores={P8DVillagerWin=125}] run scoreboard objectives remove P8DVillagerWin

scoreboard players add @e[tag=MainTriviaAEC] P8DZombieWin 1
execute if entity @e[scores={P8DZombieWin=1}] run scoreboard objectives remove P8DTimer
execute if entity @e[scores={P8DZombieWin=1}] run kill @e[tag=P8DAEC]
execute if entity @e[scores={P8DZombieWin=50}] at @e[tag=P8DVillager] run playsound entity.villager.no master @a ~ ~ ~ 1 1.5 1
execute if entity @e[scores={P8DZombieWin=70}] run kill @e[tag=P8DVillager]
execute if entity @e[scores={P8DZombieWin=114}] run scoreboard players remove @e[tag=MainTriviaAEC] P8DScore 1
execute if entity @e[scores={P8DZombieWin=115,P8DRound=..2,P8DScore=-1..}] as @e[tag=P8DZombie] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={P8DZombieWin=125,P8DRound=..2,P8DScore=-1..}] run kill @e[tag=P8DZombie]

scoreboard players set @e[scores={P8DZombieWin=125,P8DRound=3}] P8DRound 4
scoreboard players set @e[scores={P8DZombieWin=125,P8DRound=2}] P8DRound 3
scoreboard players set @e[scores={P8DZombieWin=125,P8DRound=1}] P8DRound 2

execute if entity @e[scores={P8DZombieWin=125,P8DRound=2,P8DScore=-1..1}] run title @a times 1 40 1
execute if entity @e[scores={P8DZombieWin=125,P8DRound=2,P8DScore=-1..1}] run title @a title {"text":"Round 2","bold":false,"color":"red"}
execute if entity @e[scores={P8DZombieWin=125,P8DRound=3,P8DScore=-1..1}] run title @a times 1 40 1
execute if entity @e[scores={P8DZombieWin=125,P8DRound=3,P8DScore=-1..1}] run title @a title {"text":"Final Round","bold":false,"color":"red"}

execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 804 56 865 {Tags:["P8DYellowAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 800 56 865 {Tags:["P8DOrangeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 796 56 865 {Tags:["P8DPurpleAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 804 56 861 {Tags:["P8DBrownAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 800 56 861 {Tags:["P8DWhiteAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 796 56 861 {Tags:["P8DGreenAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 804 56 857 {Tags:["P8DBlackAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 800 56 857 {Tags:["P8DLimeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] run summon area_effect_cloud 796 56 857 {Tags:["P8DLightBlueAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DZombieWin=125}] at @e[tag=P8DAEC] run setblock ~ ~ ~ air

execute if entity @e[scores={P8DZombieWin=125,P8DRound=..3,P8DScore=-1..1}] at @e[tag=P8DAEC] run setblock ~ ~ ~ stone_button[face=floor,facing=south]
execute if entity @e[scores={P8DZombieWin=125,P8DRound=..3,P8DScore=..-2}] run tag @e[tag=P8DZombie] remove P8DStatueMob
execute if entity @e[scores={P8DZombieWin=125,P8DRound=..3,P8DScore=..-2}] as @e[tag=P8DZombie] run data merge entity @s {NoAI:false}
execute if entity @e[scores={P8DZombieWin=125,P8DRound=..3,P8DScore=..-2}] run title @a times 1 40 1
execute if entity @e[scores={P8DZombieWin=125,P8DRound=..3,P8DScore=..-2}] run title @a title {"text":"Lose!","bold":false,"color":"red"}

execute if entity @e[scores={P8DZombieWin=125,P8DRound=4..}] run tag @e[tag=P8DZombie] remove P8DStatueMob
execute if entity @e[scores={P8DZombieWin=125,P8DRound=4..}] as @e[tag=P8DZombie] run data merge entity @s {NoAI:false}
execute if entity @e[scores={P8DZombieWin=125,P8DRound=4..}] run title @a times 1 40 1
execute if entity @e[scores={P8DZombieWin=125,P8DRound=4..}] run title @a title {"text":"Lose!","bold":false,"color":"red"}


execute if entity @e[scores={P8DZombieWin=125}] run scoreboard objectives remove P8DZombieWin



# TIE
execute unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[tag=P8DMob] run scoreboard objectives add P8DMobTotal dummy
execute unless entity @e[scores={P8DZombieWin=1..}] if entity @e[tag=P8DMob] run scoreboard objectives add P8DMobTotal dummy
execute unless entity @e[tag=P8DMob] run scoreboard objectives remove P8DMobTotal
scoreboard players set @e[tag=MainTriviaAEC] P8DMobTotal 0
execute as @e[tag=P8DMob] run scoreboard players add @e[tag=MainTriviaAEC] P8DMobTotal 1

execute unless entity @e[scores={P8DVillagerWin=1..}] if entity @e[scores={P8DMobTotal=9}] run scoreboard objectives add P8DTie dummy
execute unless entity @e[scores={P8DZombieWin=1..}] if entity @e[scores={P8DMobTotal=9}] run scoreboard objectives add P8DTie dummy
execute if entity @e[scores={P8DVillagerWin=1..}] run scoreboard objectives remove P8DTie
execute if entity @e[scores={P8DZombieWin=1..}] run scoreboard objectives remove P8DTie
scoreboard players add @e[tag=MainTriviaAEC] P8DTie 1

execute if entity @e[scores={P8DTie=50}] run title @a times 1 40 1
execute if entity @e[scores={P8DTie=50}] run title @a title {"text":"Draw","bold":false,"color":"red"}
execute if entity @e[scores={P8DTie=50}] run title @a subtitle {"text":"Restarting Round", "color":"white"}
execute if entity @e[scores={P8DTie=80}] run kill @e[tag=P8DMob]
execute if entity @e[scores={P8DTie=80}] run kill @e[tag=P8DAEC]
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 804 56 865 {Tags:["P8DYellowAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 800 56 865 {Tags:["P8DOrangeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 796 56 865 {Tags:["P8DPurpleAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 804 56 861 {Tags:["P8DBrownAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 800 56 861 {Tags:["P8DWhiteAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 796 56 861 {Tags:["P8DGreenAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 804 56 857 {Tags:["P8DBlackAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 800 56 857 {Tags:["P8DLimeAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] run summon area_effect_cloud 796 56 857 {Tags:["P8DLightBlueAEC","P8DAEC"],Duration:2147483647}
execute if entity @e[scores={P8DTie=100}] at @e[tag=P8DAEC] run setblock ~ ~ ~ stone_button[face=floor,facing=south]

execute if entity @e[scores={P8DTie=100..}] run scoreboard objectives remove P8DTie

effect give @e[tag=P8DZombie] strength 2 6 true



# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=54,z=849,dx=24,dy=24,dz=24] run scoreboard objectives add P8D_End dummy
execute align x align y align z if entity @a[x=788,y=54,z=849,dx=24,dy=24,dz=24] run scoreboard objectives remove P8D_End
execute align x align y align z unless entity @a[x=788,y=54,z=849,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P8D_End 1

execute if entity @e[scores={P8D_End=25..}] run clear @a
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DMobTotal
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DTie
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DScore
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DRound
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DTurn
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8DTimer
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove Incorrect_P8D
execute if entity @e[scores={P8D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P8D_End=25..}] run scoreboard objectives remove P8D_End