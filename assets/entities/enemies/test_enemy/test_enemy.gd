extends CharacterBody3D

@export var resource: Resource

var target: Node

func _ready():
	add_to_group("enemies")

func _on_player_detector_body_entered(body):
	if body.is_in_group("player_character"):
		target = body
		print("found")

func _process(delta):
	velocity = Vector3.ZERO
	if not target == null:
		pass
	move_and_slide()

func death():
	pass
