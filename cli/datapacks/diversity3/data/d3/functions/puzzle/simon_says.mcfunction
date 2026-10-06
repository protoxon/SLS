####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 24 2017 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SimonCounter
#scoreboard objectives setdisplay sidebar SimonLevel
#scoreboard objectives setdisplay sidebar SimonButton
#scoreboard objectives setdisplay sidebar SimonFail

scoreboard objectives add SimonCounter dummy
scoreboard players add @e[tag=MainPuzzleAEC] SimonCounter 1


# SETS UP THE BUTTON CLOUDS
scoreboard objectives add SimonLevel dummy
scoreboard players add @e[tag=MainPuzzleAEC] SimonLevel 0
execute if entity @e[scores={SimonLevel=0}] run kill @e[tag=SimonCloud]
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1001 65 28 {Tags:["SimonCloud","BlackSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1000 65 28 {Tags:["SimonCloud","LimeSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 999 65 28 {Tags:["SimonCloud","LightBlueSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1001 66 28 {Tags:["SimonCloud","BrownSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1000 66 28 {Tags:["SimonCloud","WhiteSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 999 66 28 {Tags:["SimonCloud","GreenSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1001 67 28 {Tags:["SimonCloud","YellowSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 1000 67 28 {Tags:["SimonCloud","OrangeSimonCloud"],Duration:2147483647}
execute if entity @e[scores={SimonLevel=0}] run summon area_effect_cloud 999 67 28 {Tags:["SimonCloud","PurpleSimonCloud"],Duration:2147483647}
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=YellowSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=BrownSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=BlackSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=OrangeSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=WhiteSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=LimeSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=PurpleSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=GreenSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=LightBlueSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0
#execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=SimonCloud] run setblock ~ ~ ~ stone_button[facing=north,powered=false]
execute if entity @e[scores={SimonLevel=0}] run execute at @e[tag=SimonCloud] run setblock ~ ~ ~ air
execute if entity @e[scores={SimonLevel=0}] run fill 999 65 30 1001 67 30 gray_concrete
scoreboard players set @e[scores={SimonLevel=0}] SimonLevel 1


# RESETS BUTTON
scoreboard objectives add SimonButton dummy
execute at @e[tag=SimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] SimonButton 1


# RESETS COUNTER
scoreboard players set @e[scores={SimonButton=1}] SimonCounter 0
execute if entity @e[scores={SimonButton=2..}] run execute at @e[tag=SimonCloud] run setblock ~ ~ ~ stone_button[facing=north,powered=false]
scoreboard players set @e[scores={SimonButton=2..}] SimonButton 0


# PHONE SOUNDS
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=YellowSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=BrownSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=BlackSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
execute if entity @e[scores={SimonLevel=1..54,SimonButton=1}] run execute at @e[tag=OrangeSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=WhiteSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=LimeSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=PurpleSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=GreenSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0
execute if entity @e[scores={SimonButton=1}] run execute at @e[tag=LightBlueSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0


# RESETS BUTTONS TO WRONG POSSIBILITY
execute if entity @e[scores={SimonCounter=0}] run tag @e[tag=SimonCloud] remove CorrectSimonCloud


# CORRECT BUTTONS BASED ON LEVEL -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK, YELLOW, GREEN, BROWN, ORANGE
execute if entity @e[scores={SimonLevel=1,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=2,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=3,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=4,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=5,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=6,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=7,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=8,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=9,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=10,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=11,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=12,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=13,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=14,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=15,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=16,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=17,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=18,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=19,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=20,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=21,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=22,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=23,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=24,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=25,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=26,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=27,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=28,SimonCounter=0}] run tag @e[tag=YellowSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=29,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=30,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=31,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=32,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=33,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=34,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=35,SimonCounter=0}] run tag @e[tag=YellowSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=36,SimonCounter=0}] run tag @e[tag=GreenSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=37,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=38,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=39,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=40,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=41,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=42,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=43,SimonCounter=0}] run tag @e[tag=YellowSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=44,SimonCounter=0}] run tag @e[tag=GreenSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=45,SimonCounter=0}] run tag @e[tag=BrownSimonCloud] add CorrectSimonCloud

execute if entity @e[scores={SimonLevel=46,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=47,SimonCounter=0}] run tag @e[tag=PurpleSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=48,SimonCounter=0}] run tag @e[tag=WhiteSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=49,SimonCounter=0}] run tag @e[tag=LightBlueSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=50,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=51,SimonCounter=0}] run tag @e[tag=BlackSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=52,SimonCounter=0}] run tag @e[tag=YellowSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=53,SimonCounter=0}] run tag @e[tag=GreenSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=54,SimonCounter=0}] run tag @e[tag=BrownSimonCloud] add CorrectSimonCloud
execute if entity @e[scores={SimonLevel=55,SimonCounter=0}] run tag @e[tag=OrangeSimonCloud] add CorrectSimonCloud


