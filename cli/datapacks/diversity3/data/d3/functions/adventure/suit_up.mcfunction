####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 3 2018 / FEBRUARY 5 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar SuitUpTimer

execute align x align y align z run tag @a[x=1030,y=107,z=1994,dx=0,dy=0,dz=0] add InSuitBox
execute align x align y align z run tag @a[x=1029,y=106,z=1996,dx=2,dy=2,dz=0] remove InSuitBox

execute if entity @a[tag=InSuitBox,tag=!HasSuit] run scoreboard objectives add SuitUpTimer dummy
scoreboard players add @e[tag=MainAdventureAEC] SuitUpTimer 1

execute if entity @e[scores={SuitUpTimer=5}] run fill 1029 107 1996 1029 109 1997 air replace iron_bars
execute if entity @e[scores={SuitUpTimer=5}] run fill 1029 107 1996 1029 109 1997 air replace white_stained_glass_pane
execute if entity @e[scores={SuitUpTimer=5}] run fill 1029 107 1996 1029 109 1997 air replace orange_stained_glass_pane
execute if entity @e[scores={SuitUpTimer=5}] run fill 1030 107 1995 1030 107 1995 orange_stained_glass_pane replace air
execute if entity @e[scores={SuitUpTimer=5}] run fill 1030 108 1995 1030 108 1995 white_stained_glass_pane replace air
execute if entity @e[scores={SuitUpTimer=5}] run fill 1030 109 1995 1030 109 1995 orange_stained_glass_pane replace air
execute if entity @e[scores={SuitUpTimer=5}] run playsound block.iron_trapdoor.open master @a 1030 108 1995 1 1 0


execute if entity @e[scores={SuitUpTimer=140..}] run fill 1030 107 1995 1030 109 1995 air
execute if entity @e[scores={SuitUpTimer=140..}] unless block 1029 107 1996 orange_stained_glass_pane[north=true,south=true] run setblock 1029 107 1996 orange_stained_glass_pane[north=true,south=true]
execute if entity @e[scores={SuitUpTimer=140..}] unless block 1029 108 1996 white_stained_glass_pane[north=true,south=true] run setblock 1029 108 1996 white_stained_glass_pane[north=true,south=true]
execute if entity @e[scores={SuitUpTimer=140..}] unless block 1029 109 1996 orange_stained_glass_pane[north=true,south=true] run setblock 1029 109 1996 orange_stained_glass_pane[north=true,south=true]
execute if entity @e[scores={SuitUpTimer=140..}] run fill 1029 107 1997 1029 109 1997 iron_bars[north=true]
execute if entity @e[scores={SuitUpTimer=140}] run playsound block.iron_trapdoor.open master @a 1030 108 1995 1 1 0

execute if entity @e[scores={SuitUpTimer=140..}] unless entity @a[tag=InSuitBox] run scoreboard players set @e[scores={AdventureLevel=27}] AdventureTimer -1
execute if entity @e[scores={SuitUpTimer=140..}] unless entity @a[tag=InSuitBox] run scoreboard players set @e[scores={AdventureLevel=27}] AdventureLevel 28
execute if entity @e[scores={SuitUpTimer=140..}] unless entity @a[tag=InSuitBox] run scoreboard objectives remove SuitUpTimer

execute if entity @e[scores={SuitUpTimer=30}] run playsound entity.illusioner.mirror_move master @a 1030 107 1994 1 0.5 0
execute if entity @e[scores={SuitUpTimer=30}] run playsound entity.evoker.prepare_attack master @a 1030 107 1994 1 0.5 0
execute if entity @e[scores={SuitUpTimer=30}] run playsound entity.illusioner.prepare_mirror master @a 1030 107 1994 1 0.5 0
execute if entity @e[scores={SuitUpTimer=60}] run playsound block.beacon.activate master @a 1030 107 1994 1 1.5 0

