extends ItemEffect

@export var speed_multiplier: float
@export var duration: float
@export var temporary: bool = true

func trigger_effect(node):
	node.speed *= speed_multiplier
	if temporary:
		await node.get_tree().create_timer(duration)
		node.speed *= (speed_multiplier / 1)
