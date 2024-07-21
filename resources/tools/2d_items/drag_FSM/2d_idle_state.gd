class_name TwoDIdleState
extends State

signal ClickStarted

@export var body: RigidBody2D
@export var animationPlayer: AnimationPlayer

var active := false

func _ready():
	active = false
	set_physics_process(false)
	
func _enter_state():
	print("2d idle")
	active = true
	set_physics_process(true)

func _physics_process(delta):
	if animationPlayer.has_animation("idle"):
		animationPlayer.play("idle")

func _on_rigid_body_2d_input_event(viewport, event, shape_idx):
	print("event")
	if Input.is_action_just_pressed("primary_action"):
		ClickStarted.emit()