execute if entity @e[scores={SuitUpTimer=20..90}] run particle mycelium 1030 107.5 1994 0.5 0.7 0.5 0.4 2 force
#execute if entity @e[scores={SuitUpTimer=20..90}] run particle falling_dust orange_concrete 1030 110.0 1994 0.7 0.1 0.4 0.4 2 force
#execute if entity @e[scores={SuitUpTimer=20..90}] run particle falling_dust white_concrete 1030 110.0 1994 0.7 0.1 0.4 0.4 2 force


execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1029.1 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1029.1 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1029.1 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1029.1 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1029.1 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1029.1 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1029.1 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1029.1 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1029.1 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1029.1 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1029.1 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1029.1 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1029.1 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1029.1 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1029.1 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1029.1 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1029.1 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1029.1 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1029.1 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1029.1 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1029.1 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1029.1 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1029.1 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1029.1 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1029.1 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1029.1 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1029.1 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1029.1 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1029.1 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1029.1 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1029.3 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1029.3 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1029.3 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1029.3 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1029.3 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1029.3 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1029.3 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1029.3 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1029.3 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1029.3 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1029.3 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1029.3 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1029.3 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1029.3 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1029.3 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1029.3 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1029.3 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1029.3 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1029.3 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1029.3 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1029.3 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1029.3 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1029.3 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1029.3 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1029.3 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1029.3 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1029.3 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1029.3 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1029.3 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1029.3 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1029.5 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1029.5 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1029.5 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1029.5 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1029.5 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1029.5 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1029.5 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1029.5 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1029.5 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1029.5 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1029.5 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1029.5 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1029.5 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1029.5 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1029.5 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1029.5 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1029.5 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1029.5 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1029.5 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1029.5 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1029.5 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1029.5 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1029.5 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1029.5 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1029.5 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1029.5 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1029.5 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1029.5 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1029.5 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1029.5 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1029.7 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1029.7 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1029.7 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1029.7 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1029.7 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1029.7 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1029.7 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1029.7 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1029.7 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1029.7 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1029.7 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1029.7 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1029.7 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1029.7 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1029.7 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1029.7 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1029.7 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1029.7 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1029.7 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1029.7 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1029.7 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1029.7 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1029.7 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1029.7 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1029.7 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1029.7 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1029.7 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1029.7 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1029.7 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1029.7 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1029.9 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1029.9 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1029.9 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1029.9 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1029.9 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1029.9 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1029.9 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1029.9 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1029.9 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1029.9 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1029.9 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1029.9 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1029.9 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1029.9 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1029.9 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1029.9 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1029.9 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1029.9 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1029.9 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1029.9 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1029.9 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1029.9 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1029.9 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1029.9 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1029.9 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1029.9 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1029.9 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1029.9 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1029.9 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1029.9 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1030.1 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1030.1 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1030.1 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1030.1 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1030.1 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1030.1 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1030.1 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1030.1 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1030.1 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1030.1 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1030.1 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1030.1 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1030.1 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1030.1 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1030.1 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1030.1 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1030.1 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1030.1 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1030.1 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1030.1 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1030.1 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1030.1 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1030.1 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1030.1 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1030.1 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1030.1 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1030.1 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1030.1 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1030.1 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1030.1 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1030.3 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1030.3 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1030.3 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1030.3 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1030.3 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1030.3 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1030.3 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1030.3 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1030.3 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1030.3 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1030.3 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1030.3 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1030.3 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1030.3 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1030.3 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1030.3 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1030.3 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1030.3 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1030.3 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1030.3 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1030.3 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1030.3 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1030.3 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1030.3 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1030.3 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1030.3 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1030.3 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1030.3 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1030.3 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1030.3 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1030.5 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1030.5 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1030.5 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1030.5 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1030.5 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1030.5 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1030.5 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1030.5 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1030.5 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1030.5 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1030.5 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1030.5 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1030.5 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1030.5 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1030.5 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1030.5 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1030.5 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1030.5 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1030.5 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1030.5 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1030.5 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1030.5 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1030.5 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1030.5 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1030.5 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1030.5 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1030.5 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1030.5 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1030.5 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1030.5 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1030.7 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1030.7 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1030.7 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1030.7 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1030.7 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1030.7 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1030.7 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1030.7 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1030.7 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1030.7 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1030.7 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1030.7 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1030.7 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1030.7 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1030.7 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1030.7 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1030.7 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1030.7 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1030.7 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1030.7 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1030.7 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1030.7 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1030.7 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1030.7 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1030.7 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1030.7 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1030.7 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1030.7 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1030.7 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1030.7 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1030.9 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1030.9 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1030.9 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1030.9 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1030.9 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1030.9 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1030.9 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1030.9 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1030.9 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1030.9 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1030.9 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1030.9 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1030.9 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1030.9 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1030.9 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1030.9 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1030.9 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1030.9 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1030.9 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1030.9 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1030.9 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1030.9 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1030.9 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1030.9 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1030.9 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1030.9 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1030.9 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1030.9 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1030.9 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1030.9 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1031.1 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1031.1 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1031.1 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1031.1 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1031.1 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1031.1 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1031.1 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1031.1 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1031.1 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1031.1 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1031.1 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1031.1 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1031.1 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1031.1 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1031.1 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1031.1 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1031.1 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1031.1 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1031.1 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1031.1 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1031.1 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1031.1 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1031.1 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1031.1 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1031.1 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1031.1 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1031.1 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1031.1 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1031.1 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1031.1 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1031.3 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1031.3 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1031.3 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1031.3 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1031.3 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1031.3 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1031.3 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1031.3 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1031.3 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1031.3 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1031.3 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1031.3 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1031.3 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1031.3 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1031.3 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1031.3 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1031.3 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1031.3 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1031.3 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1031.3 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1031.3 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1031.3 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1031.3 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1031.3 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1031.3 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1031.3 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1031.3 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1031.3 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1031.3 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1031.3 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1031.5 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1031.5 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1031.5 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1031.5 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1031.5 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1031.5 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1031.5 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1031.5 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1031.5 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1031.5 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1031.5 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1031.5 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1031.5 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1031.5 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1031.5 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1031.5 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1031.5 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1031.5 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1031.5 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1031.5 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1031.5 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1031.5 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1031.5 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1031.5 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1031.5 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1031.5 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1031.5 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1031.5 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1031.5 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1031.5 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1031.7 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1031.7 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1031.7 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1031.7 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1031.7 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1031.7 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1031.7 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1031.7 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1031.7 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1031.7 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1031.7 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1031.7 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1031.7 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1031.7 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1031.7 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1031.7 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1031.7 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1031.7 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1031.7 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1031.7 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1031.7 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1031.7 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1031.7 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1031.7 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1031.7 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1031.7 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1031.7 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1031.7 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1031.7 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1031.7 109.9 1994.5 0 0 0.3 0 1 force

