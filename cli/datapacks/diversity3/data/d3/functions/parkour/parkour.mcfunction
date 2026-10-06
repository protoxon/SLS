####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 15 2017 / MARCH 25 2020
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar OrangeParkour
#scoreboard objectives setdisplay sidebar YellowParkour
#scoreboard objectives setdisplay sidebar BrownParkour
#scoreboard objectives setdisplay sidebar BlackParkour
#scoreboard objectives setdisplay sidebar LimeParkour
#scoreboard objectives setdisplay sidebar PurpleParkour
#scoreboard objectives setdisplay sidebar WhiteParkour
#scoreboard objectives setdisplay sidebar GreenParkour
#scoreboard objectives setdisplay sidebar LightBlueParkour
#scoreboard objectives setdisplay sidebar ParkourComplete
#scoreboard objectives setdisplay sidebar HelicopterChat
#scoreboard objectives setdisplay sidebar LibertySlime

scoreboard objectives add ParkDeaths deathCount {"text":"Missteps","color":"dark_red","bold":"true","underlined":"true"}
scoreboard objectives setdisplay sidebar ParkDeaths

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

# BRING STRAGGLERS
execute if block 1 4 2 pink_wool run gamemode adventure @a[tag=!InParkourBranch,tag=!D3Admin]
execute if block 1 4 2 pink_wool if entity @a[tag=!InParkourBranch] run function d3:parkour/parkour_stragglers
execute if block 1 4 2 pink_wool run clear @a[tag=!InParkourBranch]
execute if block 1 4 2 pink_wool run tag @a add InParkourBranch

function d3:parkour/select_course
execute align x align y align z if entity @a[x=951,y=1,z=-948,dx=98,dy=255,dz=98] run function d3:parkour/train_parkour
execute align x align y align z if entity @a[x=1052,y=149,z=-948,dx=98,dy=107,dz=98] run function d3:parkour/hobbit_parkour
execute align x align y align z if entity @a[x=1052,y=1,z=-1049,dx=98,dy=255,dz=98] run function d3:parkour/garden_parkour
execute align x align y align z if entity @a[x=1052,y=8,z=-1150,dx=98,dy=248,dz=98] run function d3:parkour/pirate_parkour
execute align x align y align z if entity @a[x=951,y=1,z=-1150,dx=98,dy=255,dz=98] run function d3:parkour/liberty_parkour
execute align x align y align z if entity @a[x=850,y=3,z=-1150,dx=98,dy=255,dz=98] run function d3:parkour/city_parkour
execute align x align y align z if entity @a[x=850,y=3,z=-1048,dx=98,dy=255,dz=98] run function d3:parkour/beanstalk_parkour
execute align x align y align z if entity @a[x=850,y=1,z=-948,dx=98,dy=255,dz=98] run function d3:parkour/letter_parkour


### RETURN FROM COMPLETING COURSES ###
execute if entity @a[x=995,y=66,z=-1005,dx=10,dy=3,dz=10] if block 42 1 -18 mossy_stone_bricks run function d3:parkour/complete_course
execute if entity @a[x=995,y=192,z=-1005,dx=10,dy=3,dz=10] if block 42 1 -18 mossy_stone_bricks run function d3:parkour/complete_course

execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] unless entity @e[tag=FakeCeilingBlock] run summon falling_block 1000 240 -1000 {BlockState:{Name:"minecraft:pink_concrete"},Tags:["FakeCeilingBlock"],NoGravity:true,DropItem:false,Time:-2147483648}
execute if entity @e[scores={ParkourComplete=1..}] run particle portal 1000 193 -991 0.4 0.8 0.4 0.1 7 force @a
execute align x align y align z if entity @a[x=1000,y=192,z=-991,dx=0,dy=0,dz=0] run kill @e[tag=ParkourStand]
execute align x align y align z if entity @a[x=1000,y=192,z=-991,dx=0,dy=0,dz=0] run teleport @a 46 4 -31 0 -90




# END
execute if entity @a[x=995,y=192,z=-1005,dx=10,dy=3,dz=10] if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run scoreboard objectives add ParkourComplete dummy
execute if block 1000 193 -1000 pink_concrete run setblock 1000 193 -1000 air

execute unless entity @e[tag=MainParkourAEC,scores={ParkourComplete=50..}] run kill @e[tag=ParkourEndStand]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=0..99}] unless block 1000 192 -1000 sea_lantern run setblock 1000 192 -1000 sea_lantern
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=0..99}] run fill 986 194 -1001 988 194 -999 iron_block replace air
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=0..99}] run fill 987 194 -1000 987 194 -1000 sea_lantern replace iron_block
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=0..99}] run fill 1012 194 -1001 1014 194 -999 smooth_red_sandstone replace air
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=0..99}] run fill 1013 194 -1000 1013 194 -1000 sea_lantern replace smooth_red_sandstone

