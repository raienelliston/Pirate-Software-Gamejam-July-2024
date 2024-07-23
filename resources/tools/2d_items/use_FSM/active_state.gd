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
	GlobalSignals.connect("MouseCoordinates", onMove)
	
	item.visible = false
	
func _exit_state():
	set_physics_process(false)
	GlobalSignals.disconnect("MouseCoordinates", onMove)
	item.visible = true
	preview_node = null
	
func _physics_process(delta):
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		Used.emit()
		
func onMove(pos: Vector3):
	if pos:
		if preview_node:
			item_resource.updatePreview(item, pos, preview_node)
		else:
			preview_node = item_resource.previewItem(item, pos)
