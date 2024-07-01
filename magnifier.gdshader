shader_type canvas_item;

uniform float scale_factor = 2.0;
uniform sampler2D screen_tex : hint_screen_texture, filter_nearest;

varying vec2 center_uv;

void vertex()
{
	center_uv = (SCREEN_MATRIX * CANVAS_MATRIX * MODEL_MATRIX * vec4(0.5, 0.5, 0, 1)).xy;
	center_uv = (center_uv + 1.0) / 2.0;
}

void fragment() {
	vec2 uv_difference = SCREEN_UV - center_uv;
	vec2 modified_uv = uv_difference / scale_factor + center_uv;
	
	vec4 sampled_color = texture(screen_tex, modified_uv);
	COLOR.rgb = sampled_color.rgb;
}