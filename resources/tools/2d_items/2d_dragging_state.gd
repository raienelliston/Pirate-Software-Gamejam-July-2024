class_name TwoDDraggingState
extends State

signal DropStarted

@onready var sprite_2d = $"../../Sprite2D"
@export var animationPlayer: AnimationPlayer

func _ready():
	print("2d dragging")
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)

func _exit_state():
	set_physics_process(false)
	
func _physics_process(delta):
	# Add logic for sticking the item to the cursor
	
	sprite_2d.global_position = lerp(sprite_2d.global_position, get_viewport().get_mouse_position(), 25 * delta)
	
	if not Input.is_action_pressed("primary_action"):
		DropStarted.emit()

	if animationPlayer.has_animation("dragging"):
		animationPlayer.play("dragging")
