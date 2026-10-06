####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 26 2018 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar CyanIsland
#scoreboard objectives setdisplay sidebar FinaleAnvil
#scoreboard objectives setdisplay sidebar FinaleArrows

execute if block 6 6 110 clay run scoreboard objectives add CyanIsland dummy

# SETUP BLOCKS
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] run fill 17 152 5348 21 152 5352 cyan_stained_glass replace air
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] run fill 19 112 5350 19 151 5350 air replace cyan_stained_glass_pane
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] if block 14 153 5350 lever[powered=true] run setblock 14 153 5350 lever[face=floor,facing=west,powered=false]
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] if block 14 152 5350 redstone_lamp[lit=false] run setblock 14 152 5350 redstone_lamp[lit=false]
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] unless block 1 154 5355 light_gray_wool run setblock 1 154 5355 light_gray_wool
execute if block 6 6 110 clay unless entity @e[scores={CyanIsland=10..}] unless block 3 154 5355 light_gray_wool run setblock 3 154 5355 light_gray_wool

execute if block 6 6 110 clay align x align y align z if entity @a[x=-5,y=112,z=5351,dx=4,dy=4,dz=4] run scoreboard players add @e[tag=MainFinaleAEC] CyanIsland 0


# ANVIL
execute align x align y align z if entity @a[x=2,y=128,z=5358,dx=2,dy=4,dz=2,x_rotation=-90..-60] run scoreboard objectives add FinaleAnvil dummy
execute align x align y align z unless entity @a[x=2,y=128,z=5358,dx=2,dy=4,dz=2] run scoreboard objectives remove FinaleAnvil
scoreboard players add @e[tag=MainFinaleAEC] FinaleAnvil 1
execute if entity @e[scores={FinaleAnvil=2}] align x align y align z at @p[x=2,y=128,z=5358,dx=2,dy=4,dz=2] run setblock ~ 135 ~ anvil
fill 2 128 5358 4 130 5360 air destroy


# ARROWS
kill @e[type=arrow,nbt={inGround:1b}]
execute if block 6 6 110 clay align x align y align z if entity @a[x=-23,y=141,z=5345,dx=12,dy=4,dz=4] run scoreboard objectives add FinaleArrows dummy
execute align x align y align z unless entity @a[x=-23,y=141,z=5345,dx=12,dy=4,dz=4] run scoreboard objectives remove FinaleArrows
scoreboard players add @e[tag=MainFinaleAEC] FinaleArrows 1
scoreboard players set @e[scores={FinaleArrows=20..}] FinaleArrows 0
execute if entity @e[scores={FinaleArrows=1}] run summon arrow -15 142.5 5350 {Motion:[0.0d,0.15d,-1.0d],damage:5.0,Color:-1}
execute if entity @e[scores={FinaleArrows=7}] run summon arrow -17 142.5 5344 {Motion:[0.0d,0.15d,1.0d],damage:5.0,Color:-1}
execute if entity @e[scores={FinaleArrows=15}] run summon arrow -19 142.5 5350 {Motion:[0.0d,0.15d,-1.0d],damage:5.0,Color:-1}


# WIRE CUTTERS
execute if block -27 141 5347 oak_button[powered=true] run playsound item.chorus_fruit.teleport master @a -26 142 5347 1 0.7 0
execute if block -27 141 5347 oak_button[powered=true] run playsound entity.illusioner.prepare_mirror master @a -26 142 5347 1 0.8 0
execute if block -27 141 5347 oak_button[powered=true] run particle cloud -26 142 5347 0.3 0.3 0.3 0 100
execute if block -27 141 5347 oak_button[powered=true] run summon item -26 142 5347 {Item:{id:"minecraft:shears",Count:1,tag:{Unbreakable:true,HideFlags:63,CanDestroy:["minecraft:light_gray_wool"],display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Wire Snippers\"}",Lore:['{"text":"What is this thing for again?","italic":"true","color":"dark_aqua"}']}}}}
execute if block -27 141 5347 oak_button[powered=true] run setblock -27 141 5347 oak_button[powered=false,facing=west,face=wall]



# ARCADE
execute if block 10 154 5359 iron_block unless entity @e[tag=FinaleArcadePainting1] run summon painting 10 153 5358 {Invulnerable:1b,Facing:2b,Motive:"minecraft:graham",Tags:["FinaleArcadePainting1"]}
execute if block 10 154 5359 iron_block unless entity @e[tag=FinaleArcadePainting2] run summon painting 10 153 5360 {Invulnerable:1b,Facing:0b,Motive:"minecraft:graham",Tags:["FinaleArcadePainting2"]}
execute if block 10 154 5359 iron_block unless entity @e[tag=FinaleMonitor2] run summon item_frame 9 154 5359 {Silent:true,Facing:4b,ItemRotation:0b,Invulnerable:1b,Item:{id:"minecraft:filled_map",Count:1b,tag:{map:114}},Tags:["FinaleMonitor2","FinaleMonitor"]}
execute if block 10 154 5359 iron_block unless entity @e[tag=FinaleArcadeStick] run summon armor_stand 9.2 152 5359.5 {Invisible:true,Small:false,NoGravity:true,Rotation:[90f,0f],ArmorItems:[{},{},{},{id:"minecraft:lever",Count:1b}],DisabledSlots:2039583,Tags:["FinaleArcadeStick"]}
execute if block 10 154 5359 iron_block unless entity @e[tag=FinaleArcadeButton] run summon armor_stand 9.475 153.35 5359.5  {Invisible:true,Small:true,NoGravity:true,Rotation:[90f,0f],ArmorItems:[{},{},{},{id:"minecraft:acacia_button",Count:1b}],DisabledSlots:2039583,Tags:["FinaleArcadeButton"]}



