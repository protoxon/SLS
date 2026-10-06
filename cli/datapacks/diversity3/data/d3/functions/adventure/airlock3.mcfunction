####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 4 2018 / NOVEMBER 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AL3SouthtoNorth
#scoreboard objectives setdisplay sidebar AL3NorthtoSouth
#scoreboard objectives setdisplay sidebar AL3Depressurize
#scoreboard objectives setdisplay sidebar AL3NDoorOpens
#scoreboard objectives setdisplay sidebar AL3NDoorCloses
#scoreboard objectives setdisplay sidebar AL3SDoorOpens
#scoreboard objectives setdisplay sidebar AL3SDoorCloses


execute unless entity @a[tag=Airlock3] run tag @a remove AL3Favour
execute align x align y align z run tag @a[x=1024,y=79,z=1981,dx=6,dy=4,dz=6] remove AL3Favour
execute align x align y align z run tag @a[x=1026,y=79,z=1992,dx=2,dy=4,dz=3] remove AL3Favour
execute align x align y align z run tag @a[x=1026,y=79,z=1973,dx=2,dy=4,dz=3] remove AL3Favour

execute unless entity @a[tag=AL3Favour] align x align y align z run tag @a[x=1024,y=79,z=1987,dx=6,dy=4,dz=4] add AL3Favour
execute unless entity @a[tag=AL3Favour] align x align y align z run tag @a[x=1024,y=79,z=1977,dx=6,dy=4,dz=4] add AL3Favour

execute unless entity @a[tag=Airlock3South] run scoreboard objectives remove AL3SouthtoNorth
execute unless entity @a[tag=Airlock3North] run scoreboard objectives remove AL3NorthtoSouth


execute if entity @a[tag=Airlock3,tag=!HasSuit] run scoreboard players set @e[scores={AL3NorthtoSouth=60..99}] AL3NorthtoSouth -50
execute if entity @a[tag=Airlock3,tag=!HasSuit] run scoreboard players set @e[scores={AL3NorthtoSouth=229..248}] AL3NorthtoSouth -50

# SOUTH TO NORTH
execute align x align y align z run tag @a[x=1026,y=79,z=1992,dx=2,dy=4,dz=3] remove Airlock3South
execute align x align y align z run tag @a[x=1025,y=79,z=1976,dx=4,dy=4,dz=3] remove Airlock3South

execute align x align y align z run tag @a[x=1024,y=79,z=1987,dx=6,dy=4,dz=4] add Airlock3South
execute if entity @a[tag=Airlock3South,tag=AL3Favour] unless entity @e[scores={AL3NorthtoSouth=..1000}] run scoreboard objectives add AL3SouthtoNorth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3SouthtoNorth 0

scoreboard players add @e[scores={AL3SouthtoNorth=..49}] AL3SouthtoNorth 1
execute if entity @e[scores={AL3SouthtoNorth=1}] if block 1027 79 1981 air run scoreboard players set @e[scores={AL3SouthtoNorth=1}] AL3SouthtoNorth -51
execute if entity @e[scores={AL3SouthtoNorth=-50}] run scoreboard objectives add AL3NDoorCloses dummy
execute if entity @e[scores={AL3SouthtoNorth=20}] run scoreboard objectives add AL3SDoorOpens dummy

execute if entity @a[tag=Airlock3South,x=1024,y=79,z=1982,dx=6,dy=4,dz=4] unless entity @a[x=1024,y=79,z=1987,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL3SouthtoNorth=50..60}] AL3SouthtoNorth 1
scoreboard players add @e[scores={AL3SouthtoNorth=61..249}] AL3SouthtoNorth 1
execute if entity @e[scores={AL3SouthtoNorth=62}] run scoreboard objectives add AL3SDoorCloses dummy
execute if entity @e[scores={AL3SouthtoNorth=100}] run scoreboard objectives add AL3Depressurize dummy
 
execute if entity @e[scores={AL3SouthtoNorth=230}] run playsound block.note_block.chime master @a 1027 81 1984 1.5 0.89 0
execute if entity @e[scores={AL3SouthtoNorth=249}] run scoreboard objectives add AL3NDoorOpens dummy
execute if entity @e[scores={AL3SouthtoNorth=250}] align x align y align z unless entity @a[x=1024,y=79,z=1981,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock3North] if block 1027 79 1981 air run scoreboard objectives add AL3NDoorCloses dummy
execute if entity @e[scores={AL3SouthtoNorth=250}] align x align y align z unless entity @a[x=1024,y=79,z=1981,dx=6,dy=4,dz=6] run scoreboard objectives remove AL3SouthtoNorth


# NORTH TO SOUTH
execute align x align y align z run tag @a[x=1026,y=79,z=1973,dx=2,dy=4,dz=3] remove Airlock3North
execute align x align y align z run tag @a[x=1025,y=79,z=1989,dx=4,dy=4,dz=3] remove Airlock3North

