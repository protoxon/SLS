####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 10 2018 / NOVEMBER 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AL5SouthtoNorth
#scoreboard objectives setdisplay sidebar AL5NorthtoSouth
#scoreboard objectives setdisplay sidebar AL5Depressurize
#scoreboard objectives setdisplay sidebar AL5NDoorOpens
#scoreboard objectives setdisplay sidebar AL5NDoorCloses
#scoreboard objectives setdisplay sidebar AL5SDoorOpens
#scoreboard objectives setdisplay sidebar AL5SDoorCloses


execute unless entity @a[tag=Airlock5] run tag @a remove AL5Favour
execute align x align y align z run tag @a[x=924,y=95,z=2088,dx=6,dy=4,dz=6] remove AL5Favour
execute align x align y align z run tag @a[x=926,y=95,z=2099,dx=2,dy=4,dz=3] remove AL5Favour
execute align x align y align z run tag @a[x=926,y=95,z=2080,dx=2,dy=4,dz=3] remove AL5Favour

execute unless entity @a[tag=AL5Favour] align x align y align z run tag @a[x=924,y=95,z=2094,dx=6,dy=4,dz=4] add AL5Favour
execute unless entity @a[tag=AL5Favour] align x align y align z run tag @a[x=924,y=95,z=2084,dx=6,dy=4,dz=4] add AL5Favour

execute unless entity @a[tag=Airlock5South] run scoreboard objectives remove AL5SouthtoNorth
execute unless entity @a[tag=Airlock5North] run scoreboard objectives remove AL5NorthtoSouth


execute if entity @a[tag=Airlock5,tag=!HasSuit] run scoreboard players set @e[scores={AL5NorthtoSouth=60..99}] AL5NorthtoSouth -50
execute if entity @a[tag=Airlock5,tag=!HasSuit] run scoreboard players set @e[scores={AL5NorthtoSouth=229..248}] AL5NorthtoSouth -50

# SOUTH TO NORTH
execute align x align y align z run tag @a[x=926,y=95,z=2099,dx=2,dy=4,dz=3] remove Airlock5South
execute align x align y align z run tag @a[x=925,y=95,z=2083,dx=4,dy=4,dz=3] remove Airlock5South

execute align x align y align z run tag @a[x=924,y=95,z=2094,dx=6,dy=4,dz=4] add Airlock5South
execute if entity @a[tag=Airlock5South,tag=AL5Favour] unless entity @e[scores={AL5NorthtoSouth=..1000}] run scoreboard objectives add AL5SouthtoNorth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5SouthtoNorth 0

scoreboard players add @e[scores={AL5SouthtoNorth=..49}] AL5SouthtoNorth 1
execute if entity @e[scores={AL5SouthtoNorth=1}] if block 927 95 2088 air run scoreboard players set @e[scores={AL5SouthtoNorth=1}] AL5SouthtoNorth -51
execute if entity @e[scores={AL5SouthtoNorth=-50}] run scoreboard objectives add AL5NDoorCloses dummy
execute if entity @e[scores={AL5SouthtoNorth=20}] run scoreboard objectives add AL5SDoorOpens dummy

execute if entity @a[tag=Airlock5South,x=924,y=95,z=2089,dx=6,dy=4,dz=4] unless entity @a[x=924,y=95,z=2094,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL5SouthtoNorth=50..60}] AL5SouthtoNorth 1
scoreboard players add @e[scores={AL5SouthtoNorth=61..249}] AL5SouthtoNorth 1
execute if entity @e[scores={AL5SouthtoNorth=62}] run scoreboard objectives add AL5SDoorCloses dummy
execute if entity @e[scores={AL5SouthtoNorth=100}] run scoreboard objectives add AL5Depressurize dummy
 
execute if entity @e[scores={AL5SouthtoNorth=230}] run playsound block.note_block.chime master @a 927 81 2091 1.5 0.89 0
execute if entity @e[scores={AL5SouthtoNorth=249}] run scoreboard objectives add AL5NDoorOpens dummy
execute if entity @e[scores={AL5SouthtoNorth=250}] align x align y align z unless entity @a[x=924,y=95,z=2088,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock5North] if block 927 95 2088 air run scoreboard objectives add AL5NDoorCloses dummy
execute if entity @e[scores={AL5SouthtoNorth=250}] align x align y align z unless entity @a[x=924,y=95,z=2088,dx=6,dy=4,dz=6] run scoreboard objectives remove AL5SouthtoNorth


# NORTH TO SOUTH
execute align x align y align z run tag @a[x=926,y=95,z=2080,dx=2,dy=4,dz=3] remove Airlock5North
execute align x align y align z run tag @a[x=925,y=95,z=2096,dx=4,dy=4,dz=3] remove Airlock5North

