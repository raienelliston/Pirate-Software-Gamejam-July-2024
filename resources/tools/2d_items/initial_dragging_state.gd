class_name InitialDraggingState
extends State

signal DropStarted

func _ready():
	set_physics_process(false)
	
func _enter_state():
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	pass
