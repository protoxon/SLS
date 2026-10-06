####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 16 2018 / APRIL 21 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 1000 64 994

# REMOVE REDSTONE BLOCK ---> setblock 39 25 46 clay

#scoreboard objectives setdisplay sidebar Incorrect_R7C
#scoreboard objectives setdisplay sidebar R7CFakeOut
#scoreboard objectives setdisplay sidebar FinalGreen


scoreboard objectives add Incorrect_R7C dummy
scoreboard players add @e[tag=MainTriviaAEC] Incorrect_R7C 1

#execute if entity @e[scores={Incorrect_R7C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_R7C=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_R7C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_R7C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_R7C=1}] run title @a subtitle {"text":"The ! symbol isn't used for that", "color":"white"}
execute if entity @e[scores={Incorrect_R7C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: ! is a special character used in commands, but it doesn't reset any scoreboard values.","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_R7C=250}] run tellraw @a ["",{"text":" That would be just plain mean...","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_R7C=380}] run tellraw @a ["",{"text":" ...resetting scoreboard objectives.","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_R7C=600}] run tellraw @a ["",{"text":" Hmmm...","color":"red","bold":false}]
execute if entity @e[scores={Incorrect_R7C=750}] run tellraw @a ["",{"text":" Let's try it!","color":"red","bold":false}]

execute if entity @e[scores={Incorrect_R7C=1}] run scoreboard objectives remove R7CFakeOut


execute if entity @e[scores={Incorrect_R7C=800}] run teleport @a 1000 64 994 0 0
execute if entity @e[scores={Incorrect_R7C=800..850}] if entity @e[x=991,y=63,z=991,dx=18,dy=10,dz=18] run scoreboard objectives add R7CFakeOut dummy
execute if entity @e[scores={Incorrect_R7C=800}] run scoreboard objectives setdisplay sidebar

# FAKE OUT
scoreboard players add @e[tag=MainTriviaAEC] R7CFakeOut 1

execute if entity @e[scores={R7CFakeOut=1}] run setblock 1000 64 1000 stone_button[face=floor,facing=south,powered=false]
execute if entity @e[scores={R7CFakeOut=1..600}] run scoreboard objectives setdisplay sidebar
execute if entity @e[scores={R7CFakeOut=1..600}] run setblock 1000 65 987 clay

execute if entity @e[scores={R7CFakeOut=..100}] run fill 1009 64 1000 1009 65 1000 green_stained_glass_pane[north=true,south=true]
execute if entity @e[scores={R7CFakeOut=..100}] run fill 1000 64 1009 1000 65 1009 red_stained_glass_pane[east=true,west=true]
execute if entity @e[scores={R7CFakeOut=..100}] run fill 991 64 1000 991 65 1000 purple_stained_glass_pane[north=true,south=true]
execute if entity @e[scores={FinalGreen=1..640}] run setblock 1009 66 1000 quartz_pillar[axis=z]
execute if entity @e[scores={FinalPurple=1..640}] run setblock 991 66 1000 quartz_pillar[axis=z]

execute if entity @e[scores={R7CFakeOut=..100}] run setblock 1084 66 1000 green_stained_glass
execute if entity @e[scores={R7CFakeOut=..100}] run setblock 916 66 1000 purple_stained_glass

execute if entity @e[scores={R7CFakeOut=..100}] run kill @e[tag=TriviaFrameAS]
execute if entity @e[scores={R7CFakeOut=..100}] run kill @e[tag=TriviaFrameAEC]



execute if entity @e[scores={R7CFakeOut=..640}] run kill @e[tag=FinalGreenAS]
execute if entity @e[scores={R7CFakeOut=..640}] run kill @e[tag=FinalGreenItem]

execute if entity @e[scores={R7CFakeOut=..640}] run kill @e[tag=FinalPurpleAS]
execute if entity @e[scores={R7CFakeOut=..640}] run kill @e[tag=FinalPurpleItem]

gamemode adventure @a[gamemode=!adventure]



# RETURN TO NORMAL
execute if entity @e[scores={R7CFakeOut=610}] run tellraw @a ["",{"text":" Yeah that would be mean.","color":"red","bold":false}]


execute if entity @e[scores={R7CFakeOut=650}] if entity @e[scores={FinalGreen=1..}] run setblock 1084 66 1000 air
execute if entity @e[scores={R7CFakeOut=650}] if entity @e[scores={FinalPurple=1..}] run setblock 916 66 1000 air

execute if entity @e[scores={R7CFakeOut=650}] if entity @e[scores={FinalGreen=1..}] run summon armor_stand 1001 66 1000 {NoGravity:true,Invisible:true,DisabledSlots:2039583,Tags:["FinalTriviaPiece","FinalTriviaAS","FinalGreenAS"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:lime_dye",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["FinalTriviaPiece","FinalItem","FinalGreenItem"]}]}

execute if entity @e[scores={R7CFakeOut=650}] if entity @e[scores={FinalPurple=1..}] run summon armor_stand 999 66 1000 {NoGravity:true,Invisible:true,DisabledSlots:2039583,Tags:["FinalTriviaPiece","FinalTriviaAS","FinalPurpleAS"],Passengers:[{id:"minecraft:item",Item:{id:"minecraft:armor_stand",Count:1b},Age:-32768,PickupDelay:32767,NoGravity:true,Tags:["FinalTriviaPiece","FinalItem","FinalPurpleItem"]}]}

execute if entity @e[scores={R7CFakeOut=650}] run summon armor_stand 1000 65.6 1008.9 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:command_block",Count:1b}],Rotation:[180.0f,0.0f],Tags:["TriviaFrameAS","RedTriviaFrameAEC"]}
execute if entity @e[scores={R7CFakeOut=650}] run summon area_effect_cloud 1000 65.95 1008.7 {Tags:["TriviaFrameAEC","RedTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"Technical\",\"color\":\"dark_red\"}",CustomNameVisible:true}

execute if entity @e[scores={R7CFakeOut=650}] unless entity @e[scores={FinalGreen=1..}] run summon armor_stand 1008.9 65.6 1000 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:grass_block",Count:1b}],Rotation:[90.0f,0.0f],Tags:["TriviaFrameAS","GreenTriviaFrameAEC"]}
execute if entity @e[scores={R7CFakeOut=650}] unless entity @e[scores={FinalGreen=1..}] run summon area_effect_cloud 1008.7 65.95 1000 {Tags:["TriviaFrameAEC","GreenTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"General\",\"color\":\"dark_green\"}",CustomNameVisible:true}

execute if entity @e[scores={R7CFakeOut=650}] unless entity @e[scores={FinalPurple=1..}] run summon armor_stand 992.0 65.55 1000 {Invulnerable:true,Small:true,Invisible:true,NoGravity:true,Marker:false,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "30365a82-8bf5-484e-946d-6cb9458301ae", Properties: {textures:[{Signature:"QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]},Name:"AdamDJM"}}}],Rotation:[270.0f,0.0f],Tags:["TriviaFrameAS","PurpleTriviaFrameAEC"]}
execute if entity @e[scores={R7CFakeOut=650}] unless entity @e[scores={FinalPurple=1..}] run summon area_effect_cloud 992.3 65.95 1000 {Tags:["TriviaFrameAEC","PurpleTriviaFrameAEC"],Duration:2147483647,CustomName:"{\"text\":\"Community\",\"color\":\"dark_purple\"}",CustomNameVisible:true}


execute if entity @e[scores={R7CFakeOut=650..}] if entity @e[scores={FinalGreen=1..}] run setblock 1009 66 1000 air
execute if entity @e[scores={R7CFakeOut=650..}] if entity @e[scores={FinalPurple=1..}] run setblock 991 66 1000 air

execute if entity @e[scores={R7CFakeOut=650..}] run fill 1009 64 1000 1009 65 1000 air destroy
execute if entity @e[scores={R7CFakeOut=650..}] run fill 1000 64 1009 1000 65 1009 air destroy
execute if entity @e[scores={R7CFakeOut=650..}] run fill 991 64 1000 991 65 1000 air destroy
execute if entity @e[scores={R7CFakeOut=650..}] run setblock 1000 64 1000 air destroy
execute if entity @e[scores={R7CFakeOut=650..}] run scoreboard objectives setdisplay sidebar TriviaTally
execute if entity @e[scores={R7CFakeOut=700..}] run setblock 1000 65 987 command_block[facing=down]{TrackOutput:0b}
execute if entity @e[scores={R7CFakeOut=700..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={R7CFakeOut=700..}] run scoreboard objectives remove Incorrect_R7C
execute if entity @e[scores={R7CFakeOut=700..}] run scoreboard objectives remove R7CFakeOut