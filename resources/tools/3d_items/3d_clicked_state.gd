class_name ThreeDClickedState
extends State

@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	if animationPlayer.has_animation("clicked"):
		animationPlayer.play("clicked")
