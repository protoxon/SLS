####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JANUARY 26 2018 / SEPTEMBER 15 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar YellowIsland

execute if block 9 6 110 clay align x align y align z if entity @a[x=79,y=49,z=5142,dx=10,dy=10,dz=10] run scoreboard objectives add YellowIsland dummy
scoreboard players add @e[tag=MainFinaleAEC] YellowIsland 0



# SQUID DROPS
execute if entity @e[scores={YellowIsland=0}] run summon squid 84 100 5147 {Invulnerable:1b,Air:32767s,Health:1f,PersistenceRequired:1b,Attributes:[{Name:"generic.maxHealth",Base:5.0d}],Tags:["FinaleSquid"]}
execute if entity @e[tag=FinaleSquid] run scoreboard players set @e[scores={YellowIsland=0}] YellowIsland 1
execute if entity @e[tag=FinaleSquid,nbt={OnGround:1b}] run scoreboard players set @e[scores={YellowIsland=1}] YellowIsland 2
execute if entity @e[scores={YellowIsland=2}] as @e[tag=FinaleSquid,nbt={Invulnerable:1b}] run data merge entity @s {Invulnerable:0b}
execute if entity @e[scores={YellowIsland=2}] unless entity @e[tag=FinaleSquid] run scoreboard players set @e[scores={YellowIsland=2}] YellowIsland 3


scoreboard players add @e[scores={YellowIsland=3..49}] YellowIsland 1
scoreboard players add @e[scores={YellowIsland=1000..}] YellowIsland 1

# SETUP
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 84 50 5164 84 50 5164 yellow_stained_glass
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 82 49 5156 86 52 5156 iron_bars[east=true,west=true,north=false,south=false] replace air
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 82 48 5156 86 48 5156 polished_andesite replace iron_bars
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 82 44 5162 86 48 5162 polished_andesite
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 83 49 5162 85 52 5162 yellow_concrete_powder replace air
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 82 45 5166 86 48 5166 polished_andesite
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] run fill 82 49 5166 86 52 5166 sand replace air

execute if block 84 50 5164 yellow_stained_glass unless entity @e[tag=YellowFinaleAS] run summon armor_stand 84.43 48.8 5164.25  {Marker:0b,Invisible:1b,Invulnerable:1b,ShowArms:1b,NoGravity:1b,HandItems:[{},{id:"minecraft:golden_chestplate",Count:1b}],Pose:{RightArm:[0f,300f,0f],LeftArm:[270f,90f,0f]},DisabledSlots:2039583,Rotation:[270f,0f],Tags:["YellowFinaleAS"]}


# READY MOBS
execute as @e[type=slime,nbt={Size:0}] at @s run teleport @s ~ ~-100 ~
execute as @e[type=magma_cube,nbt={Size:0}] at @s run teleport @s ~ ~-100 ~
execute unless entity @e[tag=YellowFinaleEvoker] run kill @e[type=vex]
execute unless entity @e[tag=YellowFinaleStray] run kill @e[tag=YellowFinaleSpider]
execute unless entity @e[tag=YellowFinaleSpider] run kill @e[tag=YellowFinaleStray]
execute unless entity @e[tag=YellowFinaleZombieHorse] run kill @e[tag=YellowFinaleBabyZombie]
execute unless entity @e[tag=YellowFinaleBabyZombie] run kill @e[tag=YellowFinaleZombieHorse]


execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleSlime] run summon slime 86.0 49.0 5158.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Size:1,Rotation:[180f,0f],Tags:["YellowFinaleSlime","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleZombie] run summon zombie 85.0 49.0 5158.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinaleZombie","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleSkeleton] run summon skeleton 84.0 49.0 5158.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,HandItems:[{id:"minecraft:bow",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinaleSkeleton","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleCaveSpider] run summon creeper 83.0 49.0 5158.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,ExplosionRadius:0b,Rotation:[180f,0f],Tags:["YellowFinaleCaveSpider","YellowFinaleMob"]}

execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleMagmaCube] run summon magma_cube 86.0 49.0 5159.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Size:1,Rotation:[180f,0f],Tags:["YellowFinaleMagmaCube","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleWitch] run summon witch 85.0 49.0 5159.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Rotation:[180f,0f],Tags:["YellowFinaleWitch","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleSpider] run summon stray 84.0 49.0 5159.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,HandItems:[{id:"minecraft:bow",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:smoker",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinaleStray","YellowFinaleMob"],Passengers:[{id:"minecraft:cave_spider",Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Rotation:[180f,0f],Tags:["YellowFinaleSpider","YellowFinaleMob"]}]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleBabyZombie] run summon zombie_horse 83.0 49.0 5159.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Rotation:[180f,0f],Age:-9999999,Tame:1b,Tags:["YellowFinaleZombieHorse","YellowFinaleMob"],Passengers:[{id:"minecraft:zombie_villager",Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,IsBaby:1b,ArmorItems:[{},{},{},{id:"minecraft:stone_button",Count:1b}],Tags:["YellowFinaleBabyZombie","YellowFinaleMob"]}]}

execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinalePillager] run summon pillager 86.0 49.0 5160.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,HandItems:[{id:"minecraft:crossbow",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinalePillager","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleVindicator] run summon vindicator 85.0 49.0 5160.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,HandItems:[{id:"minecraft:iron_axe",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinaleVindicator","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleEvoker] run summon evoker 84.0 49.0 5160.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,Rotation:[180f,0f],Tags:["YellowFinaleEvoker","YellowFinaleMob"]}
execute if block ~ ~-1 ~ redstone_block unless entity @e[scores={YellowIsland=29..}] unless entity @e[tag=YellowFinaleWitherSkeleton] run summon wither_skeleton 83.0 49.0 5160.0 {Attributes:[{Name:"generic.maxHealth",Base:0.5}],Health:0.5f,NoAI:1b,HandItems:[{id:"minecraft:stone_sword",Count:0b},{id:"minecraft:stone_sword",Count:1b}],ArmorItems:[{},{},{id:"minecraft:elytra",Count:1b},{id:"minecraft:dragon_head",Count:1b}],Rotation:[180f,0f],Tags:["YellowFinaleWitherSkeleton","YellowFinaleMob"]}

execute if entity @e[scores={YellowIsland=..37}] as @e[tag=YellowFinaleMob] at @s run teleport @s ^ ^ ^ facing entity @p




# GATE DROPS
execute if entity @e[scores={YellowIsland=30}] run playsound block.ender_chest.close master @a 84 52 5156 1 0.5 0

execute if entity @e[scores={YellowIsland=32}] run fill 82 52 5156 86 52 5156 air
execute if entity @e[scores={YellowIsland=32}] run fill 82 47 5156 86 47 5156 polished_andesite
execute if entity @e[scores={YellowIsland=32}] run fill 82 48 5156 86 51 5156 iron_bars[east=true,west=true]

execute if entity @e[scores={YellowIsland=34}] run fill 82 51 5156 86 51 5156 air
execute if entity @e[scores={YellowIsland=34}] run fill 82 46 5156 86 46 5156 polished_andesite
execute if entity @e[scores={YellowIsland=34}] run fill 82 47 5156 86 50 5156 iron_bars[east=true,west=true]

execute if entity @e[scores={YellowIsland=36}] run fill 82 50 5156 86 50 5156 air
execute if entity @e[scores={YellowIsland=36}] run fill 82 45 5156 86 45 5156 polished_andesite
execute if entity @e[scores={YellowIsland=36}] run fill 82 46 5156 86 49 5156 iron_bars[east=true,west=true]

execute if entity @e[scores={YellowIsland=38}] run fill 82 49 5156 86 49 5156 air
execute if entity @e[scores={YellowIsland=38}] run fill 82 44 5156 86 44 5156 polished_andesite
execute if entity @e[scores={YellowIsland=38}] run fill 82 45 5156 86 48 5156 iron_bars[east=true,west=true]

execute if entity @e[scores={YellowIsland=38}] run playsound entity.blaze.hurt master @a 84 49 5156 1 0.5 0

execute if entity @e[scores={YellowIsland=38}] as @e[tag=YellowFinaleMob] run data merge entity @s {NoAI:0b}


execute align x align y align z as @e[type=cave_spider,x=82,y=49,z=5137,dx=4,dy=1,dz=-5] run data merge entity @s {Motion:[0.0d,0.6d,0.7d]}
execute align x align y align z as @e[type=spider,x=82,y=49,z=5137,dx=4,dy=1,dz=-5] run data merge entity @s {Motion:[0.0d,0.6d,0.7d]}
execute align x align y align z run tag @e[type=cave_spider,x=72,y=54,z=5135,dx=24,dy=2,dz=24] add PullBack
execute align x align y align z run tag @e[type=spider,x=72,y=54,z=5135,dx=24,dy=2,dz=24] add PullBack
execute align x align y align z as @e[tag=PullBack,x=72,y=54,z=5135,dx=24,dy=2,dz=24] run data merge entity @s {NoAI:1b}
execute as @e[tag=PullBack] at @s run teleport @s ^ ^-0.1 ^1.5 facing 84 48 5147
execute as @e[tag=PullBack] at @s if block ~1 ~ ~ air if block ~-1 ~ ~ air if block ~ ~ ~1 air if block ~ ~ ~-1 air if block ~1 ~ ~1 air if block ~-1 ~ ~1 air if block ~1 ~ ~1 air if block ~1 ~ ~-1 air run data merge entity @s {NoAI:0b}
execute as @e[tag=PullBack] at @s if block ~1 ~ ~ air if block ~-1 ~ ~ air if block ~ ~ ~1 air if block ~ ~ ~-1 air if block ~1 ~ ~1 air if block ~-1 ~ ~1 air if block ~1 ~ ~1 air if block ~1 ~ ~-1 air run tag @s remove PullBack

##execute align x align y align z as @e[type=spider,x=75,y=55,z=5135,dx=18,dy=2,dz=18] at @s run teleport @s ^ ^ ^1.2 facing 84 48 5147


# SET UP FOR WOOL DROP
execute if entity @e[scores={YellowIsland=50}] if block 84 48 5159 oak_planks unless entity @e[tag=YellowFinaleMob] run scoreboard players set @e[scores={YellowIsland=50}] YellowIsland 500

execute if entity @e[scores={YellowIsland=500}] run fill 83 45 5162 85 48 5162 air replace polished_andesite
scoreboard players set @e[scores={YellowIsland=500}] YellowIsland 501
execute if entity @e[scores={YellowIsland=501}] run effect clear @a

execute if entity @e[scores={YellowIsland=501}] align x align y align z if entity @a[x=83,y=49,z=5163,dx=2,dy=0,dz=2] run scoreboard players set @e[scores={YellowIsland=501}] YellowIsland 1000


# WOOL DROPS
execute if entity @e[scores={YellowIsland=1002}] run setblock 9 6 110 yellow_wool
execute if entity @e[scores={YellowIsland=1002}] run setblock 84 50 5164 air destroy
execute if entity @e[scores={YellowIsland=1002}] run fill 82 45 5166 86 48 5166 air
execute if entity @e[scores={YellowIsland=1002}] run summon item 84 50 5164 {Item:{id:"minecraft:leather_chestplate",Count:1b,tag:{HideFlags:38,display:{Name:"{\"text\":\"Lame Yellow Shirt\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"false\"}",Lore:['{"text":"The shirt reads:","italic":"false","color":"gold"}','{"text":"\'I finished Diversity 3 and all","italic":"true","color":"gold"}','{"text":"I got was this lousy T-shirt\'","italic":"true","color":"gold"}'],color:16776960},Unbreakable:1b}},PickupDelay:30,Motion:[0.0d,0.2d,0.0d]}
execute if entity @e[scores={YellowIsland=1002}] run kill @e[tag=YellowFinaleAS]

execute if entity @e[scores={YellowIsland=1002}] run playsound entity.evoker.cast_spell master @a 75 51 5171 1 1 1
execute if entity @e[scores={YellowIsland=1002}] run playsound entity.ender_eye.death master @a 75 51 5171 1 0.5 1
execute if entity @e[scores={YellowIsland=1002}] run playsound entity.player.levelup master @a 75 51 5171 1 1 1

execute if entity @e[scores={YellowIsland=1002}] run kill @e[tag=RandomYellowWoolAEC]
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 74 51 5170 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 75 51 5170 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 76 51 5170 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 74 51 5171 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 75 51 5171 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 76 51 5171 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 74 51 5172 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 75 51 5172 {Tags:["RandomYellowWoolAEC"],Duration:200}
execute if entity @e[scores={YellowIsland=1002}] run summon area_effect_cloud 76 51 5172 {Tags:["RandomYellowWoolAEC"],Duration:200}

execute if entity @e[scores={YellowIsland=1002}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1007}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1012}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1017}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1022}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1027}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1032}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1037}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC
execute if entity @e[scores={YellowIsland=1042}] run tag @e[tag=RandomYellowWoolAEC,limit=1,sort=random] add ChosenYellowWoolAEC

