####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 28 2018 / APRIL 5 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives add LibertySlime dummy
scoreboard players add @e[tag=MainParkourAEC] LibertySlime 1
scoreboard players reset @e[scores={LibertySlime=30..}] LibertySlime

execute if entity @e[scores={LibertySlime=1}] run setblock 995 8 -1100 redstone_block
execute if entity @e[scores={LibertySlime=10}] run setblock 995 8 -1100 clay

execute if entity @e[scores={LibertySlime=15}] run setblock 994 20 -1100 redstone_block
execute if entity @e[scores={LibertySlime=25}] run setblock 994 20 -1100 clay

execute if entity @e[scores={LibertySlime=1}] run setblock 1005 43 -1108 redstone_block
execute if entity @e[scores={LibertySlime=10}] run setblock 1005 43 -1108 clay

#execute unless entity @e[tag=CityMakistein] run summon armor_stand 1004.6 66 -1104.6 {Invulnerable:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:2697513}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:657930}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4084}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"94dd516b-61b6-4a5f-8979-1de92cbdd5f5",Properties:{textures:[{Signature:"aJ2EOJiFOI2fN+X87FpzA+t89gKfjZjDDRlJLFHjBIGvh/hI3cXdssctI7gx5qX5LQXMhwuFeoiCxKD89T05QI21Qdm/TfJGEaL0BnMVYsIsfJyT6hQLxdC6Gj9vM6i4H9f8wWpV6TCtnj+mrmWS/7JVYS9Q1jxN/H05YLMhf/0xcbmC70r2oFI1rKjz1aYddVhF1FEDbF0Y7KGx3Cu+sMwK1XAFFJH4n8zCvFLF2NW0eV63i7/Dd1UTyS/SNRC4bmSvM7PZxKKnlufmJX5fXxlQNQ9N8MFq9mkzaOzr5gxPoq/kovfCSzfp9Q+TwvCkZDduoy+7UVm1MrlH6IKp3EnAH9AwbFO14/f9ABHnWtgM1XYs4VlOxfSNTBh/LGszgr5dlcnt53dVdO6WBlfI7wUwWs0+Jc8BkOwzWO8K/7fWEhADB8aZOU+uZNIrq9ntiyxGkmhxvW5dh24Gb5P35sfcd1SEvQRFG/Bo3dnmGUODGOO+aTusDl4ZxOQMmJqPWh3sT1wHthPHkQQxgmsw18k8oA+FQW+gSudzTG06n4JyRQFhgbZu3XYuL2RUyLv3qOzLxfzz0R8f+uYYOu+P8E3C38O+bxJoLRDBwUezElZczpjVPf5nd5TIl5FLxYv9hzSx/vccldJn/1NfRQurtsDaPNu7m5g7JaYgDzTX0HA=",Value:"eyJ0aW1lc3RhbXAiOjE1NDMwOTc5OTU5NTUsInByb2ZpbGVJZCI6Ijk0ZGQ1MTZiNjFiNjRhNWY4OTc5MWRlOTJjYmRkNWY1IiwicHJvZmlsZU5hbWUiOiJNck1ha2lzdGVpbiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzgxYWNhMjBlMGExNDk5NjlhNWE0ODljOWI5ZGRkM2NjNzFkY2ExNWYwYWIwODUzMDViMDY3OWFlODI2Mzg3ZSJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"MrMakistein"}},Count:1b}],HandItems:[{id:"minecraft:cobweb",Count:1b},{id:"minecraft:cobweb",Count:1b}],DisabledSlots:2039583,Tags:["CityMakistein"],Pose:{Head:[50f,20f,0f],LeftLeg:[340f,0f,290f],RightLeg:[340f,10f,30f],LeftArm:[140f,120f,10f],RightArm:[0f,0f,70f]},Rotation:[115f,0f],DisabledSlots:2039583}

