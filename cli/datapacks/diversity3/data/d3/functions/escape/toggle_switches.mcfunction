####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# FEBRUARY 19 2018 / JUNE 22 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar CreeperLaunch


# SUMMON MINECART 1
scoreboard objectives add EscapeCart1 dummy
scoreboard players set @e[tag=MainEscapeAEC] EscapeCart1 0
execute align x align y align z if entity @e[type=minecart,x=-1000,y=12,z=809,distance=..1] run scoreboard players set @e[tag=MainEscapeAEC] EscapeCart1 1
execute if entity @e[scores={EscapeCart1=0}] if block -1000 13 808 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -1000 12 809 1 0.7 0
execute if entity @e[scores={EscapeCart1=0}] if block -1000 13 808 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -1000 12 809 1 0.8 0
execute if entity @e[scores={EscapeCart1=0}] if block -1000 13 808 oak_button[powered=true] run particle cloud -1000 12 809 0.5 0.5 0.5 0 1000
execute if entity @e[scores={EscapeCart1=0}] if block -1000 13 808 oak_button[powered=true] run summon minecart -1000 12 809.6 {Tags:["EscapeMinecart"]}
execute if block -1000 13 808 oak_button[powered=true] run setblock -1000 13 808 oak_button[powered=false,face=floor,facing=south]



# SUMMON MINECART 2
scoreboard objectives add EscapeCart2 dummy
scoreboard players set @e[tag=MainEscapeAEC] EscapeCart2 0
execute align x align y align z if entity @e[type=minecart,x=-1000,y=12,z=979,distance=..1] run scoreboard players set @e[tag=MainEscapeAEC] EscapeCart2 1
execute if entity @e[scores={EscapeCart2=0}] if block -1000 13 980 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -1000 12 979 1 0.7 0
execute if entity @e[scores={EscapeCart2=0}] if block -1000 13 980 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -1000 12 979 1 0.8 0
execute if entity @e[scores={EscapeCart2=0}] if block -1000 13 980 oak_button[powered=true] run particle cloud -1000 12 979 0.5 0.5 0.5 0 1000
execute if entity @e[scores={EscapeCart2=0}] if block -1000 13 980 oak_button[powered=true] run summon minecart -1000 12 979.4 {Tags:["EscapeMinecart"]}
execute if block -1000 13 980 oak_button[powered=true] run setblock -1000 13 980 oak_button[powered=false,face=floor,facing=south]



# LEVITATION POLES RESET
execute if entity @e[scores={EscapeLevel=..2}] run setblock -982 67 1009 lever[face=floor,facing=west,powered=false]
execute if entity @e[scores={EscapeLevel=..2}] run setblock -1053 89 973 lever[face=floor,facing=east,powered=false]
execute if entity @e[scores={EscapeLevel=..2}] run setblock -991 88 991 lever[face=floor,facing=north,powered=false]
execute if entity @e[scores={EscapeLevel=..2}] run setblock -967 90 1033 lever[face=floor,facing=north,powered=false]
execute if entity @e[scores={EscapeLevel=..2}] run setblock -1036 111 935 lever[face=floor,facing=south,powered=false]


# WHITE LEVITATION POLE
execute if block -982 67 1009 lever[powered=false] run fill -981 66 1007 -979 66 1011 white_stained_glass replace air
execute if block -982 67 1009 lever[powered=false] run fill -980 12 1009 -980 65 1009 air replace white_stained_glass_pane
execute if block -982 67 1009 lever[powered=true] if block -980 66 1009 white_stained_glass run playsound entity.player.levelup master @a -982 67 1009
execute if block -982 67 1009 lever[powered=true] run fill -981 66 1007 -979 66 1011 air destroy
execute if block -982 67 1009 lever[powered=true] run fill -980 12 1009 -980 65 1009 white_stained_glass_pane replace air
execute if block -982 67 1009 lever[powered=true] align x align y align z run effect give @a[x=-980,y=12,z=1009,dx=0,dy=50,dz=0] levitation 1 10


