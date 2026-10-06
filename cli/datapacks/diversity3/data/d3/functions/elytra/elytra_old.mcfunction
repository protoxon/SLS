####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 6 2019 / APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ElytraEnd
#scoreboard objectives setdisplay sidebar RingSFX

effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

# BRING STRAGGLERS
execute if block 1 4 2 purple_wool run gamemode adventure @a[tag=!InElytraBranch,tag=!D3Admin]
execute if block 1 4 2 purple_wool run spawnpoint @a[tag=!InElytraBranch] -1800 223 2000
execute if block 1 4 2 purple_wool run teleport @a[tag=!InElytraBranch] -1800 223 2000 0 0
execute if block 1 4 2 purple_wool run clear @a[tag=!InElytraBranch]
execute if block 1 4 2 purple_wool run tag @a add InElytraBranch


# BRANCH EXIT
execute if block -1800 224 1999 stone_button[powered=true] run tag @a add LeaveElytra
execute if block -1800 224 1999 stone_button[powered=true] run setblock -1800 224 1999 stone_button[powered=false,face=wall,facing=south]
execute if entity @a[tag=LeaveElytra] run setblock -20 1 78 purple_concrete_powder
execute if entity @a[tag=LeaveElytra] run teleport @a -18 4 65 0 -90
tag @a remove LeaveElytra


# NPCS
function d3:elytra/elytra_npcs


# RING SOUND FX
scoreboard objectives add RingSFX dummy
scoreboard players add @a RingSFX 0
scoreboard players add @a[scores={RingSFX=1..}] RingSFX 1
execute at @a[scores={RingSFX=2}] run playsound block.end_portal_frame.fill master @a ~ ~ ~ 1 1.2 1
scoreboard players set @a[scores={RingSFX=50..}] RingSFX 0


# ADVANCEMENTS
execute as @a[nbt={Inventory:[{id:"minecraft:firework_rocket"}]}] align x align y align z unless entity @s[x=-1821,y=210,z=1979,dx=43,dy=18,dz=40] run tag @s add HasFirework
tag @a[tag=HasFirework,nbt=!{Inventory:[{id:"minecraft:firework_rocket"}]}] add LostFirework

execute as @a at @s align y run advancement grant @s[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]},y=257,dy=10,gamemode=adventure] only d3:folder_c/sky_limit


# FAKE BLOCK (NEEDS LIGHT TO BOTTOM TO PREVENT LAG UPDATE)
execute unless block -1800 222 2002 air unless entity @e[tag=ElytraAndesite] run summon falling_block -1800 221.99999 2002 {BlockState:{Name:"minecraft:andesite"},Tags:["ElytraAndesite"],NoGravity:1b,DropItem:false,Time:-2147483648}


# OBTAIN WINGS
execute as @a[tag=HasElytra] align x align y align z unless entity @s[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0] run tag @s remove HasElytra
execute align x align y align z run tag @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,nbt={Inventory:[{id:"minecraft:elytra"}]}] add HasElytra
execute align x align y align z if entity @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] run particle dust 1 0 1 1 -1800 224.7 2006 0.3 0.4 0.3 0 300 force
execute align x align y align z run tellraw @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] ["",{"text":"▜ Elytra Obtained ▛","color":"light_purple","bold":false}]
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] at @s run playsound entity.ender_dragon.flap master @s ~ ~ ~ 1 1 0
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] at @s run playsound block.end_portal_frame.fill master @s ~ ~ ~ 0.5 0.5 0
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] at @s run playsound entity.puffer_fish.death master @s ~ ~ ~ 0.5 0.5 1
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] at @s run playsound entity.illusioner.prepare_blindness master @s ~ ~ ~ 1.2 0.7 1
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] run give @s[nbt={Inventory:[{Slot:102b,Count:1b}]},nbt=!{Inventory:[{id:"minecraft:elytra"}]}] elytra{Unbreakable:1b,HideFlags:4,display:{Name:"{\"text\":\"Elytra\",\"italic\":\"false\",\"color\":\"dark_purple\",\"bold\":\"true\"}"}}
execute align x align y align z run tag @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,nbt={Inventory:[{id:"minecraft:elytra"}]}] add HasElytra
execute align x align y align z as @a[x=-1800,y=224,z=2006,dx=0,dy=1,dz=0,tag=!HasElytra] run replaceitem entity @s[nbt=!{Inventory:[{Slot:102b,Count:1b}]},nbt=!{Inventory:[{id:"minecraft:elytra"}]}] armor.chest elytra{Unbreakable:1b,HideFlags:4,display:{Name:"{\"text\":\"Elytra\",\"italic\":\"false\",\"color\":\"dark_purple\",\"bold\":\"true\"}"}}


