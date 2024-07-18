shader_type spatial;

render_mode blend_mix, cull_back, depth_draw_opaque, unshaded;

uniform float alpha_value : hint_range(0.0, 1.0, 0.1);
uniform vec4 albedo_color = vec4(1.0, 1.0, 1.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = vec3(0.1, 0.3, 0.8);
	ALPHA = 0.5;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
