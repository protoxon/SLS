####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 5 2018 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SheepBypass
#scoreboard objectives setdisplay sidebar Creeper0
#scoreboard objectives setdisplay sidebar Creeper1
#scoreboard objectives setdisplay sidebar Creeper2
#scoreboard objectives setdisplay sidebar Creeper3

teleport @a[x=-1009,y=95,z=955,dx=22,dy=-2,dz=30] -1000 98 967

scoreboard objectives add Creeper0 dummy
scoreboard players add @e[tag=MainEscapeAEC] Creeper0 0
scoreboard players add @e[scores={EscapeLevel=9,Creeper0=0..29}] Creeper0 1
execute align x align y align z run execute as @e[tag=KnockbackCreeper,x=-997,y=98,z=962,dx=2,dy=1,dz=2] run scoreboard players set @e[tag=MainEscapeAEC] Creeper0 0

fill -997 97 962 -995 97 964 lime_concrete replace green_concrete

# SUMMONS STARTING CREEPER
execute if entity @e[scores={Creeper0=30}] run summon creeper -996 98 963 {ActiveEffects:[{Id:10,Amplifier:3,Duration:999999}],Tags:["KnockbackCreeper"],Rotation:[45f,0f],CustomNameVisible:false}


# CHECK FOR CREEPER PLATFORMS
scoreboard players set @e[tag=MainEscapeAEC] Creeper1 0
execute align x align y align z run execute as @e[tag=KnockbackCreeper,x=-992,y=97,z=957,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={Creeper1=0}] Creeper1 1
scoreboard players set @e[tag=MainEscapeAEC] Creeper2 0
execute align x align y align z run execute as @e[tag=KnockbackCreeper,x=-1007,y=97,z=961,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={Creeper2=0}] Creeper2 1
scoreboard players set @e[tag=MainEscapeAEC] Creeper3 0
execute align x align y align z run execute as @e[tag=KnockbackCreeper,x=-1000,y=97,z=972,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={Creeper3=0}] Creeper3 1


scoreboard players set @e[scores={EscapeLevel=10..}] Creeper1 1
scoreboard players set @e[scores={EscapeLevel=10..}] Creeper2 1
scoreboard players set @e[scores={EscapeLevel=10..}] Creeper3 1


# CHANGES PLATFORMS AND FLOORS WHEN CREEPER IS PRESENT
scoreboard objectives add Creeper1 dummy
execute if entity @e[scores={Creeper1=0}] run fill -992 97 957 -990 97 959 green_concrete replace lime_concrete
execute if entity @e[scores={Creeper1=0}] run fill -999 97 958 -995 97 958 lime_stained_glass replace lime_concrete
execute if entity @e[scores={Creeper1=0}] run fill -1000 97 959 -1000 97 966 lime_stained_glass replace lime_concrete
execute if entity @e[scores={Creeper1=1}] run execute if block -992 97 957 green_concrete run playsound entity.experience_orb.pickup master @a -991 98 958 1 0.5 0
execute if entity @e[scores={Creeper1=1}] run fill -992 97 957 -990 97 959 lime_concrete replace green_concrete
execute if entity @e[scores={Creeper1=1}] run fill -999 97 958 -995 97 958 lime_concrete replace lime_stained_glass

scoreboard objectives add Creeper2 dummy
execute if entity @e[scores={Creeper2=0}] run fill -1007 97 961 -1005 97 963 green_concrete replace lime_concrete
execute if entity @e[scores={Creeper2=0}] run fill -1006 97 958 -1001 97 958 lime_stained_glass replace lime_concrete
execute if entity @e[scores={Creeper2=0}] run fill -1000 97 959 -1000 97 966 lime_stained_glass replace lime_concrete
execute if entity @e[scores={Creeper2=1}] run execute if block -1007 97 961 green_concrete run playsound entity.experience_orb.pickup master @a -1006 98 962 1 0.6 0
execute if entity @e[scores={Creeper2=1}] run fill -1007 97 961 -1005 97 963 lime_concrete replace green_concrete
execute if entity @e[scores={Creeper2=1}] run fill -1006 97 958 -1001 97 958 lime_concrete replace lime_stained_glass

execute if entity @e[scores={Creeper1=1,Creeper2=1}] run fill -1000 97 959 -1000 97 966 lime_concrete replace lime_stained_glass