execute if entity @e[scores={YellowIsland=1002..}] at @e[tag=ChosenYellowWoolAEC] run summon falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:yellow_wool"},Tags:["FinaleWoolFB","YellowWoolFB"],DropItem:true,Time:-2147483648}
kill @e[tag=ChosenYellowWoolAEC]
execute as @e[tag=FinaleWoolFB] at @s if block ~ ~-1 ~ bedrock run playsound block.wool.step block @a



# COMPLETION
execute if entity @e[scores={YellowIsland=1002..}] if block 74 51 5170 yellow_wool if block 75 51 5170 yellow_wool if block 76 51 5170 yellow_wool if block 74 51 5171 yellow_wool if block 75 51 5171 yellow_wool if block 76 51 5171 yellow_wool if block 74 51 5172 yellow_wool if block 75 51 5172 yellow_wool if block 76 51 5172 yellow_wool run setblock ~ ~-1 ~ stone
execute if entity @e[scores={YellowIsland=1002..}] if block 74 51 5170 yellow_wool if block 75 51 5170 yellow_wool if block 76 51 5170 yellow_wool if block 74 51 5171 yellow_wool if block 75 51 5171 yellow_wool if block 76 51 5171 yellow_wool if block 74 51 5172 yellow_wool if block 75 51 5172 yellow_wool if block 76 51 5172 yellow_wool run scoreboard objectives remove YellowIsland

