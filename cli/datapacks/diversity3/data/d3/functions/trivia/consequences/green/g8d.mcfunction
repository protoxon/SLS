####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1062 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G8D
#scoreboard objectives setdisplay sidebar G8DBow
#scoreboard objectives setdisplay sidebar G8DArrow
#scoreboard objectives setdisplay sidebar G8DSkellyCount
#scoreboard objectives setdisplay sidebar G8DNoteBlock

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

effect give @a[tag=WrongAnswer] resistance 3 255 true

scoreboard objectives add Incorrect_G8D dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G8D 1

execute if entity @e[scores={Incorrect_G8D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G8D=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G8D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G8D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G8D=1}] run title @a subtitle {"text":"Bone Blocks use the xylophone sound", "color":"white"}
execute if entity @e[scores={Incorrect_G8D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Good luck. You'll have to get a Bone Block so you can play us an acceptable tune.","color":"red","bold":false}]


#scoreboard objectives add G8DBow dummy
#scoreboard players add @a G8DBow 1
#execute if entity @e[nbt={Item:{id:"minecraft:bow"}}] run scoreboard objectives remove G8DBow
#scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:bow"}]}] G8DBow
#execute if entity @e[scores={Incorrect_G8D=100..}] run give @a[scores={G8DBow=30..}] bow{Unbreakable:true,HideFlags:4,Enchantments:[{id:"minecraft:infinity",lvl:1}]}

#scoreboard objectives add G8DArrow dummy
#scoreboard players add @a G8DArrow 1
#execute if entity @e[nbt={Item:{id:"minecraft:arrow"}}] run scoreboard objectives remove G8DArrow
#scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:arrow"}]}] G8DArrow
#execute if entity @e[scores={Incorrect_G8D=100..}] run give @a[scores={G8DArrow=30..}] arrow


execute if entity @e[scores={Incorrect_G8D=1}] as @e[tag=G8DSkeleton] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G8D=1}] run setblock 1196 55 1079 air
execute if entity @e[scores={Incorrect_G8D=1}] run setblock 1196 56 1079 note_block[note=0]
execute if entity @e[scores={Incorrect_G8D=..120}] run data merge block 1197 56 1079 {Items:[{}]}

execute if entity @e[scores={Incorrect_G8D=1}] run team add G8DSkellies
team modify G8DSkellies collisionRule never
#team modify G8DSkellies friendlyFire false

execute if entity @e[scores={Incorrect_G8D=40}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}
execute if entity @e[scores={Incorrect_G8D=60}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}
execute if entity @e[scores={Incorrect_G8D=80}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}
execute if entity @e[scores={Incorrect_G8D=100}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}
execute if entity @e[scores={Incorrect_G8D=120}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}

scoreboard objectives add G8DSkellyCount dummy
scoreboard players set @e[tag=MainTriviaAEC] G8DSkellyCount 0
execute if entity @e[scores={Incorrect_G8D=125..}] as @e[tag=G8DSkeleton] run scoreboard players add @e[tag=MainTriviaAEC] G8DSkellyCount 1
execute if entity @e[scores={Incorrect_G8D=125..,G8DSkellyCount=..4}] run summon item 1197.0 59.3 1079.0 {Item:{id:"minecraft:bone", Count:1b}}
execute if entity @e[scores={Incorrect_G8D=125..,G8DSkellyCount=..4}] run summon skeleton 1197.0 75 1084.5 {Tags:["G8DSkeleton"],HandItems:[{id:"minecraft:bow",Count:1b}],Team:G8DSkellies}

kill @e[type=arrow,nbt={inGround:1b}]


replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:1b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 1
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:2b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 2
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:3b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 3
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:4b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 4
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:5b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 5
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:6b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 6
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:7b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 7
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:8b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 8
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:9b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 9
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:10b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 10
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:11b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 11
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:12b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 12
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:13b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 13
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:14b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 14
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:15b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 15
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:16b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 16
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:17b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 17
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:18b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 18
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:19b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 19
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:20b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 20
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:21b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 21
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:22b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 22
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:23b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 23
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:24b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 24
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:25b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 25
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:26b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 26
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:27b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 27
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:28b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 28
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:29b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 29
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:31b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 31
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:32b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 32
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:33b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 33
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:34b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 34
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:35b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 35
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:36b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 36
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:37b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 37
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:38b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 38
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:39b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 39
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:40b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 40
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:41b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 41
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:42b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 42
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:43b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 43
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:44b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 44
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:45b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 45
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:46b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 46
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:47b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 47
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:48b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 48
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:49b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 49
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:50b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 50
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:51b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 51
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:52b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 52
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:53b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 53
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:54b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 54
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:55b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 55
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:56b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 56
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:57b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 57
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:58b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 58
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:59b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 59
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:60b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 60
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:61b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 61
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:62b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 62
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:63b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 63
replaceitem entity @a[tag=WrongAnswer,nbt={SelectedItem:{id:"minecraft:bone_block", Count:64b}},nbt=!{SelectedItem:{id:"minecraft:bone_block",tag:{CanPlaceOn:["minecraft:soul_sand"]}}}] weapon.mainhand bone_block{CanPlaceOn:["minecraft:soul_sand"]} 64


execute if block 1196 55 1079 air run scoreboard objectives remove G8DNoteBlock
execute if block 1196 55 1079 bone_block run scoreboard objectives add G8DNoteBlock minecraft.custom:minecraft.tune_noteblock


execute if entity @a[scores={G8DNoteBlock=24..}] run teleport @a[tag=WrongAnswer] 1062 67 1000 0 0





# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add G8D_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove G8D_End
execute align x align y align z unless entity @a[x=1185,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G8D_End 1

execute if entity @e[scores={G8D_End=1..}] run kill @e[tag=G8DSkeleton]
execute if entity @e[scores={G8D_End=1..}] run kill @e[type=item,x=1185,y=54,z=1067,dx=24,dy=24,dz=24]
execute if entity @e[scores={G8D_End=25..}] run clear @a
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove G8DBow
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove G8DArrow
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove G8DSkellyCount
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove G8DNoteBlock
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove Incorrect_G8D
execute if entity @e[scores={G8D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G8D_End=25..}] run scoreboard objectives remove G8D_End