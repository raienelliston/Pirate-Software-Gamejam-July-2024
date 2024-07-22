extends ItemEffect

enum AreaOrigin {ORIGIN, SIDECENTER, BOTTOMCENTER, EDGE}
enum Shape {SPHERE=1, RECTANGLE=2}

@export_group("Attributes")
@export var effects: Array[ItemEffect]
@export var length: float

@export_group("Size and Location")
@export var shape: Shape
@export var radius: float
@export var x_axis: int
@export var y_axis: int
@export var z_axis: int
@export var area_origin: AreaOrigin
@export var direction: float

func trigger_effect(node):
	# Collision Shape
	var collision_shape_3d = CollisionShape3D.new()
	match shape:
		1:
			collision_shape_3d.shape = SphereShape3D.new()
			collision_shape_3d.shape.radius = radius
		2:
			collision_shape_3d.shape = BoxShape3D.new()
			collision_shape_3d.shape.set_size(x_axis, y_axis, z_axis)
	
	var area_3d = Area3D.new()
	area_3d.add_child(collision_shape_3d)
	
