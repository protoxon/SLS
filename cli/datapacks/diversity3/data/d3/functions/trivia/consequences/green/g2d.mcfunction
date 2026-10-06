####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 25 2018 / JULY 10 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1023 67 1000

difficulty hard

#scoreboard objectives setdisplay sidebar Incorrect_G2D
#scoreboard objectives setdisplay sidebar G2DFishCaught
#scoreboard objectives setdisplay sidebar G2DGuardianAge

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_G2D dummy
execute align x align y align z if entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_G2D 1

execute if entity @e[scores={Incorrect_G2D=1..}] run gamerule naturalRegeneration false

execute if entity @e[scores={Incorrect_G2D=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_G2D=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_G2D=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_G2D=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_G2D=1}] run title @a subtitle {"text":"Catching a fish earns you 1-6 XP", "color":"white"}
execute if entity @e[scores={Incorrect_G2D=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Fishing gives you a max of 6 XP. You obviously need more experience, so let's catch something.","color":"red","bold":false}]

fill 1105 59 1073 1105 59 1075 oak_slab[type=top,waterlogged=true] replace oak_slab[waterlogged=false]

execute if entity @e[scores={Incorrect_G2D=1}] as @e[tag=G2DGuardian] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_G2D=1}] run setblock 1109 60 1077 air
execute if entity @e[scores={Incorrect_G2D=1}] run gamerule naturalRegeneration false
execute if entity @e[scores={Incorrect_G2D=2}] run setblock 1109 60 1077 chest[facing=west]{Items:[{Slot: 11b, id: "minecraft:fishing_rod", Count: 1b}, {Slot: 13b, id: "minecraft:fishing_rod", Count: 1b}, {Slot: 15b, id: "minecraft:fishing_rod", Count: 1b}]}

execute if entity @e[scores={Incorrect_G2D=1}] run scoreboard objectives add G2DFishCaught minecraft.custom:minecraft.fish_caught

execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:cod"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:salmon"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:tropical_fish"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:pufferfish"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:lily_pad"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:bone"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:potion"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:bow"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:name_tag"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:saddle"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:enchanted_book"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:nautilus_shell"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:bowl"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:leather"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:leather_boots"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:stick"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:ink_sac"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:tripwire_hook"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:rotten_flesh"}}] add G2DFish
execute align x align y align z run tag @e[type=item,x=1095,y=54,z=1067,dx=24,dy=24,dz=24,nbt={Item:{id:"minecraft:string"}}] add G2DFish

execute if entity @e[tag=G2DFish] run scoreboard objectives add G2DFishCaught minecraft.custom:minecraft.fish_caught

execute at @e[tag=G2DFish] run summon elder_guardian ~ ~ ~ {Motion:[0d,0.5d,0d],NoAI:true,Tags:["G2DGuardian"],Rotation:[180f,0f],CustomName:"{\"text\":\"a very puffy pufferfish\",\"color\":\"white\"}",CustomNameVisible:false}
execute if entity @e[tag=G2DFish] run kill @e[tag=G2DFish]
execute if entity @a[scores={G2DFishCaught=2..5}] at @e[tag=G2DGuardian,nbt={NoAI:1b}] run playsound entity.player.splash hostile @a ~ ~ ~
execute if entity @a[scores={G2DFishCaught=2..5}] at @e[tag=G2DGuardian,nbt={NoAI:1b}] run playsound entity.elder_guardian.ambient_land hostile @a ~ ~ ~
execute if entity @a[scores={G2DFishCaught=2..5}] at @e[tag=G2DGuardian,nbt={NoAI:1b}] run playsound entity.elder_guardian.death_land hostile @a ~ ~ ~

execute if entity @a[scores={G2DFishCaught=1..10}] as @e[tag=G2DGuardian] at @s run teleport @s ^ ^ ^1.5 facing entity @p[scores={G2DFishCaught=2..}]
execute at @p[scores={G2DFishCaught=10..}] as @e[tag=G2DGuardian,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}


# FAILSAFE FOR NOAI GUARDIANS
execute if entity @e[tag=G2DGuardian] run scoreboard objectives add G2DGuardianAge dummy
execute unless entity @e[tag=G2DGuardian] run scoreboard objectives remove G2DGuardianAge
scoreboard players add @e[tag=G2DGuardian] G2DGuardianAge 1
execute at @e[scores={G2DGuardianAge=10..}] as @e[tag=G2DGuardian,nbt={NoAI:1b}] run data merge entity @s {NoAI:false}



scoreboard players add @a[scores={G2DFishCaught=1..}] G2DFishCaught 1
scoreboard players reset @a[scores={G2DFishCaught=30..}] G2DFishCaught

# END SAFEGUARD
execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives add G2D_End dummy
execute align x align y align z if entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove G2D_End
execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]


scoreboard players add @e[tag=MainTriviaAEC] G2D_End 1

execute if entity @e[scores={G2D_End=25..}] run gamerule naturalRegeneration true
execute if entity @e[scores={G2D_End=25..}] run kill @e[tag=G2DGuardian]

execute if entity @e[scores={G2D_End=25..}] run clear @a
execute if entity @e[scores={G2D_End=25..}] run experience set @a[tag=!WrongAnswer] 0 levels
execute if entity @e[scores={G2D_End=25..}] run experience set @a[tag=!WrongAnswer] 0 points
execute if entity @e[scores={G2D_End=25..}] run scoreboard objectives remove Incorrect_G2D
execute if entity @e[scores={G2D_End=25..}] run scoreboard objectives remove G2DFishCaught
execute if entity @e[scores={G2D_End=25..}] run scoreboard objectives remove G2DGuardianAge
execute if entity @e[scores={G2D_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={G2D_End=25..}] run scoreboard objectives remove G2D_End

#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run gamerule naturalRegeneration true
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run kill @e[tag=G2DGuardian]
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run tag @a remove WrongAnswer
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove FishCaught
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run scoreboard objectives remove Incorrect_G2D
#clear @a[tag=!WrongAnswer]
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run clear @a
#execute align x align y align z unless entity @a[x=1095,y=54,z=1067,dx=24,dy=24,dz=24] run setblock 43 10 46 clay