execute align x align y align z run tag @a[x=1024,y=79,z=1977,dx=6,dy=4,dz=4] add Airlock3North
execute if entity @a[tag=Airlock3North,tag=AL3Favour] unless entity @e[scores={AL3SouthtoNorth=..1000}] run scoreboard objectives add AL3NorthtoSouth dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3NorthtoSouth 0

scoreboard players add @e[scores={AL3NorthtoSouth=..49}] AL3NorthtoSouth 1
execute if entity @e[scores={AL3NorthtoSouth=1}] if block 1027 79 1987 air run scoreboard players set @e[scores={AL3NorthtoSouth=1}] AL3NorthtoSouth -51
execute if entity @e[scores={AL3NorthtoSouth=-50}] run scoreboard objectives add AL3SDoorCloses dummy
execute if entity @e[scores={AL3NorthtoSouth=20}] run scoreboard objectives add AL3NDoorOpens dummy

execute if entity @a[tag=Airlock3North,x=1024,y=79,z=1982,dx=6,dy=4,dz=4] unless entity @a[x=1024,y=79,z=1977,dx=6,dy=4,dz=4] run scoreboard players add @e[scores={AL3NorthtoSouth=50..60}] AL3NorthtoSouth 1
scoreboard players add @e[scores={AL3NorthtoSouth=61..249}] AL3NorthtoSouth 1
execute if entity @e[scores={AL3NorthtoSouth=62}] run scoreboard objectives add AL3NDoorCloses dummy
execute if entity @e[scores={AL3NorthtoSouth=100}] run scoreboard objectives add AL3Depressurize dummy

execute if entity @e[scores={AL3NorthtoSouth=230}] run playsound block.note_block.chime master @a 1027 81 1984 1.5 0.89 0
execute if entity @e[scores={AL3NorthtoSouth=249}] run scoreboard objectives add AL3SDoorOpens dummy
execute if entity @e[scores={AL3NorthtoSouth=250}] align x align y align z unless entity @a[x=1024,y=79,z=1981,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock3South] if block 1027 79 1987 air run scoreboard objectives add AL3SDoorCloses dummy
execute if entity @e[scores={AL3NorthtoSouth=250}] align x align y align z unless entity @a[x=1024,y=79,z=1981,dx=6,dy=4,dz=6] run scoreboard objectives remove AL3NorthtoSouth




# DEPRESSURIZE
#scoreboard objectives add AL3Depressurize dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3Depressurize 1
execute if entity @e[scores={AL3Depressurize=1}] run stopsound @a[scores={SuitOff=1..}]
execute if entity @e[scores={AL3Depressurize=1}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=5}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=10}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=15}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=20}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=25}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=30}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=35}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=40}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=45}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=50}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=55}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=60}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=65}] run playsound entity.generic.burn master @a 1024 81 1984 0.2 0.5 0

execute if entity @e[scores={AL3Depressurize=1}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=5}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=10}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=15}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=20}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=25}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=30}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=35}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=40}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=45}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=50}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=55}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=60}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0
execute if entity @e[scores={AL3Depressurize=65}] run playsound entity.generic.burn master @a 1029 81 1984 0.2 0.5 0

execute if entity @e[scores={AL3Depressurize=3..}] run particle cloud 1025.0 80.5 1984.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL3Depressurize=3..}] run particle cloud 1025.0 83.5 1984.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL3Depressurize=5..}] run particle cloud 1026.0 81.5 1984.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL3Depressurize=5..}] run particle cloud 1026.0 82.5 1984.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL3Depressurize=9..}] run particle cloud 1027.0 82.0 1984.5 0.4 1.2 0.2 0 5 force

execute if entity @e[scores={AL3Depressurize=3..}] run particle cloud 1029.0 80.5 1984.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL3Depressurize=3..}] run particle cloud 1029.0 83.5 1984.5 0.4 0.2 0.2 0 4 force
execute if entity @e[scores={AL3Depressurize=5..}] run particle cloud 1028.0 81.5 1984.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL3Depressurize=5..}] run particle cloud 1028.0 82.5 1984.5 0.4 0.2 0.2 0 2 force
execute if entity @e[scores={AL3Depressurize=9..}] run particle cloud 1027.0 82.0 1984.5 0.4 1.2 0.2 0 5 force
execute if entity @e[scores={AL3Depressurize=65..}] run scoreboard objectives remove AL3Depressurize



# NORTH DOOR OPENS
#scoreboard objectives add AL3NDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3NDoorOpens 1
execute if entity @e[scores={AL3NDoorOpens=1}] unless block 1027 79 1981 air run playsound entity.generic.burn master @a 1027 79 1981 0.2 1.5 0
execute if entity @e[scores={AL3NDoorOpens=1}] unless block 1027 79 1981 air run playsound entity.evoker.cast_spell master @a 1027 79 1981 0.2 1.3 0

execute if entity @e[scores={AL3NDoorOpens=1}] run fill 1026 79 1981 1028 84 1981 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3NDoorOpens=1}] run fill 1027 79 1981 1027 84 1981 air

