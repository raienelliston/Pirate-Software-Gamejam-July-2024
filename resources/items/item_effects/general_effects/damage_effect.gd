extends ItemEffect

@export var attribute: int
@export var damage_amount: int
@export var interval_amount: float
@export var interval_length: float

func trigger_effect(node):
	node.resource.take_damage(damage_amount)
	for i in interval_amount - 1:
		await node.get_tree().create_timer(interval_length)
		node.resource.take_damage(damage_amount)
