####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 13 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 71 1049

#scoreboard objectives setdisplay sidebar Incorrect_R6D
#scoreboard objectives setdisplay sidebar R6Dword
#scoreboard objectives setdisplay sidebar R6DWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=864,y=49,z=1162,dx=40,dy=29,dz=40] add WrongAnswer

scoreboard objectives add Incorrect_R6D dummy
execute align x align y align z if entity @a[x=864,y=49,z=1162,dx=40,dy=29,dz=40] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R6D 1

execute if entity @e[scores={Incorrect_R6D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R6D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R6D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R6D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R6D=1}] run title @a subtitle {"text":"N.B.T. is not Network Boolean Type", "color":"white"}
execute if entity @e[scores={Incorrect_R6D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: It doesn't stand for Ninja Beard Trimmer either. But these 4 are waiting for a shave.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R6D=1}] run setblock 884 50 1182 air
execute if entity @e[scores={Incorrect_R6D=2}] run setblock 884 50 1182 chest[facing=north]{Items: [{Slot: 1b, id: "minecraft:leather_chestplate", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Shirt\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 3b, id: "minecraft:leather_chestplate", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Shirt\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 5b, id: "minecraft:leather_chestplate", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Shirt\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 7b, id: "minecraft:leather_chestplate", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Shirt\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 10b, id: "minecraft:leather_leggings", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Pants\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 12b, id: "minecraft:leather_leggings", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Pants\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 14b, id: "minecraft:leather_leggings", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Pants\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 16b, id: "minecraft:leather_leggings", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Pants\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 19b, id: "minecraft:leather_boots", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Boots\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 21b, id: "minecraft:leather_boots", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Boots\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 23b, id: "minecraft:leather_boots", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Boots\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 25b, id: "minecraft:leather_boots", Count: 1b, tag: {display: {color: 1908001, Name: "{\"text\":\"Ninja Boots\",\"italic\":\"false\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 0b, id: "minecraft:wither_skeleton_skull", Count: 1b, tag: {display: {Name: "{\"text\":\"Ninja Mask\",\"italic\":\"false\",\"color\":\"white\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 2b, id: "minecraft:wither_skeleton_skull", Count: 1b, tag: {display: {Name: "{\"text\":\"Ninja Mask\",\"italic\":\"false\",\"color\":\"white\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 4b, id: "minecraft:wither_skeleton_skull", Count: 1b, tag: {display: {Name: "{\"text\":\"Ninja Mask\",\"italic\":\"false\",\"color\":\"white\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 6b, id: "minecraft:wither_skeleton_skull", Count: 1b, tag: {display: {Name: "{\"text\":\"Ninja Mask\",\"italic\":\"false\",\"color\":\"white\"}", Lore:['{"text":"Complete set gives wearer","italic":"true","color":"green"}','{"text":"special Ninja reflexes","italic":"true","color":"green"}']}, HideFlags:2}},{Slot: 9b, id: "minecraft:iron_sword", Count: 1b, tag: {display: {Name: "{\"text\":\"Katana\",\"italic\":\"false\"}", Lore:['{"text":"Great for trimming Ninja whiskers","italic":"true","color":"green"}']}, Unbreakable:true, CanDestroy:["minecraft:cobweb"], HideFlags:14}},{Slot: 11b, id: "minecraft:iron_sword", Count: 1b, tag: {display: {Name: "{\"text\":\"Katana\",\"italic\":\"false\"}", Lore:['{"text":"Great for trimming Ninja whiskers","italic":"true","color":"green"}']}, Unbreakable:true, CanDestroy:["minecraft:cobweb"], HideFlags:14}},{Slot: 13b, id: "minecraft:iron_sword", Count: 1b, tag: {display: {Name: "{\"text\":\"Katana\",\"italic\":\"false\"}", Lore:['{"text":"Great for trimming Ninja whiskers","italic":"true","color":"green"}']}, Unbreakable:true, CanDestroy:["minecraft:cobweb"], HideFlags:14}},{Slot: 15b, id: "minecraft:iron_sword", Count: 1b, tag: {display: {Name: "{\"text\":\"Katana\",\"italic\":\"false\"}", Lore:['{"text":"Great for trimming Ninja whiskers","italic":"true","color":"green"}']}, Unbreakable:true, CanDestroy:["minecraft:cobweb"], HideFlags:14}},]}

execute if entity @e[scores={Incorrect_R6D=1}] run fill 881 61 1190 887 61 1190 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run setblock 882 60 1191 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run setblock 886 60 1191 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 883 59 1191 885 59 1191 cobweb

execute if entity @e[scores={Incorrect_R6D=1}] run fill 876 61 1180 876 61 1184 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 875 59 1181 875 59 1183 cobweb

execute if entity @e[scores={Incorrect_R6D=1}] run fill 881 61 1174 887 61 1174 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 882 60 1173 883 60 1173 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 885 60 1173 886 60 1173 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 883 59 1173 885 59 1173 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run setblock 884 58 1173 cobweb

execute if entity @e[scores={Incorrect_R6D=1}] run fill 893 60 1180 893 60 1181 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 893 60 1183 893 60 1184 cobweb
execute if entity @e[scores={Incorrect_R6D=1}] run fill 893 59 1181 893 59 1183 cobweb


effect give @a[tag=WrongAnswer,nbt={Inventory: [{Slot: 100b, id: "minecraft:leather_boots"},{Slot: 101b, id: "minecraft:leather_leggings"},{Slot: 102b, id: "minecraft:leather_chestplate"},{Slot: 103b, id: "minecraft:wither_skeleton_skull"}]}] jump_boost 2 6 true
effect give @a[tag=WrongAnswer,nbt={Inventory: [{Slot: 100b, id: "minecraft:leather_boots"},{Slot: 101b, id: "minecraft:leather_leggings"},{Slot: 102b, id: "minecraft:leather_chestplate"},{Slot: 103b, id: "minecraft:wither_skeleton_skull"}]}] resistance 2 255 true
effect clear @a[nbt=!{Inventory: [{Slot: 100b, id: "minecraft:leather_boots"},{Slot: 101b, id: "minecraft:leather_leggings"},{Slot: 102b, id: "minecraft:leather_chestplate"},{Slot: 103b, id: "minecraft:wither_skeleton_skull"}]}] jump_boost

execute if entity @e[scores={Incorrect_R6D=..80}] run clear @a[tag=WrongAnswer] spawner

execute if entity @e[scores={Incorrect_R6D=80..}] if block 881 61 1190 air if block 882 61 1190 air if block 883 61 1190 air if block 884 61 1190 air if block 885 61 1190 air if block 886 61 1190 air if block 887 61 1190 air if block 882 60 1191 air if block 886 60 1191 air if block 883 59 1191 air if block 884 59 1191 air if block 885 59 1191 air if block 876 61 1180 air if block 876 61 1181 air if block 876 61 1182 air if block 876 61 1183 air if block 876 61 1184 air if block 875 59 1181 air if block 875 59 1182 air if block 875 59 1183 air if block 881 61 1174 air if block 882 61 1174 air if block 883 61 1174 air if block 884 61 1174 air if block 885 61 1174 air if block 886 61 1174 air if block 887 61 1174 air if block 882 60 1173 air if block 883 60 1173 air if block 885 60 1173 air if block 886 60 1173 air if block 883 59 1173 air if block 884 59 1173 air if block 885 59 1173 air if block 884 58 1173 air if block 893 60 1180 air if block 893 60 1181 air if block 893 60 1183 air if block 893 60 1184 air if block 893 59 1181 air if block 893 59 1182 air if block 893 59 1183 air run teleport @a[tag=WrongAnswer] 1000 67 1049 90 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=864,y=49,z=1162,dx=40,dy=29,dz=40] run scoreboard objectives add R6D_End dummy
execute align x align y align z if entity @a[x=864,y=49,z=1162,dx=40,dy=29,dz=40] run scoreboard objectives remove R6D_End
execute align x align y align z unless entity @a[x=864,y=49,z=1162,dx=40,dy=29,dz=40] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R6D_End 1

execute if entity @e[scores={R6D_End=25..}] run clear @a
execute if entity @e[scores={R6D_End=25..}] run scoreboard objectives remove R6DWin
execute if entity @e[scores={R6D_End=25..}] run scoreboard objectives remove R6DSword
execute if entity @e[scores={R6D_End=25..}] run scoreboard objectives remove Incorrect_R6D
execute if entity @e[scores={R6D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R6D_End=25..}] run scoreboard objectives remove R6D_End