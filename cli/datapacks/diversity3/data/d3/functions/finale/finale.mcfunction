####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# JANUARY 24 2019 / AUGUST 24 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

execute unless entity @e[tag=MainFinaleAEC] run summon area_effect_cloud 8 2 104 {Tags:["MainFinaleAEC"],Duration:2147483647}


# BRING STRAGGLERS
execute if block 1 4 2 light_blue_wool run gamemode adventure @a[tag=!InFinale,tag=!D3Admin]
execute if block 1 4 2 light_blue_wool as @a align x align y align z unless entity @s[x=-87,y=0,z=813,dx=220,dy=255,dz=300] run spawnpoint @s[tag=!InFinale] 0 34 4998
execute if block 1 4 2 light_blue_wool as @a align x align y align z unless entity @s[x=-87,y=0,z=813,dx=220,dy=255,dz=300] run teleport @s[tag=!InFinale] -5 34 4997 321 0
execute if block 1 4 2 light_blue_wool as @a align x align y align z unless entity @s[x=-87,y=0,z=813,dx=220,dy=255,dz=300] run tag @s add InFinale


# ENDER PADS
function d3:finale/ender_pads


# SPAWNPOINT PADS
function d3:finale/spawnpoint_pads
execute align x align y align z as @a[x=0,y=34,z=4998,dx=0,dy=0,dz=0] run scoreboard players reset @s FinaleDeaths

execute unless block 0 33 5000 hay_block run setblock 0 33 5000 hay_block
execute unless block 0 34 5000 campfire[lit=true] run setblock 0 34 5000 campfire[lit=true]


# MONITORS
execute if entity @e[tag=FinaleMonitor,nbt=!{ItemRotation:0b}] as @e[tag=FinaleMonitor,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}


# ACTIVATE ORANGE COMMANDS
execute if block 15 35 5020 white_wool if block 10 2 110 clay run setblock 10 2 110 redstone_block

# ACTIVATE YELLOW COMMANDS
execute if block 48 44 5093 orange_wool if block 9 2 110 clay run setblock 9 2 110 redstone_block

# ACTIVATE LIME COMMANDS
execute if block 75 51 5171 yellow_wool if block 8 2 110 clay run setblock 8 2 110 redstone_block

# ACTIVATE PINK COMMANDS
execute if block 94 62 5262 lime_wool if block 7 2 110 clay run setblock 7 2 110 redstone_block

# ACTIVATE CYAN COMMANDS
execute if block 58 89 5330 pink_wool if block 6 2 110 clay run setblock 6 2 110 redstone_block

# ACTIVATE PURPLE COMMANDS
execute if block -32 112 5347 cyan_wool if block 5 2 110 clay run setblock 5 2 110 redstone_block

# ACTIVATE BLUE COMMANDS
execute if block -136 107 5188 purple_wool if block 4 2 110 clay run setblock 4 2 110 redstone_block

# ACTIVATE BROWN COMMANDS
execute if block -154 139 5114 blue_wool if block 3 2 110 clay run setblock 3 2 110 redstone_block

# ACTIVATE RED COMMANDS
execute if block -154 156 5011 brown_wool if block 2 2 110 clay run setblock 2 2 110 redstone_block

# ACTIVATE BLACK COMMANDS
execute if block -82 171 4971 red_wool if block 1 2 110 clay run setblock 1 2 110 redstone_block


# SPECIAL THANKS MECHANIC
execute if block 1 2 110 stone run function d3:finale/testers


# CHURCH COMMANDS
execute unless block 1 2 110 stone if block -36 188 4847 air run clone 4 10 102 12 16 106 -40 188 4847
execute if block 1 2 110 stone unless block -36 188 4847 air align x align y align z if entity @a[x=-40,y=188,z=4847,dx=8,dy=3,dz=11] run scoreboard objectives add FinaleChurchDoor dummy
execute if block 1 2 110 stone unless block -36 188 4847 air align x align y align z if entity @a[x=-40,y=188,z=4847,dx=8,dy=3,dz=11] run scoreboard players add @e[tag=MainFinaleAEC] FinaleChurchDoor 0
execute if entity @e[scores={FinaleChurchDoor=0..}] run function d3:finale/church_door


# RUN LIFETIME STATS DISPLAY
execute if entity @e[scores={FinaleChurchDoor=100}] run scoreboard objectives add FinalStatTimer dummy
scoreboard players add @e[tag=MainFinaleAEC] FinalStatTimer 1
scoreboard players set @e[scores={FinalStatTimer=161..}] FinalStatTimer 0
execute if entity @e[scores={FinalStatTimer=2}] run scoreboard objectives setdisplay sidebar LifeTimeKills
execute if entity @e[scores={FinalStatTimer=80}] run scoreboard objectives setdisplay sidebar LifeTimeDeaths
#scoreboard players add @a LifeTimeKills 0
#scoreboard players add @a LifeTimeDeaths 0


# LOAD NPCS
execute if block 1 2 110 stone if block -36 194 4785 blue_stained_glass_pane run function d3:finale/load_npcs


