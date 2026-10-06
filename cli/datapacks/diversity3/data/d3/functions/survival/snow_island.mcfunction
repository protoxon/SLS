####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2017 / APRIL 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SnowTimer
#scoreboard objectives setdisplay sidebar CactusPresent

scoreboard objectives add SnowTimer dummy
tag @a remove SnowChat
execute align x align y align z run tag @a[x=6,y=48,z=-939,dx=4,dy=2,dz=6] add SnowChat
execute if entity @a[tag=SnowChat] run scoreboard players add @e[tag=MainSurvivalAEC] SnowTimer 0
execute if entity @a[tag=SnowChat] run scoreboard players add @e[scores={SnowTimer=0..}] SnowTimer 1

scoreboard objectives add MetSnowNPC dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetSnowNPC 0


# FIRST MOESH VISIT
execute if entity @e[scores={MetSnowNPC=0,SnowTimer=1}] run data merge entity @e[tag=SnowNPC,limit=1] {HandItems:[{},{}],Pose:{Head:[10.0f,0.0f,0.0f]},DisabledSlots:2039583}

execute if entity @e[scores={MetSnowNPC=0,SnowTimer=20}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Oh hi...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetSnowNPC=0,SnowTimer=80}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Just thinking about... I used to have a pet cactus. She died... *sniff sniff*","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetSnowNPC=0,SnowTimer=81}] run data merge entity @e[tag=SnowNPC,limit=1] {DisabledSlots:1973790}

execute if entity @e[scores={MetSnowNPC=0,SnowTimer=81}] run scoreboard players set @e[tag=MainSurvivalAEC] MetSnowNPC 1


# NEXT MOESH VISITS
execute if entity @e[scores={MetSnowNPC=1,SnowTimer=20}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Man I miss the prickly little girl...","color":"none","bold":false,"underlined":false}]



# BLOCK PROTECTION
execute if block 6 47 -933 air run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Please don't do that.","color":"none","bold":false,"underlined":false}]
execute if block 6 47 -933 air run execute align x align y align z run kill @e[type=item,x=6,y=47,z=-933,dx=0,dy=1,dz=0]
execute if block 6 47 -933 air run setblock 6 47 -933 chiseled_stone_bricks



# CHANGE POSE IF HOLDING AN ITEM
execute as @e[tag=SnowNPC,nbt=!{HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{RightArm:[0f,0f,0f]}}
execute as @e[tag=SnowNPC,nbt={HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{RightArm:[340f,330f,0f]}}



# IF HELPED
execute if entity @e[scores={MetSnowNPC=1}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{id:"minecraft:cactus",Count:1b}]}] run scoreboard players reset @e SnowTimer
execute if entity @e[scores={MetSnowNPC=1}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{id:"minecraft:cactus",Count:1b}]}] run scoreboard players set @e[scores={MetSnowNPC=1}] MetSnowNPC 2

execute if entity @e[scores={MetSnowNPC=2,SnowTimer=1}] run data merge entity @e[tag=SnowNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetSnowNPC=2,SnowTimer=40..}] run data merge entity @e[tag=SnowNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if entity @e[scores={MetSnowNPC=2,SnowTimer=40}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"What? You're giving me a new friend?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=2,SnowTimer=140}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"THANK YOU! I will tell qmagnet about you!!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=2,SnowTimer=240}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Here! Take this and show it to Q! Thank you so much!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=2,SnowTimer=300}] run data merge entity @e[tag=SnowNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"qmagnet!\\n\\nRemember Princess Prickles? I'm not sad anymore because this stranger gave me a new pet princess! You gotta give them a present or something!\\n\\n- Moesh\"}"],author:"Moesh",title:"Pretty Sharp!",SnowBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetSnowNPC=2,SnowTimer=301..}] MetSnowNPC 3



# BONUS IF HELPED BY PLACING CACTUS
execute if block 10 49 -933 potted_cactus run scoreboard objectives add CactusPresent dummy
#scoreboard players set @e[tag=MainSurvivalAEC] CactusPresent 0
execute if block 10 49 -933 potted_cactus run scoreboard players add @e[tag=MainSurvivalAEC] CactusPresent 1
execute if block 10 49 -933 air run scoreboard players set @e[scores={CactusPresent=1..}] CactusPresent 0
execute if block 10 49 -933 flower_pot run scoreboard players set @e[scores={CactusPresent=1..}] CactusPresent 0

