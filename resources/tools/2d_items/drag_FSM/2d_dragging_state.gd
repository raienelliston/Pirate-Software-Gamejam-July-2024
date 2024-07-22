class_name TwoDDraggingState
extends State

signal DropStarted

@onready var rigid_body_2d = $"../../RigidBody2D"
@export var animationPlayer: AnimationPlayer

var mouse_offset: Vector2

func _ready():
	set_physics_process(false)

func _enter_state():
	print("2d dragging")
	mouse_offset = rigid_body_2d.get_global_mouse_position() - rigid_body_2d.global_position
	set_physics_process(true)

func _exit_state():
	set_physics_process(false)
	
func _physics_process(delta):
	# Add logic for sticking the item to the cursor
	
	rigid_body_2d.position = rigid_body_2d.get_global_mouse_position()
	
	# Triggers state end on letting go of left click
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		DropStarted.emit()

	if animationPlayer.has_animation("dragging"):
		animationPlayer.play("dragging")
