####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 2 2018 / JUNE 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 932 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P9D
#scoreboard objectives setdisplay sidebar P9DWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=758,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P9D dummy
execute align x align y align z if entity @a[x=758,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P9D 1

execute if entity @e[scores={Incorrect_P9D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P9D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P9D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P9D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P9D=1}] run title @a subtitle {"text":"MCEdit wasn't created by sk89q", "color":"white"}
execute if entity @e[scores={Incorrect_P9D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: sk89q created WorldEdit. Now do this consequence that's loosely based on the answer you chose but we can't tell you or we will spoil the surprise.","color":"red"}]

execute if entity @e[scores={Incorrect_P9D=1}] run setblock 770 57 1078 air
execute if entity @e[scores={Incorrect_P9D=1}] run setblock 770 57 1078 shulker_box[facing=down]{Items:[{Slot:0b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:201}},{Slot:1b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:202}},{Slot:2b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:203}},{Slot:3b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:204}},{Slot:4b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:205}},{Slot:5b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:206}},{Slot:6b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:207}},{Slot:7b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:208}},{Slot:8b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:209}},{Slot:9b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:210}},{Slot:10b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:211}},{Slot:11b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:212}},{Slot:12b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:213}},{Slot:13b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:214}},{Slot:14b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:215}},{Slot:15b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:216}},{Slot:16b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:217}},{Slot:17b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:218}},{Slot:18b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:219}},{Slot:19b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:220}},{Slot:20b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:221}},{Slot:21b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:222}},{Slot:22b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:223}},{Slot:23b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:224}},{Slot:24b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:225}}]}


execute if entity @e[scores={Incorrect_P9D=1}] run gamerule doEntityDrops true
execute if entity @e[scores={Incorrect_P9D=1}] run kill @e[tag=P9DFrame]
execute align x align y align z run kill @e[type=item,x=758,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:item_frame"}}]

execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame1] run summon item_frame 772 63 1080 {Facing:2b,Tags:["P9DFrame1","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame2] run summon item_frame 771 63 1080 {Facing:2b,Tags:["P9DFrame2","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame3] run summon item_frame 770 63 1080 {Facing:2b,Tags:["P9DFrame3","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame4] run summon item_frame 769 63 1080 {Facing:2b,Tags:["P9DFrame4","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame5] run summon item_frame 768 63 1080 {Facing:2b,Tags:["P9DFrame5","P9DFrame"]}

execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame6] run summon item_frame 772 62 1080 {Facing:2b,Tags:["P9DFrame6","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame7] run summon item_frame 771 62 1080 {Facing:2b,Tags:["P9DFrame7","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame8] run summon item_frame 770 62 1080 {Facing:2b,Tags:["P9DFrame8","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame9] run summon item_frame 769 62 1080 {Facing:2b,Tags:["P9DFrame9","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame10] run summon item_frame 768 62 1080 {Facing:2b,Tags:["P9DFrame10","P9DFrame"]}

execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame11] run summon item_frame 772 61 1080 {Facing:2b,Tags:["P9DFrame11","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame12] run summon item_frame 771 61 1080 {Facing:2b,Tags:["P9DFrame12","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame13] run summon item_frame 770 61 1080 {Facing:2b,Tags:["P9DFrame13","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame14] run summon item_frame 769 61 1080 {Facing:2b,Tags:["P9DFrame14","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame15] run summon item_frame 768 61 1080 {Facing:2b,Tags:["P9DFrame15","P9DFrame"]}

execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame16] run summon item_frame 772 60 1080 {Facing:2b,Tags:["P9DFrame16","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame17] run summon item_frame 771 60 1080 {Facing:2b,Tags:["P9DFrame17","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame18] run summon item_frame 770 60 1080 {Facing:2b,Tags:["P9DFrame18","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame19] run summon item_frame 769 60 1080 {Facing:2b,Tags:["P9DFrame19","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame20] run summon item_frame 768 60 1080 {Facing:2b,Tags:["P9DFrame20","P9DFrame"]}

execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame21] run summon item_frame 772 59 1080 {Facing:2b,Tags:["P9DFrame21","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame22] run summon item_frame 771 59 1080 {Facing:2b,Tags:["P9DFrame22","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame23] run summon item_frame 770 59 1080 {Facing:2b,Tags:["P9DFrame23","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame24] run summon item_frame 769 59 1080 {Facing:2b,Tags:["P9DFrame24","P9DFrame"]}
execute unless entity @e[scores={P9DWin=1..}] unless entity @e[scores={P9D_End=1..}] unless entity @e[tag=P9DFrame25] run summon item_frame 768 59 1080 {Facing:2b,Tags:["P9DFrame25","P9DFrame"]}

execute as @e[tag=P9DFrame,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}
execute align x align y align z as @e[type=item,x=758,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:filled_map"}},nbt=!{Item:{tag:{HideFlags:32}}}] run data merge entity @s {Item:{tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']}}}}


tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:201}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:201}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:202}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:202}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:203}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:203}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:204}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:204}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:205}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:205}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:206}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:206}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:207}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:207}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:208}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:208}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:209}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:209}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:210}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:210}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:211}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:211}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:212}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:212}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:213}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:213}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:214}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:214}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:215}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:215}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:216}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:216}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:217}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:217}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:218}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:218}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:219}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:219}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:220}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:220}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:221}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:221}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:222}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:222}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:223}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:223}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:224}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:224}}}
tag @e remove P9DNamedFrame