execute align x align y align z run tag @a[x=924,y=95,z=2084,dx=6,dy=4,dz=4] add Airlock5North
execute if entity @a[tag=Airlock5North,tag=AL5Favour] unless entity @e[scores={AL5SouthtoNorth=..1000}] run scoreboard objectives add AL5NorthtoSouth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5NorthtoSouth 0

scoreboard players add @e[scores={AL5NorthtoSouth=..49}] AL5NorthtoSouth 1
execute if entity @e[scores={AL5NorthtoSouth=1}] if block 927 95 2094 air run scoreboard players set @e[scores={AL5NorthtoSouth=1}] AL5NorthtoSouth -51
execute if entity @e[scores={AL5NorthtoSouth=-50}] run scoreboard objectives add AL5SDoorCloses dummy
execute if entity @e[scores={AL5NorthtoSouth=20}] run scoreboard objectives add AL5NDoorOpens dummy

execute if entity @a[tag=Airlock5North,x=924,y=95,z=2089,dx=6,dy=4,dz=4] unless entity @a[x=924,y=95,z=2084,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL5NorthtoSouth=50..60}] AL5NorthtoSouth 1
scoreboard players add @e[scores={AL5NorthtoSouth=61..249}] AL5NorthtoSouth 1
execute if entity @e[scores={AL5NorthtoSouth=62}] run scoreboard objectives add AL5NDoorCloses dummy
execute if entity @e[scores={AL5NorthtoSouth=100}] run scoreboard objectives add AL5Depressurize dummy

execute if entity @e[scores={AL5NorthtoSouth=230}] run playsound block.note_block.chime master @a 927 81 2091 1.5 0.89 0
execute if entity @e[scores={AL5NorthtoSouth=249}] run scoreboard objectives add AL5SDoorOpens dummy
execute if entity @e[scores={AL5NorthtoSouth=250}] align x align y align z unless entity @a[x=924,y=95,z=2088,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock5South] if block 927 95 2094 air run scoreboard objectives add AL5SDoorCloses dummy
execute if entity @e[scores={AL5NorthtoSouth=250}] align x align y align z unless entity @a[x=924,y=95,z=2088,dx=6,dy=4,dz=6] run scoreboard objectives remove AL5NorthtoSouth




# DEPRESSURIZE
#scoreboard objectives add AL5Depressurize dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5Depressurize 1
execute if entity @e[scores={AL5Depressurize=1}] run stopsound @a[scores={SuitOff=1..}]
execute if entity @e[scores={AL5Depressurize=1}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=5}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=10}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=15}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=20}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=25}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=30}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=35}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=40}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=45}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=50}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=55}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=60}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=65}] run playsound entity.generic.burn master @a 924 97 2091 0.2 0.5 0

execute if entity @e[scores={AL5Depressurize=1}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=5}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=10}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=15}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=20}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=25}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=30}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=35}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=40}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=45}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=50}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=55}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=60}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0
execute if entity @e[scores={AL5Depressurize=65}] run playsound entity.generic.burn master @a 929 97 2091 0.2 0.5 0

execute if entity @e[scores={AL5Depressurize=3..}] run particle cloud 925.0 96.5 2091.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL5Depressurize=3..}] run particle cloud 925.0 99.5 2091.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL5Depressurize=5..}] run particle cloud 926.0 97.5 2091.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL5Depressurize=5..}] run particle cloud 926.0 98.5 2091.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL5Depressurize=9..}] run particle cloud 927.0 98.0 2091.5 0.4 1.2 0.2 0 5 force

execute if entity @e[scores={AL5Depressurize=3..}] run particle cloud 929.0 96.5 2091.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL5Depressurize=3..}] run particle cloud 929.0 99.5 2091.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL5Depressurize=5..}] run particle cloud 928.0 97.5 2091.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL5Depressurize=5..}] run particle cloud 928.0 98.5 2091.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL5Depressurize=9..}] run particle cloud 927.0 98.0 2091.5 0.4 1.2 0.2 0 5 force
execute if entity @e[scores={AL5Depressurize=65..}] run scoreboard objectives remove AL5Depressurize



# NORTH DOOR OPENS
#scoreboard objectives add AL5NDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5NDoorOpens 1
execute if entity @e[scores={AL5NDoorOpens=1}] unless block 927 95 2088 air run playsound entity.generic.burn master @a 927 95 2088 0.2 1.5 0
execute if entity @e[scores={AL5NDoorOpens=1}] unless block 927 95 2088 air run playsound entity.evoker.cast_spell master @a 927 95 2088 0.2 1.3 0

execute if entity @e[scores={AL5NDoorOpens=1}] run fill 926 95 2088 928 100 2088 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5NDoorOpens=1}] run fill 927 95 2088 927 100 2088 air

