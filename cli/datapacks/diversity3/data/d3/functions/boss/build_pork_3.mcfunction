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

clone -1033 105 -1014 -1026 111 -1014 -1028 65 -956 masked


execute if entity @e[scores={BossLevel=50}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1

kill @e[tag=StoneAS8]
kill @e[tag=StoneMob8]
execute if entity @e[scores={BossLevel=50}] run summon zombie -1011 73 -955 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[0.6,1.0,-3.1],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob8","Level2Mob"]}

kill @e[tag=StoneAS9]
kill @e[tag=StoneMob9]
execute if entity @e[scores={BossLevel=50}] run summon zombie -1007 73 -947 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[-1.5,1.0,-3.3],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob9","Level2Mob"]}

kill @e[tag=StoneAS10]
kill @e[tag=StoneMob10]
execute if entity @e[scores={BossLevel=50}] run summon zombie -1005 73 -947 {CustomName:"{\"text\":\"a chunk of stone\",\"color\":\"gray\"}",CustomNameVisible:false,IsBaby:true,Motion:[-2.3,1.0,-3.8],Silent:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","StoneMob","StoneMob10","Level2Mob"]}


execute if entity @e[scores={BossLevel=50}] run tellraw @a ["",{"text":"<Stone> ","color":"gray","bold":false},{"text":"I said stop!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={BossLevel=50}] run playsound entity.chicken.ambient master @a -1008 61 -951 10 0.5 1