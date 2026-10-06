####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 26 2018 / JULY 17 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OrangeIsland
#scoreboard objectives setdisplay sidebar FinaleDoor

execute if block 10 6 110 clay align x align y align z if entity @a[x=30,y=40,z=5051,dx=33,dy=6,dz=33] run scoreboard objectives add OrangeIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] OrangeIsland 0


# COMPUTER MOUSE
execute if block 34 43 5080 stone_button[facing=north] run setblock 34 43 5080 stone_button[face=floor,facing=east]

# MONITOR
execute if block 35 43 5081 quartz_stairs unless entity @e[tag=FinaleMonitor1] run summon item_frame 35 43 5080 {Facing:2b,Silent:1b,ItemRotation:0b,Invulnerable:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}},Tags:["FinaleMonitor1","FinaleMonitor"]}
execute if entity @e[tag=FinaleMonitor1,nbt=!{Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}}}] run data merge entity @e[tag=FinaleMonitor1,limit=1] {Item:{id:"minecraft:filled_map",Count:1b,tag:{map:262}}}


# 1.14 UPDATE
fill 35 43 5075 37 43 5075 blast_furnace[facing=south] replace furnace

# ADVENTURE ISLAND DOOR
#tag @a add FinaleDoorLevel

execute align x align y align z if entity @e[scores={OrangeIsland=..2}] if entity @a[x=39,y=42,z=5076,dx=2,dy=4,dz=4] run scoreboard objectives add FinaleDoor dummy
execute align x align y align z if entity @e[scores={OrangeIsland=3..1000}] if entity @a[x=40,y=42,z=5076,dx=1,dy=4,dz=4] run scoreboard objectives add FinaleDoor dummy
execute align x align y align z if entity @a[x=39,y=42,z=5076,dx=2,dy=4,dz=4] run scoreboard players add @e[tag=MainFinaleAEC] FinaleDoor 0
execute align x align y align z if entity @a[x=39,y=42,z=5076,dx=2,dy=4,dz=4] run scoreboard players add @e[scores={FinaleDoor=..10}] FinaleDoor 1
execute align x align y align z unless entity @a[x=39,y=42,z=5076,dx=2,dy=4,dz=4] run scoreboard players remove @e[scores={FinaleDoor=-10..}] FinaleDoor 1

execute if entity @e[scores={FinaleDoor=2}] run playsound entity.generic.burn master @a 40 43 5078 0.2 1.5 0
execute if entity @e[scores={FinaleDoor=2}] run playsound entity.evoker.cast_spell master @a 40 43 5078 0.2 1.3 0
execute if entity @e[scores={FinaleDoor=2}] run setblock 40 44 5079 air
execute if entity @e[scores={FinaleDoor=3}] run setblock 40 44 5078 air
execute if entity @e[scores={FinaleDoor=4}] run setblock 40 44 5077 air
execute if entity @e[scores={FinaleDoor=5}] run setblock 40 43 5077 air
execute if entity @e[scores={FinaleDoor=6}] run setblock 40 43 5078 air
execute if entity @e[scores={FinaleDoor=7}] run setblock 40 43 5079 air
execute if entity @e[scores={FinaleDoor=8}] run setblock 40 42 5079 air
execute if entity @e[scores={FinaleDoor=9}] run setblock 40 42 5078 air
execute if entity @e[scores={FinaleDoor=10}] run setblock 40 42 5077 air

execute if entity @e[scores={FinaleDoor=-9}] run setblock 40 44 5079 white_stained_glass
execute if entity @e[scores={FinaleDoor=-8}] run setblock 40 44 5078 white_stained_glass
execute if entity @e[scores={FinaleDoor=-7}] run setblock 40 44 5077 white_stained_glass
execute if entity @e[scores={FinaleDoor=-6}] run setblock 40 43 5077 white_stained_glass
execute if entity @e[scores={FinaleDoor=-5}] run setblock 40 43 5078 white_stained_glass
execute if entity @e[scores={FinaleDoor=-4}] run setblock 40 43 5079 white_stained_glass
execute if entity @e[scores={FinaleDoor=-3}] run setblock 40 42 5079 white_stained_glass
execute if entity @e[scores={FinaleDoor=-2}] run setblock 40 42 5078 white_stained_glass
execute if entity @e[scores={FinaleDoor=-1}] run setblock 40 42 5077 white_stained_glass

