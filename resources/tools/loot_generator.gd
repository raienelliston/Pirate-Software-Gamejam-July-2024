class_name LootGenerator
extends Item

var rng = RandomNumberGenerator.new()

func generate_tier_1(drop_chance: float):
	var loot_items = []
	var possible_items: Array[String] = []
	#if rng.randf_range(0, 1) >= drop_chance:
	if true:
		var chance_number = rng.randf_range(0, 1)
		print("asdlfkj")
		for n in range(len(item_data)):
			chance_number -= float(item_data[n]["Tier 1 Percent"])
			if chance_number < 0:
				loot_items.append(item_data[n]["Name"])
	return loot_items
	
