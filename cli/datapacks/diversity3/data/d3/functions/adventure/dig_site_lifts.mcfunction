####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 10 2018 / JULY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


#scoreboard objectives setdisplay sidebar ShulkerLiftA
#scoreboard objectives setdisplay sidebar ShulkerLiftB
#scoreboard objectives setdisplay sidebar LiftASFX
#scoreboard objectives setdisplay sidebar LiftBSFX



# 1.14 FIX BECAUSE MOJANG BREAKS MY STUFF
fill 923 94 2078 931 94 2078 barrier replace air

execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftA=52}] run fill 931 131 2078 931 131 2078 barrier replace air
execute if entity @e[scores={ShulkerLiftA=-50}] run fill 931 131 2078 931 131 2078 air replace barrier

execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftB=52}] run fill 923 131 2078 923 131 2078 barrier replace air
execute if entity @e[scores={ShulkerLiftB=-50}] run fill 923 131 2078 923 131 2078 air replace barrier



# LIFTS
execute unless entity @e[tag=ShulkerLiftA] run summon armor_stand 931 115 2078 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerLift","ShulkerLiftAS","ShulkerLiftA","ShulkerLiftAAS"],Passengers:[{id:"minecraft:shulker",Tags:["ShulkerLift","ShulkerLiftMob","ShulkerLiftA","ShulkerLiftAMob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}

execute unless entity @e[tag=ShulkerLiftB] run summon armor_stand 923 115 2078 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerLift","ShulkerLiftAS","ShulkerLiftB","ShulkerLiftBAS"],Passengers:[{id:"minecraft:shulker",Tags:["ShulkerLift","ShulkerLiftMob","ShulkerLiftB","ShulkerLiftBMob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}


# FALLING BLOCKS
execute unless entity @e[tag=BlockLiftA] run summon armor_stand 931 115 2078 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockLift","BlockLiftAS","BlockLiftA","BlockLiftAAS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockLift","BlockLiftFB","BlockLiftA","BlockLiftAFB"],NoGravity:true,Invulnerable:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute unless entity @e[tag=BlockLiftB] run summon armor_stand 923 115 2078 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockLift","BlockLiftAS","BlockLiftB","BlockLiftBAS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockLift","BlockLiftFB","BlockLiftB","BlockLiftBFB"],NoGravity:true,Invulnerable:1b,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


effect give @e[tag=ShulkerLiftMob] invisibility 1000000 255 true
execute if entity @e[tag=ShulkerLiftAAS] as @e[tag=BlockLiftAAS] at @e[tag=ShulkerLiftAAS] run teleport @s ~ ~ ~
execute if entity @e[tag=ShulkerLiftBAS] as @e[tag=BlockLiftBAS] at @e[tag=ShulkerLiftBAS] run teleport @s ~ ~ ~


##################


tag @a remove LiftAZone
execute align x align y align z run tag @a[x=931,y=95,z=2076,dx=0,dy=37,dz=4] add LiftAZone
tag @a remove InLiftA
execute align x align y align z run tag @a[x=931,y=95,z=2078,dx=0,dy=37,dz=0] add InLiftA
tag @a[tag=!LiftAZone] remove LiftAGoingDown
execute align x align y align z run tag @a[x=931,y=132,z=2076,dx=0,dy=1,dz=0] add LiftAGoingDown
execute align x align y align z run tag @a[x=931,y=95,z=2080,dx=0,dy=1,dz=0] remove LiftAGoingDown
tag @a[tag=!LiftAZone] remove LiftAGoingUp
execute align x align y align z run tag @a[x=931,y=95,z=2080,dx=0,dy=1,dz=0] add LiftAGoingUp
execute align x align y align z run tag @a[x=931,y=132,z=2076,dx=0,dy=1,dz=0] remove LiftAGoingUp


# LIFT A UPPER BUTTON
execute if block 929 133 2075 stone_button[powered=true] run scoreboard objectives add ShulkerLiftA dummy
execute if block 929 133 2075 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftA 0
execute if block 929 133 2075 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerLiftA=0}] ShulkerLiftA 1
execute if block 929 133 2075 stone_button[powered=true] align x align y align z unless entity @a[x=923,y=95,z=2078,dx=0,dy=3,dz=2] run fill 929 95 2078 933 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftA=1}] unless block 931 95 2079 air run scoreboard players set @e[scores={ShulkerLiftA=1}] ShulkerLiftA 2


