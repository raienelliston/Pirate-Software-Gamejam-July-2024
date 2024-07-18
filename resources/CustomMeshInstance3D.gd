class_name CustomMeshInstance3D

extends MeshInstance3D

var overlay_materials : Array = []

func add_overlay_material(material : Material):
	if material not in overlay_materials:
		overlay_materials.append(material)
		_update_materials()

func remove_overlay_material(material : Material):
	if material in overlay_materials:
		overlay_materials.erase(material)
		_update_materials()
		
func _update_materials():
	var combined_material = get_surface_override_material(0)
	if combined_material:
		combined_material = combined_material.duplicate()
	else:
		combined_material = StandardMaterial3D.new()
	
	set_surface_override_material(0, combined_material)
