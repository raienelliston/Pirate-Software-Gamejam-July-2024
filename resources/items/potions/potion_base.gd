extends Node2D

@export var base_class: Resource

@onready var label = $RigidBody2D/Label

var selected = false

func _ready() -> void:
	label.text = str(base_class["potion_color"])
	pass

func _process(delta):
	if selected:
		followMouse()
		
func followMouse():
	position = get_global_mouse_position()
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("secondary_action"):
			selected = true
		else:
			selected = false