# LIFT A LOWER BUTTON
execute if block 933 96 2081 stone_button[powered=true] run scoreboard objectives add ShulkerLiftA dummy
execute if block 933 96 2081 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftA 0
execute if block 933 96 2081 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerLiftA=0}] ShulkerLiftA -1
execute if block 933 96 2081 stone_button[powered=true] align x align y align z unless entity @a[x=931,y=132,z=2075,dx=0,dy=3,dz=2] run fill 931 130 2076 931 130 2076 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftA=-1}] unless block 931 132 2077 air run scoreboard players set @e[scores={ShulkerLiftA=-1}] ShulkerLiftA -2


# LIFT A MOVES UP
execute unless entity @e[scores={ShulkerLiftA=..-1}] align x align y align z if entity @a[tag=LiftAGoingUp,x=931,y=95,z=2077,dx=0,dy=0,dz=0.1] run scoreboard objectives add ShulkerLiftA dummy
execute unless entity @e[scores={ShulkerLiftA=..-1}] align x align y align z if entity @a[tag=LiftAGoingUp,x=931,y=95,z=2078,dx=0,dy=0,dz=0] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftA 0
execute unless entity @e[scores={ShulkerLiftA=..-1}] align x align y align z if entity @a[tag=LiftAGoingUp,x=931,y=95,z=2078,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={ShulkerLiftA=0}] ShulkerLiftA 1
scoreboard players add @e[scores={ShulkerLiftA=2..49}] ShulkerLiftA 1
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftA=50}] run stopsound @a
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftA=50}] run playsound entity.iron_golem.hurt master @a 931 111.5 2078 2 0.3 0
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=130.95,z=2078,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={ShulkerLiftA=1..50}] ShulkerLiftA 51
execute if entity @e[scores={ShulkerLiftA=25}] run playsound entity.iron_golem.hurt master @a 931 111.5 2078 2 0.3 0
execute if entity @e[scores={ShulkerLiftA=50}] as @e[tag=ShulkerLiftAAS] at @s run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ShulkerLiftA=1}] run fill 929 95 2078 933 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftA=1}] run fill 931 130 2076 931 130 2076 redstone_block replace clay
scoreboard players add @e[scores={ShulkerLiftA=51..99}] ShulkerLiftA 1
execute if entity @e[scores={ShulkerLiftA=75..}] run fill 931 130 2076 931 130 2076 clay replace redstone_block
execute if entity @e[scores={ShulkerLiftA=100..}] run scoreboard objectives remove ShulkerLiftA


# LIFT A MOVES DOWN
execute unless entity @e[scores={ShulkerLiftA=1..}] align x align y align z if entity @a[tag=LiftAGoingDown,x=931,y=132,z=2079,dx=0,dy=0,dz=-0.1] run scoreboard objectives add ShulkerLiftA dummy
execute unless entity @e[scores={ShulkerLiftA=1..}] align x align y align z if entity @a[tag=LiftAGoingDown,x=931,y=132,z=2078,dx=0,dy=0,dz=0] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftA 0
execute unless entity @e[scores={ShulkerLiftA=1..}] align x align y align z if entity @a[tag=LiftAGoingDown,x=931,y=132,z=2078,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={ShulkerLiftA=0}] ShulkerLiftA -1
execute if entity @e[scores={ShulkerLiftA=-1}] run fill 929 95 2078 933 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftA=-1}] run fill 931 130 2076 923 130 2076 redstone_block replace clay
scoreboard players remove @e[scores={ShulkerLiftA=-49..-2}] ShulkerLiftA 1
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=92.05,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftA=-50}] run stopsound @a
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=92.05,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftA=-50}] run playsound entity.iron_golem.hurt master @a 931 111.5 2078 2 0.3 0
execute align x align y align z if entity @e[tag=ShulkerLiftAAS,x=931,y=92.05,z=2078,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={ShulkerLiftA=-50..-1}] ShulkerLiftA -51
execute if entity @e[scores={ShulkerLiftA=-25}] run playsound entity.iron_golem.hurt master @a 931 111.5 2078 2 0.3 0
execute if entity @e[scores={ShulkerLiftA=-50}] as @e[tag=ShulkerLiftAAS] at @s run teleport @s ~ ~-0.05 ~
scoreboard players remove @e[scores={ShulkerLiftA=-99..-51}] ShulkerLiftA 1
execute if entity @e[scores={ShulkerLiftA=..-75}] run fill 929 95 2078 933 97 2078 clay replace redstone_block
execute if entity @e[scores={ShulkerLiftA=..-100}] run scoreboard objectives remove ShulkerLiftA



# LIFT A EFFECTS
execute if entity @e[scores={ShulkerLiftA=50..51}] run effect give @a[tag=InLiftA] levitation 100 255 true
execute if entity @e[scores={ShulkerLiftA=50..51}] as @a[tag=InLiftA] at @s run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ShulkerLiftA=51..55}] run effect clear @a[tag=!InLiftB,tag=!InElevator] levitation
execute if entity @e[scores={ShulkerLiftA=51..55}] as @a[tag=InLiftA] at @s run teleport @s ~ 132 ~



