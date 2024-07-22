class_name Camera
extends Camera3D

var ray_length: int

@onready var camera_3d = $"."
@onready var ray_cast_3d = $RayCast3D

func _ready():
	pass
	
func get_camera_position(pos: Vector3):
	return camera_3d.unproject_position(pos)
	
func get_mouse_position():
	return (camera_3d.global_transform)
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 10000
	var from = project_ray_origin(mouse_pos)
	var to = from + project_local_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.create(from, to)
	ray_query.collision_mask = 1
	ray_query.collide_with_bodies = true
	var raycast_result = space.intersect_ray(ray_query)
	if raycast_result == {}:
		return
	print( raycast_result["position"])