# ORANGE LEVITATION POLE
execute if block -1053 89 973 lever[powered=false] run fill -1056 88 971 -1054 88 975 orange_stained_glass replace air
execute if block -1053 89 973 lever[powered=false] run fill -1055 12 973 -1055 87 973 air replace orange_stained_glass_pane
execute if block -1053 89 973 lever[powered=true] if block -1055 88 973 orange_stained_glass run playsound entity.player.levelup master @a -1053 89 973
execute if block -1053 89 973 lever[powered=true] run fill -1056 88 971 -1054 88 975 air destroy
execute if block -1053 89 973 lever[powered=true] run fill -1055 12 973 -1055 87 973 orange_stained_glass_pane replace air
execute if block -1053 89 973 lever[powered=true] align x align y align z run effect give @a[x=-1055,y=12,z=973,dx=0,dy=75,dz=0] levitation 1 10


# LIME LEVITATION POLE
execute if block -991 88 991 lever[powered=false] run fill -993 87 992 -989 87 994 lime_stained_glass replace air
execute if block -991 88 991 lever[powered=false] run fill -991 12 993 -991 86 993 air replace lime_stained_glass_pane
execute if block -991 88 991 lever[powered=true] if block -991 87 993 lime_stained_glass run playsound entity.player.levelup master @a -991 88 991
execute if block -991 88 991 lever[powered=true] run fill -993 87 992 -989 87 994 air destroy
execute if block -991 88 991 lever[powered=true] run fill -991 12 993 -991 86 993 lime_stained_glass_pane replace air
execute if block -991 88 991 lever[powered=true] align x align y align z run effect give @a[x=-991,y=12,z=993,dx=0,dy=74,dz=0] levitation 1 10


# LIGHT BLUE LEVITATION POLE
execute if block -967 90 1033 lever[powered=false] run fill -969 89 1034 -965 89 1036 light_blue_stained_glass replace air
execute if block -967 90 1033 lever[powered=false] run fill -967 12 1035 -967 88 1035 air replace light_blue_stained_glass_pane
execute if block -967 90 1033 lever[powered=true] if block -967 89 1035 light_blue_stained_glass run playsound entity.player.levelup master @a -967 90 1033
execute if block -967 90 1033 lever[powered=true] run fill -969 89 1034 -965 89 1036 air destroy
execute if block -967 90 1033 lever[powered=true] run fill -967 12 1035 -967 88 1035 light_blue_stained_glass_pane replace air
execute if block -967 90 1033 lever[powered=true] align x align y align z run effect give @a[x=-967,y=12,z=1035,dx=0,dy=76,dz=0] levitation 1 10


# PURPLE LEVITATION POLE
execute if block -1036 111 935 lever[powered=false] run fill -1038 110 932 -1034 110 934 purple_stained_glass replace air
execute if block -1036 111 935 lever[powered=false] run fill -1036 12 933 -1036 109 933 air replace purple_stained_glass_pane
execute if block -1036 111 935 lever[powered=true] if block -1036 110 933 purple_stained_glass run playsound entity.player.levelup master @a -1036 111 935
execute if block -1036 111 935 lever[powered=true] run fill -1038 110 932 -1034 110 934 air destroy
execute if block -1036 111 935 lever[powered=true] run fill -1036 12 933 -1036 109 933 purple_stained_glass_pane replace air
execute if block -1036 111 935 lever[powered=true] align x align y align z run effect give @a[x=-1036,y=12,z=933,dx=0,dy=95,dz=0] levitation 1 10



# CREEPER LAUNCH
execute if block -991 54 1011 stone_button[powered=true] run scoreboard objectives add CreeperLaunch dummy
scoreboard players add @e[tag=MainEscapeAEC] CreeperLaunch 1
execute if block -991 54 1011 stone_button[powered=false] run scoreboard objectives remove CreeperLaunch

