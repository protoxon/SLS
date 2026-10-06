####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 2 2018 / JULY 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1055 69 986

#scoreboard objectives setdisplay sidebar Incorrect_G7C
#scoreboard objectives setdisplay sidebar G7CWalk
#scoreboard objectives setdisplay sidebar G7CSprint
#scoreboard objectives setdisplay sidebar G7CJump
#scoreboard objectives setdisplay sidebar G7CHalt
#scoreboard objectives setdisplay sidebar G7CBookCheck


tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1185,y=54,z=939,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G7C dummy
execute align x align y align z if entity @a[x=1185,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G7C 1

execute if entity @e[scores={Incorrect_G7C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G7C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G7C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G7C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G7C=1}] run title @a subtitle {"text":"8 is not the correct amount", "color":"white"}
execute if entity @e[scores={Incorrect_G7C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: You better pick up the 8 books you tossed around this place. This librarian doesn't seem too happy.","color":"red","bold":false}]


execute if entity @e[scores={Incorrect_G7C=1}] as @e[tag=G7CLibrarian] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G7C=1}] run summon villager 1206 56 944 {Silent:true,Invulnerable:true,Rotation:[90f,0f],Tags:["G7CLibrarian"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:desert",level:6},Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Offers:{}}

execute if entity @e[scores={Incorrect_G7C=1}] run kill @e[tag=G7CASBook]

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1197.7 55.20 961.7 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Simburbia\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Jig R. Bov","italic":"true","color":"green"}']},G7CBook1:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook1"],Invulnerable:true,DisabledSlots:1973790,Rotation:[90f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1205.5 55.20 961.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Minedelbrot\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: A. Brightmoore","italic":"true","color":"green"}']},G7CBook2:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook2"],Invulnerable:true,DisabledSlots:1973790,Rotation:[150f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1197.2 55.71 944.2 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Untold Stories\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Ren Derexar","italic":"true","color":"green"}']},G7CBook3:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook3"],Invulnerable:true,DisabledSlots:1973790,Rotation:[0f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1188.5 55.26 959.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Hero's Quest\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Cole de Fusion","italic":"true","color":"green"}']},G7CBook4:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook4"],Invulnerable:true,DisabledSlots:1973790,Rotation:[210f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1190.5 55.26 945.3 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"The Curse of Starry Isle\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Adam D. Jayem","italic":"true","color":"green"}']},G7CBook5:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook5"],Invulnerable:true,DisabledSlots:1973790,Rotation:[60f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1198.5 55.20 952.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook6"],Invulnerable:true,DisabledSlots:1973790,Rotation:[10f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1207.5 56.20 954.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook7"],Invulnerable:true,DisabledSlots:1973790,Rotation:[200f,0f]}

execute if entity @e[scores={Incorrect_G7C=1}] run summon armor_stand 1187.5 55.20 943.5 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:book",Count:1b,tag:{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}}],Pose:{RightArm:[180f,270f,180f]},Tags:["G7CASBook","G7CASBook8"],Invulnerable:true,DisabledSlots:1973790,Rotation:[200f,0f]}


execute if entity @e[scores={Incorrect_G7C=100}] run scoreboard objectives add G7CWalk minecraft.custom:minecraft.walk_one_cm
execute if entity @e[scores={Incorrect_G7C=100}] run scoreboard objectives add G7CSprint minecraft.custom:minecraft.sprint_one_cm
execute if entity @e[scores={Incorrect_G7C=100}] run scoreboard objectives add G7CJump minecraft.custom:minecraft.jump
execute if entity @e[scores={Incorrect_G7C=100}] run scoreboard objectives add G7CHalt dummy

scoreboard players add @a[scores={G7CWalk=350..}] G7CHalt 1
scoreboard players add @a[scores={G7CSprint=350..}] G7CHalt 1
scoreboard players add @a[scores={G7CJump=1..},nbt={OnGround:1b}] G7CHalt 1
scoreboard players add @a[scores={G7CHalt=1..}] G7CHalt 1

