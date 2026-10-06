####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 15 2017 / JANUARY 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


execute align x align y align z run effect give @a[x=889,y=65,z=-938,dx=0,dy=13,dz=0] levitation 1 6
execute align x align y align z run effect give @a[x=909,y=65,z=-938,dx=0,dy=13,dz=0] levitation 1 6


### LETTER PARKOUR ###
#scoreboard objectives setdisplay sidebar InRangeTimer
#scoreboard objectives setdisplay sidebar LetterParkWin


execute align x align y align z run execute if entity @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] run fill 864 85 -866 934 90 -866 air
execute align x align y align z run execute if entity @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] run scoreboard players reset @e[tag=RightLetterCloud] InRangeTimer
execute align x align y align z run execute if entity @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] run execute at @e[tag=RightLetterCloud] run fill ~ ~2 ~ ~5 ~3 ~5 white_concrete replace pink_concrete
execute align x align y align z run execute if entity @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] run scoreboard objectives remove LetterParkWin

execute align x align y align z run effect give @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] resistance 1 255 true

execute align x align y align z run tag @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] add LossSound
execute if entity @a[tag=LossSound] run setblock 33 3 -18 coal_block
execute at @a[tag=LossSound] run execute if block ~ ~-1 ~ quartz_block run execute at @a run playsound entity.wither.hurt master @a 899 65 -933 0.5 0.7 0.5
execute at @a[tag=LossSound] run execute if block ~ ~-1 ~ quartz_block run tag @a[tag=LossSound] remove LossSound

execute align x align y align z run teleport @a[x=863,y=56,z=-935,dx=72,dy=1,dz=72] 899 65 -933 0 0

tag @e[tag=LetterCloud] remove LetterInRange
execute at @e[tag=LetterCloud_A] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_A] add LetterInRange
execute at @e[tag=LetterCloud_B] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_B] add LetterInRange
execute at @e[tag=LetterCloud_C] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_C] add LetterInRange
execute at @e[tag=LetterCloud_D] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_D] add LetterInRange
execute at @e[tag=LetterCloud_E] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_E] add LetterInRange
execute at @e[tag=LetterCloud_F] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_F] add LetterInRange
execute at @e[tag=LetterCloud_G] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_G] add LetterInRange
execute at @e[tag=LetterCloud_H] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_H] add LetterInRange
execute at @e[tag=LetterCloud_I] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_I] add LetterInRange
execute at @e[tag=LetterCloud_J] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_J] add LetterInRange
execute at @e[tag=LetterCloud_K] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_K] add LetterInRange
execute at @e[tag=LetterCloud_L] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_L] add LetterInRange
execute at @e[tag=LetterCloud_M] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_M] add LetterInRange
execute at @e[tag=LetterCloud_N] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_N] add LetterInRange
execute at @e[tag=LetterCloud_O] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_O] add LetterInRange
execute at @e[tag=LetterCloud_P] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_P] add LetterInRange
execute at @e[tag=LetterCloud_Q] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_Q] add LetterInRange
execute at @e[tag=LetterCloud_R] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_R] add LetterInRange
execute at @e[tag=LetterCloud_S] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_S] add LetterInRange
execute at @e[tag=LetterCloud_T] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_T] add LetterInRange
execute at @e[tag=LetterCloud_U] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_U] add LetterInRange
execute at @e[tag=LetterCloud_V] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_V] add LetterInRange
execute at @e[tag=LetterCloud_W] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_W] add LetterInRange
execute at @e[tag=LetterCloud_X] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_X] add LetterInRange
execute at @e[tag=LetterCloud_Y] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_Y] add LetterInRange
execute at @e[tag=LetterCloud_Z] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_Z] add LetterInRange
execute at @e[tag=LetterCloud_0] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_0] add LetterInRange
execute at @e[tag=LetterCloud_1] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_1] add LetterInRange
execute at @e[tag=LetterCloud_2] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_2] add LetterInRange
execute at @e[tag=LetterCloud_3] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_3] add LetterInRange
execute at @e[tag=LetterCloud_4] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_4] add LetterInRange
execute at @e[tag=LetterCloud_5] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_5] add LetterInRange
execute at @e[tag=LetterCloud_6] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_6] add LetterInRange
execute at @e[tag=LetterCloud_7] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_7] add LetterInRange
execute at @e[tag=LetterCloud_8] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_8] add LetterInRange
execute at @e[tag=LetterCloud_9] run execute if entity @a[dx=5,dy=6,dz=5] run tag @e[tag=LetterCloud_9] add LetterInRange

scoreboard players add @e[tag=LetterInRange] InRangeTimer 1
scoreboard players reset @e[tag=WrongLetterCloud,tag=!LetterInRange] InRangeTimer
execute at @e[tag=WrongLetterCloud,tag=!LetterInRange] run fill ~ ~2 ~ ~5 ~3 ~5 white_concrete replace light_gray_concrete
execute at @e[tag=WrongLetterCloud,tag=!LetterInRange] run fill ~ ~2 ~ ~5 ~3 ~5 white_concrete replace gray_concrete
execute at @e[tag=WrongLetterCloud,tag=!LetterInRange] run fill ~ ~2 ~ ~5 ~3 ~5 white_concrete replace black_concrete