execute if entity @e[scores={CreeperLaunch=1}] run effect give @a[x=-994,y=53,z=1006,dx=6,dy=6,dz=6] resistance 2 10 true
execute if entity @e[scores={CreeperLaunch=1}] run summon creeper -991 53 1009 {Fuse:0}
execute if entity @e[scores={CreeperLaunch=2}] run summon creeper -991 54 1009 {Fuse:0}
execute if entity @e[scores={CreeperLaunch=2}] run setblock -991 53 1009 quartz_pillar[axis=y]

execute if block -991 54 1011 stone_button[powered=false] run fill -991 53 1009 -991 53 1009 air replace quartz_pillar



# SUMMON GLORIOUS BOW
execute if block -990 67 1009 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -991 68 1009 1 0.7 0
execute if block -990 67 1009 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -991 68 1009 1 0.8 0
execute if block -990 67 1009 oak_button[powered=true] run particle cloud -991 68 1009 0.3 0.3 0.3 0 100
execute if block -990 67 1009 oak_button[powered=true] run summon item -991 68 1009 {Item:{id:"minecraft:bow",Count:1,tag:{Unbreakable:true,HideFlags:4,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"Glorious Bow\"}",Lore:['{"text":"The arrow never gets any credit.","italic":"true","color":"dark_aqua"}']},Enchantments:[{id:"minecraft:infinity",lvl:1}]}}}
execute if block -990 67 1009 oak_button[powered=true] run summon item -991 68 1009 {Item:{id:"minecraft:arrow",Count:1}}
execute if block -990 67 1009 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -990 67 1009 oak_button[powered=true] run setblock -990 67 1009 oak_button[powered=false,facing=east,face=wall]


# SUMMON KNOCKBAXE
execute if block -1013 98 973 oak_button[powered=true] run scoreboard players set @e[tag=MainEscapeAEC] Creeper0 0
execute if block -1013 98 973 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -1012 99 973 1 0.7 0
execute if block -1013 98 973 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -1012 99 973 1 0.8 0
execute if block -1013 98 973 oak_button[powered=true] run particle cloud -1012 99 973 0.3 0.3 0.3 0 100
execute if block -1013 98 973 oak_button[powered=true] run summon item -1012 99 973 {Item:{id:"minecraft:golden_axe",Count:1,tag:{Unbreakable:true,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"green\",\"text\":\"Knockbaxe\"}",Lore:['{"text":"Works best with creepers. Also friends.","italic":"true","color":"dark_aqua"}']},Enchantments:[{id:"minecraft:knockback",lvl:2}]}}}
execute if block -1013 98 973 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -1013 98 973 oak_button[powered=true] run setblock -1013 98 973 oak_button[powered=false,facing=west,face=wall]


# SUMMON BUCKET
execute if block -966 88 998 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -966 89 999 1 0.7 0
execute if block -966 88 998 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -966 89 999 1 0.8 0
execute if block -966 88 998 oak_button[powered=true] run particle cloud -966 89 999 0.3 0.3 0.3 0 100
#execute if block -966 88 998 oak_button[powered=true] run summon item -966 89 999 {Item:{id:"minecraft:water_bucket",Count:1,tag:{HideFlags:16,CanPlaceOn:["minecraft:gravel"],display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Gravel Bucket\"}",Lore:["Seems to only work on gravel. As if that's realistic..."]}}}}

execute if block -966 88 998 oak_button[powered=true] run summon item -966 89 999 {Item:{id:"minecraft:water_bucket",Count:1,tag:{HideFlags:16,CanPlaceOn:["minecraft:gravel","minecraft:prismarine_brick_slab","minecraft:barrier"],display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Gravel Bucket\"}",Lore:['{"text":"Seems to only work on gravel.","italic":"true","color":"dark_aqua"}','{"text":"As if that\'s realistic...","italic":"true","color":"dark_aqua"}']}}}}
execute if block -966 88 998 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -966 88 998 oak_button[powered=true] run setblock -966 88 998 oak_button[powered=false,facing=north,face=wall]


