class_name ActiveState
extends State

signal Used

var item_resource: Item
var preview_node: Node

@onready var item = $"../.."
@onready var sprite_2d = $"../../RigidBody2D/Sprite2D"

func _ready():
	item_resource = item.item_resource
	set_physics_process(false)
	
func _enter_state():
	print("item ready")
	set_physics_process(true)
	var pos = CharacterCamera.get_mouse_position()
	if pos:
		preview_node = item_resource.previewItem(item, pos)
	item.add_child(preview_node)
	
	item.visible = false
	
func _exit_state():
	set_physics_process(false)
	
	item.visible = true
	
func _physics_process(delta):
	var pos = CharacterCamera.get_mouse_position()
	if pos:
		item_resource.updatePreview(item, pos, preview_node)
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		Used.emit()