# LIFT A SOUND FX
execute if entity @e[scores={ShulkerLiftA=50}] run scoreboard objectives add LiftASFX dummy
execute if entity @e[scores={ShulkerLiftA=51..}] run scoreboard objectives remove LiftASFX
scoreboard players add @e[tag=MainAdventureAEC] LiftASFX 1
scoreboard players set @e[scores={LiftASFX=10}] LiftASFX 0
execute if entity @e[scores={ShulkerLiftA=50,LiftASFX=2}] at @e[tag=ShulkerLiftAMob] run playsound block.beacon.ambient master @a ~ ~1 ~ 0.7 0.65 0

execute if entity @e[scores={ShulkerLiftA=-50}] run scoreboard objectives add LiftASFX dummy
execute if entity @e[scores={ShulkerLiftA=..-51}] run scoreboard objectives remove LiftASFX
execute if entity @e[scores={ShulkerLiftA=-50,LiftASFX=2}] at @e[tag=ShulkerLiftAMob] run playsound block.beacon.ambient master @a ~ ~1 ~ 0.7 0.6 0


################################


tag @a remove LiftBZone
execute align x align y align z run tag @a[x=923,y=95,z=2076,dx=0,dy=37,dz=4] add LiftBZone
tag @a remove InLiftB
execute align x align y align z run tag @a[x=923,y=95,z=2078,dx=0,dy=37,dz=0] add InLiftB
tag @a[tag=!LiftBZone] remove LiftBGoingDown
execute align x align y align z run tag @a[x=923,y=132,z=2076,dx=0,dy=1,dz=0] add LiftBGoingDown
execute align x align y align z run tag @a[x=923,y=95,z=2080,dx=0,dy=1,dz=0] remove LiftBGoingDown
tag @a[tag=!LiftBZone] remove LiftBGoingUp
execute align x align y align z run tag @a[x=923,y=95,z=2080,dx=0,dy=1,dz=0] add LiftBGoingUp
execute align x align y align z run tag @a[x=923,y=132,z=2076,dx=0,dy=1,dz=0] remove LiftBGoingUp



# LIFT B UPPER BUTTON
execute if block 921 133 2075 stone_button[powered=true] run scoreboard objectives add ShulkerLiftB dummy
execute if block 921 133 2075 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftB 0
execute if block 921 133 2075 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerLiftB=0}] ShulkerLiftB 1
execute if block 921 133 2075 stone_button[powered=true] align x align y align z unless entity @a[x=923,y=95,z=2078,dx=0,dy=3,dz=2] run fill 921 95 2078 925 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftB=1}] unless block 923 95 2079 air run scoreboard players set @e[scores={ShulkerLiftB=1}] ShulkerLiftB 2


# LIFT B LOWER BUTTON
execute if block 925 96 2081 stone_button[powered=true] run scoreboard objectives add ShulkerLiftB dummy
execute if block 925 96 2081 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftB 0
execute if block 925 96 2081 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerLiftB=0}] ShulkerLiftB -1
execute if block 925 96 2081 stone_button[powered=true] align x align y align z unless entity @a[x=923,y=132,z=2075,dx=0,dy=3,dz=2] run fill 923 130 2076 923 130 2076 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftB=-1}] unless block 923 132 2077 air run scoreboard players set @e[scores={ShulkerLiftB=-1}] ShulkerLiftB -2


# LIFT B MOVES UP
execute unless entity @e[scores={ShulkerLiftB=..-1}] align x align y align z if entity @a[tag=LiftBGoingUp,x=923,y=95,z=2077,dx=0,dy=0,dz=0.1] run scoreboard objectives add ShulkerLiftB dummy
execute unless entity @e[scores={ShulkerLiftB=..-1}] align x align y align z if entity @a[tag=LiftBGoingUp,x=923,y=95,z=2078,dx=0,dy=0,dz=0] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftB 0
execute unless entity @e[scores={ShulkerLiftB=..-1}] align x align y align z if entity @a[tag=LiftBGoingUp,x=923,y=95,z=2078,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={ShulkerLiftB=0}] ShulkerLiftB 1
scoreboard players add @e[scores={ShulkerLiftB=2..49}] ShulkerLiftB 1
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftB=50}] run stopsound @a
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=130.95,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftB=50}] run playsound entity.iron_golem.hurt master @a 923 111.5 2078 2 0.3 0
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=130.95,z=2078,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={ShulkerLiftB=1..50}] ShulkerLiftB 51
execute if entity @e[scores={ShulkerLiftB=25}] run playsound entity.iron_golem.hurt master @a 923 111.5 2078 2 0.3 0
execute if entity @e[scores={ShulkerLiftB=50}] as @e[tag=ShulkerLiftBAS] at @s run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ShulkerLiftB=1}] run fill 921 95 2078 925 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftB=1}] run fill 923 130 2076 923 130 2076 redstone_block replace clay
scoreboard players add @e[scores={ShulkerLiftB=51..99}] ShulkerLiftB 1
execute if entity @e[scores={ShulkerLiftB=75..}] run fill 923 130 2076 923 130 2076 clay replace redstone_block
execute if entity @e[scores={ShulkerLiftB=100..}] run scoreboard objectives remove ShulkerLiftB


