extends Control

@onready var settings_menu = $"Settings Menu"

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/home/home_scene.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_packed(settings_menu)

func _on_exit_button_pressed():
	get_tree().quit()
