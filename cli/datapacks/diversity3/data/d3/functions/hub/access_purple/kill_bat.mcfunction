####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute at @e[tag=ElytraBat] run summon item ~ ~ ~ {Item:{id:"minecraft:elytra",Count:1b},Motion:[0.0d,0.4d,0.0d]}
execute at @e[tag=ElytraBat] run playsound entity.vex.death master @a
execute at @e[tag=ElytraBat] run playsound block.enchantment_table.use ambient @a
execute at @e[tag=ElytraBat] run particle witch ~ ~0.3 ~ 0.1 0.2 0.1 1 50 force
kill @e[tag=ElytraBat]