####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 6 2018 / JUNE 22 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

fill -976 99 992 -973 99 995 water
fill -966 97 984 -964 97 989 water

teleport @a[x=-976,y=95,z=1010,dx=6,dy=-2,dz=10] -975 104 1009 0 0


tag @a remove BucketHead
execute align x align y align z run tag @a[x=-976,y=86,z=984,dx=12,dy=20,dz=33] add BucketHead
execute align x align y align z run tag @a[x=-976,y=97,z=1018,dx=3,dy=9,dz=5] add BucketHead


# 1.13.2 BUG FIX FRONT SIDE
fill -978 98 1005 -978 106 1008 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 104 1009 -978 106 1012 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 98 1010 -978 103 1012 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 98 1013 -978 100 1020 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 106 1013 -978 106 1026 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 101 1018 -978 105 1020 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -978 104 1021 -978 105 1026 prismarine_brick_slab[type=double] replace prismarine_bricks

# 1.13.2 BUG FIX BACK SIDE
fill -962 87 992 -962 106 995 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -962 104 996 -962 106 1003 prismarine_brick_slab[type=double] replace prismarine_bricks

# 1.13.2 BUG FIX LOWER POOL
fill -966 85 992 -964 86 995 prismarine_brick_slab[type=double] replace prismarine_bricks

# 1.13.2 BUG FIX UPPER POOL
fill -976 96 1005 -974 96 1005 prismarine_brick_slab[type=double] replace prismarine_bricks
fill -976 97 1005 -974 97 1008 prismarine_brick_slab[type=double] replace prismarine_bricks


# SWAPS EMPTY BUCKET
replaceitem entity @a[tag=BucketHead,nbt={SelectedItem:{id:"minecraft:bucket"}},nbt=!{SelectedItem:{id:"minecraft:bucket",tag:{CanPlaceOn:["minecraft:water","minecraft:gravel","minecraft:prismarine_brick_slab","minecraft:barrier"]}}}] weapon.mainhand bucket{HideFlags:16,CanPlaceOn:["minecraft:water","minecraft:gravel","minecraft:prismarine_brick_slab","minecraft:barrier"],display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Empty Bucket\"}",Lore:['{"text":"Can magically be filled","italic":"true","color":"dark_aqua"}','{"text":"with water, of all liquids","italic":"true","color":"dark_aqua"}']}}



# SWAPS WATER BUCKET
replaceitem entity @a[tag=BucketHead,nbt={SelectedItem:{id:"minecraft:water_bucket"}},nbt=!{SelectedItem:{id:"minecraft:water_bucket",tag:{CanPlaceOn:["minecraft:gravel","minecraft:prismarine_brick_slab","minecraft:barrier"]}}}] weapon.mainhand water_bucket{HideFlags:16,CanPlaceOn:["minecraft:gravel","minecraft:prismarine_brick_slab","minecraft:barrier"],display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Gravel Bucket\"}",Lore:['{"text":"Seems to only work on gravel.","italic":"true","color":"dark_aqua"}','{"text":"As if that\'s realistic...","italic":"true","color":"dark_aqua"}']}}



# REMOVES SPECIAL BUCKET
replaceitem entity @a[tag=!BucketHead,nbt={SelectedItem:{id:"minecraft:bucket",tag:{CanPlaceOn:["minecraft:water","minecraft:prismarine_brick_slab"]}}}] weapon.mainhand bucket{HideFlags:16,display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Broken Bucket\"}",Lore:['{"text":"What a ripoff! It won\'t pick up water...","italic":"true","color":"dark_aqua"}']}}

replaceitem entity @a[tag=!BucketHead,nbt={SelectedItem:{id:"minecraft:water_bucket",tag:{CanPlaceOn:["minecraft:gravel","minecraft:prismarine_brick_slab"]}}}] weapon.mainhand water_bucket{HideFlags:16,display:{Name:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Suction Bucket\"}",Lore:['{"text":"For some reason, the water","italic":"true","color":"dark_aqua"}','{"text":"can\'t get out.","italic":"true","color":"dark_aqua"}']}}



# LADDER CHECKPOINT 1
execute if block -976 100 1003 lever[powered=false] run fill -976 88 1003 -976 98 1003 air replace ladder
execute if block -976 100 1003 lever[powered=true] if block -976 88 1003 air run playsound entity.experience_orb.pickup master @a -977 99 1004
execute if block -976 100 1003 lever[powered=true] if block -976 88 1003 air run playsound item.chorus_fruit.teleport master @a -977 99 1004 1 0.7 0
execute if block -976 100 1003 lever[powered=true] if block -976 88 1003 air run particle cloud -976 93 1003 0.3 2 0.3 0 100
execute if block -976 100 1003 lever[powered=true] run fill -976 88 1003 -976 98 1003 ladder[facing=north] replace air


# IRON BARS CHECKPOINT 2
execute if block -967 106 1022 lever[powered=false] run fill -968 104 1021 -966 106 1021 iron_bars[west=true,east=true] replace air
execute if block -967 106 1022 lever[powered=true] if block -967 105 1021 iron_bars run playsound entity.experience_orb.pickup master @a -967 105 1021
execute if block -967 106 1022 lever[powered=true] if block -967 105 1021 iron_bars run playsound item.chorus_fruit.teleport master @a -967 105 1021 1 0.7 0
execute if block -967 106 1022 lever[powered=true] if block -967 105 1021 iron_bars run particle cloud -967 105 1021 1 1 0 0 100
execute if block -967 106 1022 lever[powered=true] run fill -968 104 1021 -966 106 1021 air destroy