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
	
func _physics_process(delta):
	
	var ray_length = 10000
	
	var mouse_pos = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_pos)
	var to = from + project_local_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.create(from, to)
	ray_query.collision_mask = 4
	ray_query.collide_with_bodies = true
	var raycast_result = space.intersect_ray(ray_query)
	if not raycast_result == {}:
		print(raycast_result["position"])
		GlobalSignals.emit_signal("MouseCoordinates", raycast_result["position"])
