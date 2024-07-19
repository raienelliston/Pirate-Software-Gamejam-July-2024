@tool
extends Node3D

enum ItemStates {}

@export var item_resource: Resource
@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _ready():
	item_sprite.texture = item_resource["texture"]
	
	var width = item_sprite.texture.get_width()
	var height = item_sprite.texture.get_height()
	# Set collision_shape
	print(width, height)
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height)
	collision_shape_2d.set_shape(shape)

func _process(delta):
	pass

func changeTo2D():
	pass
	
func changeTo3D():
	pass
