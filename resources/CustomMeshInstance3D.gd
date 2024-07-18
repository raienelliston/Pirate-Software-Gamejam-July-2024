class_name CustomMeshInstance3D

extends MeshInstance3D

var overlay_materials : Array = []

func _ready():
	_update_materials()

func add_overlay_material(material : Material):
	if material not in overlay_materials:
		overlay_materials.append(material)
		_update_materials()

func remove_overlay_material(material : Material):
	if material in overlay_materials:
		overlay_materials.erase(material)
		_update_materials()
		
func _update_materials():
	var combined_material : ShaderMaterial = get_surface_override_material(0) as ShaderMaterial
	if not combined_material:
		combined_material = ShaderMaterial.new()
	
	var base_color = combined_material.get_shader_parameter("albedo_color")
	var alpha_value = combined_material.get_shader_parameter("alpha_value")
	
	if base_color == null:
		base_color = Color(1.0, 1.0, 1.0, 1.0)
		
	if alpha_value == null:
		alpha_value = 1.0
	
	for overlay in overlay_materials:
		var overlay_color = overlay.get_shader_parameter("albedo_color")
		var overlay_alpha = overlay.get_shader_parameter("alpha_value")
		print(overlay_alpha)
		if overlay_color == null:
			overlay_color = Color(1.0, 1.0, 1.0, 1.0)
			
		if overlay_alpha == null:
			overlay_alpha = 1.0
			
		base_color = base_color.lerp(overlay_color, overlay_alpha)
		alpha_value = max(alpha_value, overlay_alpha)

	print(base_color, alpha_value)
	combined_material.set_shader_parameter("albedo_color", base_color)
	combined_material.set_shader_parameter("alpha_value", alpha_value)
