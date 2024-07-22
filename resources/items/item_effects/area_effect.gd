extends ItemEffect

enum AreaOrigin {ORIGIN, SIDECENTER, BOTTOMCENTER, EDGE}
enum Shape {SPHERE, RECTANGLE}

@export_group("Attributes")
@export var effects: Array[ItemEffect]
@export var length: float

@export_group("Size and Location")
@export var x_axis: int
@export var y_axis: int
@export var z_axis: int
@export var area_origin: AreaOrigin
@export var direction: float

func trigger_effect(node):
	pass
