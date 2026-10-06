####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 12 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 73 1023

#scoreboard objectives setdisplay sidebar Incorrect_R2A
#scoreboard objectives setdisplay sidebar R2AWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=969,y=54,z=1109,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R2A dummy
execute align x align y align z if entity @a[x=969,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R2A 1

execute if entity @e[scores={Incorrect_R2A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R2A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R2A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R2A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R2A=1}] run title @a subtitle {"text":"That was not an AND gate", "color":"white"}
execute if entity @e[scores={Incorrect_R2A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: An AND gate has multiple inputs that are all required to be powered to turn on the output. So just turn on that dispenser.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R2A=1}] run setblock 981 55 1129 air

execute if entity @e[scores={Incorrect_R2A=1}] run fill 974 55 1114 988 61 1114 air
execute if entity @e[scores={Incorrect_R2A=2}] run fill 974 55 1114 988 55 1114 lever[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R2A=2}] run fill 974 58 1114 988 58 1114 lever[face=wall,facing=north,powered=false]
execute if entity @e[scores={Incorrect_R2A=2}] run fill 974 61 1114 988 61 1114 lever[face=wall,facing=north,powered=false]


execute if entity @e[scores={Incorrect_R2A=3}] run fill 974 55 1121 988 61 1121 air
execute if entity @e[scores={Incorrect_R2A=4}] run fill 974 55 1121 988 55 1121 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R2A=4}] run fill 974 58 1121 988 58 1121 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={Incorrect_R2A=4}] run fill 974 61 1121 988 61 1121 lever[face=wall,facing=south,powered=false]

execute if entity @e[scores={Incorrect_R2A=5}] run setblock 981 55 1121 redstone_wall_torch[facing=south,lit=false]
execute if entity @e[scores={Incorrect_R2A=5}] run setblock 981 55 1129 dispenser[facing=up]{Items: [{Slot: 4b, id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 1b, Explosions: [{Type: 0b, Trail: 1b, Colors: [I; 11743532], Flicker: 1b}]}}}], Lock: "R2A"}

execute if entity @e[type=firework_rocket] run scoreboard objectives add R2AWin dummy
scoreboard players add @e[tag=MainTriviaAEC] R2AWin 1

execute if entity @e[scores={R2AWin=100..}] run teleport @a[tag=WrongAnswer] 1000 67 1023 90 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=969,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives add R2A_End dummy
execute align x align y align z if entity @a[x=969,y=54,z=1109,dx=24,dy=24,dz=24] run scoreboard objectives remove R2A_End
execute align x align y align z unless entity @a[x=969,y=54,z=1109,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R2A_End 1

execute if entity @e[scores={R2A_End=25..}] run clear @a
execute if entity @e[scores={R2A_End=25..}] run scoreboard objectives remove R2AWin
execute if entity @e[scores={R2A_End=25..}] run scoreboard objectives remove Incorrect_R2A
execute if entity @e[scores={R2A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R2A_End=25..}] run scoreboard objectives remove R2A_End