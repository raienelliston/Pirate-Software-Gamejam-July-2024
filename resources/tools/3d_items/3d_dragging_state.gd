class_name ThreeDDraggingState
extends State

signal Dropped

@export var item: Node

func _enter_state():
	pass
	
func _physics_process(delta):
	
	# Add logic for sticking the item to the cursor
	
	if not Input.get_action_strength("primary_action"):
		Dropped.emit()