execute at @a[tag=WrongAnswer,scores={G7CHalt=2}] run summon area_effect_cloud ~ ~ ~ {Tags:["G7CAEC"],Duration:150}
execute at @e[tag=G7CAEC] run teleport @a[tag=WrongAnswer,scores={G7CHalt=1..},distance=..2] ~ ~ ~

execute as @a[scores={G7CHalt=1..40}] at @s run teleport @s[tag=WrongAnswer] ^ ^ ^ facing 1206 56 944

tellraw @a[scores={G7CHalt=2,G7CJump=1..}] ["",{"text":" <Unreasonable Librarian> Silence! There's no jumping in the library!","color":"white","bold":false}]
tellraw @a[scores={G7CHalt=2,G7CSprint=1..}] ["",{"text":" <Unreasonable Librarian> Hey! No running in the library!","color":"white","bold":false}]
tellraw @a[scores={G7CHalt=2,G7CWalk=1..}] ["",{"text":" <Unreasonable Librarian> Quiet! Your shoes are extremely loud! Slow down!","color":"white","bold":false}]


scoreboard players reset @a[scores={G7CHalt=150..}] G7CSprint
scoreboard players reset @a[scores={G7CHalt=150..}] G7CWalk
scoreboard players reset @a[scores={G7CHalt=150..}] G7CJump
scoreboard players reset @a[scores={G7CHalt=150..}] G7CHalt

execute unless entity @a[scores={G7CHalt=1..}] as @e[tag=G7CLibrarian] at @s run teleport @s ^ ^ ^ facing entity @p eyes
execute as @e[tag=G7CLibrarian] at @s run teleport @s ^ ^ ^ facing entity @p[scores={G7CHalt=1..}] eyes


#execute as @e[tag=G7CASBook] run data merge entity @s {Invisible:false}
execute as @e[tag=G7CASBook,nbt=!{HandItems:[{id:"minecraft:book"}]}] run kill @s

execute if entity @e[scores={Incorrect_G7C=1}] run scoreboard objectives remove G7CBookCheck
scoreboard objectives add G7CBookCheck dummy
scoreboard players add @e[tag=MainTriviaAEC] G7CBookCheck 0



#Simburbia by Jig R. Bov
#Minedelbrot - A. Brightmoore
#Untold Stories by Ren Derexar
#Hero's Quest by Cole de Fusion
#Curse of Starry Isle - Adam D. Jayem
#Complex by Q. Magnet
#Present Factory by Q. T. Pie
#Evergreen Island by K. Wa


# MOVES BOOK IF GETS STUCK BEHIND DESK
execute align x align y align z as @e[type=item,x=1205,y=56,z=942,dx=2,dy=1,dz=4] at @s run teleport @s ^ ^ ^1 facing entity @p[tag=WrongAnswer]



# WRONG BOOK ORDER
execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook1:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> No! Place them in the drop box in ALPHABETICAL ORDER BY AUTHOR!","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook2:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> Try again! That's not alphabetical order by Author LAST NAME!","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook3:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> No! That's not the proper order. Put them in the order of AUTHOR'S LAST NAME!","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=3}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook4:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> Wrong! Put them in the CORRECT ORDER! Alphabetical by author SURNAME.","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=4}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> Put them in the CORRECT ORDER! Author's surname. Alphabetically.","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=5}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> No! Put them in author's last name, ALPHABETICALLY!","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=6}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book"}]} unless block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> PUT THEM IN ALPHABETICALLY BY AUTHOR SURNAME!","color":"white","bold":false}]



execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook2:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Minedelbrot\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: A. Brightmoore","italic":"true","color":"green"}']},G7CBook2:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook3:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Untold Stories\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Ren Derexar","italic":"true","color":"green"}']},G7CBook3:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook4:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Hero's Quest\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Cole de Fusion","italic":"true","color":"green"}']},G7CBook4:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Curse of Starry Isle\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Adam D. Jayem","italic":"true","color":"green"}']},G7CBook5:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=0}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook3:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Untold Stories\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Ren Derexar","italic":"true","color":"green"}']},G7CBook3:1b}

execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook4:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Hero's Quest\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Cole de Fusion","italic":"true","color":"green"}']},G7CBook4:1b}

execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Curse of Starry Isle\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Adam D. Jayem","italic":"true","color":"green"}']},G7CBook5:1b}

execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}

execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=1}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook4:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Hero's Quest\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Cole de Fusion","italic":"true","color":"green"}']},G7CBook4:1b}

execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Curse of Starry Isle\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Adam D. Jayem","italic":"true","color":"green"}']},G7CBook5:1b}

execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}

execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=2}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=3}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Curse of Starry Isle\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Adam D. Jayem","italic":"true","color":"green"}']},G7CBook5:1b}

execute if entity @e[scores={G7CBookCheck=3}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}

execute if entity @e[scores={G7CBookCheck=3}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=3}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=4}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Complex\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. Magnet","italic":"true","color":"green"}']},G7CBook6:1b}

execute if entity @e[scores={G7CBookCheck=4}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=4}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=5}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"The Present Factory\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: Q. T. Pie","italic":"true","color":"green"}']},G7CBook7:1b}

execute if entity @e[scores={G7CBookCheck=5}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if entity @e[scores={G7CBookCheck=6}] if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run give @p[tag=WrongAnswer,x=1206,y=56,z=944] book{display:{Name:"{\"text\":\"Evergreen Island\",\"italic\":\"false\",\"bold\":\"true\"}",Lore:['{"text":"Author: K. Wa","italic":"true","color":"green"}']},G7CBook8:1b}


execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook1:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=0}] G7CBookCheck 1
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook2:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=1}] G7CBookCheck 2
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook3:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=2}] G7CBookCheck 3
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook4:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=3}] G7CBookCheck 4
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook5:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=4}] G7CBookCheck 5
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook6:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=5}] G7CBookCheck 6
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook7:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=6}] G7CBookCheck 7
execute if block 1204 56 942 hopper{Items:[{id:"minecraft:book",tag:{G7CBook8:1b}}]} run scoreboard players set @e[scores={G7CBookCheck=7}] G7CBookCheck 8

execute if block 1204 56 942 hopper{Items:[{Slot:0b,id:"minecraft:book"}]} run replaceitem block 1204 56 942 container.0 air
execute if block 1204 56 942 hopper{Items:[{Slot:1b,id:"minecraft:book"}]} run replaceitem block 1204 56 942 container.1 air
execute if block 1204 56 942 hopper{Items:[{Slot:2b,id:"minecraft:book"}]} run replaceitem block 1204 56 942 container.2 air
execute if block 1204 56 942 hopper{Items:[{Slot:3b,id:"minecraft:book"}]} run replaceitem block 1204 56 942 container.3 air
execute if block 1204 56 942 hopper{Items:[{Slot:4b,id:"minecraft:book"}]} run replaceitem block 1204 56 942 container.4 air


scoreboard players add @e[scores={G7CBookCheck=8..}] G7CBookCheck 1
execute if entity @e[scores={G7CBookCheck=50}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Unreasonable Librarian> Finally. Now get out!","color":"white","bold":false}]
execute if entity @e[scores={G7CBookCheck=100}] run teleport @a[tag=WrongAnswer] 1055 67 1000 180 0



#{Items:[{id:"minecraft:book",tag:{G7CBook3:1b}}}]}
#{Items:[{id:"minecraft:book"}]}

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1185,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives add G7C_End dummy
execute align x align y align z if entity @a[x=1185,y=54,z=939,dx=24,dy=24,dz=24] run scoreboard objectives remove G7C_End
execute align x align y align z unless entity @a[x=1185,y=54,z=939,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] G7C_End 1

execute if entity @e[scores={G7C_End=25..}] run kill @e[tag=G7CASBook]
execute if entity @e[scores={G7C_End=25..}] run kill @e[tag=G7CLibrarian]
execute if entity @e[scores={G7C_End=25..}] run clear @a
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7CWalk
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7CSprint
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7CJump
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7CHalt
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7CBookCheck
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove Incorrect_G7C
execute if entity @e[scores={G7C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G7C_End=25..}] run scoreboard objectives remove G7C_End