####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 8 2017 / SEPTEMBER 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar NetherTimer
#scoreboard objectives setdisplay sidebar MetQ
#scoreboard objectives setdisplay sidebar NetherJunk

#scoreboard objectives setdisplay sidebar HelpedQ
#scoreboard objectives setdisplay sidebar HelpedMush
#scoreboard objectives setdisplay sidebar HelpedMesa
#scoreboard objectives setdisplay sidebar HelpedSnow
#scoreboard objectives setdisplay sidebar HelpedJungle
#scoreboard objectives setdisplay sidebar HelpedDesert

#scoreboard objectives setdisplay sidebar QBook
#scoreboard objectives setdisplay sidebar MushBook
#scoreboard objectives setdisplay sidebar MesaBook
#scoreboard objectives setdisplay sidebar SnowBook
#scoreboard objectives setdisplay sidebar JungleBook
#scoreboard objectives setdisplay sidebar DesertBook
#scoreboard objectives setdisplay sidebar CreatedBook


scoreboard objectives add NetherTimer dummy
tag @a remove NetherChat
execute align x align y align z run tag @a[x=-1,y=60,z=-106,dx=8,dy=2,dz=16.5] add NetherChat
execute if entity @a[tag=NetherChat] run scoreboard players add @e[tag=MainSurvivalAEC] NetherTimer 0
execute if entity @a[tag=NetherChat] run scoreboard players add @e[scores={NetherTimer=0..}] NetherTimer 1


# ADDS A NEW CONVERSATION WHEN SEEING Q
scoreboard objectives add MetQ dummy
scoreboard players add @e[scores={NetherTimer=1}] MetQ 1


# FIRST Q VISIT
execute if entity @e[scores={MetQ=1,NetherTimer=1}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:2039583}

execute if entity @e[scores={MetQ=1,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Finally you show up!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=1,NetherTimer=80}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So you're here for the Brown Wool eh? Well not so fast!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=1,NetherTimer=200}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Change of plans... My 5 friends got in a bit of trouble, but I can't leave this oak sofa. It's just too comfortable...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=1,NetherTimer=400}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So I'll make you a deal. You go out and find my 5 pals, give them a hand. Come back here with proof you helped them all, and I'll reward you with the Brown Wool.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=1,NetherTimer=400..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}

execute if entity @e[scores={MetQ=1,NetherTimer=2500}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You're still here?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=1,NetherTimer=2900}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"I don't have jokes, sorry.","color":"none","bold":false,"underlined":false}]


# IF FOUND FRIENDS FIRST
execute if entity @e[scores={MetQ=..-1,NetherTimer=1}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:2039583}

execute if entity @e[scores={MetQ=..-1,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Wow. Took you long enough. You must have already met some of my friends.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=..-1,NetherTimer=100}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So here's the deal, you help them, I help you. Solve my 5 friends' problems, Brown Wool is yours.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=..-1,NetherTimer=100}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}

scoreboard players set @e[scores={MetQ=..-1,NetherTimer=100}] NetherTimer 401
scoreboard players set @e[scores={MetQ=..-1,NetherTimer=401..}] MetQ 1


# EXTRA Q VISITS
execute if entity @e[scores={MetQ=2..,NetherTimer=10}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
 
execute if entity @e[scores={MetQ=2,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You're back! Have you helped all my friends?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=3,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So how are my friends?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=4,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You're back again! How'd you make out?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=5,NetherTimer=10}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"So did you get them all sorted out?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={MetQ=6..,NetherTimer=10}] unless entity @e[scores={HelpedQ=2..}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Forget something?","color":"none","bold":false,"underlined":false}]



# JUNK REPONSES
execute if entity @e[tag=NetherQ,nbt={HandItems:[{Count:1b}]},nbt=!{HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:brown_wool"}]}] run scoreboard objectives add NetherJunk dummy
scoreboard players add @e[tag=MainSurvivalAEC] NetherJunk 1
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{Count:1b}]}] run scoreboard objectives remove NetherJunk
execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book"}]}] run scoreboard objectives remove NetherJunk
execute if entity @e[scores={NetherJunk=15}] run function d3:survival/random_response



# QMAGNET BOOKS
scoreboard objectives add HelpedQ dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedQ 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:qmagnet}}]}] run scoreboard objectives add QBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] QBook 1
execute if entity @e[scores={QBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedQ=0,QBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Um... You just handed me my own book. Seriously? I know what it says. I wrote it.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedQ=0,QBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedQ=0,QBook=120..}] HelpedQ 1

