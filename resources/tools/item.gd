@tool
extends Node3D

@export var itemTexture: Texture
@export var width: int
@export var height: int

@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _ready():
	item_sprite.texture = itemTexture
	
	# Set collision_shape
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height)
	collision_shape_2d.set_shape(shape)
