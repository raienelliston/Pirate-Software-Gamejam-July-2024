class_name LootGenerator
extends Resource

const LOOT_TABLE = preload("res://resources/tools/loot_table.json")
var rng = RandomNumberGenerator.new()

func generate_tier_1(drop_chance: float) -> Array [Item]:
	var possible_items: Array[String] = []
	if rng.randf_range(0, 1) >= drop_chance:
		var chance_number = rng.randf_range(0, 1)
		for n in range(LOOT_TABLE):
			chance_number -= n["Tier 1 Percent"]
			if chance_number < 0:
				return n["Name"]
	return []
