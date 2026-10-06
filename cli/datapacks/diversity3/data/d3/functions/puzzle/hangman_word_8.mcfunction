####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 21 2019 / MARCH 26 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# SHIPWRECK
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=19}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=8}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=9}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=16}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=23}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=18}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=5}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=3}] CorrectLetter 1
scoreboard players set @e[scores={LetterTimer=15,SelectedLetter=11}] CorrectLetter 1


# SOUND FX
execute if entity @e[scores={LetterTimer=65,SelectedLetter=19}] run playsound entity.arrow.hit_player master @a 996 66 -11 1 0.5 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=8}] run playsound entity.arrow.hit_player master @a 997 66 -11 1 0.55 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=9}] run playsound entity.arrow.hit_player master @a 998 66 -11 1 0.6 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=16}] run playsound entity.arrow.hit_player master @a 999 66 -11 1 0.65 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=23}] run playsound entity.arrow.hit_player master @a 1000 66 -11 1 0.7 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=18}] run playsound entity.arrow.hit_player master @a 1001 66 -11 1 0.75 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=5}] run playsound entity.arrow.hit_player master @a 1002 66 -11 1 0.8 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=3}] run playsound entity.arrow.hit_player master @a 1003 66 -11 1 0.85 0
execute if entity @e[scores={LetterTimer=65,SelectedLetter=11}] run playsound entity.arrow.hit_player master @a 1004 66 -11 1 0.9 0



# ROUND 1 - BLACK BANNER/WHITE TEXT -> 15/0
execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=19}] run setblock 996 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}",Patterns:[{Pattern: "tt", Color: 0}, {Pattern: "bt", Color: 0}, {Pattern: "tr", Color: 0}, {Pattern: "bl", Color: 0}, {Pattern: "mr", Color: 15}, {Pattern: "drs", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=8}] run setblock 997 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "vhr", Color: 0}, {Pattern: "sc", Color: 15}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=9}] run setblock 998 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "cs", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=16}] run setblock 999 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}",Patterns:[{Pattern: "hhb", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bs", Color: 15}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=23}] run setblock 1000 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}",Patterns:[{Pattern: "bt", Color: 0}, {Pattern: "bts", Color: 15}, {Pattern: "ls", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=18}] run setblock 1001 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}",Patterns:[{Pattern: "rs", Color: 0}, {Pattern: "hhb", Color: 15}, {Pattern: "drs", Color: 0}, {Pattern: "ld", Color: 15}, {Pattern: "ld", Color: 15}, {Pattern: "ld", Color: 15}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=5}] run setblock 1002 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "cs", Color: 15}, {Pattern: "ms", Color: 0}, {Pattern: "rs", Color: 15}, {Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=3}] run setblock 1003 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "ls", Color: 0}, {Pattern: "bo", Color: 15}]}

execute if entity @e[scores={HangmanRound=1,LetterTimer=65,SelectedLetter=11}] run setblock 1004 66 -11 black_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}",Patterns:[{Pattern: "drs", Color: 0}, {Pattern: "cr", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 15}]}



# ROUND 2 - PURPLE BANNER/WHITE TEXT -> 10/0
execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=19}] run setblock 996 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}",Patterns:[{Pattern: "tt", Color: 0}, {Pattern: "bt", Color: 0}, {Pattern: "tr", Color: 0}, {Pattern: "bl", Color: 0}, {Pattern: "mr", Color: 10}, {Pattern: "drs", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=8}] run setblock 997 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "vhr", Color: 0}, {Pattern: "sc", Color: 10}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=9}] run setblock 998 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "cs", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=16}] run setblock 999 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}",Patterns:[{Pattern: "hhb", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bs", Color: 10}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=23}] run setblock 1000 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}",Patterns:[{Pattern: "bt", Color: 0}, {Pattern: "bts", Color: 10}, {Pattern: "ls", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=18}] run setblock 1001 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}",Patterns:[{Pattern: "rs", Color: 0}, {Pattern: "hhb", Color: 10}, {Pattern: "drs", Color: 0}, {Pattern: "ld", Color: 10}, {Pattern: "ld", Color: 10}, {Pattern: "ld", Color: 10}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=5}] run setblock 1002 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "cs", Color: 10}, {Pattern: "ms", Color: 0}, {Pattern: "rs", Color: 10}, {Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=3}] run setblock 1003 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "ms", Color: 10}, {Pattern: "ls", Color: 0}, {Pattern: "bo", Color: 10}]}

execute if entity @e[scores={HangmanRound=2,LetterTimer=65,SelectedLetter=11}] run setblock 1004 66 -11 purple_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}",Patterns:[{Pattern: "drs", Color: 0}, {Pattern: "cr", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 10}]}



