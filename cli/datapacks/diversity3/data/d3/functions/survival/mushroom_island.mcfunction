####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2017 / MAY 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar MushTimer

scoreboard objectives add MushTimer dummy
tag @a remove MushChat
execute align x align y align z run tag @a[x=-52,y=64,z=-1033,dx=10,dy=6,dz=10] add MushChat
execute if entity @a[tag=MushChat] run scoreboard players add @e[tag=MainSurvivalAEC] MushTimer 0
execute if entity @a[tag=MushChat] run scoreboard players add @e[scores={MushTimer=0..}] MushTimer 1

scoreboard objectives add MetMushNPC dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetMushNPC 0


# FIRST CUBEHAMSTER VISIT
execute if entity @e[scores={MetMushNPC=0,MushTimer=1}] run data merge entity @e[tag=MushNPC,limit=1] {HandItems:[{},{}],Pose:{Head:[0.0f,0.0f,10.0f]},DisabledSlots:2039583}

execute if entity @e[scores={MetMushNPC=0,MushTimer=20}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Hey, Cubehamster here...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMushNPC=0,MushTimer=80}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Got any melons?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMushNPC=0,MushTimer=81}] run data merge entity @e[tag=MushNPC,limit=1] {DisabledSlots:1973790}

execute if entity @e[scores={MetMushNPC=0,MushTimer=81}] run scoreboard players set @e[tag=MainSurvivalAEC] MetMushNPC 1


# NEXT CUBEHAMSTER VISITS
execute if entity @e[scores={MetMushNPC=1,MushTimer=20}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Oh man. A melon would be perfect...","color":"none","bold":false,"underlined":false}]



# BLOCK PROTECTION
execute if block -48 65 -1028 air run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Don't even try it.","color":"none","bold":false,"underlined":false}]
execute if block -48 65 -1028 air run execute align x align y align z run kill @e[type=item,x=-48,y=65,z=-1028,dx=0,dy=1,dz=0]
execute if block -48 65 -1028 air run setblock -48 65 -1028 mycelium

execute if block -48 65 -1029 air run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Nope.","color":"none","bold":false,"underlined":false}]
execute if block -48 65 -1029 air run execute align x align y align z run kill @e[type=item,x=-48,y=65,z=-1029,dx=0,dy=1,dz=0]
execute if block -48 65 -1029 air run setblock -48 65 -1029 mycelium



# CHANGE POSE IF HOLDING AN ITEM
execute as @e[tag=MushNPC,nbt=!{HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{Head:[0f,0f,10f],RightArm:[0f,0f,10f]}}
execute as @e[tag=MushNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{Head:[10f,10f,10f],RightArm:[350f,355f,10f]}}
execute as @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{Head:[0f,0f,0f],RightArm:[320f,355f,10f]}}



# IF HELPED
execute if entity @e[scores={MetMushNPC=1}] run execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon",Count:1b}]}] run scoreboard players reset @e MushTimer
execute if entity @e[scores={MetMushNPC=1}] run execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon",Count:1b}]}] run scoreboard players set @e[scores={MetMushNPC=1}] MetMushNPC 2

execute if entity @e[scores={MetMushNPC=2,MushTimer=1}] run data merge entity @e[tag=MushNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetMushNPC=2,MushTimer=40..}] run data merge entity @e[tag=MushNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if entity @e[scores={MetMushNPC=2,MushTimer=40}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Perfect!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMushNPC=2,MushTimer=100}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"They thought Missile Wars was deadly... Wait till they get a load of this! Mwahahahahaha!!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMushNPC=2,MushTimer=210}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Give this to qmagnet. He'll know what to do...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMushNPC=2,MushTimer=260}] run data merge entity @e[tag=MushNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Q,\\n\\nMelon Wars is a go! The albatross is massaging a porpoise with cheese. This is not a drill.\\n\\n- CH\"}"],author:"Cubehamster",title:"Melon Wars",MushBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetMushNPC=2,MushTimer=301..}] MetMushNPC 3



