class_name TwoDDroppedState
extends State

signal IdleStarted

@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	print("2d dropped")
	if animationPlayer.has_animation("dropped"):
		animationPlayer.play("dropped")
	
	IdleStarted.emit()
