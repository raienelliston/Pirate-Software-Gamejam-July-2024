@tool
class_name Item
extends Resource

enum Type {POTION, MATERIAL, HERBS}

@export_group("Appearance")
@export var texture: Texture

@export_group("Item Attributes")
@export var name: String
@export var description: String
@export var item_effects: Array[ItemEffect]
@export var tier: int

var item_data: Array

func _init():
	var item_table_file = FileAccess.open("res://resources/items/item_table.json", FileAccess.READ)
	var item_data_json = JSON.parse_string(item_table_file.get_as_text())
	item_data = item_data_json

func useItem(node):
	for effect in item_effects:
		if effect != null and effect.has_method("trigger_effect"):
			effect.trigger_effect(self, node)
