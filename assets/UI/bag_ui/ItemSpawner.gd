class_name BagItemSpawner
extends Node2D

@export var item : PackedScene

const HEALING_POTION = preload("res://resources/items/potions/potion_types/healing_potion.tres")
const SWIFTNESS_POTION = preload("res://resources/items/potions/potion_types/swiftness_potion.tres")

var pool: Array[Resource] = [HEALING_POTION, SWIFTNESS_POTION]

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("primary_action"):
		#spawn_item(pool[rng.randi_range(0, 1)])
		pass
	
func spawn_item(item_name: Resource) -> void:
	var instance = item.instantiate()
	if instance.has_method("set"):
		instance.set("base_class", item)

	add_child(instance)