# ADDS LEVEL WHEN CORRECT / SETS LEVEL TO -1000 WHEN LOSE
execute if entity @e[scores={SimonCounter=0}] run execute at @e[tag=CorrectSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run scoreboard players add @e[scores={SimonLevel=1..}] SimonLevel 1
execute if entity @e[scores={SimonCounter=0}] run execute at @e[tag=SimonCloud,tag=!CorrectSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run scoreboard players set @e[tag=MainPuzzleAEC] SimonLevel -10000


# FAIL
scoreboard objectives add SimonFail dummy
execute at @e[tag=SimonCloud,tag=!CorrectSimonCloud] run execute if block ~ ~ ~ stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] SimonFail 1
scoreboard players add @e[scores={SimonFail=1..}] SimonFail 1
#execute at @e[scores={SimonFail=1..}] run scoreboard players set @e[tag=MainPuzzleCloudScore] SimonCounter -10000
execute at @e[scores={SimonFail=5}] run fill 999 65 28 1001 67 28 air
execute at @e[scores={SimonFail=10}] run playsound entity.ghast.hurt master @a 1000 66 28 1 1 0
execute at @e[scores={SimonFail=10}] run fill 999 65 29 1001 67 29 gray_concrete

execute at @e[scores={SimonFail=40}] run setblock 999 65 29 light_blue_concrete
execute at @e[scores={SimonFail=40}] run setblock 1000 65 29 lime_concrete
execute at @e[scores={SimonFail=40}] run setblock 1001 65 29 black_concrete
execute at @e[scores={SimonFail=40}] run setblock 999 66 29 green_concrete
execute at @e[scores={SimonFail=40}] run setblock 1000 66 29 white_concrete
execute at @e[scores={SimonFail=40}] run setblock 1001 66 29 brown_concrete
execute at @e[scores={SimonFail=40}] run setblock 999 67 29 purple_concrete
execute at @e[scores={SimonFail=40}] run setblock 1000 67 29 orange_concrete
execute at @e[scores={SimonFail=40}] run setblock 1001 67 29 yellow_concrete
execute at @e[scores={SimonFail=40}] run fill 999 65 28 1001 67 28 stone_button[facing=north]
execute at @e[scores={SimonFail=40}] run fill 999 65 30 1001 67 30 clay
execute at @e[scores={SimonFail=40}] run fill 999 65 30 1001 67 30 command_block[facing=south]{Command:"setblock 46 2 14 redstone_block",auto:0b,TrackOutput:false}

execute at @e[scores={SimonFail=40}] run setblock 46 2 14 clay
execute at @e[scores={SimonFail=40}] run kill @e[tag=SimonCloud]
execute at @e[scores={SimonFail=40}] run scoreboard objectives remove SimonCounter
execute at @e[scores={SimonFail=40}] run scoreboard objectives remove SimonLevel
execute at @e[scores={SimonFail=40}] run scoreboard objectives remove SimonButton
execute at @e[scores={SimonFail=40}] run scoreboard objectives remove SimonFail





# LEVEL ANIMATIONS

# LEVEL 1 -> BLACK
execute if entity @e[scores={SimonLevel=1,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=1,SimonCounter=20}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=1,SimonCounter=20}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=1,SimonCounter=20}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=1,SimonCounter=20}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=1,SimonCounter=40}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=1,SimonCounter=40}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=1,SimonCounter=40}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 2 -> BLACK, PURPLE
execute if entity @e[scores={SimonLevel=2,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=2,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=2,SimonCounter=20}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=2,SimonCounter=20}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=2,SimonCounter=20}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=2,SimonCounter=30}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=2,SimonCounter=30}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=2,SimonCounter=40}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=2,SimonCounter=40}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=2,SimonCounter=40}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=2,SimonCounter=50}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=2,SimonCounter=50}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=2,SimonCounter=50}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 4 -> BLACK, PURPLE, WHITE
execute if entity @e[scores={SimonLevel=4,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=4,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=4,SimonCounter=20}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=4,SimonCounter=20}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=4,SimonCounter=20}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=4,SimonCounter=30}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=4,SimonCounter=30}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=4,SimonCounter=40}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=4,SimonCounter=40}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=4,SimonCounter=40}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=4,SimonCounter=50}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=4,SimonCounter=50}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=4,SimonCounter=60}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=4,SimonCounter=60}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=4,SimonCounter=60}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=4,SimonCounter=70}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=4,SimonCounter=70}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=4,SimonCounter=70}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 7 -> BLACK, PURPLE, WHITE, LIGHT BLUE
execute if entity @e[scores={SimonLevel=7,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=7,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=7,SimonCounter=20}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=7,SimonCounter=20}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=7,SimonCounter=20}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=7,SimonCounter=30}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=7,SimonCounter=30}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=7,SimonCounter=40}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=7,SimonCounter=40}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=7,SimonCounter=40}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=7,SimonCounter=50}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=7,SimonCounter=50}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=7,SimonCounter=60}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=7,SimonCounter=60}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=7,SimonCounter=60}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=7,SimonCounter=70}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=7,SimonCounter=70}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=7,SimonCounter=80}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=7,SimonCounter=80}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=7,SimonCounter=80}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=7,SimonCounter=90}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=7,SimonCounter=90}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=7,SimonCounter=90}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 11 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE
execute if entity @e[scores={SimonLevel=11,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=11,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=11,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=11,SimonCounter=18}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=11,SimonCounter=18}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=11,SimonCounter=26}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=26}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=11,SimonCounter=26}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=11,SimonCounter=34}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=11,SimonCounter=34}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=11,SimonCounter=42}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=42}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=11,SimonCounter=42}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=11,SimonCounter=50}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=11,SimonCounter=50}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=11,SimonCounter=58}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=58}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=11,SimonCounter=58}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=11,SimonCounter=66}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=11,SimonCounter=66}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=11,SimonCounter=74}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=11,SimonCounter=74}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=11,SimonCounter=74}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=11,SimonCounter=84}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=11,SimonCounter=84}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=11,SimonCounter=84}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 16 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK
execute if entity @e[scores={SimonLevel=16,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=16,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=16}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=16,SimonCounter=16}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=16,SimonCounter=22}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=22}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=22}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=28}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=16,SimonCounter=28}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=16,SimonCounter=34}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=34}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=34}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=40}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=16,SimonCounter=40}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=16,SimonCounter=46}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=46}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=46}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=52}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=16,SimonCounter=52}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=16,SimonCounter=58}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=58}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=58}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=64}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=16,SimonCounter=64}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=16,SimonCounter=70}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=16,SimonCounter=70}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=16,SimonCounter=70}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=16,SimonCounter=80}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=16,SimonCounter=80}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=16,SimonCounter=80}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]



