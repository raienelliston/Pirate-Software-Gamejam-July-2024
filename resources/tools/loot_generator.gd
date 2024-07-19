class_name LootGenerator
extends Resource

var rng = RandomNumberGenerator.new()

var item = Item.new()

func generate_tier_1(drop_chance: float) -> Array [Item]:
	var possible_items: Array[String] = []
	if rng.randf_range(0, 1) >= drop_chance:
		var chance_number = rng.randf_range(0, 1)
		for n in range(item.item_data):
			chance_number -= item.item_data[n]["Tier 1 Percent"]
			if chance_number < 0:
				return item.item_data[n]["Name"]
	return []
