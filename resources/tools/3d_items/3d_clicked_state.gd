class_name ThreeDClickedState
extends State

signal Used

@export var animationPlayer: AnimationPlayer

func _enter_state():
	print("3d clicked state")
	if animationPlayer.has_animation("clicked"):
		animationPlayer.play("clicked")
	
	Used.emit()
