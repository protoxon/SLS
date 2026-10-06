####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / SEPTEMBER 15 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ReceptionTimer
#scoreboard objectives setdisplay sidebar ZomboTimer
#scoreboard objectives setdisplay sidebar IntoCavern
#scoreboard objectives setdisplay sidebar Act3Sleeping
#scoreboard objectives setdisplay sidebar ObjectReturns


# CARRIED OVER FROM ACT 1
execute if entity @e[scores={AdventureLevel=40}] run scoreboard objectives remove ReceptionTimer




########## ACT 2 #############

execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=..39}] align x align y align z if entity @a[x=938,y=135,z=2082,dx=14,dy=5,dz=4] run scoreboard players set @e[scores={AdventureLevel=..39}] AdventureLevel 40

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"They sent ","color":"none","bold":false,"underlined":false},{"text":"Maintenance","color":"blue","bold":true,"underlined":false},{"text":" here to check on this?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=100}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=100}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"Oh sorry. You're obviously with ","color":"none","bold":false,"underlined":false},{"text":"Research","color":"gold","bold":true,"underlined":false},{"text":" now. Congrats with that.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=270}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=270}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"Anyway, something over from Main Base must have knocked out the ","color":"none","bold":false,"underlined":false},{"text":"Communications Grid","color":"gray","bold":true,"underlined":false},{"text":" here. Until we get it back online, I can't send anything back there.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=450}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=450}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"I gave up trying to configure the comparators a while ago, but if you wanna give it a shot, be my guest.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=550}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=550}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"I put all the parts back in the box inside the ","color":"none","bold":false,"underlined":false},{"text":"Grid Room","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=700}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=700}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"All the nodes have to be lit up, for the system to reboot. You can pull up any of the ones you messed up with that removal tool from the box too.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1100}] at @e[tag=AdventureIvanov] run playsound entity.villager.no master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1100}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"What a stupid system! I could have designed it way better, rather than using limited comparators.","color":"none","bold":false,"underlined":false}]


# SET UP SHULKER BOX WITH COMPARTORS
execute if entity @e[scores={AdventureLevel=20..42}] run fill 930 136 2083 930 136 2083 air replace redstone_torch
execute if entity @e[scores={AdventureLevel=20..39}] run fill 940 135 2088 950 135 2102 air replace comparator
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run fill 940 135 2089 950 135 2101 air replace comparator
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run gamerule doTileDrops true
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run setblock 938 136 2087 air
execute if entity @e[scores={AdventureLevel=40,AdventureTimer=1}] run setblock 938 136 2087 orange_shulker_box[facing=up]{Items:[{Slot:11b,id:"minecraft:comparator",Count:37b,tag:{CanPlaceOn:["minecraft:red_sand"]}},{Slot:15b,id:"minecraft:diamond_hoe",Count:1b,tag:{display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Comparator Removal Tool\"}",Lore:['{"text":"Why would anyone make a","italic":"true","color":"gold"}','{"text":"crowbar out of diamonds?","italic":"true","color":"gold"}']},HideFlags:14,Unbreakable:true,CanDestroy:["minecraft:comparator"]}}]}



execute if entity @e[scores={AdventureLevel=40}] if block 944 135 2087 redstone_lamp[lit=true] if block 940 135 2089 redstone_lamp[lit=true] if block 942 135 2089 redstone_lamp[lit=true] if block 944 135 2089 redstone_lamp[lit=true] if block 946 135 2089 redstone_lamp[lit=true] if block 948 135 2089 redstone_lamp[lit=true] if block 950 135 2089 redstone_lamp[lit=true] if block 940 135 2091 redstone_lamp[lit=true] if block 942 135 2091 redstone_lamp[lit=true] if block 944 135 2091 redstone_lamp[lit=true] if block 946 135 2091 redstone_lamp[lit=true] if block 948 135 2091 redstone_lamp[lit=true] if block 950 135 2091 redstone_lamp[lit=true] if block 940 135 2093 redstone_lamp[lit=true] if block 942 135 2093 redstone_lamp[lit=true] if block 944 135 2093 redstone_lamp[lit=true] if block 946 135 2093 redstone_lamp[lit=true] if block 948 135 2093 redstone_lamp[lit=true] if block 950 135 2093 redstone_lamp[lit=true] if block 940 135 2095 redstone_lamp[lit=true] if block 942 135 2095 redstone_lamp[lit=true] if block 944 135 2095 redstone_lamp[lit=true] if block 946 135 2095 redstone_lamp[lit=true] if block 948 135 2095 redstone_lamp[lit=true] if block 950 135 2095 redstone_lamp[lit=true] if block 940 135 2097 redstone_lamp[lit=true] if block 942 135 2097 redstone_lamp[lit=true] if block 944 135 2097 redstone_lamp[lit=true] if block 946 135 2097 redstone_lamp[lit=true] if block 948 135 2097 redstone_lamp[lit=true] if block 950 135 2097 redstone_lamp[lit=true] if block 940 135 2099 redstone_lamp[lit=true] if block 942 135 2099 redstone_lamp[lit=true] if block 944 135 2099 redstone_lamp[lit=true] if block 946 135 2099 redstone_lamp[lit=true] if block 948 135 2099 redstone_lamp[lit=true] if block 950 135 2099 redstone_lamp[lit=true] if block 940 135 2101 redstone_lamp[lit=true] if block 942 135 2101 redstone_lamp[lit=true] if block 944 135 2101 redstone_lamp[lit=true] if block 946 135 2101 redstone_lamp[lit=true] if block 948 135 2101 redstone_lamp[lit=true] if block 950 135 2101 redstone_lamp[lit=true] if block 946 135 2103 redstone_lamp[lit=true] run scoreboard players set @e[scores={AdventureLevel=40}] AdventureTimer 0

