extends CharacterBody3D

@export var speed := 10.0
@export var jump_height := 10.0
@export var time_to_apex := 0.7
@export var time_to_fall := 0.4
@export var gravity := 50.0

@onready var camera_3d = $Camera3D

func _ready() -> void:
	add_to_group("player_character")
	
func _physics_process(delta: float) -> void:
	
	var ray_length = 10000
	
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera_3d.project_ray_origin(mouse_pos)
	var to = from + camera_3d.project_local_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.create(from, to)
	ray_query.collision_mask = 1
	ray_query.collide_with_bodies = true
	ray_query.collide_with_areas = false
	var raycast_result = space.intersect_ray(ray_query)
	if not raycast_result == {}:
		print(global_position + camera_3d["position"] - raycast_result["position"])
		GlobalSignals.emit_signal("MouseCoordinates", global_position + camera_3d["position"] - raycast_result["position"])
	
	print(global_position)
	
	var veloctiy = Vector3.ZERO
	
	velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed
	velocity.z = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * speed
	
	move_and_slide()
