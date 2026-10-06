####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2017 / APRIL 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar MesaTimer

scoreboard objectives add MesaTimer dummy
tag @a remove MesaChat
execute align x align y align z run tag @a[x=-53,y=81,z=-971,dx=6,dy=7,dz=6] add MesaChat
execute if entity @a[tag=MesaChat] run scoreboard players add @e[tag=MainSurvivalAEC] MesaTimer 0
execute if entity @a[tag=MesaChat] run scoreboard players add @e[scores={MesaTimer=0..}] MesaTimer 1

scoreboard objectives add MetMesaNPC dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetMesaNPC 0


# FIRST RSMALEC VISIT
execute if entity @e[scores={MetMesaNPC=0,MesaTimer=1}] run data merge entity @e[tag=MesaNPC,limit=1] {HandItems:[{},{}],Pose:{Head:[30.0f,0.0f,0.0f]},DisabledSlots:2039583}

execute if entity @e[scores={MetMesaNPC=0,MesaTimer=20}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"*sigh*","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMesaNPC=0,MesaTimer=80}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"It's my birthday today. Not that you'd know... No one does apparently.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMesaNPC=0,MesaTimer=81}] run data merge entity @e[tag=MesaNPC,limit=1] {DisabledSlots:1973790}

execute if entity @e[scores={MetMesaNPC=0,MesaTimer=81}] run scoreboard players set @e[tag=MainSurvivalAEC] MetMesaNPC 1


# NEXT RSMALEC VISITS
execute if entity @e[scores={MetMesaNPC=1,MesaTimer=20}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"I didn't even get a cake...","color":"none","bold":false,"underlined":false}]



# BLOCK PROTECTION
execute if block -49 83 -968 air run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"Not today.","color":"none","bold":false,"underlined":false}]
execute if block -49 83 -968 air run execute align x align y align z run kill @e[type=item,x=-49,y=83,z=-968,dx=0,dy=0,dz=0]
execute if block -49 83 -968 air run setblock -49 83 -968 brown_terracotta



# CHANGE POSE IF HOLDING AN ITEM
execute as @e[tag=MesaNPC,nbt=!{HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{RightArm:[0f,0f,5f]}}
execute as @e[tag=MesaNPC,nbt={HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{RightArm:[330f,330f,0f]}}



# IF HELPED
execute if entity @e[scores={MetMesaNPC=1}] run execute if entity @e[tag=MesaNPC,nbt={HandItems:[{id:"minecraft:cake",Count:1b}]}] run scoreboard players reset @e MesaTimer
execute if entity @e[scores={MetMesaNPC=1}] run execute if entity @e[tag=MesaNPC,nbt={HandItems:[{id:"minecraft:cake",Count:1b}]}] run scoreboard players set @e[scores={MetMesaNPC=1}] MetMesaNPC 2

execute if entity @e[scores={MetMesaNPC=2,MesaTimer=1}] run data merge entity @e[tag=MesaNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetMesaNPC=2,MesaTimer=40..}] run data merge entity @e[tag=MesaNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if entity @e[scores={MetMesaNPC=2,MesaTimer=40}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"A cake? For me?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMesaNPC=2,MesaTimer=140}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"Ah thank you! You care more about me than anyone else!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMesaNPC=2,MesaTimer=240}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"If you see qmagnet, give him this please.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetMesaNPC=2,MesaTimer=300}] run data merge entity @e[tag=MesaNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Dear qmagnet,\\n\\nNone of you remembered my birthday today, but this stranger was the only one who cared and gave me a cake. What kind of a friend are you?\\n\\n- Ron\"}"],author:"rsmalec",title:"My Birthday",MesaBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetMesaNPC=2,MesaTimer=301..}] MetMesaNPC 3



# IF HELPED AGAIN
execute if entity @e[scores={MetMesaNPC=3}] run execute if entity @e[tag=MesaNPC,nbt={HandItems:[{id:"minecraft:cake",Count:1b}]}] run scoreboard players reset @e MesaTimer
execute if entity @e[scores={MetMesaNPC=3}] run execute if entity @e[tag=MesaNPC,nbt={HandItems:[{id:"minecraft:cake",Count:1b}]}] run scoreboard players set @e[scores={MetMesaNPC=3}] MetMesaNPC 4

execute if entity @e[scores={MetMesaNPC=4,MesaTimer=1}] run data merge entity @e[tag=MesaNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetMesaNPC=4,MesaTimer=20}] run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"What did Q say about my letter? Here. Can you deliver this one too?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetMesaNPC=4,MesaTimer=40}] run data merge entity @e[tag=MesaNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Dear qmagnet,\\n\\nYou forgot about my birthday! It is today. And the only one who cared was this stranger. At least *someone* likes me...\\n\\n- Ron\"}"],author:"rsmalec",title:"You Forgot",MesaBook:1b,RealBook:1b}}],DisabledSlots:1973790}

scoreboard players set @e[scores={MetMesaNPC=4,MesaTimer=40}] MetMesaNPC 3



# WRONG ITEM -> CONVERSATION BLOCKS
execute if entity @e[tag=MesaNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:cake"}]}] run execute if block 8 5 -18 red_terracotta run tellraw @a[tag=MesaChat] ["",{"text":"<rsmalec> ","color":"yellow","bold":false},{"text":"No thanks... I don't need this.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MesaNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:cake"}]}] run fill 8 5 -18 8 5 -18 brown_terracotta replace red_terracotta
execute if entity @e[tag=MesaNPC,nbt=!{HandItems:[{Count:1b}]}] run fill 8 5 -18 8 5 -18 red_terracotta replace brown_terracotta




# IF HAVEN'T MET Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetQ 0
scoreboard players set @e[scores={MetQ=0}] MetQ -100