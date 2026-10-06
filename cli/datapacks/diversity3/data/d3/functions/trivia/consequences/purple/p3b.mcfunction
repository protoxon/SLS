####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 26 2018 / JULY 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

difficulty hard

spawnpoint @a 971 67 1000

#scoreboard objectives setdisplay sidebar Incorrect_P3B

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=848,y=47,z=1037,dx=24,dy=31,dz=28] add WrongAnswer

scoreboard objectives add Incorrect_P3B dummy
execute align x align y align z if entity @a[x=848,y=47,z=1037,dx=24,dy=31,dz=28] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P3B 1

execute if entity @e[scores={Incorrect_P3B=1}] run gamerule naturalRegeneration false
execute if entity @e[scores={Incorrect_P3B=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P3B=1}] at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P3B=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P3B=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P3B=1}] run title @a subtitle {"text":"'Legendary' isn't the correct brand", "color":"white"}
execute if entity @e[scores={Incorrect_P3B=80}] run tellraw @a ["",{"text":" [X] INCORRECT: This build is from Legendary, just one of those CTM maps by Vechs. But Legendary isn't the label his other maps collectively go by.","color":"red"}]


execute if entity @e[scores={Incorrect_P3B=1}] as @e[tag=P3BSkeleton] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={Incorrect_P3B=150}] run summon wither_skeleton 849 58 1050 {Rotation:[270f,0f],Invulnerable:true,HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:10}]}},{id:"minecraft:bow",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0", Properties: {textures: [{Signature: "gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]}, Name: "Vechs1"}}}],Tags:["P3BSkeleton"]}

execute if entity @e[scores={Incorrect_P3B=150}] run summon wither_skeleton 849 58 1049 {Rotation:[270f,0f],Invulnerable:true,HandItems:[{id:"minecraft:bow",Count:1b},{id:"minecraft:stone_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:10}]}}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "1ac2b1d3-d623-4dab-99e5-08f3cfe1c1a0", Properties: {textures: [{Signature: "gPYVJcjcAd3Ub4BAmX9y4a4T51i7itEfyFjUBCMfdHf1bTIibex7F76ZTru4ZP4OS7ufWwVTdh+DPF52sO+hosXHQFNPiENzN+xxnHrg8d0ZycR8IhyUm56JTBeEQIxyHcg5+vWKjuKPkoM1vgljbpImiQ9uX7EKDxno5ou7yGvAVPtV6OX+LWfbjm7zVlP1srpKfPH02nrJ507lhRE2aA9g+dlOLtuHWEMkofhjRWElft3ieZzm8ZdBORIR1VsNmYt3QOadpb7SlLaiRYIs682hd9jh7jQnlsevfNqwK620fwnwH5xgUl/hpIM22vTb2bZHogBpKVGg86yFq89itsuR8osOCVe3hzZnIvFQqbM40W7Dr0gN9P6GGXM85vtXthzAWkAjpdgeiqWrjuy7EG00R9/G/kkG/9AfOcfr9fzslg4A1/Uy2PBcaBWytGXPUycGQfW9tVRQxQNGjKjPow2SirKd0PRDM3D3XH3lYtd2aNNuvjIYpRzk6HjjAo5s5DaosJLAYl4AxW6SlXfDb1b07HLv0s6Gx/dC1IkRb5QIq7gukmq1mr3EECos24SBVZVU7Ac7UKq763xqHCLqcXOfjZanvfH4Wng+NO/XDHvCKHX6Ye91iHnbcbGzjXWyieIFHt1+wsAJIqyYQQa6Tj/qNy+/9UFoM0dQnBTn5wg=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDAzNzcyNDMsInByb2ZpbGVJZCI6IjFhYzJiMWQzZDYyMzRkYWI5OWU1MDhmM2NmZTFjMWEwIiwicHJvZmlsZU5hbWUiOiJWZWNoczEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2MwYzcwOTk0NjgzNjdmMDk4ODhlYjY5OGFlMWZlMzhjMGZhNDFlYmJjYmM4ZDA0N2I3Y2YyOGY0NDlmZmYyOTEifX19"}]}, Name: "Vechs1"}}}],Tags:["P3BSkeleton"]}


# END SAFEGUARD
execute align x align y align z unless entity @a[x=848,y=47,z=1037,dx=24,dy=31,dz=28] run scoreboard objectives add P3B_End dummy
execute align x align y align z if entity @a[x=848,y=47,z=1037,dx=24,dy=31,dz=28] run scoreboard objectives remove P3B_End
execute align x align y align z unless entity @a[x=848,y=47,z=1037,dx=24,dy=31,dz=28] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P3B_End 1

execute if entity @e[scores={P3B_End=25..}] run clear @a
execute if entity @e[scores={P3B_End=25..}] run scoreboard objectives remove Incorrect_P3B
execute if entity @e[scores={P3B_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P3B_End=25..}] run scoreboard objectives remove P3B_End