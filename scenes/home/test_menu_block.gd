extends StaticBody3D

@onready var menu_spawner = $MenuSpawner


func _on_input_event(camera, event, position, normal, shape_idx):
	menu_spawner.spawn_menu(self)
