####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# Run individually on each player when they enter. Can be run with setup_golf on all present players, or run when a new player joins while golf is in progress.

tag @s add inGolfBranch
scoreboard players set @s golfGear 0
scoreboard players set @s currentHole 1
advancement grant @s only d3:folder_c/secret_branch
tellraw @s ["",{"text":"<qwertyuiopthepie> ","color":"dark_green","bold":false},{"text":"Welcome! You've found the Secret Branch! Grab some gear to get started.","color":"none","bold":false,"underlined":false}]
#tellraw @s {"color":"dark_green","text":"⬤ Welcome to the secret golf branch! Grab some golfing gear to get started."}
teleport @s 0 90 3200 0 0
spawnpoint @s 0 90 3200
execute if score openingArea UUID matches 1 run give @s written_book{pages:["[\"\",{\"text\":\"SCORE:\",\"bold\":true},{\"text\":\"\\n\\n\",\"color\":\"reset\"},{\"text\":\"HOLE 1:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 2:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 3:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 4:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 5:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 6:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\"}]","[\"\",{\"text\":\"HOLE 7:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 8:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 9:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 10:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 11:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 12:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\"}]","[\"\",{\"text\":\"HOLE 13:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 14:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 15:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 16:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 17:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"HOLE 18:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"text\":\"_ (Par 0)\\n\\n\"},{\"text\":\"TOTAL SCORE:\",\"underlined\":true},{\"text\":\" \",\"color\":\"reset\"},{\"score\":{\"name\":\"@s\",\"objective\":\"ScoreTotal\"}}]"],title:"Golf Score",author:""}

# UUID assignment system
scoreboard players add MasterUUID UUID 1
scoreboard players operation @s UUID = MasterUUID UUID
tag @s add UUIDed