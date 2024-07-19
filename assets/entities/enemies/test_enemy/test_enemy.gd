extends CharacterBody3D

@export var resource: Resource

var target: Node

@onready var enemy_resource = resource.duplicate()
@onready var health = enemy_resource["starting_health"]

func _ready():
	add_to_group("enemies")


func _on_player_detector_body_entered(body):
	if body.is_in_group("player_character"):
		print("found")
		take_damage(1)
	if health <= 0:
		on_death()

func _process(delta):
	velocity = Vector3.ZERO
	if not target == null:
		pass
	move_and_slide()

func take_damage(amount: int) -> void:
	health -= amount

func on_death():
	for item in enemy_resource.death_loop():
		pass
	queue_free()
