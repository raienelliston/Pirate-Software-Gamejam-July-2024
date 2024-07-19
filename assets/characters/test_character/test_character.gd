extends CharacterBody3D

@export var speed := 10.0
@export var jump_height := 10.0
@export var time_to_apex := 0.7
@export var time_to_fall := 0.4
@export var gravity := 50.0

func _ready() -> void:
	add_to_group("player_character")
	
func _physics_process(delta: float) -> void:
	var veloctiy = Vector3.ZERO
	
	velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed
	velocity.z = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * speed
	
	move_and_slide()
