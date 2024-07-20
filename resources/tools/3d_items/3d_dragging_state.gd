class_name ThreeDDraggingState
extends State

signal Dropped

@export var item: Node

func _ready():
	set_physics_process(false)

func _enter_state():
	set_physics_process(true)

func _exit_state():
	set_physics_process(false)
	
func _physics_process(delta):
	
	# Add logic for sticking the item to the cursor
	
	if not Input.get_action_strength("primary_action"):
		Dropped.emit()
