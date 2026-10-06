####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 30 2018 / MARCH 27 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LaunchPoison

scoreboard players add @e[scores={LaunchPoison=0..9}] LaunchPoison 1
scoreboard players add @e[scores={LaunchPoison=11..68}] LaunchPoison 1
scoreboard players add @e[scores={LaunchPoison=70..}] LaunchPoison 1

execute if entity @e[scores={LaunchPoison=1}] run fill -1020 63 -991 -1010 63 -986 air replace spawner
execute if entity @e[scores={LaunchPoison=1}] run playsound entity.shulker.shoot master @a -1008 61 -951 10 0.5 1

execute if entity @e[scores={LaunchPoison=1}] run kill @e[tag=PoisonAS]
execute if entity @e[scores={LaunchPoison=1}] run kill @e[tag=PoisonFB]

#execute if entity @e[scores={LaunchPoison=1}] run summon armor_stand -1007 73 -955 {Invisible:true,Invulnerable:true,Small:true,Marker:true,Motion:[-0.28,1.0,-2.884],Tags:["BossMob","PoisonAS","PoisonAS1"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:spawner"},Tags:["BossMob","PoisonFB","PoisonFB1"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
#execute if entity @e[scores={LaunchPoison=1}] run summon armor_stand -1009 73 -955 {Invisible:true,Invulnerable:true,Small:true,Marker:true,Motion:[-0.56,1.0,-3.35],Tags:["BossMob","PoisonAS","PoisonAS2"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:spawner"},Tags:["BossMob","PoisonFB","PoisonFB2"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}
#execute if entity @e[scores={LaunchPoison=1}] run summon armor_stand -1011 73 -955 {Invisible:true,Invulnerable:true,Small:true,Marker:true,Motion:[-0.837,1.0,-2.884],Tags:["BossMob","PoisonAS","PoisonAS3"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:spawner"},Tags:["BossMob","PoisonFB","PoisonFB3"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


