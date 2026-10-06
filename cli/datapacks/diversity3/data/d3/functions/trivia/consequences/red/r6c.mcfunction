####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 14 2018 / JULY 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 995 71 1049

#scoreboard objectives setdisplay sidebar Incorrect_R6C
#scoreboard objectives setdisplay sidebar R6CWait
#scoreboard objectives setdisplay sidebar R6CMoveLine

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=939,y=54,z=1169,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_R6C dummy
execute align x align y align z if entity @a[x=939,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R6C 1

execute if entity @e[scores={Incorrect_R6C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R6C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R6C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R6C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R6C=1}] run title @a subtitle {"text":"N.B.T. is not Nested Byte Tag", "color":"white"}
execute if entity @e[scores={Incorrect_R6C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: It doesn't stand for National Bank Transaction either. But it looks like you might be here for a while...","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R6C=1}] run scoreboard objectives remove R6CWait
execute if entity @e[scores={Incorrect_R6C=1}] run scoreboard objectives remove R6CMoveLine

execute if entity @e[scores={Incorrect_R6C=1}] as @e[tag=R6CVillager] run data merge entity @s {NoAI:false}
execute if entity @e[scores={Incorrect_R6C=1}] as @e[tag=R6CVillager] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_R6C=1}] run fill 951 56 1176 951 57 1176 barrier
execute if entity @e[scores={Incorrect_R6C=1}] run fill 951 56 1184 951 57 1184 barrier

execute if entity @e[scores={Incorrect_R6C=1}] run setblock 952 57 1183 oak_wall_sign[facing=north]{Text1: "{\"text\":\"Please wait for\"}", Text2: "{\"text\":\"next available\"}", Text3: "{\"text\":\"Customer Service\"}", Text4: "{\"text\":\"Representative\"}",}

#VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:taiga",level:6},

execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 954 56.3 1189 {Invulnerable:true,Rotation:[180f,5f],VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains",level:6},Silent:true,NoAI:true,Offers:{},Tags:["R6CTeller1","R6CTeller","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 948 56.3 1189 {Invulnerable:true,Rotation:[180f,5f],VillagerData:{profession:"minecraft:librarian",type:"minecraft:taiga",level:6},Silent:true,NoAI:true,Offers:{},Tags:["R6CTeller2","R6CTeller","R6CVillager"]}


execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CCustomer] add R6CCustomer1 
execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CCustomer] add R6CCustomer2 

execute as @e[tag=R6CTeller1] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R6CCustomer,tag=!R6CCustomer2,tag=!R6CCustomer1Leave1,tag=!R6CCustomer1Leave2,limit=1,sort=nearest]
execute as @e[tag=R6CTeller2] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R6CCustomer,tag=!R6CCustomer1,tag=!R6CCustomer2Leave1,tag=!R6CCustomer2Leave2,limit=1,sort=nearest]



execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 954 56 1186 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:none",type:"minecraft:desert",level:6},Silent:true,NoAI:true,Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 948 56 1186 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:none",type:"minecraft:jungle",level:6},Silent:true,NoAI:true,Offers:{},Tags:["R6CCustomer","R6CVillager"]}

#VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:taiga",level:6},