execute unless entity @e[tag=CityMakistein] run summon armor_stand 990.3 65 -1102.6 {Invulnerable:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:2697513}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:657930}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4084}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"94dd516b-61b6-4a5f-8979-1de92cbdd5f5",Properties:{textures:[{Signature:"aJ2EOJiFOI2fN+X87FpzA+t89gKfjZjDDRlJLFHjBIGvh/hI3cXdssctI7gx5qX5LQXMhwuFeoiCxKD89T05QI21Qdm/TfJGEaL0BnMVYsIsfJyT6hQLxdC6Gj9vM6i4H9f8wWpV6TCtnj+mrmWS/7JVYS9Q1jxN/H05YLMhf/0xcbmC70r2oFI1rKjz1aYddVhF1FEDbF0Y7KGx3Cu+sMwK1XAFFJH4n8zCvFLF2NW0eV63i7/Dd1UTyS/SNRC4bmSvM7PZxKKnlufmJX5fXxlQNQ9N8MFq9mkzaOzr5gxPoq/kovfCSzfp9Q+TwvCkZDduoy+7UVm1MrlH6IKp3EnAH9AwbFO14/f9ABHnWtgM1XYs4VlOxfSNTBh/LGszgr5dlcnt53dVdO6WBlfI7wUwWs0+Jc8BkOwzWO8K/7fWEhADB8aZOU+uZNIrq9ntiyxGkmhxvW5dh24Gb5P35sfcd1SEvQRFG/Bo3dnmGUODGOO+aTusDl4ZxOQMmJqPWh3sT1wHthPHkQQxgmsw18k8oA+FQW+gSudzTG06n4JyRQFhgbZu3XYuL2RUyLv3qOzLxfzz0R8f+uYYOu+P8E3C38O+bxJoLRDBwUezElZczpjVPf5nd5TIl5FLxYv9hzSx/vccldJn/1NfRQurtsDaPNu7m5g7JaYgDzTX0HA=",Value:"eyJ0aW1lc3RhbXAiOjE1NDMwOTc5OTU5NTUsInByb2ZpbGVJZCI6Ijk0ZGQ1MTZiNjFiNjRhNWY4OTc5MWRlOTJjYmRkNWY1IiwicHJvZmlsZU5hbWUiOiJNck1ha2lzdGVpbiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzgxYWNhMjBlMGExNDk5NjlhNWE0ODljOWI5ZGRkM2NjNzFkY2ExNWYwYWIwODUzMDViMDY3OWFlODI2Mzg3ZSJ9LCJDQVBFIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc5MTI3OTBmZjE2NGI5MzE5NmYwOGJhNzFkMGU2MjEyOTMwNDc3NmQwZjM0NzMzNGY4YTZlYWU1MDlmOGE1NiJ9fX0="}]},Name:"MrMakistein"}},Count:1b}],HandItems:[{id:"minecraft:cobweb",Count:1b},{id:"minecraft:cobweb",Count:1b}],DisabledSlots:2039583,Tags:["CityMakistein"],Pose:{Head:[50f,0f,0f],LeftLeg:[340f,10f,-30f],RightLeg:[340f,0f,-290f],LeftArm:[0f,0f,-70f],RightArm:[140f,-120f,0f]},Rotation:[195f,0f],DisabledSlots:2039583}

#execute align x align y align z if entity @a[x=1001,y=59,z=-1109,dx=5,dy=5,dz=5] run scoreboard objectives add LibertyChat dummy
#execute align x align y align z run scoreboard players add @a[x=1001,y=59,z=-1109,dx=5,dy=5,dz=5] LibertyChat 1

execute align x align y align z if entity @a[x=990,y=58,z=-1107,dx=0,dy=1,dz=0] run scoreboard objectives add LibertyChat dummy
execute align x align y align z run scoreboard players add @a[x=990,y=58,z=-1107,dx=0,dy=1,dz=0] LibertyChat 1

tellraw @a[scores={LibertyChat=1}] ["",{"text":"<McMakistein> ","color":"blue","bold":false},{"text":"Come on! You can do it! Just use your spidey powers!","color":"none","bold":false,"underlined":false}]

scoreboard players set @a[scores={LibertyChat=1}] LibertyChat 10


# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=988,y=59,z=-1112,dx=23,dy=1,dz=23] 999 59 -1111
execute align x align y align z run spawnpoint @a[x=994,y=122,z=-1104,dx=6,dy=1,dz=6] 997 126 -1107



# COMPLETE LIME
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={LimeParkour=0}] LimeParkour 1
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run setblock 36 1 -18 lime_concrete


execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=1004,y=144,z=-1115,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0



# QUIT LIME
execute align x align y align z if entity @a[x=995,y=10,z=-1109,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=995,y=10,z=-1109,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=995,y=10,z=-1109,dx=0,dy=0,dz=0] run teleport @a 998 66 -1003 167 0
