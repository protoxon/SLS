####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 29 2017 / MARCH 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

#scoreboard objectives setdisplay sidebar FillSoundRoom
#scoreboard objectives setdisplay sidebar SoundHint
#scoreboard objectives setdisplay sidebar SoundHintTimer
#scoreboard objectives setdisplay sidebar SoundCheck
#scoreboard objectives setdisplay sidebar SoundWin

# SPAMS SOUND FOR CAPTION CHEATERS
execute at @a[x=1009,y=63,z=3,dx=10,dy=2,dz=10] run function d3:puzzle/spam_sound


# NOT SURE WHAT THIS IS
#execute @p[score_FillSoundRoom_min=0,score_FillSoundRoom=2] ~ ~ ~ fill 1014 59 8 1014 60 8 clay
#execute if entity @e[scores={FillSoundRoom=2}] run fill 1010 62 4 1018 62 12 iron_block default replace hopper
#execute if entity @e[scores={FillSoundRoom=0}] run fill 1010 63 4 1018 63 12 iron_block default replace hopper


scoreboard objectives add FillSoundRoom dummy
scoreboard objectives add SoundCheck dummy
scoreboard objectives add SoundWin dummy
scoreboard players add @e[tag=MainPuzzleAEC] FillSoundRoom 0
scoreboard players add @e[scores={FillSoundRoom=0..280}] FillSoundRoom 2
scoreboard players add @e[scores={FillSoundRoom=300..}] FillSoundRoom 1

# FIRST TIME SET UP ANIMATION -> COUNT BY TWOS
execute if entity @e[scores={FillSoundRoom=1}] run kill @e[tag=SoundAEC]
execute if entity @e[scores={FillSoundRoom=1}] run setblock 1010 63 4 black_terracotta
execute if entity @e[scores={FillSoundRoom=1}] run setblock 1010 63 12 black_terracotta
execute if entity @e[scores={FillSoundRoom=1}] run setblock 1018 63 4 black_terracotta
execute if entity @e[scores={FillSoundRoom=1}] run setblock 1018 63 12 black_terracotta

execute if entity @e[scores={FillSoundRoom=40}] run playsound entity.elder_guardian.ambient master @a 1014 64 8 0.7 0.8 0.7

##execute if entity @e[scores={FillSoundRoom=50}] run setblock 1010 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=52}] run setblock 1010 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=54}] run setblock 1010 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

##execute if entity @e[scores={FillSoundRoom=56}] run setblock 1011 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=58}] run setblock 1012 63 5 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

##execute if entity @e[scores={FillSoundRoom=60}] run setblock 1013 63 4 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=62}] run setblock 1014 63 4 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=64}] run setblock 1015 63 4 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

#execute if entity @e[scores={FillSoundRoom=66}] run setblock 1016 63 5 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=68}] run setblock 1017 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

#execute if entity @e[scores={FillSoundRoom=70}] run setblock 1018 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=72}] run setblock 1018 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=74}] run setblock 1018 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

#execute if entity @e[scores={FillSoundRoom=76}] run setblock 1017 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=78}] run setblock 1016 63 11 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

#execute if entity @e[scores={FillSoundRoom=80}] run setblock 1015 63 12 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=82}] run setblock 1014 63 12 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=84}] run setblock 1013 63 12 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

#execute if entity @e[scores={FillSoundRoom=86}] run setblock 1012 63 11 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
#execute if entity @e[scores={FillSoundRoom=88}] run setblock 1011 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=90}] run setblock 1011 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=92}] run setblock 1011 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=94}] run setblock 1011 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=96}] run setblock 1012 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=98}] run setblock 1013 63 5 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=100}] run setblock 1014 63 5 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=102}] run setblock 1015 63 5 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=104}] run setblock 1016 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=106}] run setblock 1017 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=108}] run setblock 1017 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=110}] run setblock 1017 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=112}] run setblock 1016 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=114}] run setblock 1015 63 11 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=116}] run setblock 1014 63 11 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=118}] run setblock 1013 63 11 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=120}] run setblock 1012 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=122}] run setblock 1012 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=124}] run setblock 1012 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=126}] run setblock 1012 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=128}] run setblock 1013 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=130}] run setblock 1014 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=132}] run setblock 1015 63 6 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=134}] run setblock 1016 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=136}] run setblock 1016 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=138}] run setblock 1016 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