scoreboard objectives add Creeper3 dummy
execute if entity @e[scores={Creeper3=0}] run fill -1000 97 972 -998 97 974 green_concrete replace lime_concrete
execute if entity @e[scores={Creeper3=0}] run fill -1006 97 967 -1001 97 973 lime_stained_glass replace lime_concrete
execute if entity @e[scores={Creeper3=1}] run execute if block -1000 97 972 green_concrete run playsound entity.experience_orb.pickup master @a -999 98 973 1 0.8 0
execute if entity @e[scores={Creeper3=1}] run fill -1000 97 972 -998 97 974 lime_concrete replace green_concrete
execute if entity @e[scores={Creeper3=1}] run fill -1006 97 967 -1001 97 973 lime_concrete replace lime_stained_glass

kill @e[type=area_effect_cloud,x=-1018,y=95,z=953,dx=32,dy=4,dz=34]



# SHEEP BYPASS
execute if entity @e[type=creeper,nbt={CustomName:"{\"italic\":false,\"color\":\"green\",\"text\":\"Shhh...\"}"}] run scoreboard objectives add SheepBypass dummy
scoreboard players add @e[tag=MainEscapeAEC] SheepBypass 1
#scoreboard players add @e[scores={SheepBypass=0..}] SheepBypass 1
execute if entity @e[scores={SheepBypass=1}] run execute at @e[type=creeper] run playsound entity.creeper.primed master @a ~ ~ ~ 1 1.2 0
execute if entity @e[scores={SheepBypass=28}] run particle cloud -996 98 963 0.7 0.7 0.7 0 400
execute if entity @e[scores={SheepBypass=28}] run execute as @e[tag=KnockbackCreeper] run data merge entity @s {Fuse:0}
execute if entity @e[scores={SheepBypass=28}] run playsound entity.illusioner.mirror_move master @a -996 98 963 1 0.8 1
execute if entity @e[scores={SheepBypass=29}] run summon sheep -996 98 963 {Invulnerable:true,Tags:["KnockbackCreeper"],Rotation:[45f,0f],CustomNameVisible:false,Color:5}
effect clear @e[type=sheep,tag=KnockbackCreeper]

execute if entity @e[scores={SheepBypass=90}] run playsound entity.item.pickup master @a -991 99 958 1 1 0
execute if entity @e[scores={SheepBypass=90}] run summon sheep -991 99 958 {Invulnerable:true,Tags:["KnockbackCreeper"],Rotation:[45f,0f],CustomNameVisible:false,Color:5}

execute if entity @e[scores={SheepBypass=120}] run playsound entity.item.pickup master @a -1006 99 962 1 1 0
execute if entity @e[scores={SheepBypass=120}] run summon sheep -1006 99 962 {Invulnerable:true,Tags:["KnockbackCreeper"],Rotation:[315f,0f],CustomNameVisible:false,Color:5}

execute if entity @e[scores={SheepBypass=150}] run playsound entity.item.pickup master @a -999 99 973 1 1 0
execute if entity @e[scores={SheepBypass=150}] run summon sheep -999 99 973 {Invulnerable:true,Tags:["KnockbackCreeper"],Rotation:[180f,0f],CustomNameVisible:false,Color:5}

execute if entity @e[scores={SheepBypass=170}] run advancement grant @a only d3:folder_c/creeper_sheep
execute if entity @e[scores={SheepBypass=170}] run scoreboard objectives remove SheepBypass



# TO WIN -> GO TO LEVEL 10
scoreboard players set @e[scores={EscapeLevel=9,Creeper1=1,Creeper2=1,Creeper3=1}] EscapeTimer 0
scoreboard players set @e[scores={EscapeLevel=9,Creeper1=1,Creeper2=1,Creeper3=1}] EscapeLevel 10

execute if entity @e[scores={EscapeLevel=10,EscapeTimer=20}] run kill @e[type=creeper]
execute if entity @e[scores={EscapeLevel=10,EscapeTimer=35}] run playsound entity.firework_rocket.launch master @a -1000 98 967 1 1 1
execute if entity @e[scores={EscapeLevel=10,EscapeTimer=35}] run fill -999 97 967 -991 97 985 lime_concrete replace lime_stained_glass
execute if entity @e[scores={EscapeLevel=10,EscapeTimer=100}] run playsound block.metal.break master @a -1000 98 967 1 1 0
execute if entity @e[scores={EscapeLevel=10,EscapeTimer=100}] run fill -992 98 987 -990 100 987 air destroy

execute if entity @e[scores={EscapeLevel=10,EscapeTimer=100}] run execute as @e[tag=KnockbackCreeper] run data merge entity @s {Silent:true}

execute if entity @e[scores={EscapeLevel=10..11}] run effect clear @a regeneration