execute if entity @e[scores={AdventureLevel=40}] if block 944 135 2087 redstone_lamp[lit=true] if block 940 135 2089 redstone_lamp[lit=true] if block 942 135 2089 redstone_lamp[lit=true] if block 944 135 2089 redstone_lamp[lit=true] if block 946 135 2089 redstone_lamp[lit=true] if block 948 135 2089 redstone_lamp[lit=true] if block 950 135 2089 redstone_lamp[lit=true] if block 940 135 2091 redstone_lamp[lit=true] if block 942 135 2091 redstone_lamp[lit=true] if block 944 135 2091 redstone_lamp[lit=true] if block 946 135 2091 redstone_lamp[lit=true] if block 948 135 2091 redstone_lamp[lit=true] if block 950 135 2091 redstone_lamp[lit=true] if block 940 135 2093 redstone_lamp[lit=true] if block 942 135 2093 redstone_lamp[lit=true] if block 944 135 2093 redstone_lamp[lit=true] if block 946 135 2093 redstone_lamp[lit=true] if block 948 135 2093 redstone_lamp[lit=true] if block 950 135 2093 redstone_lamp[lit=true] if block 940 135 2095 redstone_lamp[lit=true] if block 942 135 2095 redstone_lamp[lit=true] if block 944 135 2095 redstone_lamp[lit=true] if block 946 135 2095 redstone_lamp[lit=true] if block 948 135 2095 redstone_lamp[lit=true] if block 950 135 2095 redstone_lamp[lit=true] if block 940 135 2097 redstone_lamp[lit=true] if block 942 135 2097 redstone_lamp[lit=true] if block 944 135 2097 redstone_lamp[lit=true] if block 946 135 2097 redstone_lamp[lit=true] if block 948 135 2097 redstone_lamp[lit=true] if block 950 135 2097 redstone_lamp[lit=true] if block 940 135 2099 redstone_lamp[lit=true] if block 942 135 2099 redstone_lamp[lit=true] if block 944 135 2099 redstone_lamp[lit=true] if block 946 135 2099 redstone_lamp[lit=true] if block 948 135 2099 redstone_lamp[lit=true] if block 950 135 2099 redstone_lamp[lit=true] if block 940 135 2101 redstone_lamp[lit=true] if block 942 135 2101 redstone_lamp[lit=true] if block 944 135 2101 redstone_lamp[lit=true] if block 946 135 2101 redstone_lamp[lit=true] if block 948 135 2101 redstone_lamp[lit=true] if block 950 135 2101 redstone_lamp[lit=true] if block 946 135 2103 redstone_lamp[lit=true] run scoreboard players set @e[scores={AdventureLevel=40}] AdventureLevel 41


# BEACON STARTS UP
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1..}] unless block 937 141 2112 iron_block run setblock 937 141 2112 iron_block
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1}] run playsound block.ender_chest.open ambient @a 937 134 2112 1 0.7 1
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=20}] run playsound block.beacon.activate master @a 937 134 2112 100 0.5 1
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=20}] run playsound block.beacon.power_select master @a 937 134 2112 100 0.5 1



