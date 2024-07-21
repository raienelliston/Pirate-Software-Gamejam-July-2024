extends Node

enum state {opened, closed, undefined}

@export var animationSpeed: float = 5
@export var starting_state: state = state.closed
@onready var item_detector = $MenuBody/ItemDetector

var current_state: state

@onready var animation_tree = $MenuBody/AnimationTree
@onready var menu_body = $MenuBody

func _ready():
	item_detector.add_to_group("bag")
	animation_tree.set("parameters/blend_position", 1)
	current_state = state.closed
	
func _physics_process(delta):
	var blend = animation_tree.get("parameters/blend_position")
	
	if current_state == state.opened:
		animation_tree.set("parameters/blend_position", clamp(blend + (animationSpeed * delta), -1, 1))
	else:
		animation_tree.set("parameters/blend_position", clamp(blend - (animationSpeed * delta), -1, 1))
	
func _on_menu_body_mouse_entered():
	current_state = state.opened

func _on_menu_body_mouse_exited():
	current_state = state.closed

func _on_item_detector_body_entered(body):
	print("detect")
	if body.has_method("makePermanent"):
		body.makePermanent()
