####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 11 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1015 73 1016

#scoreboard objectives setdisplay sidebar Incorrect_R1A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1007,y=54,z=1109,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R1A dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R1A 1

execute if entity @e[scores={Incorrect_R1A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R1A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R1A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R1A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R1A=1}] run title @a subtitle {"text":"Tripwires can be armed at over 15 blocks", "color":"white"}
execute if entity @e[scores={Incorrect_R1A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: These dispensers are wired 17 blocks apart. Good luck.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R1A=1}] run setblock 1019 67 1131 air
execute if entity @e[scores={Incorrect_R1A=2}] run setblock 1019 67 1131 chest[facing=north]{Items: [{Slot: 13b, id: "minecraft:paper", Count: 1b, tag: {display: {Name: "{\"text\":\"I.O.U. $1 Million\"}"}}}]}


execute at @a[tag=WrongAnswer] if block ~ ~ ~ tripwire[powered=true] unless block 1019 68 1133 redstone_block run setblock 1019 68 1133 redstone_block
execute at @a[tag=WrongAnswer] unless block ~ ~ ~ tripwire[powered=true] if block 1019 68 1133 redstone_block run setblock 1019 68 1133 smooth_sandstone

effect give @a[tag=WrongAnswer] resistance 1 255 true
kill @e[type=arrow,nbt={inGround:1b}]

fill 1018 67 1111 1020 67 1111 air replace fire


execute if entity @e[scores={Incorrect_R1A=80..}] unless block 1019 67 1131 chest[facing=north]{Items:[{Slot: 13b, id: "minecraft:paper", Count: 1b}]} run teleport @a[tag=WrongAnswer] 1000 67 1016 270 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1007,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives add R1A_End dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives remove R1A_End
execute align x align y align z unless entity @a[x=1007,y=54,z=1109,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R1A_End 1

execute if entity @e[scores={R1A_End=25..}] run clear @a
execute if entity @e[scores={R1A_End=25..}] run scoreboard objectives remove Incorrect_R1A
execute if entity @e[scores={R1A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R1A_End=25..}] run scoreboard objectives remove R1A_End