execute if entity @e[scores={AdventureLevel=41,AdventureTimer=100}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=100}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"Wow! You did it! We're back online.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=250}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=250}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"I'll just lock these ","color":"none","bold":false,"underlined":false},{"text":"power nodes","color":"gray","bold":true,"underlined":false},{"text":" in place and hopefully they won't get knocked out again.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=400}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=405}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=405}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Hello? Hello?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=470}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=475}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 0.9 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=475}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Great! We're back online. I was informed of your mission by ","color":"none","bold":false,"underlined":false},{"text":"Mr. Gagarin","color":"yellow","bold":true,"underlined":false},{"text":". Great work getting the coms back up.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=650}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=655}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=655}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Listen. While you're over there, I need you to head down to the ","color":"none","bold":false,"underlined":false},{"text":"Dig Site","color":"gray","bold":true,"underlined":false},{"text":" and grab some samples for me.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=810}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=815}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=815}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Check on the rest of the ","color":"none","bold":false,"underlined":false},{"text":"Research Team","color":"gold","bold":true,"underlined":false},{"text":" while you're down there and see if they need anything. Their coms must be off right now.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=980}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=985}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=985}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Ivanov","color":"light_purple","bold":true,"underlined":false},{"text":" can give you your own key for the ","color":"none","bold":false,"underlined":false},{"text":"Dig Site door","color":"gray","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1060}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1060}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"Will do, Sir.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1140}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1145}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1145}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Thank you, Ivanov.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1200}] at @a run playsound entity.guardian.attack master @a ~ ~ ~ 3 2 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1205}] at @a run playsound entity.villager.ambient master @a ~ ~ ~ 0.7 1.1 0
execute if entity @e[scores={AdventureLevel=41,AdventureTimer=1205}] run tellraw @a ["",{"text":"<Dr. Zombo (on com)> ","color":"red","bold":false},{"text":"Gather any ","color":"none","bold":false,"underlined":false},{"text":"plant-like specimens","color":"gray","bold":true,"underlined":false},{"text":" down there you find. I could use about 15 or so. And I'll see you when you get back.","color":"none","bold":false,"underlined":false}]


scoreboard players set @e[scores={AdventureLevel=41,AdventureTimer=1250..}] AdventureTimer -1
scoreboard players set @e[scores={AdventureLevel=41,AdventureTimer=-1}] AdventureLevel 42

execute if entity @e[scores={AdventureLevel=42,AdventureTimer=100..}] at @e[tag=AdventureIvanov] if entity @a[distance=..3] run scoreboard players set @e[scores={AdventureLevel=42,AdventureTimer=100..}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=42,AdventureTimer=..-2}] AdventureLevel 43

execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] at @e[tag=AdventureIvanov] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] as @e[tag=AdventureIvanov] at @s run give @p tripwire_hook{Key2:1b,HideFlags:63,display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Dig Site Access Key\"}",Lore:['{"text":"Best not get this one mixed up with the other","italic":"true","color":"gold"}']}}
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run tellraw @a ["",{"text":"<Ivanov> ","color":"light_purple","bold":false},{"text":"Here. This opens the door on the stairs. Then you can take a ","color":"none","bold":false,"underlined":false},{"text":"Lift","color":"gray","bold":true,"underlined":false},{"text":" down, check on the team, and grab those samples for ","color":"none","bold":false,"underlined":false},{"text":"Dr. Zombo","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=43..}] align x align y align z if entity @a[x=929,y=138,z=2083,dx=2,dy=1,dz=0,nbt={SelectedItem:{id:"minecraft:tripwire_hook",tag:{Key2:1b}}}] unless block 930 136 2083 redstone_torch run setblock 930 136 2083 redstone_torch

execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run setblock 927 95 2080 air
execute if entity @e[scores={AdventureLevel=43,AdventureTimer=1}] run setblock 927 95 2080 orange_shulker_box[facing=up]{Items: [{Slot: 1b, id: "minecraft:player_head", Count: 1b, tag: {HideFlags: 6, SkullOwner: {Id: "fc6f2ea4-543e-477f-98db-02c0f51f32d8", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}}, display: {Lore: ["This equipment allows you to","venture outside the Base"], Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Helmet\"}"}}}, {Slot: 3b, id: "minecraft:player_head", Count: 1b, tag: {HideFlags: 6, SkullOwner: {Id: "fc6f2ea4-543e-477f-98db-02c0f51f32d8", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}}, display: {Lore: ["This equipment allows you to","venture outside the Base"], Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Helmet\"}"}}}, {Slot: 8b, id: "minecraft:tripwire_hook", Count: 1b, tag: {Key2: 1b, HideFlags: 63, display: {Lore: ['{"text":"Someone else\'s spare key?","italic":"true","color":"gold"}'], Name: "{\"italic\":false,\"color\":\"white\",\"text\":\"Dig Site Access Key\"}"}}}, {Slot: 10b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Boots\"}"}}}, {Slot: 15b, id: "minecraft:leather_leggings", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Slacks\"}"}}}, {Slot: 18b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Boots\"}"}}}, {Slot: 21b, id: "minecraft:leather_chestplate", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Chest\"}"}}}, {Slot: 22b, id: "minecraft:leather_chestplate", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Chest\"}"}}}, {Slot: 24b, id: "minecraft:leather_leggings", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 6, display: {Lore: ["This equipment allows you to","venture outside the Base"], color: 16777215, Name: "{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Slacks\"}"}}}]}


execute if entity @e[scores={AdventureLevel=43}] align x align y align z if entity @a[x=923,y=128,z=2078,dx=8,dy=0,dz=0] run scoreboard objectives add IntoCavern dummy
execute if entity @e[scores={AdventureLevel=43}] align x align y align z run scoreboard players add @a[x=923,y=125,z=2078,dx=8,dy=0,dz=0] IntoCavern 1
execute if entity @a[scores={IntoCavern=1}] at @a[scores={IntoCavern=1}] run playsound ambient.cave master @a[scores={IntoCavern=1}] ~ ~ ~ 10 0.6 0
execute if entity @e[scores={AdventureLevel=60}] run scoreboard objectives remove IntoCavern

