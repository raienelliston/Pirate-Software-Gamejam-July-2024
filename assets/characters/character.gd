extends CharacterBody3D

@export var speed := 40.0
@export var jump_height := 10.0
@export var time_to_apex := 0.7
@export var time_to_fall := 0.4
@export var gravity := 50.0

@export_group("Camera Properites")
@export var camera_rotation_speed := 0.5
@export var max_x_rotation := 50.0
@export var min_x_rotation := -55.0

var current_rotation: float
var ray_length = 1000
var camera_rotate = false

var x_rotation: float = 0
var y_rotation: float = 0

const PAUSE_MENU = preload("res://scenes/menus/pause_menu.tscn")

@onready var camera_3d = $CameraOrigin/Camera3D
@onready var camera_pivot = $CameraOrigin
@onready var camera_joint = $CameraOrigin/CameraJoint

func _ready() -> void:
	add_to_group("player_character")
	Global.connect("ToggledCameraRotation", allow_camera_rotation)
	Global.player_node_id.emit(get_instance_id())
	
	
func allow_camera_rotation(toggle) -> void:
	print("camera")
	if toggle:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		camera_rotate = true
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		camera_rotate = false

func _unhandled_input(event):
	
	if event.is_action_pressed("pause") and not Global.paused:
		var menu = PAUSE_MENU.instantiate()
		self.add_child(menu)
		get_viewport().set_input_as_handled()
	
	if not Global.paused:
		if event is InputEventMouseMotion:
			if not camera_rotate:
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
				pass
			# Camera Rotation
			else:
				var rotate_x_rads = clamp(deg_to_rad(-event.relative.y * camera_rotation_speed), deg_to_rad(min_x_rotation) - x_rotation, deg_to_rad(max_x_rotation) - x_rotation)
				camera_joint.rotate_x(rotate_x_rads)
				x_rotation += rotate_x_rads
				var rotate_y_rads = deg_to_rad(0 - event.relative.x * camera_rotation_speed)
				camera_pivot.rotate_y(rotate_y_rads)
				y_rotation += rotate_y_rads
				if y_rotation > 360:
					y_rotation -= 360
		
		# Key based camera rotation
		if camera_rotate:
			rotate_y(deg_to_rad((Input.get_action_strength("camera_left") - Input.get_action_strength("camera_right")) * camera_rotation_speed))
			
		if event.is_action_pressed("free_camera"):
			pass
	
func _physics_process(delta: float) -> void:
	
	current_rotation = self.rotation.y
	var veloctiy = Vector3.ZERO
	
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Y-Plane movment
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		print(direction)
		var angle = atan2(direction.z, direction.x) - atan2(-1, 0)
		camera_pivot.look_at(angle)
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
