shader_type canvas_item;

uniform vec3 color: source_color = vec3(1);
uniform float progress: hint_range(0.0, 1.0, 0.1) = 0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float current_a = texture(TEXTURE, UV).a;
	COLOR = mix(texture(TEXTURE, UV), vec4(color, current_a), progress);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