# INTO CAVERN - 44
execute if entity @e[scores={AdventureLevel=..43}] align x align y align z if entity @a[x=926,y=95,z=2084,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={AdventureLevel=..43}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=..43}] align x align y align z if entity @a[x=926,y=95,z=2084,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={AdventureLevel=..43}] AdventureLevel 44

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 919 76 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 915 80 2115 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 924 78 2118 sea_pickle[waterlogged=false,pickles=4]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 912 81 2112 sea_pickle[waterlogged=false,pickles=3]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 923 78 2113 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 82 2111 sea_pickle[waterlogged=false,pickles=4]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 916 77 2116 sea_pickle[waterlogged=false,pickles=2]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 911 85 2109 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 917 83 2108 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 919 81 2121 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 922 75 2117 sea_pickle[waterlogged=false,pickles=1]


execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 902 93 2102 air
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run setblock 902 93 2102 orange_shulker_box[facing=west]{Items: [{Slot: 0b, id: "minecraft:coal", Count: 10b}, {Slot: 4b, id: "minecraft:redstone_lamp", Count: 64b,tag:{display:{Name:"{\"text\":\"Power Node\",\"italic\":\"false\"}"}}}, {Slot: 6b, id: "minecraft:cobblestone_wall", Count: 14b,tag:{display:{Name:"{\"text\":\"Marker Post\",\"italic\":\"false\"}"}}}, {Slot: 7b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}'], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 10b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}'], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 12b, id: "minecraft:coal", Count: 27b}, {Slot: 17b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}'], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 20b, id: "minecraft:redstone_torch", Count: 52b,tag:{display:{Name:"{\"text\":\"Research Marker\",\"italic\":\"false\"}"}}}, {Slot: 22b, id: "minecraft:iron_sword", Count: 1b, tag: {Unbreakable: 1b, HideFlags: 14, display: {Lore: ['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}'], Name: "{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}"}, Damage: 0, CanDestroy: ["minecraft:sea_pickle"]}}, {Slot: 24b, id: "minecraft:redstone_lamp", Count: 16b,tag:{display:{Name:"{\"text\":\"Power Node\",\"italic\":\"false\"}"}}}]}

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run kill @e[tag=AdventureBladeAS]
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 901.5 91.70 2103.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}']}}}],Pose:{RightArm:[0f,0f,270f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[0f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 901.8 91.70 2104.0 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}']}}}],Pose:{RightArm:[0f,0f,0f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[90f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 900.5 91.8 2107.18 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}']}}}],Pose:{RightArm:[0f,90f,320f]},Tags:["AdventureBladeAS1","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[270f,0f]}

execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 906.5 91.70 2106.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}']}}}],Pose:{RightArm:[0f,0f,270f]},Tags:["AdventureBladeAS3","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[90f,0f]}
execute if entity @e[scores={AdventureLevel=44,AdventureTimer=1}] run summon armor_stand 906.1 91.70 2106.8 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:sea_pickle"],display:{Name:"{\"text\":\"Harvesting Blade\",\"italic\":\"false\"}",Lore:['{"text":"Cuts plant specimens for collection","italic":"true","color":"gold"}']}}}],Pose:{RightArm:[0f,0f,0f]},Tags:["AdventureBladeAS3","AdventureBladeAS"],Invulnerable:true,DisabledSlots:1973790,Rotation:[180f,0f]}



# OBTAIN SWORD - 45
execute if entity @e[scores={AdventureLevel=..44}] if entity @a[nbt={Inventory:[{id:"minecraft:iron_sword"}]}] run scoreboard players set @e[scores={AdventureLevel=..44}] AdventureLevel 45


# OBTAIN PLANT SAMPLES CAVERN - 47
execute if entity @e[scores={AdventureLevel=..45}] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]}] run scoreboard players set @e[scores={AdventureLevel=..45}] AdventureLevel 47


