####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 27 2018 / OCTOBER 5 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 958 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P5B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=818,y=54,z=1037,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P5B dummy
execute align x align y align z if entity @a[x=818,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P5B 1

execute if entity @e[scores={Incorrect_P5B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P5B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P5B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P5B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P5B=1}] run title @a subtitle {"text":"Faithful wasn't created by Kahr", "color":"white"}
execute if entity @e[scores={Incorrect_P5B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Kahr is the creator of MCPatcher, a program that greatly enhanced Resource Pack textures for Minecraft. The program stopped being updated after 1.8.3 so now it looks like you'll have to figure out how to patch up this MC on your own.","color":"red"}]

execute if entity @e[scores={Incorrect_P5B=1}] run fill 822 57 1045 838 57 1053 air replace purple_carpet
execute if entity @e[scores={Incorrect_P5B=1}] as @e[tag=P5BLlama] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P5B=2}] run summon llama 829 57 1057 {DecorItem:{id:"minecraft:purple_carpet", Count:1b}, Tame: true, Invulnerable: true, Age: -999999, Rotation:[180f,0f], Leashed: true, Leash: {X: 830, Y: 58, Z: 1057}, Variant: 0, Tags: ["P5BLlama"]}


execute as @e[tag=P5BLlama] at @s if block ~ ~-1 ~ dark_oak_slab run setblock ~ ~ ~ purple_carpet

execute if entity @e[scores={Incorrect_P5B=80..}] if block 838 57 1047 purple_carpet if block 838 57 1047 purple_carpet if block 838 57 1050 purple_carpet if block 838 57 1051 purple_carpet if block 838 57 1052 purple_carpet if block 837 57 1045 purple_carpet if block 837 57 1046 purple_carpet if block 836 57 1051 purple_carpet if block 836 57 1052 purple_carpet if block 835 57 1049 purple_carpet if block 835 57 1050 purple_carpet if block 834 57 1049 purple_carpet if block 834 57 1051 purple_carpet if block 833 57 1051 purple_carpet if block 832 57 1045 purple_carpet if block 832 57 1047 purple_carpet if block 832 57 1048 purple_carpet if block 832 57 1050 purple_carpet if block 831 57 1045 purple_carpet if block 831 57 1046 purple_carpet if block 831 57 1049 purple_carpet if block 831 57 1053 purple_carpet if block 829 57 1049 purple_carpet if block 829 57 1052 purple_carpet if block 828 57 1047 purple_carpet if block 828 57 1050 purple_carpet if block 828 57 1053 purple_carpet if block 827 57 1045 purple_carpet if block 826 57 1045 purple_carpet if block 826 57 1052 purple_carpet if block 825 57 1046 purple_carpet if block 825 57 1053 purple_carpet if block 824 57 1053 purple_carpet if block 823 57 1046 purple_carpet if block 823 57 1051 purple_carpet if block 823 57 1052 purple_carpet run teleport @a[tag=WrongAnswer] 958 67 1000 0 0







# END SAFEGUARD
execute align x align y align z unless entity @a[x=818,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives add P5B_End dummy
execute align x align y align z if entity @a[x=818,y=54,z=1037,dx=24,dy=24,dz=24] run scoreboard objectives remove P5B_End
execute align x align y align z unless entity @a[x=818,y=54,z=1037,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P5B_End 1

execute if entity @e[scores={P5B_End=25..}] run clear @a
execute if entity @e[scores={P5B_End=25..}] run scoreboard objectives remove Incorrect_P5B
execute if entity @e[scores={P5B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P5B_End=25..}] run scoreboard objectives remove P5B_End