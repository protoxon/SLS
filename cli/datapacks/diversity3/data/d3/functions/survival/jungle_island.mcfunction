####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2017 / SEPTEMBER 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar JungleTimer

scoreboard objectives add JungleTimer dummy
tag @a remove JungleChat
execute align x align y align z run tag @a[x=58,y=96,z=-971,dx=12,dy=3,dz=5] add JungleChat
execute if entity @a[tag=JungleChat] run scoreboard players add @e[tag=MainSurvivalAEC] JungleTimer 0
execute if entity @a[tag=JungleChat] run scoreboard players add @e[scores={JungleTimer=0..}] JungleTimer 1

scoreboard objectives add MetJungleNPC dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetJungleNPC 0


# CHANGE POSE IF HOLDING AN ITEM
execute as @e[tag=JungleNPC,nbt=!{HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{Head:[5f,10f,0f],RightArm:[20f,0f,40f]}}
execute as @e[tag=JungleNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{Head:[30f,20f,0f],RightArm:[330f,0f,0f]}}
execute as @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{Head:[0f,0f,0f],RightArm:[330f,0f,0f]}}


# FIRST CDF VISIT
execute if entity @e[scores={MetJungleNPC=0,JungleTimer=1}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{},{}],Pose:{Head:[5f,10f,0f],RightArm:[20f,0f,40f],LeftArm:[20f,0f,320f],RightLeg:[0f,10f,10f],LeftLeg:[10f,0f,355f],Body:[355f,0f,0f]},DisabledSlots:2039583}

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=20}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"And hello everyone!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=80}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"Or just you... I can't see very well.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=160}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"Listen, I hate to be a bother, but have you got anything cold? I've lived here my whole life, but it's always warm here.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=280}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"I hear that white stuff over there might be fun to play with.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=320..350}] run data merge entity @e[tag=JungleNPC,limit=1] {Pose:{Head:[10f,35f,0f],RightArm:[290f,50f,0f],Body:[0f,20f,0f]}}

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=350}] run data merge entity @e[tag=JungleNPC,limit=1] {Pose:{Head:[5f,10f,0f],RightArm:[20f,0f,40f],LeftArm:[20f,0f,320f],RightLeg:[0f,10f,10f],LeftLeg:[10f,0f,355f],Body:[355f,0f,0f]}, DisabledSlots:1973790}

execute if entity @e[scores={MetJungleNPC=0,JungleTimer=351}] run scoreboard players set @e[tag=MainSurvivalAEC] MetJungleNPC 1


# NEXT CDF VISITS
execute if entity @e[scores={MetJungleNPC=1,JungleTimer=20}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"What is \"snow\" anyway?","color":"none","bold":false,"underlined":false}]



# BLOCK PROTECTION
execute if block 61 96 -970 air run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"Be careful! I'm leaning on that!","color":"none","bold":false,"underlined":false}]
execute if block 61 96 -970 air run execute align x align y align z run kill @e[type=item,x=61,y=96,z=-970,dx=0,dy=0,dz=1]
execute if block 61 96 -970 air run setblock 61 96 -970 jungle_fence

execute if block 61 95 -970 air run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"Woah are you crazy?!","color":"none","bold":false,"underlined":false}]
execute if block 61 95 -970 air run execute align x align y align z run kill @e[type=item,x=61,y=95,z=-970,dx=0,dy=1,dz=0]
execute if block 61 95 -970 air run setblock 61 95 -970 jungle_slab[type=top]



# IF HELPED
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow_block",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow_block",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=1}] MetJungleNPC 2

execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snowball",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snowball",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=1}] MetJungleNPC 2

execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=1}] MetJungleNPC 2

execute if entity @e[scores={MetJungleNPC=2,JungleTimer=1}] run data merge entity @e[tag=JungleNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=40..}] run data merge entity @e[tag=JungleNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=40}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"So THIS is what snow feels like?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=140}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"I'll just put this away for safekeeping.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=200}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{},{}]}
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=240}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"You have earned my trust! Please give this to qmagnet when you see him.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=2,JungleTimer=300}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"And hello qmagnet!\\n\\nSnow is cold! Yep! I finally got some. The stranger here helped me out. Can you reward them?\\n\\n- CDF\"}"],author:"CDFDMAN",title:"Cool!",JungleBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetJungleNPC=2,JungleTimer=301..}] MetJungleNPC 3


