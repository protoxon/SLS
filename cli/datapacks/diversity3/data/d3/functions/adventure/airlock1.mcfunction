####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 4 2018 / NOVEMBER 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AL1SouthtoNorth
#scoreboard objectives setdisplay sidebar AL1NorthtoSouth
#scoreboard objectives setdisplay sidebar AL1Depressurize
#scoreboard objectives setdisplay sidebar AL1NDoorOpens
#scoreboard objectives setdisplay sidebar AL1NDoorCloses
#scoreboard objectives setdisplay sidebar AL1SDoorOpens
#scoreboard objectives setdisplay sidebar AL1SDoorCloses


execute unless entity @a[tag=Airlock1] run tag @a remove AL1Favour
execute align x align y align z run tag @a[x=1007,y=106,z=1957,dx=6,dy=4,dz=6] remove AL1Favour
execute align x align y align z run tag @a[x=1009,y=106,z=1968,dx=2,dy=4,dz=3] remove AL1Favour
execute align x align y align z run tag @a[x=1009,y=106,z=1949,dx=2,dy=4,dz=3] remove AL1Favour

execute unless entity @a[tag=AL1Favour] align x align y align z run tag @a[x=1007,y=106,z=1963,dx=6,dy=4,dz=4] add AL1Favour
execute unless entity @a[tag=AL1Favour] align x align y align z run tag @a[x=1007,y=106,z=1953,dx=6,dy=4,dz=4] add AL1Favour

execute unless entity @a[tag=Airlock1South] run scoreboard objectives remove AL1SouthtoNorth
execute unless entity @a[tag=Airlock1North] run scoreboard objectives remove AL1NorthtoSouth


execute if entity @a[tag=Airlock1,tag=!HasSuit] run scoreboard players set @e[scores={AL1SouthtoNorth=60..99}] AL1SouthtoNorth -50
execute if entity @a[tag=Airlock1,tag=!HasSuit] run scoreboard players set @e[scores={AL1SouthtoNorth=229..248}] AL1SouthtoNorth -50

# SOUTH TO NORTH
execute align x align y align z run tag @a[x=1009,y=106,z=1968,dx=2,dy=4,dz=3] remove Airlock1South
execute align x align y align z run tag @a[x=1008,y=106,z=1952,dx=4,dy=4,dz=3] remove Airlock1South

execute align x align y align z run tag @a[x=1007,y=106,z=1963,dx=6,dy=4,dz=4] add Airlock1South
execute if entity @a[tag=Airlock1South,tag=AL1Favour] unless entity @e[scores={AL1NorthtoSouth=..1000}] run scoreboard objectives add AL1SouthtoNorth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1SouthtoNorth 0

scoreboard players add @e[scores={AL1SouthtoNorth=..49}] AL1SouthtoNorth 1
execute if entity @e[scores={AL1SouthtoNorth=1}] if block 1010 106 1957 air run scoreboard players set @e[scores={AL1SouthtoNorth=1}] AL1SouthtoNorth -51
execute if entity @e[scores={AL1SouthtoNorth=-50}] run scoreboard objectives add AL1NDoorCloses dummy
execute if entity @e[scores={AL1SouthtoNorth=20}] run scoreboard objectives add AL1SDoorOpens dummy

execute if entity @a[tag=Airlock1South,x=1007,y=106,z=1958,dx=6,dy=4,dz=4] unless entity @a[x=1007,y=106,z=1963,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL1SouthtoNorth=50..60}] AL1SouthtoNorth 1
scoreboard players add @e[scores={AL1SouthtoNorth=61..249}] AL1SouthtoNorth 1
execute if entity @e[scores={AL1SouthtoNorth=62}] run scoreboard objectives add AL1SDoorCloses dummy
execute if entity @e[scores={AL1SouthtoNorth=100}] run scoreboard objectives add AL1Depressurize dummy
 
execute if entity @e[scores={AL1SouthtoNorth=230}] run playsound block.note_block.chime master @a 1010 108 1960 1.5 0.89 0
execute if entity @e[scores={AL1SouthtoNorth=249}] run scoreboard objectives add AL1NDoorOpens dummy
execute if entity @e[scores={AL1SouthtoNorth=250}] align x align y align z unless entity @a[x=1007,y=106,z=1957,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock1North] if block 1010 106 1957 air run scoreboard objectives add AL1NDoorCloses dummy
execute if entity @e[scores={AL1SouthtoNorth=250}] align x align y align z unless entity @a[x=1007,y=106,z=1957,dx=6,dy=4,dz=6] run scoreboard objectives remove AL1SouthtoNorth


# NORTH TO SOUTH
execute align x align y align z run tag @a[x=1009,y=106,z=1949,dx=2,dy=4,dz=3] remove Airlock1North
execute align x align y align z run tag @a[x=1008,y=106,z=1965,dx=4,dy=4,dz=3] remove Airlock1North

