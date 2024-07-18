class_name Item
extends Resource

enum Type {POTION, MATERIAL, HERBS}

@export_group("Item Attributes")
@export var id: String
@export var description: String
@export var type: Type
#@export var texture: 
