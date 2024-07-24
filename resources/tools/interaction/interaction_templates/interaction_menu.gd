class_name InteractionMenu
extends Node

@export var menu: PackedScene
@export var obaque_background: bool = false
@export var pasue_world: bool = true

func trigger():
	if pasue_world:
		Global.pause()
	
	var new_menu = menu.instantiate()
	get_parent().get_parent().add_child(new_menu)
