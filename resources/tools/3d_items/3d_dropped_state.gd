class_name ThreeDDroppedState
extends State

signal IdleStarted

@export var sprite: Sprite3D
@export var animationPlayer: AnimationPlayer

func _enter_state() -> void:
	sprite.visible = true
	if animationPlayer.has_animation("dropped"):
		animationPlayer.play("dropped")
	
	IdleStarted.emit()
