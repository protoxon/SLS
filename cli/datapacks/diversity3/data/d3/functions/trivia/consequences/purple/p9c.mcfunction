####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 5 2018 / MARCH 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 932 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P9C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=758,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P9C dummy
execute align x align y align z if entity @a[x=758,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P9C 1

execute if entity @e[scores={Incorrect_P9C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P9C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P9C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P9C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P9C=1}] run title @a subtitle {"text":"MCEdit was not created by jaquadro", "color":"white"}
execute if entity @e[scores={Incorrect_P9C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: jaquadro has created many mods, including the file editing tool, NBTExplorer. But now you're the NBTExplorer! It's time to explore this place and locate the N, B, and T and place them in their rightful spots...","color":"red"}]

execute if entity @e[scores={Incorrect_P9C=1}] run kill @e[tag=P9CAS]
execute if entity @e[scores={Incorrect_P9C=1}] run summon armor_stand 762.3 61.61 1043.9 {Small:true,Invisible:true,Invulnerable:true,Pose:{RightArm:[180f,270f,180f]},NoGravity:true,ShowArms:true,Rotation:[180f,0f],HandItems:[{id:"minecraft:totem_of_undying",Count:1b,HideFlags:63,tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"N\"}"}}}],Tags:["P9CAS"]}
execute if entity @e[scores={Incorrect_P9C=1}] run summon armor_stand 776.6 59.61 1044.5 {Small:true,Invisible:true,Invulnerable:true,Pose:{RightArm:[180f,270f,180f]},NoGravity:true,ShowArms:true,Rotation:[245f,0f],HandItems:[{id:"minecraft:totem_of_undying",Count:1b,HideFlags:63,tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"B\"}"}}}],Tags:["P9CAS"]}
execute if entity @e[scores={Incorrect_P9C=1}] run summon armor_stand 778.2 58.1 1049.8 {Small:true,Invisible:true,Invulnerable:true,Pose:{RightArm:[180f,270f,180f]},NoGravity:true,ShowArms:true,Rotation:[90f,0f],HandItems:[{id:"minecraft:totem_of_undying",Count:1b,HideFlags:63,tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"T\"}"}}}],Tags:["P9CAS"]}

kill @e[tag=P9CAS,nbt=!{HandItems:[{Count:1b}]}]

execute if entity @e[scores={Incorrect_P9C=1}] run gamerule doEntityDrops true
execute if entity @e[scores={Incorrect_P9C=1}] run kill @e[tag=P9CFrame]
execute align x align y align z run kill @e[type=item,x=758,y=54,z=1037,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:item_frame"}}]
execute unless entity @e[tag=P9CNFrame] run summon item_frame 767 57 1051 {Facing:2b,Tags:["P9CNFrame","P9CFrame"]}
execute unless entity @e[tag=P9CBFrame] run summon item_frame 765 57 1051 {Facing:2b,Tags:["P9CBFrame","P9CFrame"]}
execute unless entity @e[tag=P9CTFrame] run summon item_frame 763 57 1051 {Facing:2b,Tags:["P9CTFrame","P9CFrame"]}
execute as @e[tag=P9CFrame,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}


# TO WIN
execute if entity @e[tag=P9CNFrame,nbt={Item:{tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"N\"}"}}}}] if entity @e[tag=P9CBFrame,nbt={Item:{tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"B\"}"}}}}] if entity @e[tag=P9CTFrame,nbt={Item:{tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"T\"}"}}}}] run teleport @a[tag=WrongAnswer] 932 67 1000 0 0




# END SAFEGUARD
execute align x align y align z unless entity @a[x=758,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add P9C_End dummy
execute align x align y align z if entity @a[x=758,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove P9C_End
execute align x align y align z unless entity @a[x=758,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P9C_End 1

execute if entity @e[scores={P9C_End=25..}] run clear @a
execute if entity @e[scores={P9C_End=25..}] run gamerule doEntityDrops false
execute if entity @e[scores={P9C_End=25..}] run scoreboard objectives remove Incorrect_P9C
execute if entity @e[scores={P9C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P9C_End=25..}] run scoreboard objectives remove P9C_End