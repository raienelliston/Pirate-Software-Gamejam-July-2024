class_name LootGenerator
extends Resource

const LOOT_TABLE = preload("res://resources/tools/loot_table.json")
var rng = RandomNumberGenerator.new()

func generate_tier_1() -> Array [Item]:
	var possible_items: Array[String] = []
	for i in LOOT_TABLE:
		
