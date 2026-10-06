####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 971 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P3A

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=848,y=13,z=1007,dx=24,dy=242,dz=30] add WrongAnswer

scoreboard objectives add Incorrect_P3A dummy
execute align x align y align z if entity @a[x=848,y=13,z=1007,dx=24,dy=242,dz=30] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P3A 1

execute if entity @e[scores={Incorrect_P3A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P3A=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P3A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P3A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P3A=1}] run title @a subtitle {"text":"Vechs' maps aren't 'Extreme Survival'", "color":"white"}
execute if entity @e[scores={Incorrect_P3A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: But we actually found a map called \"Extreme Survival\" by Kibcob_ from September 2011. Check it out ","color":"red"},{"text":"here","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/maps/1475994-surv-extreme-survival"}},{"text":". Just not much to do here, except die I guess.","color":"red"}]


# END SAFEGUARD
execute align x align y align z unless entity @a[x=848,y=13,z=1007,dx=24,dy=242,dz=30] run scoreboard objectives add P3A_End dummy
execute align x align y align z if entity @a[x=848,y=13,z=1007,dx=24,dy=242,dz=30] run scoreboard objectives remove P3A_End
execute align x align y align z unless entity @a[x=848,y=13,z=1007,dx=24,dy=242,dz=30] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P3A_End 1

execute if entity @e[scores={P3A_End=25..}] run clear @a
execute if entity @e[scores={P3A_End=25..}] run scoreboard objectives remove Incorrect_P3A
execute if entity @e[scores={P3A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P3A_End=25..}] run scoreboard objectives remove P3A_End