class_name InactiveState
extends State

@export var animationPlayer: AnimationPlayer

@onready var rigid_body_2d = $"../../RigidBody2D"

func _ready():
	pass
	
func _enter_state():
	print("item not ready")
	rigid_body_2d.gravity_scale = 1
	
func _exit_state():
	rigid_body_2d.mass = 0
