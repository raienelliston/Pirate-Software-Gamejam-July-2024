class_name InitialDraggingState
extends State

signal DropStarted

@export var sprite_2d: Sprite2D

var mouse_offset: Vector2

func _ready():
	set_physics_process(false)
	
func _enter_state():
	print("2d inital drag")
	mouse_offset = sprite_2d.get_global_mouse_position() - sprite_2d.global_position
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	print("asdf")
	var tween = sprite_2d.get_tree().create_tween()
	tween.tween_property(self, "position", sprite_2d.get_global_mouse_position() - mouse_offset, 1 * delta)
	
	if not Input.is_action_pressed("primary_action"):
		DropStarted.emit()
