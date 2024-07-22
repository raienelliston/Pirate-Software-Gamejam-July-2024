class_name ActiveState
extends State

signal Used

var item_resource: Item

@onready var item = $"../.."

func _ready():
	item_resource = item.item_resource
	set_physics_process(false)
	
func _enter_state():
	print("item ready")
	set_physics_process(true)
	#item_resource.previewItem(item)
	
func _exit_state():
	set_physics_process(false)
	
func _physics_process(delta):
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		Used.emit()
