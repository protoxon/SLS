####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2018 / JULY 25 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1029 73 985

#scoreboard objectives setdisplay sidebar Incorrect_G3B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=969,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G3B dummy
execute align x align y align z if entity @a[x=1125,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G3B 1

execute if entity @e[scores={Incorrect_G3B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G3B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G3B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G3B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G3B=1}] run title @a subtitle {"text":"Sunflowers do not face South", "color":"white"}
execute if entity @e[scores={Incorrect_G3B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Good try but maybe you should face south and fix these flowers.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_G3B=1}] run fill 1128 56 984 1147 56 990 air
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1128 56 984 potted_poppy
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1128 56 990 potted_blue_orchid
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1130 56 987 potted_fern
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1132 56 984 potted_brown_mushroom
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1131 56 991 potted_dandelion
#execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1133 56 988 potted_azure_bluet
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1133 56 988 potted_cornflower
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1135 56 986 potted_allium
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1136 56 991 potted_orange_tulip
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1138 56 985 potted_oxeye_daisy
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1138 56 988 potted_dark_oak_sapling
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1140 56 986 potted_pink_tulip
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1141 56 990 potted_cactus
#execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1143 56 984 potted_white_tulip
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1143 56 984 potted_lily_of_the_valley
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1144 56 987 potted_acacia_sapling
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1145 56 990 potted_birch_sapling
#execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1147 56 986 potted_spruce_sapling
execute if entity @e[scores={Incorrect_G3B=2}] run setblock 1147 56 986 potted_wither_rose

execute if entity @e[scores={Incorrect_G3B=2}] run fill 1128 56 971 1147 56 978 air

execute if entity @e[scores={Incorrect_G3B=110}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=110}] run setblock 1140 56 976 potted_acacia_sapling

execute if entity @e[scores={Incorrect_G3B=125}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=125}] run setblock 1131 56 971 potted_allium

execute if entity @e[scores={Incorrect_G3B=135}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=135}] run setblock 1132 56 978 potted_cornflower

execute if entity @e[scores={Incorrect_G3B=145}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=145}] run setblock 1147 56 976 potted_birch_sapling

execute if entity @e[scores={Incorrect_G3B=153}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=153}] run setblock 1141 56 972 potted_blue_orchid

execute if entity @e[scores={Incorrect_G3B=161}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=161}] run setblock 1135 56 976 potted_brown_mushroom

execute if entity @e[scores={Incorrect_G3B=169}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=169}] run setblock 1145 56 972 potted_cactus

execute if entity @e[scores={Incorrect_G3B=177}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=177}] run setblock 1130 56 975 potted_dandelion

execute if entity @e[scores={Incorrect_G3B=183}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=183}] run setblock 1136 56 971 potted_dark_oak_sapling

execute if entity @e[scores={Incorrect_G3B=190}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=190}] run setblock 1143 56 978 potted_fern

execute if entity @e[scores={Incorrect_G3B=196}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=196}] run setblock 1133 56 974 potted_orange_tulip

execute if entity @e[scores={Incorrect_G3B=202}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=202}] run setblock 1138 56 974 potted_oxeye_daisy

execute if entity @e[scores={Incorrect_G3B=207}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=207}] run setblock 1128 56 978 potted_pink_tulip

execute if entity @e[scores={Incorrect_G3B=211}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=211}] run setblock 1144 56 975 potted_poppy

execute if entity @e[scores={Incorrect_G3B=214}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=214}] run setblock 1128 56 972 potted_wither_rose

execute if entity @e[scores={Incorrect_G3B=1250}] at @a run playsound entity.item.pickup master @a ~ ~ ~
execute if entity @e[scores={Incorrect_G3B=1250}] run setblock 1138 56 977 potted_lily_of_the_valley


# FOR THE WIN
execute if entity @e[scores={Incorrect_G3B=450..}] if block 1128 56 978 potted_poppy if block 1128 56 972 potted_blue_orchid if block 1130 56 975 potted_fern if block 1132 56 978 potted_brown_mushroom if block 1133 56 974 potted_cornflower if block 1135 56 976 potted_allium if block 1136 56 971 potted_orange_tulip if block 1138 56 977 potted_oxeye_daisy if block 1138 56 974 potted_dark_oak_sapling if block 1140 56 976 potted_pink_tulip if block 1141 56 972 potted_cactus if block 1143 56 978 potted_lily_of_the_valley if block 1144 56 975 potted_acacia_sapling if block 1145 56 972 potted_birch_sapling if block 1147 56 976 potted_wither_rose run teleport @a[tag=WrongAnswer] 1029 67 1000 180 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives add G3B_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=969,dx=24,dy=24,dz=24] run scoreboard objectives remove G3B_End
execute align x align y align z unless entity @a[x=1125,y=54,z=969,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G3B_End 1

execute if entity @e[scores={G3B_End=25..}] run clear @a
execute if entity @e[scores={G3B_End=25..}] run scoreboard objectives remove Incorrect_G3B
execute if entity @e[scores={G3B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G3B_End=25..}] run scoreboard objectives remove G3B_End