execute if entity @e[scores={FillSoundRoom=140}] run setblock 1015 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=142}] run setblock 1014 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
execute if entity @e[scores={FillSoundRoom=144}] run setblock 1013 63 10 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

##execute if entity @e[scores={FillSoundRoom=146}] run setblock 1013 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=148}] run setblock 1013 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=150}] run setblock 1013 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}

##execute if entity @e[scores={FillSoundRoom=152}] run setblock 1014 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=154}] run setblock 1015 63 7 stone
##execute if entity @e[scores={FillSoundRoom=154}] run setblock 1015 63 7 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=156}] run setblock 1015 63 8 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=158}] run setblock 1015 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}
##execute if entity @e[scores={FillSoundRoom=160}] run setblock 1014 63 9 hopper{CustomName:"{\"text\":\"Sound Required\"}"}


execute if entity @e[scores={FillSoundRoom=180}] run setblock 1010 62 12 black_terracotta
execute if entity @e[scores={FillSoundRoom=180}] run setblock 1010 62 4 black_terracotta
execute if entity @e[scores={FillSoundRoom=180}] run setblock 1018 62 4 black_terracotta
execute if entity @e[scores={FillSoundRoom=180}] run setblock 1018 62 12 black_terracotta

execute if entity @e[scores={FillSoundRoom=180}] run setblock 1010 63 12 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Boom Box\"}"}
execute if entity @e[scores={FillSoundRoom=180}] run particle end_rod 1010 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={FillSoundRoom=180}] run playsound block.end_portal_frame.fill master @a 1010 63 12 1 0.95 0

execute if entity @e[scores={FillSoundRoom=210}] run setblock 1010 63 4 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Boom Box\"}"}
execute if entity @e[scores={FillSoundRoom=210}] run particle end_rod 1010 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={FillSoundRoom=210}] run playsound block.end_portal_frame.fill master @a 1010 63 4 1 1 0

execute if entity @e[scores={FillSoundRoom=240}] run setblock 1018 63 4 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Boom Box\"}"}
execute if entity @e[scores={FillSoundRoom=240}] run particle end_rod 1018 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={FillSoundRoom=240}] run playsound block.end_portal_frame.fill master @a 1018 63 4 1 0.9 0

execute if entity @e[scores={FillSoundRoom=270}] run setblock 1018 63 12 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Boom Box\"}"}
execute if entity @e[scores={FillSoundRoom=270}] run particle end_rod 1018 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={FillSoundRoom=270}] run playsound block.end_portal_frame.fill master @a 1018 63 12 1 0.95 0


# SHULKER BOX HINT FOR THE OBLIVIOUS
execute if entity @e[scores={FillSoundRoom=270}] run scoreboard objectives add SoundHint dummy
execute if entity @e[scores={FillSoundRoom=270}] run scoreboard objectives add SoundHintTimer dummy
scoreboard players set @e[tag=MainPuzzleAEC,scores={FillSoundRoom=301}] SoundHint 0
scoreboard players add @e[tag=MainPuzzleAEC,scores={FillSoundRoom=301..}] SoundHintTimer 1
execute if entity @e[scores={SoundHintTimer=1}] run setblock 36 5 14 clay
execute if entity @e[scores={SoundHintTimer=1}] run clone 1010 63 12 1010 63 12 36 5 14
execute if entity @e[scores={SoundHintTimer=1}] run setblock 36 7 14 clay
execute if entity @e[scores={SoundHintTimer=1}] run clone 1010 63 4 1010 63 4 36 7 14
execute if entity @e[scores={SoundHintTimer=1}] run setblock 36 9 14 clay
execute if entity @e[scores={SoundHintTimer=1}] run clone 1018 63 4 1018 63 4 36 9 14
execute if entity @e[scores={SoundHintTimer=1}] run setblock 36 11 14 clay
execute if entity @e[scores={SoundHintTimer=1}] run clone 1018 63 12 1018 63 12 36 11 14

