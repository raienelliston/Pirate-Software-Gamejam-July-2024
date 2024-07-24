extends Control

func _ready():
	Global.pause()

func _input(event):
	if event.is_action_pressed("pause"):
		Global.unpause()
		queue_free()

func _on_resume_button_pressed():
	Global.unpause()
	queue_free()


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