# LEVEL 22 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK, YELLOW
execute if entity @e[scores={SimonLevel=22,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=22,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=15}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=22,SimonCounter=15}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=22,SimonCounter=20}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=20}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=20}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=25}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=25}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=30}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=30}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=30}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=35}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=35}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=40}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=40}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=40}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=45}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=45}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=50}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=50}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=50}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=55}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=55}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=60}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=60}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=60}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=65}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=65}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=70}] run setblock 1001 67 29 air
execute if entity @e[scores={SimonLevel=22,SimonCounter=70}] run summon armor_stand 1001 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:yellow_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=22,SimonCounter=70}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=22,SimonCounter=80}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=22,SimonCounter=80}] run setblock 1001 67 29 yellow_concrete

execute if entity @e[scores={SimonLevel=22,SimonCounter=80}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]



# LEVEL 29 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK, YELLOW, GREEN
execute if entity @e[scores={SimonLevel=29,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=29,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=14}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=29,SimonCounter=14}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=29,SimonCounter=18}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=18}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=18}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=22}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=22}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=26}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=26}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=26}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=30}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=30}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=34}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=34}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=34}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=38}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=38}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=42}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=42}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=42}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=46}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=46}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=50}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=50}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=50}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=54}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=54}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=58}] run setblock 1001 67 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=58}] run summon armor_stand 1001 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:yellow_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=58}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=62}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=62}] run setblock 1001 67 29 yellow_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=66}] run setblock 999 66 29 air
execute if entity @e[scores={SimonLevel=29,SimonCounter=66}] run summon armor_stand 999 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:green_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=29,SimonCounter=66}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=29,SimonCounter=70}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=29,SimonCounter=70}] run setblock 999 66 29 green_concrete

execute if entity @e[scores={SimonLevel=29,SimonCounter=80}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# LEVEL 37 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK, YELLOW, GREEN, BROWN
execute if entity @e[scores={SimonLevel=37,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=37,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=14}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=37,SimonCounter=14}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=37,SimonCounter=18}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=18}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=18}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=22}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=22}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=26}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=26}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=26}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=30}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=30}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=34}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=34}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=34}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=38}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=38}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=42}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=42}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=42}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=46}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=46}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=50}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=50}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=50}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=54}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=54}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=58}] run setblock 1001 67 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=58}] run summon armor_stand 1001 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:yellow_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=58}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=62}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=62}] run setblock 1001 67 29 yellow_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=66}] run setblock 999 66 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=66}] run summon armor_stand 999 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:green_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=66}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=70}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=70}] run setblock 999 66 29 green_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=74}] run setblock 1001 66 29 air
execute if entity @e[scores={SimonLevel=37,SimonCounter=74}] run summon armor_stand 1001 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:brown_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=37,SimonCounter=74}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=37,SimonCounter=78}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=37,SimonCounter=78}] run setblock 1001 66 29 brown_concrete