# ROUND 3 - WHITE BANNER/BLACK TEXT -> 0/15
execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=19}] run setblock 996 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}",Patterns:[{Pattern: "tt", Color: 15}, {Pattern: "bt", Color: 15}, {Pattern: "tr", Color: 15}, {Pattern: "bl", Color: 15}, {Pattern: "mr", Color: 0}, {Pattern: "drs", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=8}] run setblock 997 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}",Patterns:[{Pattern: "vh", Color: 15}, {Pattern: "vhr", Color: 15}, {Pattern: "sc", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=9}] run setblock 998 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}",Patterns:[{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "cs", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=16}] run setblock 999 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}",Patterns:[{Pattern: "hhb", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=23}] run setblock 1000 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}",Patterns:[{Pattern: "bt", Color: 15}, {Pattern: "bts", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=18}] run setblock 1001 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}",Patterns:[{Pattern: "rs", Color: 15}, {Pattern: "hhb", Color: 0}, {Pattern: "drs", Color: 15}, {Pattern: "ld", Color: 0}, {Pattern: "ld", Color: 0}, {Pattern: "ld", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "ms", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=5}] run setblock 1002 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}",Patterns:[{Pattern: "vh", Color: 15}, {Pattern: "cs", Color: 0}, {Pattern: "ms", Color: 15}, {Pattern: "rs", Color: 0}, {Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=3}] run setblock 1003 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}",Patterns:[{Pattern: "ts", Color: 15}, {Pattern: "bs", Color: 15}, {Pattern: "rs", Color: 15}, {Pattern: "ms", Color: 0}, {Pattern: "ls", Color: 15}, {Pattern: "bo", Color: 0}]}

execute if entity @e[scores={HangmanRound=3,LetterTimer=65,SelectedLetter=11}] run setblock 1004 66 -11 white_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}",Patterns:[{Pattern: "drs", Color: 15}, {Pattern: "cr", Color: 15}, {Pattern: "vh", Color: 15}, {Pattern: "bo", Color: 0}]}



# ROUND 4 - LIGHT BLUE BANNER/WHITE TEXT -> 3/0
execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=19}] run setblock 996 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}",Patterns:[{Pattern: "tt", Color: 0}, {Pattern: "bt", Color: 0}, {Pattern: "tr", Color: 0}, {Pattern: "bl", Color: 0}, {Pattern: "mr", Color: 3}, {Pattern: "drs", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=8}] run setblock 997 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "vhr", Color: 0}, {Pattern: "sc", Color: 3}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=9}] run setblock 998 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "cs", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=16}] run setblock 999 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}",Patterns:[{Pattern: "hhb", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bs", Color: 3}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=23}] run setblock 1000 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}",Patterns:[{Pattern: "bt", Color: 0}, {Pattern: "bts", Color: 3}, {Pattern: "ls", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=18}] run setblock 1001 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}",Patterns:[{Pattern: "rs", Color: 0}, {Pattern: "hhb", Color: 3}, {Pattern: "drs", Color: 0}, {Pattern: "ld", Color: 3}, {Pattern: "ld", Color: 3}, {Pattern: "ld", Color: 3}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=5}] run setblock 1002 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "cs", Color: 3}, {Pattern: "ms", Color: 0}, {Pattern: "rs", Color: 3}, {Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=3}] run setblock 1003 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "ms", Color: 3}, {Pattern: "ls", Color: 0}, {Pattern: "bo", Color: 3}]}

execute if entity @e[scores={HangmanRound=4,LetterTimer=65,SelectedLetter=11}] run setblock 1004 66 -11 light_blue_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}",Patterns:[{Pattern: "drs", Color: 0}, {Pattern: "cr", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 3}]}



