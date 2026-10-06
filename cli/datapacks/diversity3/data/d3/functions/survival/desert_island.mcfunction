####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 15 2017 / AUGUST 10 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar DesertTimer
#scoreboard objectives setdisplay sidebar DesertDrown

scoreboard objectives add DesertTimer dummy
tag @a remove DesertChat
execute align x align y align z run tag @a[x=60,y=65,z=-1037,dx=12,dy=3,dz=12] add DesertChat
execute if entity @a[tag=DesertChat] run scoreboard players add @e[tag=MainSurvivalAEC] DesertTimer 0
execute if entity @a[tag=DesertChat] run scoreboard players add @e[scores={DesertTimer=0..}] DesertTimer 1

scoreboard objectives add MetDesertNPC dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetDesertNPC 0


# FIRST JESPER VISIT
execute if entity @e[scores={MetDesertNPC=0,DesertTimer=1}] run data merge entity @e[tag=DesertNPCHead,limit=1] {HandItems:[{},{}],DisabledSlots:2039583}

execute if entity @e[scores={MetDesertNPC=0,DesertTimer=20}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Ugh...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetDesertNPC=0,DesertTimer=80}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Do you have a bottle of water? I'm dying here and the well is all dried up...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetDesertNPC=0,DesertTimer=81}] run data merge entity @e[tag=DesertNPCHead,limit=1] {DisabledSlots:1973790}

execute if entity @e[scores={MetDesertNPC=0,DesertTimer=81}] run scoreboard players set @e[tag=MainSurvivalAEC] MetDesertNPC 1


# NEXT JESPER VISITS
execute if entity @e[scores={MetDesertNPC=1,DesertTimer=20}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"So thirsty...","color":"none","bold":false,"underlined":false}]



# BLOCK PROTECTION
execute if block 64 65 -1033 air run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"I'm dying here and you're doing that to me...","color":"none","bold":false,"underlined":false}]
execute if block 64 65 -1033 air run execute align x align y align z run kill @e[type=item,x=64,y=65,z=-1033,dx=0,dy=1,dz=0]
execute if block 64 65 -1033 air run setblock 64 65 -1033 sandstone

execute if block 65 65 -1033 air run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Why would you do that to me?","color":"none","bold":false,"underlined":false}]
execute if block 65 65 -1033 air run execute align x align y align z run kill @e[type=item,x=65,y=65,z=-1033,dx=0,dy=1,dz=0]
execute if block 65 65 -1033 air run setblock 65 65 -1033 sandstone



# CHANGE POSE IF HOLDING AN ITEM
execute as @e[tag=DesertNPCHead,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{RightArm:[270f,10f,0f],LeftArm:[0f,0f,0f]}}
execute as @e[tag=DesertNPCHead,nbt=!{HandItems:[{Count:1b}]}] run data merge entity @s {Pose:{RightArm:[270f,10f,0f],LeftArm:[0f,0f,0f]}}
execute as @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:written_book"}]}] run data merge entity @s {Pose:{RightArm:[200f,0f,0f],LeftArm:[0f,0f,0f]}}



# IF HELPED
execute if entity @e[scores={MetDesertNPC=1}] run execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}]}] run scoreboard players reset @e DesertTimer
execute if entity @e[scores={MetDesertNPC=1}] run execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}]}] run scoreboard players set @e[scores={MetDesertNPC=1}] MetDesertNPC 2
                                   
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=1}] run data merge entity @e[tag=DesertNPCHead,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=40}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Water? Oh thank you so much!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetDesertNPC=2,DesertTimer=100..140}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[270.0f,0.0f,0.0f],RightArm:[210.0f,0.0f,40.0f]}}
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=120}] run data merge entity @e[tag=DesertNPCHead,limit=1] {HandItems:[{id:"minecraft:glass_bottle",Count:1b},{}]}
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=120}] run execute at @e[tag=DesertNPCHead] run playsound entity.generic.drink master @a[tag=DesertChat]

execute if entity @e[scores={MetDesertNPC=2,DesertTimer=140}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Hey, I heard you were looking for the Brown Wool.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=240}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Here. Give this to qmagnet. And have my thanks too, friend!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={MetDesertNPC=2,DesertTimer=300}] run data merge entity @e[tag=DesertNPCHead,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Hey Q,\\n\\nFunny story. Know when I said I was going to the beach? Well, long story short, there's no beach. Nearly died in the desert, but our friend here rescued me. You should give 'em the wool.\\n\\n- Jesper\"}"],author:"Jespertheend",title:"Wrong Sand",DesertBook:1b,RealBook:1b}}],DisabledSlots:1973790}
scoreboard players set @e[scores={MetDesertNPC=2,DesertTimer=301..}] MetDesertNPC 3



# IF HELPED AGAIN
execute if entity @e[scores={MetDesertNPC=3}] run execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]}] run scoreboard players reset @e DesertTimer
execute if entity @e[scores={MetDesertNPC=3}] run execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]}] run scoreboard players set @e[scores={MetDesertNPC=3}] MetDesertNPC 4

