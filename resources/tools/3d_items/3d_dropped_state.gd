class_name ThreeDDroppedState
extends State

signal IdleStarted

@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	if animationPlayer.has_animation("dropped"):
		animationPlayer.play("dropped")
	
	IdleStarted.emit()
