extends CharacterBody3D

@export var speed: int = 10

var target: Node

func _on_player_detector_body_entered(body):
	if body.is_in_group("player_character"):
		target = body
		print("found")

func _process(delta):
	velocity = Vector3.ZERO
	if not target == null:
		print(target.global_transform_origin())

func death():
	pass
