extends Node2D

@export var base_class: Resource

@onready var label = $RigidBody2D/Label

func _ready() -> void:
	label.text = base_class.potion_color
