####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 5 2018 / MAY 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 977 71 995

difficulty hard

#scoreboard objectives setdisplay sidebar Incorrect_P2D

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=878,y=54,z=909,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P2D dummy
execute align x align y align z if entity @a[x=878,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P2D 1

execute if entity @e[scores={Incorrect_P2D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P2D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P2D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P2D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P2D=1}] run title @a subtitle {"text":"That's not the correct parody", "color":"white"}
execute if entity @e[scores={Incorrect_P2D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: \"Hunger Games\", featured on Bajan Canadian's YouTube channel, is a parody of \"Decisions\" by Borgore. Now you'll have to win it all for your district to get out of here.","color":"red"}]

execute if entity @e[scores={Incorrect_P2D=1}] run kill @e[tag=P2DMob]
execute if entity @e[scores={Incorrect_P2D=1}] run fill 881 55 912 899 57 930 clay replace redstone_block

execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam1
team modify P2DTeam1 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam2
team modify P2DTeam2 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam3
team modify P2DTeam3 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam4
team modify P2DTeam4 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam5
team modify P2DTeam5 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam6
team modify P2DTeam6 collisionRule never
execute if entity @e[scores={Incorrect_P2D=1}] run team add P2DTeam7
team modify P2DTeam7 collisionRule never


execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 896 59 915 {VillagerData:{profession:"minecraft:none",type:"minecraft:desert",level:2},NoAI:true,Team:P2DTeam1,Tags:["P2DVillager1","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 896 59 915 {Team:P2DTeam1,Tags:["P2DVindicator1","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 899 59 921 {VillagerData:{profession:"minecraft:none",type:"minecraft:jungle",level:2},NoAI:true,Team:P2DTeam2,Tags:["P2DVillager2","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 899 59 921 {Team:P2DTeam2,Tags:["P2DVindicator2","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 896 59 927 {VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},NoAI:true,Team:P2DTeam3,Tags:["P2DVillager3","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 896 59 927 {Team:P2DTeam3,Tags:["P2DVindicator3","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 890 59 930 {VillagerData:{profession:"minecraft:none",type:"minecraft:savanna",level:2},NoAI:true,Team:P2DTeam4,Tags:["P2DVillager4","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 890 59 930 {Team:P2DTeam4,Tags:["P2DVindicator4","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 884 59 927 {VillagerData:{profession:"minecraft:none",type:"minecraft:snow",level:2},NoAI:true,Team:P2DTeam5,Tags:["P2DVillager5","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 884 59 927 {Team:P2DTeam5,Tags:["P2DVindicator5","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 881 60 921 {VillagerData:{profession:"minecraft:none",type:"minecraft:swamp",level:2},NoAI:true,Team:P2DTeam6,Tags:["P2DVillager6","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 881 60 921 {Team:P2DTeam6,Tags:["P2DVindicator6","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}

execute if entity @e[scores={Incorrect_P2D=1}] run summon villager 884 61 915 {VillagerData:{profession:"minecraft:none",type:"minecraft:taiga",level:2},NoAI:true,Team:P2DTeam7,Tags:["P2DVillager7","P2DVillager","P2DMob"]}
execute if entity @e[scores={Incorrect_P2D=1}] run summon vindicator 884 61 915 {Team:P2DTeam7,Tags:["P2DVindicator7","P2DVindicator","P2DMob"],Silent:true,CustomName:"{\"text\":\"Johnny\",\"color\":\"white\"}"}


effect give @e[tag=P2DVindicator] invisibility 5 255 true

execute as @e[tag=P2DVindicator1] at @s run teleport @e[tag=P2DVillager1] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator2] at @s run teleport @e[tag=P2DVillager2] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator3] at @s run teleport @e[tag=P2DVillager3] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator4] at @s run teleport @e[tag=P2DVillager4] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator5] at @s run teleport @e[tag=P2DVillager5] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator6] at @s run teleport @e[tag=P2DVillager6] ~ ~ ~ ~ ~
execute as @e[tag=P2DVindicator7] at @s run teleport @e[tag=P2DVillager7] ~ ~ ~ ~ ~


execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager1] run kill @e[tag=P2DVindicator1]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager2] run kill @e[tag=P2DVindicator2]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager3] run kill @e[tag=P2DVindicator3]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager4] run kill @e[tag=P2DVindicator4]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager5] run kill @e[tag=P2DVindicator5]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager6] run kill @e[tag=P2DVindicator6]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVillager7] run kill @e[tag=P2DVindicator7]

execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator1] run kill @e[tag=P2DVillager1]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator2] run kill @e[tag=P2DVillager2]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator3] run kill @e[tag=P2DVillager3]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator4] run kill @e[tag=P2DVillager4]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator5] run kill @e[tag=P2DVillager5]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator6] run kill @e[tag=P2DVillager6]
execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DVindicator7] run kill @e[tag=P2DVillager7]

execute if entity @e[scores={Incorrect_P2D=20..80}] as @e[tag=P2DMob] at @s run teleport @s ^ ^ ^ facing 890 62 921
execute if entity @e[scores={Incorrect_P2D=300}] run fill 881 55 912 899 57 930 redstone_block replace clay

execute if entity @e[scores={Incorrect_P2D=1}] run scoreboard objectives add P2DChest minecraft.custom:minecraft.open_chest
execute at @a[tag=WrongAnswer,scores={P2DChest=1}] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"booby-trapped chest\",\"color\":\"white\"}"}
scoreboard players reset @a[scores={P2DChest=1..}] P2DChest 

execute if entity @e[scores={Incorrect_P2D=80..}] unless entity @e[tag=P2DMob] run teleport @a[tag=WrongAnswer] 977 67 1000 180 0





# END SAFEGUARD
execute align x align y align z unless entity @a[x=878,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives add P2D_End dummy
execute align x align y align z if entity @a[x=878,y=54,z=909,dx=24,dy=24,dz=24] run scoreboard objectives remove P2D_End
execute align x align y align z unless entity @a[x=878,y=54,z=909,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P2D_End 1

execute if entity @e[scores={P2D_End=1..}] as @e[tag=P2DMob] run data merge entity @s {NoAI:false}
execute if entity @e[scores={P2D_End=1..}] run kill @e[tag=P2DMob]
execute if entity @e[scores={P2D_End=25..}] run clear @a
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam1
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam2
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam3
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam4
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam5
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam6
execute if entity @e[scores={P2D_End=25..}] run team remove P2DTeam7
execute if entity @e[scores={P2D_End=25..}] run scoreboard objectives remove P2DChest
execute if entity @e[scores={P2D_End=25..}] run scoreboard objectives remove Incorrect_P2D
execute if entity @e[scores={P2D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P2D_End=25..}] run scoreboard objectives remove P2D_End