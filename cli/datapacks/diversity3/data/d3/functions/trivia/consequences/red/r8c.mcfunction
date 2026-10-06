####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 16 2018 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

difficulty hard

spawnpoint @a 995 72 1062

#scoreboard objectives setdisplay sidebar Incorrect_R8C
#scoreboard objectives setdisplay sidebar R8CDoor
#scoreboard objectives setdisplay sidebar R8CSafe

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=909,y=54,z=1199,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R8C dummy
execute align x align y align z if entity @a[x=909,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R8C 1

execute if entity @e[scores={Incorrect_R8C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R8C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R8C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R8C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R8C=1}] run title @a subtitle {"text":"KillerRabbit:true isn't even a real tag", "color":"white"}
execute if entity @e[scores={Incorrect_R8C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Good! You've broken into Mr. Fluffy's house. Quick! Grab his valuable golden carrot and get out of there while he still can't find his key!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R8C=1}] run scoreboard objectives remove R8CSafe
execute if entity @e[scores={Incorrect_R8C=1}] run scoreboard objectives remove R8CDoor
execute if entity @e[scores={Incorrect_R8C=1}] run kill @e[type=item,x=909,y=54,z=1199,dx=24,dy=24,dz=24]
execute if entity @e[scores={Incorrect_R8C=1}] run kill @e[tag=R8CRabbit]
execute if entity @e[scores={Incorrect_R8C=1}] run fill 920 63 1202 922 65 1202 glass_pane replace air

effect give @e[tag=R8CMob] resistance 2 255 true
effect give @e[tag=R8CMob] regeneration 2 255 true
effect give @e[tag=R8CMob] strength 2 10 true
effect give @e[tag=R8CMob] speed 2 8 true

execute if entity @e[scores={Incorrect_R8C=400}] run scoreboard objectives add R8CDoor dummy
scoreboard players add @e[tag=MainTriviaAEC] R8CDoor 0
scoreboard players add @e[scores={R8CDoor=0..}] R8CDoor 1
scoreboard players set @e[scores={R8CDoor=100..}] R8CDoor 0

execute if entity @e[scores={R8CDoor=1}] run kill @e[tag=R8CSoundAEC]
execute if entity @e[scores={R8CDoor=1}] run summon area_effect_cloud 925 56 1200 {Tags:["R8CSoundAEC"],Duration:2147483647}
execute if entity @e[scores={R8CDoor=1}] run summon area_effect_cloud 926 56 1200 {Tags:["R8CSoundAEC"],Duration:2147483647}
execute if entity @e[scores={R8CDoor=1}] run summon area_effect_cloud 927 56 1200 {Tags:["R8CSoundAEC"],Duration:2147483647}
execute if entity @e[scores={R8CDoor=1}] run summon area_effect_cloud 928 56 1200 {Tags:["R8CSoundAEC"],Duration:2147483647}
execute if entity @e[scores={R8CDoor=2}] at @e[tag=R8CSoundAEC] run setblock ~ ~ ~ clay

execute if entity @e[scores={R8CDoor=5}] at @e[tag=R8CSoundAEC,sort=random,limit=1] run setblock ~ ~ ~ note_block
execute if entity @e[scores={R8CDoor=5}] at @e[tag=R8CSoundAEC,sort=random,limit=1] run setblock ~ ~ ~ note_block
execute if entity @e[scores={R8CDoor=5}] at @e[tag=R8CSoundAEC,sort=random,limit=1] run setblock ~ ~ ~ note_block
execute if entity @e[scores={R8CDoor=5}] at @e[tag=R8CSoundAEC,sort=random,limit=1] run setblock ~ ~ ~ note_block

execute if entity @e[scores={R8CDoor=10}] if block 926 56 1200 note_block run playsound entity.zombie.attack_wooden_door master @a 926 57 1201 1 1 0
execute if entity @e[scores={R8CDoor=32}] if block 927 56 1200 note_block run playsound entity.zombie.attack_wooden_door master @a 926 57 1201 1 1 0
execute if entity @e[scores={R8CDoor=40}] if block 928 56 1200 note_block run playsound entity.zombie.attack_wooden_door master @a 926 57 1201 1 1 0

execute if entity @e[scores={Incorrect_R8C=1}] run setblock 922 62 1203 air
execute if entity @e[scores={Incorrect_R8C=1}] run setblock 922 62 1203 dispenser[facing=south]{CustomName: "{\"text\":\"Safe\"}", x: 922, y: 62, z: 1203, Items: [{Slot: 4b, id: "minecraft:golden_carrot", Count: 1b}]}


scoreboard objectives add R8CSafe minecraft.custom:minecraft.inspect_dispenser
execute if entity @a[scores={R8CSafe=1}] run scoreboard objectives remove R8CDoor
execute if entity @a[scores={R8CSafe=1}] run fill 920 63 1202 922 64 1202 air destroy
execute if entity @a[scores={R8CSafe=1}] run setblock 921 65 1202 air destroy
execute if entity @a[scores={R8CSafe=1}] run playsound entity.wither.hurt master @a 921 64 1202 3 1.3 1
execute if entity @a[scores={R8CSafe=1}] run playsound entity.rabbit.attack master @a 921 64 1202 3 1 1
execute if entity @a[scores={R8CSafe=1}] run summon rabbit 921 64 1202 {CustomName:"{\"text\":\"Mr. Fluffy\",\"color\":\"white\"}",RabbitType:99,Health:300f,Attributes:[{Name:generic.maxHealth,Base:300.0}],Rotation:[0f,0f],Motion:[0.0d,0.1d,0.5d],Tags:["R8CRabbit","R8CMob"]}
execute if entity @a[scores={R8CSafe=1}] run scoreboard players set @a R8CSafe 10






# END SAFEGUARD
execute align x align y align z unless entity @a[x=909,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives add R8C_End dummy
execute align x align y align z if entity @a[x=909,y=54,z=1199,dx=24,dy=24,dz=24] run scoreboard objectives remove R8C_End
execute align x align y align z unless entity @a[x=909,y=54,z=1199,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R8C_End 1

execute if entity @e[scores={R8C_End=25..}] run clear @a
execute if entity @e[scores={R8C_End=25..}] run kill @e[tag=R8CMob]
execute if entity @e[scores={R8C_End=25..}] run kill @e[type=item,x=909,y=54,z=1199,dx=24,dy=24,dz=24]
execute if entity @e[scores={R8C_End=25..}] run scoreboard objectives remove R8CSafe
execute if entity @e[scores={R8C_End=25..}] run scoreboard objectives remove R8CDoor
execute if entity @e[scores={R8C_End=25..}] run scoreboard objectives remove Incorrect_R8C
execute if entity @e[scores={R8C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R8C_End=25..}] run scoreboard objectives remove R8C_End