execute if entity @e[tag=RightLetterCloud,scores={InRangeTimer=5}] run execute at @a run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5 0
execute as @e[tag=RightLetterCloud,scores={InRangeTimer=10..}] at @s run fill ~ ~2 ~ ~5 ~3 ~5 pink_concrete replace white_concrete

execute if entity @e[tag=LetterCloud_D,scores={InRangeTimer=5}] run clone 929 85 -862 934 90 -862 929 85 -866
execute if entity @e[tag=LetterCloud_I,scores={InRangeTimer=5}] run clone 922 85 -862 927 90 -862 922 85 -866
execute if entity @e[tag=LetterCloud_V,scores={InRangeTimer=5}] run clone 915 85 -862 920 90 -862 915 85 -866
execute if entity @e[tag=LetterCloud_E,scores={InRangeTimer=5}] run clone 908 85 -862 913 90 -862 908 85 -866
execute if entity @e[tag=LetterCloud_R,scores={InRangeTimer=5}] run clone 901 85 -862 906 90 -862 901 85 -866
execute if entity @e[tag=LetterCloud_S,scores={InRangeTimer=5}] run clone 894 85 -862 899 90 -862 894 85 -866
execute if entity @e[tag=LetterCloud_I,scores={InRangeTimer=5}] run clone 887 85 -862 892 90 -862 887 85 -866
execute if entity @e[tag=LetterCloud_T,scores={InRangeTimer=5}] run clone 880 85 -862 885 90 -862 880 85 -866
execute if entity @e[tag=LetterCloud_Y,scores={InRangeTimer=5}] run clone 873 85 -862 878 90 -862 873 85 -866
execute if entity @e[tag=LetterCloud_3,scores={InRangeTimer=5}] run clone 864 85 -862 869 90 -862 864 85 -866

scoreboard players set @e[tag=RightLetterCloud,scores={InRangeTimer=5..}] InRangeTimer 100

execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=10}] run playsound entity.creeper.hurt master @a ~2.5 ~4 ~2.5 0.5 1 0
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=17}] run playsound entity.creeper.hurt master @a ~2.5 ~4 ~2.5 0.5 1 0
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=24}] run playsound entity.creeper.hurt master @a ~2.5 ~4 ~2.5 0.5 1 0
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=31}] run particle large_smoke ~2.5 ~4 ~2.5 1 0.1 1 0 5 force @a

execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=10}] run fill ~ ~2 ~ ~5 ~3 ~5 light_gray_concrete replace white_concrete
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=17}] run fill ~ ~2 ~ ~5 ~3 ~5 gray_concrete replace light_gray_concrete
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=24}] run fill ~ ~2 ~ ~5 ~3 ~5 black_concrete replace gray_concrete
execute at @e[tag=WrongLetterCloud,scores={InRangeTimer=31}] run fill ~ ~2 ~ ~5 ~3 ~5 air replace black_concrete

execute at @e[tag=LetterCloud_A,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 2 -23 30 2 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_A,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 2 -23 30 2 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_B,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 5 -23 30 5 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_B,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 5 -23 30 5 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_C,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 8 -23 30 8 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_C,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 8 -23 30 8 -18 ~ ~2 ~


execute at @e[tag=LetterCloud_F,tag=!LetterInRange] run execute if block ~4 ~2 ~ air run clone 25 17 -23 30 17 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_F,tag=!LetterInRange] run execute if block ~4 ~2 ~ air run clone 25 17 -23 30 17 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_G,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 20 -23 30 20 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_G,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 20 -23 30 20 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_H,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 23 -23 30 23 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_H,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 23 -23 30 23 -18 ~ ~2 ~


execute at @e[tag=LetterCloud_J,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 29 -23 30 29 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_J,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 25 29 -23 30 29 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_K,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 32 -23 30 32 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_K,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 32 -23 30 32 -18 ~ ~3 ~

execute at @e[tag=LetterCloud_L,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 35 -23 30 35 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_L,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 25 35 -23 30 35 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_M,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 2 -23 22 2 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_M,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 2 -23 22 2 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_M,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 5 -23 22 5 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_M,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 5 -23 22 5 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_O,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 8 -23 22 8 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_O,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 8 -23 22 8 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_P,tag=!LetterInRange] run execute if block ~4 ~2 ~ air run clone 17 11 -23 22 11 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_P,tag=!LetterInRange] run execute if block ~4 ~2 ~ air run clone 17 11 -23 22 11 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_Q,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 14 -23 22 14 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_Q,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 14 -23 22 14 -18 ~ ~2 ~