execute if entity @e[scores={FinaleDoor=..-10}] run scoreboard objectives remove FinaleDoor


# NPC
execute if entity @e[scores={OrangeIsland=0}] unless entity @e[tag=OrangeFinaleNPC,type=villager] run summon villager 39 42 5080 {Invulnerable:1b,VillagerData:{profession:"minecraft:none",type:"minecraft:plains",level:2},NoAI:1b,Rotation:[0f,0f],Attributes:[{Name:"generic.movementSpeed",Base:0.0}],Offers:{},Tags:["OrangeFinaleNPC"]}
execute if entity @e[scores={OrangeIsland=0}] unless entity @e[tag=OrangeFinaleFB] run summon armor_stand 38 41.55 5081 {Invisible:true,Invulnerable:true,NoGravity:true,Rotation:[180f,0f],Tags:["OrangeFinaleFB"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:sea_pickle"},Tags:["OrangeFinaleFB"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[tag=OrangeFinaleNPC,type=villager] if entity @e[tag=OrangeFinaleFB] run scoreboard players set @e[scores={OrangeIsland=0}] OrangeIsland 1


# SETUP
execute if entity @e[scores={OrangeIsland=1..4}] as @e[tag=OrangeFinaleNPC,type=drowned] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={OrangeIsland=1}] run fill 40 42 5077 40 44 5079 white_stained_glass
execute if entity @e[scores={OrangeIsland=1}] unless block 36 43 5075 red_terracotta run setblock 36 43 5075 red_terracotta
execute if entity @e[scores={OrangeIsland=1}] unless block 36 43 5076 lever[powered=false] run setblock 36 43 5076 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={OrangeIsland=1}] run fill 35 43 5075 37 43 5075 blast_furnace[lit=false,facing=south] replace blast_furnace[lit=true]
execute if entity @e[scores={OrangeIsland=1}] unless block 38 43 5081 orange_stained_glass run setblock 38 43 5081 orange_stained_glass
execute if entity @e[scores={OrangeIsland=1}] if block 36 43 5075 red_terracotta if block 36 43 5076 lever[powered=false] if block 35 43 5075 blast_furnace[lit=false] if block 37 43 5075 blast_furnace[lit=false] if block 38 43 5081 orange_stained_glass run scoreboard players set @e[scores={OrangeIsland=1}] OrangeIsland 2

execute if entity @e[scores={OrangeIsland=2}] as @e[tag=OrangeFinaleNPC,type=villager] at @s if entity @a[distance=..2] run teleport @s ^ ^ ^ facing entity @p
execute if entity @e[scores={OrangeIsland=2}] as @e[tag=OrangeFinaleNPC,type=villager] at @s unless entity @a[distance=..2] run teleport @s ^ ^ ^ facing 37 42 5082

# RUN POWER UP
execute if entity @e[scores={OrangeIsland=2}] if block 36 43 5076 lever[powered=true] run scoreboard players set @e[scores={OrangeIsland=2}] OrangeIsland 3
execute if entity @e[scores={OrangeIsland=3..199}] if block 36 43 5076 lever[powered=false] run setblock 36 43 5076 lever[face=wall,facing=south,powered=true]

scoreboard players add @e[scores={OrangeIsland=3..299}] OrangeIsland 1
scoreboard players add @e[scores={OrangeIsland=1000..}] OrangeIsland 1


