class_name LootGenerator
extends Item

var rng = RandomNumberGenerator.new()

func generate_tier_1(drop_chance: float) -> Array [Item]:
	#var possible_items: Array[String] = []
	#if rng.randf_range(0, 1) >= drop_chance:
		#var chance_number = rng.randf_range(0, 1)
		#for n in range(item_data):
			#chance_number -= item_data[n]["Tier 1 Percent"]
			#if chance_number < 0:
				#return item_data[n]["Name"]
	#return []
	
	return[item_data[0]["Name"]]