scoreboard players set @e[scores={SoundHint=0..1}] SoundHint 0
execute if blocks 36 5 14 36 5 14 1010 63 12 all run scoreboard players set @e[scores={SoundHint=0}] SoundHint 1
scoreboard players set @e[scores={SoundHint=0}] SoundHint -1

scoreboard players set @e[scores={SoundHint=0..1}] SoundHint 0
execute if blocks 36 7 14 36 7 14 1010 63 4 all run scoreboard players set @e[scores={SoundHint=0}] SoundHint 1
scoreboard players set @e[scores={SoundHint=0}] SoundHint -1

scoreboard players set @e[scores={SoundHint=0..1}] SoundHint 0
execute if blocks 36 9 14 36 9 14 1018 63 4 all run scoreboard players set @e[scores={SoundHint=0}] SoundHint 1
scoreboard players set @e[scores={SoundHint=0}] SoundHint -1

scoreboard players set @e[scores={SoundHint=0..1}] SoundHint 0
execute if blocks 36 11 14 36 11 14 1018 63 12 all run scoreboard players set @e[scores={SoundHint=0}] SoundHint 1
scoreboard players set @e[scores={SoundHint=0}] SoundHint -1

execute if entity @e[scores={SoundHintTimer=400}] run particle end_rod 1010 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=400}] run playsound block.end_portal_frame.fill master @a 1010 63 12 1 0.95 0

execute if entity @e[scores={SoundHintTimer=400}] run particle end_rod 1010 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=400}] run playsound block.end_portal_frame.fill master @a 1010 63 4 1 1 0

execute if entity @e[scores={SoundHintTimer=400}] run particle end_rod 1018 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=400}] run playsound block.end_portal_frame.fill master @a 1018 63 4 1 0.9 0

execute if entity @e[scores={SoundHintTimer=400}] run particle end_rod 1018 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=400}] run playsound block.end_portal_frame.fill master @a 1018 63 12 1 0.95 0

execute if entity @e[scores={SoundHintTimer=700}] run particle end_rod 1010 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=700}] run playsound block.end_portal_frame.fill master @a 1010 63 12 1 0.95 0
execute if entity @e[scores={SoundHintTimer=700}] run summon area_effect_cloud 1010 63.4 12 {CustomName:"{\"text\":\"↓\",\"bold\":\"false\"}",CustomNameVisible:true,Tags:["SoundHintAEC"],Duration:2147483647}

execute if entity @e[scores={SoundHintTimer=700}] run particle end_rod 1010 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=700}] run playsound block.end_portal_frame.fill master @a 1010 63 4 1 1 0
execute if entity @e[scores={SoundHintTimer=700}] run summon area_effect_cloud 1010 63.4 4 {CustomName:"{\"text\":\"↓\",\"bold\":\"false\"}",CustomNameVisible:true,Tags:["SoundHintAEC"],Duration:2147483647}

execute if entity @e[scores={SoundHintTimer=700}] run particle end_rod 1018 63 4 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=700}] run playsound block.end_portal_frame.fill master @a 1018 63 4 1 0.9 0
execute if entity @e[scores={SoundHintTimer=700}] run summon area_effect_cloud 1018 63.4 4 {CustomName:"{\"text\":\"↓\",\"bold\":\"false\"}",CustomNameVisible:true,Tags:["SoundHintAEC"],Duration:2147483647}

execute if entity @e[scores={SoundHintTimer=700}] run particle end_rod 1018 63 12 0.3 1 0.3 0 50 force @a
execute if entity @e[scores={SoundHintTimer=700}] run playsound block.end_portal_frame.fill master @a 1018 63 12 1 0.95 0
execute if entity @e[scores={SoundHintTimer=700}] run summon area_effect_cloud 1018 63.4 12 {CustomName:"{\"text\":\"↓\",\"bold\":\"false\"}",CustomNameVisible:true,Tags:["SoundHintAEC"],Duration:2147483647}

execute if entity @e[scores={SoundHint=-1}] run kill @e[tag=SoundHintAEC]
execute if entity @e[scores={SoundHint=-1}] run scoreboard objectives remove SoundHintTimer
execute if entity @e[scores={SoundHint=-1}] run scoreboard objectives remove SoundHint



scoreboard players set @e[scores={FillSoundRoom=280}] FillSoundRoom 300


