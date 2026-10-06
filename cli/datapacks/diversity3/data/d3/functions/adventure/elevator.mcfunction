####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 29 2018 / JULY 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


#scoreboard objectives setdisplay sidebar ShulkerVator
#scoreboard objectives setdisplay sidebar ElevatorDoor
#scoreboard objectives setdisplay sidebar ElevatorSFX

# ELEVATOR
execute unless entity @e[tag=ShulkerVator1] run summon armor_stand 993 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator1","ShulkerVator1AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator1","ShulkerVator1Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator2] run summon armor_stand 993 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator2","ShulkerVator2AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator2","ShulkerVator2Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator3] run summon armor_stand 993 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator3","ShulkerVator3AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator3","ShulkerVator3Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}

execute unless entity @e[tag=ShulkerVator4] run summon armor_stand 994 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator4","ShulkerVator4AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator4","ShulkerVator4Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator5] run summon armor_stand 994 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator5","ShulkerVator5AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator5","ShulkerVator5Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator6] run summon armor_stand 994 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator6","ShulkerVator6AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator6","ShulkerVator6Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}

execute unless entity @e[tag=ShulkerVator7] run summon armor_stand 995 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator7","ShulkerVator7AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator7","ShulkerVator7Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator8] run summon armor_stand 995 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator8","ShulkerVator8AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator8","ShulkerVator8Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}
execute unless entity @e[tag=ShulkerVator9] run summon armor_stand 995 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["ShulkerVator","ShulkerVatorAS","ShulkerVator9","ShulkerVator9AS"],Passengers:[{id:"minecraft:shulker",NoGravity:true,Tags:["ShulkerVator","ShulkerVatorMob","ShulkerVator9","ShulkerVator9Mob"],NoAI:true,Invulnerable:1b,Silent:true}],DisabledSlots:2039583}

#execute if block 996 92 1970 green_concrete unless entity @e[tag=ShulkerVator1Mob] run kill @e[tag=ShulkerVator1AS]
#execute if block 996 92 1970 green_concrete unless entity @e[tag=ShulkerVator1AS] run kill @e[tag=ShulkerVator1Mob]

# FALLING BLOCKS
execute unless entity @e[tag=BlockVator1] run summon armor_stand 993 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator1","BlockVator1AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator1","BlockVator1FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator2] run summon armor_stand 993 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator2","BlockVator2AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFBb","BlockVator2","BlockVator2FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator3] run summon armor_stand 993 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator3","BlockVator3AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator3","BlockVator3FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator4] run summon armor_stand 994 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator4","BlockVator4AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator4","BlockVator4FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator5] run summon armor_stand 994 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator5","BlockVator5AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFBb","BlockVator5","BlockVator5FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator6] run summon armor_stand 994 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator6","BlockVator6AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator6","BlockVator6FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator7] run summon armor_stand 995 92 1971 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator7","BlockVator7AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator7","BlockVator7FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator8] run summon armor_stand 995 92 1970 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator8","BlockVator8AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFBb","BlockVator8","BlockVator8FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
execute unless entity @e[tag=BlockVator9] run summon armor_stand 995 92 1969 {Invisible:true,Invulnerable:1b,NoGravity:true,Small:true,Marker:true,Tags:["BlockVator","BlockVatorAS","BlockVator9","BlockVator9AS"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:black_concrete_powder"},Tags:["BlockVator","BlockVatorFB","BlockVator9","BlockVator9FB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator1FB] run kill @e[tag=BlockVator1AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator1AS] run kill @e[tag=BlockVator1FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator2FB] run kill @e[tag=BlockVator2AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator2AS] run kill @e[tag=BlockVator2FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator3FB] run kill @e[tag=BlockVator3AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator3AS] run kill @e[tag=BlockVator3FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator4FB] run kill @e[tag=BlockVator4AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator4AS] run kill @e[tag=BlockVator4FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator5FB] run kill @e[tag=BlockVator5AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator5AS] run kill @e[tag=BlockVator5FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator6FB] run kill @e[tag=BlockVator6AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator6AS] run kill @e[tag=BlockVator6FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator7FB] run kill @e[tag=BlockVator7AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator7AS] run kill @e[tag=BlockVator7FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator8FB] run kill @e[tag=BlockVator8AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator8AS] run kill @e[tag=BlockVator8FB]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator9FB] run kill @e[tag=BlockVator9AS]
execute if block 996 92 1970 green_concrete unless entity @e[tag=BlockVator9AS] run kill @e[tag=BlockVator9FB]


execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator1AS] as @e[tag=BlockVator1AS] at @e[tag=ShulkerVator1AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator2AS] as @e[tag=BlockVator2AS] at @e[tag=ShulkerVator2AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator3AS] as @e[tag=BlockVator3AS] at @e[tag=ShulkerVator3AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator4AS] as @e[tag=BlockVator4AS] at @e[tag=ShulkerVator4AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator5AS] as @e[tag=BlockVator5AS] at @e[tag=ShulkerVator5AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator6AS] as @e[tag=BlockVator6AS] at @e[tag=ShulkerVator6AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator7AS] as @e[tag=BlockVator7AS] at @e[tag=ShulkerVator7AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator8AS] as @e[tag=BlockVator8AS] at @e[tag=ShulkerVator8AS] run teleport @s ~ ~ ~
execute if entity @e[scores={ShulkerVator=..100}] if entity @e[tag=ShulkerVator9AS] as @e[tag=BlockVator9AS] at @e[tag=ShulkerVator9AS] run teleport @s ~ ~ ~


tag @a remove InElevator
execute align x align y align z run tag @a[x=993,y=92,z=1969,dx=2,dy=16,dz=2] add InElevator
tag @a remove UpperElevator
execute align x align y align z run tag @a[x=993,y=106,z=1969,dx=7,dy=2,dz=2] add UpperElevator
tag @a remove LowerElevator
execute align x align y align z run tag @a[x=993,y=92,z=1969,dx=7,dy=2,dz=2] add LowerElevator





# UPPER BUTTON
execute if block 997 107 1968 stone_button[powered=true] run scoreboard objectives add ShulkerVator dummy
execute if block 997 107 1968 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerVator 0
execute if block 997 107 1968 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerVator=0}] ShulkerVator 1
execute if block 997 107 1968 stone_button[powered=true] align x align y align z unless entity @a[x=993,y=93,z=1969,dx=3,dy=2,dz=2] run scoreboard players set @e[scores={ShulkerVator=-3}] ElevatorDoor 0
execute if block 997 107 1968 stone_button[powered=true] align x align y align z unless entity @a[x=993,y=93,z=1969,dx=3,dy=2,dz=2] run scoreboard players set @e[scores={ShulkerVator=-3}] ShulkerVator 1

execute if entity @e[scores={ShulkerVator=1}] run scoreboard objectives add ElevatorDoor dummy
scoreboard players add @e[tag=MainAdventureAEC] ElevatorDoor 0

execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=..99}] if block 996 95 1971 air run scoreboard players add @e[tag=MainAdventureAEC] ElevatorDoor 1

execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=2}] run playsound entity.generic.burn master @a 996 94 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=2}] run playsound entity.evoker.cast_spell master @a 996 94 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=2}] run setblock 996 93 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=3}] run setblock 996 93 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=4}] run setblock 996 93 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=5}] run setblock 996 94 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=6}] run setblock 996 94 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=7}] run setblock 996 94 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=8}] run setblock 996 95 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=9}] run setblock 996 95 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=1,ElevatorDoor=10}] run setblock 996 95 1971 white_stained_glass