# SETS WIRE GATE
execute align x align y align z if entity @a[x=-4,y=153,z=5356,dx=2,dy=2,dz=0] run scoreboard players add @e[scores={CyanIsland=0}] CyanIsland 300

execute if block 3 154 5355 light_gray_wool run fill 6 153 5349 6 155 5351 iron_bars[north=true,south=true,west=false,east=false] replace air


# SNIP THE WIRE
execute if block 1 154 5355 air run playsound entity.enderman.death master @a -987 103 1028
execute if block 1 154 5355 air at @a[x=-10,y=153,z=5343,dx=16,dy=10,dz=17] run summon creeper ~ ~ ~ {Fuse:0,CustomName:"{\"text\":\"a wrong decision\",\"color\":\"white\"}"}
execute if block 1 154 5355 air run setblock 1 154 5355 light_gray_wool

execute if block 3 154 5355 air run playsound entity.firework_rocket.launch master @a 6 154 5350
execute if block 3 154 5355 air run fill 6 153 5349 6 155 5351 air destroy
execute if block 3 154 5355 air run clear @a shears
execute if block 3 154 5355 air run scoreboard players set @e[tag=MainFinaleAEC] CyanIsland 500
execute if block 3 154 5355 air run setblock 3 154 5355 barrier


execute if block -3 154 5347 sea_lantern unless entity @e[tag=CyanCreeper] run summon creeper -3 155 5347 {NoAI:1b,Invulnerable:1b,Tags:["CyanCreeper"]}


# PRESS LEVER
execute if entity @e[scores={CyanIsland=500}] if block 14 153 5350 lever[powered=true] run scoreboard players set @e[scores={CyanIsland=500}] CyanIsland 1000

# SET UP FOR WOOL DROP
scoreboard players add @e[scores={CyanIsland=1000..}] CyanIsland 1


# WOOL DROPS
execute if entity @e[scores={CyanIsland=1002}] run setblock 6 6 110 cyan_wool
execute if entity @e[scores={CyanIsland=1002}] run fill 17 152 5348 21 152 5352 air destroy
execute if entity @e[scores={CyanIsland=1002}] run setblock 19 111 5350 water
#execute if entity @e[scores={CyanIsland=1002}] run fill 19 112 5350 19 151 5350 cyan_stained_glass_pane

execute if entity @e[scores={CyanIsland=1002}] run playsound entity.evoker.cast_spell master @a -32 112 5347 2 1 1
execute if entity @e[scores={CyanIsland=1002}] run playsound entity.ender_eye.death master @a -32 112 5347 2 0.5 1
execute if entity @e[scores={CyanIsland=1002}] run playsound entity.player.levelup master @a -32 112 5347 3 1 1

execute if entity @e[scores={CyanIsland=1002}] run kill @e[tag=RandomCyanWoolAEC]
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -33 112 5346 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -32 112 5346 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -31 112 5346 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -33 112 5347 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -32 112 5347 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -31 112 5347 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -33 112 5348 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -32 112 5348 {Tags:["RandomCyanWoolAEC"],Duration:200}
execute if entity @e[scores={CyanIsland=1002}] run summon area_effect_cloud -31 112 5348 {Tags:["RandomCyanWoolAEC"],Duration:200}

execute if entity @e[scores={CyanIsland=1002}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1007}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1012}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1017}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1022}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1027}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1032}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1037}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC
execute if entity @e[scores={CyanIsland=1042}] run tag @e[tag=RandomCyanWoolAEC,limit=1,sort=random] add ChosenCyanWoolAEC

execute if entity @e[scores={CyanIsland=1002..}] at @e[tag=ChosenCyanWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:cyan_wool"},Tags:["FinaleWoolFB","CyanWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenCyanWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={CyanIsland=1002..}] if block -33 112 5346 cyan_wool if block -32 112 5346 cyan_wool if block -31 112 5346 cyan_wool if block -33 112 5347 cyan_wool if block -32 112 5347 cyan_wool if block -31 112 5347 cyan_wool if block -33 112 5348 cyan_wool if block -32 112 5348 cyan_wool if block -31 112 5348 cyan_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={CyanIsland=1002..}] if block -33 112 5346 cyan_wool if block -32 112 5346 cyan_wool if block -31 112 5346 cyan_wool if block -33 112 5347 cyan_wool if block -32 112 5347 cyan_wool if block -31 112 5347 cyan_wool if block -33 112 5348 cyan_wool if block -32 112 5348 cyan_wool if block -31 112 5348 cyan_wool run scoreboard objectives remove FinaleAnvil
execute if entity @e[scores={CyanIsland=1002..}] if block -33 112 5346 cyan_wool if block -32 112 5346 cyan_wool if block -31 112 5346 cyan_wool if block -33 112 5347 cyan_wool if block -32 112 5347 cyan_wool if block -31 112 5347 cyan_wool if block -33 112 5348 cyan_wool if block -32 112 5348 cyan_wool if block -31 112 5348 cyan_wool run scoreboard objectives remove FinaleArrows
execute if entity @e[scores={CyanIsland=1002..}] if block -33 112 5346 cyan_wool if block -32 112 5346 cyan_wool if block -31 112 5346 cyan_wool if block -33 112 5347 cyan_wool if block -32 112 5347 cyan_wool if block -31 112 5347 cyan_wool if block -33 112 5348 cyan_wool if block -32 112 5348 cyan_wool if block -31 112 5348 cyan_wool run scoreboard objectives remove CyanIsland