execute if entity @e[scores={AdventureLevel=21..51}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

# SEEING ZOMBO WITHOUT SWORD
execute if entity @e[scores={AdventureLevel=42..44}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard objectives add ZomboTimer dummy
execute if entity @e[scores={AdventureLevel=45}] run scoreboard objectives remove ZomboTimer


execute if entity @e[scores={AdventureLevel=42..44,ZomboTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0 
execute if entity @e[scores={AdventureLevel=42..44,ZomboTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Did you not get the ","color":"none","bold":false,"underlined":false},{"text":"samples","color":"gray","bold":true,"underlined":false},{"text":"? Could you grab some from the old ","color":"none","bold":false,"underlined":false},{"text":"Dig Site","color":"gray","bold":true,"underlined":false},{"text":"?","color":"none","bold":false,"underlined":false}] 

# SEEING ZOMBO WITH SWORD BUT NO PLANTS - 46
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] run replaceitem block 965 93 2002 container.10 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"ZomboPincers™\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Designed to handle The Object","italic":"true","color":"gray"}']}}

execute if entity @e[scores={AdventureLevel=45}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=45}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=45}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=45}] AdventureLevel 46

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You're back!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=50}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=50}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But I see you have no samples?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=150}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=150}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Ivanov","color":"dark_green","bold":true,"underlined":false},{"text":" contacted me after you left there and told me the site was ruined and none of the team was there?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Where in heavens did they go?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=420}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=420}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Well, I'm certainly happy you're safe. In light of this, I've been meaning take you on as my ","color":"none","bold":false,"underlined":false},{"text":"helper","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=540}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=540}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"They better turn up. I'll keep trying their coms. But first, I have another pressing issue.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=46,AdventureTimer=650..}] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureTimer -1
execute if entity @e[scores={AdventureLevel=46,AdventureTimer=-1}] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureLevel 60


# SEEING ZOMBO AFTER LOSING PLANTS - 48
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] run replaceitem block 965 93 2002 container.10 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"ZomboPincers™\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Designed to handle The Object","italic":"true","color":"gray"}']}}

execute if entity @e[scores={AdventureLevel=46..48}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]},distance=..5] run scoreboard players set @e[scores={AdventureLevel=46..48}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=46..48}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:sea_pickle"}]},distance=..5] run scoreboard players set @e[scores={AdventureLevel=46..48}] AdventureLevel 49

execute if entity @e[scores={AdventureLevel=47}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=47}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=47}] at @e[tag=DrZombo] if entity @a[distance=..5] run scoreboard players set @e[scores={AdventureLevel=47}] AdventureLevel 48

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"You're back! But where are the samples?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=130}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=130}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I don't understand. Did you lose them?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=48,AdventureTimer=320}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=48,AdventureTimer=320}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Alright, well. I'm not sure what happened over there.","color":"none","bold":false,"underlined":false}]

# LOOP BACK TO DIALOGUE
scoreboard players set @e[scores={AdventureLevel=48,AdventureTimer=321}] AdventureTimer -100
scoreboard players set @e[scores={AdventureLevel=48,AdventureTimer=..-90}] AdventureLevel 46
scoreboard players set @e[scores={AdventureLevel=46,AdventureTimer=..-80}] AdventureTimer 51



# SEEING ZOMBO WITH PLANTS - 49
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] run replaceitem block 965 93 2002 container.16 shears{Unbreakable:true,HideFlags:14,CanDestroy:["minecraft:orange_wool"],display:{Name:"{\"text\":\"ZomboPincers™\",\"italic\":\"false\",\"color\":\"gold\"}",Lore:['{"text":"Designed to handle The Object","italic":"true","color":"gray"}']}}

execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Ivanov just informed me there was no sign of the Research Team? But you found something, didn't you?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49,AdventureTimer=80}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=49,AdventureTimer=80}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Hand it to me please.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=49}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:sea_pickle"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..49}] AdventureLevel 50

execute if entity @e[scores={AdventureLevel=50,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=50,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Be careful with that. Just hand it to me please.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=49..50}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=49..50}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=49..50}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=49..50}] AdventureLevel 52
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] at @e[tag=DrZombo] run playsound block.slime_block.break master @a ~ ~ ~ 0.5 1.4 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] at @e[tag=DrZombo] run tag @p[nbt={SelectedItem:{id:"minecraft:sea_pickle"}},distance=..1.5] add AdventurePlantSwapper


# ZOMBO PLANT SWAP
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] run function d3:adventure/item_swap
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1}] run tag @a remove AdventurePlantSwapper



############

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=10}] at @e[tag=DrZombo] run summon armor_stand ~0.45 ~-0.6 ~ {Invisible:true,Invulnerable:true,Markler:true,NoGravity:true,Rotation:[180f,0f],Tags:["AdventureDisplay3AS","AdventureDisplay3"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:sea_pickle"},Tags:["AdventureDisplay3","AdventureDisplay3FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=1..219}] as @e[tag=DrZombo] run data merge entity @s {Rotation:[270f,20f]}

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=15}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=15}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Thank you.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=105}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=105}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"What is this? I haven't seen this specimen here before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220..280}] as @e[tag=DrZombo] run data merge entity @s {Rotation:[270f,0f]}
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=220}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Very peculiar...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280}] at @e[tag=DrZombo] run playsound block.slime_block.break master @a ~ ~ ~ 0.5 1.4 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280}] run kill @e[tag=AdventureDisplay3]
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=280..339}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Let's place this for better examination, shall we?","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=52,AdventureTimer=380}] run tag @e[tag=DrZombo] add Deskto3Case1


# MOVE ZOMBO TO DISPLAY CASE 3
execute as @e[tag=Deskto3Case1] at @s run teleport @s ^ ^ ^0.15 facing 969 93 1998
execute as @e[tag=Deskto3Case2] at @s run teleport @s ^ ^ ^0.15 facing 968 93 2005