execute if entity @e[scores={ShulkerVator=1}] if block 996 95 1971 white_stained_glass run scoreboard players set @e[scores={ElevatorDoor=0..99}] ElevatorDoor 100

scoreboard players add @e[scores={ShulkerVator=1,ElevatorDoor=100..109}] ElevatorDoor 1
execute if entity @e[scores={ShulkerVator=1}] run effect give @a[tag=InElevator] jump_boost 3 128 true
execute unless entity @a[tag=InElevator,nbt={OnGround:0b}] run scoreboard players set @e[scores={ShulkerVator=1,ElevatorDoor=110}] ShulkerVator 2

execute align x align y align z if entity @e[tag=ShulkerVatorAS,x=993,y=104.95,z=1969,dx=2,dy=0,dz=2] run scoreboard players set @e[scores={ShulkerVator=2}] ShulkerVator 3
execute if entity @e[scores={ShulkerVator=2}] as @e[tag=ShulkerVatorAS] at @s run teleport @s ~ ~0.05 ~

# 1.14 fixes because Mojang breaks my stuff
fill 995 92 1969 993 92 1971 barrier replace air
execute unless entity @e[scores={ShulkerVator=3}] run fill 993 105 1969 995 105 1971 air replace barrier
execute align x align y align z if entity @e[tag=ShulkerVatorAS,x=993,y=104.95,z=1969,dx=2,dy=0,dz=2] if entity @e[scores={ShulkerVator=3}] run fill 993 105 1969 995 105 1971 barrier replace air


scoreboard players add @e[scores={ShulkerVator=3,ElevatorDoor=110..129}] ElevatorDoor 1

execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=112}] if block 996 108 1971 white_stained_glass run playsound entity.generic.burn master @a 996 107 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=112}] if block 996 108 1971 white_stained_glass run playsound entity.evoker.cast_spell master @a 996 107 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=112}] run setblock 996 108 1971 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=113}] run setblock 996 108 1970 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=114}] run setblock 996 108 1969 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=115}] run setblock 996 107 1969 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=116}] run setblock 996 107 1970 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=117}] run setblock 996 107 1971 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=118}] run setblock 996 106 1971 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=119}] run setblock 996 106 1970 air
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=120}] run setblock 996 106 1969 air

execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=120..}] unless entity @a[tag=UpperElevator] run scoreboard players set @e[scores={ShulkerVator=3,ElevatorDoor=120..}] ElevatorDoor 0
scoreboard players set @e[scores={ShulkerVator=3,ElevatorDoor=0}] ShulkerVator 4

scoreboard players add @e[scores={ShulkerVator=4}] ElevatorDoor 1
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=2}] if block 996 108 1971 air run playsound entity.generic.burn master @a 996 107 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=2}] if block 996 108 1971 air run playsound entity.evoker.cast_spell master @a 996 107 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=2}] run setblock 996 106 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=3}] run setblock 996 106 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=4}] run setblock 996 106 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=5}] run setblock 996 107 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=6}] run setblock 996 107 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=7}] run setblock 996 107 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=8}] run setblock 996 108 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=9}] run setblock 996 108 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=10}] run setblock 996 108 1971 white_stained_glass

execute if entity @e[scores={ShulkerVator=4,ElevatorDoor=10..}] run scoreboard players set @e[tag=MainAdventureAEC] ShulkerVator 1000



# LOWER BUTTON
execute if block 997 94 1968 stone_button[powered=true] run scoreboard objectives add ShulkerVator dummy
execute if block 997 94 1968 stone_button[powered=true] run scoreboard players add @e[tag=MainAdventureAEC] ShulkerVator 0
execute if block 997 94 1968 stone_button[powered=true] run scoreboard players set @e[scores={ShulkerVator=0}] ShulkerVator -1
execute if block 997 94 1968 stone_button[powered=true] align x align y align z unless entity @a[x=993,y=106,z=1969,dx=3,dy=2,dz=2] run scoreboard players set @e[scores={ShulkerVator=3}] ElevatorDoor 0
execute if block 997 94 1968 stone_button[powered=true] align x align y align z unless entity @a[x=993,y=106,z=1969,dx=3,dy=2,dz=2] run scoreboard players set @e[scores={ShulkerVator=3}] ShulkerVator -1