# RESET COURSES AND END BOXES
execute if block -27 13 78 clay run function d3:elytra/reset_entrances

execute if block -23 13 78 clay run fill -1506 167 2330 -1500 173 2330 iron_trapdoor[facing=south,open=true] replace air
execute if block -24 13 78 clay run fill -1883 207 2519 -1883 213 2525 iron_trapdoor[facing=west,open=true] replace air
execute if block -25 13 78 clay run fill -1951 75 2371 -1945 81 2371 iron_trapdoor[facing=south,open=true] replace air
execute if block -28 13 78 clay run fill -1858 11 2156 -1852 17 2156 iron_trapdoor[facing=south,open=true] replace air
execute if block -31 13 78 clay run fill -1939 56 1797 -1933 62 1797 iron_trapdoor[facing=north,open=true] replace air
execute if block -30 13 78 clay run fill -1796 14 1704 -1790 20 1704 iron_trapdoor[facing=north,open=true] replace air
execute if block -29 13 78 clay run fill -1454 48 1528 -1448 54 1528 iron_trapdoor[facing=north,open=true] replace air
execute if block -26 13 78 clay run fill -789 34 1994 -789 40 2000 iron_trapdoor[facing=east,open=true] replace air


# on X coordinates, add to the negative
# on Z coordinates, subtract from the postive


# WHITE RING TESTFOR
execute align x align y align z as @a[x=-1800.5,y=211.5,z=2021.5,dx=1.2,dy=3,dz=3] run function d3:elytra/central_hub/white_ring_1
execute align x align y align z as @a[x=-1776.5,y=203.5,z=1998.5,dx=3,dy=3,dz=1.2] run function d3:elytra/central_hub/white_ring_2
execute align x align y align z as @a[x=-1804.5,y=197.5,z=1975.5,dx=1.2,dy=3,dz=3] run function d3:elytra/central_hub/white_ring_3
execute align x align y align z as @a[x=-1819.5,y=192.5,z=1998.5,dx=3,dy=3,dz=1.2] run function d3:elytra/central_hub/white_ring_4
execute align x align y align z as @a[x=-1804.5,y=188.5,z=2010.5,dx=1.2,dy=3,dz=3] run function d3:elytra/central_hub/white_ring_5
execute align x align y align z as @a[x=-1788.5,y=183.5,z=2000.5,dx=3,dy=3,dz=1.2] run function d3:elytra/central_hub/white_ring_6
execute align x align y align z as @a[x=-1803.5,y=178.5,z=1985.5,dx=1.2,dy=3,dz=3] run function d3:elytra/central_hub/white_ring_7
execute align x align y align z as @a[x=-1824.5,y=205.5,z=1984.5,dx=3,dy=1.2,dz=3] run function d3:elytra/central_hub/white_ring_8

# YELLOW RING TESTFOR
execute align x align y align z as @a[x=-1613.5,y=153.5,z=2179.5,dx=3,dy=3,dz=1.2] run function d3:elytra/yellow_course/yellow_ring_1
execute align x align y align z as @a[x=-1495.5,y=124.5,z=2125.5,dx=1.2,dy=3,dz=3] run function d3:elytra/yellow_course/yellow_ring_2
execute align x align y align z as @a[x=-1531.5,y=155.5,z=2223.5,dx=1.2,dy=3,dz=3] run function d3:elytra/yellow_course/yellow_ring_3
execute align x align y align z as @a[x=-1529.5,y=180.5,z=2220.5,dx=3,dy=3,dz=1.2] run function d3:elytra/yellow_course/yellow_ring_4
execute align x align y align z as @a[x=-1585.5,y=109.5,z=2285.5,dx=1.2,dy=3,dz=3] run function d3:elytra/yellow_course/yellow_ring_5
execute align x align y align z as @a[x=-1636.5,y=54.5,z=2260.5,dx=3,dy=3,dz=1.2] run function d3:elytra/yellow_course/yellow_ring_6
execute align x align y align z as @a[x=-1679.5,y=113.5,z=2243.5,dx=3,dy=3,dz=1.2] run function d3:elytra/yellow_course/yellow_ring_7
execute align x align y align z as @a[x=-1590.5,y=75.5,z=2188.5,dx=1.2,dy=3,dz=3] run function d3:elytra/yellow_course/yellow_ring_8