execute if entity @e[scores={AdventureLevel=25..47}] run teleport @e[tag=DrZombo] 967.3 93 1998.6
execute if entity @e[scores={AdventureLevel=52}] align x align y align z as @e[tag=DrZombo,x=969,y=93,z=1998,dx=0,dy=0,dz=0] run tag @s add Deskto3Case2
execute align x align y align z run tag @e[tag=Deskto3Case2,x=968,y=93,z=2005,dx=0,dy=0,dz=0] add Deskto3Case3

execute if entity @e[scores={AdventureLevel=52,AdventureTimer=410}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=52,AdventureTimer=410}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"If you have any more, just place them in that box beside my desk.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Deskto3Case3] run scoreboard players set @e[scores={AdventureLevel=52}] AdventureTimer 0
execute if entity @e[tag=Deskto3Case3] run scoreboard players set @e[scores={AdventureLevel=52}] AdventureLevel 53

tag @e[tag=Deskto3Case2] remove Deskto3Case1
tag @e[tag=Deskto3Case3] remove Deskto3Case2

execute if entity @e[scores={AdventureLevel=..52}] unless block 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=..53,AdventureTimer=..29}] unless block 68 95 2006 iron_trapdoor[half=bottom,facing=north,open=false] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=1}] run tag @e remove Deskto3Case3

execute if entity @e[scores={AdventureLevel=53,AdventureTimer=1}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 0
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=25}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=30}] run playsound block.iron_trapdoor.open master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=30}] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=true]
execute if entity @e[scores={AdventureLevel=53,AdventureTimer=40}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=53,AdventureTimer=45}] run tag @e[tag=DrZombo] add Deskto3Case4

execute if entity @e[scores={AdventureLevel=53}] if entity @e[tag=Deskto3Case4] run scoreboard players set @e[scores={AdventureLevel=53}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=53,AdventureTimer=-20..-1}] AdventureLevel 54


# PLANT IN CASE - 54
execute if entity @e[scores={AdventureLevel=54}] run tag @e remove Deskto3Case4
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1}] run playsound block.slime_block.break master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=1}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=10}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=20}] run playsound block.iron_trapdoor.close master @a 968 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=20}] run setblock 968 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=30}] run teleport @e[tag=DrZombo] 968 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Interesting. I'm not even sure this specimen existed before.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"This is incredible. Because of this, I'm definitely making you my ","color":"none","bold":false,"underlined":false},{"text":"personal apprentice","color":"red","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Oh! I almost forgot.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=400..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=54,AdventureTimer=450..}] run scoreboard players set @e[scores={AdventureLevel=54}] AdventureTimer -30
execute if entity @e[scores={AdventureLevel=54,AdventureTimer=..-25}] run scoreboard players set @e[scores={AdventureLevel=54}] AdventureLevel 60


# ZOMBO TELLS YOU TO GET ZOMBOCRON - 60
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850..}] run tag @a add DoorLevel4
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850..}] run team modify Adventure color red
execute if entity @e[scores={AdventureLevel=61..}] run tag @a add DoorLevel4
execute if entity @e[scores={AdventureLevel=61}] run team modify Adventure color red

execute if entity @e[scores={AdventureLevel=60..70}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I've figured out what caused the power outage.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=80}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=80}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The drill uncovered a very mysterious, and apparently powerful ","color":"none","bold":false,"underlined":false},{"text":"orange object","color":"gold","bold":true,"underlined":false},{"text":".","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=250}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=250}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It must have caused the generators to go offline.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"As my ","color":"none","bold":false,"underlined":false},{"text":"apprentice","color":"red","bold":true,"underlined":false},{"text":", you now have unsupervised access through all ","color":"none","bold":false,"underlined":false},{"text":"red level doors","color":"red","bold":true,"underlined":false},{"text":", just like myself.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=490}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=490}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Go down into the ","color":"none","bold":false,"underlined":false},{"text":"Drilling Crater","color":"red","bold":true,"underlined":false},{"text":", and bring back that ","color":"none","bold":false,"underlined":false},{"text":"object","color":"gold","bold":true,"underlined":false},{"text":". We will do some tests.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=650}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=650}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Based on my readings, I manufactured a ","color":"none","bold":false,"underlined":false},{"text":"tool","color":"gray","bold":true,"underlined":false},{"text":", that should counter its elemental composition and let you pull it out of the crater. I left it in the box beside my desk.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=60,AdventureTimer=850}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"But please do be careful. We don't yet know what this ","color":"none","bold":false,"underlined":false},{"text":"object","color":"gold","bold":true,"underlined":false},{"text":" is.","color":"none","bold":false,"underlined":false}]


# INTO CRATER - 61
execute if entity @e[scores={AdventureLevel=60}] align x align y align z if entity @a[x=1023,y=79,z=1993,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=..60}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=60}] align x align y align z if entity @a[x=1023,y=79,z=1993,dx=0,dy=2,dz=2] run scoreboard players set @e[scores={AdventureLevel=..60}] AdventureLevel 61

