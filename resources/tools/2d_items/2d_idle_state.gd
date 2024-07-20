class_name TwoDIdleState
extends State

signal ClickStarted

@export var detection_area: Area2D
@export var animationPlayer: AnimationPlayer

func _ready():
	print("2d idle")
	pass
	

func onClick(vector: Vector3):
	pass

func _physics_process(delta):
	pass
	
	if animationPlayer.has_animation("idle"):
		animationPlayer.play("idle")
