class_name ThreeDDroppedState
extends State

@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	if animationPlayer.has_animation("dropped"):
		animationPlayer.play("dropped")
	
	
