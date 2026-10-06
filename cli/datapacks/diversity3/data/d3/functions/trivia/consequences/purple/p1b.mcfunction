####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018 / DECEMBER 20 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 984 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P1B
#scoreboard objectives setdisplay sidebar P1BCodeZombie

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=873,y=11,z=1017,dx=71,dy=28,dz=56] add WrongAnswer

scoreboard objectives add Incorrect_P1B dummy
execute align x align y align z if entity @a[x=873,y=11,z=1017,dx=71,dy=28,dz=56] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P1B 1

execute if entity @e[scores={Incorrect_P1B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P1B=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P1B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P1B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P1B=1}] run title @a subtitle {"text":"Diversity was not created by Jesper", "color":"white"}
execute if entity @e[scores={Incorrect_P1B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: But Jesper was part of the build team for D2. This place is his amazing mind-blowing map, the Code, released back in March 2013. See if you can figure out how to get out.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_P1B=1}] as @e[tag=P1BZombie] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_P1B=1}] as @e[tag=P1BZombie] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P1B=1}] run setblock 874 17 1051 quartz_pillar[axis=y]
execute if entity @e[scores={Incorrect_P1B=1}] run setblock 874 18 1051 cake
execute if entity @e[scores={Incorrect_P1B=1}] run setblock 874 17 1047 quartz_pillar[axis=y]
execute if entity @e[scores={Incorrect_P1B=1}] run setblock 874 18 1047 cake

execute if entity @e[scores={Incorrect_P1B=1}] run kill @e[type=item,tag=P1BItem]
execute if entity @e[scores={Incorrect_P1B=1}] run summon item 874 18 1049 {Item:{id:"minecraft:paper",Count:1b},Age:-32768,PickupDelay:32767,Tags:["P1BItem"]}

execute if entity @e[scores={Incorrect_P1B=1}] run kill @e[tag=P1BPainting]
execute if entity @e[scores={Incorrect_P1B=5}] run summon painting 924 18 1045 {Facing: 1b, Invulnerable: 1b, Motive: "minecraft:kebab", Tags:["P1BPainting"]}
execute if entity @e[scores={Incorrect_P1B=5}] run summon painting 922 18 1041 {Facing: 3b, Invulnerable: 1b, Motive: "minecraft:bomb", Tags:["P1BPainting"]}

execute align x align y align z if entity @a[x=931,y=17,z=1048,dx=9,dy=2,dz=2] run scoreboard objectives add P1BCodeZombie dummy
scoreboard players add @e[tag=MainTriviaAEC] P1BCodeZombie 1


execute if entity @e[scores={P1BCodeZombie=1}] run fill 874 17 1047 874 18 1047 air
execute if entity @e[scores={P1BCodeZombie=1}] run fill 874 17 1051 874 18 1051 air

execute if entity @e[scores={P1BCodeZombie=1}] run summon zombie 874 17 1047 {CustomName:"{\"text\":\"Jesper's Cake\",\"color\":\"white\"}",Invulnerable:true,Silent:true,NoAI:true,Rotation:[270f,0f],IsBaby:true,Tags:["P1BZombie"]}
execute if entity @e[scores={P1BCodeZombie=1}] run summon zombie 874 17 1051 {CustomName:"{\"text\":\"Jesper's Cake\",\"color\":\"white\"}",Invulnerable:true,Silent:true,NoAI:true,Rotation:[270f,0f],IsBaby:true,Tags:["P1BZombie"]}

execute if entity @e[scores={P1BCodeZombie=1..}] align x align y align z if entity @a[x=874,y=17,z=1047,dx=5,dy=1,dz=4] as @e[tag=P1BZombie] run data merge entity @s {NoAI:false}

execute at @e[tag=P1BZombie] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:quartz_pillar"},Tags:["P1BFallingBlock"],DropItem:false,Time:0,NoGravity:true}
execute at @e[tag=P1BZombie] run summon falling_block ~ ~1 ~ {BlockState:{Name:"minecraft:cake"},Tags:["P1BFallingBlock"],DropItem:false,Time:0,NoGravity:true}

effect give @e[tag=P1BZombie] invisibility 3 255 true
#effect give @e[tag=P1BZombie] speed 1 3 true
effect give @e[tag=P1BZombie] strength 3 5 true


# END SAFEGUARD
execute align x align y align z unless entity @a[x=873,y=11,z=1017,dx=71,dy=28,dz=56] run scoreboard objectives add P1B_End dummy
execute align x align y align z if entity @a[x=873,y=11,z=1017,dx=71,dy=28,dz=56] run scoreboard objectives remove P1B_End
execute align x align y align z unless entity @a[x=873,y=11,z=1017,dx=71,dy=28,dz=56] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P1B_End 1

execute if entity @e[scores={P1B_End=25..}] run clear @a
execute if entity @e[scores={P1B_End=25..}] run scoreboard objectives remove P1BCodeZombie
execute if entity @e[scores={P1B_End=25..}] run scoreboard objectives remove Incorrect_P1B
execute if entity @e[scores={P1B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P1B_End=25..}] run scoreboard objectives remove P1B_End