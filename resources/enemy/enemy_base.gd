class_name Enemy
extends LootGenerator

@export_group("Attributes")
@export var starting_health: int = 10
@export var speed: int = 10
@export var enemy_tier: int = 1

@export_group("Lootpool")
@export var avg_loot_amount: float = 1
@export var loot_tier: int = 1
@export var specific_loot: Array[Item]

var health = starting_health

func _process(delta):
	if health <= 0:
		death()

func spawn():
	pass

func take_damage(amount: int):
	pass

func death():
	pass

func death_loot() -> Array[Item]:
	var loot = generate_tier_1(avg_loot_amount)
	print(loot)
	return loot