# ORANGE RING TESTFOR
execute align x align y align z as @a[x=-1788.5,y=196.5,z=2130.5,dx=3,dy=3,dz=1.2] run function d3:elytra/orange_course/orange_ring_1
execute align x align y align z as @a[x=-1805.5,y=171.5,z=2213.5,dx=1.2,dy=3,dz=3] run function d3:elytra/orange_course/orange_ring_2
execute align x align y align z as @a[x=-1813.5,y=149.5,z=2278.5,dx=3,dy=3,dz=1.2] run function d3:elytra/orange_course/orange_ring_3
execute align x align y align z as @a[x=-1805.5,y=103.5,z=2366.5,dx=3,dy=3,dz=1.2] run function d3:elytra/orange_course/orange_ring_4
execute align x align y align z as @a[x=-1808.5,y=55.5,z=2463.5,dx=3,dy=3,dz=1.2] run function d3:elytra/orange_course/orange_ring_5
execute align x align y align z as @a[x=-1783.5,y=96.5,z=2460.5,dx=3,dy=1.2,dz=3] run function d3:elytra/orange_course/orange_ring_6
execute align x align y align z as @a[x=-1799.5,y=140.5,z=2455.5,dx=3,dy=1.2,dz=3] run function d3:elytra/orange_course/orange_ring_7
execute align x align y align z as @a[x=-1831.5,y=189.5,z=2488.5,dx=3,dy=3,dz=1.2] run function d3:elytra/orange_course/orange_ring_8

