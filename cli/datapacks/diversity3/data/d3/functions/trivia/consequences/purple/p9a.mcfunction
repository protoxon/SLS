####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 932 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P9A
#scoreboard objectives setdisplay sidebar P9APoison
#scoreboard objectives setdisplay sidebar P9AASTotal
#scoreboard objectives setdisplay sidebar P9AAccident

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=758,y=54,z=1007,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P9A dummy
execute align x align y align z if entity @a[x=758,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P9A 1

execute if entity @e[scores={Incorrect_P9A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P9A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P9A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P9A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P9A=1}] run title @a subtitle {"text":"MCEdit was not created by Captain_Chaos", "color":"white"}
execute if entity @e[scores={Incorrect_P9A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Captain_Chaos created the WorldPainter Minecraft mod. Looks like you'll have to paint these old worn out traffic lines to get out of this one.","color":"red"}]

execute if entity @e[scores={Incorrect_P9A=1}] run kill @e[tag=P9AAS]
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 771 55 1013 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 770 55 1013 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 770 55 1015 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 769 55 1015 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 767 55 1015 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 771 55 1017 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 770 55 1017 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 769 55 1017 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 770 55 1019 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 768 55 1019 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}
execute if entity @e[scores={Incorrect_P9A=1}] run summon armor_stand 767 55 1019 {NoGravity:true,Invisible:true,Invulnerable:true,ShowArms:true,Tags:["P9AAS"]}

execute if entity @e[scores={Incorrect_P9A=1}] run setblock 771 57 1025 air
execute if entity @e[scores={Incorrect_P9A=1}] run setblock 771 57 1025 chest[facing=north]{Items:[{Slot: 0b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 1b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 2b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 3b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 4b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 5b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 6b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 7b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 8b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 9b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 10b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 11b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 12b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 13b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 14b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 15b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 16b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 17b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 18b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 19b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 20b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 21b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 22b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 23b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 24b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 25b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}},{Slot: 26b, id: "minecraft:milk_bucket", Count: 1b, tag: {display: {Name: "{\"text\":\"Paint Bucket\",\"italic\":\"false\"}", Lore:["Apply to worn road paint segments"]}}}]}


execute if entity @e[scores={Incorrect_P9A=1}] at @e[tag=P9AAS] run fill ~ ~ ~ ~ ~ ~ diorite replace white_concrete
execute as @e[tag=P9AAS,nbt={HandItems:[{id:"minecraft:milk_bucket"}]}] at @s run fill ~ ~ ~ ~ ~ ~ white_concrete replace diorite
kill @e[tag=P9AAS,nbt={HandItems:[{id:"minecraft:milk_bucket"}]}]

scoreboard objectives add P9APoison minecraft.used:minecraft.milk_bucket
execute if entity @a[scores={P9APoison=1..}] run gamerule showDeathMessages false
kill @a[tag=WrongAnswer,scores={P9APoison=1..}]
execute if entity @a[scores={P9APoison=1..}] run tellraw @a {"text":"","color":"white","extra":[{"selector":"@a[scores={P9APoison=1..}]"},{"text":" drank paint"}]}
execute unless entity @a[scores={P9APoison=1..}] run gamerule showDeathMessages true
scoreboard players reset @a[scores={P9APoison=1..}] P9APoison


scoreboard objectives add P9AASTotal dummy
scoreboard players set @e[tag=MainTriviaAEC] P9AASTotal 0
execute as @e[tag=P9AAS] run scoreboard players add @e[tag=MainTriviaAEC] P9AASTotal 1

execute if entity @e[scores={P9AASTotal=..2}] run scoreboard objectives add P9AAccident dummy
execute if entity @e[scores={P9AASTotal=3..}] run scoreboard objectives remove P9AAccident
scoreboard players add @e[tag=MainTriviaAEC] P9AAccident 1
scoreboard players set @e[scores={P9AAccident=20..}] P9AAccident 0

execute if entity @e[scores={P9AAccident=1}] run kill @e[tag=P9AAEC]
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 758 56 1020 {Tags:["P9AEastAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 758 56 1019 {Tags:["P9AEastAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 758 56 1018 {Tags:["P9AEastAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 758 56 1017 {Tags:["P9AEastAEC","P9AAEC"],Duration:30}

execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 782 56 1012 {Tags:["P9AWestAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 782 56 1013 {Tags:["P9AWestAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 782 56 1014 {Tags:["P9AWestAEC","P9AAEC"],Duration:30}
execute if entity @e[scores={P9AAccident=1}] run summon area_effect_cloud 782 56 1015 {Tags:["P9AWestAEC","P9AAEC"],Duration:30}

execute if entity @e[scores={P9AAccident=1}] at @e[tag=P9AEastAEC,limit=1,sort=random] run summon minecart ~ ~ ~ {Invulnerable:true,Tags:["P8BEastCart","P8BMinecart"],Passengers:[{id:"minecraft:creeper",Invulnerable:true,Rotation:[270f,0f]}]}
execute if entity @e[scores={P9AAccident=10}] at @e[tag=P9AWestAEC,limit=1,sort=random] run summon minecart ~ ~ ~ {Invulnerable:true,Tags:["P8BWestCart","P8BMinecart"],Passengers:[{id:"minecraft:creeper",Invulnerable:true,Rotation:[90f,0f]}]}


execute align x align y align z as @e[tag=P8BEastCart] at @s run teleport @s ~1 ~ ~
execute align x align y align z as @e[tag=P8BWestCart] at @s run teleport @s ~-1 ~ ~
execute align x align y align z at @e[tag=P8BEastCart] run particle smoke ~-2 ~ ~ 0.1 0.1 0.1 0 5 force
execute align x align y align z at @e[tag=P8BEastCart] run playsound entity.guardian.attack master @a ~ ~ ~ 1 1.2 0
execute align x align y align z at @e[tag=P8BWestCart] run particle smoke ~2 ~ ~ 0.1 0.1 0.1 0 5 force
execute align x align y align z at @e[tag=P8BWestCart] run playsound entity.guardian.attack master @a ~ ~ ~ 1 0.9 0

execute align x align y align z run kill @e[tag=P8BEastCart,x=785,y=54,z=1007,dx=0,dy=24,dz=24]
execute align x align y align z run kill @e[tag=P8BWestCart,x=755,y=54,z=1007,dx=0,dy=24,dz=24]


execute as @a[tag=WrongAnswer] at @s if entity @e[tag=P8BMinecart,distance=..1.5] run summon creeper ~ ~ ~ {CustomName:"{\"text\":\"Minecart accident\",\"color\":\"white\"}",Fuse:0}





# END SAFEGUARD
execute align x align y align z unless entity @a[x=758,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives add P9A_End dummy
execute align x align y align z if entity @a[x=758,y=54,z=1007,dx=24,dy=24,dz=24] run scoreboard objectives remove P9A_End
execute align x align y align z unless entity @a[x=758,y=54,z=1007,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P9A_End 1

execute if entity @e[scores={P9A_End=25..}] run clear @a
execute if entity @e[scores={P9A_End=25..}] run scoreboard objectives remove P9AAccident
execute if entity @e[scores={P9A_End=25..}] run scoreboard objectives remove P9AASTotal
execute if entity @e[scores={P9A_End=25..}] run scoreboard objectives remove P9APoison
execute if entity @e[scores={P9A_End=25..}] run scoreboard objectives remove Incorrect_P9A
execute if entity @e[scores={P9A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P9A_End=25..}] run scoreboard objectives remove P9A_End