# SETS UP ROOM IF LOST
##execute if block 1014 63 9 coal_block run scoreboard players set @e[tag=MainPuzzleAEC] FillSoundRoom 300

execute if block 1013 63 10 coal_block run scoreboard players set @e[tag=MainPuzzleAEC] FillSoundRoom 300
execute if entity @e[scores={FillSoundRoom=300}] run fill 1010 63 4 1018 63 12 hopper{CustomName:"{\"text\":\"Sound Required\"}"} replace coal_block
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1014 61 8 redstone_block
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 62 12 air
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 62 4 air
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 62 4 air
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 62 12 air

execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 63 12 brown_terracotta
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 63 12 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Passive Boom Box\"}",Items:[{Slot:3b,id:"minecraft:bat_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:5b,id:"minecraft:chicken_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:11b,id:"minecraft:cow_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:13b,id:"minecraft:donkey_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:15b,id:"minecraft:pig_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:21b,id:"minecraft:sheep_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:23b,id:"minecraft:wolf_spawn_egg",Count:1b,tag:{SoundItem:1b}}]}


execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 63 4 brown_terracotta
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1010 63 4 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Hostile Boom Box\"}",Items:[{Slot:3b,id:"minecraft:elder_guardian_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:5b,id:"minecraft:enderman_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:11b,id:"minecraft:ghast_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:13b,id:"minecraft:shulker_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:15b,id:"minecraft:vex_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:21b,id:"minecraft:vindicator_spawn_egg",Count:1b,tag:{SoundItem:1b}},{Slot:23b,id:"minecraft:zombie_pigman_spawn_egg",Count:1b,tag:{SoundItem:1b}}]}


execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 63 4 brown_terracotta
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 63 4 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Block Boom Box\"}",Items:[{Slot:3b,id:"minecraft:anvil",Count:1b,tag:{SoundItem:1b}},{Slot:5b,id:"minecraft:chest",Count:1b,tag:{SoundItem:1b}},{Slot:11b,id:"minecraft:glass",Count:1b,tag:{SoundItem:1b}},{Slot:13b,id:"minecraft:grass_block",Count:1b,tag:{SoundItem:1b}},{Slot:15b,id:"minecraft:iron_door",Count:1b,tag:{SoundItem:1b}},{Slot:21b,id:"minecraft:note_block",Count:1b,tag:{SoundItem:1b}},{Slot:23b,id:"minecraft:piston",Count:1b,tag:{SoundItem:1b}}]}


execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 63 12 brown_terracotta
execute if entity @e[scores={FillSoundRoom=300}] run setblock 1018 63 12 brown_shulker_box[facing=down]{CustomName:"{\"text\":\"Item Boom Box\"}",Items:[{Slot:3b,id:"minecraft:apple",Count:1b,tag:{SoundItem:1b}},{Slot:5b,id:"minecraft:milk_bucket",Count:1b,tag:{SoundItem:1b}},{Slot:11b,id:"minecraft:music_disc_cat",Count:1b,tag:{SoundItem:1b}},{Slot:13b,id:"minecraft:music_disc_mellohi",Count:1b,tag:{SoundItem:1b}},{Slot:15b,id:"minecraft:music_disc_stal",Count:1b,tag:{SoundItem:1b}},{Slot:21b,id:"minecraft:firework_rocket",Count:1b,tag:{SoundItem:1b}},{Slot:23b,id:"minecraft:fishing_rod",Count:1b,tag:{SoundItem:1b}}]}


# SUMMON IN RANDOM AECS
execute if entity @e[scores={FillSoundRoom=2}] run kill @e[tag=SoundAEC]

#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 5 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 6 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 7 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 8 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 9 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 10 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}

#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1011 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1012 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1013 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1014 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1015 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1016 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}
#execute if entity @e[scores={FillSoundRoom=300}] run summon area_effect_cloud 1017 64 11 {Tags:["RandomSoundAEC","SoundAEC"],Duration:2147483647}



# SUMMONS IN SOUND AECS AT RANDOM

# 7 BLOCKS
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["AnvilSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=AnvilSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["BrewingStandSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=BrewingStandSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ChestSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=ChestSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["LadderSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=LadderSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["IronDoorSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=IronDoorSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["TripwireSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=TripwireSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PistonSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=PistonSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RedstoneTorchSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=RedstoneTorchSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["GlassSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=GlassSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["GrassSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=GrassSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SandSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SandSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SlimeSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SlimeSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SnowSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SnowSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["NoteBlockSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=NoteBlockSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]

# 7 ITEMS
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ShieldSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=ShieldSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FishingRodSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=FishingRodSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FireworkSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=FireworkSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FireChargeSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=FireChargeSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["LeadSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=LeadSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["BoatSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=BoatSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["MinecartSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=MinecartSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RecordStalSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=RecordStalSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RecordCatSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=RecordCatSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["RecordMellohiSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=RecordMellohiSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["EatSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=EatSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["DrinkSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=DrinkSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["AttackSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=AttackSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["FlintSteelSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=FlintSteelSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]

# 14 PASSIVES
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["BatSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=BatSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SquidSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SquidSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ChickenSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=ChickenSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CowSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=CowSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["HorseSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=HorseSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["DonkeySoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=DonkeySoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["LlamaSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=LlamaSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ParrotSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=ParrotSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PolarBearSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=PolarBearSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PigSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=PigSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["DolphinSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=DolphinSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SheepSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=SheepSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["VillagerSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=VillagerSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["WolfSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=WolfSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]

# 14 HOSTILES
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["BlazeSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=BlazeSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["CreeperSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=CreeperSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["EndermanSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=EndermanSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["GhastSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=GhastSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ElderGuardianSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=ElderGuardianSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["VindicatorSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=VindicatorSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["EvokerSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=EvokerSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ShulkerSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=ShulkerSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SkeletonSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SkeletonSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["SpiderSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=SpiderSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["VexSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=VexSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["WitchSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=WitchSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
#execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["ZombieSoundAEC","SoundAEC"],Duration:2147483647}
#execute at @e[tag=ZombieSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]
execute if entity @e[scores={FillSoundRoom=300}] at @e[tag=RandomSoundAEC,sort=random,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["PigmanSoundAEC","SoundAEC"],Duration:2147483647}
execute at @e[tag=PigmanSoundAEC] run kill @e[tag=RandomSoundAEC,sort=nearest,limit=1]

scoreboard players set @e[scores={FillSoundRoom=301}] FillSoundRoom 349
execute if entity @e[scores={FillSoundRoom=350}] run scoreboard players set @e[tag=SoundAEC] FillSoundRoom 350
scoreboard players set @e[scores={FillSoundRoom=400..410}] FillSoundRoom 350
execute if entity @e[tag=MainPuzzleAEC,scores={FillSoundRoom=399}] run stopsound @a[x=1009,y=62,z=3,dx=10,dy=5,dz=10]

# BLOCK SOUNDS
execute at @e[tag=AnvilSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.anvil.land master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=BrewingStandSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.brewing_stand.brew master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=ChestSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.chest.open master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=GlassSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.glass.break master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=GrassSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.grass.break master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=IronDoorSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.iron_door.open master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=LadderSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.ladder.step master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=NoteBlockSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.note_block.harp master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 0.5 1
execute at @e[tag=PistonSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.piston.contract master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=RedstoneTorchSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.redstone_torch.burnout master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SandSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.sand.place master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SlimeSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.slime_block.break master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SnowSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.snow.place master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=TripwireSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound block.tripwire.detach master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1

# ITEM SOUNDS
#execute at @e[tag=BoatSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.boat.paddle_water master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=FishingRodSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.fishing_bobber.throw master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 0.5 1
execute at @e[tag=FireworkSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.firework_rocket.launch master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=FireChargeSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound item.firecharge.use master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=LeadSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.leash_knot.place master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=MinecartSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.minecart.riding master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=RecordStalSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound music_disc.stal master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=RecordCatSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound music_disc.cat master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=RecordMellohiSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound music_disc.mellohi master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=ShieldSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound item.shield.block master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=EatSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.generic.eat master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=DrinkSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.generic.drink master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=AttackSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.player.attack.sweep master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=FlintSteelSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound item.flintandsteel.use master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1

# PASSIVE SOUNDS
execute at @e[tag=BatSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.bat.death master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=ChickenSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.chicken.death master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=CowSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.cow.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=DonkeySoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.donkey.angry master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=HorseSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.horse.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=LlamaSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.llama.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=ParrotSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.parrot.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=PolarBearSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.polar_bear.warning master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=PigSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.pig.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=DolphinSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.dolphin.play master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=SheepSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.sheep.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SquidSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.squid.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=VillagerSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.villager.yes master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=WolfSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.wolf.shake master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1

# HOSTILE SOUNDS
#execute at @e[tag=BlazeSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.blaze.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=CreeperSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.creeper.primed master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=ElderGuardianSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.elder_guardian.curse master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=EndermanSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.enderman.death master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=EvokerSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.evoker.prepare_wololo master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=GhastSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.ghast.warn master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=ShulkerSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.shulker.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SkeletonSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.skeleton.death master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=SpiderSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.spider.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=VexSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.vex.charge master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=VindicatorSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.vindicator.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=WitchSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.witch.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
#execute at @e[tag=ZombieSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.zombie.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1
execute at @e[tag=PigmanSoundAEC,scores={FillSoundRoom=350}] align x align z run playsound entity.zombie_pigman.ambient master @a[dx=0,dy=1,dz=0] ~ ~ ~ 1 1 1


# TEST FOR ITEMS IN HOPPER
execute as @e[tag=SoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{Count:1b}]} run scoreboard players set @s SoundCheck -1

execute as @e[tag=AnvilSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:anvil"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=BrewingStandSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:brewing_stand"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=ChestSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:chest"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=GlassSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:glass"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=GrassSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:grass_block"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=IronDoorSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:iron_door"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=LadderSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:ladder"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=NoteBlockSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:note_block"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=PistonSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:piston"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=RedstoneTorchSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:redstone_torch"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SandSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:sand"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SlimeSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:slime_block"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SnowSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:snow_block"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=TripwireSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:tripwire_hook"}]} run scoreboard players set @s SoundCheck 1

#execute as @e[tag=BoatSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:oak_boat"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=FishingRodSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:fishing_rod"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=FireworkSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:firework_rocket"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=FireChargeSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:fire_charge"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=LeadSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:lead"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=MinecartSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:minecart"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=RecordStalSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:music_disc_stal"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=RecordCatSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:music_disc_cat"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=RecordMellohiSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:music_disc_mellohi"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=ShieldSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:shield"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=EatSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:apple"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=DrinkSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:milk_bucket"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=AttackSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:golden_sword"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=FlintSteelSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:flint_and_steel"}]} run scoreboard players set @s SoundCheck 1

execute as @e[tag=BatSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:bat_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=ChickenSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:chicken_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=CowSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:cow_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=DonkeySoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:donkey_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=HorseSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:horse_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=LlamaSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:llama_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=ParrotSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:parrot_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=PolarBearSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:polar_bear_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=PigSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:pig_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=DolphinSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:dolphin_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=SheepSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:sheep_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SquidSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:squid_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=VillagerSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:villager_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=WolfSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:wolf_spawn_egg"}]} run scoreboard players set @s SoundCheck 1

#execute as @e[tag=BlazeSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:blaze_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=CreeperSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:creeper_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=ElderGuardianSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:elder_guardian_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=EndermanSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:enderman_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=EvokerSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:evoker_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=GhastSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:ghast_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=ShulkerSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:shulker_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SkeletonSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:skeleton_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=SpiderSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:spider_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=VexSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:vex_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=VindicatorSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:vindicator_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=WitchSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:witch_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
#execute as @e[tag=ZombieSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:zombie_spawn_egg"}]} run scoreboard players set @s SoundCheck 1
execute as @e[tag=PigmanSoundAEC] at @s if block ~ ~-1 ~ hopper{Items:[{id:"minecraft:zombie_pigman_spawn_egg"}]} run scoreboard players set @s SoundCheck 1


# COMPLETES A SOUND
execute at @e[scores={SoundCheck=1}] run scoreboard players set @e[scores={FillSoundRoom=370..}] FillSoundRoom 370
execute at @e[scores={SoundCheck=1}] run setblock ~ ~-1 ~ red_sandstone
execute at @e[scores={SoundCheck=1}] run particle lava ~ ~ ~ 0.2 0.3 0.2 0 50 force @a
execute at @e[scores={SoundCheck=1}] run stopsound @a[dx=0,dy=2,dz=0]
execute at @e[scores={SoundCheck=1}] run playsound entity.firework_rocket.twinkle_far master @a ~ ~ ~ 1 1 0
execute at @e[scores={SoundCheck=1}] run teleport @a[dx=0,dy=-1,dz=0] ~ 64.1 ~
kill @e[tag=SoundAEC,scores={SoundCheck=1}]


# LOSES
execute if entity @e[scores={SoundCheck=-1}] run setblock 1021 64 8 coal_block
execute if entity @e[scores={SoundCheck=-1}] run scoreboard players set @e[tag=MainPuzzleAEC] SoundCheck -1
execute if entity @e[scores={SoundCheck=-1}] run setblock 1014 61 8 clay
execute if entity @e[scores={SoundCheck=-1}] run fill 1010 63 4 1018 63 12 coal_block replace hopper
execute if entity @e[scores={SoundCheck=-1}] run fill 1010 63 4 1018 63 12 coal_block replace red_sandstone
execute if entity @e[scores={SoundCheck=-1}] run setblock 1010 63 12 black_terracotta
execute if entity @e[scores={SoundCheck=-1}] run particle large_smoke 1010 63 12 0.1 1 0.1 0 50 force @a
execute if entity @e[scores={SoundCheck=-1}] run setblock 1010 63 4 black_terracotta
execute if entity @e[scores={SoundCheck=-1}] run particle large_smoke 1010 63 4 0.1 1 0.1 0 50 force @a
execute if entity @e[scores={SoundCheck=-1}] run setblock 1018 63 4 black_terracotta
execute if entity @e[scores={SoundCheck=-1}] run particle large_smoke 1018 63 4 0.1 1 0.1 0 50 force @a
execute if entity @e[scores={SoundCheck=-1}] run setblock 1018 63 12 black_terracotta
execute if entity @e[scores={SoundCheck=-1}] run particle large_smoke 1018 63 12 0.1 1 0.1 0 50 force @a
execute if entity @e[scores={SoundCheck=-1}] run stopsound @a[x=1009,y=62,z=3,dx=10,dy=5,dz=10]
execute if entity @e[scores={SoundCheck=-1}] run playsound entity.blaze.death master @a 1014 64 8 1 0.7 0
execute if entity @e[scores={SoundCheck=-1}] as @a[x=1009,y=62,z=3,dx=10,dy=1,dz=10] at @s run teleport @s ~ 64.1 ~
execute if entity @e[scores={SoundCheck=-1}] run scoreboard objectives remove FillSoundRoom
execute if entity @e[scores={SoundCheck=-1}] run scoreboard objectives remove SoundWin
execute if entity @e[scores={SoundCheck=-1}] run setblock 36 2 14 clay
execute if entity @e[scores={SoundCheck=-1}] run kill @e[tag=SoundAEC]

execute if entity @e[scores={SoundCheck=-1}] run kill @e[nbt={Item:{tag:{SoundItem:1b}}}]
execute if entity @e[scores={SoundCheck=-1}] run kill @e[type=boat]
execute if entity @e[scores={SoundCheck=-1}] run kill @e[type=minecart]

execute if entity @e[scores={SoundCheck=-1}] run clear @a anvil
execute if entity @e[scores={SoundCheck=-1}] run clear @a brewing_stand
execute if entity @e[scores={SoundCheck=-1}] run clear @a chest
execute if entity @e[scores={SoundCheck=-1}] run clear @a glass
execute if entity @e[scores={SoundCheck=-1}] run clear @a grass_block
execute if entity @e[scores={SoundCheck=-1}] run clear @a iron_door
execute if entity @e[scores={SoundCheck=-1}] run clear @a ladder
execute if entity @e[scores={SoundCheck=-1}] run clear @a note_block
execute if entity @e[scores={SoundCheck=-1}] run clear @a piston
execute if entity @e[scores={SoundCheck=-1}] run clear @a redstone_torch
execute if entity @e[scores={SoundCheck=-1}] run clear @a sand
execute if entity @e[scores={SoundCheck=-1}] run clear @a slime_block
execute if entity @e[scores={SoundCheck=-1}] run clear @a snow_block
execute if entity @e[scores={SoundCheck=-1}] run clear @a tripwire_hook
execute if entity @e[scores={SoundCheck=-1}] run clear @a apple
execute if entity @e[scores={SoundCheck=-1}] run clear @a flint_and_steel
execute if entity @e[scores={SoundCheck=-1}] run clear @a fire_charge
execute if entity @e[scores={SoundCheck=-1}] run clear @a firework_rocket
execute if entity @e[scores={SoundCheck=-1}] run clear @a fishing_rod
execute if entity @e[scores={SoundCheck=-1}] run clear @a golden_sword
execute if entity @e[scores={SoundCheck=-1}] run clear @a lead
execute if entity @e[scores={SoundCheck=-1}] run clear @a milk_bucket
execute if entity @e[scores={SoundCheck=-1}] run clear @a minecart
execute if entity @e[scores={SoundCheck=-1}] run clear @a oak_boat
execute if entity @e[scores={SoundCheck=-1}] run clear @a music_disc_cat
execute if entity @e[scores={SoundCheck=-1}] run clear @a music_disc_mellohi
execute if entity @e[scores={SoundCheck=-1}] run clear @a music_disc_stal
execute if entity @e[scores={SoundCheck=-1}] run clear @a shield

execute if entity @e[scores={SoundCheck=-1}] run clear @a bat_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a chicken_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a cow_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a donkey_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a horse_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a llama_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a parrot_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a polar_bear_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a pig_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a dolphin_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a sheep_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a squid_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a villager_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a wolf_spawn_egg

execute if entity @e[scores={SoundCheck=-1}] run clear @a blaze_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a creeper_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a elder_guardian_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a enderman_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a evoker_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a ghast_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a shulker_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a skeleton_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a spider_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a vex_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a vindicator_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a witch_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a zombie_spawn_egg
execute if entity @e[scores={SoundCheck=-1}] run clear @a zombie_pigman_spawn_egg

execute if entity @e[scores={SoundCheck=-1}] run scoreboard objectives remove SoundCheck


# TO WIN
scoreboard players add @e[tag=MainPuzzleAEC,scores={FillSoundRoom=301..}] SoundWin 1
execute as @e[tag=SoundAEC] run scoreboard players set @e[tag=MainPuzzleAEC] SoundWin 0


# DOORS OPEN
execute if entity @e[scores={SoundWin=52}] run playsound block.note_block.chime master @a ~ ~ ~ 1 0.8 1
execute if entity @e[scores={SoundWin=55}] run playsound block.note_block.chime master @a ~ ~ ~ 1 1.2 1
execute if entity @e[scores={SoundWin=70}] run fill 1012 64 1 1016 65 15 clay replace redstone_block

execute if entity @e[scores={SoundWin=70}] unless block 1021 64 8 coal_block run advancement grant @a only d3:folder_b/good_ear

# SWITCH TO END KEY
execute as @e[scores={SoundWin=70}] run setblock 1021 65 8 clay
execute as @e[scores={SoundWin=70}] run setblock 1021 65 8 command_block[facing=up]{auto:0b,TrackOutput:false}


# END
execute as @e[scores={SoundWin=70}] run fill 1010 63 4 1018 63 12 brown_terracotta replace brown_shulker_box
execute as @e[scores={SoundWin=70}] run setblock 1014 61 8 clay
execute as @e[scores={SoundWin=70}] run fill 1010 63 4 1018 63 12 red_sandstone replace hopper

execute as @e[scores={SoundWin=70}] run setblock 36 2 14 clay
execute as @e[scores={SoundWin=70}] run scoreboard objectives remove FillSoundRoom
execute as @e[scores={SoundWin=70}] run scoreboard objectives remove SoundCheck
execute as @e[scores={SoundWin=70}] run scoreboard objectives remove SoundWin

#[tag=MainPuzzleAEC]




#execute @p[score_SoundWin_min=68] ~ ~ ~ scoreboard objectives remove SoundWin
