class_name PlayerCamera
extends Camera3D

var ray_length: int
@export var mouse_position: Vector3

@onready var camera_3d = $"."
@onready var ray_cast_3d = $RayCast3D
@onready var character_body_3d = $".."

func _ready():
	pass
	
func get_camera_position(pos: Vector3):
	return camera_3d.unproject_position(pos)