# PURPLE RING TESTFOR
execute align x align y align z as @a[x=-1888.5,y=160.5,z=2180.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_1
execute align x align y align z as @a[x=-1952.5,y=116.5,z=2210.5,dx=1.2,dy=3,dz=3] run function d3:elytra/purple_course/purple_ring_2
execute align x align y align z as @a[x=-2135.5,y=108.5,z=2072.5,dx=1.2,dy=3,dz=3] run function d3:elytra/purple_course/purple_ring_3
execute align x align y align z as @a[x=-2233.5,y=103.5,z=2125.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_4
execute align x align y align z as @a[x=-2352.5,y=99.5,z=2205.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_5
execute align x align y align z as @a[x=-2246.5,y=94.5,z=2209.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_6
execute align x align y align z as @a[x=-2140.5,y=107.5,z=2248.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_7
execute align x align y align z as @a[x=-2073.5,y=99.5,z=2208.5,dx=3,dy=3,dz=1.2] run function d3:elytra/purple_course/purple_ring_8

# GREEN RING TESTFOR
execute align x align y align z as @a[x=-1887.5,y=196.5,z=1974.5,dx=1.2,dy=3,dz=3] run function d3:elytra/green_course/green_ring_1
execute align x align y align z as @a[x=-1902.5,y=183.5,z=2015.5,dx=1.2,dy=3,dz=3] run function d3:elytra/green_course/green_ring_2
execute align x align y align z as @a[x=-1906.5,y=157.5,z=2027.5,dx=3,dy=1.2,dz=3] run function d3:elytra/green_course/green_ring_3
execute align x align y align z as @a[x=-2007.5,y=122.5,z=2027.5,dx=1.2,dy=3,dz=3] run function d3:elytra/green_course/green_ring_4
execute align x align y align z as @a[x=-2058.5,y=125.5,z=2030.5,dx=3,dy=3,dz=1.2] run function d3:elytra/green_course/green_ring_5
execute align x align y align z as @a[x=-2061.5,y=83.5,z=2034.5,dx=1.2,dy=3,dz=3] run function d3:elytra/green_course/green_ring_6
execute align x align y align z as @a[x=-2090.5,y=67.5,z=2024.5,dx=3,dy=3,dz=1.2] run function d3:elytra/green_course/green_ring_7
execute align x align y align z as @a[x=-1955.5,y=37.5,z=2036.5,dx=1.2,dy=3,dz=3] run function d3:elytra/green_course/green_ring_8

# LIGHT BLUE RING TESTFOR
execute align x align y align z as @a[x=-1960.5,y=179.5,z=1928.5,dx=1.2,dy=3,dz=3] run function d3:elytra/blue_course/blue_ring_1
execute align x align y align z as @a[x=-2079.5,y=153.5,z=1918.5,dx=3,dy=3,dz=1.2] run function d3:elytra/blue_course/blue_ring_2
execute align x align y align z as @a[x=-2075.5,y=149.5,z=1835.5,dx=1.2,dy=3,dz=3] run function d3:elytra/blue_course/blue_ring_3
execute align x align y align z as @a[x=-1999.5,y=138.5,z=1851.5,dx=1.2,dy=3,dz=3] run function d3:elytra/blue_course/blue_ring_4
execute align x align y align z as @a[x=-1936.5,y=125.5,z=1844.5,dx=3,dy=3,dz=1.2] run function d3:elytra/blue_course/blue_ring_5
execute align x align y align z as @a[x=-2055.5,y=103.5,z=1837.5,dx=3,dy=3,dz=1.2] run function d3:elytra/blue_course/blue_ring_6
execute align x align y align z as @a[x=-1989.5,y=84.5,z=1906.5,dx=1.2,dy=3,dz=3] run function d3:elytra/blue_course/blue_ring_7
execute align x align y align z as @a[x=-1931.5,y=71.5,z=1870.5,dx=3,dy=3,dz=1.2] run function d3:elytra/blue_course/blue_ring_8

# LIME RING TESTFOR
execute align x align y align z as @a[x=-1767.5,y=181.5,z=1826.5,dx=3,dy=3,dz=1.2] run function d3:elytra/lime_course/lime_ring_1
execute align x align y align z as @a[x=-1747.5,y=168.5,z=1748.5,dx=3,dy=3,dz=1.2] run function d3:elytra/lime_course/lime_ring_2
execute align x align y align z as @a[x=-1843.5,y=152.5,z=1750.5,dx=3,dy=3,dz=1.2] run function d3:elytra/lime_course/lime_ring_3
execute align x align y align z as @a[x=-1708.5,y=115.5,z=1830.5,dx=1.2,dy=3,dz=3] run function d3:elytra/lime_course/lime_ring_4
execute align x align y align z as @a[x=-1714.5,y=79.5,z=1794.5,dx=3,dy=3,dz=1.2] run function d3:elytra/lime_course/lime_ring_5
execute align x align y align z as @a[x=-1811.5,y=41.5,z=1690.5,dx=1.2,dy=3,dz=3] run function d3:elytra/lime_course/lime_ring_6
execute align x align y align z as @a[x=-1852.5,y=30.5,z=1761.5,dx=3,dy=3,dz=1.2] run function d3:elytra/lime_course/lime_ring_7
execute align x align y align z as @a[x=-1803.5,y=23.5,z=1782.5,dx=1.2,dy=3,dz=3] run function d3:elytra/lime_course/lime_ring_8

# BLACK RING TESTFOR
execute align x align y align z as @a[x=-1672.5,y=200.5,z=1870.5,dx=1.2,dy=3,dz=3] run function d3:elytra/black_course/black_ring_1
execute align x align y align z as @a[x=-1545.5,y=175.5,z=1907.5,dx=1.2,dy=3,dz=3] run function d3:elytra/black_course/black_ring_2
execute align x align y align z as @a[x=-1507.5,y=150.5,z=1841.5,dx=3,dy=3,dz=1.2] run function d3:elytra/black_course/black_ring_3
execute align x align y align z as @a[x=-1529.5,y=133.5,z=1747.5,dx=1.2,dy=3,dz=3] run function d3:elytra/black_course/black_ring_4
execute align x align y align z as @a[x=-1652.5,y=86.5,z=1822.5,dx=3,dy=3,dz=1.2] run function d3:elytra/black_course/black_ring_5
execute align x align y align z as @a[x=-1518.5,y=67.5,z=1846.5,dx=1.2,dy=3,dz=3] run function d3:elytra/black_course/black_ring_6
execute align x align y align z as @a[x=-1463.5,y=62.5,z=1788.5,dx=3,dy=3,dz=1.2] run function d3:elytra/black_course/black_ring_7
execute align x align y align z as @a[x=-1432.5,y=34.5,z=1574.5,dx=3,dy=3,dz=1.2] run function d3:elytra/black_course/black_ring_8

# BROWN RING TESTFOR
execute align x align y align z as @a[x=-1658.5,y=201.5,z=1997.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_1
execute align x align y align z as @a[x=-1413.5,y=165.5,z=1985.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_2
execute align x align y align z as @a[x=-1301.5,y=146.5,z=1984.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_3
execute align x align y align z as @a[x=-1211.5,y=139.5,z=2002.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_4
execute align x align y align z as @a[x=-1104.5,y=122.5,z=2008.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_5
execute align x align y align z as @a[x=-931.5,y=62.5,z=1997.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_6
execute align x align y align z as @a[x=-850.5,y=61.5,z=2021.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_7
execute align x align y align z as @a[x=-830.5,y=44.5,z=1955.5,dx=1.2,dy=3,dz=3] run function d3:elytra/brown_course/brown_ring_8


# RING COMPLETION
execute if block -27 13 78 white_terracotta run fill -1756 203 2044 -1752 209 2048 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1803 207 2063 -1797 213 2063 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1850 208 2045 -1846 214 2049 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1867 207 1997 -1867 213 2003 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1841 207 1948 -1835 213 1952 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1803 207 1929 -1797 213 1929 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1750 207 1946 -1746 213 1950 air replace iron_trapdoor
execute if block -27 13 78 white_terracotta run fill -1736 213 1995 -1736 219 2001 air replace iron_trapdoor

execute if block -23 13 78 yellow_terracotta run fill -1506 167 2330 -1500 173 2330 air replace iron_trapdoor
execute if block -24 13 78 orange_terracotta run fill -1883 207 2519 -1883 213 2525 air replace iron_trapdoor
execute if block -25 13 78 purple_terracotta run fill -1951 75 2371 -1945 81 2371 air replace iron_trapdoor
execute if block -28 13 78 green_terracotta run fill -1858 11 2156 -1852 17 2156 air replace iron_trapdoor
execute if block -31 13 78 light_blue_terracotta run fill -1939 56 1797 -1933 62 1797 air replace iron_trapdoor
execute if block -30 13 78 lime_terracotta run fill -1796 14 1704 -1790 20 1704 air replace iron_trapdoor
execute if block -29 13 78 black_terracotta run fill -1454 48 1528 -1448 54 1528 air replace iron_trapdoor
execute if block -26 13 78 brown_terracotta run fill -789 34 1994 -789 40 2000 air replace iron_trapdoor


# COURSE COMPLETION
#execute if entity @a[tag=SafeZone] align x align y align z unless entity @a[x=-1821,y=210,z=1979,dx=43,dy=18,dz=40] run function d3:elytra/complete_course
execute if entity @a[tag=SafeZone] run function d3:elytra/complete_course


# RING RESETS
execute if block -27 13 78 clay run function d3:elytra/central_hub/white_ring_reset
execute if block -23 13 78 clay run function d3:elytra/yellow_course/yellow_ring_reset
execute if block -24 13 78 clay run function d3:elytra/orange_course/orange_ring_reset
execute if block -25 13 78 clay run function d3:elytra/purple_course/purple_ring_reset
execute if block -26 13 78 clay run function d3:elytra/brown_course/brown_ring_reset
execute if block -28 13 78 clay run function d3:elytra/green_course/green_ring_reset
execute if block -29 13 78 clay run function d3:elytra/black_course/black_ring_reset
execute if block -30 13 78 clay run function d3:elytra/lime_course/lime_ring_reset
execute if block -31 13 78 clay run function d3:elytra/blue_course/blue_ring_reset


# COURSE ENTRANCES
execute align x align y align z as @a[x=-1756,y=204,z=2045,dx=2,dy=4,dz=3] run function d3:elytra/reset_player
execute align x align y align z as @a[x=-1754,y=204,z=2044,dx=1,dy=4,dz=2] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1753,y=204,z=2047,dx=8,dy=4,dz=8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1802,y=208,z=2062,dx=4,dy=4,dz=-1] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1802,y=208,z=2063,dx=4,dy=4,dz=8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1850,y=209,z=2045,dx=4,dy=4,dz=2] run function d3:elytra/reset_player
execute align x align y align z as @a[x=-1848,y=209,z=2048,dx=2,dy=4,dz=1] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1849,y=209,z=2048,dx=-8,dy=4,dz=8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1866,y=208,z=1998,dx=1,dy=4,dz=4] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1867,y=208,z=1998,dx=-8,dy=4,dz=4] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1837,y=208,z=1948,dx=2,dy=4,dz=4] run function d3:elytra/reset_player
execute align x align y align z as @a[x=-1839,y=208,z=1950,dx=1,dy=4,dz=2] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1838,y=208,z=1949,dx=-8,dy=4,dz=-8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1802,y=208,z=1930,dx=4,dy=4,dz=1] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1802,y=208,z=1929,dx=4,dy=4,dz=-8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1750,y=208,z=1948,dx=4,dy=4,dz=0] run function d3:elytra/reset_player
execute align x align y align z as @a[x=-1750,y=208,z=1946,dx=4,dy=4,dz=2] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1747,y=208,z=1947,dx=8,dy=4,dz=-8] run function d3:elytra/set_player

execute align x align y align z as @a[x=-1737,y=214,z=1996,dx=-1,dy=4,dz=4] run function d3:elytra/reset_player
execute align x align y align z if entity @a[x=-1736,y=214,z=1996,dx=8,dy=4,dz=4] run function d3:elytra/set_player


# TELEPORT BACK ONGROUND
tag @a remove SafeZone
execute align x align y align z as @a[x=-1821,y=210,z=1979,dx=43,dy=18,dz=40] run function d3:elytra/remove_firework_tags

execute align x align y align z run tag @a[x=-1821,y=210,z=1979,dx=43,dy=18,dz=40] add SafeZone

execute align x align y align z run tag @a[x=-1511,y=163,z=2331,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1900,y=203,z=2514,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1956,y=71,z=2372,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1863,y=7,z=2157,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1944,y=52,z=1780,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1801,y=10,z=1687,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-1459,y=44,z=1506,dx=16,dy=14,dz=16] add SafeZone
execute align x align y align z run tag @a[x=-788,y=30,z=1989,dx=16,dy=14,dz=16] add SafeZone

execute align x align y align z run tag @a[x=-1814,y=86,z=2039,dx=28,dy=24,dz=12] add SafeZone


clear @a[tag=!SafeZone,nbt={OnGround:1b},gamemode=adventure] firework_rocket
effect give @a[tag=SafeZone,nbt=!{Health:20.0f}] regeneration 1 255 true
execute align x align y align z run effect clear @a[x=-1821,y=210,z=1979,dx=43,dy=18,dz=40] night_vision

execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=YellowRing,nbt={OnGround:1b},gamemode=adventure] -1788 224 2010 316.5 20
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=OrangeRing,nbt={OnGround:1b},gamemode=adventure] -1800 224 2012 0 15
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=PurpleRing,nbt={OnGround:1b},gamemode=adventure] -1812 224 2007 42 13.5
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=GreenRing,nbt={OnGround:1b},gamemode=adventure] -1817 225 1998 87.5 17
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=BlueRing,nbt={OnGround:1b},gamemode=adventure] -1810 226 1989 145 18
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=LimeRing,nbt={OnGround:1b},gamemode=adventure] -1800 226 1986 180 16
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=BlackRing,nbt={OnGround:1b},gamemode=adventure] -1789 226 1990 224.5 15
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=BrownRing,nbt={OnGround:1b},gamemode=adventure] -1785 225 2000 267.5 10.5
execute unless block -20 1 78 purple_concrete_powder run teleport @a[tag=!SafeZone,tag=!YellowRing,tag=!OrangeRing,tag=!PurpleRing,tag=!GreenRing,tag=!BlueRing,tag=!LimeRing,tag=!BlackRing,tag=!BrownRing,tag=!LeaveElytra,nbt={OnGround:1b},gamemode=adventure] -1800 223 2000 0 0


