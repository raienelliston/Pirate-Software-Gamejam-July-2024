extends CharacterBody3D

@export var resource: Resource

var target: Node

signal spawned_item(item, position)

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
	for item in enemy_resource.death_loot():
		print(item)
		spawned_item.emit(item, global_position)
		#var loot_item = item.instantiate()
		#loot_item.global_position = global_position
		#get_tree().get_root().add_child(loot_item)
	queue_free()