tag @e[type=item_frame,nbt={Item:{tag:{HideFlags:32,map:225}}}] add P9DNamedFrame
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:air"}}
execute as @e[tag=P9DNamedFrame] run data merge entity @s {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:225}}}
tag @e remove P9DNamedFrame

execute if block 770 58 1079 stone_button[powered=true] run playsound entity.shulker.shoot master @a 770 58 1079 1 1.5 0
execute if block 770 58 1079 stone_button[powered=true] run clear @a filled_map
execute if block 770 58 1079 stone_button[powered=true] run kill @e[type=item,x=758,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:filled_map"}}]
execute if block 770 58 1079 stone_button[powered=true] run kill @e[tag=P9DFrame]
execute if block 770 58 1079 stone_button[powered=true] run setblock 770 57 1078 air
execute if block 770 58 1079 stone_button[powered=true] run setblock 770 57 1078 shulker_box[facing=down]{Items:[{Slot:0b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:201}},{Slot:1b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:202}},{Slot:2b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:203}},{Slot:3b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:204}},{Slot:4b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:205}},{Slot:5b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:206}},{Slot:6b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:207}},{Slot:7b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:208}},{Slot:8b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:209}},{Slot:9b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:210}},{Slot:10b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:211}},{Slot:11b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:212}},{Slot:12b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:213}},{Slot:13b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:214}},{Slot:14b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:215}},{Slot:15b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:216}},{Slot:16b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:217}},{Slot:17b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:218}},{Slot:18b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:219}},{Slot:19b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:220}},{Slot:20b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:221}},{Slot:21b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:222}},{Slot:22b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:223}},{Slot:23b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:224}},{Slot:24b,id:"minecraft:filled_map",Count:1b,tag:{HideFlags:32,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Puzzle Piece\"}",Lore:['{"text":"Bringing back any memories?","italic":"true","color":"dark_purple"}']},map:225}}]}

execute if block 770 58 1079 stone_button[powered=true] run setblock 770 58 1079 stone_button[face=wall,facing=north,powered=false] 

effect give @a[tag=WrongAnswer] night_vision 12 255 true
effect clear @a[tag=!WrongAnswer] night_vision



