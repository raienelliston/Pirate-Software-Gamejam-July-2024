class_name BagItemSpawner
extends Node2D

@export var item : Resource

func _ready():
	pass
	
func spawn_item(item_name: String) -> void:
	var instance = item.new()
	if instance.has_method("set"):
		instance.set("base_class", item)
