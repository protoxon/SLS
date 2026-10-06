####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 16 2018 / JULY 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1005 71 1069

#scoreboard objectives setdisplay sidebar Incorrect_R9A
#scoreboard objectives setdisplay sidebar R9AAxe
#scoreboard objectives setdisplay sidebar R9ABreakBlock
#scoreboard objectives setdisplay sidebar R9AWin

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1007,y=54,z=1229,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R9A dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R9A 1

execute if entity @e[scores={Incorrect_R9A=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R9A=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R9A=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R9A=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R9A=1}] run title @a subtitle {"text":"Resource Packs do not use .aiff files", "color":"white"}
execute if entity @e[scores={Incorrect_R9A=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Now find the chest with the music disc hiding in this pile to leave.","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R9A=1}] run setblock 1019 59 1241 air
execute if entity @e[scores={Incorrect_R9A=2}] run clone 1007 26 1229 1031 50 1253 1007 54 1229 masked

execute if entity @e[scores={Incorrect_R9A=150}] run scoreboard objectives add R9AAxe dummy
scoreboard players reset @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:iron_axe"}]}] R9AAxe
scoreboard players add @a[tag=WrongAnswer,nbt=!{Inventory:[{id:"minecraft:iron_axe"}]}] R9AAxe 1

give @a[tag=WrongAnswer,scores={R9AAxe=5..}] iron_axe{HideFlags:6,Unbreakable:true,CanDestroy:["minecraft:note_block"],display:{Name:"{\"italic\":false,\"color\":\"white\",\"text\":\"Silencer\"}",Lore:['{"text":"Kill the music...","italic":"true","color":"red"}']}}
kill @e[nbt={Item:{id:"minecraft:iron_axe"}}]


scoreboard objectives add R9ABreakBlock minecraft.mined:minecraft.note_block

execute if entity @a[scores={R9ABreakBlock=80}] run scoreboard objectives add R9AWin dummy
scoreboard players add @e[tag=MainTriviaAEC] R9AWin 1

execute if entity @e[scores={R9AWin=1}] run tellraw @a[tag=WrongAnswer] ["",{"text":" Wait a sec...","color":"red","bold":false}]
execute if entity @e[scores={R9AWin=100}] run tellraw @a[tag=WrongAnswer] ["",{"text":" I think we forgot to add the chest into this consequence.","color":"red","bold":false}]
execute if entity @e[scores={R9AWin=450}] run tellraw @a[tag=WrongAnswer] ["",{"text":" Well, this is awkward.","color":"red","bold":false}]
execute if entity @e[scores={R9AWin=600}] run tellraw @a[tag=WrongAnswer] ["",{"text":" Uh... I'll just put it in the middle.","color":"red","bold":false}]
execute if entity @e[scores={R9AWin=660}] run playsound entity.item.pickup master @a 1019 59 1241 1 1 0
execute if entity @e[scores={R9AWin=660}] run setblock 1019 59 1241 chest[facing=north]{Items: [{Slot: 13b, id: "minecraft:music_disc_11", Count: 1b, tag: {display: {Name: "{\"text\":\"Broken Record\",\"italic\":\"false\"}"}}}]}
execute if entity @e[scores={R9AWin=680}] run tellraw @a[tag=WrongAnswer] ["",{"text":" Carry on.","color":"red","bold":false}]


execute if entity @a[tag=WrongAnswer,nbt={Inventory:[{id:"minecraft:music_disc_11"}]}] run teleport @a[tag=WrongAnswer] 1000 67 1069 270 0


# END SAFEGUARD
execute align x align y align z unless entity @a[x=1007,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives add R9A_End dummy
execute align x align y align z if entity @a[x=1007,y=54,z=1229,dx=24,dy=24,dz=24] run scoreboard objectives remove R9A_End
execute align x align y align z unless entity @a[x=1007,y=54,z=1229,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R9A_End 1

execute if entity @e[scores={R9A_End=25..}] run clear @a
execute if entity @e[scores={R9A_End=25..}] run scoreboard objectives remove R9AWin
execute if entity @e[scores={R9A_End=25..}] run scoreboard objectives remove R9ABreakBlock
execute if entity @e[scores={R9A_End=25..}] run scoreboard objectives remove R9AAxe
execute if entity @e[scores={R9A_End=25..}] run scoreboard objectives remove Incorrect_R9A
execute if entity @e[scores={R9A_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R9A_End=25..}] run scoreboard objectives remove R9A_End