# LIFT B MOVES DOWN
execute unless entity @e[scores={ShulkerLiftB=1..}] align x align y align z if entity @a[tag=LiftBGoingDown,x=923,y=132,z=2079,dx=0,dy=0,dz=-0.1] run scoreboard objectives add ShulkerLiftB dummy
execute unless entity @e[scores={ShulkerLiftB=1..}] align x align y align z if entity @a[tag=LiftBGoingDown,x=923,y=132,z=2078,dx=0,dy=0,dz=0] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerLiftB 0
execute unless entity @e[scores={ShulkerLiftB=1..}] align x align y align z if entity @a[tag=LiftBGoingDown,x=923,y=132,z=2078,dx=0,dy=0,dz=0] run scoreboard players set @e[scores={ShulkerLiftB=0}] ShulkerLiftB -1
execute if entity @e[scores={ShulkerLiftB=-1}] run fill 921 95 2078 925 97 2078 redstone_block replace clay
execute if entity @e[scores={ShulkerLiftB=-1}] run fill 923 130 2076 923 130 2076 redstone_block replace clay
scoreboard players remove @e[scores={ShulkerLiftB=-49..-2}] ShulkerLiftB 1
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=92.05,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftB=-50}] run stopsound @a
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=92.05,z=2078,dx=2,dy=1,dz=2] if entity @e[scores={ShulkerLiftB=-50}] run playsound entity.iron_golem.hurt master @a 923 111.5 2078 2 0.3 0
execute align x align y align z if entity @e[tag=ShulkerLiftBAS,x=923,y=92.05,z=2078,dx=2,dy=1,dz=2] run scoreboard players set @e[scores={ShulkerLiftB=-50..-1}] ShulkerLiftB -51
execute if entity @e[scores={ShulkerLiftB=-25}] run playsound entity.iron_golem.hurt master @a 923 111.5 2078 2 0.3 0
execute if entity @e[scores={ShulkerLiftB=-50}] as @e[tag=ShulkerLiftBAS] at @s run teleport @s ~ ~-0.05 ~
scoreboard players remove @e[scores={ShulkerLiftB=-99..-51}] ShulkerLiftB 1
execute if entity @e[scores={ShulkerLiftB=..-75}] run fill 921 95 2078 925 97 2078 clay replace redstone_block
execute if entity @e[scores={ShulkerLiftB=..-100}] run scoreboard objectives remove ShulkerLiftB



# LIFT B EFFECTS
execute if entity @e[scores={ShulkerLiftB=50..51}] run effect give @a[tag=InLiftB] levitation 100 255 true
execute if entity @e[scores={ShulkerLiftB=50..51}] as @a[tag=InLiftB] at @s run teleport @s ~ ~0.05 ~
execute if entity @e[scores={ShulkerLiftB=51..55}] run effect clear @a[tag=!InLiftA,tag=!InElevator] levitation
execute if entity @e[scores={ShulkerLiftB=51..55}] as @a[tag=InLiftB] at @s run teleport @s ~ 132 ~



# LIFT B SOUND FX
execute if entity @e[scores={ShulkerLiftB=50}] run scoreboard objectives add LiftBSFX dummy
execute if entity @e[scores={ShulkerLiftB=51..}] run scoreboard objectives remove LiftBSFX
scoreboard players add @e[tag=MainAdventureAEC] LiftBSFX 1
scoreboard players set @e[scores={LiftBSFX=10}] LiftBSFX 0
execute if entity @e[scores={ShulkerLiftB=50,LiftBSFX=2}] at @e[tag=ShulkerLiftBMob] run playsound block.beacon.ambient master @a ~ ~1 ~ 0.7 0.65 0

execute if entity @e[scores={ShulkerLiftB=-50}] run scoreboard objectives add LiftBSFX dummy
execute if entity @e[scores={ShulkerLiftB=..-51}] run scoreboard objectives remove LiftBSFX
execute if entity @e[scores={ShulkerLiftB=-50,LiftBSFX=2}] at @e[tag=ShulkerLiftBMob] run playsound block.beacon.ambient master @a ~ ~1 ~ 0.7 0.6 0