execute if entity @e[scores={ShulkerVator=-1}] run scoreboard objectives add ElevatorDoor dummy
scoreboard players add @e[tag=MainAdventureAEC] ElevatorDoor 0

execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=..99}] if block 996 108 1971 air run scoreboard players add @e[tag=MainAdventureAEC] ElevatorDoor 1

execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=2}] run playsound entity.generic.burn master @a 996 107 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=2}] run playsound entity.evoker.cast_spell master @a 996 107 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=2}] run setblock 996 106 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=3}] run setblock 996 106 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=4}] run setblock 996 106 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=5}] run setblock 996 107 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=6}] run setblock 996 107 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=7}] run setblock 996 107 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=8}] run setblock 996 108 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=9}] run setblock 996 108 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-1,ElevatorDoor=10}] run setblock 996 108 1971 white_stained_glass

execute if entity @e[scores={ShulkerVator=-1}] if block 996 108 1971 white_stained_glass run scoreboard players set @e[scores={ElevatorDoor=0..99}] ElevatorDoor 100

scoreboard players add @e[scores={ShulkerVator=-1,ElevatorDoor=100..109}] ElevatorDoor 1
scoreboard players set @e[scores={ShulkerVator=-1,ElevatorDoor=110}] ShulkerVator -2

execute align x align y align z if entity @e[tag=ShulkerVatorAS,x=993,y=91.05,z=1969,dx=2,dy=0,dz=2] run scoreboard players set @e[scores={ShulkerVator=-2}] ShulkerVator -3
execute if entity @e[scores={ShulkerVator=-2}] as @e[tag=ShulkerVatorAS] at @s run teleport @s ~ ~-0.05 ~

scoreboard players add @e[scores={ShulkerVator=-3,ElevatorDoor=110..129}] ElevatorDoor 1

execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=112}] if block 996 95 1971 white_stained_glass run playsound entity.generic.burn master @a 996 94 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=112}] if block 996 95 1971 white_stained_glass run playsound entity.evoker.cast_spell master @a 996 94 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=112}] run setblock 996 95 1971 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=113}] run setblock 996 95 1970 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=114}] run setblock 996 95 1969 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=115}] run setblock 996 94 1969 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=116}] run setblock 996 94 1970 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=117}] run setblock 996 94 1971 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=118}] run setblock 996 93 1971 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=119}] run setblock 996 93 1970 air
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=120}] run setblock 996 93 1969 air

execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=120..}] unless entity @a[tag=LowerElevator] run scoreboard players set @e[scores={ShulkerVator=-3,ElevatorDoor=120..}] ElevatorDoor 0
scoreboard players set @e[scores={ShulkerVator=-3,ElevatorDoor=0}] ShulkerVator -4

scoreboard players add @e[scores={ShulkerVator=-4}] ElevatorDoor 1
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=2}] if block 996 95 1971 air run playsound entity.generic.burn master @a 996 94 1970 0.2 1.5 0
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=2}] if block 996 95 1971 air run playsound entity.evoker.cast_spell master @a 996 94 1970 0.2 1.3 0
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=2}] run setblock 996 93 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=3}] run setblock 996 93 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=4}] run setblock 996 93 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=5}] run setblock 996 94 1971 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=6}] run setblock 996 94 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=7}] run setblock 996 94 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=8}] run setblock 996 95 1969 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=9}] run setblock 996 95 1970 white_stained_glass
execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=10}] run setblock 996 95 1971 white_stained_glass