# POWER UP
execute if entity @e[scores={OrangeIsland=4}] run setblock 36 43 5075 yellow_terracotta
execute if entity @e[scores={OrangeIsland=4}] run playsound block.beacon.activate master @a 39 42 5075 1 0.5 1
execute if entity @e[scores={OrangeIsland=4}] run playsound block.beacon.power_select master @a 39 42 5075 1 0.5 1
execute if entity @e[scores={OrangeIsland=60}] run playsound item.firecharge.use master @a 36 43 5075 1 0.5 0
execute if entity @e[scores={OrangeIsland=65}] run fill 35 43 5075 37 43 5075 blast_furnace[lit=true,facing=south] replace blast_furnace[lit=false]
execute if entity @e[scores={OrangeIsland=95}] run playsound entity.zombie_villager.converted master @a 39 42 5075 1 0.5 1
execute if entity @e[scores={OrangeIsland=105}] run playsound entity.iron_golem.hurt master @a 39 42 5075 1 0.7 1
execute if entity @e[scores={OrangeIsland=105}] run playsound block.ender_chest.open ambient @a 39 42 5075 1 0.7 1
execute if entity @e[scores={OrangeIsland=105}] run setblock 1032 94 2006 glowstone
execute if entity @e[scores={OrangeIsland=110}] run playsound entity.zombie.infect master @a 36 43 5075 1 0.5 1

execute if entity @e[scores={OrangeIsland=5}] run data merge entity @e[tag=OrangeFinaleNPC,limit=1] {Silent:1b}
execute if entity @e[scores={OrangeIsland=5}] at @e[tag=OrangeFinaleNPC] run playsound entity.villager.no master @a
execute if entity @e[scores={OrangeIsland=5}] as @e[tag=OrangeFinaleNPC,type=villager] at @s run teleport @s ^ ^ ^ facing 36 42 5076

execute if entity @e[scores={OrangeIsland=160}] at @e[tag=OrangeFinaleNPC] run playsound entity.villager.no master @a
execute if entity @e[scores={OrangeIsland=160}] as @e[tag=OrangeFinaleNPC,type=villager] at @s run teleport @s ^ ^ ^ facing 37 42 5082


# NPC TURNS
execute if entity @e[scores={OrangeIsland=245}] run kill @e[tag=ZombieZombo]
execute if entity @e[scores={OrangeIsland=245}] run effect give @e[tag=OrangeFinaleNPC,type=villager] invisibility 100 255 true
execute if entity @e[scores={OrangeIsland=245}] at @e[tag=OrangeFinaleNPC,type=villager] run playsound entity.drowned.ambient master @a 0.5 1 0
execute if entity @e[scores={OrangeIsland=245}] at @e[tag=OrangeFinaleNPC,type=villager] run playsound entity.zombie.converted_to_drowned hostile @a 1 1 0
execute if entity @e[scores={OrangeIsland=245}] at @e[tag=OrangeFinaleNPC,type=villager] run playsound entity.zombie_villager.cure master @a ~ ~ ~ 0.5 0.5 0
execute if entity @e[scores={OrangeIsland=245}] at @e[tag=OrangeFinaleNPC,type=villager] run particle falling_dust sea_pickle ~ ~1.4 ~ 0.3 0.6 0.3 0 500 force
execute if entity @e[scores={OrangeIsland=245}] at @e[tag=OrangeFinaleNPC] run summon drowned ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Health:0.2f,Rotation:[35f,0f],Tags:["OrangeFinaleNPC"]}
#execute if entity @e[scores={OrangeIsland=275}] run fill 40 42 5077 40 44 5079 air destroy
execute if entity @e[scores={OrangeIsland=245..}] as @e[tag=OrangeFinaleNPC,type=villager] run data merge entity @s {NoAI:0b}
execute if entity @e[scores={OrangeIsland=245..}] as @e[tag=OrangeFinaleNPC,type=villager] at @s run teleport @s ~ ~-100 ~


# POWER DOWN
execute if entity @e[scores={OrangeIsland=245}] run setblock 38 43 5081 air destroy
execute if entity @e[scores={OrangeIsland=245}] run kill @e[tag=OrangeFinaleFB]
execute if entity @e[scores={OrangeIsland=250}] run playsound block.lever.click master @a 36 43 5076 0.5 0.5 0
execute if entity @e[scores={OrangeIsland=250}] run setblock 36 43 5076 lever[face=wall,facing=south,powered=false]
execute if entity @e[scores={OrangeIsland=250}] run playsound block.beacon.deactivate master @a 39 42 5075 1 0.5 1
execute if entity @e[scores={OrangeIsland=250}] run playsound entity.iron_golem.hurt master @a 39 42 5075 1 0.5 1
execute if entity @e[scores={OrangeIsland=250}] run setblock 36 43 5075 red_terracotta
execute if entity @e[scores={OrangeIsland=250}] run fill 35 43 5075 37 43 5075 blast_furnace[lit=false,facing=south] replace blast_furnace[lit=true]


