####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 16 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~ ~ grindstone run setblock ~ ~ ~ air destroy
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~1 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~1 ~ air destroy
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~2 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~2 ~ air destroy
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=SentryMarkerAEC] if block ~ ~3 ~ iron_bars[east=false,west=false,north=false,south=false] run setblock ~ ~3 ~ air destroy
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] at @e[tag=Sentry] run playsound entity.dolphin.death master @a ~ ~ ~
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] run kill @e[tag=Sentry]
execute if block 0 82 2000 air if entity @e[tag=SentryMarkerAEC] run kill @e[tag=SentryMarkerAEC]
execute if block 0 82 2000 air run scoreboard objectives remove SentryScan
execute if block 0 82 2000 air run scoreboard players reset @e SentryTimer


