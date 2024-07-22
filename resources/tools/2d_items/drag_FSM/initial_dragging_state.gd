class_name InitialDraggingState
extends State

signal DropStarted

@export var sprite_2d: Sprite2D

var mouse_offset: Vector2

@onready var rigid_body_2d = $"../../RigidBody2D"

func _ready():
	set_physics_process(false)
	
func _enter_state():
	
	var texture_path = sprite_2d.texture.resource_path
	var texture_img = Image.new()
	texture_img.load(texture_path)
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(texture_img)
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, sprite_2d.texture.get_size()), 5)
	
	for poly in polys:
		print(poly)
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		rigid_body_2d.add_child(collision_polygon)
		
		collision_polygon.translate(Vector2.ZERO - (sprite_2d.texture.get_size() / 2))
	
	print("2d inital drag")
	mouse_offset = rigid_body_2d.get_global_mouse_position()
	
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	rigid_body_2d.position = rigid_body_2d.get_global_mouse_position()
	
	if not Input.is_action_pressed("primary_action"):
		set_physics_process(false)
		DropStarted.emit()
