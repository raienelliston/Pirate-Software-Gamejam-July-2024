extends Control

@onready var settings_menu = $"Settings Menu"

func _ready():
	Global.pause()
	InputHandler.add_pressed_input_event("pause", [], unpause)

func unpause():
	InputHandler.remove_pressed_input_event("pause", [], unpause)
	Global.unpause()
	queue_free()

func _on_resume_button_pressed():
	unpause()

func _on_settings_button_pressed():
	InputHandler.remove_pressed_input_event("pause", [], unpause)
	get_tree().change_scene_to_packed(settings_menu)

func _on_exit_button_pressed():
	InputHandler.remove_pressed_input_event("pause", [], unpause)
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
