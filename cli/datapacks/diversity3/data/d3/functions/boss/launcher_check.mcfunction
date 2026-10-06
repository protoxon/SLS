####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 30 2018 / JUNE 29 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################


# STONE PICKAXE
execute if entity @e[scores={BossLevel=..15}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:stone_pickaxe"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem


# FOOD 1
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=35,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=40,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=40,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=45,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=45,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=50,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=50,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=55,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=55,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem


# IRON PICKAXE
execute if entity @e[scores={BossLevel=75}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:iron_pickaxe"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem


# FOOD 2
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=85,BossTimer=200..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=90,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=90,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=95,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=95,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=100,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:cooked_porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=100,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem

execute if entity @e[scores={BossLevel=105,BossTimer=..49}] run tag @e remove LaunchItem
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:porkchop"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
execute if entity @e[scores={BossLevel=105,BossTimer=50..}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:apple"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem


# MILK BUCKET
execute if entity @e[scores={BossLevel=130}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:milk_bucket"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem


# DIAMOND PICKAXE
execute if entity @e[scores={BossLevel=140}] unless entity @e[tag=LaunchItem] align x align y align z run tag @e[nbt={Item:{id:"minecraft:diamond_pickaxe"},OnGround:1b},x=-1016,y=63,z=-987,dx=2,dy=0,dz=2,limit=1] add LaunchItem
