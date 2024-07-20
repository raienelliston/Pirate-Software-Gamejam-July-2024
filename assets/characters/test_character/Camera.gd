class_name Camera
extends Camera3D

var ray_length: int

@onready var camera_3d = $"."
@onready var ray_cast_3d = $RayCast3D

func _ready():
	pass
	
func get_camera_position(pos: Vector3):
	return camera_3d.unproject_position(pos)
