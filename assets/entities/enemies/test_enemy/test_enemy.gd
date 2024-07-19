extends CharacterBody3D


func _on_player_detector_body_entered(body):
	if body.is_in_group("player_character"):
		print("found")
