class_name ThreeDIdleState
extends State

signal ClickStarted

@export var detection_area: Area3D
@export var animationPlayer: AnimationPlayer

var active: bool

func _enter_state():
	active = true

func _exit_state():
	active = false

func _physics_process(delta):
	if animationPlayer.has_animation("idle"):
		animationPlayer.play("idle")


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if active:
		if Input.is_action_just_pressed("primary_action"):
			ClickStarted.emit()