# IF HELPED AGAIN
execute if entity @e[scores={MetMushNPC=3}] run execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon",Count:1b}]}] run scoreboard players reset @e MushTimer
execute if entity @e[scores={MetMushNPC=3}] run execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon",Count:1b}]}] run scoreboard players set @e[scores={MetMushNPC=3}] MetMushNPC 4

execute if entity @e[scores={MetMushNPC=4,MushTimer=1}] run data merge entity @e[tag=MushNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetMushNPC=4,MushTimer=20}] run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Hey I can always use another melon block! Trade ya?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMushNPC=4,MushTimer=40}] run data merge entity @e[tag=MushNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Q,\\n\\nTango tango. Winnebago!\\n\\n\\nWith love,\\n- CH\"}"],author:"Cubehamster",title:"Fruit Fight",MushBook:1b,RealBook:1b}}],DisabledSlots:1973790}

scoreboard players set @e[scores={MetMushNPC=4,MushTimer=40}] MetMushNPC 3



# WRONG ITEMS -> CONVERSATION BLOCKS
execute if entity @e[tag=MushNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:melon"}]},nbt=!{HandItems:[{id:"minecraft:melon_slice"}]},nbt=!{HandItems:[{id:"minecraft:melon_seeds"}]},nbt=!{HandItems:[{id:"minecraft:glistering_melon_slice"}]}] run execute if block 10 5 -18 red_mushroom_block run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"I'm really only looking for a melon.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MushNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:melon"}]},nbt=!{HandItems:[{id:"minecraft:melon_slice"}]},nbt=!{HandItems:[{id:"minecraft:melon_seeds"}]},nbt=!{HandItems:[{id:"minecraft:glistering_melon_slice"}]}] run fill 10 5 -18 10 5 -18 brown_mushroom_block replace red_mushroom_block
execute if entity @e[tag=MushNPC,nbt=!{HandItems:[{Count:1b}]}] run fill 10 5 -18 10 5 -18 red_mushroom_block replace brown_mushroom_block

execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon_slice"}]}] run execute if block 10 6 -18 red_mushroom_block run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Yeah well... I guess I should have told you, I need the entire thing.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon_slice"}]}] run fill 10 6 -18 10 6 -18 brown_mushroom_block replace red_mushroom_block
execute if entity @e[tag=MushNPC,nbt=!{HandItems:[{id:"minecraft:melon_slice"}]}] run fill 10 6 -18 10 6 -18 red_mushroom_block replace brown_mushroom_block

execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon_seeds"}]}] run execute if block 10 7 -18 red_mushroom_block run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"I'm a Redstoner, not a farmer!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:melon_seeds"}]}] run fill 10 7 -18 10 7 -18 brown_mushroom_block replace red_mushroom_block
execute if entity @e[tag=MushNPC,nbt=!{HandItems:[{id:"minecraft:melon_seeds"}]}] run fill 10 7 -18 10 7 -18 red_mushroom_block replace brown_mushroom_block

execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:glistering_melon_slice"}]}] run execute if block 10 8 -18 red_mushroom_block run tellraw @a[tag=MushChat] ["",{"text":"<Cubehamster> ","color":"red","bold":false},{"text":"Um... I don't even know what to do with this speckled thing.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MushNPC,nbt={HandItems:[{id:"minecraft:glistering_melon_slice"}]}] run fill 10 8 -18 10 8 -18 brown_mushroom_block replace red_mushroom_block
execute if entity @e[tag=MushNPC,nbt=!{HandItems:[{id:"minecraft:glistering_melon_slice"}]}] run fill 10 8 -18 10 8 -18 red_mushroom_block replace brown_mushroom_block




# IF HAVEN'T MET Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetQ 0
scoreboard players set @e[scores={MetQ=0}] MetQ -100