execute if entity @e[scores={AL5NDoorOpens=2}] run fill 925 95 2088 929 100 2088 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5NDoorOpens=2}] run fill 926 95 2088 928 100 2088 air

execute if entity @e[scores={AL5NDoorOpens=3}] run fill 924 95 2088 930 100 2088 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5NDoorOpens=3}] run fill 925 95 2088 929 100 2088 air
execute if entity @e[scores={AL5NDoorOpens=3..}] run scoreboard objectives remove AL5NDoorOpens


# NORTH DOOR CLOSES
#scoreboard objectives add AL5NDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5NDoorCloses 1
execute if entity @e[scores={AL5NDoorCloses=1}] if block 927 95 2088 air run playsound entity.generic.burn master @a 927 95 2088 0.2 1.5 0
execute if entity @e[scores={AL5NDoorCloses=1}] if block 927 95 2088 air run playsound entity.evoker.cast_spell master @a 927 95 2088 0.2 1.3 0

execute if entity @e[scores={AL5NDoorCloses=1}] run fill 924 95 2088 924 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=1}] run fill 930 95 2088 930 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=1}] run fill 925 95 2088 925 100 2088 orange_stained_glass
execute if entity @e[scores={AL5NDoorCloses=1}] run fill 929 95 2088 929 100 2088 orange_stained_glass

execute if entity @e[scores={AL5NDoorCloses=2}] run fill 925 95 2088 925 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=2}] run fill 929 95 2088 929 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=2}] run fill 926 95 2088 926 100 2088 orange_stained_glass
execute if entity @e[scores={AL5NDoorCloses=2}] run fill 928 95 2088 928 100 2088 orange_stained_glass

execute if entity @e[scores={AL5NDoorCloses=3}] run fill 926 95 2088 926 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=3}] run fill 928 95 2088 928 100 2088 white_stained_glass
execute if entity @e[scores={AL5NDoorCloses=3}] run fill 927 95 2088 927 100 2088 orange_stained_glass
execute if entity @e[scores={AL5NDoorCloses=3..}] run scoreboard objectives remove AL5NDoorCloses


# SOUTH DOOR OPENS
#scoreboard objectives add AL5SDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5SDoorOpens 1
execute if entity @e[scores={AL5SDoorOpens=1}] unless block 927 95 2094 air run playsound entity.generic.burn master @a 927 95 2094 0.2 1.5 0
execute if entity @e[scores={AL5SDoorOpens=1}] unless block 927 95 2094 air run playsound entity.evoker.cast_spell master @a 927 95 2094 0.2 1.3 0

execute if entity @e[scores={AL5SDoorOpens=1}] run fill 926 95 2094 928 100 2094 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5SDoorOpens=1}] run fill 927 95 2094 927 100 2094 air

execute if entity @e[scores={AL5SDoorOpens=2}] run fill 925 95 2094 929 100 2094 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5SDoorOpens=2}] run fill 926 95 2094 928 100 2094 air

execute if entity @e[scores={AL5SDoorOpens=3}] run fill 924 95 2094 930 100 2094 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL5SDoorOpens=3}] run fill 925 95 2094 929 100 2094 air
execute if entity @e[scores={AL5SDoorOpens=3..}] run scoreboard objectives remove AL5SDoorOpens



# SOUTH DOOR OPENS
#scoreboard objectives add AL5SDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL5SDoorCloses 1
execute if entity @e[scores={AL5SDoorCloses=1}] if block 927 95 2094 air run playsound entity.generic.burn master @a 927 95 2094 0.2 1.5 0
execute if entity @e[scores={AL5SDoorCloses=1}] if block 927 95 2094 air run playsound entity.evoker.cast_spell master @a 927 95 2094 0.2 1.3 0

execute if entity @e[scores={AL5SDoorCloses=1}] run fill 924 95 2094 924 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=1}] run fill 930 95 2094 930 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=1}] run fill 925 95 2094 925 100 2094 orange_stained_glass
execute if entity @e[scores={AL5SDoorCloses=1}] run fill 929 95 2094 929 100 2094 orange_stained_glass

execute if entity @e[scores={AL5SDoorCloses=2}] run fill 925 95 2094 925 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=2}] run fill 929 95 2094 929 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=2}] run fill 926 95 2094 926 100 2094 orange_stained_glass
execute if entity @e[scores={AL5SDoorCloses=2}] run fill 928 95 2094 928 100 2094 orange_stained_glass

execute if entity @e[scores={AL5SDoorCloses=3}] run fill 926 95 2094 926 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=3}] run fill 928 95 2094 928 100 2094 white_stained_glass
execute if entity @e[scores={AL5SDoorCloses=3}] run fill 927 95 2094 927 100 2094 orange_stained_glass
execute if entity @e[scores={AL5SDoorCloses=3..}] run scoreboard objectives remove AL5SDoorCloses
