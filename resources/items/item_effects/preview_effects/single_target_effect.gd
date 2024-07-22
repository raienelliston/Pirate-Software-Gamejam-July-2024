extends ItemEffect

@export var texture: Texture = preload("res://assets/tools/target_spray.png")

func preview_effect(sourceNode: Node, targetPosition: Vector3):
	var newNode = Node3D.new()
	
	# Create target decal
	var target_decal = Decal.new()
	target_decal.texture_albedo = texture
	target_decal.cull_mask.set_cull_mask(6)
	newNode.add_child(target_decal)
	target_decal.translate(targetPosition)
	
	return newNode
	
func update_preview_effect(sourceNode: Node, targetPosition: Vector3, previewNode: Node):
	previewNode.translate(targetPosition)