# SPAWNPOINT POSITION RESETS
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1788,y=219,z=2010,dx=0,dy=3,dz=0] -1788 224 2010 316.5 20
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1800,y=219,z=2012,dx=0,dy=3,dz=0] -1800 224 2012 0 15
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1812,y=219,z=2007,dx=0,dy=3,dz=0] -1812 224 2007 42 13.5
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1817,y=220,z=1998,dx=0,dy=3,dz=0] -1817 225 1998 87.5 17
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1810,y=221,z=1989,dx=0,dy=3,dz=0] -1810 226 1989 145 18
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1800,y=221,z=1986,dx=0,dy=3,dz=0] -1800 226 1986 180 16
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1789,y=221,z=1990,dx=0,dy=3,dz=0] -1789 226 1990 224.5 15
execute unless block -20 1 78 purple_concrete_powder align x align y align z run teleport @a[tag=!LeaveElytra,x=-1785,y=220,z=2000,dx=0,dy=3,dz=0] -1785 225 2000 267.5 10.5


# END
execute if block -27 15 78 clay run scoreboard objectives remove ElytraEnd
execute if block -27 15 78 white_terracotta run scoreboard objectives add ElytraEnd dummy
scoreboard players add @e[tag=MainElytraAEC] ElytraEnd 0
execute if entity @e[scores={ElytraEnd=0..}] run function d3:elytra/elytra_end