execute if entity @e[scores={HelpedQ=1,QBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Yeah I get the joke. Got anything else?","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedQ=1,QBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{author:qmagnet}}]}] run scoreboard objectives remove QBook


# CUBEHAMSTER BOOKS
scoreboard objectives add HelpedMush dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedMush 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{MushBook:1b}}]}] run scoreboard objectives add MushBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] MushBook 1
execute if entity @e[scores={MushBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedMush=0,MushBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Welp. I have no idea what this means, but it sounds like he's happy.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedMush=0,MushBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedMush=0,MushBook=120..}] HelpedMush 1

execute if entity @e[scores={HelpedMush=1,MushBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Yeah I already know you helped Cubehamster.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedMush=1,MushBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{MushBook:1b}}]}] run scoreboard objectives remove MushBook


# RSMALEC BOOKS
scoreboard objectives add HelpedMesa dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedMesa 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{MesaBook:1b}}]}] run scoreboard objectives add MesaBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] MesaBook 1
execute if entity @e[scores={MesaBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedMesa=0,MesaBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Ugh. Of course it's Ron's birthday. We had a big surprise party planned... but you already gave him a cake. Well, at least you helped him out, I guess.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedMesa=0,MesaBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedMesa=0,MesaBook=120..}] HelpedMesa 1

execute if entity @e[scores={HelpedMesa=1,MesaBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Yes, you already notified me about Ron. Man, that surprise party ","color":"none","bold":false,"underlined":false},{"text":"was","color":"none","bold":false,"italic":true},{"text":" gonna be epic!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedMesa=1,MesaBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{MesaBook:1b}}]}] run scoreboard objectives remove MesaBook


# MOESH BOOKS
scoreboard objectives add HelpedSnow dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedSnow 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{SnowBook:1b}}]}] run scoreboard objectives add SnowBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] SnowBook 1
execute if entity @e[scores={SnowBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedSnow=0,SnowBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Well. Looks like Moesh will finally stop crying over his dead plant. Thanks. It was getting a bit annoying.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedSnow=0,SnowBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedSnow=0,SnowBook=120..}] HelpedSnow 1

execute if entity @e[scores={HelpedSnow=1,SnowBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You already proved to me you helped Moesh out.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedSnow=1,SnowBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{SnowBook:1b}}]}] run scoreboard objectives remove SnowBook


