extends Control

func _on_resume_button_pressed():
	Input.action_press("pause")


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
