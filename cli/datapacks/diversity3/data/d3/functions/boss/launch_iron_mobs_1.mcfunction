####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMEBR 29 2018 / AUGUST 11 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################

#scoreboard objectives setdisplay sidebar IronAttack

difficulty easy

scoreboard players add @e[tag=MainBossAEC,scores={IronAttack=0..}] IronAttack 1
execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1005 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-2.0,1.0,-3.0],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob1","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS1","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1006 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-1.0,1.0,-3.3],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob2","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS2","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1007 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.0,1.0,-3.00],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob3","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS3","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1008 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.6,1.0,-3.1],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob4","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS4","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1009 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-2.1,1.0,-3.9],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob5","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS5","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1010 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-1.7,1.0,-3.6],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob6","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS6","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1011 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-0.3,1.0,-3.5],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob7","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS7","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1012 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.2,1.0,-3.7],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob8","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS8","Level3Mob"]}]}

execute if entity @e[tag=MainBossAEC,scores={IronAttack=1}] run summon zombie -1013 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.9,1.0,-3.3],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob9","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS9","Level3Mob"]}]}


scoreboard players add @e[tag=IronOreAS] IronAttack 1
execute if entity @e[tag=IronOreMob1] run scoreboard players set @e[tag=IronOreAS1,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob2] run scoreboard players set @e[tag=IronOreAS2,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob3] run scoreboard players set @e[tag=IronOreAS3,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob4] run scoreboard players set @e[tag=IronOreAS4,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob5] run scoreboard players set @e[tag=IronOreAS5,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob6] run scoreboard players set @e[tag=IronOreAS6,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob7] run scoreboard players set @e[tag=IronOreAS7,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob8] run scoreboard players set @e[tag=IronOreAS8,nbt=!{OnGround:1b}] IronAttack 0
execute if entity @e[tag=IronOreMob9] run scoreboard players set @e[tag=IronOreAS9,nbt=!{OnGround:1b}] IronAttack 0




execute if entity @e[tag=IronOreAS1,scores={IronAttack=200}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1
execute if entity @e[tag=IronOreAS2,scores={IronAttack=200}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1
execute if entity @e[tag=IronOreAS3,scores={IronAttack=200}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1
execute if entity @e[tag=IronOreAS4,scores={IronAttack=150}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1


execute if entity @e[tag=IronOreAS1,scores={IronAttack=200}] run summon zombie -1005 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-2.0,1.0,-3.0],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob1","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS1","Level3Mob"]}]}

execute if entity @e[tag=IronOreAS2,scores={IronAttack=200}] run summon zombie -1006 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-1.0,1.0,-3.3],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob2","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS2","Level3Mob"]}]}

execute if entity @e[tag=IronOreAS3,scores={IronAttack=200}] run summon zombie -1007 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.0,1.0,-3.00],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob3","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS3","Level3Mob"]}]}

execute if entity @e[tag=IronOreAS4,scores={IronAttack=150}] run summon zombie -1008 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[0.6,1.0,-3.1],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob4","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS4","Level3Mob"]}]}

#execute if entity @e[tag=IronOreAS5,scores={IronAttack=100}] run summon zombie -1009 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-2.1,1.0,-3.9],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob5","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS5","Level3Mob"]}]}

#execute if entity @e[tag=IronOreAS6,scores={IronAttack=100}] run summon zombie -1010 73 -947 {CustomName:"{\"text\":\"an angry iron ore\",\"color\":\"gray\"}",CustomNameVisible:false,Health:14f,Attributes:[{Name:generic.maxHealth,Base:14.0},{Name:generic.movementSpeed,Base:0.3},{Name:generic.attackDamage,Base:10.0}],Motion:[-1.7,1.0,-3.6],Rotation:[180f,0f],Silent:true,ArmorItems:[{},{},{},{id:"minecraft:iron_ore",Count:1b}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SilentBlock","IronOreMob","IronOreMob6","Level3Mob"],Passengers:[{id:"minecraft:armor_stand",Invisible:true,Marker:0b,Invulnerable:true,Silent:true,Small:true,Tags:["BossMob","IronOreAS","IronOreAS6","Level3Mob"]}]}


kill @e[tag=IronOreAS,scores={IronAttack=301..}]
