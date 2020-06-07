scoreboard objectives add Number dummy
execute unless score #Load Number matches 1 run function main:load_once

tellraw @a ["ハープクロスボウ： ロードしました"]