execute if entity @e[scores={AdventureLevel=..60}] unless block 1000 52 2000 orange_wool run setblock 1000 52 2000 orange_wool
execute if entity @e[scores={AdventureLevel=61,AdventureTimer=1}] run playsound ambient.cave master @a 1000 52 2000 5 0.5 0
execute if entity @e[scores={AdventureLevel=60..61}] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]}] run scoreboard players set @e[scores={AdventureLevel=..62}] AdventureLevel 65
execute if entity @e[scores={AdventureLevel=65}] run scoreboard objectives add CreepyWool dummy
scoreboard players add @e[tag=MainAdventureAEC] CreepyWool 1
execute if entity @e[scores={AdventureLevel=65,CreepyWool=1}] run playsound entity.phantom.swoop ambient @a 1000 52 2000 0.5 0.5 0
#execute if block 1000 52 2000 air run playsound entity.phantom.swoop ambient @a 1000 52 2000 0.6 0.5 0
execute if block 1000 52 2000 air run setblock 1000 52 2000 structure_void



# GIVE ZOMBO OBJECT - 66
execute if entity @e[scores={AdventureLevel=65}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]},distance=..7] run scoreboard players set @e[scores={AdventureLevel=..65}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=65}] at @e[tag=DrZombo] if entity @a[nbt={Inventory:[{id:"minecraft:orange_wool"}]},distance=..7] run scoreboard players set @e[scores={AdventureLevel=..65}] AdventureLevel 66
execute if entity @e[scores={AdventureLevel=66,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=66,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Excellent. Thank you. Now carefully hand it to me.","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=66}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:orange_wool"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..66}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=66}] at @e[tag=DrZombo] if entity @e[type=item,nbt={Item:{id:"minecraft:orange_wool"},OnGround:1b},distance=..10] run scoreboard players set @e[scores={AdventureLevel=..66}] AdventureLevel 67

execute if entity @e[scores={AdventureLevel=67,AdventureTimer=1}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=67,AdventureTimer=1}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Woah. What is happening? Be careful. Please, just hand it to me.","color":"none","bold":false,"underlined":false}]


execute if entity @e[scores={AdventureLevel=66..67}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=..67}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=66..67}] at @e[tag=DrZombo] if entity @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] run scoreboard players set @e[scores={AdventureLevel=..67}] AdventureLevel 70
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=1}] at @e[tag=DrZombo] run playsound block.wool.hit master @a ~ ~ ~ 1 1 0
#execute if entity @e[scores={AdventureLevel=70,AdventureTimer=1}] at @e[tag=DrZombo] run clear @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}},distance=..1.5] orange_wool
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=1..}] run clear @a[nbt={SelectedItem:{id:"minecraft:orange_wool"}}] orange_wool
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=15}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=15}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Good. Good.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=105}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0 
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=105}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I'll place this in the case. Then we can better examine its properties.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=70,AdventureTimer=175}] if entity @e[tag=AdventureDisplay3] run scoreboard players set @e[scores={AdventureLevel=70,AdventureTimer=175}] AdventureLevel 73
execute if entity @e[scores={AdventureLevel=70,AdventureTimer=175}] unless entity @e[tag=AdventureDisplay3] run scoreboard players set @e[scores={AdventureLevel=70,AdventureTimer=175}] AdventureLevel 71


# IF DISPLAY CASE 3 DOESN'T EXIST - 71
execute if entity @e[scores={AdventureLevel=71,AdventureTimer=200}] run tag @e[tag=DrZombo] add Deskto2Case1

execute as @e[tag=Deskto2Case1] at @s run teleport @s ^ ^ ^0.15 facing 970 93 1998
execute as @e[tag=Deskto2Case2] at @s run teleport @s ^ ^ ^0.15 facing 970 93 2005

execute if entity @e[scores={AdventureLevel=71}] align x align y align z as @e[tag=DrZombo,x=970,y=93,z=1998,dx=0,dy=0,dz=0] run tag @s add Deskto2Case2
execute align x align y align z run tag @e[tag=Deskto2Case2,x=970,y=93,z=2005,dx=0,dy=0,dz=0] add Deskto2Case3

execute if entity @e[tag=Deskto2Case3] run scoreboard players set @e[scores={AdventureLevel=71}] AdventureTimer 0
execute if entity @e[tag=Deskto2Case3] run scoreboard players set @e[scores={AdventureLevel=71}] AdventureLevel 72

