####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 3 2018 / APRIL 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

# SETUP
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -996 21 998 -996 21 999 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -997 19 999 lever[facing=west,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -996 23 1001 -996 23 1002 quartz_pillar[axis=y]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -997 21 1001 lever[facing=west,powered=true]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -1004 30 998 -1004 30 999 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1003 28 999 lever[face=wall,facing=east,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -1004 32 1001 -1004 32 1002 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1003 30 1001 lever[face=wall,facing=east,powered=false]


execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -999 39 1002 -999 40 1002 quartz_pillar[axis=x]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1004 39 1003 lever[face=wall,facing=south,powered=true]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -996 39 1002 -996 40 1002 quartz_pillar[axis=x]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -998 39 1001 lever[face=wall,facing=north,powered=true]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -1001 39 998 -1001 40 998 quartz_pillar[axis=x]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -996 39 999 lever[face=wall,facing=south,powered=true]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run fill -1003 39 998 -1003 40 998 quartz_pillar[axis=z]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1002 39 996 lever[face=wall,facing=east,powered=true]


execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1010 42 992 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1012 43 992 lever[face=floor,facing=west,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1008 43 991 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1008 44 988 lever[face=floor,facing=north,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1010 44 991 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1012 45 991 lever[face=floor,facing=west,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1009 45 991 quartz_pillar[axis=z]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1009 46 988 lever[face=floor,facing=north,powered=true]


execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1012 55 992 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1012 57 994 air
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1011 55 994 lever[face=wall,facing=east,powered=false]

execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1006 54 993 quartz_pillar[axis=y]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1007 54 994 quartz_pillar[axis=y]
execute if entity @e[scores={EscapeLevel=3,EscapeTimer=1}] run setblock -1008 62 994 lever[face=wall,facing=west,powered=true]



# SECTION 1
execute if block -997 19 999 lever[powered=false] run execute if block -996 21 998 quartz_pillar run playsound block.stone.break master @a -996 21 998
execute if block -997 19 999 lever[powered=false] run fill -996 21 998 -996 21 999 air replace quartz_pillar
execute if block -997 19 999 lever[powered=true] run execute align x align y align z run execute as @e[x=-996,y=21,z=998,dx=0,dy=0,dz=1] at @s run teleport @s ~ ~1 ~
execute if block -997 19 999 lever[powered=true] run execute if block -996 21 998 air run playsound block.stone.place master @a -996 21 998
execute if block -997 19 999 lever[powered=true] run fill -996 21 998 -996 21 999 quartz_pillar[axis=y] replace air

execute if block -997 21 1001 lever[powered=false] run execute if block -996 23 1001 quartz_pillar run playsound block.stone.break master @a -996 23 1001
execute if block -997 21 1001 lever[powered=false] run fill -996 23 1001 -996 23 1002 air replace quartz_pillar
execute if block -997 21 1001 lever[powered=true] run execute align x align y align z run execute as @e[x=-996,y=23,z=1001,dx=0,dy=0,dz=1] at @s run teleport @s ~ ~1 ~
execute if block -997 21 1001 lever[powered=true] run execute if block -996 23 1001 air run playsound block.stone.place master @a -996 23 1001
execute if block -997 21 1001 lever[powered=true] run fill -996 23 1001 -996 23 1002 quartz_pillar[axis=y] replace air


# SECTION 2
execute if block -1003 28 999 lever[powered=false] run execute if block -1004 30 998 quartz_pillar run playsound block.stone.break master @a -1004 30 998
execute if block -1003 28 999 lever[powered=false] run fill -1004 30 998 -1004 30 999 air replace quartz_pillar
execute if block -1003 28 999 lever[powered=true] run execute align x align y align z run execute as @e[x=-1004,y=30,z=998,dx=0,dy=0,dz=1] at @s run teleport @s ~ ~1 ~
execute if block -1003 28 999 lever[powered=true] run execute if block -1004 30 998 air run playsound block.stone.place master @a -1004 30 998
execute if block -1003 28 999 lever[powered=true] run fill -1004 30 998 -1004 30 999 quartz_pillar[axis=y] replace air

execute if block -1003 30 1001 lever[powered=false] run execute if block -1004 32 1001 quartz_pillar run playsound block.stone.break master @a -1004 32 1001
execute if block -1003 30 1001 lever[powered=false] run fill -1004 32 1001 -1004 32 1002 air replace quartz_pillar
execute if block -1003 30 1001 lever[powered=true] run execute align x align y align z run execute as @e[x=-1004,y=32,z=1001,dx=0,dy=0,dz=1] at @s run teleport @s ~ ~1 ~
execute if block -1003 30 1001 lever[powered=true] run execute if block -1004 32 1001 air run playsound block.stone.place master @a -1004 32 1001
execute if block -1003 30 1001 lever[powered=true] run fill -1004 32 1001 -1004 32 1002 quartz_pillar[axis=y] replace air


# SECTION 3
execute if block -1004 39 1003 lever[powered=false] run execute if block -999 39 1002 quartz_pillar run playsound block.stone.break master @a -999 39 1002
execute if block -1004 39 1003 lever[powered=false] run fill -999 39 1002 -999 40 1002 air replace quartz_pillar
execute if block -1004 39 1003 lever[powered=true] run execute if block -999 39 1002 air run playsound block.stone.place master @a -999 39 1002
execute if block -1004 39 1003 lever[powered=true] run fill -999 39 1002 -999 40 1002 quartz_pillar[axis=x] replace air

execute if block -998 39 1001 lever[powered=false] run execute if block -996 39 1002 quartz_pillar run playsound block.stone.break master @a -996 39 1002
execute if block -998 39 1001 lever[powered=false] run fill -996 39 1002 -996 40 1002 air replace quartz_pillar
execute if block -998 39 1001 lever[powered=true] run execute if block -996 39 1002 air run playsound block.stone.place master @a -996 39 1002
execute if block -998 39 1001 lever[powered=true] run fill -996 39 1002 -996 40 1002 quartz_pillar[axis=x] replace air

execute if block -996 39 999 lever[powered=false] run execute if block -1001 39 998 quartz_pillar run playsound block.stone.break master @a -1001 39 998
execute if block -996 39 999 lever[powered=false] run fill -1001 39 998 -1001 40 998 air replace quartz_pillar
execute if block -996 39 999 lever[powered=true] run execute if block -1001 39 998 air run playsound block.stone.place master @a -1001 39 998
execute if block -996 39 999 lever[powered=true] run fill -1001 39 998 -1001 40 998 quartz_pillar[axis=x] replace air

execute if block -1002 39 996 lever[powered=false] run execute if block -1003 39 998 quartz_pillar run playsound block.stone.break master @a -1003 39 998
execute if block -1002 39 996 lever[powered=false] run fill -1003 39 998 -1003 40 998 air replace quartz_pillar
execute if block -1002 39 996 lever[powered=true] run execute if block -1003 39 998 air run playsound block.stone.place master @a -1003 39 998
execute if block -1002 39 996 lever[powered=true] run fill -1003 39 998 -1003 40 998 quartz_pillar[axis=z] replace air


# SECTION 4
execute if block -1012 43 992 lever[powered=false] run execute if block -1010 42 992 quartz_pillar run playsound block.stone.break master @a -1010 42 992
execute if block -1012 43 992 lever[powered=false] run fill -1010 42 992 -1010 42 992 air replace quartz_pillar
execute if block -1012 43 992 lever[powered=true] run execute if block -1010 42 992 air run playsound block.stone.place master @a -1010 42 992
execute if block -1012 43 992 lever[powered=true] run fill -1010 42 992 -1010 42 992 quartz_pillar[axis=x] replace air

execute if block -1008 44 988 lever[powered=false] run execute if block -1008 43 991 quartz_pillar run playsound block.stone.break master @a -1008 43 991
execute if block -1008 44 988 lever[powered=false] run fill -1008 43 991 -1008 43 991 air replace quartz_pillar
execute if block -1008 44 988 lever[powered=true] run execute if block -1008 43 991 air run playsound block.stone.place master @a -1008 43 991
execute if block -1008 44 988 lever[powered=true] run fill -1008 43 991 -1008 43 991 quartz_pillar[axis=z] replace air

execute if block -1012 45 991 lever[powered=false] run execute if block -1010 44 991 quartz_pillar run playsound block.stone.break master @a -1010 44 991
execute if block -1012 45 991 lever[powered=false] run fill -1010 44 991 -1010 44 991 air replace quartz_pillar
execute if block -1012 45 991 lever[powered=true] run execute if block -1010 44 991 air run playsound block.stone.place master @a -1010 44 991
execute if block -1012 45 991 lever[powered=true] run fill -1010 44 991 -1010 44 991 quartz_pillar[axis=x] replace air

execute if block -1009 46 988 lever[powered=false] run execute if block -1009 45 991 quartz_pillar run playsound block.stone.break master @a -1009 45 991
execute if block -1009 46 988 lever[powered=false] run fill -1009 45 991 -1009 45 991 air replace quartz_pillar
execute if block -1009 46 988 lever[powered=true] run execute if block -1009 45 991 air run playsound block.stone.place master @a -1009 45 991
execute if block -1009 46 988 lever[powered=true] run fill -1009 45 991 -1009 45 991 quartz_pillar[axis=z] replace air


# SECTION 5
execute if block -1011 55 994 lever[powered=false] run execute if block -1012 57 994 quartz_pillar run playsound block.stone.break master @a -1012 57 994
execute if block -1011 55 994 lever[powered=false] run fill -1012 55 992 -1012 55 992 air replace quartz_pillar
execute if block -1011 55 994 lever[powered=false] run fill -1012 57 994 -1012 57 994 air replace quartz_pillar
execute if block -1011 55 994 lever[powered=true] run execute align x align y align z run execute as @e[x=-1012,y=57,z=994,dx=0,dy=0,dz=0] at @s run teleport @s ~ ~1 ~
execute if block -1011 55 994 lever[powered=true] run execute if block -1012 57 994 air run playsound block.stone.place master @a -1012 57 994
execute if block -1011 55 994 lever[powered=true] run fill -1012 55 992 -1012 55 992 quartz_pillar[axis=z] replace air
execute if block -1011 55 994 lever[powered=true] run fill -1012 57 994 -1012 57 994 quartz_pillar[axis=y] replace air

execute if block -1008 62 994 lever[powered=false] run execute if block -1006 54 993 quartz_pillar run playsound block.stone.break master @a -1006 54 993
execute if block -1008 62 994 lever[powered=false] run fill -1007 54 994 -1007 54 994 air replace quartz_pillar
execute if block -1008 62 994 lever[powered=false] run fill -1006 54 993 -1006 54 993 air replace quartz_pillar

execute if block -1008 62 994 lever[powered=true] run execute if block -1006 54 993 air run playsound block.stone.place master @a -1006 54 993
execute if block -1008 62 994 lever[powered=true] run fill -1007 54 994 -1007 54 994 quartz_pillar[axis=y] replace air
execute if block -1008 62 994 lever[powered=true] run fill -1006 54 993 -1006 54 993 quartz_pillar[axis=y] replace air