execute if entity @e[scores={AL3NDoorOpens=2}] run fill 1025 79 1981 1029 84 1981 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3NDoorOpens=2}] run fill 1026 79 1981 1028 84 1981 air

execute if entity @e[scores={AL3NDoorOpens=3}] run fill 1024 79 1981 1030 84 1981 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3NDoorOpens=3}] run fill 1025 79 1981 1029 84 1981 air
execute if entity @e[scores={AL3NDoorOpens=3..}] run scoreboard objectives remove AL3NDoorOpens


# NORTH DOOR CLOSES
#scoreboard objectives add AL3NDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3NDoorCloses 1
execute if entity @e[scores={AL3NDoorCloses=1}] if block 1027 79 1981 air run playsound entity.generic.burn master @a 1027 79 1981 0.2 1.5 0
execute if entity @e[scores={AL3NDoorCloses=1}] if block 1027 79 1981 air run playsound entity.evoker.cast_spell master @a 1027 79 1981 0.2 1.3 0

execute if entity @e[scores={AL3NDoorCloses=1}] run fill 1024 79 1981 1024 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=1}] run fill 1030 79 1981 1030 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=1}] run fill 1025 79 1981 1025 84 1981 orange_stained_glass
execute if entity @e[scores={AL3NDoorCloses=1}] run fill 1029 79 1981 1029 84 1981 orange_stained_glass

execute if entity @e[scores={AL3NDoorCloses=2}] run fill 1025 79 1981 1025 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=2}] run fill 1029 79 1981 1029 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=2}] run fill 1026 79 1981 1026 84 1981 orange_stained_glass
execute if entity @e[scores={AL3NDoorCloses=2}] run fill 1028 79 1981 1028 84 1981 orange_stained_glass

execute if entity @e[scores={AL3NDoorCloses=3}] run fill 1026 79 1981 1026 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=3}] run fill 1028 79 1981 1028 84 1981 white_stained_glass
execute if entity @e[scores={AL3NDoorCloses=3}] run fill 1027 79 1981 1027 84 1981 orange_stained_glass
execute if entity @e[scores={AL3NDoorCloses=3..}] run scoreboard objectives remove AL3NDoorCloses


# SOUTH DOOR OPENS
#scoreboard objectives add AL3SDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3SDoorOpens 1
execute if entity @e[scores={AL3SDoorOpens=1}] unless block 1027 79 1987 air run playsound entity.generic.burn master @a 1027 79 1987 0.2 1.5 0
execute if entity @e[scores={AL3SDoorOpens=1}] unless block 1027 79 1987 air run playsound entity.evoker.cast_spell master @a 1027 79 1987 0.2 1.3 0

execute if entity @e[scores={AL3SDoorOpens=1}] run fill 1026 79 1987 1028 84 1987 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3SDoorOpens=1}] run fill 1027 79 1987 1027 84 1987 air

execute if entity @e[scores={AL3SDoorOpens=2}] run fill 1025 79 1987 1029 84 1987 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3SDoorOpens=2}] run fill 1026 79 1987 1028 84 1987 air

execute if entity @e[scores={AL3SDoorOpens=3}] run fill 1024 79 1987 1030 84 1987 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL3SDoorOpens=3}] run fill 1025 79 1987 1029 84 1987 air
execute if entity @e[scores={AL3SDoorOpens=3..}] run scoreboard objectives remove AL3SDoorOpens



# SOUTH DOOR OPENS
#scoreboard objectives add AL3SDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL3SDoorCloses 1
execute if entity @e[scores={AL3SDoorCloses=1}] if block 1027 79 1987 air run playsound entity.generic.burn master @a 1027 79 1987 0.2 1.5 0
execute if entity @e[scores={AL3SDoorCloses=1}] if block 1027 79 1987 air run playsound entity.evoker.cast_spell master @a 1027 79 1987 0.2 1.3 0

execute if entity @e[scores={AL3SDoorCloses=1}] run fill 1024 79 1987 1024 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=1}] run fill 1030 79 1987 1030 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=1}] run fill 1025 79 1987 1025 84 1987 orange_stained_glass
execute if entity @e[scores={AL3SDoorCloses=1}] run fill 1029 79 1987 1029 84 1987 orange_stained_glass

execute if entity @e[scores={AL3SDoorCloses=2}] run fill 1025 79 1987 1025 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=2}] run fill 1029 79 1987 1029 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=2}] run fill 1026 79 1987 1026 84 1987 orange_stained_glass
execute if entity @e[scores={AL3SDoorCloses=2}] run fill 1028 79 1987 1028 84 1987 orange_stained_glass

execute if entity @e[scores={AL3SDoorCloses=3}] run fill 1026 79 1987 1026 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=3}] run fill 1028 79 1987 1028 84 1987 white_stained_glass
execute if entity @e[scores={AL3SDoorCloses=3}] run fill 1027 79 1987 1027 84 1987 orange_stained_glass
execute if entity @e[scores={AL3SDoorCloses=3..}] run scoreboard objectives remove AL3SDoorCloses