# CDF BOOKS
scoreboard objectives add HelpedJungle dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedJungle 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{JungleBook:1b}}]}] run scoreboard objectives add JungleBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] JungleBook 1
execute if entity @e[scores={JungleBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedJungle=0,JungleBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Ha! What a guy! CDF thinks he's '","color":"none","bold":false,"underlined":false},{"text":"the Brad Pitt of Map Making","color":"none","bold":false,"underlined":false,"italic":true},{"text":"™' you know.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedJungle=0,JungleBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedJungle=0,JungleBook=120..}] HelpedJungle 1

execute if entity @e[scores={HelpedJungle=1,JungleBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"I'm already aware you helped Brad Pitt... er I mean CDF.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedJungle=1,JungleBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{JungleBook:1b}}]}] run scoreboard objectives remove JungleBook


# JESPER BOOKS
scoreboard objectives add HelpedDesert dummy
scoreboard players add @e[tag=MainSurvivalAEC] HelpedDesert 0

execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{DesertBook:1b}}]}] run scoreboard objectives add DesertBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] DesertBook 1
execute if entity @e[scores={DesertBook=1}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:2039583}
execute if entity @e[scores={HelpedDesert=0,DesertBook=60}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Oh Jesper! I told him like 20 times, we don't have a beach island in the Survival Branch. Thanks for helping him though.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedDesert=0,DesertBook=120..}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:1973790}
scoreboard players set @e[scores={HelpedDesert=0,DesertBook=120..}] HelpedDesert 1

execute if entity @e[scores={HelpedDesert=1,DesertBook=25}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You've already given me a letter from Jesper.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={HelpedDesert=1,DesertBook=25..}] run data merge entity @e[tag=NetherQ,limit=1] {DisabledSlots:1973790}
execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book",tag:{DesertBook:1b}}]}] run scoreboard objectives remove DesertBook


# PLAYER CREATED BOOKS
execute if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book"}]},nbt=!{HandItems:[{id:"minecraft:written_book",tag:{RealBook:1b}}]}] run scoreboard objectives add CreatedBook dummy
scoreboard players add @e[tag=MainSurvivalAEC] CreatedBook 1

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:Cubehamster}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Are you kidding me?! Forging a note from one of my friends?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:rsmalec}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Yeah nice try. I think I know my own friend Ron's actual handwriting.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:Moesh}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"One look at you and I could tell you would try to pull this over me. Not buying it \"Moesh\"...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:CDFDMAN}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Is this your handwriting? Are you an imposter? You can't fool me. You are nothing like Brad Pitt!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt={HandItems:[{id:"minecraft:written_book",tag:{author:Jespertheend}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"I don't know where you got this but this must be from some other \"Jesper the End\"...","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={CreatedBook=25}] if entity @e[tag=NetherQ,nbt=!{HandItems:[{tag:{author:qmagnet}}]},nbt=!{HandItems:[{tag:{author:Cubehamster}}]},nbt=!{HandItems:[{tag:{author:rsmalec}}]},nbt=!{HandItems:[{tag:{author:Moesh}}]},nbt=!{HandItems:[{tag:{author:CDFDMAN}}]},nbt=!{HandItems:[{tag:{author:Jespertheend}}]}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Is this yours? Do you wanna be my friend or something?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=NetherQ,nbt=!{HandItems:[{id:"minecraft:written_book"}]}] run scoreboard objectives remove CreatedBook



# TO WIN
scoreboard players set @e[scores={HelpedMush=1,HelpedMesa=1,HelpedSnow=1,HelpedJungle=1,HelpedDesert=1,HelpedQ=0..1}] MetQ 100
scoreboard players set @e[scores={HelpedMush=1,HelpedMesa=1,HelpedSnow=1,HelpedJungle=1,HelpedDesert=1,HelpedQ=0..1}] NetherTimer 100
scoreboard players set @e[scores={HelpedMush=1,HelpedMesa=1,HelpedSnow=1,HelpedJungle=1,HelpedDesert=1,HelpedQ=0..1}] HelpedQ 2

execute if entity @e[scores={HelpedQ=2,NetherTimer=101}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{},{}],DisabledSlots:2039583}

execute if entity @e[scores={HelpedQ=2,NetherTimer=401}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Did you need something else?","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HelpedQ=2,NetherTimer=500}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Oh right! The Brown Wool! Totally forgot.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HelpedQ=2,NetherTimer=575}] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Okay a deal's a deal. Here you go.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={HelpedQ=2,NetherTimer=650}] at @e[tag=NetherQ] run playsound block.wool.step master @a ~ ~ ~ 1 1.3 0
scoreboard players set @e[scores={HelpedQ=2,NetherTimer=650..}] HelpedQ 3

execute if entity @e[scores={HelpedQ=3}] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{id:"minecraft:brown_wool",Count:1b},{}],DisabledSlots:1973790}


# COMPLETE BRANCH
tag @a remove HasBrownWool
execute if entity @e[scores={HelpedQ=3}] run tag @a[nbt={Inventory:[{id:"minecraft:brown_wool"}]}] add HasBrownWool
# DOESNT WORK find alternate method-> execute if entity @e[scores={HelpedQ=3}] if entity @a[tag=HasBrownWool] run data merge entity @e[tag=NetherQ,limit=1] {HandItems:[{id:"minecraft:brown_wool",Count:1b},{}],DisabledSlots:2039583}
execute if entity @a[tag=HasBrownWool] if entity @e[scores={SpawnerBroke=0}] run advancement grant @a only d3:folder_b/mob_spawner
execute if entity @a[tag=HasBrownWool] run advancement grant @a[scores={SurvivalDeaths=0}] only d3:folder_b/survivor
execute if entity @a[tag=HasBrownWool] run clear @a
replaceitem entity @a[tag=HasBrownWool] weapon.mainhand brown_wool
execute if entity @a[tag=HasBrownWool] run setblock 33 2 14 clay
execute if entity @a[tag=HasBrownWool] run kill @e[tag=FinalRoomBlock]
#execute if entity @a[tag=HasBrownWool] run teleport @a[nbt={Dimension:-1}] 1 2 -3
execute if entity @a[tag=HasBrownWool] as @a in overworld run teleport @s 8 4 -31 0 -90