execute if entity @e[scores={LaunchPoison=1}] run setblock -1002 63 -988 air
execute if entity @e[scores={LaunchPoison=1}] run summon armor_stand -1007 73 -955 {Invisible:true,Invulnerable:true,Small:true,Marker:0b,Motion:[0.4655,1.0,-3.0695],Tags:["BossMob","PoisonAS","PoisonAS1"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:spawner"},Tags:["BossMob","PoisonFB","PoisonFB1"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}

execute if entity @e[scores={LaunchPoison=1}] run setblock -1026 63 -982 air
execute if entity @e[scores={LaunchPoison=1}] run summon armor_stand -1011 73 -955 {Invisible:true,Invulnerable:true,Small:true,Marker:0b,Motion:[-1.395,1.0,-2.513],Tags:["BossMob","PoisonAS","PoisonAS2"],Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:spawner"},Tags:["BossMob","PoisonFB","PoisonFB2"],NoGravity:true,DropItem:false,Time:-2147483648}],DisabledSlots:2039583}


execute if entity @e[scores={LaunchPoison=1}] run team add BossNoCollision
execute if entity @e[scores={LaunchPoison=1}] run team modify BossNoCollision collisionRule never

execute if entity @e[scores={LaunchPoison=1}] run team add BossIgnorePlayer
execute if entity @e[scores={LaunchPoison=1}] run team modify BossIgnorePlayer friendlyFire true
execute if entity @e[scores={LaunchPoison=1..}] run team join BossIgnorePlayer @a

execute if entity @e[scores={LaunchPoison=1}] run kill @e[tag=SickZombie]
execute if entity @e[scores={LaunchPoison=1}] run kill @e[tag=SickVillager]
#execute if entity @e[scores={LaunchPoison=1}] run summon villager -1015 60 -986 {Silent:true,NoAI:true,Invulnerable:true,ActiveEffects:[{Id:14,Amplifier:0,Duration:1999980,ShowParticles:0b}],Tags:["BossMob","SickVillager"],Team:NoCollision}
#execute if entity @e[scores={LaunchPoison=5}] run teleport @e[tag=SickVillager] -1015 63 -986


execute at @e[tag=PoisonAS1,nbt={OnGround:1b}] run setblock ~ ~ ~ spawner{MaxNearbyEntities:6s,SpawnCount:1s,Delay:200s,SpawnRange:8s,MinSpawnDelay:1s,MaxSpawnDelay:300s,SpawnData:{id:"minecraft:zombie",CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[90f,0f],Tags:["BossMob","SickZombie"],Team:BossIgnorePlayer},RequiredPlayerRange:20s}
execute at @e[tag=PoisonAS1,nbt={OnGround:1b}] run particle lava -1002 63 -988 0.1 0.1 0.1 1 100 force
execute as @e[tag=PoisonAS1] at @s if block ~ ~ ~ spawner run kill @s
execute as @e[tag=PoisonFB1] at @s if block ~ ~ ~ spawner run kill @s

execute at @e[tag=PoisonAS2,nbt={OnGround:1b}] run setblock ~ ~ ~ spawner{MaxNearbyEntities:6s,SpawnCount:1s,Delay:200s,SpawnRange:8s,MinSpawnDelay:1s,MaxSpawnDelay:300s,SpawnData:{id:"minecraft:zombie",CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[270f,0f],Tags:["BossMob","SickZombie"],Team:BossIgnorePlayer},RequiredPlayerRange:20s}
execute at @e[tag=PoisonAS2,nbt={OnGround:1b}] run particle lava -1026 63 -982 0.1 0.1 0.1 1 100 force

execute as @e[tag=PoisonAS2] at @s if block ~ ~ ~ spawner run kill @s
execute as @e[tag=PoisonFB2] at @s if block ~ ~ ~ spawner run kill @s

# CHARCOAL FIX FROM STREAM YAYA
#scoreboard objectives setdisplay sidebar CharcoalTimer
execute if entity @e[scores={LaunchPoison=1}] run scoreboard objectives remove CharcoalTimer
execute if entity @e[scores={LaunchPoison=1}] run scoreboard objectives add CharcoalTimer dummy
execute if entity @e[scores={LaunchPoison=1..}] run scoreboard players add @e[tag=MainBossAEC] CharcoalTimer 1

execute if entity @e[scores={CharcoalTimer=37}] unless block -1002 63 -988 spawner run summon fireball -1009 69 -960 {direction:[0.9,-0.7,-3.5],ExplosionPower:1,Tags:["SpawnerFireball","SpawnerFireball1"]}

execute align xyz if entity @e[tag=SpawnerFireball,x=-1002,y=63,z=-988,dx=0,dy=0,dz=0] if block -1002 63 -988 air run particle lava -1002 63 -988 0.1 0.1 0.1 1 100 force
execute align xyz if entity @e[tag=SpawnerFireball,x=-1002,y=63,z=-988,dx=0,dy=0,dz=0] run setblock -1002 63 -988 spawner{MaxNearbyEntities:6s,SpawnCount:1s,Delay:200s,SpawnRange:8s,MinSpawnDelay:1s,MaxSpawnDelay:300s,SpawnData:{id:"minecraft:zombie",CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[90f,0f],Tags:["BossMob","SickZombie"],Team:BossIgnorePlayer},RequiredPlayerRange:20s}

execute if block -1002 63 -988 spawner run kill @e[tag=PoisonAS1]
execute if block -1002 63 -988 spawner run kill @e[tag=PoisonFB1]


execute if entity @e[scores={CharcoalTimer=37}] unless block -1026 63 -982 spawner run summon fireball -1009 69 -960 {direction:[-2.1,-0.7,-2.7],ExplosionPower:1,Tags:["SpawnerFireball","SpawnerFireball2"]}
execute align xyz if entity @e[tag=SpawnerFireball,x=-1002,y=63,z=-988,dx=0,dy=0,dz=0] if block -1026 63 -982 air run particle lava -1026 63 -982 0.1 0.1 0.1 1 100 force
execute align xyz if entity @e[tag=SpawnerFireball,x=-1026,y=63,z=-982,dx=0,dy=0,dz=0] run setblock -1026 63 -982 spawner{MaxNearbyEntities:6s,SpawnCount:1s,Delay:200s,SpawnRange:8s,MinSpawnDelay:1s,MaxSpawnDelay:300s,SpawnData:{id:"minecraft:zombie",CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[270f,0f],Tags:["BossMob","SickZombie"],Team:BossIgnorePlayer},RequiredPlayerRange:20s}

execute if block -1026 63 -982 spawner run kill @e[tag=PoisonAS2]
execute if block -1026 63 -982 spawner run kill @e[tag=PoisonFB2]



execute if entity @e[scores={CharcoalTimer=60..}] unless block -1002 63 -988 spawner run scoreboard players set @e[scores={CharcoalTimer=60..}] CharcoalTimer 36
execute if entity @e[scores={CharcoalTimer=60..}] unless block -1026 63 -982 spawner run scoreboard players set @e[scores={CharcoalTimer=60..}] CharcoalTimer 36

execute if block -1002 63 -988 spawner if block -1026 63 -982 spawner run scoreboard objectives remove CharcoalTimer

execute if block -1002 63 -988 spawner if block -1026 63 -982 spawner run scoreboard players set @e[scores={LaunchPoison=..10}] LaunchPoison 11


execute if entity @e[scores={LaunchPoison=55}] run summon zombie -1005 64 -989 {CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,Attributes:[{Name:"generic.knockbackResistance",Base:1.0},{Name:"generic.maxHealth",Base:20.0d}],Health:20.0f,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[90f,0f],Tags:["BossMob","SickZombie","SickZombie1"],Team:BossIgnorePlayer}
execute if entity @e[scores={LaunchPoison=55}] at @e[tag=SickZombie1] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force


execute if entity @e[scores={LaunchPoison=67}] run summon zombie -1023 64 -983 {CustomName:"{\"text\":\"Pig?\",\"color\":\"white\"}",CustomNameVisible:false,Attributes:[{Name:"generic.knockbackResistance",Base:1.0},{Name:"generic.maxHealth",Base:20.0d}],Health:20.0f,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8b57078b-f1bd-45df-83c4-d88d16768fbe",Properties:{textures:[{Signature:"lfV6hkKpm2R9IfRXqbTsCL+aqNb2i6TxZ9VrzMtbXgzV5R3Nln5V91kyZFzRZp/fsOFxYCN4BBBfPK2gUUfYq4Y8p4UjRDoRmCRLGecrkZbArZHMtAqa+pjCL7WEmyezkqG1Xpm73j7xTCP6RNBf/PCKFuqc6/8lvBJNxDPhfTN1Wb/qMjxxF5anovWGMhkOafPzrkeRZE3PckdlNyHaRF5b+cRHVFbiOuyTypzciB+SavcSgynSlPRGfuHUSDlAW3AKuRLRFGdUB4LVVgdyt2PmwWIfgb02h0/HMMd4csuY1VwaqfIsOmY3/QkJfn+kVwwDl2hNWXsQmq3uxLn4hWza4X/1RxO/QcaSpcyj4l+cjIaZ6fcixL7QH8GHniwJ7Gmpsf6GaL6DvXVIdR+dIwRqjMP6UVgODn0OqHdZsSz5LWxob/ZbY9zbJwebUNzbgwi6BQFxQM6JrNFlBtHtRyKRH11rPa2FWB4FLO//Q6w/81z2ZsnkRcU3ywF1Dq2XbaK+2Mny/1b4jsHYK7kmqvhiAIRSeXs01TTYcMsl8G5qgjgtBW8uQ7ypTlj89BsP3yTOLCh+/d303VxtMTQCthlOOTNZqvFojTLgrbn08HE21OCE2ZPcXMLkWU0lxoU9RB6PZyw9tt+24M0/y+rma6GQXtOktColC0ZKuKbJEg8=",Value:"eyJ0aW1lc3RhbXAiOjE1NDM2MzI2NDE0ODYsInByb2ZpbGVJZCI6IjhiNTcwNzhiZjFiZDQ1ZGY4M2M0ZDg4ZDE2NzY4ZmJlIiwicHJvZmlsZU5hbWUiOiJNSEZfUGlnIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9hNTYyYTM3Yjg3MWY5NjRiZmMzZTEzMTFlYTY3MmFhYTAzOTg0YTVkYzQ3MjE1NGEzNGRjMjVhZjE1N2UzODJiIn19fQ=="}]},Name:"MHF_Pig"}}}],Rotation:[270f,0f],Tags:["BossMob","SickZombie","SickZombie2"],Team:BossIgnorePlayer}
execute if entity @e[scores={LaunchPoison=67}] at @e[tag=SickZombie2] run particle poof ~ ~ ~ 0.3 0.7 0.3 0 17 force


# FORCE ZOMBIE INTO CENTER
execute if entity @e[scores={LaunchPoison=..69}] run effect give @e[tag=SickZombie,tag=!ZombieFood] resistance 3 255 true
execute if entity @e[scores={LaunchPoison=..69}] as @e[tag=SickZombie,tag=!ZombieFood] run data merge entity @s {Health:20.0f}
execute if entity @e[scores={LaunchPoison=..69}] as @e[tag=SickZombie,tag=!ZombieFood] at @s run teleport @s[nbt={OnGround:1b}] ^ ^ ^0.4 facing -1015 63 -986


execute align x align y align z run tag @e[tag=SickZombie,x=-1016,y=63,z=-987,dx=2,dy=2,dz=2] add ZombieFood
execute align x align y align z if entity @e[tag=SickZombie,x=-1016,y=63,z=-987,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={LaunchPoison=..69}] LaunchPoison 70

execute if entity @e[scores={LaunchPoison=75}] as @e[tag=SickVillager] run data merge entity @s {Invulnerable:false,NoAI:false}
execute if entity @e[scores={LaunchPoison=75}] as @e[tag=SickVillager] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={LaunchPoison=75}] run team remove BossNoCollision
execute if entity @e[scores={LaunchPoison=75}] run team remove BossIgnorePlayer


execute if entity @e[scores={LaunchPoison=76}] as @e[tag=ZombieFood] run data merge entity @s {NoAI:true}
execute if entity @e[scores={LaunchPoison=76}] run playsound enchant.thorns.hit master @a -1015 63 -986 1 0.5 0
execute if entity @e[scores={LaunchPoison=76..}] as @e[tag=ZombieFood] run data merge entity @s {Motion:[0.0d,0.1d,0.0d]}
execute if entity @e[scores={LaunchPoison=76..}] as @e[tag=ZombieFood] run particle dust 0 1 0.5 1 ~ ~1 ~ 0 0 0 0 0 force

execute if entity @e[scores={LaunchPoison=75..}] as @e[tag=ZombieFood] at @s run teleport @s ^ ^ ^3 facing -1025 68 -957
execute if entity @e[scores={LaunchPoison=78}] run fill -1016 62 -987 -1014 62 -985 orange_concrete replace red_concrete
execute if entity @e[scores={LaunchPoison=85}] run fill -1016 62 -987 -1014 62 -985 red_concrete replace orange_concrete

execute align x align y align z if entity @e[tag=ZombieFood,x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..119}] BossTimer 0
execute align x align y align z if entity @e[tag=ZombieFood,x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard players set @e[scores={BossLevel=..119}] BossLevel 120
execute align x align y align z if entity @e[tag=ZombieFood,x=-1026,y=67,z=-957,dx=2,dy=2,dz=2] run scoreboard objectives remove LaunchPoison

