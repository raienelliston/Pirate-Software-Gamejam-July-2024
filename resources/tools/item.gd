@tool
extends Node3D

@export var itemSprite: Texture

@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D.shape.rectangle

func _ready():
	pass