# SUMMON WIRE CUTTERS
execute if block -999 102 1032 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -1000 103 1032 1 0.7 0
execute if block -999 102 1032 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -1000 103 1032 1 0.8 0
execute if block -999 102 1032 oak_button[powered=true] run particle cloud -1000 103 1032 0.3 0.3 0.3 0 100
execute if block -999 102 1032 oak_button[powered=true] run summon item -1000 103 1032 {Item:{id:"minecraft:shears",Count:1,tag:{Unbreakable:true,HideFlags:63,CanDestroy:["minecraft:white_wool","minecraft:orange_wool","minecraft:magenta_wool","minecraft:light_blue_wool","minecraft:yellow_wool","minecraft:lime_wool","minecraft:pink_wool","minecraft:cyan_wool","minecraft:purple_wool","minecraft:blue_wool","minecraft:green_wool","minecraft:red_wool"],display:{Name:"{\"italic\":false,\"color\":\"light_purple\",\"text\":\"Wire Snippers\"}",Lore:['{"text":"A little dull.","italic":"true","color":"dark_aqua"}','{"text":"Will only cut the fluffy parts of the wire.","italic":"true","color":"dark_aqua"}']}}}}
execute if block -999 102 1032 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -999 102 1032 oak_button[powered=true] run setblock -999 102 1032 oak_button[powered=false,facing=east,face=wall]


# SUMMON SHADY BOOK
execute if block -991 111 987 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -991 112 986 1 0.7 0
execute if block -991 111 987 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -991 112 986 1 0.8 0
execute if block -991 111 987 oak_button[powered=true] run particle cloud -991 112 986 0.3 0.3 0.3 0 100
execute if block -991 111 987 oak_button[powered=true] run summon item -991 112 986 {Item:{id:"minecraft:written_book",Count:1,tag:{pages:["{\"text\":\"Thank you for your purchase. Your new device packs the explosive power of 1,024 creepers.\\n\\nShady Steve's Discount Explosives, Co. sources its gunpowder from naturally-spawned, free-range creepers.\"}","{\"text\":\"Should you activate your new device by accident, simply cut the wire described by the following three cryptic criteria to stop the countdown:\\n\\n1. The correct wire crosses over or under exactly 3 other wires.\"}","{\"text\":\"2. The correct wire ends 3 places from where it starts.\\n\\n3. The correct wire is not not not not not not not not on the ceiling.\\n\\nOnce again, thank you for doing business with Shady Steve's.\"}"],title:"Owner's Manual",author:"Shady Steve"}}}
execute if block -991 111 987 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -991 111 987 oak_button[powered=true] run setblock -991 111 987 oak_button[powered=false,facing=south,face=wall]