execute if entity @e[scores={SuitUpTimer=32..36}] run particle dust 1 0.4 0 1 1031.9 107.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=34..38}] run particle dust 1 0.4 0 1 1031.9 107.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=36..40}] run particle dust 1 0.4 0 1 1031.9 107.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=38..42}] run particle dust 1 0.4 0 1 1031.9 107.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=40..44}] run particle dust 1 0.4 0 1 1031.9 107.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=42..46}] run particle dust 1 0.4 0 1 1031.9 107.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=44..48}] run particle dust 1 0.4 0 1 1031.9 107.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=46..50}] run particle dust 1 0.4 0 1 1031.9 107.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=48..52}] run particle dust 1 0.4 0 1 1031.9 107.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=50..54}] run particle dust 1 0.4 0 1 1031.9 107.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=52..56}] run particle dust 1 0.4 0 1 1031.9 108.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=54..58}] run particle dust 1 0.4 0 1 1031.9 108.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=56..60}] run particle dust 1 0.4 0 1 1031.9 108.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=58..62}] run particle dust 1 0.4 0 1 1031.9 108.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=60..64}] run particle dust 1 0.4 0 1 1031.9 108.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=62..66}] run particle dust 1 0.4 0 1 1031.9 108.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=64..68}] run particle dust 1 0.4 0 1 1031.9 108.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=66..70}] run particle dust 1 0.4 0 1 1031.9 108.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=68..72}] run particle dust 1 0.4 0 1 1031.9 108.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=70..74}] run particle dust 1 0.4 0 1 1031.9 108.9 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=72..76}] run particle dust 1 0.4 0 1 1031.9 109.0 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=74..78}] run particle dust 1 0.4 0 1 1031.9 109.1 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=76..80}] run particle dust 1 0.4 0 1 1031.9 109.2 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=78..82}] run particle dust 1 0.4 0 1 1031.9 109.3 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=80..84}] run particle dust 1 0.4 0 1 1031.9 109.4 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=82..86}] run particle dust 1 0.4 0 1 1031.9 109.5 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=84..88}] run particle dust 1 0.4 0 1 1031.9 109.6 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=86..90}] run particle dust 1 0.4 0 1 1031.9 109.7 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=88..90}] run particle dust 1 0.4 0 1 1031.9 109.8 1994.5 0 0 0.3 0 1 force
execute if entity @e[scores={SuitUpTimer=90}] run particle dust 1 0.4 0 1 1031.9 109.9 1994.5 0 0 0.3 0 1 force