# CUSTOMER LINE
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 951 56 1183 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:armorer",type:"minecraft:plains",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 951 56 1182 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:butcher",type:"minecraft:savanna",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 950 56 1182 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:cartographer",type:"minecraft:snow",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 949 56 1182 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:cleric",type:"minecraft:swamp",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 948 56 1182 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:farmer",type:"minecraft:taiga",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 948 56 1181 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:desert",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 948 56 1180 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:fletcher",type:"minecraft:jungle",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 949 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:mason",type:"minecraft:plains",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 950 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:leatherworker",type:"minecraft:savanna",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 951 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:mason",type:"minecraft:snow",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 952 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:nitwit",type:"minecraft:swamp",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 953 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:shepherd",type:"minecraft:jungle",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 954 56 1180 {Invulnerable:true,Rotation:[90f,0f],VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:savanna",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 954 56 1179 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:taiga",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 954 56 1178 {Invulnerable:true,Rotation:[0f,0f],VillagerData:{profession:"minecraft:none",type:"minecraft:taiga",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 953 56 1178 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:butcher",type:"minecraft:desert",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 952 56 1178 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:farmer",type:"minecraft:swamp",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=3}] run summon villager 951 56 1178 {Invulnerable:true,Rotation:[270f,0f],VillagerData:{profession:"minecraft:fletcher",type:"minecraft:plains",level:6},NoAI:true,Attributes:[{Name:"generic.followRange",Base:0.0},{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["R6CCustomer","R6CLastCustomer","R6CVillager"]}
execute if entity @e[scores={Incorrect_R6C=4}] as @e[tag=R6CVillager] run data merge entity @s {Silent:true}

effect give @a[tag=WrongAnswer] night_vision 12 255 true
effect clear @a[tag=!WrongAnswer] night_vision

execute at @e[tag=R6CLastCustomer] run fill ~ 56 ~ ~ 57 ~ barrier replace air
execute at @e[tag=R6CLastCustomer] run fill ~-1 56 ~ ~-1 57 ~ air replace barrier
execute at @e[tag=R6CLastCustomer] run fill ~1 56 ~ ~1 57 ~ air replace barrier
execute at @e[tag=R6CLastCustomer] run fill ~ 56 ~-1 ~ 57 ~-1 air replace barrier
execute at @e[tag=R6CLastCustomer] run fill ~ 56 ~1 ~ 57 ~1 air replace barrier


scoreboard objectives add R6CWait dummy
scoreboard players add @e[tag=MainTriviaAEC] R6CWait 0
execute unless entity @e[scores={R6CMoveLine=0..}] run scoreboard players add @e[tag=MainTriviaAEC] R6CWait 1



execute if entity @e[scores={R6CWait=200}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=400}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=450}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=550}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=555}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=575}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=577}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=580}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=582}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=585}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=590}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=592}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=594}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=596}] run scoreboard objectives add R6CMoveLine dummy

execute if entity @e[scores={R6CWait=600}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=605}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=607}] run scoreboard objectives add R6CMoveLine dummy
execute if entity @e[scores={R6CWait=609}] run scoreboard objectives add R6CMoveLine dummy


scoreboard players add @e[tag=MainTriviaAEC] R6CMoveLine 1
execute if entity @e[scores={R6CMoveLine=220..}] run scoreboard objectives remove R6CMoveLine



# TELLER SPEAK
execute if entity @e[scores={R6CWait=200,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next customer please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=200,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=400,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=400,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=450,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Come forward please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=450,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=550,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=550,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=555,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Hello.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=555,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=575,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> I can help the next customer.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=575,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=577,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> I can help the next customer.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=577,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=580,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=580,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=582,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=582,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=585,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Hello.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=585,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=590,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> May I help the next customer?","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=590,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=592,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> I can help who is next.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=592,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=594,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Hi.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=595,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=596,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next customer, come forward please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=596,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=600,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Come on. I can take you, sir.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=600,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=605,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=605,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=607,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> Next customer please.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=607,R6CMoveLine=20}] at @e[tag=R6CTeller2] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0
execute if entity @e[scores={R6CWait=609,R6CMoveLine=20}] run tellraw @a[tag=WrongAnswer] ["",{"text":" <Bank Teller> I can help who is next.","color":"white","bold":false}]
execute if entity @e[scores={R6CWait=609,R6CMoveLine=20}] at @e[tag=R6CTeller1] run playsound entity.villager.ambient master @a ~ ~ ~ 1 1 0

fill 951 56 1184 951 57 1184 barrier


execute if entity @e[scores={R6CWait=200,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=400,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=450,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=550,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=555,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=575,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=577,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=580,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=582,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=585,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=590,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=592,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=594,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=596,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=600,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1
execute if entity @e[scores={R6CWait=605,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=607,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=948,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Leave1
execute if entity @e[scores={R6CWait=609,R6CMoveLine=10}] run execute align x align y align z run tag @e[x=954,y=56,z=1186,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Leave1



# NEXT CUSTOMER
execute if entity @e[scores={R6CWait=200}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=400}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=450}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=550}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=555}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=575}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=577}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=580}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=582}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=585}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=590}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=592}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=594}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=596}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=600}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1
execute if entity @e[scores={R6CWait=605}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=607}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer2Enter1
execute if entity @e[scores={R6CWait=609}] run execute align x align y align z run tag @e[x=951,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CVillager] add R6CCustomer1Enter1





