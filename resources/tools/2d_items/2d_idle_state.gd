class_name TwoDIdleState
extends State

signal ClickStarted

@export var detection_area: Area2D
@export var animationPlayer: AnimationPlayer

func _ready():
	GlobalSignals.connect("PrimaryClick", onClick)
	

func onClick(vector: Vector3):
	pass

func _physics_process(delta):
	pass
	
	if animationPlayer.has_animation("idle"):
		animationPlayer.play("idle")