# TO WIN
execute if entity @e[tag=P9DFrame1,nbt={Item:{id:"minecraft:filled_map",tag:{map:209}}}] if entity @e[tag=P9DFrame2,nbt={Item:{id:"minecraft:filled_map",tag:{map:205}}}] if entity @e[tag=P9DFrame3,nbt={Item:{id:"minecraft:filled_map",tag:{map:213}}}] if entity @e[tag=P9DFrame4,nbt={Item:{id:"minecraft:filled_map",tag:{map:219}}}] if entity @e[tag=P9DFrame5,nbt={Item:{id:"minecraft:filled_map",tag:{map:202}}}] if entity @e[tag=P9DFrame6,nbt={Item:{id:"minecraft:filled_map",tag:{map:210}}}] if entity @e[tag=P9DFrame7,nbt={Item:{id:"minecraft:filled_map",tag:{map:216}}}] if entity @e[tag=P9DFrame8,nbt={Item:{id:"minecraft:filled_map",tag:{map:225}}}] if entity @e[tag=P9DFrame9,nbt={Item:{id:"minecraft:filled_map",tag:{map:223}}}] if entity @e[tag=P9DFrame10,nbt={Item:{id:"minecraft:filled_map",tag:{map:206}}}] if entity @e[tag=P9DFrame11,nbt={Item:{id:"minecraft:filled_map",tag:{map:217}}}] if entity @e[tag=P9DFrame12,nbt={Item:{id:"minecraft:filled_map",tag:{map:203}}}] if entity @e[tag=P9DFrame13,nbt={Item:{id:"minecraft:filled_map",tag:{map:214}}}] if entity @e[tag=P9DFrame14,nbt={Item:{id:"minecraft:filled_map",tag:{map:211}}}] if entity @e[tag=P9DFrame15,nbt={Item:{id:"minecraft:filled_map",tag:{map:220}}}] if entity @e[tag=P9DFrame16,nbt={Item:{id:"minecraft:filled_map",tag:{map:207}}}] if entity @e[tag=P9DFrame17,nbt={Item:{id:"minecraft:filled_map",tag:{map:222}}}] if entity @e[tag=P9DFrame18,nbt={Item:{id:"minecraft:filled_map",tag:{map:204}}}] if entity @e[tag=P9DFrame19,nbt={Item:{id:"minecraft:filled_map",tag:{map:218}}}] if entity @e[tag=P9DFrame20,nbt={Item:{id:"minecraft:filled_map",tag:{map:215}}}] if entity @e[tag=P9DFrame21,nbt={Item:{id:"minecraft:filled_map",tag:{map:224}}}] if entity @e[tag=P9DFrame22,nbt={Item:{id:"minecraft:filled_map",tag:{map:201}}}] if entity @e[tag=P9DFrame23,nbt={Item:{id:"minecraft:filled_map",tag:{map:212}}}] if entity @e[tag=P9DFrame24,nbt={Item:{id:"minecraft:filled_map",tag:{map:208}}}] if entity @e[tag=P9DFrame25,nbt={Item:{id:"minecraft:filled_map",tag:{map:221}}}] run scoreboard objectives add P9DWin dummy

scoreboard players add @e[tag=MainTriviaAEC] P9DWin 1
execute if entity @e[scores={P9DWin=1}] as @e[tag=P9DFrame] run data merge entity @s {Invulnerable:true}
execute if entity @e[scores={P9DWin=1}] run gamerule doEntityDrops false

execute if entity @e[scores={P9DWin=1}] run playsound ui.toast.challenge_complete master @a 770 61 1081 1 0.6 1
execute if entity @e[scores={P9DWin=200..}] run kill @e[tag=P9DFrame]
execute if entity @e[scores={P9DWin=200..}] run teleport @a[tag=WrongAnswer] 932 67 1000 0 0




#1 - 209
#2 - 205
#3 - 213
#4 - 219
#5 - 202
#6 - 210
#7 - 216
#8 - 225
#9 - 223
#10 - 206
#11 - 217
#12 - 203
#13 - 214
#14 - 211
#15 - 220
#16 - 207
#17 - 222
#18 - 204
#19 - 218
#20 - 215
#21 - 224
#22 - 201
#23 - 212
#24 - 208
#25 - 221







# END SAFEGUARD
execute align x align y align z unless entity @a[x=758,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add P9D_End dummy
execute align x align y align z if entity @a[x=758,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove P9D_End
execute align x align y align z unless entity @a[x=758,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P9D_End 1

execute if entity @e[scores={P9D_End=25..}] run clear @a
execute if entity @e[scores={P9D_End=25..}] run gamerule doEntityDrops false
execute if entity @e[scores={P9D_End=25..}] run scoreboard objectives remove P9DWin
execute if entity @e[scores={P9D_End=25..}] run scoreboard objectives remove Incorrect_P9D
execute if entity @e[scores={P9D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P9D_End=25..}] run scoreboard objectives remove P9D_End