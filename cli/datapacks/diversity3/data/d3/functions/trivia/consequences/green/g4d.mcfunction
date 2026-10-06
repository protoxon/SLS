####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 29 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1036 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_G4D
#scoreboard objectives setdisplay sidebar G4DFinish

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1125,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G4D dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G4D 1

execute if entity @e[scores={Incorrect_G4D=1}] run stopsound @a
execute if entity @e[scores={Incorrect_G4D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G4D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G4D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G4D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G4D=1}] run title @a subtitle {"text":"Orange you glad you get this consequence?", "color":"white"}
execute if entity @e[scores={Incorrect_G4D=100}] run tellraw @a ["",{"text":" [X] INCORRECT: The orange disc is titled \"blocks\". Grab the disc and let's Block & Roll!","color":"red","bold":false}]

scoreboard objectives add G4DMusicDisc dummy
scoreboard players add @e[tag=MainTriviaAEC] G4DMusicDisc 1

execute if entity @e[nbt={Item:{id:"minecraft:music_disc_blocks"}}] run scoreboard objectives remove G4DMusicDisc
execute if entity @e[scores={G4DFinish=1..}] run scoreboard objectives remove G4DMusicDisc
execute if entity @a[nbt={Inventory:[{id:"minecraft:music_disc_blocks"}]}] run scoreboard objectives remove G4DMusicDisc
execute if entity @e[scores={Incorrect_G4D=120..,G4DMusicDisc=30..}] run give @p music_disc_blocks{HideFlags:16, CanPlaceOn: ["minecraft:jukebox"]}

execute if entity @e[scores={Incorrect_G4D=1}] run setblock 1137 57 1079 note_block
execute if entity @e[scores={Incorrect_G4D=1}] run setblock 1137 57 1079 jukebox
execute if entity @e[scores={Incorrect_G4D=1}] run scoreboard objectives remove G4DFinish
execute if entity @e[scores={Incorrect_G4D=1}] run kill @e[tag=JukeboxCat]

execute if block 1137 57 1079 jukebox{RecordItem: {id: "minecraft:music_disc_blocks"}} run scoreboard objectives add G4DFinish dummy
scoreboard players add @e[tag=MainTriviaAEC] G4DFinish 1

execute if entity @e[scores={G4DFinish=1}] run setblock 1137 57 1079 note_block
execute if entity @e[scores={G4DFinish=2}] run setblock 1137 57 1079 jukebox
execute if entity @e[scores={G4DFinish=1..2}] run stopsound @a
execute if entity @e[scores={G4DFinish=2}] run playsound music_disc.blocks record @a 1137 57 1079 1 1 1

execute if entity @e[scores={G4DFinish=1..}] run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_blocks"}}]

execute if entity @e[scores={G4DFinish=350}] run gamerule naturalRegeneration false
execute if entity @e[scores={G4DFinish=350}] run setblock 1137 57 1079 air
execute if entity @e[scores={G4DFinish=350}] run summon cave_spider 1137 57 1079 {NoAI:false,Silent:true,Invulnerable:true,CustomName:"{\"text\":\"a rogue jukebox\",\"color\":\"white\"}",Attributes:[{Name:"generic.attackDamage",Base:12.0}],Tags:["JukeboxCat"]}
execute at @e[tag=JukeboxCat] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:jukebox"},Tags:["FallingJukebox"],DropItem:false,Time:0,NoGravity:true}
effect give @e[tag=JukeboxCat] invisibility 1000 255 true
effect give @e[tag=JukeboxCat] speed 1000 10 true
effect give @e[tag=JukeboxCat] strength 1000 1 true



# END SAFEGUARD
execute align x align y align z unless entity @a[x=1125,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add G4D_End dummy
execute align x align y align z if entity @a[x=1125,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove G4D_End
execute align x align y align z unless entity @a[x=1125,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G4D_End 1

execute if entity @e[scores={G4D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G4D_End=25..}] run stopsound @a
execute if entity @e[scores={G4D_End=25..}] run kill @e[tag=G4DParrot]
execute if entity @e[scores={G4D_End=25..}] run kill @e[type=item,x=1125,y=54,z=1067,dx=24,dy=24,dz=24]
execute if entity @e[scores={G4D_End=25..}] run clear @a
execute if entity @e[scores={G4D_End=25..}] run scoreboard objectives remove G4DFinish
execute if entity @e[scores={G4D_End=25..}] run scoreboard objectives remove G4DMusicDisc
execute if entity @e[scores={G4D_End=25..}] run scoreboard objectives remove Incorrect_G4D
execute if entity @e[scores={G4D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G4D_End=25..}] run scoreboard objectives remove G4D_End