execute align x align y align z run tag @e[x=951,y=56,z=1185.7,dx=0,dy=1,dz=0,tag=R6CCustomer1Enter1] add R6CCustomer1Enter2
execute align x align y align z run tag @e[x=951,y=56,z=1185.7,dx=0,dy=1,dz=0,tag=R6CCustomer1Enter1] remove R6CCustomer1Enter1
execute align x align y align z run tag @e[x=954.5,y=56,z=1186.7,dx=0,dy=1,dz=0,tag=R6CCustomer1Enter2] remove R6CCustomer1Enter2

execute as @e[tag=R6CCustomer1Enter1] at @s run teleport @s ^ ^ ^0.15 facing 951 56 1185.7
execute as @e[tag=R6CCustomer1Enter2] at @s run teleport @s ^ ^ ^0.15 facing 954.5 56 1186.7
execute as @e[tag=R6CVillager,tag=!R6CCustomer1Enter2,tag=!R6CCustomer1Leave1,x=954,y=56,z=1186,dx=0,dy=1,dz=0] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R6CTeller1,limit=1,sort=nearest]

execute align x align y align z run tag @e[x=951,y=56,z=1185.7,dx=0,dy=1,dz=0,tag=R6CCustomer2Enter1] add R6CCustomer2Enter2
execute align x align y align z run tag @e[x=951,y=56,z=1185.7,dx=0,dy=1,dz=0,tag=R6CCustomer2Enter1] remove R6CCustomer2Enter1
execute align x align y align z run tag @e[x=947.5,y=56,z=1186.7,dx=0,dy=1,dz=0,tag=R6CCustomer2Enter2] remove R6CCustomer2Enter2

execute as @e[tag=R6CCustomer2Enter1] at @s run teleport @s ^ ^ ^0.15 facing 951 56 1185.7
execute as @e[tag=R6CCustomer2Enter2] at @s run teleport @s ^ ^ ^0.15 facing 947.5 56 1186.7
execute as @e[tag=R6CVillager,tag=!R6CCustomer2Enter2,tag=!R6CCustomer2Leave1,x=948,y=56,z=1186,dx=0,dy=1,dz=0] at @s run teleport @s ^ ^ ^ facing entity @e[tag=R6CTeller2,limit=1,sort=nearest]



