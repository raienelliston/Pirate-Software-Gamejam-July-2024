class_name ActiveState
extends State

signal Used

func _ready():
	set_physics_process(false)
	
func _enter_state():
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)
	
func _physics_process(delta):
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		Used.emit()