scoreboard players add @e[tag=MainParkourAEC] ParkourComplete 1

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=100}] run kill @e[tag=ParkourAdrian]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=100}] run playsound entity.enderman.teleport master @a 987 195 -1000 1 1 0.5
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=100}] run particle portal 987 195.5 -1000 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=100}] run summon armor_stand 987 195 -1000 {Invulnerable:true,Rotation:[270.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16777215}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "c67563fd-4b7f-4a6b-a908-7237c3f1eaf9", Properties: {textures: [{Signature: "nmp7wlrTf7LZ7MzCSEBlOGhMHPISEe0V96dvJN0nzcKbd6BqSvi7sn312Zy0lulVlPGc8BMaCXkU9xhPzznwdG8/TDfrtZueaXS5wvuLjdVR66mPYb72i90wbo8drdhZxKgnPVPD0rTVe98TCSm6duojBOm+/w0q/L4uVhcHhNIi/8N5AD6J22W6Ca9jjIqZOwLSMAZVJM8mtatgwEeY5SxzEXioRgOGo1pzgoqKvTgNPwiks4nWPzPI0KZNmS8lyZ0ETmdIzEHlMH2gNcgLq/D8dIxykVluS42bzRKuJVLmLXT+BLpf+AQG0EjsKjMfcg7ZleFjZ7AtXnLYz0BbfAjHBbQWpunxnhTVsy8DJhUmDUMWcOXzgqls+iv4Xm7O4OY1Pky65rjS0YdV+IdAoo4MCbtCF5/z5q35I+onA3W9CrXnByzoQvoJNUO1/4VVnR1eTD3USyuz3c3PDTNbTE6w9aQbcC8TzhIcXFdHOR0dAPj1icz8UzidBqZnO8Aczza6NhytTUcB73pbsDf6m0usl4A1U00BwV/kEUya2S5fnkIZsSTafhNTrgCI/12yaqD0ziYrKZhHKHsJ8zMFgou87WIQA1F6q2Fbxkm5oGyOwG/ZMy5fqptkuTQ+1PRhsJHjSPaFwC2TqRX0rjFaWAyrjYLzYuUEbS4xtumaHM4=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgxNTc3OTAsInByb2ZpbGVJZCI6ImM2NzU2M2ZkNGI3ZjRhNmJhOTA4NzIzN2MzZjFlYWY5IiwicHJvZmlsZU5hbWUiOiJhYnJpZ2h0bW9vcmUiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzlkODA1N2EzNDM2MjBiMTU1MmVlOTkxMzQ0YTQ1MGNlMDVhOWMzNzY4ZDgyMjllYmM5ODhhNjIxZTc4NmExNTUifX19"}]}, Name: "abrightmoore"}},Count:1b}],HandItems:[{}],DisabledSlots:2039583,Tags:["ParkourAdrian","ParkourEndStand","ParkourEndNPC"],Pose:{Head:[18f,0f,0f]}}

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=250}] run kill @e[tag=ParkourAdam]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=250}] run playsound entity.enderman.teleport master @a 1013 195 -1000 1 1 0.5
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=250}] run particle portal 1013 195.5 -1000 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=250}] run summon armor_stand 1013 195 -1000 {Invulnerable:true,Rotation:[90.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures: [{Signature: "QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]}, Name: "AdamDJM"}},Count:1b}],HandItems:[{}],DisabledSlots:2039583,Tags:["ParkourAdam","ParkourEndStand","ParkourEndNPC"],Pose:{Head:[18f,0f,0f]}}

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=..10}] run clear @a

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=140}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"Excellent! You've completed the Parkour Branch!","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=290}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"Congratulations!","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=350}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"abrightmoore, did you bring the wool for them?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=470..480}] as @a at @s run teleport @s ^ ^ ^ facing 987 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=480}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"Well, I did... but...","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=570..580}] as @a at @s run teleport @s ^ ^ ^ facing 1013 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=580}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"But what?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=670..680}] as @a at @s run teleport @s ^ ^ ^ facing 987 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=680}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"Well, you worked so hard on this Branch. Maybe you should have the honours...","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=680}] run data merge entity @e[tag=ParkourAdrian,limit=1] {HandItems:[{id:"minecraft:pink_wool",Count:1b}]}

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=810..820}] as @a at @s run teleport @s ^ ^ ^ facing 1013 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=820}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"What? You put so much time into this. You should be the one to give it to them.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=940..950}] as @a at @s run teleport @s ^ ^ ^ facing 987 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=950}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"No no no. I insist.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1000}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"Here.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1040..1050}] as @a at @s run teleport @s ^ ^ ^ facing 1013 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1050}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"No! I insist! You give it to them!","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1160..1170}] as @a at @s run teleport @s ^ ^ ^ facing 987 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1170}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"NO! I INSIST! You deserve this!","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1260..1270}] as @a at @s run teleport @s ^ ^ ^ facing 1013 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1270}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"NO! I INSIST! Take it!","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1410..1420}] as @a at @s run teleport @s ^ ^ ^ facing 987 194.5 -1000
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1420}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"NO! YOU SHOULD TAKE IT!","color":"none","bold":false,"underlined":false}]


execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1500..}] if entity @e[tag=ParkourAdam,scores={ParkourComplete=70}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"gold","bold":false},{"text":"NO! YOU TAKE IT!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1500..}] if entity @e[tag=ParkourAdrian,scores={ParkourComplete=70}] run tellraw @a ["",{"text":"<abrightmoore> ","color":"gray","bold":false},{"text":"NO! YOU TAKE IT!","color":"none","bold":false,"underlined":false}]


scoreboard players reset @e[tag=ParkourEndNPC,nbt=!{HandItems:[{id:"minecraft:pink_wool"}]}] ParkourComplete
scoreboard players add @e[tag=ParkourEndNPC,nbt={HandItems:[{id:"minecraft:pink_wool"}]}] ParkourComplete 1

# CAUGHT
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=1}] run data merge entity @s {Pose:{RightArm:[300f,330f,20f],LeftArm:[300f,40f,340f]}}
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=1}] at @s run playsound block.wool.step master @a ~ ~ ~ 1 1 0

# ARM NORMAL
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=20}] run data merge entity @s {Pose:{RightArm:[350f,0f,10f],LeftArm:[0f,0f,350f]}}

# ARM ABOVE HEAD
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=95}] run data merge entity @s {Pose:{RightArm:[180f,50f,340f]}}

# ARM AT END OF THROW
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=100}] run data merge entity @s {Pose:{RightArm:[240f,50f,40f]}}
execute as @e[tag=ParkourAdrian,scores={ParkourComplete=101}] run summon armor_stand 987 195 -1000 {Invisible:true,Invulnerable:true,Rotation:[270.0f,0.0f],HandItems:[{id:"minecraft:pink_wool",Count:1b}],Tags:["TossedParkourWool","EastParkourWool","ParkourEndStand"],Motion:[3.0d,0.6d,0.0d],Pose:{RightArm:[240f,50f,40f]}}
execute as @e[tag=ParkourAdam,scores={ParkourComplete=101}] run summon armor_stand 1013 195 -1000 {Invisible:true,Invulnerable:true,Rotation:[90.0f,0.0f],HandItems:[{id:"minecraft:pink_wool",Count:1b}],Tags:["TossedParkourWool","WestParkourWool","ParkourEndStand"],Motion:[-3.0d,0.6d,0.0d],Pose:{RightArm:[240f,50f,40f]}}
execute as @e[tag=ParkourEndNPC,scores={ParkourComplete=101..}] run data merge entity @s {HandItems:[{Count:0b}],Pose:{RightArm:[350f,0f,10f],LeftArm:[0f,0f,350f]}}

execute align x align y align z if entity @e[tag=EastParkourWool,x=1013,y=195,z=-1000,dx=0,dy=1,dz=0] run data merge entity @e[tag=ParkourAdam,limit=1] {HandItems:[{id:"minecraft:pink_wool",Count:1b}]}
execute align x align y align z as @e[tag=EastParkourWool,x=1013,y=195,z=-1000,dx=0,dy=1,dz=0] run kill @s

execute align x align y align z if entity @e[tag=WestParkourWool,x=987,y=195,z=-1000,dx=0,dy=1,dz=0] run data merge entity @e[tag=ParkourAdrian,limit=1] {HandItems:[{id:"minecraft:pink_wool",Count:1b}]}
execute align x align y align z as @e[tag=WestParkourWool,x=987,y=195,z=-1000,dx=0,dy=1,dz=0] run kill @s


execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1699..1705}] as @a at @s run teleport @s ^ ^ ^ facing 1000 195.5 -991

execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1700}] run kill @e[tag=ParkourNoodlor]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1700}] run playsound entity.enderman.teleport master @a 1013 195 -1000 1 1 0.5
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1700}] run particle portal 1000 196.5 -991 0.2 0.2 0.2 0.5 20 force @a
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1700}] run summon armor_stand 1000 196 -991 {Invulnerable:true,Rotation:[180.0f,0.0f],ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:10079334}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:13382502}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:13421772}}},{id:"minecraft:player_head",tag:{SkullOwner: {Id: "26fe7806-9bf5-455d-b460-706c99ec5f0a", Properties: {textures: [{Signature: "EFcsKqW5e5ATTpCGI4LGtyLwOemYDpEN0jhNpsRwqHdhbXydlnXU4ELAo/wjttvG1ywSJH9DNjzQX9MwT66oF4iNB3zkfPlQnPAiXN9oYr8oCIrcVhV6xxGtt6GheittZQ5gaTs0VUxJzKf36uYHFVHb9VpdQ5jNHTOOaxclGJSPpWDno94X+btNI2Kv2AWap0FsxRAhQ+hOHidnDnadEpnMUwef2wsT9RzxuGyyv8HWhSbfdKI5nwmqFXYCCJ6RHaihBl5+8UmyEo5fvfwCwAOH35HAi3MVhm/qEhTdkY7MwzDHP6lbFXySDeUIIP2zwfZL5UulzkMfWqr3pbGhfyzjw+DMWMXv6g3jYICd2P3WW7uYHC0Gw8zYo1x3sqHxN5A1ZfIerhdGm3P1F3voK3J5e18LqQavQnqL7pp5hpx/tHn0Mc5zZmP9dV4pJrOvja8vlSsQU5nkDfxzZ6zlvlghJLmN+GX0EPhf5sCAGDNTP+oQNogtjIK6l95uwgHZO7+yc6gPjH+nBq2q6TfBY7qGl1MMibQCALIHbXkSO61198ifJPL+os8q6xJ6wMGGZGnu2QINUF62Ih97El+hKO4Hd9Glmpuq+jiccfKHofwMD9Bs4hUqWsB+5NWOG/Hcccjq2B6MR9qr3GOKpCxuj9zhyECVVv3yfZ1pLJJusZw=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYwOTgwMDUxNzYsInByb2ZpbGVJZCI6IjI2ZmU3ODA2OWJmNTQ1NWRiNDYwNzA2Yzk5ZWM1ZjBhIiwicHJvZmlsZU5hbWUiOiJOb29kbG9yIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9mZTY3OGI2ZTBiMmEwZmRlMTk2ZGUyMWQ1MjczNjdiNjkzNDMzZGRjYjk3ZjFlMmM5MTFlNjAzN2RmNWRlNWI1In19fQ=="}]}, Name: "Noodlor"}},Count:1b}],HandItems:[{}],DisabledSlots:2039583,Tags:["ParkourNoodlor","ParkourEndStand","ParkourEndNPC"],Pose:{Head:[18f,0f,0f]}}



execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1750}] run tellraw @a ["",{"text":"<Noodlor> ","color":"dark_green","bold":false},{"text":"Oh no! Not this again!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1850}] run tellraw @a ["",{"text":"<Noodlor> ","color":"dark_green","bold":false},{"text":"You better grab it yourself. They'll never stop!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1950}] run tellraw @a ["",{"text":"<Noodlor> ","color":"dark_green","bold":false},{"text":"Here! This should help!","color":"none","bold":false,"underlined":false}]
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1990}] run setblock 1000 192 -1000 air destroy
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=1990}] run summon falling_block 1000 192 -1000 {BlockState:{Name:"minecraft:pink_glazed_terracotta"},DropItem:false,Time:-2147483648,Motion:[0.0d,0.7d,0.0d]}

execute if block 1000 192 -1000 pink_glazed_terracotta align x align y align z run effect give @a[x=1000,y=193,z=-1000,dx=0,dy=0,dz=0] jump_boost 1 4

execute at @e[tag=TossedParkourWool] positioned ~-1 ~0.5 ~-1 align x align y run replaceitem entity @p[dx=2,dy=1,dz=2] weapon.mainhand pink_wool

#execute as @a at @s if entity @e[tag=TossedParkourWool,distance=..1] run replaceitem entity @s weapon.mainhand pink_wool
#execute at @e[tag=TossedParkourWool] as @a[distance=..1] run say hi


# COMPLETE BRANCH
tag @a remove HasPinkWool
execute if entity @e[tag=MainParkourAEC,scores={ParkourComplete=2000..}] run tag @p[nbt={Inventory:[{id:"minecraft:pink_wool"}]}] add HasPinkWool
execute if entity @p[tag=HasPinkWool] as @a unless entity @s[scores={ParkDeaths=1..}] run advancement grant @s only d3:folder_b/disciplined
execute if entity @p[tag=HasPinkWool] as @a unless entity @s[scores={ParkDeaths=9..}] run advancement grant @s only d3:folder_b/cat_person
execute if entity @p[tag=HasPinkWool] run clear @a
replaceitem entity @p[tag=HasPinkWool] weapon.mainhand pink_wool
execute if entity @p[tag=HasPinkWool] run setblock 46 1 -18 clay
execute if entity @p[tag=HasPinkWool] run teleport @a -24 4 1 0 -90
