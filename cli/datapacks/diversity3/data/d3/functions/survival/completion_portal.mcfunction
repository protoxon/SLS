####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 31 2018 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar PortalAECExists
#scoreboard objectives setdisplay sidebar PortalTimer

# KILLS PLAYERS WHO DON'T HAVE BRANCH CLOCK ON
scoreboard objectives add Survivor dummy
scoreboard players add @a Survivor 0
gamemode adventure @a[scores={Survivor=0}]
kill @a[scores={Survivor=0}]


# TELEPORTS SURVIVAL PLAYERS WHO WENT THROUGH WRONG PORTAL
scoreboard objectives add VisitNether dummy
scoreboard players add @e[tag=MainSurvivalAEC] VisitNether 0
execute if entity @e[scores={VisitNether=0}] run teleport @a[nbt={Dimension:-1}] 2 64 -122 0 0


# RESTARTS PORTAL
scoreboard objectives add PortalAECExists dummy
scoreboard players set @a PortalAECExists 0
execute as @e[tag=PortalAEC] run scoreboard players set @a PortalAECExists 1
execute if entity @a[scores={PortalAECExists=0}] run summon area_effect_cloud 1 3 -5 {Tags:["PortalAEC"],Duration:200}


scoreboard objectives add PortalTimer dummy
scoreboard players add @e[tag=PortalAEC] PortalTimer 1
execute if entity @e[scores={PortalTimer=1}] run fill 1 2 -3 1 2 -3 fire replace air
execute if entity @e[scores={PortalTimer=185}] run fill 1 2 -3 2 4 -3 air replace nether_portal