execute if entity @e[scores={MetSnowNPC=1,CactusPresent=1}] run scoreboard players reset @e SnowTimer
execute if entity @e[scores={MetSnowNPC=1,CactusPresent=1}] run scoreboard players set @e[scores={MetSnowNPC=1}] MetSnowNPC 2
execute if entity @e[scores={MetSnowNPC=2,CactusPresent=0}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"No! You killed it!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=2,CactusPresent=0}] run data merge entity @e[tag=SnowNPC,limit=1] {Pose:{Head:[30.0f,0.0f,0.0f]},DisabledSlots:1973790}
scoreboard players set @e[scores={MetSnowNPC=2,CactusPresent=0}] MetSnowNPC 1
execute if entity @e[scores={MetSnowNPC=1,CactusPresent=0}] run scoreboard objectives remove CactusPresent

execute if entity @e[scores={MetSnowNPC=3..,CactusPresent=0}] run data merge entity @e[tag=SnowNPC,limit=1] {Pose:{Head:[30.0f,0.0f,0.0f]},DisabledSlots:1973790}
execute if entity @e[scores={MetSnowNPC=3..,CactusPresent=0}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Aw man. Why'd you do that?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=3..,CactusPresent=0}] run scoreboard objectives remove CactusPresent

execute if entity @e[scores={MetSnowNPC=3,CactusPresent=1}] run scoreboard players reset @e SnowTimer
execute if entity @e[scores={MetSnowNPC=3,CactusPresent=1}] run scoreboard players set @e[scores={MetSnowNPC=3}] MetSnowNPC 4
execute if entity @e[scores={MetSnowNPC=4,CactusPresent=10}] run data merge entity @e[tag=SnowNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]},DisabledSlots:1973790}



# IF HELPED AGAIN
execute if entity @e[scores={MetSnowNPC=3}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{id:"minecraft:cactus",Count:1b}]}] run scoreboard players reset @e SnowTimer
execute if entity @e[scores={MetSnowNPC=3}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{id:"minecraft:cactus",Count:1b}]}] run scoreboard players set @e[scores={MetSnowNPC=3}] MetSnowNPC 4

execute if entity @e[scores={MetSnowNPC=4,SnowTimer=1}] run data merge entity @e[tag=SnowNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetSnowNPC=4,SnowTimer=20}] run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"Another friend!? Well that deserves another recommendation!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetSnowNPC=4,SnowTimer=40}] run data merge entity @e[tag=SnowNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Q,\\n\\nApparently my other note to you got left somewhere. I trust this one. They've given me a new prickly pal. Can we reward them?\\n\\n- Moesh\"}"],author:"Moesh",title:"My Trust",SnowBook:1b,RealBook:1b}}],Pose:{Head:[0.0f,0.0f,0.0f]},DisabledSlots:1973790}

scoreboard players set @e[scores={MetSnowNPC=4,SnowTimer=45}] MetSnowNPC 3



# WRONG ITEM -> CONVERSATION BLOCKS
execute if entity @e[scores={MetSnowNPC=2}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:cactus"}]}] run execute if block 6 5 -18 snow_block run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"This thing just makes me miss her more.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetSnowNPC=3}] run execute if entity @e[tag=SnowNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:cactus"}]}] run execute if block 6 5 -18 snow_block run tellraw @a[tag=SnowChat] ["",{"text":"<Moesh> ","color":"blue","bold":false},{"text":"No. Thank you though.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=SnowNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:cactus"}]}] run fill 6 5 -18 6 5 -18 packed_ice replace snow_block
execute if entity @e[tag=SnowNPC,nbt=!{HandItems:[{Count:1b}]}] run fill 6 5 -18 6 5 -18 snow_block replace packed_ice




# IF HAVEN'T MET Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetQ 0
scoreboard players set @e[scores={MetQ=0}] MetQ -100