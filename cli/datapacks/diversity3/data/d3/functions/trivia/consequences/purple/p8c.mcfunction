####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# SEPTEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

spawnpoint @a 938 73 995

#scoreboard objectives setdisplay sidebar Incorrect_P8C

tag @a remove WrongAnswer
execute align x align y align z run tag @a[x=788,y=33,z=879,dx=24,dy=45,dz=24] add WrongAnswer

scoreboard objectives add Incorrect_P8C dummy
execute align x align y align z if entity @a[x=788,y=33,z=879,dx=24,dy=45,dz=24] run scoreboard players add @e[tag=MainTriviaAEC] Incorrect_P8C 1

execute if entity @e[scores={Incorrect_P8C=1}] run effect give @a blindness 2 255 true
execute if entity @e[scores={Incorrect_P8C=1}] run execute at @a run playsound item.totem.use master @a ~ ~ ~ 0.5 1 0
execute if entity @e[scores={Incorrect_P8C=1}] run title @a times 1 80 1
execute if entity @e[scores={Incorrect_P8C=1}] run title @a title {"text":"TRY AGAIN!","bold":false,"color":"red"}
execute if entity @e[scores={Incorrect_P8C=1}] run title @a subtitle {"text":"paulsoaresjr wasn't the first LP", "color":"white"}
execute if entity @e[scores={Incorrect_P8C=80}] run tellraw @a ["",{"text":" [X] INCORRECT: Paul started his Survival tutorial on July 29, 2010. But someone was earlier. This is his build from that series. Locate all 7 pauls and bop 'em to get back to the Branch.","color":"red"}]

execute if entity @e[scores={Incorrect_P8C=1}] as @e[tag=P8CZombie] at @s run teleport @s ~ ~-100 ~

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 799 69 892 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 793 37 888 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 805 44 880 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 789 55 890 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 799 45 897 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 811 57 888 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

execute if entity @e[scores={Incorrect_P8C=5}] run summon zombie 796 59 890 {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner: {Id: "06d8a457-891e-4f99-9d5c-c1e2b33f3321", Properties: {textures: [{Signature: "mTf6dkb6idpudj7AG6dsK2dSfto6HfQzFgbqfx9uznwvIcyCtTYD2A4zvlx7VD8vU/TKAZ8MGusklEQOIgODFLuHpy37Ht0nlo3YOIqHiCa+gqtdHng42zmOVvyNsws3BmRJXydsuH0VQYQmA5ZeszyeUejaM1HkNxZvKT8QnzHzSxbUbFy/DdK3E2htRbPkszdVVfnUVm5LCRKJAqgOGpPOCSHupLKVgi4yMwIHbZkqdjcjIXK3uXWXljMlZzy2MR4AFcYTV0n/AVzZaIcQ9Nao+gG89IJ9naQZa/ceCM9iQhCs+qtFJtyEfFpBMRgCZK8vUGuhtxw/ZfVOz3RdXQh8C51fNB7Um6BGLXyqM5gIrTvaVsfmYt3uLJ2UM5LoreeeeP/hoHj8dYpNEBCPvNaOldlOAB2Zm1oLWi1clLwZkNok7Umyv5uqEk4ojOq1IVhaJNUsZnX881pguVIqfBmRIxuvOKO4CXQN26L4Ir22xJfefoawKr6Hi3hk8rPz6tpcIpVuVVoVSItW2c+jgxNl0uS/eETOx5R9VXzxe58DhyL0+Kg5VgZkNUEIcDGn5ZDB4Z+DNo2kDWlMA1hcdpuTw8kEPFalOdFaUf1CXT5PDgw8750SNOT9h6eHeZCUsVul7vExbPxUrCzYILSVskERtfO+/w4tPEo4AND4gzM=", Value: "eyJ0aW1lc3RhbXAiOjE1MzYxMDI0MDY1NTgsInByb2ZpbGVJZCI6IjA2ZDhhNDU3ODkxZTRmOTk5ZDVjYzFlMmIzM2YzMzIxIiwicHJvZmlsZU5hbWUiOiJwYXVsc29hcmVzanIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzQwOThlMzM5YWRkNGQzYmVmZDk0OTIzNjFiYTBiNzY0ZDVjYWM3ZmFjYTFiNGE0YjA5OGNmYzk1NzViN2ZmZiJ9fX0="}]}, Name: "paulsoaresjr"}}}],Silent:true,Attributes:[{Name:"generic.movementSpeed",Base:0.0},{Name:"generic.knockbackResistance",Base:1.0}],Tags:["P8CZombie"]}

effect clear @a[tag=!WrongAnswer] resistance
effect give @a[tag=WrongAnswer] resistance 3 255 true

kill @e[tag=P8CZombie,nbt={HurtTime:10s}]

execute if entity @e[scores={Incorrect_P8C=80..}] unless entity @e[tag=P8CZombie] run teleport @a[tag=WrongAnswer] 938 67 1000 180 0





# END SAFEGUARD
execute align x align y align z unless entity @a[x=788,y=33,z=879,dx=24,dy=45,dz=24] run scoreboard objectives add P8C_End dummy
execute align x align y align z if entity @a[x=788,y=33,z=879,dx=24,dy=45,dz=24] run scoreboard objectives remove P8C_End
execute align x align y align z unless entity @a[x=788,y=33,z=879,dx=24,dy=45,dz=24] run tag @a remove WrongAnswer
clear @a[tag=!WrongAnswer]

scoreboard players add @e[tag=MainTriviaAEC] P8C_End 1

execute if entity @e[scores={P8C_End=25..}] run clear @a
execute if entity @e[scores={P8C_End=25..}] run scoreboard objectives remove P8CWin
execute if entity @e[scores={P8C_End=25..}] run scoreboard objectives remove Incorrect_P8C
execute if entity @e[scores={P8C_End=25..}] run setblock ~ ~-1 ~ clay
execute if entity @e[scores={P8C_End=25..}] run scoreboard objectives remove P8C_End