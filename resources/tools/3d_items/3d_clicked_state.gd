class_name ThreeDClickedState
extends State

signal DragStarted

@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	if animationPlayer.has_animation("clicked"):
		animationPlayer.play("clicked")
	
	DragStarted.emit()