# FINALIZE
#scoreboard objectives setdisplay sidebar FinishD3
execute if entity @e[tag=FinaleQ] as @e[tag=FinaleQ] at @s if entity @a[distance=..10] run scoreboard objectives add FinishD3 dummy
scoreboard players add @e[tag=MainFinaleAEC] FinishD3 0
scoreboard players add @e[scores={FinishD3=0..1500}] FinishD3 1
execute if entity @e[scores={FinishD3=50}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"You've done it.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=100}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"You've actually done it!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=250}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"The Monument is finally complete!","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=400}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"This is a dream come true.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=550}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"You truly are a hero.","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=700}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"So we have one last gift for you...","color":"none","bold":false,"underlined":false}]
execute if entity @e[scores={FinishD3=850}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"But you must tell us, which challenge did you enjoy the most?","color":"none","bold":false,"underlined":false}]

execute unless entity @e[scores={FinishD3=898..}] if block -36 191 4787 shulker_box run setblock -36 191 4787 air
execute if entity @e[scores={FinishD3=1099}] run playsound entity.shulker.teleport master @a -36 191 4787
execute if entity @e[scores={FinishD3=1099}] run setblock -36 191 4787 shulker_box{Items:[{Slot:13b,id:"minecraft:dirt",Count:1b,tag:{FinaleDirt:1b}}]}
execute if entity @e[scores={FinishD3=1090..1110}] run particle portal -36 191.5 4787 0.1 0.1 0.1 1 150 force
execute if entity @e[scores={FinishD3=1110..}] run particle portal -36 191.5 4787 0.1 0.1 0.1 1 1 force
execute if entity @e[scores={FinishD3=1110}] run tellraw @a ["",{"text":"<qmagnet> ","color":"red","bold":false},{"text":"Ah yes! It has arrived. Take your prize, and your journey will be complete.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run effect give @a blindness 16 255 true
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run effect give @a night_vision 10 255 true
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run difficulty peaceful
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a leather_chestplate
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a ender_pearl
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a elytra
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_13
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_cat
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_blocks
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_chirp
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_far
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_mall
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_mellohi
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_stal
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_strad
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_ward
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_11
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run clear @a music_disc_wait
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run setblock 1 4 2 end_stone
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run setblock 1 4 1 podzol
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run setblock 14 2 110 clay
execute if entity @e[scores={FinishD3=1110..}] if entity @a[nbt={Inventory:[{tag:{FinaleDirt:1b}}]}] run teleport @a 14 4 97 0 -90




### ON GOING COMMANDS ###

# END GATEWAY TP (PARKOUR)
execute if block 7 6 110 pink_wool align x align y align z as @a[x=78,y=141,z=5316,dx=2,dy=4,dz=0] run teleport @s 74 91 5328 90 0

# CYAN LEVITATION POLES (ESCAPE)
execute align x align y align z run effect give @a[x=-3,y=112,z=5353,dx=0,dy=15,dz=0] levitation 1 10
#execute if block 19 112 5350 cyan_stained_glass_pane run effect give @a[x=19,y=112,z=5350,dx=0,dy=33,dz=0] levitation 1 10
execute as @e[tag=CyanCreeper] at @s run teleport @s ^ ^ ^ facing entity @p

# PURPLE ELYTRA
execute as @e[type=item,nbt={Item:{id:"minecraft:elytra"},OnGround:1b}] unless entity @s[x=-87,y=34,z=813,dx=220,dy=72,dz=300] run kill @s

execute as @a[tag=HasWings] align x align y align z unless entity @s[x=-77,y=137,z=5332,dx=0,dy=1,dz=0] run tag @s remove HasWings
execute align x align y align z run tag @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,nbt={Inventory:[{id:"minecraft:elytra"}]}] add HasWings
execute align x align y align z if entity @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] run particle dust 1 0 1 1 -77 137.7 5332 0.3 0.4 0.3 0 300 force
execute align x align y align z run tellraw @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] ["",{"text":"▜ Elytra Obtained ▛","color":"light_purple","bold":false}]
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] at @s run playsound entity.ender_dragon.flap master @s ~ ~ ~ 1 1 0
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] at @s run playsound block.end_portal_frame.fill master @s ~ ~ ~ 0.5 0.5 0
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] at @s run playsound entity.puffer_fish.death master @s ~ ~ ~ 0.5 0.5 1
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] at @s run playsound entity.illusioner.prepare_blindness master @s ~ ~ ~ 1.2 0.7 1
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] run give @s[nbt={Inventory:[{Slot:102b,Count:1b}]},nbt=!{Inventory:[{id:"minecraft:elytra"}]}] elytra{Unbreakable:1b,HideFlags:4,display:{Name:"{\"text\":\"Elytra\",\"italic\":\"false\",\"color\":\"dark_purple\",\"bold\":\"true\"}"}}
execute align x align y align z run tag @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,nbt={Inventory:[{id:"minecraft:elytra"}]}] add HasWings
execute align x align y align z as @a[x=-77,y=137,z=5332,dx=0,dy=1,dz=0,tag=!HasWings] run replaceitem entity @s[nbt=!{Inventory:[{Slot:102b,Count:1b}]},nbt=!{Inventory:[{id:"minecraft:elytra"}]}] armor.chest elytra{Unbreakable:1b,HideFlags:4,display:{Name:"{\"text\":\"Elytra\",\"italic\":\"false\",\"color\":\"dark_purple\",\"bold\":\"true\"}"}}

execute align x align y align z as @a[x=-140,y=105,z=5198,dx=8,dy=0,dz=8] at @s if block ~ ~-1 ~ purple_concrete run clear @s elytra
clear @a[tag=EnderPad] elytra

# BLUE LEVITATION POLE (DROPPER)
execute align x align y align z run effect give @a[x=-153,y=123,z=5163,dx=0,dy=110,dz=0] levitation 1 10