execute at @e[tag=LetterCloud_U,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 26 -23 22 26 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_U,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 26 -23 22 26 -18 ~ ~2 ~


execute at @e[tag=LetterCloud_W,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 32 -23 22 32 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_W,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 32 -23 22 32 -18 ~ ~2 ~

execute at @e[tag=LetterCloud_X,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 35 -23 22 35 -18 ~ ~3 ~
execute at @e[tag=LetterCloud_X,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 35 -23 22 35 -18 ~ ~2 ~


execute at @e[tag=LetterCloud_Z,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 5 -31 22 5 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_Z,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 5 -31 22 5 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_0,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 8 -31 22 8 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_0,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 8 -31 22 8 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_1,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 11 -31 22 11 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_1,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 11 -31 22 11 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_2,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 14 -31 22 14 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_2,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 14 -31 22 14 -26 ~ ~2 ~


execute at @e[tag=LetterCloud_4,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 20 -31 22 20 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_4,tag=!LetterInRange] run execute if block ~ ~2 ~ air run clone 17 20 -31 22 20 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_5,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 23 -31 22 23 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_5,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 23 -31 22 23 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_6,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 26 -31 22 26 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_6,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 26 -31 22 26 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_7,tag=!LetterInRange] run execute if block ~2 ~2 ~ air run clone 17 29 -31 22 29 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_7,tag=!LetterInRange] run execute if block ~2 ~2 ~ air run clone 17 29 -31 22 29 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_8,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 32 -31 22 32 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_8,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 32 -31 22 32 -26 ~ ~2 ~

execute at @e[tag=LetterCloud_9,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 35 -31 22 35 -26 ~ ~3 ~
execute at @e[tag=LetterCloud_9,tag=!LetterInRange] run execute if block ~1 ~2 ~ air run clone 17 35 -31 22 35 -26 ~ ~2 ~

execute unless entity @e[scores={LetterParkWin=50..}] run fill 867 65 -867 931 98 -867 air replace purple_stained_glass_pane
execute unless entity @e[scores={LetterParkWin=50..}] run fill 867 99 -867 931 99 -867 air replace sea_lantern
execute unless entity @e[scores={LetterParkWin=50..}] run fill 865 64 -870 933 64 -865 quartz_block replace purple_concrete
execute unless entity @e[scores={LetterParkWin=50..}] run fill 865 64 -870 933 64 -865 quartz_block replace water
execute unless entity @e[scores={LetterParkWin=50..}] run fill 865 63 -869 933 63 -865 air replace purple_terracotta
execute unless entity @e[scores={LetterParkWin=50..}] run execute if block 899 93 -865 air run clone 933 85 -901 937 96 -897 897 93 -865

# WIN
execute if entity @e[tag=LetterCloud_D,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_I,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_V,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_E,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_R,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_S,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_I,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_T,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_Y,scores={InRangeTimer=100}] run execute if entity @e[tag=LetterCloud_3,scores={InRangeTimer=100}] run scoreboard objectives add LetterParkWin dummy
scoreboard players add @e[tag=MainParkourAEC] LetterParkWin 0
scoreboard players add @e[scores={LetterParkWin=..99}] LetterParkWin 1

execute if entity @e[scores={LetterParkWin=50}] run execute at @a run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1 1
execute if entity @e[scores={LetterParkWin=50..}] run fill 897 93 -865 901 104 -861 air replace quartz_block
execute if entity @e[scores={LetterParkWin=50..}] run fill 897 93 -865 901 104 -861 air replace quartz_pillar
execute if entity @e[scores={LetterParkWin=50..}] run fill 931 65 -867 931 98 -867 purple_stained_glass_pane[south=false] replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 867 65 -867 867 98 -867 purple_stained_glass_pane[south=false] replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 931 99 -867 931 99 -867 sea_lantern replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 867 99 -867 867 99 -867 sea_lantern replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 929 63 -869 933 63 -865 purple_terracotta replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 865 63 -869 869 63 -865 purple_terracotta replace air
execute if entity @e[scores={LetterParkWin=50..}] run fill 929 64 -869 933 64 -865 water replace quartz_block
execute if entity @e[scores={LetterParkWin=50..}] run fill 865 64 -869 869 64 -865 water replace quartz_block
execute if entity @e[scores={LetterParkWin=50..}] run fill 928 64 -870 933 64 -865 purple_concrete replace quartz_block
execute if entity @e[scores={LetterParkWin=50..}] run fill 865 64 -870 870 64 -865 purple_concrete replace quartz_block
execute if entity @e[scores={LetterParkWin=50..}] run execute if block 897 93 -865 air run clone 32 18 -28 36 27 -24 897 93 -865
fill 898 97 -863 900 101 -863 end_gateway replace purple_stained_glass

execute if block 931 65 -867 purple_stained_glass_pane run effect give @a[x=931,y=65,z=-867,dx=0,dy=25,dz=0] levitation 1 6
execute if block 867 65 -867 purple_stained_glass_pane run effect give @a[x=867,y=65,z=-867,dx=0,dy=25,dz=0] levitation 1 6


# COMPLETE PURPLE
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={PurpleParkour=0}] PurpleParkour 1
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run setblock 33 1 -18 purple_concrete
#execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute unless block 33 3 -18 coal_block run advancement grant @a only d3:folder_b/wordsmith

execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=898,y=97,z=-863,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0


# RETURN FROM PURPLE
execute align x align y align z if entity @a[x=899,y=82,z=-945,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=899,y=82,z=-945,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=899,y=82,z=-945,dx=0,dy=0,dz=0] run teleport @a 999 66 -997 31 0
