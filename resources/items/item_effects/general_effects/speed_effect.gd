extends ItemEffect

@export var speed_multiplier: float
@export var duration: float
@export var temporary: bool = true

func trigger_effect(sourceNode, targetNode):
	targetNode.speed *= speed_multiplier
	if temporary:
		await targetNode.get_tree().create_timer(duration)
		targetNode.speed *= (speed_multiplier / 1)
