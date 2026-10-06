####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018 / MARCH 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 964 72 994

#scoreboard objectives setdisplay sidebar Incorrect_P4B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=848,y=16,z=939,dx=24,dy=62,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P4B dummy
execute align x align y align z if entity @a[x=848,y=16,z=939,dx=24,dy=62,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P4B 1

execute if entity @e[scores={Incorrect_P4B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P4B=2}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P4B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P4B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P4B=1}] run title @a subtitle {"text":"Vampire Survival is a Hypixel map", "color":"white"}
execute if entity @e[scores={Incorrect_P4B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Vampire Survival is a 2012 PvP map where players kill or become the vampires. So have you got what it takes to survive this?","color":"red"}]

execute if entity @e[scores={Incorrect_P4B=1}] run fill 857 17 952 864 17 956 air
execute if entity @e[scores={Incorrect_P4B=1}] run fill 857 54 952 864 54 956 dirt
execute if entity @e[scores={Incorrect_P4B=1}] run fill 857 55 952 864 55 956 gravel replace air
execute align x align y align z if entity @a[x=857,y=56,z=952,dx=7,dy=2,dz=4] run fill 857 54 952 864 54 956 air

execute if entity @e[scores={Incorrect_P4B=1}] as @e[tag=P4BVampire] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P4B=1}] run summon zombie_pigman 870 56 947 {Anger:1000,CustomName:"{\"text\":\"Vampire\",\"color\":\"white\"}",HandItems:[{id:"minecraft:wooden_sword",Count:1b}],Health:100f,Attributes:[{Name:generic.maxHealth,Base:100.0}],Rotation:[90f,0f],Silent:true,Tags:["P4BVampire"]}
execute if entity @e[scores={Incorrect_P4B=1}] run summon zombie_pigman 850 56 944 {Anger:1000,CustomName:"{\"text\":\"Vampire\",\"color\":\"white\"}",HandItems:[{id:"minecraft:wooden_sword",Count:1b}],Health:100f,Attributes:[{Name:generic.maxHealth,Base:100.0}],Rotation:[270f,0f],Silent:true,Tags:["P4BVampire"]}

effect give @e[tag=P4BVampire] resistance 3 255 true
effect give @e[tag=P4BVampire] invisibility 3 255 true

# END SAFEGUARD
execute align x align y align z unless entity @a[x=848,y=16,z=939,dx=24,dy=62,dz=24] run scoreboard objectives add P4B_End dummy
execute align x align y align z if entity @a[x=848,y=16,z=939,dx=24,dy=62,dz=24] run scoreboard objectives remove P4B_End
execute align x align y align z unless entity @a[x=848,y=16,z=939,dx=24,dy=62,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P4B_End 1

execute if entity @e[scores={P4B_End=25..}] run clear @a
execute if entity @e[scores={P4B_End=25..}] run kill @e[tag=P4BSkeleton]
execute if entity @e[scores={P4B_End=25..}] run scoreboard objectives remove Incorrect_P4B
execute if entity @e[scores={P4B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P4B_End=25..}] run scoreboard objectives remove P4B_End