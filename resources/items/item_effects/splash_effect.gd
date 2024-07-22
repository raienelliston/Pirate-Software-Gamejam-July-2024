extends ItemEffect

enum Shape {CIRCLE, SQUARE, RECTANGLE}

@export var effect: Array[ItemEffect]
@export var primary_length: float
@export var secondary_length: float
@export var shape: Shape

func trigger_effect(node):
	pass
