extends CharacterBody3D

@export var speed := 40.0
@export var jump_height := 10.0
@export var time_to_apex := 0.7
@export var time_to_fall := 0.4
@export var gravity := 50.0
@export var camera_rotation_speed := 50.0

var current_rotation: float

@onready var camera_3d = $CameraOrigin/Camera3D
@onready var camera_pivot = $CameraOrigin

func _ready() -> void:
	add_to_group("player_character")
	camera_pivot
	
func _physics_process(delta: float) -> void:
	
	current_rotation = self.rotation.y
	
	var ray_length = 1000
	
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
		Global.emit_signal("MouseCoordinates", raycast_result["position"])
	
	var veloctiy = Vector3.ZERO
	
	velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed * abs(cos(current_rotation))
	velocity.z = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * speed * abs(cos(current_rotation))
	
	if Global.can_camera_rotate:
		rotate_y(deg_to_rad((Input.get_action_strength("camera_left") - Input.get_action_strength("camera_right")) * camera_rotation_speed * delta))
	
	
	
	move_and_slide()
