@tool
extends Node2D

@export var base_class: Resource

func _ready() -> void:
	add_child(base_class.base_sprite)
