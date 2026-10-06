####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# DECEMBER 2 2018 / DECEMBER 7 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#OLD -> summon firework_rocket -1025 68 -957.0 {FireworksItem:{id:fireworks,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Colors:[I;16711918],FadeColors:[I;14483711]}]}}}}

summon firework_rocket -1024.0 70.0 -957 {LifeTime:-3,FireworksItem:{id:"minecraft:firework_rocket",Count:1b,tag:{Fireworks:{Flight:0b,Explosions:[{Type:0b,Colors:[I;15790320]}]}}},Life:-3}

kill @e[tag=LaunchItem]

playsound entity.generic.swim master @a -1025 68 -957 10 0.5 0
clone -1005 81 -1011 -998 88 -1011 -1028 65 -956 masked

scoreboard players set @e[scores={BossLevel=130}] BossTimer 0
scoreboard players set @e[scores={BossLevel=130}] BossLevel 135