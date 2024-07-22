extends Resource

const TARGET_SPRAY = preload("res://assets/tools/target_spray.png")

func createThrowTargeter(from: Vector3, to: Vector3) -> Node:
	
	var parentNode = Node3D.new()
	
	# Create target decal
	var target_decal = Decal.new()
	target_decal.texture_albedo = TARGET_SPRAY
	target_decal.cull_mask.set_cull_mask(6)
	parentNode.add_child(target_decal)
	
	return parentNode
