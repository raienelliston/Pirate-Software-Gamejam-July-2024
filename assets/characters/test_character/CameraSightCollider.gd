extends Area3D

var transparent_material : StandardMaterial3D = preload("res://resources/transparent_material.tres")

func _on_body_entered(body):
	if body.has_node("MeshInstance3D"):
		var mesh = body.get_node("MeshInstance3D")
		if mesh.has_method("add_overlay_material"):
			mesh.add_overlay_material(transparent_material)
			print("found body")

func _on_body_exited(body):
	if body.has_node("MeshInstance3D"):
		var mesh = body.get_node("MeshInstance3D")
		if mesh.has_method("remove_overlay_material"):
			mesh.remove_overlay_material(transparent_material)