# SET UP FOR WOOL DROP
execute if entity @e[scores={OrangeIsland=250..}] if block 40 41 5078 orange_concrete unless entity @e[tag=OrangeFinaleNPC,type=drowned] run scoreboard players set @e[scores={OrangeIsland=250..300}] OrangeIsland 1000


# WOOL DROPS
execute if entity @e[scores={OrangeIsland=1002}] run setblock 10 6 110 orange_wool
execute if entity @e[scores={OrangeIsland=1002}] run fill 40 42 5077 40 44 5079 air destroy

execute if entity @e[scores={OrangeIsland=1002}] run playsound entity.evoker.cast_spell master @a 48 44 5093 1 1 1
execute if entity @e[scores={OrangeIsland=1002}] run playsound entity.ender_eye.death master @a 48 44 5093 1 0.5 1
execute if entity @e[scores={OrangeIsland=1002}] run playsound entity.player.levelup master @a 48 44 5093 1 1 1

execute if entity @e[scores={OrangeIsland=1002}] run kill @e[tag=RandomOrangeWoolAEC]
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 47 44 5092 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 48 44 5092 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 49 44 5092 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 47 44 5093 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 48 44 5093 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 49 44 5093 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 47 44 5094 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 48 44 5094 {Tags:["RandomOrangeWoolAEC"],Duration:200}
execute if entity @e[scores={OrangeIsland=1002}] run summon area_effect_cloud 49 44 5094 {Tags:["RandomOrangeWoolAEC"],Duration:200}

execute if entity @e[scores={OrangeIsland=1002}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1007}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1012}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1017}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1022}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1027}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1032}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1037}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC
execute if entity @e[scores={OrangeIsland=1042}] run tag @e[tag=RandomOrangeWoolAEC,limit=1,sort=random] add ChosenOrangeWoolAEC

execute if entity @e[scores={OrangeIsland=1002..}] at @e[tag=ChosenOrangeWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:orange_wool"},Tags:["FinaleWoolFB","OrangeWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenOrangeWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={OrangeIsland=1002..}] if block 49 44 5092 orange_wool if block 48 44 5092 orange_wool if block 47 44 5092 orange_wool if block 49 44 5093 orange_wool if block 48 44 5093 orange_wool if block 47 44 5093 orange_wool if block 49 44 5094 orange_wool if block 48 44 5094 orange_wool if block 47 44 5094 orange_wool run scoreboard objectives remove FinaleDoor
execute if entity @e[scores={OrangeIsland=1002..}] if block 49 44 5092 orange_wool if block 48 44 5092 orange_wool if block 47 44 5092 orange_wool if block 49 44 5093 orange_wool if block 48 44 5093 orange_wool if block 47 44 5093 orange_wool if block 49 44 5094 orange_wool if block 48 44 5094 orange_wool if block 47 44 5094 orange_wool run fill 40 42 5077 40 44 5079 air destroy
execute if entity @e[scores={OrangeIsland=1002..}] if block 49 44 5092 orange_wool if block 48 44 5092 orange_wool if block 47 44 5092 orange_wool if block 49 44 5093 orange_wool if block 48 44 5093 orange_wool if block 47 44 5093 orange_wool if block 49 44 5094 orange_wool if block 48 44 5094 orange_wool if block 47 44 5094 orange_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={OrangeIsland=1002..}] if block 49 44 5092 orange_wool if block 48 44 5092 orange_wool if block 47 44 5092 orange_wool if block 49 44 5093 orange_wool if block 48 44 5093 orange_wool if block 47 44 5093 orange_wool if block 49 44 5094 orange_wool if block 48 44 5094 orange_wool if block 47 44 5094 orange_wool run scoreboard objectives remove OrangeIsland

