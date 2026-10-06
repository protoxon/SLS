####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 28 2018 / JULY 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a night_vision

### ORANGE ###
execute if block 40 1 -18 orange_concrete run title @a times 1 80 1
execute if block 40 1 -18 orange_concrete run title @a title {"text":"■ Hop on the Wrong Track ■","bold":false,"color":"gold"}
execute if block 40 1 -18 orange_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 40 1 -18 orange_concrete run setblock 40 1 -18 orange_concrete_powder


### YELLOW ###
execute if block 39 1 -18 yellow_concrete run title @a times 1 80 1
execute if block 39 1 -18 yellow_concrete run title @a title {"text":"■ Deep in the Vault ■","bold":false,"color":"yellow"}
execute if block 39 1 -18 yellow_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 39 1 -18 yellow_concrete run setblock 39 1 -18 yellow_concrete_powder


### BROWN ###
execute if block 38 1 -18 brown_concrete run title @a times 1 80 1
execute if block 38 1 -18 brown_concrete run title @a title {"text":"■ Spring in Your Step ■","bold":false,"color":"dark_red"}
execute if block 38 1 -18 brown_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 38 1 -18 brown_concrete run setblock 38 1 -18 brown_concrete_powder


### BLACK ###
execute if block 37 1 -18 black_concrete run title @a times 1 80 1
execute if block 37 1 -18 black_concrete run title @a title {"text":"■ Cannonball Run ■","bold":false,"color":"dark_gray"}
execute if block 37 1 -18 black_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 37 1 -18 black_concrete run setblock 37 1 -18 black_concrete_powder


### LIME ###
execute if block 36 1 -18 lime_concrete run title @a times 1 80 1
execute if block 36 1 -18 lime_concrete run title @a title {"text":"■ Liberty or Death ■","bold":false,"color":"green"}
execute if block 36 1 -18 lime_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 36 1 -18 lime_concrete run setblock 36 1 -18 lime_concrete_powder


### LIGHT BLUE ###
execute if block 35 1 -18 light_blue_concrete run title @a times 1 80 1
execute if block 35 1 -18 light_blue_concrete run title @a title {"text":"■ Room With a View ■","bold":false,"color":"blue"}
execute if block 35 1 -18 light_blue_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 35 1 -18 light_blue_concrete run setblock 35 1 -18 light_blue_concrete_powder


### GREEN ###
execute if block 34 1 -18 green_concrete run title @a times 1 80 1
execute if block 34 1 -18 green_concrete run title @a title {"text":"■ Once Upon a Time ■","bold":false,"color":"dark_green"}
execute if block 34 1 -18 green_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 34 1 -18 green_concrete run setblock 34 1 -18 green_concrete_powder


### PURPLE ###
execute if block 33 1 -18 purple_concrete run title @a times 1 80 1
execute if block 33 1 -18 purple_concrete run title @a title {"text":"■ Fill in the Blanks ■","bold":false,"color":"dark_purple"}
execute if block 33 1 -18 purple_concrete run title @a subtitle {"text":"Course Complete", "color":"white"}
execute if block 33 1 -18 purple_concrete run setblock 33 1 -18 purple_concrete_powder


execute if block 42 1 -18 mossy_stone_bricks run function d3:parkour/remove_platforms
execute if block 42 1 -18 mossy_stone_bricks run kill @e[tag=ParkourStand]
execute if block 42 1 -18 mossy_stone_bricks run summon armor_stand 1000 66.2 -1000 {Invisible:true,ShowArms:true,Small:false,NoGravity:true,HandItems:[{id:"minecraft:white_carpet",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:mossy_stone_bricks",Count:1b}],Pose:{RightArm:[0f,270f,0f]},Tags:["ParkourStand"],Invulnerable:true,DisabledSlots:1973790}
execute if block 42 1 -18 mossy_stone_bricks run clone 38 13 -21 40 19 -18 999 64 -993
execute if block 42 1 -18 mossy_stone_bricks run kill @e[tag=ParkourCloud]
execute if block 42 1 -18 mossy_stone_bricks run summon area_effect_cloud 1000 66 -991 {Tags:["WhiteParkourCloud","ParkourCloud","ParkourTPCloud"],Duration:2147483647}


#execute if block 42 1 -18 mossy_stone_bricks run setblock 42 1 -18 white_concrete_powder

execute if block 1000 65 -992 stone_bricks run execute if block 42 1 -18 mossy_stone_bricks run playsound entity.evoker.cast_spell master @a 1000 67 -1000 0.5 1 0
execute if block 1000 65 -992 stone_bricks run execute if block 42 1 -18 mossy_stone_bricks run playsound entity.ender_eye.death master @a 1000 67 -1000 2 0.3 0
execute if block 1000 65 -992 stone_bricks run execute if block 42 1 -18 mossy_stone_bricks run playsound entity.evoker.cast_spell master @a 1000 193 -1000 0.5 1 0
execute if block 1000 65 -992 stone_bricks run execute if block 42 1 -18 mossy_stone_bricks run playsound entity.ender_eye.death master @a 1000 193 -1000 2 0.3 0
execute if block 1000 65 -992 stone_bricks run execute if block 42 1 -18 mossy_stone_bricks run setblock 42 1 -18 white_concrete_powder

# execute if entity @a[x=995,y=192,z=-1005,dx=10,dy=3,dz=10] run execute if block 42 1 -18 mossy_stone_bricks run setblock 42 1 -18 white_concrete_powder