# Applied Science Tech Research Officer

execute if entity @e[scores={SuitUpTimer=30}] run clear @a[tag=InSuitBox] player_head
execute if entity @e[scores={SuitUpTimer=30}] run clear @a[tag=InSuitBox] leather_chestplate
execute if entity @e[scores={SuitUpTimer=30}] run clear @a[tag=InSuitBox] leather_leggings
execute if entity @e[scores={SuitUpTimer=30}] run clear @a[tag=InSuitBox] leather_boots

execute if entity @e[scores={SuitUpTimer=30}] run playsound entity.generic.burn master @a 1030 108 1994 0.5 0.5 0

execute if entity @e[scores={SuitUpTimer=40}] run playsound entity.item.pickup master @a 1030 107 1994 0.5 0.8 0
execute if entity @e[scores={SuitUpTimer=40}] run replaceitem entity @a[tag=InSuitBox] armor.feet leather_boots{HideFlags:6,Unbreakable:true,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Boots\"}",Lore:['{"text":"This equipment allows you to","italic":"true","color":"white"}','{"text":"venture outside the Base","italic":"true","color":"white"}'],color:16777215}}




execute if entity @e[scores={SuitUpTimer=50}] run playsound entity.item.pickup master @a 1030 107 1994 0.5 0.7 0
execute if entity @e[scores={SuitUpTimer=50}] run replaceitem entity @a[tag=InSuitBox] armor.legs leather_leggings{HideFlags:6,Unbreakable:true,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Slacks\"}",Lore:['{"text":"This equipment allows you to","italic":"true","color":"white"}','{"text":"venture outside the Base","italic":"true","color":"white"}'],color:16777215}}


execute if entity @e[scores={SuitUpTimer=60}] run playsound entity.item.pickup master @a 1030 107 1994 0.5 0.6 0
execute if entity @e[scores={SuitUpTimer=60}] run replaceitem entity @a[tag=InSuitBox] armor.chest leather_chestplate{HideFlags:6,Unbreakable:true,display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Chest\"}",Lore:['{"text":"This equipment allows you to","italic":"true","color":"white"}','{"text":"venture outside the Base","italic":"true","color":"white"}'],color:16777215}}


execute if entity @e[scores={SuitUpTimer=70}] run playsound entity.item.pickup master @a 1030 107 1994 0.5 0.5 0
execute if entity @e[scores={SuitUpTimer=70}] run replaceitem entity @a[tag=InSuitBox] armor.head player_head{HideFlags:6,SkullOwner:{Id:"fc6f2ea4-543e-477f-98db-02c0f51f32d8",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2U4YWFkNjczMTU3YzkyMzE3YTg4YjFmODZmNTI3MWYxY2Q3Mzk3ZDdmYzhlYzMyODFmNzMzZjc1MTYzNCJ9fX0="}]}},display:{Name:"{\"italic\":false,\"color\":\"gold\",\"text\":\"A.S.T.R.O. Helmet\"}",Lore:['{"text":"This equipment allows you to","italic":"true","color":"white"}','{"text":"venture outside the Base","italic":"true","color":"white"}']}}