# ROUND 5 - ORANGE BANNER/WHITE TEXT -> 1/0
execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=19}] run setblock 996 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}",Patterns:[{Pattern: "tt", Color: 0}, {Pattern: "bt", Color: 0}, {Pattern: "tr", Color: 0}, {Pattern: "bl", Color: 0}, {Pattern: "mr", Color: 1}, {Pattern: "drs", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=8}] run setblock 997 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "vhr", Color: 0}, {Pattern: "sc", Color: 1}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=9}] run setblock 998 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "cs", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=16}] run setblock 999 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}",Patterns:[{Pattern: "hhb", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bs", Color: 1}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=23}] run setblock 1000 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}",Patterns:[{Pattern: "bt", Color: 0}, {Pattern: "bts", Color: 1}, {Pattern: "ls", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=18}] run setblock 1001 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}",Patterns:[{Pattern: "rs", Color: 0}, {Pattern: "hhb", Color: 1}, {Pattern: "drs", Color: 0}, {Pattern: "ld", Color: 1}, {Pattern: "ld", Color: 1}, {Pattern: "ld", Color: 1}, {Pattern: "ts", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "ms", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=5}] run setblock 1002 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}",Patterns:[{Pattern: "vh", Color: 0}, {Pattern: "cs", Color: 1}, {Pattern: "ms", Color: 0}, {Pattern: "rs", Color: 1}, {Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=3}] run setblock 1003 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}",Patterns:[{Pattern: "ts", Color: 0}, {Pattern: "bs", Color: 0}, {Pattern: "rs", Color: 0}, {Pattern: "ms", Color: 1}, {Pattern: "ls", Color: 0}, {Pattern: "bo", Color: 1}]}

execute if entity @e[scores={HangmanRound=5,LetterTimer=65,SelectedLetter=11}] run setblock 1004 66 -11 orange_wall_banner[facing=south]{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}",Patterns:[{Pattern: "drs", Color: 0}, {Pattern: "cr", Color: 0}, {Pattern: "vh", Color: 0}, {Pattern: "bo", Color: 1}]}




# TEST ROUND 1 -> BLACK
execute if entity @e[scores={HangmanRound=1}] if block 996 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} if block 997 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} if block 998 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} if block 999 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} if block 1000 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} if block 1001 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} if block 1002 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} if block 1003 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} if block 1004 66 -11 black_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[scores={HangmanSetup=1..}] HangmanSetup -1000


# TEST ROUND 2 -> PURPLE
execute if entity @e[scores={HangmanRound=2}] if block 996 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} if block 997 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} if block 998 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} if block 999 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} if block 1000 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} if block 1001 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} if block 1002 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} if block 1003 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} if block 1004 66 -11 purple_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[scores={HangmanSetup=1..}] HangmanSetup -1000



# TEST ROUND 3 -> WHITE
execute if entity @e[scores={HangmanRound=3}] if block 996 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} if block 997 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} if block 998 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} if block 999 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} if block 1000 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} if block 1001 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} if block 1002 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} if block 1003 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} if block 1004 66 -11 white_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[scores={HangmanSetup=1..}] HangmanSetup -1000


# TEST ROUND 4 -> LIGHT BLUE
execute if entity @e[scores={HangmanRound=4}] if block 996 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} if block 997 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} if block 998 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} if block 999 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} if block 1000 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} if block 1001 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} if block 1002 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} if block 1003 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} if block 1004 66 -11 light_blue_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[scores={HangmanSetup=1..}] HangmanSetup -1000


# TEST ROUND 5 -> ORANGE
execute if entity @e[scores={HangmanRound=5}] if block 996 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"S\"}"} if block 997 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"H\"}"} if block 998 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"I\"}"} if block 999 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"P\"}"} if block 1000 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"W\"}"} if block 1001 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"R\"}"} if block 1002 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"E\"}"} if block 1003 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"C\"}"} if block 1004 66 -11 orange_wall_banner{CustomName:"{\"bold\":true,\"italic\":false,\"color\":\"white\",\"text\":\"K\"}"} run scoreboard players set @e[scores={HangmanSetup=1..}] HangmanSetup -1000