# MOVE LINE UP
execute if entity @e[scores={R6CMoveLine=40..45}] as @e[tag=R6CCustomer,x=951,y=56,z=1183,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 0 0
execute if entity @e[scores={R6CMoveLine=50..55}] as @e[tag=R6CCustomer,x=951,y=56,z=1182,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 0 0
execute if entity @e[scores={R6CMoveLine=60..65}] as @e[tag=R6CCustomer,x=950,y=56,z=1182,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 0 0
execute if entity @e[scores={R6CMoveLine=70..75}] as @e[tag=R6CCustomer,x=949,y=56,z=1182,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 270 0
execute if entity @e[scores={R6CMoveLine=80..85}] as @e[tag=R6CCustomer,x=948,y=56,z=1182,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 270 0
execute if entity @e[scores={R6CMoveLine=90..95}] as @e[tag=R6CCustomer,x=948,y=56,z=1181,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 270 0
execute if entity @e[scores={R6CMoveLine=100..105}] as @e[tag=R6CCustomer,x=948,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 0 0
execute if entity @e[scores={R6CMoveLine=110..115}] as @e[tag=R6CCustomer,x=949,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 0 0
execute if entity @e[scores={R6CMoveLine=120..125}] as @e[tag=R6CCustomer,x=950,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 90 0
execute if entity @e[scores={R6CMoveLine=130..135}] as @e[tag=R6CCustomer,x=951,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 90 0
execute if entity @e[scores={R6CMoveLine=140..145}] as @e[tag=R6CCustomer,x=952,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 90 0
execute if entity @e[scores={R6CMoveLine=150..155}] as @e[tag=R6CCustomer,x=953,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 90 0
execute if entity @e[scores={R6CMoveLine=160..165}] as @e[tag=R6CCustomer,x=954,y=56,z=1180,dx=0,dy=1,dz=0] at @s run teleport @s ~-0.2 ~ ~ 90 0
execute if entity @e[scores={R6CMoveLine=170..175}] as @e[tag=R6CCustomer,x=954,y=56,z=1179,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 90 0
execute if entity @e[scores={R6CMoveLine=180..185}] as @e[tag=R6CCustomer,x=954,y=56,z=1178,dx=0,dy=1,dz=0] at @s run teleport @s ~ ~ ~0.2 0 0
execute if entity @e[scores={R6CMoveLine=190..195}] as @e[tag=R6CCustomer,x=953,y=56,z=1178,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 0 0
execute if entity @e[scores={R6CMoveLine=200..205}] as @e[tag=R6CCustomer,x=952,y=56,z=1178,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 270 0
execute if entity @e[scores={R6CMoveLine=210..215}] as @e[tag=R6CCustomer,x=951,y=56,z=1178,dx=0,dy=1,dz=0] at @s run teleport @s ~0.2 ~ ~ 270 0



# CUSTOMER 1 LEAVES
execute align x align y align z run tag @e[x=957,y=56,z=1183,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave1] add R6CCustomer1Leave2
execute align x align y align z run tag @e[x=957,y=56,z=1183,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave1] remove R6CCustomer1Leave1
execute align x align y align z run tag @e[x=956,y=56,z=1175,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave2] add R6CCustomer1Leave3
execute align x align y align z run tag @e[x=956,y=56,z=1175,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave2] remove R6CCustomer1Leave2
execute align x align y align z run tag @e[x=949.3,y=56,z=1175,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave3] add R6CCustomer1Leave4
execute align x align y align z run tag @e[x=949.3,y=56,z=1175,dx=0,dy=1,dz=0,tag=R6CCustomer1Leave3] remove R6CCustomer1Leave3

execute as @e[tag=R6CCustomer1Leave1] at @s run teleport @s ^ ^ ^0.15 facing 957 56 1183
execute as @e[tag=R6CCustomer1Leave2] at @s run teleport @s ^ ^ ^0.15 facing 956 56 1175
execute as @e[tag=R6CCustomer1Leave3] at @s run teleport @s ^ ^ ^0.15 facing 949.3 56 1175
execute as @e[tag=R6CCustomer1Leave4] at @s run teleport @s ^ ^ ^0.15 facing 950 56 1169

# CUSTOMER 2 LEAVES
execute align x align y align z run tag @e[x=945,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave1] add R6CCustomer2Leave2
execute align x align y align z run tag @e[x=945,y=56,z=1184,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave1] remove R6CCustomer2Leave1
execute align x align y align z run tag @e[x=946,y=56,z=1177,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave2] add R6CCustomer2Leave3
execute align x align y align z run tag @e[x=946,y=56,z=1177,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave2] remove R6CCustomer2Leave2
execute align x align y align z run tag @e[x=950.7,y=56,z=1175.5,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave3] add R6CCustomer2Leave4
execute align x align y align z run tag @e[x=950.7,y=56,z=1175.5,dx=0,dy=1,dz=0,tag=R6CCustomer2Leave3] remove R6CCustomer2Leave3

execute as @e[tag=R6CCustomer2Leave1] at @s run teleport @s ^ ^ ^0.15 facing 945 56 1184
execute as @e[tag=R6CCustomer2Leave2] at @s run teleport @s ^ ^ ^0.15 facing 946 56 1177
execute as @e[tag=R6CCustomer2Leave3] at @s run teleport @s ^ ^ ^0.15 facing 950.7 56 1175.5
execute as @e[tag=R6CCustomer2Leave4] at @s run teleport @s ^ ^ ^0.15 facing 950 56 1169

execute align x align y align z run kill @e[tag=R6CVillager,x=950,y=56,z=1169,dx=0,dy=1,dz=0]


execute if entity @e[scores={R6CWait=1000}] run tellraw @a[tag=WrongAnswer] ["",{"text":" Meh. This consequence taking too long. Forget it.","color":"red","bold":false}]
execute if entity @e[scores={R6CWait=1070..}] run teleport @a[tag=WrongAnswer] 1000 67 1049 90 0










# END SAFEGUARD
execute align x align y align z unless entity @a[x=939,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives add R6C_End dummy
execute align x align y align z if entity @a[x=939,y=54,z=1169,dx=24,dy=24,dz=24] run scoreboard objectives remove R6C_End
execute align x align y align z unless entity @a[x=939,y=54,z=1169,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] R6C_End 1

execute if entity @e[scores={R6C_End=25..}] run clear @a
execute if entity @e[scores={R6C_End=25..}] run scoreboard objectives remove R6CWait
execute if entity @e[scores={R6C_End=25..}] run scoreboard objectives remove R6CMoveLine
execute if entity @e[scores={R6C_End=25..}] run scoreboard objectives remove Incorrect_R6C
execute if entity @e[scores={R6C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R6C_End=25..}] run scoreboard objectives remove R6C_End