execute align x align y align z run tag @a[x=1007,y=106,z=1953,dx=6,dy=4,dz=4] add Airlock1North
execute if entity @a[tag=Airlock1North,tag=AL1Favour] unless entity @e[scores={AL1SouthtoNorth=..1000}] run scoreboard objectives add AL1NorthtoSouth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1NorthtoSouth 0

scoreboard players add @e[scores={AL1NorthtoSouth=..49}] AL1NorthtoSouth 1
execute if entity @e[scores={AL1NorthtoSouth=1}] if block 1010 106 1963 air run scoreboard players set @e[scores={AL1NorthtoSouth=1}] AL1NorthtoSouth -51
execute if entity @e[scores={AL1NorthtoSouth=-50}] run scoreboard objectives add AL1SDoorCloses dummy
execute if entity @e[scores={AL1NorthtoSouth=20}] run scoreboard objectives add AL1NDoorOpens dummy

execute if entity @a[tag=Airlock1North,x=1007,y=106,z=1958,dx=6,dy=4,dz=4] unless entity @a[x=1007,y=106,z=1953,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL1NorthtoSouth=50..60}] AL1NorthtoSouth 1
scoreboard players add @e[scores={AL1NorthtoSouth=61..249}] AL1NorthtoSouth 1
execute if entity @e[scores={AL1NorthtoSouth=62}] run scoreboard objectives add AL1NDoorCloses dummy
execute if entity @e[scores={AL1NorthtoSouth=100}] run scoreboard objectives add AL1Depressurize dummy

execute if entity @e[scores={AL1NorthtoSouth=230}] run playsound block.note_block.chime master @a 1010 108 1960 1.5 0.89 0
execute if entity @e[scores={AL1NorthtoSouth=249}] run scoreboard objectives add AL1SDoorOpens dummy
execute if entity @e[scores={AL1NorthtoSouth=250}] align x align y align z unless entity @a[x=1007,y=106,z=1957,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock1South] if block 1010 106 1963 air run scoreboard objectives add AL1SDoorCloses dummy
execute if entity @e[scores={AL1NorthtoSouth=250}] align x align y align z unless entity @a[x=1007,y=106,z=1957,dx=6,dy=4,dz=6] run scoreboard objectives remove AL1NorthtoSouth




# DEPRESSURIZE
#scoreboard objectives add AL1Depressurize dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1Depressurize 1
execute if entity @e[scores={AL1Depressurize=1}] run stopsound @a[scores={SuitOff=1..}]
execute if entity @e[scores={AL1Depressurize=1}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=5}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=10}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=15}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=20}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=25}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=30}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=35}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=40}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=45}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=50}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=55}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=60}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=65}] run playsound entity.generic.burn master @a 1007 108 1960 0.2 0.5 0

execute if entity @e[scores={AL1Depressurize=1}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=5}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=10}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=15}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=20}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=25}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=30}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=35}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=40}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=45}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=50}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=55}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=60}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0
execute if entity @e[scores={AL1Depressurize=65}] run playsound entity.generic.burn master @a 1013 108 1960 0.2 0.5 0

execute if entity @e[scores={AL1Depressurize=3..}] run particle cloud 1008.0 107.5 1960.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL1Depressurize=3..}] run particle cloud 1008.0 110.5 1960.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL1Depressurize=5..}] run particle cloud 1009.0 108.5 1960.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL1Depressurize=5..}] run particle cloud 1009.0 109.5 1960.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL1Depressurize=9..}] run particle cloud 1010.0 109.0 1960.5 0.4 1.2 0.2 0 5 force

execute if entity @e[scores={AL1Depressurize=3..}] run particle cloud 1013.0 107.5 1960.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL1Depressurize=3..}] run particle cloud 1013.0 110.5 1960.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL1Depressurize=5..}] run particle cloud 1012.0 108.5 1960.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL1Depressurize=5..}] run particle cloud 1012.0 109.5 1960.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL1Depressurize=9..}] run particle cloud 1011.0 109.0 1960.5 0.4 1.2 0.2 0 5 force
execute if entity @e[scores={AL1Depressurize=65..}] run scoreboard objectives remove AL1Depressurize



# NORTH DOOR OPENS
#scoreboard objectives add AL1NDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1NDoorOpens 1
execute if entity @e[scores={AL1NDoorOpens=1}] unless block 1010 106 1957 air run playsound entity.generic.burn master @a 1010 106 1957 0.2 1.5 0
execute if entity @e[scores={AL1NDoorOpens=1}] unless block 1010 106 1957 air run playsound entity.evoker.cast_spell master @a 1010 106 1957 0.2 1.3 0

execute if entity @e[scores={AL1NDoorOpens=1}] run fill 1009 106 1957 1011 111 1957 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1NDoorOpens=1}] run fill 1010 106 1957 1010 111 1957 air

execute if entity @e[scores={AL1NDoorOpens=2}] run fill 1008 106 1957 1012 111 1957 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1NDoorOpens=2}] run fill 1009 106 1957 1011 111 1957 air