execute if entity @e[scores={ShulkerVator=-4,ElevatorDoor=10..}] run scoreboard players set @e[tag=MainAdventureAEC] ShulkerVator 1000
execute if entity @e[scores={ShulkerVator=1000}] run scoreboard objectives remove ElevatorDoor
execute if entity @e[scores={ShulkerVator=1000}] run scoreboard objectives remove ShulkerVator

execute at @e[tag=ShulkerVatorAS1] as @e[tag=ShulkerVatorMob1] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS2] as @e[tag=ShulkerVatorMob2] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS3] as @e[tag=ShulkerVatorMob3] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS4] as @e[tag=ShulkerVatorMob4] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS5] as @e[tag=ShulkerVatorMob5] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS6] as @e[tag=ShulkerVatorMob6] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS7] as @e[tag=ShulkerVatorMob7] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS8] as @e[tag=ShulkerVatorMob8] run teleport ~ ~ ~
execute at @e[tag=ShulkerVatorAS9] as @e[tag=ShulkerVatorMob9] run teleport ~ ~ ~

# INSIDE ELEVATOR 
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=130}] if block 995 107 1971 stone_button[powered=true] align x align y align z unless entity @a[x=996,y=106,z=1969,dx=0,dy=2,dz=2] run scoreboard players set @e[tag=MainAdventureAEC] ShulkerVator -100
scoreboard players set @e[scores={ShulkerVator=-100}] ElevatorDoor 0
scoreboard players set @e[scores={ShulkerVator=-100}] ShulkerVator -1
execute if entity @e[scores={ShulkerVator=2}] run effect give @a[tag=InElevator] levitation 100 255 true
execute if entity @e[scores={ShulkerVator=2}] as @a[tag=InElevator] at @s run teleport @s ~ ~0.05 ~
execute unless entity @e[scores={ShulkerVator=2}] run effect clear @a[tag=InElevator] levitation
execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=111..120}] as @a[tag=InElevator] at @s run teleport @s ~ 106 ~

execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=130}] if block 995 94 1971 stone_button[powered=true] align x align y align z unless entity @a[x=996,y=93,z=1969,dx=0,dy=2,dz=2] run scoreboard players set @e[tag=MainAdventureAEC] ShulkerVator 100
scoreboard players set @e[scores={ShulkerVator=100}] ElevatorDoor 0
scoreboard players set @e[scores={ShulkerVator=100}] ShulkerVator 1


# SOUND FX
execute if entity @e[scores={ElevatorDoor=110}] run scoreboard objectives add ElevatorSFX dummy
scoreboard players add @e[tag=MainAdventureAEC] ElevatorSFX 1
execute if entity @e[scores={ElevatorSFX=1}] run playsound entity.iron_golem.hurt master @a 994 100 1970 0.3 0.3 0

scoreboard players set @e[scores={ElevatorSFX=10}] ElevatorSFX 1
execute if entity @e[scores={ElevatorDoor=111}] run scoreboard objectives remove ElevatorSFX

execute if entity @e[scores={ShulkerVator=2,ElevatorSFX=1}] at @e[tag=ShulkerVator5Mob] run playsound block.beacon.ambient master @a ~ ~1 ~ 0.7 0.65 0
execute if entity @e[scores={ShulkerVator=-2,ElevatorSFX=1}] at @e[tag=ShulkerVator5Mob] run playsound block.beacon.ambient master @a ~ ~-1 ~ 0.7 0.6 0
execute if entity @e[scores={ElevatorDoor=111}] at @e[tag=ShulkerVator5Mob] run stopsound @a

execute if entity @e[scores={ShulkerVator=3,ElevatorDoor=111}] if block 997 107 1968 stone_button[powered=false] if block 997 94 1968 stone_button[powered=false] run playsound block.note_block.chime master @a 994 107 1970 1.5 0.89 0
execute if entity @e[scores={ShulkerVator=-3,ElevatorDoor=111}] if block 997 107 1968 stone_button[powered=false] if block 997 94 1968 stone_button[powered=false] run playsound block.note_block.chime master @a 994 94 1970 1.5 0.8 0
