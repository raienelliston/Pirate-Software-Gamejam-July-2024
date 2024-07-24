class_name MenuSpawner
extends Node

@export var menu: PackedScene

var new_menu: Node

func spawn_menu(parent: Node):
	new_menu = menu.instantiate()
	parent.get_parent().add_child(new_menu)
	
func close_menu():
	new_menu.queue_free()
	new_menu = null
