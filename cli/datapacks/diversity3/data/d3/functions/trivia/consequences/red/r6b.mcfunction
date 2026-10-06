####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 13 2018 / SEPTEMBER 14 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 71 1049

#scoreboard objectives setdisplay sidebar Incorrect_R6B
#scoreboard objectives setdisplay sidebar R6BSound
#scoreboard objectives setdisplay sidebar R6BShovel
#scoreboard objectives setdisplay sidebar R6BWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=969,y=54,z=1169,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R6B dummy
execute align x align y align z if entity @a[x=969,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R6B 1

execute if entity @e[scores={Incorrect_R6B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R6B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R6B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R6B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R6B=1}] run title @a subtitle {"text":"N.B.T. is not Native Byte Type", "color":"white"}
execute if entity @e[scores={Incorrect_R6B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: It doesn't stand for Noisy Buried Treasure either. But maybe you can find one.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_R6B=1}] run clone 969 27 1169 993 50 1193 969 54 1169 masked
execute if entity @e[scores={Incorrect_R6B=1}] align x align y align z run kill @e[type=item,x=969,y=54,z=1169,dx=24,dy=24,dz=24]


execute if entity @e[scores={Incorrect_R6B=80}] run scoreboard objectives add R6BSound dummy
scoreboard players add @e[tag=MainTriviaAEC] R6BSound 1
execute if entity @e[scores={R6BSound=2}] run playsound entity.ghast.ambient master @a 986 59 1179 0.1 1 0
scoreboard players set @e[scores={R6BSound=60..}] R6BSound 0
execute if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:ghast_tear"}]}] run scoreboard players set @e[tag=MainTriviaAEC] R6BSound 0

execute at @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:ghast_tear"}]}] run playsound entity.ghast.hurt master @a 986 59 1179 5 1 1

execute if entity @e[scores={Incorrect_R6B=100}] run scoreboard objectives add R6BShovel dummy
scoreboard players reset @a[nbt={Inventory:[{id:"minecraft:golden_shovel"}]}] R6BShovel
scoreboard players add @a[nbt=!{Inventory:[{id:"minecraft:golden_shovel"}]}] R6BShovel 1
give @a[tag=WrongAnswer,scores={R6BShovel=30..}] golden_shovel{Unbreakable:true,CanDestroy:["minecraft:sand"],HideFlags:6}

kill @e[type=item,nbt={Item:{id:"minecraft:golden_shovel"}}]



execute if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:ghast_tear"}]}] run scoreboard objectives add R6BWin dummy
execute unless entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:ghast_tear"}]}] run scoreboard players add @e[tag=MainTriviaAEC] R6BWin 1
execute if entity @e[scores={R6BWin=50..}] run teleport @a[tag=WrongAnswer] 1000 67 1049 90 0



# END SAFEGUARD
execute align x align y align z unless entity @a[x=969,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives add R6B_End dummy
execute align x align y align z if entity @a[x=969,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives remove R6B_End
execute align x align y align z unless entity @a[x=969,y=54,z=1169,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R6B_End 1

execute if entity @e[scores={R6B_End=25..}] run clear @a
execute if entity @e[scores={R6B_End=25..}] run scoreboard objectives remove R6BWin
execute if entity @e[scores={R6B_End=25..}] run scoreboard objectives remove R6BShovel
execute if entity @e[scores={R6B_End=25..}] run scoreboard objectives remove R6BSound
execute if entity @e[scores={R6B_End=25..}] run scoreboard objectives remove Incorrect_R6B
execute if entity @e[scores={R6B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R6B_End=25..}] run scoreboard objectives remove R6B_End