execute if entity @e[scores={SimonLevel=37,SimonCounter=88}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]



# LEVEL 46 -> BLACK, PURPLE, WHITE, LIGHT BLUE, ORANGE, BLACK, YELLOW, GREEN, BROWN, ORANGE
execute if entity @e[scores={SimonLevel=46,SimonCounter=1}] run fill 999 65 28 1001 67 28 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=1}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=46,SimonCounter=10}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=10}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=10}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=14}] run setblock 1001 65 29 black_concrete
execute if entity @e[scores={SimonLevel=46,SimonCounter=14}] run kill @e[tag=SimonBlock]

execute if entity @e[scores={SimonLevel=46,SimonCounter=18}] run setblock 999 67 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=18}] run summon armor_stand 999 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:purple_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=18}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=22}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=22}] run setblock 999 67 29 purple_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=26}] run setblock 1000 66 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=26}] run summon armor_stand 1000 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:white_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=26}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=30}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=30}] run setblock 1000 66 29 white_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=34}] run setblock 999 65 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=34}] run summon armor_stand 999 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:light_blue_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=34}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=38}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=38}] run setblock 999 65 29 light_blue_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=42}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=42}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=42}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=46}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=46}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=50}] run setblock 1001 65 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=50}] run summon armor_stand 1001 65 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=50}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=54}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=54}] run setblock 1001 65 29 black_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=58}] run setblock 1001 67 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=58}] run summon armor_stand 1001 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:yellow_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=58}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=62}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=62}] run setblock 1001 67 29 yellow_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=66}] run setblock 999 66 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=66}] run summon armor_stand 999 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:green_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=66}] run playsound block.note_block.harp master @a 1000 66 28 1 1.03 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=70}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=70}] run setblock 999 66 29 green_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=74}] run setblock 1001 66 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=74}] run summon armor_stand 1001 66 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:brown_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=74}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=78}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=78}] run setblock 1001 66 29 brown_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=82}] run setblock 1000 67 29 air
execute if entity @e[scores={SimonLevel=46,SimonCounter=82}] run summon armor_stand 1000 67 29.1 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["SimonBlock"]}],Tags:["SimonBlock"]}
execute if entity @e[scores={SimonLevel=46,SimonCounter=82}] run playsound block.note_block.harp master @a 1000 66 28 1 0.9 0

execute if entity @e[scores={SimonLevel=46,SimonCounter=92}] run kill @e[tag=SimonBlock]
execute if entity @e[scores={SimonLevel=46,SimonCounter=92}] run setblock 1000 67 29 orange_concrete

execute if entity @e[scores={SimonLevel=46,SimonCounter=92}] run fill 999 65 28 1001 67 28 stone_button[facing=north,powered=false]


# DOORS OPEN
execute if entity @e[scores={SimonLevel=56,SimonCounter=1}] run playsound block.note_block.harp master @a 1000 66 28 1 0.8 0
execute if entity @e[scores={SimonLevel=56,SimonCounter=1}] run playsound block.note_block.harp master @a 1000 66 28 1 1.0 0
execute if entity @e[scores={SimonLevel=56,SimonCounter=1}] run playsound block.note_block.harp master @a 1000 66 28 1 1.2 0
execute if entity @e[scores={SimonLevel=56,SimonCounter=1}] run execute at @e[tag=SimonCloud] run setblock ~ ~ ~ air
execute if entity @e[scores={SimonLevel=56,SimonCounter=1}] run kill @e[tag=SimonCloud]

execute if entity @e[scores={SimonLevel=56,SimonCounter=52}] run fill 994 65 16 1006 67 28 orange_concrete replace red_concrete
execute if entity @e[scores={SimonLevel=56,SimonCounter=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={SimonLevel=56,SimonCounter=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1


execute if entity @e[scores={SimonLevel=56,SimonCounter=70}] run fill 993 64 20 1007 65 24 clay replace redstone_block


# END
execute if entity @e[scores={SimonLevel=56,SimonCounter=70}] run scoreboard objectives remove SimonButton
execute if entity @e[scores={SimonLevel=56,SimonCounter=70}] run scoreboard objectives remove SimonFail
scoreboard players set @e[scores={SimonLevel=56,SimonCounter=70}] SimonCounter -100
execute if entity @e[scores={SimonCounter=-100}] run setblock 46 2 14 clay
execute if entity @e[scores={SimonCounter=-100}] run scoreboard objectives remove SimonLevel
execute if entity @e[scores={SimonCounter=-100}] run scoreboard objectives remove SimonCounter