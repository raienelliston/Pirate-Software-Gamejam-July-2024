extends ItemEffect

@export var attribute: int
@export var damage_amount: int
@export var interval_amount: float
@export var interval_length: float

func trigger_effect(sourceNode, targetNode):
	targetNode.resource.take_damage(damage_amount)
	for i in interval_amount - 1:
		await targetNode.get_tree().create_timer(interval_length)
		targetNode.resource.take_damage(damage_amount)
