####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 29 2018 / DECEMBER 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#OLD -> summon firework_rocket -1025 68 -957 {FireworksItem:{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Colors:[I;16711918],FadeColors:[I;14483711]}]}}}}

execute align x align y align z run kill @e[tag=LaunchItem,x=-1026,y=67,z=-957,dx=2,dy=2,dz=2]

summon firework_rocket -1024.0 69 -957 {LifeTime:-3,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:0b,Explosions:[{Type:0b,Colors:[I;14188952]}]}}},Life:-3}

clone -1032 105 -1013 -1028 110 -1013 -1027 65 -956 masked


execute if entity @e[scores={BossLevel=55}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1

kill @e[tag=StoneAS11]
kill @e[tag=StoneMob11]
execute if entity @e[scores={BossLevel=55}] run summon zombie -1011 73 -955 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[-2.0,1.0,-3.0],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob11","Level2Mob"]}

kill @e[tag=StoneAS12]
kill @e[tag=StoneMob12]
execute if entity @e[scores={BossLevel=55}] run summon zombie -1009 73 -947 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[-1.6,1.0,-3.3],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob12","Level2Mob"]}

kill @e[tag=StoneAS13]
kill @e[tag=StoneMob13]
execute if entity @e[scores={BossLevel=55}] run summon zombie -1007 73 -947 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[-0.2,1.0,-3.2],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob13","Level2Mob"]}

kill @e[tag=StoneAS14]
kill @e[tag=StoneMob14]
execute if entity @e[scores={BossLevel=55}] run summon zombie -1005 73 -947 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[0.6,1.0,-3.1],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob14","Level2Mob"]}


execute if entity @e[scores={BossLevel=55}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I SAID STOP!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=55}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1