# SUMMON SHIELD
execute if block -1036 120 951 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -1036 121 952 1 0.7 0
execute if block -1036 120 951 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -1036 121 952 1 0.8 0
execute if block -1036 120 951 oak_button[powered=true] run particle cloud -1036 121 952 0.3 0.3 0.3 0 100
execute if block -1036 120 951 oak_button[powered=true] run kill @e[tag=RandomShield]
execute if block -1036 120 951 oak_button[powered=true] run summon area_effect_cloud -1036 121 952 {Tags:["RandomShield","RandomShield1"],Duration:1}
execute if block -1036 120 951 oak_button[powered=true] run summon area_effect_cloud -1036 121 952 {Tags:["RandomShield","RandomShield2"],Duration:1}
execute if block -1036 120 951 oak_button[powered=true] run summon area_effect_cloud -1036 121 952 {Tags:["RandomShield","RandomShield3"],Duration:1}
execute if block -1036 120 951 oak_button[powered=true] run summon area_effect_cloud -1036 121 952 {Tags:["RandomShield","RandomShield4"],Duration:1}
execute if block -1036 120 951 oak_button[powered=true] run summon area_effect_cloud -1036 121 952 {Tags:["RandomShield","RandomShield5"],Duration:1}
execute if block -1036 120 951 oak_button[powered=true] run kill @e[tag=RandomShield,sort=random,limit=1]
execute if block -1036 120 951 oak_button[powered=true] run kill @e[tag=RandomShield,sort=random,limit=1]
execute if block -1036 120 951 oak_button[powered=true] run kill @e[tag=RandomShield,sort=random,limit=1]
execute if block -1036 120 951 oak_button[powered=true] run kill @e[tag=RandomShield,sort=random,limit=1]
execute if block -1036 120 951 oak_button[powered=true] at @e[tag=RandomShield1] run summon item ~ ~ ~ {Item:{id:"minecraft:shield",Count:1,tag:{HideFlags:63,BlockEntityTag:{Patterns:[{Pattern:ts,Color:15},{Pattern:ss,Color:0},{Pattern:sc,Color:4},{Pattern:hhb,Color:14},{Pattern:br,Color:6},{Pattern:bo,Color:4}]},Unbreakable:1,display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Monstrous Shield\"}",Lore:['{"text":"It\'s a poor design but includes a third eye","italic":"true","color":"dark_aqua"}']}}}}
execute if block -1036 120 951 oak_button[powered=true] at @e[tag=RandomShield2] run summon item ~ ~ ~ {Item:{id:"minecraft:shield",Count:1,tag:{HideFlags:63,BlockEntityTag:{Patterns:[{Pattern:bri,Color:4},{Pattern:hh,Color:10},{Pattern:flo,Color:5},{Pattern:bo,Color:10},{Pattern:mc,Color:5},{Pattern:cbo,Color:10}]},Unbreakable:1,display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Monstrous Shield\"}",Lore:['{"text":"Good protection but adds controversy to pizza","italic":"true","color":"dark_aqua"}']}}}}
execute if block -1036 120 951 oak_button[powered=true] at @e[tag=RandomShield3] run summon item ~ ~ ~ {Item:{id:"minecraft:shield",Count:1,tag:{HideFlags:63,BlockEntityTag:{Patterns:[{Pattern:mr,Color:12},{Pattern:mr,Color:1},{Pattern:ms,Color:14},{Pattern:ms,Color:6},{Pattern:hh,Color:5},{Pattern:bo,Color:9},{Pattern:mc,Color:14},{Pattern:mc,Color:6}]},Unbreakable:1,display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Monstrous Shield\"}",Lore:['{"text":"It\'s cold and starting to drip","italic":"true","color":"dark_aqua"}']}}}}
execute if block -1036 120 951 oak_button[powered=true] at @e[tag=RandomShield4] run summon item ~ ~ ~ {Item:{id:"minecraft:shield",Count:1,tag:{HideFlags:63,BlockEntityTag:{Patterns:[{Pattern:cre,Color:15},{Pattern:ss,Color:0},{Pattern:hhb,Color:4},{Pattern:tt,Color:4},{Pattern:sc,Color:4},{Pattern:ms,Color:4},{Pattern:ts,Color:4},{Pattern:moj,Color:15},{Pattern:tt,Color:4},{Pattern:ms,Color:4},{Pattern:bo,Color:4},{Pattern:ms,Color:4}]},Unbreakable:1,display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Monstrous Shield\"}",Lore:['{"text":"Holding this brings nothing but despair","italic":"true","color":"dark_aqua"}']}}}}
execute if block -1036 120 951 oak_button[powered=true] at @e[tag=RandomShield5] run summon item ~ ~ ~ {Item:{id:"minecraft:shield",Count:1,tag:{HideFlags:63,BlockEntityTag:{Patterns:[{Pattern:hb,Color:0},{Pattern:hhb,Color:0},{Pattern:mr,Color:6},{Pattern:mr,Color:6},{Pattern:tt,Color:0}]},Unbreakable:1,display:{Name:"{\"italic\":false,\"color\":\"yellow\",\"text\":\"Monstrous Shield\"}",Lore:['{"text":"It resonates with evil","italic":"true","color":"dark_aqua"}']}}}}
execute if block -1036 120 951 oak_button[powered=true] run kill @e[type=arrow,nbt={inGround:1b}]
execute if block -1036 120 951 oak_button[powered=true] run setblock -1036 120 951 oak_button[powered=false,facing=north,face=wall]