execute if entity @e[scores={MetDesertNPC=4,DesertTimer=1}] run data merge entity @e[tag=DesertNPCHead,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={MetDesertNPC=4,DesertTimer=20}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"I'm awake. I'm awake!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetDesertNPC=4,DesertTimer=100}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Wait. Did you lose that message I wrote? Here, have another. I just gotta rest my eyes...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetDesertNPC=4,DesertTimer=140}] run data merge entity @e[tag=DesertNPCHead,limit=1] {HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"qmagnet,\\n\\nOur friend here is very helpful, even though they're a bit clumsy since they lost the first note I wrote for you. Anwyay, they helped me not die. We should reward them. They deserve it.\\n\\n- Jesper\"}"],author:"Jespertheend",title:"Helpful",DesertBook:1b,RealBook:1b}}],DisabledSlots:1973790}

scoreboard players set @e[scores={MetDesertNPC=4,DesertTimer=140}] MetDesertNPC 3


# WRONG ITEMS -> CONVERSATION BLOCKS
execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]},nbt=!{HandItems:[{id:"minecraft:water_bucket"}]},nbt=!{HandItems:[{id:"minecraft:glass_bottle"}]},nbt=!{HandItems:[{id:"minecraft:splash_potion"}]}] run execute if block 2 5 -18 sandstone run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"I already tried to drink that.","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}]},nbt=!{HandItems:[{id:"minecraft:water_bucket"}]},nbt=!{HandItems:[{id:"minecraft:splash_potion"}]},nbt=!{HandItems:[{id:"minecraft:glass_bottle"}]}] run fill 2 5 -18 2 5 -18 stone replace sandstone
execute if entity @e[tag=DesertNPCHead,nbt=!{HandItems:[{Count:1b}]}] run fill 2 5 -18 2 5 -18 sandstone replace stone

execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:water_bucket"}]}] run execute if block 2 6 -18 sandstone run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Bucket... Too heavy. I'm weak. Ugh... Need bottle...","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:water_bucket"}]}] run fill 2 6 -18 2 6 -18 stone replace sandstone
execute if entity @e[tag=DesertNPCHead,nbt=!{HandItems:[{id:"minecraft:water_bucket"}]}] run fill 2 6 -18 2 6 -18 sandstone replace stone

execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:splash_potion",tag:{Potion:"minecraft:water"}}]}] run execute if block 2 7 -18 sandstone run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"What am I supposed to do with that? Smash it into my face?!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=DesertNPCHead,nbt={HandItems:[{id:"minecraft:splash_potion",tag:{Potion:"minecraft:water"}}]}] run fill 2 7 -18 2 7 -18 stone replace sandstone
execute if entity @e[tag=DesertNPCHead,nbt=!{HandItems:[{id:"minecraft:splash_potion",tag:{Potion:"minecraft:water"}}]}] run fill 2 7 -18 2 7 -18 sandstone replace stone


# BONUS DROWNING
#scoreboard objectives add DesertDrown dummy
execute if block 64 66 -1033 water run scoreboard objectives add DesertDrown dummy
scoreboard players add @e[tag=MainSurvivalAEC] DesertDrown 1
scoreboard players set @e[scores={DesertDrown=60..}] DesertDrown 0
scoreboard players set @e[scores={DesertDrown=0..}] DesertTimer 40

execute if entity @e[scores={DesertDrown=5}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"Gluglugluglugulg...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={DesertDrown=35}] run tellraw @a[tag=DesertChat] ["",{"text":"<Jesper the End> ","color":"aqua","bold":false},{"text":"HELP!!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={DesertDrown=0..10}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,350.0f],RightArm:[170.0f,0.0f,0.0f],LeftArm:[190.0f,0.0f,0.0f]},HandItems:[{},{}]}
execute if entity @e[scores={DesertDrown=10..20}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,10.0f],RightArm:[190.0f,0.0f,0.0f],LeftArm:[170.0f,0.0f,0.0f]},HandItems:[{},{}]}
execute if entity @e[scores={DesertDrown=20..30}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,350.0f],RightArm:[170.0f,0.0f,0.0f],LeftArm:[190.0f,0.0f,0.0f]},HandItems:[{},{}]}
execute if entity @e[scores={DesertDrown=30..40}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,10.0f],RightArm:[190.0f,0.0f,0.0f],LeftArm:[170.0f,0.0f,0.0f]},HandItems:[{},{}]}
execute if entity @e[scores={DesertDrown=40..50}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,350.0f],RightArm:[170.0f,0.0f,0.0f],LeftArm:[190.0f,0.0f,0.0f]},HandItems:[{},{}]}
execute if entity @e[scores={DesertDrown=50..60}] run data merge entity @e[tag=DesertNPCHead,limit=1] {Pose:{Head:[280.0f,0.0f,10.0f],RightArm:[190.0f,0.0f,0.0f],LeftArm:[170.0f,0.0f,0.0f]},HandItems:[{},{}]}

execute if block 64 66 -1033 air run scoreboard objectives remove DesertDrown


# IF HAVEN'T MET Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] MetQ 0
scoreboard players set @e[scores={MetQ=0}] MetQ -100