####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 30 2018 / JUNE 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 71 985

#scoreboard objectives setdisplay sidebar Incorrect_P10D
#scoreboard objectives setdisplay sidebar P10DDeath
#scoreboard objectives setdisplay sidebar P10DHasWings

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=667,y=1,z=878,dx=115,dy=76,dz=55] add WrongAnswer

scoreboard objectives add Incorrect_P10D dummy
execute align x align y align z if entity @a[x=667,y=1,z=878,dx=115,dy=76,dz=55] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P10D 1

execute if entity @e[scores={Incorrect_P10D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P10D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P10D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P10D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P10D=1}] run title @a subtitle {"text":"Noobcrew didn't create Terra Swoop Force", "color":"white"}
execute if entity @e[scores={Incorrect_P10D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Terra Swoop Force was made by Noxcrew, not Noobcrew. Put on your flight wings and glide through this build taken directly out of their map.","color":"red"}]

execute if entity @e[scores={Incorrect_P10D=80}] run give @a[tag=WrongAnswer] elytra{Unbreakable:true,HideFlags:4,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"Prototype TFA-3\"}",Lore:['{"text":"Thrifty Non Custom Texture Version","italic":"true","color":"dark_purple"}']}}

scoreboard objectives add P10DHasWings dummy
scoreboard players set @e[tag=MainTriviaAEC] P10DHasWings 1
execute align x align y align z if entity @a[x=689,y=61,z=903,dx=3,dy=4,dz=3,nbt=!{Inventory:[{Slot:102b,id:"minecraft:elytra"}]}] run scoreboard players set @e[tag=MainTriviaAEC] P10DHasWings 0
execute if entity @e[scores={P10DHasWings=0}] run fill 693 61 903 693 64 906 barrier replace air
execute if entity @e[scores={P10DHasWings=1}] run fill 693 61 903 693 64 906 air replace barrier

execute align x align y align z run clear @a[x=690,y=54,z=901,dx=15,dy=1,dz=7]
execute align x align y align z run gamemode adventure @a[x=690,y=54,z=901,dx=15,dy=1,dz=7,gamemode=!adventure]

execute if entity @e[scores={Incorrect_P10D=1}] run scoreboard objectives add P10DDeath deathCount
scoreboard players reset @a[tag=!WrongAnswer] P10DDeath
execute if entity @a[scores={P10DDeath=1}] run tellraw @a[tag=WrongAnswer,scores={P10DDeath=1}] ["",{"text":" Er... Sorry about that. Unfortunately, we haven't figured out Noxcrew's flight mechanics quite yet. You're better off downloading ","color":"red"},{"text":"their map","color":"dark_purple","bold":false,"underlined":true,"clickEvent":{"action":"open_url","value":"https://noxcrew.com/creations/terraswoopforce"}},{"text":" instead.","color":"red"}]
scoreboard players reset @a[scores={P10DDeath=1..}] P10DDeath



# END SAFEGUARD
execute align x align y align z unless entity @a[x=667,y=1,z=878,dx=115,dy=76,dz=55] run scoreboard objectives add P10D_End dummy
execute align x align y align z if entity @a[x=667,y=1,z=878,dx=115,dy=76,dz=55] run scoreboard objectives remove P10D_End
execute align x align y align z unless entity @a[x=667,y=1,z=878,dx=115,dy=76,dz=55] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P10D_End 1

execute if entity @e[scores={P10D_End=25..}] run clear @a
execute if entity @e[scores={P10D_End=25..}] run scoreboard objectives remove P10DDeath
execute if entity @e[scores={P10D_End=25..}] run scoreboard objectives remove P10DHasWings
execute if entity @e[scores={P10D_End=25..}] run scoreboard objectives remove Incorrect_P10D
execute if entity @e[scores={P10D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P10D_End=25..}] run scoreboard objectives remove P10D_End