# IF HELPED ICE FIRST

execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:ice",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:ice",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=1}] MetJungleNPC 6

execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:packed_ice",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=1}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:packed_ice",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=1}] MetJungleNPC 6

execute if entity @e[scores={MetJungleNPC=6,JungleTimer=1}] run data merge entity @e[tag=JungleNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=40..}] run data merge entity @e[tag=JungleNPC,limit=1] {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=40}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"Wow! This isn't snow. But it's very cold!!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=140}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"I'll just put this away for safe keeping.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=200}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{},{}]}
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=240}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"You have earned my trust! Please give this to qmagnet when you see him.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetJungleNPC=6,JungleTimer=300}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"And hello qmagnet!\\n\\nSnow is cold! Yep! I finally got some. The stranger here helped me out. Can you reward them?\\n\\n- CDF\"}"],author:"CDFDMAN",title:"Cool!",JungleBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetJungleNPC=6,JungleTimer=301..}] MetJungleNPC 3



# IF HELPED AGAIN
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow_block",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow_block",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=3}] MetJungleNPC 4
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snowball",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snowball",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=3}] MetJungleNPC 4
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:snow",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=3}] MetJungleNPC 4
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:ice",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:ice",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=3}] MetJungleNPC 4
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:packed_ice",Count:1b}]}] run scoreboard players reset @e JungleTimer
execute if entity @e[scores={MetJungleNPC=3}] run execute if entity @e[tag=JungleNPC,nbt={HandItems:[{id:"minecraft:packed_ice",Count:1b}]}] run scoreboard players set @e[scores={MetJungleNPC=3}] MetJungleNPC 4


execute if entity @e[scores={MetJungleNPC=4,JungleTimer=1}] run data merge entity @e[tag=JungleNPC,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetJungleNPC=4,JungleTimer=20}] run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"More cold stuff? Good. Because the last one you gave me melted so I'll write you another letter of recommendation.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetJungleNPC=4,JungleTimer=40}] run data merge entity @e[tag=JungleNPC,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"And hello again,\\n\\nNot sure where my first message went, but this stranger helped me out. Could you give them our reward?\\n\\n- CDF\"}"],author:"CDFDMAN",title:"Very Cool!",JungleBook:1b,RealBook:1b}}],DisabledSlots:1973790}

scoreboard players set @e[scores={MetJungleNPC=4,JungleTimer=40}] MetJungleNPC 3



# WRONG ITEMS -> CONVERSATION BLOCKS
execute if entity @e[tag=JungleNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:snow_block"}]},nbt=!{HandItems:[{id:"minecraft:snowball"}]},nbt=!{HandItems:[{id:"minecraft:snow"}]},nbt=!{HandItems:[{id:"minecraft:ice"}]},nbt=!{HandItems:[{id:"minecraft:packed_ice"}]}] run execute if block 4 5 -18 jungle_wood run tellraw @a[tag=JungleChat] ["",{"text":"<CDFDMAN> ","color":"dark_green","bold":false},{"text":"What is this? This isn't very cold... Is this fake snow?","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=JungleNPC,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:snowblock"}]},nbt=!{HandItems:[{id:"minecraft:snowball"}]},nbt=!{HandItems:[{id:"minecraft:snow"}]},nbt=!{HandItems:[{id:"minecraft:ice"}]},nbt=!{HandItems:[{id:"minecraft:packed_ice"}]}] run fill 4 5 -18 4 5 -18 jungle_planks replace jungle_wood
execute if entity @e[tag=JungleNPC,nbt=!{HandItems:[{Count:1b}]}] run fill 4 5 -18 4 5 -18 jungle_wood replace jungle_planks



# IF HAVEN'T MET Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetQ 0
scoreboard players set @e[scores={MetQ=0}] MetQ -100