tag @e[tag=Deskto2Case2] remove Deskto2Case1
tag @e[tag=Deskto2Case3] remove Deskto2Case2

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=1}] run tag @e remove Deskto2Case3

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=1}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 0
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=25}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=30}] run playsound block.iron_trapdoor.open master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=30}] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=true]
execute if entity @e[scores={AdventureLevel=72,AdventureTimer=40}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 10

execute if entity @e[scores={AdventureLevel=72,AdventureTimer=45}] run tag @e[tag=DrZombo] add Deskto2Case4

execute if entity @e[scores={AdventureLevel=72}] if entity @e[tag=Deskto2Case4] run scoreboard players set @e[scores={AdventureLevel=72}] AdventureTimer -10
scoreboard players set @e[scores={AdventureLevel=72,AdventureTimer=..-1}] AdventureLevel 75


# IF DISPLAY CASE 3 DOES EXIST - 73
execute if entity @e[scores={AdventureLevel=73,AdventureTimer=200}] run tag @e[tag=DrZombo] add 3Caseto2Case1

execute as @e[tag=3Caseto2Case1] at @s run teleport @s ^ ^ ^0.15 facing 971 93 2005.2

execute if entity @e[scores={AdventureLevel=73}] align x align y align z as @e[tag=DrZombo,x=971,y=93,z=2005,dx=-.5,dy=0,dz=0] run tag @s add 3Caseto2Case2

teleport @e[tag=3Caseto2Case2] 970 93 2006.2
execute if entity @e[tag=3Caseto2Case2] run scoreboard players set @e[scores={AdventureLevel=73}] AdventureTimer 0
execute if entity @e[tag=3Caseto2Case2] run scoreboard players set @e[scores={AdventureLevel=73}] AdventureLevel 72

tag @e[tag=3Caseto2Case2] remove 3Caseto2Case1
tag @e[tag=3Caseto2Case2] remove 3Caseto2Case2



# ZOMBOCRON REVEALED - 75
execute if entity @e[scores={AdventureLevel=75}] run tag @e remove Deskto2Case4
execute if entity @e[scores={AdventureLevel=75}] run tag @e remove 3Caseto2Case2
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1}] unless entity @e[tag=AdventureDisplay2] run summon armor_stand 970 92.68 2006  {Invisible:true,Invulnerable:true,NoGravity:true,DisabledSlots:2039583,Tags:["AdventureDisplay2"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:orange_wool",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["Zombocron"]}]}
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1}] run playsound entity.item.pickup master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 15

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=10}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 -25
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=20}] run playsound block.iron_trapdoor.close master @a 970 95 2006 0.5 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=20}] run setblock 970 95 2006 iron_trapdoor[half=bottom,facing=north,open=false]
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=30}] run teleport @e[tag=DrZombo] 970 93 2005.2 0 10
#execute if entity @e[scores={AdventureLevel=75,AdventureTimer=30..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @e[tag=Zombocron,limit=1]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=100}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=100}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Remarkable!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=200}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=200}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"It floats inside this containment as if gravity does not affect it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300..}] as @e[tag=DrZombo] at @s run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=300}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"I should give it a name.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=400}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=400}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"This is a momentous scientific discovery. I'm calling it...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] at @e[tag=DrZombo] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 0.7 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] at @e[tag=DrZombo] run playsound ambient.cave master @a ~ ~ ~ 0.6 1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=525}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=520}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"The Zombocron","color":"gold","bold":true,"underlined":false},{"text":"!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=510..680}] as @e[tag=DrZombo] at @s run teleport @s ~ ~ ~ ~ -70

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=690}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=690}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"After myself, y'know. Sure, you technically were the one who grabbed it for me, but you can name the next discovery, okay?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=820}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=820}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"Alright, it's been a long day. You look exhausted. Why don't you head back to your room. Get some rest.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050}] at @e[tag=DrZombo] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1.1 0
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050}] run tellraw @a ["",{"text":"<Dr. Zombo> ","color":"red","bold":false},{"text":"After you sleep, we'll do some experiments and see what ","color":"none","bold":false,"underlined":false},{"text":"The Zombocron","color":"gold","bold":true,"underlined":false},{"text":" is capable of.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050}] run scoreboard objectives add AdventureSleep minecraft.custom:minecraft.time_since_rest
execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050..1060}] run scoreboard players set @a AdventureSleep 1000

execute if entity @e[scores={AdventureLevel=75,AdventureTimer=1050..}] unless entity @a[scores={AdventureSleep=1..}] run scoreboard objectives add Act3Sleeping dummy
scoreboard players add @e[tag=MainAdventureAEC] Act3Sleeping 1

execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=50..}] run scoreboard objectives remove ReceptionTimer
execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=50..}] run scoreboard objectives remove AdventureSleep
execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=50..}] run scoreboard players set @e[scores={AdventureLevel=75,Act3Sleeping=50..}] AdventureTimer 0
execute if entity @e[scores={AdventureLevel=75,Act3Sleeping=50..}] run scoreboard players set @e[scores={AdventureLevel=75,Act3Sleeping=50..}] AdventureLevel 100

#execute if entity @e[scores={AdventureLevel=75}] if entity @a[nbt=!{Sleeping:1b}] run scoreboard players set @e[tag=MainAdventureAEC] Act3Sleeping 0