execute if entity @e[scores={AL1NDoorOpens=3}] run fill 1007 106 1957 1013 111 1957 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1NDoorOpens=3}] run fill 1008 106 1957 1012 111 1957 air
execute if entity @e[scores={AL1NDoorOpens=3..}] run scoreboard objectives remove AL1NDoorOpens


# NORTH DOOR CLOSES
#scoreboard objectives add AL1NDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1NDoorCloses 1
execute if entity @e[scores={AL1NDoorCloses=1}] if block 1010 106 1957 air run playsound entity.generic.burn master @a 1010 106 1957 0.2 1.5 0
execute if entity @e[scores={AL1NDoorCloses=1}] if block 1010 106 1957 air run playsound entity.evoker.cast_spell master @a 1010 106 1957 0.2 1.3 0

execute if entity @e[scores={AL1NDoorCloses=1}] run fill 1007 106 1957 1007 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=1}] run fill 1013 106 1957 1013 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=1}] run fill 1008 106 1957 1008 111 1957 orange_stained_glass
execute if entity @e[scores={AL1NDoorCloses=1}] run fill 1012 106 1957 1012 111 1957 orange_stained_glass

execute if entity @e[scores={AL1NDoorCloses=2}] run fill 1008 106 1957 1008 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=2}] run fill 1012 106 1957 1012 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=2}] run fill 1009 106 1957 1009 111 1957 orange_stained_glass
execute if entity @e[scores={AL1NDoorCloses=2}] run fill 1011 106 1957 1011 111 1957 orange_stained_glass

execute if entity @e[scores={AL1NDoorCloses=3}] run fill 1009 106 1957 1009 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=3}] run fill 1011 106 1957 1011 111 1957 white_stained_glass
execute if entity @e[scores={AL1NDoorCloses=3}] run fill 1010 106 1957 1010 111 1957 orange_stained_glass
execute if entity @e[scores={AL1NDoorCloses=3..}] run scoreboard objectives remove AL1NDoorCloses


# SOUTH DOOR OPENS
#scoreboard objectives add AL1SDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1SDoorOpens 1
execute if entity @e[scores={AL1SDoorOpens=1}] unless block 1010 106 1963 air run playsound entity.generic.burn master @a 1010 106 1963 0.2 1.5 0
execute if entity @e[scores={AL1SDoorOpens=1}] unless block 1010 106 1963 air run playsound entity.evoker.cast_spell master @a 1010 106 1963 0.2 1.3 0

execute if entity @e[scores={AL1SDoorOpens=1}] run fill 1009 106 1963 1011 111 1963 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1SDoorOpens=1}] run fill 1010 106 1963 1010 111 1963 air

execute if entity @e[scores={AL1SDoorOpens=2}] run fill 1008 106 1963 1012 111 1963 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1SDoorOpens=2}] run fill 1009 106 1963 1011 111 1963 air

execute if entity @e[scores={AL1SDoorOpens=3}] run fill 1007 106 1963 1013 111 1963 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL1SDoorOpens=3}] run fill 1008 106 1963 1012 111 1963 air
execute if entity @e[scores={AL1SDoorOpens=3..}] run scoreboard objectives remove AL1SDoorOpens



# SOUTH DOOR OPENS
#scoreboard objectives add AL1SDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL1SDoorCloses 1
execute if entity @e[scores={AL1SDoorCloses=1}] if block 1010 106 1963 air run playsound entity.generic.burn master @a 1010 106 1963 0.2 1.5 0
execute if entity @e[scores={AL1SDoorCloses=1}] if block 1010 106 1963 air run playsound entity.evoker.cast_spell master @a 1010 106 1963 0.2 1.3 0

execute if entity @e[scores={AL1SDoorCloses=1}] run fill 1007 106 1963 1007 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=1}] run fill 1013 106 1963 1013 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=1}] run fill 1008 106 1963 1008 111 1963 orange_stained_glass
execute if entity @e[scores={AL1SDoorCloses=1}] run fill 1012 106 1963 1012 111 1963 orange_stained_glass

execute if entity @e[scores={AL1SDoorCloses=2}] run fill 1008 106 1963 1008 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=2}] run fill 1012 106 1963 1012 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=2}] run fill 1009 106 1963 1009 111 1963 orange_stained_glass
execute if entity @e[scores={AL1SDoorCloses=2}] run fill 1011 106 1963 1011 111 1963 orange_stained_glass

execute if entity @e[scores={AL1SDoorCloses=3}] run fill 1009 106 1963 1009 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=3}] run fill 1011 106 1963 1011 111 1963 white_stained_glass
execute if entity @e[scores={AL1SDoorCloses=3}] run fill 1010 106 1963 1010 111 1963 orange_stained_glass
execute if entity @e[scores={AL1SDoorCloses=3..}] run scoreboard objectives remove AL1SDoorCloses