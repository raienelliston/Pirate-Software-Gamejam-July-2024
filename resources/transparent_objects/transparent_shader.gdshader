shader_type spatial;

render_mode blend_mix, cull_back, depth_draw_opaque, unshaded;

uniform vec3 albedo = vec3(0.9, 0.9, 0.9);
uniform float alpha_value : hint_range(0.0, 1.0) = 0.5;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = albedo;
	ALPHA = alpha_value;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
