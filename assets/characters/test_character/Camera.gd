extends Camera3D

signal PrimaryClick(position: Vector3)

var ray_length: int

@onready var camera_3d = $"."
@onready var ray_cast_3d = $RayCast3D

func _ready():
	pass
	
func _input(event):
	
	
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#var origin = ray_cast_3d.global_transform.origin
		#var collision_point = ray_cast_3d.get_collision_point()
		#var distance = origin.distance_to(collision_point)
		#
		#var from = camera_3d.project_ray_origin(event.position)
		#var to = from + camera_3d.project_ray_normal(event.position) * distance
		#print(to)
		#GlobalSignals.emitPrimaryClick(to)
		
		var origin = ray_cast_3d.global_transform.origin
		var collision_point = ray_cast_3d.get_collision_point()
		var distance = origin.distance_to(collision_point)
